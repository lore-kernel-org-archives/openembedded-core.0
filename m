Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2B1F273CF2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 23:14:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jul 2015 16:14:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,526,1432623600"; d="scan'208";a="769450408"
Received: from bitbang.jf.intel.com ([10.7.201.51])
	by orsmga002.jf.intel.com with ESMTP; 22 Jul 2015 16:14:02 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jul 2015 16:13:56 -0700
Message-Id: <1437606836-26840-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.4.3
Subject: [PATCH] tcf-agent: Update to version 1.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jul 2015 23:14:04 -0000

According to the Eclipse tcf team, 1.3 tcf is required for the newest
Eclipse release "mars".

[Yocto #7886]
---
 meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch |  4 ++--
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb           | 13 ++++++-------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch
index 5d70456..f8de005 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch
@@ -1,7 +1,7 @@
 Upstream-Status: Inappropriate [poky-specific fix]
 
---- a/Makefile.inc
-+++ b/Makefile.inc
+--- a/agent/Makefile.inc
++++ b/agent/Makefile.inc
 @@ -57,6 +57,9 @@
    ifeq ($(NO_UUID),)
      LIBS += -luuid
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 616a6a7..fc93beb 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -3,13 +3,12 @@ HOMEPAGE = "http://wiki.eclipse.org/TCF"
 BUGTRACKER = "https://bugs.eclipse.org/bugs/"
 
 LICENSE = "EPL-1.0 | EDL-1.0"
-LIC_FILES_CHKSUM = "file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
+LIC_FILES_CHKSUM = "file://agent/edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
 
-SRCREV = "4ef94ecb927a8912c3d79ce137182247786cff8f"
-PV = "0.4.0+git${SRCPV}"
-PR = "r2"
+SRCREV = "b9a735e9c7cf82f80d412b7ab15d08b89d5a4ccc"
+PV = "1.3.0+git${SRCPV}"
 
-SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git \
+SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git;branch=1.3_mars_bugfix \
            file://fix_ranlib.patch \
            file://tcf-agent.init \
            file://tcf-agent.service \
@@ -40,11 +39,11 @@ CFLAGS += "-DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
     -DSERVICE_Expressions=0"
 
 do_compile() {
-	oe_runmake
+	oe_runmake -C agent
 }
 
 do_install() {
-	oe_runmake install INSTALLROOT=${D}
+	oe_runmake -C agent install INSTALLROOT=${D}
 	install -d ${D}${sysconfdir}/init.d/
 	install -m 0755 ${WORKDIR}/tcf-agent.init ${D}${sysconfdir}/init.d/tcf-agent
 	install -d ${D}${systemd_unitdir}/system
-- 
2.4.3


