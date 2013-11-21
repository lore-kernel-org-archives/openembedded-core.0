Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F9726DB9C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 13:14:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rALDErED004549
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Nov 2013 05:14:53 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 21 Nov 2013 05:14:52 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 21:14:37 +0800
Message-ID: <3177e964cb6b15eebb3c6d26360c9028feace1ed.1385039538.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1385039538.git.hongxu.jia@windriver.com>
References: <cover.1385039538.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 3/4] lttng-tools: add PACKAGECONFIG to support --enable-python-bindings and lttng-ust
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
X-List-Received-Date: Thu, 21 Nov 2013 13:14:55 -0000
Content-Type: text/plain

Add PACKAGECONFIG to support --enable-python-bindings
Add PACKAGECONFIG to support lttng-ust

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
index 2f6e504..64b6e02 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
@@ -9,9 +9,18 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
                     file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
 
-DEPENDS = "liburcu popt lttng-ust"
+DEPENDS = "liburcu popt"
 RDEPENDS_${PN}-ptest += "make"
 
+PYTHON_OPTION = "am_cv_python_pyexecdir='${libdir}/python${PYTHON_BASEVERSION}/site-packages' \
+                 am_cv_python_pythondir='${libdir}/python${PYTHON_BASEVERSION}/site-packages' \
+                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}' \
+"
+PACKAGECONFIG = "python lttng-ust"
+PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION}, \
+                         --disable-python-bindings, python swig-native"
+PACKAGECONFIG[lttng-ust] = "--enable-lttng-ust, --disable-lttng-ust, lttng-ust"
+
 SRCREV = "5d985544a7ad54afa0514ea7f522a89d8d844860"
 PV = "v2.3.1"
 
@@ -26,12 +35,15 @@ inherit autotools ptest
 
 export KERNELDIR="${STAGING_KERNEL_DIR}"
 
-FILES_${PN} += "${libdir}/lttng/libexec/*"
-FILES_${PN}-dbg += "${libdir}/lttng/libexec/.debug"
+FILES_${PN} += "${libdir}/lttng/libexec/* ${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
+FILES_${PN}-dbg += "${libdir}/lttng/libexec/.debug ${libdir}/python2.7/site-packages/.debug"
+FILES_${PN}-staticdev += "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.a"
+FILES_${PN}-dev += "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.la"
 
 # Since files are installed into ${libdir}/lttng/libexec we match 
 # the libexec insane test so skip it.
-INSANE_SKIP_${PN} = "libexec"
+# Python module needs to keep _lttng.so
+INSANE_SKIP_${PN} = "libexec dev-so"
 INSANE_SKIP_${PN}-dbg = "libexec"
 
 
-- 
1.8.1.2


