Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49239D2ED17
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 11:24:34 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4160.1768908270670495442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 03:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=d0riLOuG;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so33462895e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 03:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768908269; x=1769513069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPEcn3n9pZCwg+CuFT/EK68DS0Pl4FNwm2NbBmAVswM=;
        b=d0riLOuGIew9goQC4r53PRwW+WDWrq1i3Hiuh5MgSNONcDpxO3zt2S1DwlyzoUgeNq
         KTwju2KogU+kD0i/zgzA5HUXMcRvP2TOqtE9ugsM/wZFBSwtYN7ww3KY7Sgylw26uY5P
         erfmpGQ5Lm5ogxiBJg2ZYrBEncGga6nTjlWZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768908269; x=1769513069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pPEcn3n9pZCwg+CuFT/EK68DS0Pl4FNwm2NbBmAVswM=;
        b=npCm0ooxPXu4PyR7ZPE3ENk28/7+9ZIl/t4yLUfxE0lHnzXv9yHaOClCSw5qFBAykb
         +/P+Frgq/RsCiFj+MHS566L1J8vnIh8jnc8ea6mT86zx7mimw3JAIIvBZckdw/55OA/3
         SNbS+2lMUPUDO+XRJvIArtmaAeIhRahxNxfOdzzNsrQDE3eB+vMf5PthmEuQKu78IRf7
         Yxcu/QorW6P8GeVmn8mLVBrGEiKkZ5ZNaT8IJc9P6pHbnArDJ1lgjG/we/cYK/cAAAKl
         0beqBubjZkL9PMV29845+LybgaL+42AWF4+X6wVF348OXgBF3v9U1aXjO93skZuoUsJV
         riQQ==
X-Gm-Message-State: AOJu0Yx0q39c/hkN8MnAQq1rR82dBklVNBm3ii+2NxsV1Pb1bSRwYTwC
	ZKipHj1rnqsUzFlBMGUquIWV3jeC1YIdgByiMfnW/R2+mygDlA7GXtc8mCTIOAGyqGv6yPdzCVo
	qRGL5
X-Gm-Gg: AY/fxX61+Mhkr5yJUK0KZMy0TjaZb+QlxC8StamP/INRv/FsUAOuD6unawiJ4rJBjys
	m2pIsM1aZ+h9TZM5ovZvmU/YmiAtUbFNPFukorFZGWyjAYw7U0tjBrb6PkGuHZP03ZkzWeJggA0
	oy39Xs5cnOa4j8ecLicZJBiAJkyqej8pr2yG013RbdjXfd0M058S0EujO/v+mEZY5Xk/pqk+KMS
	AEAhOGjWFKuSoQH3xz/WNThU5/xpO+1Hqfa7jLu6kK5hz46s4Bd9G70aT9WAJhHlVAD+yITdWQW
	Vzv6Mx7ZiYQyAba9ojkfCHALESkaCH+oNar73XBZlG7PN1kIOC3f+UqxotBjxM2St0Un1IaINph
	QXBsbM17ccEVNhjQzzVxKquXKL1pqWCLkKLc5FDZOwtWOug3aArciaKmuHwOKCvC/QTnqfDWUxs
	aLk4RUSdOq5WpAN5LNhTHkf6hEXictZIaDYVq9sZCV31KV/1qLVn1k6q27t6jK2M/eAFJ+ugOOv
	yEk16OuHo/JVpn918eR1g==
X-Received: by 2002:a05:600c:414f:b0:480:20f1:7abd with SMTP id 5b1f17b1804b1-48020f17c12mr141500745e9.31.1768908268647;
        Tue, 20 Jan 2026 03:24:28 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921df9sm29558435f8f.3.2026.01.20.03.24.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:24:28 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 06/15] ffmpeg: add a (possible) build race fix
Date: Tue, 20 Jan 2026 12:23:51 +0100
Message-ID: <f7a10e2dd2cae4be6e5d18f239f4e6422bc2ffd7.1768906687.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768906687.git.yoann.congal@smile.fr>
References: <cover.1768906687.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229666

From: Alexander Kanavin <alex@linutronix.de>

There's been an intermittent build fail that looks like a race:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=16000

While I can't say for sure if this is fixing the issue,
there's no harm in adding a backport that rearranges the
faulty code, and someone can then try to add a real fix on top
of it. Or the race goes away and we're good.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9dbd2141b52b24421927d64cd74ec43f6085c4f2)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...s-Fix-double-build-by-disabling-.d-f.patch | 78 +++++++++++++++++++
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb  |  4 +-
 2 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-fftools-resources-Fix-double-build-by-disabling-.d-f.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-fftools-resources-Fix-double-build-by-disabling-.d-f.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-fftools-resources-Fix-double-build-by-disabling-.d-f.patch
new file mode 100644
index 0000000000..20009c1022
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-fftools-resources-Fix-double-build-by-disabling-.d-f.patch
@@ -0,0 +1,78 @@
+From a789ffae9de93eb70c355a81f9dd2ebf5d6b17a7 Mon Sep 17 00:00:00 2001
+From: softworkz <softworkz@hotmail.com>
+Date: Mon, 23 Jun 2025 14:56:19 +0200
+Subject: [PATCH] fftools/resources: Fix double-build by disabling .d file
+ generation
+
+Signed-off-by: softworkz <softworkz@hotmail.com>
+
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/f52d9dd8693bc4628520258f18f89b4a3bf85533]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ ffbuild/common.mak         |  6 ++----
+ fftools/Makefile           |  1 +
+ fftools/resources/Makefile | 12 +++++++++---
+ 3 files changed, 12 insertions(+), 7 deletions(-)
+
+diff --git a/ffbuild/common.mak b/ffbuild/common.mak
+index ddf4892..81e8a46 100644
+--- a/ffbuild/common.mak
++++ b/ffbuild/common.mak
+@@ -229,11 +229,9 @@ SKIPHEADERS += $(ARCH_HEADERS:%=$(ARCH)/%) $(SKIPHEADERS-)
+ SKIPHEADERS := $(SKIPHEADERS:%=$(SUBDIR)%)
+ HOBJS        = $(filter-out $(SKIPHEADERS:.h=.h.o),$(ALLHEADERS:.h=.h.o))
+ PTXOBJS      = $(filter %.ptx.o,$(OBJS))
+-RESOURCEOBJS = $(filter %.css.o %.html.o,$(OBJS))
+ $(HOBJS):     CCFLAGS += $(CFLAGS_HEADERS)
+ checkheaders: $(HOBJS)
+-.SECONDARY:   $(HOBJS:.o=.c) $(PTXOBJS:.o=.c) $(PTXOBJS:.o=.gz) $(PTXOBJS:.o=) $(RESOURCEOBJS:.o=.c) $(RESOURCEOBJS:%.css.o=%.css.min) $(RESOURCEOBJS:%.css.o=%.css.min.gz) $(RESOURCEOBJS:%.html.o=%.html.gz) $(RESOURCEOBJS:.o=)
+-
++.SECONDARY:   $(HOBJS:.o=.c) $(PTXOBJS:.o=.c) $(PTXOBJS:.o=.gz) $(PTXOBJS:.o=)
+ alltools: $(TOOLS)
+ 
+ $(HOSTOBJS): %.o: %.c
+@@ -252,7 +250,7 @@ $(TOOLOBJS): | tools
+ 
+ OUTDIRS := $(OUTDIRS) $(dir $(OBJS) $(HOBJS) $(HOSTOBJS) $(SHLIBOBJS) $(STLIBOBJS) $(TESTOBJS))
+ 
+-CLEANSUFFIXES     = *.d *.gcda *.gcno *.h.c *.ho *.map *.o *.objs *.pc *.ptx *.ptx.gz *.ptx.c *.ver *.version *.html.gz *.html.c *.css.gz *.css.c  *$(DEFAULT_X86ASMD).asm *~ *.ilk *.pdb
++CLEANSUFFIXES     = *.d *.gcda *.gcno *.h.c *.ho *.map *.o *.objs *.pc *.ptx *.ptx.gz *.ptx.c *.ver *.version *.html.gz *.html.c *.css.min.gz *.css.min *.css.c  *$(DEFAULT_X86ASMD).asm *~ *.ilk *.pdb
+ LIBSUFFIXES       = *.a *.lib *.so *.so.* *.dylib *.dll *.def *.dll.a
+ 
+ define RULES
+diff --git a/fftools/Makefile b/fftools/Makefile
+index b3c08ae..bdb44fc 100644
+--- a/fftools/Makefile
++++ b/fftools/Makefile
+@@ -36,6 +36,7 @@ OBJS-ffmpeg +=                  \
+     fftools/textformat/tw_buffer.o    \
+     fftools/textformat/tw_stdout.o    \
+     $(OBJS-resman)                    \
++    $(RESOBJS)                        \
+ 
+ OBJS-ffprobe +=                       \
+     fftools/textformat/avtextformat.o \
+diff --git a/fftools/resources/Makefile b/fftools/resources/Makefile
+index 8579a52..3c93648 100644
+--- a/fftools/resources/Makefile
++++ b/fftools/resources/Makefile
+@@ -4,10 +4,16 @@ clean::
+ vpath %.html $(SRC_PATH)
+ vpath %.css  $(SRC_PATH)
+ 
+-# Uncomment to prevent deletion during build
+-#.PRECIOUS: %.css.c %.css.min %.css.gz %.css.min.gz %.html.gz %.html.c
+-
+ OBJS-resman +=                     \
+     fftools/resources/resman.o     \
++
++
++RESOBJS +=                         \
+     fftools/resources/graph.html.o \
+     fftools/resources/graph.css.o  \
++
++
++$(RESOBJS): CCDEP       =
++$(RESOBJS): CC_DEPFLAGS =
++
++.SECONDARY: $(RESOBJS:.o=.gz) $(RESOBJS:.o=.c) $(RESOBJS:%.css.o=%.css.min) $(RESOBJS:%.css.o=%.css.min.gz) $(RESOBJS:%.html.o=%.html.gz) $(RESOBJS:.o=)
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
index ecaced7690..5e8d7bde55 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
@@ -22,7 +22,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                     "
 
-SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
+SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
+           file://0001-fftools-resources-Fix-double-build-by-disabling-.d-f.patch \
+           "
 
 SRC_URI[sha256sum] = "b2751fccb6cc4c77708113cd78b561059b6fa904b24162fa0be2d60273d27b8e"
 

