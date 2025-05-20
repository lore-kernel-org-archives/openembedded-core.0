Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551A2C54E93
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 19:48:34 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.414.1747770508583005826
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 12:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=B2jLwvYT;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so5842099a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 12:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747770508; x=1748375308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4jbQfIQvK/27IlmEDKuPj/J3baH7fZ1+PiOQfiDprjo=;
        b=B2jLwvYTNCvL0dxy/e3kydy84toJklGVjo358rgekTmqgVHXTaI9As9Gobg9VaLmw9
         hWKt/2YN7dbJFibDrfzXG7AHmcyOJUVkCwXTsvqekjgss3zuhfnWvRvnwqd8L7zsukwe
         NTjjxoJRD2RMDR/vBfzWcvou2igcnEiiJuuYPJMsgmHnly9lnUCMoz5EMD///VSCMIbT
         amaFVykwVpf0oiATkdIyfq8951y9YbWooTwXU/4Kn+rvo/eaca+e5x6l/X4Gc1UycGef
         sc8sGjMaXhYpEuEuxPzlcT+XqSaTVrj7qijcuLwRtcBlk5eXzpAM0gorVGOuU8XtpRO0
         Byzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770508; x=1748375308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jbQfIQvK/27IlmEDKuPj/J3baH7fZ1+PiOQfiDprjo=;
        b=UNM07v1S+5VlYImzEoDjSJ1EeYBxWBfJw9LbUYx+U+ageMdZd0z5w5n1inozYVyvku
         hXbsnbmiX8N83cWW9BfSkwcP/Y9Utx32NxGycoyn9gXfpeH1SF4JsN4Vy5xl7g+zhiBI
         e+klwvARlMiYpiSkS+4GhHCd8klwRJt+RZ3nv5QlcdAiw7pbI34QCSIUl9I8qFL4Xa7c
         lHzgydIQkpYu5akfacRH7LkRRcHoJLKltT9uAr3MfJ5nsblGggqreGK4qS1JOZVXRaUK
         t26PfIMCqhTTIBJoWMVBXhiYA43Q6P8iPNUf6Gw4v/iCy2ZwasN1kOkNTAY950jAuqs2
         JqfA==
X-Gm-Message-State: AOJu0Yw0+YsfH4C3yXgJWLsJemkHz+ZBW6IxrckM9FxwqVWd+bnVYEyP
	uQlu/mnDx/zn2bYd3g5oNKiUe4DFRAftOic85/jFymSG4Ddvab9ssLI5iMnK9vNZ39Y+NEWhKfZ
	3CsuL
X-Gm-Gg: ASbGncs+SxiMqPjuDtDVBBRW7EcVwhq8I5J5UyVfMLx04Txu+SYMHdX9P8pc4ut0Cfb
	r9NCFVcqPaXHSULUVLw0ZERMjXk7d+xVE29pz2ReUzB0u6nargOQl7Nam34B65FKxl4FAo9QQTp
	GX5PVP/IGge/x9TeGIWsWiS9+k4Su/8VvcTkW9Jh/oHyQxitqn8gwJPtwhoNOQYopSD1rPBcF5L
	jalnZLou6RYCVI4qiNrNU95VvXlM6d2NaCKZphNbKK5fVIM7qiKbvcu+Wl5JHyVIFFgizsNFEmw
	0cTFeOuHaK7pWtII4lY9pWGmnyab+FYIes+gzhjqSA==
X-Google-Smtp-Source: AGHT+IHIG6umBpVFtgfZaiT9KFOZZ8GJjzmjGwDb61Y0tf/t4/7bt7qUxrWA+oxmFXsUMlv/npdB/A==
X-Received: by 2002:a17:90b:1f8c:b0:2ee:c2b5:97a0 with SMTP id 98e67ed59e1d1-30e7d5b70b3mr27912161a91.25.1747770507811;
        Tue, 20 May 2025 12:48:27 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:48df:296e:5350:93e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36386944sm2120772a91.14.2025.05.20.12.48.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:48:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 3/8] makedumpfile: upgrade 1.7.6 -> 1.7.7
Date: Tue, 20 May 2025 12:48:10 -0700
Message-ID: <97cfd5d798c92d1906be4e1048408a48660b1f63.1747770224.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747770224.git.steve@sakoman.com>
References: <cover.1747770224.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 19:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216936

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:
https://github.com/makedumpfile/makedumpfile/releases/tag/1.7.7

This version supports the following new kernels:
  - 6.12, 6.13, 6.14

Drop backport patch.

(From OE-Core rev: 364e15aadcbb3ac754c2c484f7920420b4cb3138)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-compiling-error-too-many-arguments-.patch | 43 -------------------
 ...umpfile_1.7.6.bb => makedumpfile_1.7.7.bb} |  3 +-
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch
 rename meta/recipes-kernel/makedumpfile/{makedumpfile_1.7.6.bb => makedumpfile_1.7.7.bb} (92%)

diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch
deleted file mode 100644
index 90f1b4038b..0000000000
--- a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 73e62a08022bf8e5edad250f8c1452f0be3771a3 Mon Sep 17 00:00:00 2001
-From: Coiby Xu <coxu@redhat.com>
-Date: Thu, 23 Jan 2025 17:47:10 +0800
-Subject: [PATCH] [PATCH] fix gcc-15 compiling error: too many arguments to function eppic_init
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2340813
-
-When building makekdumpfile against gcc-15, the following error is
-shown,
-
-    erase_info.c: In function ‘process_eppic_file’:
-    erase_info.c:2226:13: error: too many arguments to function ‘eppic_init’; expected 0, have 1
-     2226 |         if (eppic_init(&eppic_cb)) {
-          |             ^~~~~~~~~~ ~~~~~~~~~
-    make: *** [Makefile:109: erase_info.o] Error 1
-
-Upstream-Status: Backport [https://github.com/makedumpfile/makedumpfile/commit/73e62a08022bf8e5edad250f8c1452f0be3771a3]
-
-Signed-off-by: Coiby Xu <coxu@redhat.com>
-Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
----
- erase_info.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/erase_info.c b/erase_info.c
-index cbe1681..af6bfae 100644
---- a/erase_info.c
-+++ b/erase_info.c
-@@ -2192,7 +2192,7 @@ process_eppic_file(char *name_config)
- {
- 	void *handle;
- 	void (*eppic_load)(char *), (*eppic_unload)(char *);
--	int (*eppic_init)();
-+	int (*eppic_init)(struct call_back *);
- 
- 	/*
- 	 * Dynamically load the eppic_makedumpfile.so library.
--- 
-2.48.1
-
diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb
similarity index 92%
rename from meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
rename to meta/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb
index 46be13e7d0..23fcef9569 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 LICENSE = "GPL-2.0-only"
 
 SRCBRANCH ?= "master"
-SRCREV = "97a89484e2c960dd64933e1cea7a7248138f8a76"
+SRCREV = "e4ae6b5ee04edeeb03db89bee372904157e3378d"
 
 DEPENDS = "bzip2 zlib elfutils xz"
 RDEPENDS:${PN}-tools = "perl ${PN}"
@@ -26,7 +26,6 @@ FILES:${PN}-tools = "${bindir}/*.pl"
 SRC_URI = "\
     git://github.com/makedumpfile/makedumpfile;branch=${SRCBRANCH};protocol=https \
     file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
-    file://0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.43.0


