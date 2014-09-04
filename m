Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF8E713BC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 07:51:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s847p60X012299
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Sep 2014 00:51:07 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 4 Sep 2014 00:51:05 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Sep 2014 15:51:00 +0800
Message-ID: <4f6f892f328df65b692f14b757e1581d7d7a8219.1409816594.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409816594.git.hongxu.jia@windriver.com>
References: <cover.1409816594.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] lttng-tools: add PACKAGECONFIG to support --enable-python-bindings and lttng-ust
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
X-List-Received-Date: Thu, 04 Sep 2014 07:51:08 -0000
Content-Type: text/plain

Add PACKAGECONFIG to support --enable-python-bindings
Add PACKAGECONFIG to support lttng-ust

And python-bindings requires swig-native as DEPENDS, and
swig-native is not in oe-core, so disable python-bindings
by default

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb
index 1ec0f4a..fd44aa5 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb
@@ -15,6 +15,14 @@ RDEPENDS_${PN}-ptest += "make perl bash"
 SRCREV = "8b27cacb277c2cdab791139b08da8eb87ab14a88"
 PV = "v2.5.0"
 
+PYTHON_OPTION = "am_cv_python_pyexecdir='${libdir}/python${PYTHON_BASEVERSION}/site-packages' \
+                 am_cv_python_pythondir='${libdir}/python${PYTHON_BASEVERSION}/site-packages' \
+                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}' \
+"
+PACKAGECONFIG ??= "lttng-ust"
+PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python swig-native"
+PACKAGECONFIG[lttng-ust] = ", --disable-lttng-ust, lttng-ust"
+
 SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.5 \
            file://runtest-2.4.0.patch \
            file://run-ptest \
@@ -26,12 +34,17 @@ inherit autotools-brokensep ptest pkgconfig
 
 export KERNELDIR="${STAGING_KERNEL_DIR}"
 
-FILES_${PN} += "${libdir}/lttng/libexec/* ${datadir}/xml/lttng"
-FILES_${PN}-dbg += "${libdir}/lttng/libexec/.debug"
+FILES_${PN} += "${libdir}/lttng/libexec/* ${datadir}/xml/lttng \
+                ${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
+FILES_${PN}-dbg += "${libdir}/lttng/libexec/.debug \
+                    ${libdir}/python2.7/site-packages/.debug"
+FILES_${PN}-staticdev += "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.a"
+FILES_${PN}-dev += "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.la"
 
 # Since files are installed into ${libdir}/lttng/libexec we match 
 # the libexec insane test so skip it.
-INSANE_SKIP_${PN} = "libexec"
+# Python module needs to keep _lttng.so
+INSANE_SKIP_${PN} = "libexec dev-so"
 INSANE_SKIP_${PN}-dbg = "libexec"
 
 do_configure_prepend () {
-- 
1.9.1


