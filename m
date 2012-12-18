Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1TkwgP-0007rN-4t
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 13:54:07 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 18 Dec 2012 04:38:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,308,1355126400"; d="scan'208";a="182347958"
Received: from adamian-desktop.rb.intel.com ([10.237.105.141])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Dec 2012 04:38:15 -0800
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id 643105605BD; Tue, 18 Dec 2012 14:38:29 +0200 (EET)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org, ross.burton@intel.com,
	damien.lespiau@intel.com, dvhart@linux.intel.com, radu.moisan@intel.com,
	otavio@ossystems.com.br
Date: Tue, 18 Dec 2012 14:38:27 +0200
Message-Id: <1355834307-29583-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1355743753-12947-1-git-send-email-alexandru.damian@intel.com>
References: <1355743753-12947-1-git-send-email-alexandru.damian@intel.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH v3] init-live: default to initrd shell if image isn't found
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2012 12:54:07 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Adds "debugshell" command line parameter for live/install images.

If the init live fails to find and mount a root-fs image,
dumps to a shell after timeout so that the developer can figure
what's wrong.

Timeout defaults to 30 seconds, but it can be changed as param
argument.

Prior art in Ubuntu. Also, leaving a system stale isn't good form.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |   22 +++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index c591f0d..e8d7f70 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -45,7 +45,13 @@ read_args() {
                     console_params=$arg
                 else
                     console_params="$console_params $arg"
-                fi
+                fi ;;
+            debugshell*)
+                if [ -z "$optarg" ]; then
+                        shelltimeout=30
+                else
+                        shelltimeout=$optarg
+                fi 
         esac
     done
 }
@@ -75,6 +81,7 @@ early_setup
 read_args
 
 echo "Waiting for removable media..."
+C=0
 while true
 do
   for i in `ls /media 2>/dev/null`; do
@@ -90,6 +97,19 @@ do
   if [ "$found" = "yes" ]; then
       break;
   fi
+  # don't wait for more than $shelltimeout seconds, if it's set
+  if [ -n "$shelltimeout" ]; then
+      echo -n " " $(( $shelltimeout - $C ))
+      if [ $C -ge $shelltimeout ]; then
+           echo "..."
+	   echo "Mounted filesystems"
+           mount | grep media
+           echo "Available block devices"
+           ls /dev/sd*
+           fatal "Cannot find rootfs.img file in /media/* , dropping to a shell "
+      fi
+      C=$(( C + 1 ))
+  fi
   sleep 1
 done
 
-- 
1.7.10.4



