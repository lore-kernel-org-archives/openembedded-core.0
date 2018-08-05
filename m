Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 23348783DE
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Aug 2018 02:07:17 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id i26-v6so5122886pfo.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Aug 2018 19:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=miJVhpZn7mpqXvQYQrSoFayAv9wVbUCM7NawS+nmzsc=;
	b=aRvN+g7Tk9F7TDjWTOOkrZ61McvzDBO2m9HO4CFA7zmb1y9a9CStm6JNSiMoF+3fBg
	40zv3TyYgI51vvlcuqZYZrvhuymQCZfR3t+sSRm+KSN9ylrgb/1QYIuJ8z9bRjQRGmkY
	IZqizmK+fk4NW2LdIKuJ+xukB47nwZz8R89K76VJisNg4Frr5IVzjaDLvMJV8PjHwq/R
	sWkSPAuiz7zNL8b/95rKbeRDgcw/y0dS7CtaziZLFZu/kyCuOMdTGzqarIc7I6KYSj94
	77Vf4r/0WUtbsKkeluifYPRiytOWgPLRAzKjGvGMdGG6Ogd+noJmqEQ8huBpShp5vZOb
	K0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=miJVhpZn7mpqXvQYQrSoFayAv9wVbUCM7NawS+nmzsc=;
	b=qzYpZzxigh4G99lwL78gGtkr2ZCO/D+xz/gR9/WkIyNGKzQHd7mJ7qWhNAG+GmLIjE
	Pxt9/lYMWjtZucSYsmASj7OUl9j2InCPqJB1mnkpM2397eNMd7lnQnXwm5XLu5qXsTNM
	ddVHE/ypRsjyerG4qLNGSLUR3jEsg15NTUGdNbGLJfV5kIsIfJTZPv2K7ZkDRqyBx9Te
	W8DPQieuVwHMqjUNzAW85fBnqRi+pt1bCKcjDYYOIu0agL5IhfZKG8vdLKVYtAwZ0I/P
	rKZ4l59AOPhZuHeW6plG6OOXzp6ex8hGMs/gefIta423lRiYen0owBUShuOpp4sfIKDU
	yiyw==
X-Gm-Message-State: AOUpUlE/VjQamnwbSA9+rY7kUqcZcRyDfguAFUqQGf3spIIz/iu2LQLW
	Tw2eZgDbN7OeVvZ4k5CwOEpMhCfz
X-Google-Smtp-Source: AAOMgpeE1RkAnO6uRrox+W08EO6h0QgkPK8K1LSaHq5ikXxurgcX4BbgACnZaUHOv/ISGv3nq7s5nw==
X-Received: by 2002:a63:d54e:: with SMTP id
	v14-v6mr9577970pgi.264.1533434837991; 
	Sat, 04 Aug 2018 19:07:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::5b3b])
	by smtp.gmail.com with ESMTPSA id
	b195-v6sm4486021pfb.2.2018.08.04.19.07.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Aug 2018 19:07:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Aug 2018 19:06:59 -0700
Message-Id: <38e273d10cb57c980c8216b0c7862313741e20f0.1533434674.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533434674.git.raj.khem@gmail.com>
References: <cover.1533434674.git.raj.khem@gmail.com>
Subject: [PATCH 07/10] bison: Fix build break with glibc 2.28
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
X-List-Received-Date: Sun, 05 Aug 2018 02:07:17 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/bison/bison/gnulib.patch | 21 +++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.0.4.bb    |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-devtools/bison/bison/gnulib.patch

diff --git a/meta/recipes-devtools/bison/bison/gnulib.patch b/meta/recipes-devtools/bison/bison/gnulib.patch
new file mode 100644
index 0000000000..7eaf0ce0fa
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
index 58728f5021..cc155f0fbe 100644
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
2.18.0


