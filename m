Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E84C57CF7D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 00:03:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,391,1549900800"; d="scan'208";a="60477317"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Apr 2019 08:03:33 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 82D1C4CD8861
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 08:03:32 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 25 Apr 2019 08:03:38 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Apr 2019 08:03:58 +0800
Message-ID: <1556150638-2947-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: 82D1C4CD8861.ABF13
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v4] dnf: Enable nativesdk
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
X-List-Received-Date: Thu, 25 Apr 2019 00:03:34 -0000
Content-Type: text/plain

Make dnf work on nativesdk environment.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta/recipes-devtools/dnf/dnf_4.2.2.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
index 3970b41..c777733 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
@@ -26,7 +26,7 @@ EXTRA_OECMAKE = " -DWITH_MAN=0 -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -
 
 BBCLASSEXTEND = "native nativesdk"
 
-RDEPENDS_${PN}_class-target += " \
+RDEPENDS_${PN} += " \
   python3-core \
   python3-codecs \
   python3-netclient \
@@ -49,6 +49,8 @@ RDEPENDS_${PN}_class-target += " \
   python3-gpg \
   "
 
+RDEPENDS_${PN}_class-native = ""
+
 RRECOMMENDS_${PN}_class-target += "gnupg"
 
 # Create a symlink called 'dnf' as 'make install' does not do it, but
@@ -66,6 +68,12 @@ do_install_append_class-native() {
                 RPM_NO_CHROOT_FOR_SCRIPTS=1
 }
 
+do_install_append_class-nativesdk() {
+        create_wrapper ${D}/${bindir}/dnf \
+                RPM_CONFIGDIR=${SDKPATHNATIVE}${libdir_nativesdk}/rpm \
+                RPM_NO_CHROOT_FOR_SCRIPTS=1 
+}
+
 SYSTEMD_SERVICE_${PN} = "dnf-makecache.service dnf-makecache.timer \
                          dnf-automatic.service dnf-automatic.timer \
                          dnf-automatic-download.service dnf-automatic-download.timer \
-- 
2.7.4




