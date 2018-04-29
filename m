Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 455A07461B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 19:36:41 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id v63so5127284pfk.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 12:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=s7XgoqtL04aE/6n0tUCrZYQUDdG4q0mBXhXzMzP/ewc=;
	b=gVoHiQ3IUcanUmlrmq5xT2vU4R4OJmMlRHO/XxUlotoNFpD7ikXGLm+btRoqwxOPMO
	2zciajICNzrBnU8w35zZuY+rvJyPXZbc1yTwNC0zCWPzQXt1v9S3cZXT3gIfIweeKjiO
	yKqH4+7sKWbsRtAOW3ZtNC++sqB/q3Aj2iF8nlfh7fQ+fi+KvFTXJGI6C20feDxRfb7P
	jal/uWDbukZ/RoK8GHVgFZO0m54KxmMfF8MLuUPNjfY5YEyp2+JJv+CcN6YF1tgf/SPW
	7eFe03MVlcMD1aEtkwlvhAeZiuRXESYygV9Qr21oafzTCU/sqcyX3TdIJRj79cSm8L1h
	c1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=s7XgoqtL04aE/6n0tUCrZYQUDdG4q0mBXhXzMzP/ewc=;
	b=rQBVYahyyrS6FS5RB8/pIc1KKZTRzt+3bK8kp4J+FxgmMSyX0CXhf0eIIR0z7xLW1b
	NhLpse9QNB8ErXwQZyQuV+dqhtaZHClfkGND+et9ZOq9n5iUWR7XKf4ULm7DLeezLZCg
	mDkgfULx9LlFintaSZNcUVRN1qPJByLIOt7nFj+kLx8JaKiazvReKGIdwNhK/m6E/jPx
	CFHkfp5Y2BC9f7FvkrUSd+pSMLhdSfol9J5DkL6kPVxrmwQSjUmgWoIDMGaNGH7Z50Kr
	tp82P4PBthRmPQar99rHgAdEEZoDLrzP5c083+mH0cZoM7SB9dwHVa35XLmGjIHueXbw
	iYHg==
X-Gm-Message-State: ALQs6tAIsssxOIAg6e70kbjs+D/IpvHHUdl927Fjxuj1360b+iPtWL4A
	WIksPMbHpGLQ4B+AzMma/qgc7A==
X-Google-Smtp-Source: AB8JxZpfKiXDy9SIfK9zFgCOlerFbsQ1tR9kL94/fVP7pRAkWfev7goD7BcBfPnDRv/RngKcK88vNw==
X-Received: by 2002:a65:4a45:: with SMTP id a5-v6mr8383858pgu.32.1525030602101;
	Sun, 29 Apr 2018 12:36:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	125sm11960737pfc.145.2018.04.29.12.36.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 12:36:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:36:08 -0700
Message-Id: <c7e4d49be799d45d218efb5e50fcfb5d1e8facef.1525029885.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525029885.git.raj.khem@gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
Subject: [PATCH 21/24] mdadm: Fix build with gcc8
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
X-List-Received-Date: Sun, 29 Apr 2018 19:36:41 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...able-errors-due-to-new-gcc8-warnings.patch | 30 ++++++++++++++++++
 ...tead-of-memcpy-on-overlapping-region.patch | 31 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.0.bb      |  2 ++
 3 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-Disable-errors-due-to-new-gcc8-warnings.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-Disable-errors-due-to-new-gcc8-warnings.patch b/meta/recipes-extended/mdadm/files/0001-Disable-errors-due-to-new-gcc8-warnings.patch
new file mode 100644
index 0000000000..003d8d059b
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-Disable-errors-due-to-new-gcc8-warnings.patch
@@ -0,0 +1,30 @@
+From aeee2c585d3bf2470691f570ace80c4d75fe871a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 28 Apr 2018 09:39:57 -0700
+Subject: [PATCH] Disable errors due to new gcc8 warnings
+
+This is needed until
+https://bugzilla.redhat.com/show_bug.cgi?id=1553958
+
+is fixed
+
+Upstream-Status: Inappropriate [Workaround]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index a04d82a..a893120 100644
+--- a/Makefile
++++ b/Makefile
+@@ -43,7 +43,7 @@ KLIBC_GCC = gcc -nostdinc -iwithprefix include -I$(KLIBC)/klibc/include -I$(KLIB
+ 
+ CC ?= $(CROSS_COMPILE)gcc
+ CXFLAGS ?= -ggdb
+-CWFLAGS = -Wall -Werror -Wstrict-prototypes -Wextra -Wno-unused-parameter
++CWFLAGS = -Wall -Werror -Wstrict-prototypes -Wextra -Wno-unused-parameter -Wno-error=format-overflow -Wno-error=format-truncation -Wno-error=stringop-truncation
+ ifdef WARN_UNUSED
+ CWFLAGS += -Wp,-D_FORTIFY_SOURCE=2 -O3
+ endif
diff --git a/meta/recipes-extended/mdadm/files/0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch b/meta/recipes-extended/mdadm/files/0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch
new file mode 100644
index 0000000000..44351b6569
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch
@@ -0,0 +1,31 @@
+From ab18f04cf89ef4e8521c81c50477e1363b2d333b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 28 Apr 2018 09:46:12 -0700
+Subject: [PATCH] use memmove instead of memcpy on overlapping region
+
+Fixes
+super0.c:526:3: error: 'memcpy' accessing 3936 bytes at offsets 156 and 160 overlaps 3932 bytes at offset 160 [-Werror=restrict]
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ super0.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/super0.c b/super0.c
+index f5b4507..264b598 100644
+--- a/super0.c
++++ b/super0.c
+@@ -523,7 +523,7 @@ static int update_super0(struct supertype *st, struct mdinfo *info,
+ 		 * up 4 bytes before continuing
+ 		 */
+ 		__u32 *sb32 = (__u32*)sb;
+-		memcpy(sb32+MD_SB_GENERIC_CONSTANT_WORDS+7,
++		memmove(sb32+MD_SB_GENERIC_CONSTANT_WORDS+7,
+ 		       sb32+MD_SB_GENERIC_CONSTANT_WORDS+7+1,
+ 		       (MD_SB_WORDS - (MD_SB_GENERIC_CONSTANT_WORDS+7+1))*4);
+ 		if (verbose >= 0)
+-- 
+2.17.0
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.0.bb b/meta/recipes-extended/mdadm/mdadm_4.0.bb
index dc098f19b6..097875110c 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.0.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.0.bb
@@ -22,6 +22,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0004-mdadm-Forced-type-conversion-to-avoid-truncation.patch \
            file://0005-Add-a-comment-to-indicate-valid-fallthrough.patch \
            file://0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch \
+           file://0001-Disable-errors-due-to-new-gcc8-warnings.patch \
+           file://0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch \
            "
 SRC_URI[md5sum] = "2cb4feffea9167ba71b5f346a0c0a40d"
 SRC_URI[sha256sum] = "1d6ae7f24ced3a0fa7b5613b32f4a589bb4881e3946a5a2c3724056254ada3a9"
-- 
2.17.0


