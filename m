Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 30CA57CB31
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 06:02:25 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id r124so13261537pgr.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 22:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wEkHFIciOzG9yk0AvBC0qcb/eAd+AwxzfgSzAMIT4hw=;
	b=BcjkZQkG66nwDsj0JDZGwIrIQgRWctus47FhdWxKQvkQ3cvfsSBsJNAwEQac5xA7Kt
	1q2EZwIJUlAhvvKbZgtjjA7W47Z9qqwwSMj5aE+r1ov4FqpDHOD7i9llU4ZcK0V939dA
	syIs7V04XJLZrkd6PCrIGgDZM3P3QDmjsoNVK2EiCOZ+s7nK8lcUNvC2BlSBKL/5BBxc
	KmPkyrXcFxDFGEdY8uVmgDdercSfK3gE88j3Tq0gzlnFrDl/j8C0g0NhLAv7TqIKh8ol
	IlL32eGQtSNCEjeoy0cvXgWssqzFyiUQ4pP+z2iLFnCw2uo+1JZetAwbUtPSnzGBmZFk
	L70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wEkHFIciOzG9yk0AvBC0qcb/eAd+AwxzfgSzAMIT4hw=;
	b=V2c3gaZP6Vx8P4SwzkUxcr99upNS2B5R18voW3bie0GLk6gZuWDBows/sB+e4YslO3
	Uudxikm7KUstmD1ngGCfT+d5nJEpDasjk1K0ZPc43kmiN76dtrVnOjp/USuXRy34Najq
	Pjprx6PKyA3435Uwb75jxUcjV2ukhmByUrjDV4qxEy25FBbY0ervAVioPixnm7TbkL1d
	jwQiC7uBA60DsmZv9pf2Q2K0p1Y/fIokZ0mY0yaqi3JUwlwILiUu6O5wLCS+To5fEUOs
	Kt1YvD4EEbYWZzvcUCnjQBGWMX3cMDoyphXP7P4Z/pydFvwPDwuxydoJYYYRO2w+uW//
	rY/g==
X-Gm-Message-State: APjAAAXm/HNi3P1byVEbTzgy0r5Vn110KhvXMY1gH0SkRs+STrlbpPVW
	i2kMrhI3WU6v6j3LenDHMsGBtPzC
X-Google-Smtp-Source: APXvYqzJK675wQR2yo59LrIkYNw+4wTOyF7uHCG74xx0umjzhWkzlQPRBXiIm4vg5rRXLqRvaLLgwQ==
X-Received: by 2002:a65:5281:: with SMTP id y1mr15409703pgp.59.1552024945030; 
	Thu, 07 Mar 2019 22:02:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id m3sm7851246pgp.85.2019.03.07.22.02.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Mar 2019 22:02:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Mar 2019 22:02:16 -0800
Message-Id: <20190308060216.21801-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] puzzles: Fix build with gcc9 on risc-v
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
X-List-Received-Date: Fri, 08 Mar 2019 06:02:25 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-string-lenght-parameter-to-be-size_.patch | 33 +++++++++++++++++++
 meta/recipes-sato/puzzles/puzzles_git.bb      |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-sato/puzzles/files/0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch

diff --git a/meta/recipes-sato/puzzles/files/0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch b/meta/recipes-sato/puzzles/files/0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch
new file mode 100644
index 0000000000..9ac62015d8
--- /dev/null
+++ b/meta/recipes-sato/puzzles/files/0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch
@@ -0,0 +1,33 @@
+From 035467aa0abfbc0de7e5d24543d4aab37301593c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Mar 2019 21:56:57 -0800
+Subject: [PATCH] pattern.c: Change string lenght parameter to be size_t in
+ do_row()
+
+This fixes below error on some architectures e.g. RISC-V
+
+pattern.c:455:9: error: 'memset' specified size between 18446744071562067968 and 18446744073709551615 exceeds maximum object size 9223372036854775807 [-Werror=stringop-overflow=]                                                                     455 |         memset(deduced, DOT, (size_t)len);                                                                                   |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pattern.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pattern.c b/pattern.c
+index 45b1b0c..f73a4c2 100644
+--- a/pattern.c
++++ b/pattern.c
+@@ -428,7 +428,7 @@ static int do_row(unsigned char *known, unsigned char *deduced,
+                   unsigned char *row,
+                   unsigned char *minpos_done, unsigned char *maxpos_done,
+ 		  unsigned char *minpos_ok, unsigned char *maxpos_ok,
+-                  unsigned char *start, int len, int step, int *data,
++                  unsigned char *start, size_t len, int step, int *data,
+ 		  unsigned int *changed
+ #ifdef STANDALONE_SOLVER
+ 		  , const char *rowcol, int index, int cluewid
+-- 
+2.21.0
+
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 7d08b964f8..0766bd4ff1 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            file://0001-Use-labs-instead-of-abs.patch \
            file://0001-palisade-Fix-warnings-with-clang-on-arm.patch \
            file://0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch \
+           file://0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.21.0


