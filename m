Return-Path: <Xulin.Sun@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F5806C538
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 02:25:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0I2PjML003197
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 18:25:46 -0800 (PST)
Received: from pek-lpggp4.wrs.com (128.224.153.77) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 17 Jan 2019 18:25:45 -0800
From: Xulin Sun <xulin.sun@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Jan 2019 10:22:48 +0800
Message-ID: <20190118022248.17108-1-xulin.sun@windriver.com>
X-Mailer: git-send-email 2.18.1
MIME-Version: 1.0
Cc: xulin.sun@windriver.com
Subject: [meta-oe][PATCH] openssl: fix multilib file install conflicts
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
X-List-Received-Date: Fri, 18 Jan 2019 02:25:45 -0000
Content-Type: text/plain

To avoid issue like below if run "bitbake lib32-wrlinux-image-glibc-std"
with series userspace packages(LAMP,krb5...) added:

Error: Transaction check error:
  file /usr/bin/c_rehash conflicts between attempted installs of
  lib32-openssl-bin-1.1.1-r0.armv7at2hf_neon and openssl-bin-1.1.1-r0.aarch64

Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1a.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
index 5c4e69cfb7..21359fa68a 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
@@ -206,3 +206,7 @@ RREPLACES_openssl-conf = "openssl10-conf"
 RCONFLICTS_openssl-conf = "openssl10-conf"
 
 BBCLASSEXTEND = "native nativesdk"
+
+inherit multilib_script
+
+MULTILIB_SCRIPTS = "${PN}:${bindir}/c_rehash"
-- 
2.18.1


