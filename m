Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id B04127E588
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 10:59:41 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id i16so1718619wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 03:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=/LtRlZ91FS4j6cu7FZdRfX97lCuMiTUvC3034f8CG5c=;
	b=OumOEgd4mzsVoj6CXwfGBGBBwicHQcqHr8k5TWjPBpO75Y9rC/WTfzvIKR5aFMYXRD
	hNgnaOO613newQXSTwAKlIuUuFSOUEOeBpeEutP4+/mSxZn5HdyvKBdlJ1aYcWNv7t5h
	PGvA6GbOaj1MPkOdSsqwxuHfxRmKCGKHNYujsrAItY3Yzhx9nO2YuNOra6AaH7rv+yN8
	TxQ4Q4KkoyCqSlbyh2N/mg+dJIE9Zwhbnbiq1P0DRM9yjlUsOjucfsxAYXOzviA5pSNT
	885m+py3tP9F6QnCZ4kUzO4Twpu4bNi0+Yk0hdne2IXoyL1KiDB6A3LwWh4ou1pbQJRm
	ghXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/LtRlZ91FS4j6cu7FZdRfX97lCuMiTUvC3034f8CG5c=;
	b=b+3KmAAOeZJORi8PXfpQ6PSGF7RT8DJGerHOeJbYIRbwiziQV4NYuy/lKvhEiUNEBf
	DhZUp+cKBUzgLzz6M2LNU35qhIqe/wRdKnJN1rMhWkwNQxHm4Boq5lc1Jl6ZQgp8JX1V
	cCA/lV0LwOQJ9M/QCSuXEzfmnmF7N2ZYqG18npdT+iXR3uX8J4F+9fJMbthCdEha/zbJ
	76sxQrje7Y/xbsUEfwC+82OaJczpR5Q+ZTIDFFddnW9NFvfBUJB0GNkg15vQtOixhT3g
	hNpRoWB5D/RyKeqk2hR8Fv1sb0+/tAuSYqRN7LWi2eSxjf0EJko1CIlQMQoU/d9LZ2DS
	51Lg==
X-Gm-Message-State: APjAAAVos7H4hAcEwpc+iH6OSNSUNdoaeM+g27RL8MUat5CON8BZq3i9
	IycmFvJVz/QwJqzsUVMuyWd5B8tz
X-Google-Smtp-Source: APXvYqxMxTuIV/rNBt9wfzO+gtoPCMZzIAbHOHmRJw9ZDhxh70oNNKPVNe85K2M64heOKkVG9KnXBA==
X-Received: by 2002:a7b:ce91:: with SMTP id q17mr2154091wmj.25.1569322782170; 
	Tue, 24 Sep 2019 03:59:42 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id n7sm1943753wrt.59.2019.09.24.03.59.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 03:59:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2019 12:59:23 +0200
Message-Id: <20190924105925.2287-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190924105925.2287-1-schnitzeltony@gmail.com>
References: <20190924105925.2287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [sumo][PATCH 2/4] bison: Fix build break with glibc 2.28
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
X-List-Received-Date: Tue, 24 Sep 2019 10:59:42 -0000
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


