Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD06FD1F9D3
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 12:18:15 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42072.1764850687184989540
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 04:18:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MQvjnNUb;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4775ae77516so9536425e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 04:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764850685; x=1765455485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9sGLRv8w+4STJTkNtiQJlliWeHWuwFE6uIO4cH4/fuQ=;
        b=MQvjnNUbMVfknx9XKffd4ZdTI3gWMWANnYHtH1yd5Xm9dKqADzSiTLO0ITOTx8xLBs
         gMBFcOexCs++tIznnpgGa5GXJ2C6BgXmSU9SNMHjtdGLelmnIXrnBT0pbDvKFNsJS27+
         /JHKtPPo26TgLp3Ns54C0eVIRjUsz5Di2/8MRUoHaN5SaRnBy2VAyamE6pI71u45MlSE
         WN8JOZQ3Mx2pQL0Wuo+tBQhUqp+dEqdpjox6C2FToW0PtaMz8pfdqQ6vCsZg0Oacm1xc
         8yvgtDoELS1jswHuELv8ePfgF1pvnrMWfnUrdMXBN+VMOIHx722C71tmKtx8e6yTaZs3
         0lrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764850685; x=1765455485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sGLRv8w+4STJTkNtiQJlliWeHWuwFE6uIO4cH4/fuQ=;
        b=KMFfZsy4gAMaJ0drlNXjMaZwt8TJSIM7aMoRndv+flRltWY6nlEuX4KuHlGya8K+Zm
         ElznHdmuiSHjT6Ylzv85oLxb+Sij+9f67Lh9XOTGxeAn38WUPL7k9o5lAtavhY55hl0T
         Xu2lzl7PCnJ4y35qE86i5u6k09dZ6dPXtugVLK2qKUxL5hKPmzvnyRE1HRSralBPhvlS
         tD2rXy7627JjLVaciWyj9I9eltiuqU/Y4VhJTLpnJ1FOCMJcHWwopJIBVPWVz2jJ0HKv
         HQ42sVNKsP16BZoOtFqb1wZPOastA+KcyohdypfUqrV5RIWrewUuEGfpzs+PuDTmUwKk
         rufA==
X-Gm-Message-State: AOJu0Yw1ZoL8kxNLl0z9kUkr6PqR8azpje9hYxPwDhUC+XiXeNBzzaU8
	bhDQfyO2G3F7FDAaVOcudpXCSHUIluTdbhuZUggKHcYwgb9ooYU3/TV7SaSshg==
X-Gm-Gg: ASbGnctj4NC4WySYIPudR9mMOKIlBz/NrQsOIiKxl6GVz5bLZghc1ppx4Sdjo7ctoK1
	3RSwWc9FYIEWArbzaiIyxc5StVTLDchuHft+urkm8MY75UHysutJjTNGoJg4w8PYpxftTKx7FK4
	yLXsBzxvwxkph5FoHdmZPcB8Ojb5f/bFuLLd9pdoEa7g2ymvwGh3hLLDQ2rJklX+o8UwpyMkgt5
	+Oe1ITsxGD0YsLUx/2cJg7r+W53jKzpL499Qc5+J1iLRhGO6PviKrRF06YZxp3v31v96MDq5uB/
	0tVQnaj6N00wBDsHW/wJII2hWXf5+eu9VaKpm33z0QLDF1XM8mzcouUpEXouLx2eOYMvU2ylskT
	2eKbndhxqkdEhYuiOtAUnvVQLk3GrrWQe/BzuX6QarMhmUrx3eW2i9rH2ZiSOZ4ZzlAKxISWpfS
	ELX9yeiCyYIyguRskq+VqudTUor7kVEXRJQWJwYB+WjPqWPd0=
X-Google-Smtp-Source: AGHT+IEVZZbVummq2LYhjp1FSmj3baHeV7U/Ix7JfJYJiqXCTw98UoWsLieKDvgLcCFapKJEGfDMVA==
X-Received: by 2002:a05:600c:198f:b0:46e:1abc:1811 with SMTP id 5b1f17b1804b1-4792af3e17dmr58018355e9.27.1764850685186;
        Thu, 04 Dec 2025 04:18:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479311fbaf4sm25366625e9.15.2025.12.04.04.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 04:18:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] ffmpeg: add a (possible) build race fix
Date: Thu,  4 Dec 2025 13:18:00 +0100
Message-ID: <20251204121800.306162-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 12:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227288

From: Alexander Kanavin <alex@linutronix.de>

There's been an intermittent build fail that looks like a race:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=16000

While I can't say for sure if this is fixing the issue,
there's no harm in adding a backport that rearranges the
faulty code, and someone can then try to add a real fix on top
of it. Or the race goes away and we're good.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...s-Fix-double-build-by-disabling-.d-f.patch | 78 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb |  4 +-
 2 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-fftools-resources-Fix-double-build-by-disabling-.d-f.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-fftools-resources-Fix-double-build-by-disabling-.d-f.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-fftools-resources-Fix-double-build-by-disabling-.d-f.patch
new file mode 100644
index 00000000000..20009c1022b
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
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
index 76be2b04f8a..6187f4cabbb 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
@@ -22,7 +22,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                     "
 
-SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
+SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
+           file://0001-fftools-resources-Fix-double-build-by-disabling-.d-f.patch \
+           "
 
 SRC_URI[sha256sum] = "05ee0b03119b45c0bdb4df654b96802e909e0a752f72e4fe3794f487229e5a41"
 
-- 
2.47.3


