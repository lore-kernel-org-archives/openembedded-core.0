Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D13DB78209
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 05:17:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="21879930"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Jul 2017 13:17:27 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id A434546BAC00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 13:17:24 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 27 Jul 2017 13:17:24 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Jul 2017 13:17:07 +0800
Message-ID: <1501132627-4360-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: A434546BAC00.A3C81
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v2] openssl: disable default cryptodev
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
X-List-Received-Date: Thu, 27 Jul 2017 05:17:35 -0000
Content-Type: text/plain

Because according to the other Distros,cryptodev is not enabled.
If users want enable cryptodev, just have to add "cryptodev-linux" into PACKAGECONFIG.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2l.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
index c00dd81..7c8f18b 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
@@ -2,10 +2,8 @@ require openssl.inc
 
 # For target side versions of openssl enable support for OCF Linux driver
 # if they are available.
-PACKAGECONFIG[cryptodev-linux] = ",,cryptodev-linux"
-DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'cryptodev-linux', 'cryptodev-linux', '', d)}"
-
-CFLAG += "${@bb.utils.contains('PACKAGECONFIG', 'cryptodev-linux', '-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS', '', d)}"
+PACKAGECONFIG[cryptodev-linux] = "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS,,cryptodev-linux"
+CFLAG += "${PACKAGECONFIG_CONFARGS}"
 
 CFLAG_append_class-native = " -fPIC"
 
-- 
2.7.4




