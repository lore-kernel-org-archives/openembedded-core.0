Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB433CFB443
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 01:55:29 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.44004.1728266124573519516
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Oct 2024 18:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mxNzPmYX;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2e0a950e2f2so3253608a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Oct 2024 18:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1728266124; x=1728870924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRi4SFc6q2ESPrXh9cujzJd5e3qHsb6+OqH3541S1Vg=;
        b=mxNzPmYX4WDBund98vyTmQu1GTCMG4WWjXerEEGz2RLrERT7PhNek5CsJ6piQQ4WhK
         rsixb9+h/YZbuW/9iPr6DHN09HD4hHOwyjlYRGowEDEyMiq8IapFnUyVnMgR9dL2fLZY
         1lAJJrYL9v2VP9n1FBYH2XlipyIT/iHaAAbUBSnhUMcI8qslw6px4u03UX2TcJiJ2pHd
         05juGYT/tSnuUp1ljESA04i8L1kUZLg/9GRZNrkpcsNsobOLH2A6E2VbKi6bUpUFqb1V
         BV/aADaBPpZ+UqspIroGHwYPYdkB9ZClWI3O1LZ373FMulSJkhg/KYv8NYeL4vZLvPW/
         Z65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728266124; x=1728870924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRi4SFc6q2ESPrXh9cujzJd5e3qHsb6+OqH3541S1Vg=;
        b=TmkzhSg3i+QZAW5nFXRkje3c4MsuQmusdLq3FlUmxeRAO1Qq+z9xR8ZtxMmRSdwi2N
         bX0mgIi1W3+s8NLXqrNt1o5YdFlOgW1EyjeJR9RB4qttZlO+sf6ZAd38uZLj2Q8IGhLE
         SDJSQTUcjM0sy/i3m4CWkw4thi2VSvGccqjnVruwSi1kNDpkNaEmWHw9a1YvyDzrpPdd
         BGWn9QIHhj28zTDUQf4Y/qXBpiXjRGk4YwTVirFqBRmGM5zpQ9mlH150y5jCq4gGZiNe
         mVRn6Us2AyQB4f0B8AQ17MINJm4JwINENfiXc8B3XbPosbEsa10fN7oZcpNPgGSG9ROn
         MDvg==
X-Gm-Message-State: AOJu0Yynw7/Fd5s0t7A0+8XjnVWiFbBtQdAscucSoWSn0C3qKBtU4QFt
	VER/By/PB03si2HOV7yfl/as4BnSaraivIuwkpSMJdcw6k4bHhuFGG1DQKCgAyMPQKBQZTs2oxR
	TqCk=
X-Google-Smtp-Source: AGHT+IF1Nderqigr+HugB6KylXJvKRIZ1NLKNUrS6gnFxR7/1G9+ujVe1Rz0ZZ0kHY+dWM+mHLcIhw==
X-Received: by 2002:a17:90a:ad8e:b0:2e0:78a0:55c4 with SMTP id 98e67ed59e1d1-2e1e622723bmr12746989a91.9.1728266123722;
        Sun, 06 Oct 2024 18:55:23 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20aebb70asm4074938a91.19.2024.10.06.18.55.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 18:55:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/10] populate_sdk_base: inherit nopackages
Date: Sun,  6 Oct 2024 18:55:02 -0700
Message-Id: <2462cceaeec362d85a469ec0668ed92a092e725c.1728266000.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728266000.git.steve@sakoman.com>
References: <cover.1728266000.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 01:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205257

From: Martin Jansa <martin.jansa@gmail.com>

Since this bbclass sets PACKAGES = "", inherit the nopackages
class to skip the various packaging functions which wouldn't
do anything anyway.

This fixes errors from buildhistory changes where packages-split would be empty.

e.g. meta-toolchain build now fails with:
| DEBUG: Executing shell function buildhistory_list_pkg_files
| find: ".../meta-toolchain/1.0/packages-split/*": No such file or directory
| WARNING: exit code 1 from a shell command.
| DEBUG: Python function buildhistory_emit_pkghistory finished

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Atharva Nandanwar <atharvanandanwar@outlook.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index a103e7b738..5c738dbf2a 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -13,7 +13,7 @@ PACKAGES = ""
 # SDK processing context.  This class happens to be common to these usages.
 SPDX_MULTILIB_SSTATE_ARCHS = "${@all_multilib_tune_values(d, 'SSTATE_ARCHS')}"
 
-inherit image-postinst-intercepts image-artifact-names
+inherit image-postinst-intercepts image-artifact-names nopackages
 
 # Wildcards specifying complementary packages to install for every package that has been explicitly
 # installed into the rootfs
-- 
2.34.1


