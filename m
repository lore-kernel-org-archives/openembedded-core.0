Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.21196.1629101210398406354
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 01:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17G86nB5000436
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 01:06:49 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 16 Aug 2021 01:06:48 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 16 Aug 2021 01:06:48 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] shadow: fix default value in SHA_get_salt_rounds()
Date: Mon, 16 Aug 2021 16:03:45 +0800
Message-ID: <20210816080345.23751-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch [1] to fix chpasswd, gpasswd and passwd "hang" for
several minutes (10-20min) at 100% cpu usage though they finally
terminate successfully.

[1] https://github.com/shadow-maint/shadow/issues/393

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...default-value-in-SHA_get_salt_rounds.patch | 64 +++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-libmisc-fix-default-value-in-SHA_get_salt_rounds.patch

diff --git a/meta/recipes-extended/shadow/files/0001-libmisc-fix-default-value-in-SHA_get_salt_rounds.patch b/meta/recipes-extended/shadow/files/0001-libmisc-fix-default-value-in-SHA_get_salt_rounds.patch
new file mode 100644
index 0000000000..2c9b1d06cd
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-libmisc-fix-default-value-in-SHA_get_salt_rounds.patch
@@ -0,0 +1,64 @@
+From 234e8fa7b134d1ebabfdad980a3ae5b63c046c62 Mon Sep 17 00:00:00 2001
+From: Mike Gilbert <floppym@gentoo.org>
+Date: Sat, 14 Aug 2021 13:24:34 -0400
+Subject: [PATCH] libmisc: fix default value in SHA_get_salt_rounds()
+
+If SHA_CRYPT_MIN_ROUNDS and SHA_CRYPT_MAX_ROUNDS are both unspecified,
+use SHA_ROUNDS_DEFAULT.
+
+Previously, the code fell through, calling shadow_random(-1, -1). This
+ultimately set rounds = (unsigned long) -1, which ends up being a very
+large number! This then got capped to SHA_ROUNDS_MAX later in the
+function.
+
+The new behavior matches BCRYPT_get_salt_rounds().
+
+Bug: https://bugs.gentoo.org/808195
+Fixes: https://github.com/shadow-maint/shadow/issues/393
+
+Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/234e8fa7b134d1ebabfdad980a3ae5b63c046c62]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ libmisc/salt.c | 21 +++++++++++----------
+ 1 file changed, 11 insertions(+), 10 deletions(-)
+
+diff --git a/libmisc/salt.c b/libmisc/salt.c
+index 91d528fd..30eefb9c 100644
+--- a/libmisc/salt.c
++++ b/libmisc/salt.c
+@@ -223,20 +223,21 @@ static /*@observer@*/const unsigned long SHA_get_salt_rounds (/*@null@*/int *pre
+ 		if ((-1 == min_rounds) && (-1 == max_rounds)) {
+ 			rounds = SHA_ROUNDS_DEFAULT;
+ 		}
++		else {
++			if (-1 == min_rounds) {
++				min_rounds = max_rounds;
++			}
+ 
+-		if (-1 == min_rounds) {
+-			min_rounds = max_rounds;
+-		}
++			if (-1 == max_rounds) {
++				max_rounds = min_rounds;
++			}
+ 
+-		if (-1 == max_rounds) {
+-			max_rounds = min_rounds;
+-		}
++			if (min_rounds > max_rounds) {
++				max_rounds = min_rounds;
++			}
+ 
+-		if (min_rounds > max_rounds) {
+-			max_rounds = min_rounds;
++			rounds = (unsigned long) shadow_random (min_rounds, max_rounds);
+ 		}
+-
+-		rounds = (unsigned long) shadow_random (min_rounds, max_rounds);
+ 	} else if (0 == *prefered_rounds) {
+ 		rounds = SHA_ROUNDS_DEFAULT;
+ 	} else {
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 97ffae978a..c1e24b4f16 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/v${PV}/${BP}
            file://shadow-relaxed-usernames.patch \
            file://0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch \
            file://0001-libsubid-link-to-PAM-libraries.patch \
+           file://0001-libmisc-fix-default-value-in-SHA_get_salt_rounds.patch \
            "
 
 SRC_URI:append:class-target = " \
-- 
2.29.2

