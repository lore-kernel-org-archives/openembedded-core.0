Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA8971B0A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 15:15:11 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 28 Oct 2016 08:15:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,410,1473145200"; d="scan'208";a="24878742"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 28 Oct 2016 08:15:12 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2016 18:12:17 +0300
Message-Id: <f7417b7979c5a5d0ee11d30739c49932742f6325.1477667287.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 14/26] lttng: enable optional building of manpages
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
X-List-Received-Date: Fri, 28 Oct 2016 15:15:11 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/lttng/lttng-tools_git.bb | 4 ++--
 meta/recipes-kernel/lttng/lttng-ust_git.bb   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_git.bb b/meta/recipes-kernel/lttng/lttng-tools_git.bb
index bfc657b..016346f 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_git.bb
@@ -26,7 +26,7 @@ PACKAGECONFIG ??= "lttng-ust"
 PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python3 swig-native"
 PACKAGECONFIG[lttng-ust] = "--with-lttng-ust, --without-lttng-ust, lttng-ust"
 PACKAGECONFIG[kmod] = "--enable-kmod, --disable-kmod, kmod"
-PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native"
+PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
 PACKAGECONFIG_remove_libc-musl = "lttng-ust"
 
 SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.8 \
@@ -35,7 +35,7 @@ SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.8 \
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep ptest pkgconfig useradd python3-dir
+inherit autotools-brokensep ptest pkgconfig useradd python3-dir manpages
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "tracing"
diff --git a/meta/recipes-kernel/lttng/lttng-ust_git.bb b/meta/recipes-kernel/lttng/lttng-ust_git.bb
index baff71f..07ce2f4 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
                     file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c \
                     file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
 
-inherit autotools lib_package
+inherit autotools lib_package manpages
 
 DEPENDS = "liburcu util-linux"
 RDEPENDS_${PN}-bin = "python3-core"
@@ -26,7 +26,7 @@ SRC_URI = "git://git.lttng.org/lttng-ust.git;branch=stable-2.8 \
            file://lttng-ust-doc-examples-disable.patch \
           "
 
-EXTRA_OECONF += "--disable-man-pages"
+PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
 
 do_install_append() {
         # Patch python tools to use Python 3; they should be source compatible, but
-- 
2.9.3


