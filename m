Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 89DFF605BE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 02:56:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8T2uLL3002468
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Sep 2018 19:56:21 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 28 Sep 2018 19:56:20 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Sat, 29 Sep 2018 11:06:23 +0800
Message-ID: <1538190383-31405-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libidn2: improve reproducibility
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
X-List-Received-Date: Sat, 29 Sep 2018 02:56:20 -0000
Content-Type: text/plain

Remoe prefix ${RECIPE_SYSROOT} in libidn2.pc

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/libidn/libidn2_2.0.5.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/libidn/libidn2_2.0.5.bb b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
index 0daf7a6..7a06ed3 100644
--- a/meta/recipes-extended/libidn/libidn2_2.0.5.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
@@ -27,3 +27,9 @@ LICENSE_${PN} = "(GPLv2+ | LGPLv3)"
 LICENSE_${PN}-bin = "GPLv3+"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PACKAGE_PREPROCESS_FUNCS += "libidn2_package_preprocess"
+libidn2_package_preprocess () {
+    sed -e 's@${RECIPE_SYSROOT}@@g' \
+       -i ${PKGD}${libdir}/pkgconfig/libidn2.pc
+}
-- 
2.7.4


