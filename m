Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 436356BA9C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 20:04:06 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id y126so10857372pfb.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 12:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UyMhPhh9oHz00t9WXDxwgO02aZmB8cc/BWw1kzrUIpo=;
	b=QGAlUa69guwmppd3oz2iWRRaaxXL46HASVM6mssPlhtLL6LH4H6+FCQFHp74ODbJUN
	ElBj9Z50q2cKXC96/oLPl+a1gomKTiZHWwO7unQGnCku9hibwiUhBM31vQnm+MvG1Fif
	yIJaji2NIDp/nBjaMO0uiYYTOJTGDRI5x06bGFfIu1srcBbvwP89G7hdIpFrXnkB5f0t
	Krkjd2Yj0OefD363PYytfiYRm0kuKWYeqqjNAyt7PAcU4jChUkg9KpppwDjxHgx6apW7
	dkEpXU3aCx59OcdCcgDMkioBLdywOAMl8ifxpGtlJHwuquwl3jym3Ar1laz5JmSU7jmo
	xxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UyMhPhh9oHz00t9WXDxwgO02aZmB8cc/BWw1kzrUIpo=;
	b=buSNU9lCJ+iQxz6/XQH5HPx654CZCkl5ftU+VA87D/PKc0pXoXdjxK/unJOrs/MSLd
	TW6AkLPlumk+oj64nOG3lZhQrgf0sHJF3Q0qFYvIAYMbg4E53ucRlPQ584gMs4Itt0We
	EU2G0YnF98kIltUGAFUZslGy1dlkgVL//3Aq0qVa2Tbn7J4XNlGnMPT0B7z+V5xOUeG3
	jX+DB5oOuM18jvQk9S7Qa7uu8WV5PzFbrlSQUDvUePnN6nTLoyhRd+A6/Gg1ay1Ja+u4
	TEbZM6e+g04KIs/kQI+QmnkEuE6t2UnRLPTjy29L2LLBZ9yOTOZ5YnXKJJC+9HK2srmB
	OKQg==
X-Gm-Message-State: AA+aEWYWR5cegVM4pQMV9hVvSwzr1t+C5o0n0gItfzp87gnfap9mWMJB
	FOqn7TPMeCRgzPHSz++o/m6/MWfzvUU=
X-Google-Smtp-Source: AFSGD/VPP5sekV5HaXkBXUM2TVltfP5L2BObY5u9k7xcIl9aC1m8pfAmJKpSG0x13K50j8NZ4s2YVg==
X-Received: by 2002:aa7:85d7:: with SMTP id z23mr30476284pfn.205.1546027446393;
	Fri, 28 Dec 2018 12:04:06 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net
	([2601:646:877f:9499:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	k186sm21923814pge.13.2018.12.28.12.04.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Dec 2018 12:04:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2018 12:03:49 -0800
Message-Id: <20181228200349.41303-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gcc: Fix riscv multilibs for OE way
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
X-List-Received-Date: Fri, 28 Dec 2018 20:04:06 -0000
Content-Transfer-Encoding: 8bit

In OE we do not build mutlib like gcc does it by default, this ensures
that mutlilib is virtually disabled for OE, since we hardly use same gcc
to build for multiple ABIs

This fixes cases in SDK where g++ is not able to find standard c++
include headers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-8.2.inc         |  1 +
 .../0043-riscv-Disable-multilib-for-OE.patch  | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.2/0043-riscv-Disable-multilib-for-OE.patch

diff --git a/meta/recipes-devtools/gcc/gcc-8.2.inc b/meta/recipes-devtools/gcc/gcc-8.2.inc
index b6568a046e..b21c605e81 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.2.inc
@@ -71,6 +71,7 @@ SRC_URI = "\
            file://0040-Re-introduce-spe-commandline-options.patch \
            file://0041-ARC-fix-spec-gen.patch \
            file://0042-powerpc-powerpc64-Add-support-for-musl-ldso.patch \
+           file://0043-riscv-Disable-multilib-for-OE.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0043-riscv-Disable-multilib-for-OE.patch b/meta/recipes-devtools/gcc/gcc-8.2/0043-riscv-Disable-multilib-for-OE.patch
new file mode 100644
index 0000000000..dc28d1bfd8
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.2/0043-riscv-Disable-multilib-for-OE.patch
@@ -0,0 +1,27 @@
+From ca0a6e035eef0cdbd0ef3a222c75d4b9f873c512 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 28 Dec 2018 09:59:53 -0800
+Subject: [PATCH 39/39] riscv: Disable multilib for OE
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config/riscv/t-linux | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/riscv/t-linux b/gcc/config/riscv/t-linux
+index 216d2776a18..e4d817621fc 100644
+--- a/gcc/config/riscv/t-linux
++++ b/gcc/config/riscv/t-linux
+@@ -1,3 +1,5 @@
+ # Only XLEN and ABI affect Linux multilib dir names, e.g. /lib32/ilp32d/
+-MULTILIB_DIRNAMES := $(patsubst rv32%,lib32,$(patsubst rv64%,lib64,$(MULTILIB_DIRNAMES)))
+-MULTILIB_OSDIRNAMES := $(patsubst lib%,../lib%,$(MULTILIB_DIRNAMES))
++#MULTILIB_DIRNAMES := $(patsubst rv32%,lib32,$(patsubst rv64%,lib64,$(MULTILIB_DIRNAMES)))
++MULTILIB_DIRNAMES := . .
++#MULTILIB_OSDIRNAMES := $(patsubst lib%,../lib%,$(MULTILIB_DIRNAMES))
++MULTILIB_OSDIRNAMES := ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
+-- 
+2.20.1
+
-- 
2.20.1


