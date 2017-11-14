Return-Path: <george.mccollister@gmail.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 667F1785C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 20:01:57 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id n134so6516741itg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 12:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VFgV1Cl1BEpmy1O6499i7qUs9Qbzv86Z2fM6Z6/AE2U=;
	b=Il25hBgldEkhvouLTg55bXsf/U9KA+Ljm5yqupvbOCNhQ453wrVejvQ7mvCKWWXw6I
	OzKdouZv4uj+fIWfMon2PGZC/jV+5aNnYQW3U9G1/S8W+dehX6KzuuVjUFEmwvn/iKl+
	twbAPHxCE0FI6/O0UJ19peSo3Qq23CqRWtY8JL275VaHwwAKJ0c1qo4pWtoRwXPXARyk
	aSo73muvnLor8TuzACdIg2yflzj5OaHEHZkS9WiwSMi07jRgPgSeJPZl+DUR2PSRzeMT
	YYbq3oOmQenH8gp/X0FZHAs7Qb+jqI4A1wNClu5ETU2JI+wZr/WTnMfFoILvF0INtdGR
	ssXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VFgV1Cl1BEpmy1O6499i7qUs9Qbzv86Z2fM6Z6/AE2U=;
	b=M8FOU3t/0630E7tQDHhy+znwio4CgtTBNyzn6RSF9VJp87C7+tEB8C5JKLGrYiIz1z
	NS0sXVEDzDcAypaK6fJtH3KqB05gekdzRwjlnZ9qdhjwXFpMC1s0TrLvyIutXXSvYtVn
	RsEShQUMafFO+uEZpnAQIdxX/uPsH45mCm0EhDQI5CyzzLsS4txOz0AKY/PPlX1ADYme
	7vNXeW2B8DFwriryru0KYr8v4SNbjTa0t2mhLLNmDE6NHKyBUhd/vtXRrI1LTwEewqoz
	0HyBB9YzI0u5hQy3JKiecmVjbXSb01qgyLumj/hyzX8T9zE+5hac8xx1/Qp5/I0kZRJO
	ULLA==
X-Gm-Message-State: AJaThX7kefCj1JgVncfEwrrcFKTd4EKNQNaeVHe5MLyIT0PblUlIcK8r
	U85ijLc3g/FmMd+851EMzHNo
X-Google-Smtp-Source: AGs4zMbMSVODYQKSSnPDm51WJ+oXFwqTK8g0bL3lB5MyPOvvFdxdSqEvhdPdgfuKeNT+sWr2y4aZcA==
X-Received: by 10.36.157.137 with SMTP id f131mr15010971itd.61.1510689718354; 
	Tue, 14 Nov 2017 12:01:58 -0800 (PST)
Received: from localhost.localdomain ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id x2sm3054754ite.24.2017.11.14.12.01.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Nov 2017 12:01:57 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 14:01:06 -0600
Message-Id: <20171114200106.18227-4-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114200106.18227-1-george.mccollister@gmail.com>
References: <20171114200106.18227-1-george.mccollister@gmail.com>
Subject: [morty][PATCH 4/4] zlib: Fix CVE-2016-9843
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
X-List-Received-Date: Tue, 14 Nov 2017 20:01:57 -0000

Add backported patch to fix CVE-2016-9843 which was fixed in zlib 1.2.9

https://nvd.nist.gov/vuln/detail/CVE-2016-9843

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 .../zlib/zlib-1.2.8/CVE-2016-9843.patch            | 55 ++++++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.8.bb               |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.8/CVE-2016-9843.patch

diff --git a/meta/recipes-core/zlib/zlib-1.2.8/CVE-2016-9843.patch b/meta/recipes-core/zlib/zlib-1.2.8/CVE-2016-9843.patch
new file mode 100644
index 0000000000..1ff8acf265
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib-1.2.8/CVE-2016-9843.patch
@@ -0,0 +1,55 @@
+commit d1d577490c15a0c6862473d7576352a9f18ef811
+Author: Mark Adler <madler@alumni.caltech.edu>
+Date:   Wed Sep 28 20:20:25 2016 -0700
+
+    Avoid pre-decrement of pointer in big-endian CRC calculation.
+    
+    There was a small optimization for PowerPCs to pre-increment a
+    pointer when accessing a word, instead of post-incrementing. This
+    required prefacing the loop with a decrement of the pointer,
+    possibly pointing before the object passed. This is not compliant
+    with the C standard, for which decrementing a pointer before its
+    allocated memory is undefined. When tested on a modern PowerPC
+    with a modern compiler, the optimization no longer has any effect.
+    Due to all that, and per the recommendation of a security audit of
+    the zlib code by Trail of Bits and TrustInSoft, in support of the
+    Mozilla Foundation, this "optimization" was removed, in order to
+    avoid the possibility of undefined behavior.
+
+Upstream-Status: Backport
+http://http.debian.net/debian/pool/main/z/zlib/zlib_1.2.8.dfsg-5.debian.tar.xz
+https://github.com/madler/zlib/commit/d1d577490c15a0c6862473d7576352a9f18ef811
+
+CVE: CVE-2016-9843
+
+Signed-off-by: George McCollister <george.mccollister@gmail.com>
+
+diff --git a/crc32.c b/crc32.c
+index 979a719..05733f4 100644
+--- a/crc32.c
++++ b/crc32.c
+@@ -278,7 +278,7 @@ local unsigned long crc32_little(crc, buf, len)
+ }
+ 
+ /* ========================================================================= */
+-#define DOBIG4 c ^= *++buf4; \
++#define DOBIG4 c ^= *buf4++; \
+         c = crc_table[4][c & 0xff] ^ crc_table[5][(c >> 8) & 0xff] ^ \
+             crc_table[6][(c >> 16) & 0xff] ^ crc_table[7][c >> 24]
+ #define DOBIG32 DOBIG4; DOBIG4; DOBIG4; DOBIG4; DOBIG4; DOBIG4; DOBIG4; DOBIG4
+@@ -300,7 +300,6 @@ local unsigned long crc32_big(crc, buf, len)
+     }
+ 
+     buf4 = (const z_crc_t FAR *)(const void FAR *)buf;
+-    buf4--;
+     while (len >= 32) {
+         DOBIG32;
+         len -= 32;
+@@ -309,7 +308,6 @@ local unsigned long crc32_big(crc, buf, len)
+         DOBIG4;
+         len -= 4;
+     }
+-    buf4++;
+     buf = (const unsigned char FAR *)buf4;
+ 
+     if (len) do {
diff --git a/meta/recipes-core/zlib/zlib_1.2.8.bb b/meta/recipes-core/zlib/zlib_1.2.8.bb
index eb38589b6a..338d0f9573 100644
--- a/meta/recipes-core/zlib/zlib_1.2.8.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.8.bb
@@ -13,6 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
            file://CVE-2016-9840.patch \
            file://CVE-2016-9841.patch \
            file://CVE-2016-9842.patch \
+           file://CVE-2016-9843.patch \
            file://run-ptest \
            "
 
-- 
2.15.0


