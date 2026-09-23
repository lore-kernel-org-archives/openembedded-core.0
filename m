Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A45EC98307
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:12:16 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2938.1790154726897643437
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lMa3lS2A;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dc83so544359f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154725; x=1790759525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R+IjiI8FhWPZ4XaKKtCK9i5jcoOkkIztEiwwMzAs8H8=;
        b=lMa3lS2AUkliL7x4esbuspW4r4O0HGgHBXaKaN9K/hSgqPYAX4iPLTKJACpMmrZnHx
         RS0/7QrBnclFdTaCb7ldoqNhloHVAOkSsogGxkRtvrJw34Z/TWgu4jezeKBuDsLVznSB
         TGJIljUXZRE7ZWCb3oG0iD8V4i4FMFpA5rKj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154725; x=1790759525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=R+IjiI8FhWPZ4XaKKtCK9i5jcoOkkIztEiwwMzAs8H8=;
        b=bhoC8fOaGnaziEqhiiwO38b0VNQNsiD+2YGBDU0drKjFRNFG1F/z0IupWF7gXVjtT5
         VM248KABxpXPsaRQFbCPdrSMuEUvVjcOMGtc9aZBs61rhZL2smXjELy6KWQDmgAHAA9Z
         LKjhxMwEo0vaqlrp28MPcU5ahlkfqx5C1uGAPOFTrX5ETw5IadRzCOKQakP2OIeEI4m6
         xLyfiehvEjR4OQO99jtu2xffphJ+kYHykA1po6g8ju7ZAI9WDj3/xn+8UiGUZG8Utap2
         xrOgPO5LsIPd8Ak8kCjCgqt3PMep7SjN1AI6rYfJX9GudHE4Qss6CXrPpu6FT1ZbFLtE
         WeAQ==
X-Gm-Message-State: AFuF++ladMFlgo0qha8ADcrhKKGvvYDo4w5AeLeIgxk/H9IT3aKctUJ8
	QmRhwLKVNQYVlfR6vOe72aZQf7+Tie22ROV43SdjlMlGeJ2gIHW41NgVMt3bHI37ZLWmhuZWS9a
	4qjr56KE=
X-Gm-Gg: AYBFou2jwgnpBtTNqr8+boxfVGPzg8yb1xiWKMT0l/4XzFnaz7Z7US7a61GTzYHa99+
	pv0HQhqlTPAWr5qlS2hHLN1xLF9InN65p8lS4czIVgLWV+5XDM51AbdToEhzhunw9w8SvkLuewx
	UTniDPTX3TWzZeKQUvFFd4u1pjTuz6//lHiBAJzZ+5Ln57NeADRcYzHPXz88TTZd5OQHNpKWGXg
	yUrE/kA+wCWT0V8Iq0001gdHK3udkp3X4L2yVnnZ9HsEdtNOqB7wy1hBR0+kiUk89G0Dm3C3sXy
	fjhTHXaZVJhme3nrBFKcOW7gS2JdsMn7xdk1/sGaUUlLuy3a/Vu5T1CH5e9gDevNoQNm1AZGGBv
	iw/LDrAiYF6DHYTAWWBsLPrSBwBYIFKaMVzsgy7Je5rZJUNzrUjvHAJ0lzi77X3llUGR2C8Xm9N
	Al+NvFSnWPREKVu0jtZbO6A1XWFc5uJ/3ERiQb1nphFDz6dTgGnqBVfYjix8hBXfnUxlI85bsBV
	Kb2I0/4dNUtR/2UEXmo0sQh0i8gsTq7orsF4RIbn5jBNVqpsufO3+zTOfTDdoL9ITPZgqRl
X-Received: by 2002:a05:600c:3ba3:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-49fdf2512b9mr31099605e9.31.1790154725084;
        Wed, 23 Sep 2026 02:12:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.12.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:12:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 38/48] pseudo: Update to 1.9.10
Date: Wed, 23 Sep 2026 11:10:40 +0200
Message-ID: <fc1a18d4da57dcee29861b3b5efd1924541ac71a.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246500

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in various important fixes:

Makefile.in: Bump to 1.9.10
test: various: Move to makefile compilation
test-bash-exec-env: Add bash env test case
test/test-openat2-func.c: Remove unusuaed saved_errno
pseudo_util.c: strchr now returns const char
pseudo_client: remove the unused pseudo_prefix_dir_fd
pseudo_client: step around all of pseudo's own fds in closefrom
pseudo_client: step fully past pseudo's own fds when computing startfd
makewrappers: Avoid efault workaround if using AT_EMPTY_PATH
ports/linux/guts: Add __open64_2 wrapper
Makefile.in: Bump to 1.9.9

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4232a7cc5fa28828fdf3223b3c0a6432c8c1e670)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 7b1177f7970..22d9006f797 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,9 +12,9 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "ca47829825f297d7bf83665c0541a9de4aa78009"
+SRCREV = "2a5521e9573049864e07907415f1fee28232d90c"
 S = "${WORKDIR}/git"
-PV = "1.9.8+git"
+PV = "1.9.10"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

