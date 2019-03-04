Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 171DA7CA53
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 18:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 01DFC40B66;
	Mon,  4 Mar 2019 18:11:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id m7ZVX7l0Pjsl; Mon,  4 Mar 2019 18:11:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C3B0440024;
	Mon,  4 Mar 2019 18:11:43 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 1D7E216BB89;
	Mon,  4 Mar 2019 13:11:43 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 13:11:13 -0500
Message-Id: <1551723073-3036-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [thud][PATCH] openssl10: Fix mutliple include assumptions for des.h in opensslconf.h
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
X-List-Received-Date: Mon, 04 Mar 2019 18:11:47 -0000

From: Denys Dmytriyenko <denys@ti.com>

The fix is heavily based on Khem's previous fix for bn.h/BN_LLONG breakage:
https://git.openembedded.org/openembedded-core/commit/?id=f787b0bb9b0626ddbf2ac94cb206c76716a3773d

(From OE-Core rev: 914e1520bf9c45e14bce9993c9131a2c0702b9c9)

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../openssl10/0001-Fix-DES_LONG-breakage.patch     | 35 ++++++++++++++++++++++
 .../openssl/openssl10_1.0.2q.bb                    |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl10/0001-Fix-DES_LONG-breakage.patch

diff --git a/meta/recipes-connectivity/openssl/openssl10/0001-Fix-DES_LONG-breakage.patch b/meta/recipes-connectivity/openssl/openssl10/0001-Fix-DES_LONG-breakage.patch
new file mode 100644
index 0000000..7243fb4
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl10/0001-Fix-DES_LONG-breakage.patch
@@ -0,0 +1,35 @@
+From 1aec49cc45e7cf5ebc059a77081ac3ea2a5aff7b Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Fri, 1 Mar 2019 13:14:56 -0500
+Subject: [PATCH] Fix DES_LONG breakage
+
+Mimic previous BN_LLONG fix by Khem Raj here. Re-use its description:
+
+opensslconf.h is defining DES_LONG only when included from des.h which
+is not robust at all, especially when include guards are used and
+multiple inclusions of a given header is not allowed. so lets take out
+the nesting constraint and add OPENSSL_SYS_UEFI constraint instead
+
+Upstream-Status: Inappropriate [ fixed differently with OpenSSL 1.1+ ]
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ crypto/opensslconf.h.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/crypto/opensslconf.h.in b/crypto/opensslconf.h.in
+index a10c10f..0147a4d 100644
+--- a/crypto/opensslconf.h.in
++++ b/crypto/opensslconf.h.in
+@@ -48,7 +48,7 @@
+ #endif
+ #endif
+ 
+-#if (defined(HEADER_NEW_DES_H) || defined(HEADER_DES_H)) && !defined(DES_LONG)
++#if !defined(OPENSSL_SYS_UEFI) && !defined(DES_LONG)
+ /* If this is set to 'unsigned int' on a DEC Alpha, this gives about a
+  * %20 speed up (longs are 8 bytes, int's are 4). */
+ #ifndef DES_LONG
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb b/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
index 355dbdc..54af100 100644
--- a/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
+++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
@@ -41,6 +41,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-openssl-force-soft-link-to-avoid-rare-race.patch \
            file://0001-allow-manpages-to-be-disabled.patch \
            file://0001-Fix-BN_LLONG-breakage.patch \
+           file://0001-Fix-DES_LONG-breakage.patch \
            "
 
 SRC_URI_append_class-target = " \
-- 
2.7.4


