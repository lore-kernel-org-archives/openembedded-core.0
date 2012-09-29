Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1THwGW-0004Kw-Bt
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Sep 2012 14:35:28 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1THw42-0002xq-6W
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Sep 2012 14:22:35 +0200
Message-ID: <1348921205.4422.47.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2012 13:20:05 +0100
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: [PATCH] opkg: Don't call sync() when installing into an offline root
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
X-List-Received-Date: Sat, 29 Sep 2012 12:35:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Even when installing onto a live target system, calling sync() during
package installation is of somewhat questionable benefit.  But calling
it on the build host during rootfs construction is certainly useless and
can cause I/O to stall for several seconds on even a moderately sized
host which is clearly not desirable.

(From a patch originally by Mike Crowe.)

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 .../opkg/opkg/opkg-no-sync-offline.patch             |   18 ++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb               |    3 ++-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/opkg-no-sync-offline.patch

diff --git a/meta/recipes-devtools/opkg/opkg/opkg-no-sync-offline.patch b/meta/recipes-devtools/opkg/opkg/opkg-no-sync-offline.patch
new file mode 100644
index 0000000..b1b3453
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/opkg-no-sync-offline.patch
@@ -0,0 +1,18 @@
+When installing into an offline root, calling sync() is pointless and just 
+hurts performance.  Don't let's do that.
+
+Signed-off-by: Phil Blundell <philb@gnu.org>
+Upstream-Status: Pending
+
+--- a/libopkg/opkg_cmd.c	2011-09-08 10:53:07.000000000 +0100
++++ b/libopkg/opkg_cmd.c	2011-10-04 10:45:22.278615584 +0100
+@@ -64,7 +64,8 @@ write_status_files_if_changed(void)
+ 	  opkg_msg(INFO, "Writing status file.\n");
+ 	  opkg_conf_write_status_files();
+ 	  pkg_write_changed_filelists();
+-	  sync();
++	  if (!conf->offline_root)
++	      sync();
+      } else {
+ 	  opkg_msg(DEBUG, "Nothing to be done.\n");
+      }
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 820a224..f206cd5 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -9,6 +9,7 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
   file://0006-detect-circular-dependencies.patch \
   file://0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch \
   file://0008-select_higher_version.patch \
+  file://opkg-no-sync-offline.patch \
 "
 
 S = "${WORKDIR}/trunk"
@@ -16,4 +17,4 @@ S = "${WORKDIR}/trunk"
 SRCREV = "633"
 PV = "0.1.8+svnr${SRCPV}"
 
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
-- 
1.7.10.4





