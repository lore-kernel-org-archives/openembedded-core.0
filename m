Return-Path: <Xulin.Sun@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 68CB960197
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 07:34:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0T7YXxS015517
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 23:34:43 -0800
Received: from pek-lpggp4.wrs.com (128.224.153.77) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.435.0;
	Mon, 28 Jan 2019 23:34:23 -0800
From: Xulin Sun <xulin.sun@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Jan 2019 15:31:22 +0800
Message-ID: <1548747082-10286-1-git-send-email-xulin.sun@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20190118022248.17108-1-xulin.sun@windriver.com>
References: <20190118022248.17108-1-xulin.sun@windriver.com>
MIME-Version: 1.0
Cc: xulin.sun@windriver.com
Subject: [meta-oe][PATCH v3] openssl: fix multilib file install conflicts
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
X-List-Received-Date: Tue, 29 Jan 2019 07:34:53 -0000
Content-Type: text/plain

To avoid issue like below if run "bitbake lib32-core-image-minimal"
with series userspace packages(LAMP,krb5...) added.

Add multilib_script support for openssl's c_rehash which is a perl script.

Error: Transaction check error:
  file /usr/bin/c_rehash conflicts between attempted installs of
  lib32-openssl-bin-1.1.1-r0.armv7at2hf_neon and openssl-bin-1.1.1-r0.aarch64

Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1a.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
index 5c4e69c..6676614 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
@@ -206,3 +206,7 @@ RREPLACES_openssl-conf = "openssl10-conf"
 RCONFLICTS_openssl-conf = "openssl10-conf"
 
 BBCLASSEXTEND = "native nativesdk"
+
+inherit multilib_script
+
+MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.7.4


