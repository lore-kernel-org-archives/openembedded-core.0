Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A95C0218B
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 17:51:35 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.42136.1737395491318681417
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 09:51:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=im7MRGaU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2166651f752so109922535ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 09:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737395490; x=1738000290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9h+9MmWp3+oZwmNNf3Zs/xibifjh0JVNklscZp8XifU=;
        b=im7MRGaUAKa2aiBOXkgKgv7XfwVVlinK76n59ukB5/T5UqGhw7b5m0WZgslL07NDq9
         iCcYnSjvBjxe3kROefUSn1ANgvU1QSA4/Sm8CmQznnrhnDGizx3JRVyiBl1t+TaESbEZ
         oodPa0ausyfhW8up2W5i8Q0ZgN1fADmIDg6oW2fLvVDZ8OSsTD1b220n5FtLo1IJOONL
         OeEjEHeKcFNHXFFp0ZShYzmhnkKgGZMgA/EZOn3DpfqqG0bCRlXp6WlEQ899FNn/qQ4L
         OmA7n7X00OwH9txnuHGUuymX3HOcfTKWDuFfjHzqziEW/qSznyCoWqIK9QUUi10ig8VE
         lijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737395490; x=1738000290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9h+9MmWp3+oZwmNNf3Zs/xibifjh0JVNklscZp8XifU=;
        b=rkgFWP7kAQA1TtX8Szd4OK8ZnCc5c/Er0wTGciEd0ZZDWzWoLFutHv1z+3+AC9VyeG
         1rU/tiK9JOri70v2fa8Fr9vJGnz1H4dPKLWlbtTG3nq9T0JDLqK9+NqAL84iAGGAAD1t
         xFxETd5m84st9HdeiYWMTJ3G2aQldNJM5jCJHA3CJkzbRw1xQ8jeumI9eDCBkIsyXrki
         Nb+QZCAEUkYaatDOWAIePskC7oaO9F1eLGXrk+4IjH14U+4MBKP6ocQrrUHR/azEt4Lz
         7HAxGFwQKr5HQu0HcRgXUsXkAfBTbX0LvgiHiG9wEca8QBLKeK8weEEc1m0L1Epsi2g2
         KPwQ==
X-Gm-Message-State: AOJu0YyPmNQwtCtj0PZWcRnzVoC5UksLkA82kMLDPpswteo9J4ovCpCa
	YkQNgACCSQGyeupKBzpPF4vnsJHCqM5Ff/a7z/PJe4dJznLu4/qygk3DLh21amFAcNGGdndz8Hz
	owEM=
X-Gm-Gg: ASbGncuYfzzfJjAIhZgZJL6Q0eIHd+igoCL2ZYaSl7PwTEpnhMSB5gZb+L7nFwjWX/L
	zL69smMUp9NsXoue8d+1hfSf4uSteA+j1HG6fIopleuklVRNM3qgTnP/D+VaNI8oYNF3MzGYzvY
	ypVeiIsgsPbmgZhbipAIE2s2dDK7+RAxja6j0y6771Bis30yZB3TLKzFWb/GhN34/he5Lr2npYT
	nsSeOXeVNbIRM05QBNfJyUHRPv0ZwCw+Xy1pvaBcLcauQ06oVtuCo3DOu0=
X-Google-Smtp-Source: AGHT+IEnMbnXwBqGBsSDtkDeWtMTzmy1IlTWRBKuDMe3IB1qxmlXX/RlqqdNh/NXLM2j5I2NXtQC7g==
X-Received: by 2002:a05:6a21:9990:b0:1e3:e836:8aea with SMTP id adf61e73a8af0-1eb2147cfafmr21773045637.14.1737395490654;
        Mon, 20 Jan 2025 09:51:30 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcdcf643esm6155565a12.38.2025.01.20.09.51.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:51:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/16] classes/nativesdk: also override TUNE_PKGARCH
Date: Mon, 20 Jan 2025 09:50:59 -0800
Message-ID: <38b4992329459f2200817a848e8888b9284b4917.1737395091.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737395091.git.steve@sakoman.com>
References: <cover.1737395091.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 17:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210059

From: Ross Burton <ross.burton@arm.com>

The nativesdk class overrides PACKAGE_ARCH and unsets TUNE_FEATURES, but
as recipes might want to look at TUNE_PKGARCH too (for example, when
setting QEMU_EXTRAOPTIONS) we should also override that variable.

Otherwise, a nativesdk recipe will have the TUNE_PKGARCH of the target,
which leads to errors (eg passing mips arguments to an arm qemu).

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 05322beb290e1db30bef49b4364f8a8e6e9f7408)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/nativesdk.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index e46739e325..39bd5a7224 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -23,6 +23,7 @@ RECIPE_SYSROOT = "${WORKDIR}/recipe-sysroot"
 #
 PACKAGE_ARCH = "${SDK_ARCH}-${SDKPKGSUFFIX}"
 PACKAGE_ARCHS = "${SDK_PACKAGE_ARCHS}"
+TUNE_PKGARCH = "${SDK_ARCH}"
 
 #
 # We need chrpath >= 0.14 to ensure we can deal with 32 and 64 bit
-- 
2.43.0


