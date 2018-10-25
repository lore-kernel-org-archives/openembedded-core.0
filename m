Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 430856FFC8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 05:39:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9P5dBCK008273
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 22:39:11 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 24 Oct 2018 22:38:58 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Oct 2018 13:38:57 +0800
Message-ID: <1540445937-177165-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2] openssl: change make install run serially
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
X-List-Received-Date: Thu, 25 Oct 2018 05:39:10 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

openssl offcially don't supprt parallel make install, and have
occasionally install fail problem for parallel build,
according to upstream suggestion, just make install serially.

refer:
https://github.com/openssl/openssl/issues/7466#issuecomment-432148137

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
index af9038a..21d35b6 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
@@ -43,6 +43,8 @@ EXTRA_OECONF_class-nativesdk = "--with-rand-seed=devrandom"
 CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
 CFLAGS_append_class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
 
+PARALLEL_MAKEINST = ""
+
 do_configure () {
 	os=${HOST_OS}
 	case $os in
-- 
2.7.4


