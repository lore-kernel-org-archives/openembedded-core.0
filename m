Return-Path: <max.eliaser@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5942C60C19
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 21:01:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Aug 2014 13:55:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,820,1400050800"; d="scan'208";a="584980714"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.63])
	by orsmga002.jf.intel.com with ESMTP; 07 Aug 2014 14:01:42 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Aug 2014 13:59:22 -0700
Message-Id: <fcbfd180079c08d30c670a3146066e4a2bdeaa5d.1407445120.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1407445120.git.max.eliaser@intel.com>
References: <cover.1407445120.git.max.eliaser@intel.com>
In-Reply-To: <cover.1407445120.git.max.eliaser@intel.com>
References: <cover.1407445120.git.max.eliaser@intel.com>
Subject: [PATCH 2/2] ubootchart: delete ubootchart recipe
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
X-List-Received-Date: Thu, 07 Aug 2014 21:01:50 -0000

The Ubootchart recipe had known issues. Ubootchart itself is no longer updated
upstream. Ubootchart is also now redundant with Bootchart2.

If people still want ubootchart around, it can be moved to meta-oe.

Ubootchart removed as part of the solution to [YOCTO #5893].

Signed-off-by: Max Eliaser <max.eliaser@intel.com>
---
 .../ubootchart/files/sysvinit.patch                | 14 --------
 .../ubootchart/files/ubootchart-stop               |  3 --
 .../ubootchart/files/ubootchart.desktop            |  6 ----
 meta/recipes-devtools/ubootchart/ubootchart_svn.bb | 39 ----------------------
 4 files changed, 62 deletions(-)
 delete mode 100644 meta/recipes-devtools/ubootchart/files/sysvinit.patch
 delete mode 100644 meta/recipes-devtools/ubootchart/files/ubootchart-stop
 delete mode 100644 meta/recipes-devtools/ubootchart/files/ubootchart.desktop
 delete mode 100644 meta/recipes-devtools/ubootchart/ubootchart_svn.bb

diff --git a/meta/recipes-devtools/ubootchart/files/sysvinit.patch b/meta/recipes-devtools/ubootchart/files/sysvinit.patch
deleted file mode 100644
index fc82ed8..0000000
--- a/meta/recipes-devtools/ubootchart/files/sysvinit.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Inappropriate [distribution]
-
-Index: ubootchart.conf
-===================================================================
---- ubootchart.conf	(revision 9)
-+++ ubootchart.conf	(working copy)
-@@ -1,6 +1,6 @@
- 
- # If you want to chain on and run somthing other than /sbin/init...
--export init_prog=/sbin/init
-+export init_prog=/sbin/init.sysvinit
- 
- # On startup ubootchart will mount a tmpfs filesystem at this
- # location and chdir here. This is only used for the logging of
diff --git a/meta/recipes-devtools/ubootchart/files/ubootchart-stop b/meta/recipes-devtools/ubootchart/files/ubootchart-stop
deleted file mode 100644
index 3444069..0000000
--- a/meta/recipes-devtools/ubootchart/files/ubootchart-stop
+++ /dev/null
@@ -1,3 +0,0 @@
-#! /bin/sh
-
-kill -USR1 $(pidof ubootchartd_bin)
diff --git a/meta/recipes-devtools/ubootchart/files/ubootchart.desktop b/meta/recipes-devtools/ubootchart/files/ubootchart.desktop
deleted file mode 100644
index 5552b3b..0000000
--- a/meta/recipes-devtools/ubootchart/files/ubootchart.desktop
+++ /dev/null
@@ -1,6 +0,0 @@
-[Desktop Entry]
-Encoding=UTF-8
-Exec=/sbin/ubootchart-stop
-Name=Stop Bootchart
-Type=Application
-Categories=Programming;
diff --git a/meta/recipes-devtools/ubootchart/ubootchart_svn.bb b/meta/recipes-devtools/ubootchart/ubootchart_svn.bb
deleted file mode 100644
index b13755e..0000000
--- a/meta/recipes-devtools/ubootchart/ubootchart_svn.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "A boot profiling tool"
-HOMEPAGE = "http://code.google.com/p/ubootchart/"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
-SRCREV = "12"
-PV = "0.0+r${SRCPV}"
-PR = "r6"
-
-#RRECOMMENDS_${PN} = "acct"
-
-SRC_URI = "svn://ubootchart.googlecode.com/svn/;protocol=http;module=trunk \
-        file://sysvinit.patch;striplevel=0 \
-        file://ubootchart-stop \
-        file://ubootchart.desktop"
-
-S = "${WORKDIR}/trunk"
-
-inherit update-alternatives
-
-ALTERNATIVE_${PN} = "init"
-ALTERNATIVE_TARGET[init] = "${base_sbindir}/ubootchartd"
-ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
-ALTERNATIVE_PRIORITY = "70"
-
-do_compile() {
-        ${CC} ${CFLAGS} ${LDFLAGS} ${LIBS} ${INCLUDES} ${S}/ubootchartd_bin.c -o ubootchartd_bin
-}
-
-do_install() {
-        install -m 0755 -d ${D}${base_sbindir} ${D}${sysconfdir}/ubootchart ${D}${datadir}/applications
-        install -m 0755 ${S}/ubootchartd_bin ${D}${base_sbindir}
-        install -m 0755 ${S}/ubootchartd ${D}${base_sbindir}
-        install -m 0644 ${S}/ubootchart.conf ${D}${sysconfdir}/ubootchart
-        install -m 0755 ${S}/start.sh ${D}${sysconfdir}/ubootchart
-        install -m 0755 ${S}/finish.sh ${D}${sysconfdir}/ubootchart
-        
-        install -m 0755 ${WORKDIR}/ubootchart-stop ${D}${base_sbindir}
-        install -m 0644 ${WORKDIR}/ubootchart.desktop ${D}${datadir}/applications
-}
-- 
1.8.3.2


