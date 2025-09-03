Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2F7CA1014
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 16:15:23 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.17053.1756916114821171217
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 09:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bR1+KTe9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-772679eb358so83625b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 09:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756916114; x=1757520914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCfUA4Oq0F1irqTzSl3arSJ5g4+hMRJLQrYnEyptRVI=;
        b=bR1+KTe9ePATenFWUvUEpOOB5h5oGDEhiBzaztcaXJ7ireSkaC5uwQcBzDV4jISIEG
         8Lyn5ngFH3Mr0wm7h/vMNvhjvYrkz0nH/G2jaLmDBXjIlh2VK610EmUKOt8V0C6m4mnT
         3+6GAC+Augi0ldB4RMtfB+gqA2Y3sY1LvfQmws1A9l2b2ftnzCzATxXidU5to7EqcH8e
         vJTZhb1kYRwmx2uN8nV0cRB8wDGBBI5pZ/joN7ml+jvXzlgQd+tEVZ9Pwg4XtlMJtQr2
         bPuAGhpsayFdl27Xjg+GhVxBd2tiWs6mtohurmQYWgFK4DBhGM6HQxU2gMBd8uEHFNT/
         Kebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916114; x=1757520914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCfUA4Oq0F1irqTzSl3arSJ5g4+hMRJLQrYnEyptRVI=;
        b=DJB0DO1ZtB/HE/pVIpxet4DZtu36syl5ItirYBi2bzRzqPAk8iQnTvAkQRm0BG7WfY
         z/rcNfxCi9+uBdM7ERY9BabIaCJDktYx248eXNSs0kkkUrroNUHc+l/zCEL5f6Dx5GfZ
         b58VGme7okKnFTgCDLUfDjpK6gAK9bQ7i0Y8U0bDSZqyTS3GVAI+WdEhI4xnUvO/XCQd
         eEgc4WD6uJkoJ+uLrk4rDQ5JwVda72zLIVTh61AozsZhbBVXp2WPSQ008gnYxS76gjnp
         IrNtYuhte0sgDMJ9F518FHmrF4gXsXCIFzVf8dAnszpDann9RhG3XF58TOh57ysmeMax
         Q01Q==
X-Gm-Message-State: AOJu0Yxqau1zMbhFnawa4J+KfNGw9Nr4b52h6cc/idH73qlt6dhyAqUB
	6TSwh179h6+76+syo3BOaqopEtPWPTjmb/z9U2K3/NdlK75pC+7ZoxB7kteBvwN5/HNTZj3Ibuh
	0zTGO
X-Gm-Gg: ASbGncsK1ZgROf4HRk1wtukLvA218PTEEMXI97RNbWkFVLbD2+810QF+iLV2IKR0qcj
	P/xzaJvNO5j+BO/XC47yLMZD1tdOEmesuDT/TXRiQh2KQ63Iya/YhdhT2dGHeclkPicn0RVzg5T
	b0hrE8wSuZ8L6jdg0lhtjv/ktG0l0xjE0we4BImV2PYalosoqSgHmfzk8RLAfjcMF1t0sSRqRxX
	vWaFrr7pmtwp7UOQxdH+rV5+PCyvtyVJi+8QecGP3o/P524ejBJwnjQ8T3vFS8MxqnRZCFm/Cto
	W1rLkX3GxFfSzHh+6hO7vnT8GixKh0qhxvsi8Bj0M7Gd+sRO8f5UJvpXqgTzvlKEg4/CLopEeYQ
	WGLzzj388Z8qhuxqHPLUowmZq
X-Google-Smtp-Source: AGHT+IHMA+DISUNdlewX0BlZ3dJNQiZVh/DzAycM8Zj0E57ofCJWu/+MaFSUEJX8wsKQ5T/VCgVx8g==
X-Received: by 2002:a17:902:e750:b0:24b:12ce:48bd with SMTP id d9443c01a7336-24b12ce4946mr84578115ad.17.1756916113946;
        Wed, 03 Sep 2025 09:15:13 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:9ffe:4bb4:e2b3:4b1c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7724f079b88sm11027602b3a.40.2025.09.03.09.15.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:15:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/9] vim: not adjust script pathnames for native scripts either
Date: Wed,  3 Sep 2025 09:14:55 -0700
Message-ID: <671f8cec8ef463d75e9393c5fc03cf913ef9edf6.1756915922.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756915922.git.steve@sakoman.com>
References: <cover.1756915922.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 16:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222870

From: Mingli Yu <mingli.yu@windriver.com>

After the below commit introduced, the shebang size of native scripts
is also checked, so rework the patch to fix the gap.
377fe11bc0 insane.bbclass: Make do_qa_staging check shebangs

Fixes:
   ERROR: QA Issue: : /work/x86_64-linux/vim-native/9.0.0005-r0/sysroot-destdir/work/x86_64-linux/vim-native/9.0.0005-r0/recipe-sysroot-native/usr/share/vim/vim90/tools/mve.awk maximum shebang size exceeded, the maximum size is 128. [shebang-size]
   ERROR: QA Issue: : /work/x86_64-linux/vim-native/9.0.0005-r0/sysroot-destdir/work/x86_64-linux/vim-native/9.0.0005-r0/recipe-sysroot-native/usr/share/vim/vim90/tools/efm_perl.pl maximum shebang size exceeded, the maximum size is 128. [shebang-size]

(From OE-Core rev: 79232458b9cdc741a2049d83839af73f58a5554c)

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../vim/files/no-path-adjust.patch            | 35 +++++++++++--------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-support/vim/files/no-path-adjust.patch b/meta/recipes-support/vim/files/no-path-adjust.patch
index 9d6da80913..908459a95e 100644
--- a/meta/recipes-support/vim/files/no-path-adjust.patch
+++ b/meta/recipes-support/vim/files/no-path-adjust.patch
@@ -1,4 +1,7 @@
-vim: do not adjust script pathnames
+From 4125a1ccb82fd53d003acdc34e462f238f0c4f0d Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Fri, 8 Jul 2022 11:03:22 +0800
+Subject: [PATCH] vim: do not adjust script pathnames
 
 When cross-compiling, we do not want to reference the host versions of
 things like perl and awk.
@@ -6,24 +9,28 @@ things like perl and awk.
 Upstream-Status: Pending
 
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/Makefile | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
 
-Index: git/src/Makefile
-===================================================================
---- git.orig/src/Makefile
-+++ git/src/Makefile
-@@ -2565,11 +2565,14 @@ installtools: $(TOOLS) $(DESTDIR)$(exec_
+diff --git a/src/Makefile b/src/Makefile
+index c9513a632..7a7cbdc43 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -2534,11 +2534,7 @@ installtools: $(TOOLS) $(DESTDIR)$(exec_prefix) $(DEST_BIN) \
  		 rm -rf $$cvs; \
  	      fi
  	-chmod $(FILEMOD) $(DEST_TOOLS)/*
 -# replace the path in some tools
-+
-+# replace the path in some tools, but not when cross-compiling
-+ifneq ($(CROSS_COMPILING),1)
- 	perlpath=`./which.sh perl` && sed -e "s+/usr/bin/perl+$$perlpath+" $(TOOLSSOURCE)/efm_perl.pl >$(DEST_TOOLS)/efm_perl.pl
- 	awkpath=`./which.sh nawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
- 		awkpath=`./which.sh gawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
- 		awkpath=`./which.sh awk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; fi; fi
-+endif
+-	perlpath=`./which.sh perl` && sed -e "s+/usr/bin/perl+$$perlpath+" $(TOOLSSOURCE)/efm_perl.pl >$(DEST_TOOLS)/efm_perl.pl
+-	awkpath=`./which.sh nawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
+-		awkpath=`./which.sh gawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
+-		awkpath=`./which.sh awk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; fi; fi
++# not replace the path in some tools
  	-chmod $(SCRIPTMOD) `grep -l "^#!" $(DEST_TOOLS)/*`
  
  # install the language specific files for tools, if they were unpacked
+-- 
+2.25.1
+
-- 
2.43.0


