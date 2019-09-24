Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id A87F87DDCC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 12:09:04 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n14so1647742wrw.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 05:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=/LtRlZ91FS4j6cu7FZdRfX97lCuMiTUvC3034f8CG5c=;
	b=vbZKkGzW1BWV6LB28bzsESjq++lEKk//SwUIOw+NoH8nlYJ/rJEZQIKlSg22zHrGwq
	VaQVRrwImJJEdXpsfF9HBJfAQCP3cRsMSqCOOCF9MKiYqjRmLgx3OIXBYFh0VAL8MSdb
	gPKMnp4ELeyn8rVSax9yKtrh4Clwgq9J4xhWGBjA++V2o5ZgRhw1lstjH6uQISw7Hmr9
	Dn6KmabRYfevrjcMv0w7qlnUNUV8g2Bhd4bsrQT31q++qZhvaZ2AJn9/fnUZdW79gvjB
	hTzHhQ+9ddgRzlMWiSPIUGEQZIcr5J26uAUMUR32hjbdhLiV9Ck9R4sC/LB59UojYOqS
	HFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/LtRlZ91FS4j6cu7FZdRfX97lCuMiTUvC3034f8CG5c=;
	b=CB5ulkofjlzcZlRb8kkm4yG+nFrUqsQU6nSmHLZUU497MfnIDw4rGb+s2bCY8S3mEZ
	Btsml4Z/WHxLx5QmI4TQkKvkqKpBzsh9uF12+EZdvFooKxn3ie3TJ/1yvTzEdJkEpZct
	71HBF2qXoJlAfz8uqcI1G7v/C3eXVk2GbMPlMPpkdwZQRbuc9YA8a20m+t6lxd/wm9zn
	YD5jfqM7W57X9kTxI+VEAwCOR+Nic5wo4JDt5/3JHJimDa9+2qKMoRN23z/9C/SadB5w
	id8gZ+g0InOuYjTOS9NEFq8pLkow3tWWGLcpF5vF6/v/0yikxNHqmr5huZvt73W2Bxt8
	GUMw==
X-Gm-Message-State: APjAAAUetb235R6A7E90Hi9fd7LfJyKaF5Sgh86yGjby5uxA/Iy6eD15
	Lc3qf220+9Dar20rCMffZsFqgQRd
X-Google-Smtp-Source: APXvYqw5Vk1+nT5vodnFDOCyTRtZvsdpP8cuDG1UKnUvnX7Ohf/ez8ArSn54sTfK/87yTpZkya/YtA==
X-Received: by 2002:a5d:4041:: with SMTP id w1mr1967041wrp.313.1569326944987; 
	Tue, 24 Sep 2019 05:09:04 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	q66sm3110466wme.39.2019.09.24.05.09.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 05:09:04 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2019 14:08:46 +0200
Message-Id: <20190924120848.25479-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190924120848.25479-1-schnitzeltony@gmail.com>
References: <20190924120848.25479-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [sumo][PATCH v2 2/4] bison: Fix build break with glibc 2.28
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
X-List-Received-Date: Tue, 24 Sep 2019 12:09:05 -0000
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

(From OE-Core rev: 741415c58b3565764000028c26efd081212eb989)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-devtools/bison/bison/gnulib.patch | 21 +++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.0.4.bb    |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-devtools/bison/bison/gnulib.patch

diff --git a/meta/recipes-devtools/bison/bison/gnulib.patch b/meta/recipes-devtools/bison/bison/gnulib.patch
new file mode 100644
index 00000000000..7eaf0ce0fa9
--- /dev/null
+++ b/meta/recipes-devtools/bison/bison/gnulib.patch
@@ -0,0 +1,21 @@
+Fix gnulib issues found with glibc 2.28 libio.h removal
+
+see
+https://lists.gnu.org/r/bug-gnulib/2018-03/msg00000.html
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: bison-3.0.4/lib/fseterr.c
+===================================================================
+--- bison-3.0.4.orig/lib/fseterr.c
++++ bison-3.0.4/lib/fseterr.c
+@@ -29,7 +29,7 @@ fseterr (FILE *fp)
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+   fp->_flags |= _IO_ERR_SEEN;
+ #elif defined __sferror || defined __DragonFly__ /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin */
+   fp_->_flags |= __SERR;
diff --git a/meta/recipes-devtools/bison/bison_3.0.4.bb b/meta/recipes-devtools/bison/bison_3.0.4.bb
index 58728f5021f..cc155f0fbe3 100644
--- a/meta/recipes-devtools/bison/bison_3.0.4.bb
+++ b/meta/recipes-devtools/bison/bison_3.0.4.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://dont-depend-on-help2man.patch.patch \
            file://0001-src-local.mk-fix-parallel-issue.patch \
            file://add-with-bisonlocaledir.patch \
+           file://gnulib.patch \
 "
 
 # No point in hardcoding path to m4, just use PATH
-- 
2.21.0


