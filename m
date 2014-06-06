Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B48C66FAD2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 07:19:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s567JgTA023884
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jun 2014 00:19:42 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.200) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 6 Jun 2014 00:19:41 -0700
From: <rongqing.li@windriver.com>
To: <yanjun.zhu@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jun 2014 15:19:47 +0800
Message-ID: <1402039187-17384-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] python-gst: link python shared library to config directory
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
X-List-Received-Date: Fri, 06 Jun 2014 07:19:41 -0000
Content-Type: text/plain

From: "yanjun.zhu" <yanjun.zhu@windriver.com>

python-gst needs python shared library in python config directory.

Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
---
 meta/recipes-devtools/python/python-gst_0.10.22.bb |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/python/python-gst_0.10.22.bb b/meta/recipes-devtools/python/python-gst_0.10.22.bb
index a551adb..2a5f2b3 100644
--- a/meta/recipes-devtools/python/python-gst_0.10.22.bb
+++ b/meta/recipes-devtools/python/python-gst_0.10.22.bb
@@ -21,3 +21,9 @@ EXTRA_OECONF += "--with-python-includes=${STAGING_INCDIR}/../"
 FILES_${PN} += "${datadir}/gst-python"
 FILES_${PN}-dev += "${datadir}/gst-python/0.10/defs"
 FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/gst-0.10/gst/.debug/ ${libdir}/gstreamer-0.10/.debug/"
+
+do_configure_prepend() {
+	if [ `find ${STAGING_LIBDIR} -name libpython*.so` ]; then
+		ln -sf ${STAGING_LIBDIR}/libpython*.so `find ${STAGING_LIBDIR} -name libpython*.a -exec dirname {} \;`
+	fi
+}
-- 
1.7.10.4


