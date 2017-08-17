Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DFF1473120
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 01:27:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.41,385,1498492800"; d="scan'208";a="23841616"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Aug 2017 09:27:32 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4CC6A4724393
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 09:27:32 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 17 Aug 2017 09:27:32 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Aug 2017 09:27:17 +0800
Message-ID: <1502933237-3703-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 4CC6A4724393.A5311
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] openssl10: modified the define cryptodev
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
X-List-Received-Date: Thu, 17 Aug 2017 01:27:32 -0000
Content-Type: text/plain

Use PACKAGECONFIG to add cryptodev.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-connectivity/openssl/openssl10.inc       | 2 ++
 meta/recipes-connectivity/openssl/openssl10_1.0.2l.bb | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl10.inc b/meta/recipes-connectivity/openssl/openssl10.inc
index c93d5d8..08fd22e 100644
--- a/meta/recipes-connectivity/openssl/openssl10.inc
+++ b/meta/recipes-connectivity/openssl/openssl10.inc
@@ -15,7 +15,9 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
           "
 S = "${WORKDIR}/openssl-${PV}"
 
+PACKAGECONFIG ?= "cryptodev-linux"
 PACKAGECONFIG[perl] = ",,,"
+PACKAGECONFIG[cryptodev-linux] = "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS,,cryptodev-linux"
 
 TERMIO_libc-musl = "-DTERMIOS"
 TERMIO ?= "-DTERMIO"
diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2l.bb b/meta/recipes-connectivity/openssl/openssl10_1.0.2l.bb
index cf0459c..8c34ea6 100644
--- a/meta/recipes-connectivity/openssl/openssl10_1.0.2l.bb
+++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2l.bb
@@ -2,7 +2,6 @@ require openssl10.inc
 
 # For target side versions of openssl enable support for OCF Linux driver
 # if they are available.
-DEPENDS += "cryptodev-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 CFLAG_append_class-native = " -fPIC"
-- 
2.7.4




