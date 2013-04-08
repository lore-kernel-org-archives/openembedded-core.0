Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UPAvs-00017e-PN
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 14:12:21 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Apr 2013 04:55:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,431,1363158000"; d="scan'208";a="224490351"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Apr 2013 04:54:53 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Apr 2013 14:58:03 +0300
Message-Id: <1365422283-27630-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] tcf-agent: Use kill instead of killproc to stop agent
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
X-List-Received-Date: Mon, 08 Apr 2013 12:12:21 -0000

From: Ioana Grigoropol <ioanax.grigoropol@intel.com>

[Yocto #3928]

Signed-off-by: Ioana Grigoropol <ioanax.grigoropol@intel.com>
Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../tcf-agent/tcf-agent/fix_tcf-agent.init.patch   |    6 ++++--
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/fix_tcf-agent.init.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/fix_tcf-agent.init.patch
index fefaf04..8ea5b43 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/fix_tcf-agent.init.patch
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/fix_tcf-agent.init.patch
@@ -13,7 +13,7 @@ Upstream-Status: Inappropriate [poky-specific script]
  	install -c -t $(INSTALLROOT)$(INCLUDE)/tcf/services -m 644 services/*.h
 --- /dev/null
 +++ b/tcf-agent.init
-@@ -0,0 +1,78 @@
+@@ -0,0 +1,80 @@
 +#!/bin/sh
 +### BEGIN INIT INFO
 +# Provides:          tcf-agent
@@ -50,14 +50,16 @@ Upstream-Status: Inappropriate [poky-specific script]
 +    stop)
 +        echo -n "Stopping $DAEMON_NAME: "
 +        count=0
++        pid=$(/bin/pidof $DAEMON_PATH)
 +        while [ -n "`/bin/pidof $DAEMON_PATH`" -a $count -lt 10 ] ; do
-+            killproc $DAEMON_PATH >& /dev/null
++            kill $pid > /dev/null 2>&1
 +            sleep 1
 +            RETVAL=$?
 +            if [ $RETVAL != 0 -o -n "`/bin/pidof $DAEMON_PATH`" ] ; then
 +                sleep 3
 +            fi
 +            count=`expr $count + 1`
++            pid=$(/bin/pidof $DAEMON_PATH)
 +        done
 +        rm -f /var/lock/subsys/$DAEMON_NAME
 +        if [ -n "`/bin/pidof $DAEMON_PATH`" ] ; then
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 4d43c62..ced2b41 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
 
 SRCREV = "4ef94ecb927a8912c3d79ce137182247786cff8f"
 PV = "0.4.0+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git;protocol=git \
            file://fix_ranlib.patch \
-- 
1.7.9.5



