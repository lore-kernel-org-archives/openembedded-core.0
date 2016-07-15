Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 90B54606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 10:03:32 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id dx3so5925810pab.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 03:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=e1pXJZW8wEDs61QHS1+HHpXzLQNRS+PoGeq/S5/SaYo=;
	b=OR49qPUekH66/IvF2TiSuCDrKaWIH0nAOkYMWtvG6N//ErhM8C8xHsHcQvng/j6eM3
	tZLbd/kGWHP1GrKM/T4VkcE22UbAT6gDMj8OWgu/726uS63I+R4u7kUolHNxZdYrI+f7
	D6tl8Cd7n5GrRMQanLAEuOnyOIitsedD637hxpyqJJ7MZIX99cJkmNW/Tp2aBxgNCQSC
	jnLO5Nw4+AHD2bsqLhxLIFIARRsdQJmhm8PzzG9fuDb/BEIiUYDspdg04PyzIxgR4as5
	58f8yiLt0rMxMUwIz3AlSXX+VBQBmsBLOvJkSSxKqnG5R1o/tV1wOWVtGq/rgYtorkSJ
	PeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=e1pXJZW8wEDs61QHS1+HHpXzLQNRS+PoGeq/S5/SaYo=;
	b=B7ch57/IkNbVj59S44pU8bG4d3eWKjQ2jq94Eejo/wiD5o+FipP76+QHwW93f2aJxJ
	sSUxO4THC2u6TjNKrDpGfCD9prlel51eEcF9UvkUQmKZ5Xsjff0twipI1R6ctXOAbpaK
	8IHDSKfgTs3cbNau9rjDmsZw9XRufIWqHR/HUBNMeSAydqURRag3eKelkwhH6gBqhkEm
	iqFvrcn+9P18UA4y62rvYy4HTCBtMXTqOcWhw2J+NPGDgpDt12uyJ6RBGlkFdPI6pttn
	uY/j6R3DOvuLsndhYhafJhp6H6OJA7v17MZUu8u7GqbfyErLaXGUmWMSILLY8injA/XU
	Bu4w==
X-Gm-Message-State: ALyK8tJnD9xHZ7RE4pkcpbzW1OTA8T75+gflkPDkbI/J+VcoG0KyXBR53ockGxAz1aN+lw==
X-Received: by 10.66.248.35 with SMTP id yj3mr30048919pac.138.1468577013654;
	Fri, 15 Jul 2016 03:03:33 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id w63sm2589909pfi.9.2016.07.15.03.03.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jul 2016 03:03:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2016 03:03:25 -0700
Message-Id: <20160715100325.29006-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH] nss: Fix build on mips/clang
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
X-List-Received-Date: Fri, 15 Jul 2016 10:03:34 -0000

This issue is also reported here
https://trac.macports.org/ticket/51709
Patch is also from same ticket

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/nss/nss/pqg.c-ULL_addend.patch | 23 ++++++++++++++++++++++
 meta/recipes-support/nss/nss_3.24.bb               |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch

diff --git a/meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch b/meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch
new file mode 100644
index 0000000..9caaaeb
--- /dev/null
+++ b/meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch
@@ -0,0 +1,23 @@
+nss does not build on mips with clang because wrong types are used?
+
+pqg.c:339:16: error: comparison of constant 18446744073709551615 with expression of type 'unsigned long' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
+     if (addend < MP_DIGIT_MAX) {
+       ~~~~~~ ^ ~~~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: nss-3.24/nss/lib/freebl/pqg.c
+===================================================================
+--- nss-3.24.orig/nss/lib/freebl/pqg.c
++++ nss-3.24/nss/lib/freebl/pqg.c
+@@ -322,8 +322,8 @@ generate_h_candidate(SECItem *hit, mp_in
+ 
+ static SECStatus
+ addToSeed(const SECItem * seed,
+-          unsigned long   addend,
+-          int             seedlen, /* g in 186-1 */
++          unsigned long long  addend,
++          int                 seedlen, /* g in 186-1 */
+           SECItem * seedout)
+ {
+     mp_int s, sum, modulus, tmp;
diff --git a/meta/recipes-support/nss/nss_3.24.bb b/meta/recipes-support/nss/nss_3.24.bb
index caed7fa..c7c9fab 100644
--- a/meta/recipes-support/nss/nss_3.24.bb
+++ b/meta/recipes-support/nss/nss_3.24.bb
@@ -21,6 +21,7 @@ SRC_URI = "\
     file://nss-fix-incorrect-shebang-of-perl.patch \
     file://nss-fix-nsinstall-build.patch \
     file://disable-Wvarargs-with-clang.patch \
+    file://pqg.c-ULL_addend.patch \
     file://nss.pc.in \
     file://signlibs.sh \
 "
-- 
2.9.0


