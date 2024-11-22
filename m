Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4940E6919F
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 21:27:08 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.35415.1732310826313014158
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 13:27:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rmyBPhEB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-724d8422f37so1791780b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732310825; x=1732915625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PR7F7XTsh9EYwx+6XSEGfF16KAwGmVjEKrYXOk1ZuZw=;
        b=rmyBPhEB5Ed4DQJZ/RWg0xpV5IBxB7sP0oyiuVMCFAxeNyXixKR930zRWUHTMHRjdg
         nJ4sHfJeyB+4FkqP8demjNIfo6v8P3XzyUmNVNekRAj6DEE5cX50R6D2/kU9INbtt8aA
         OuBJy9IfZSpgX1iR6QLFiNpCSjKvPJEc44pOTUBA/luDDO51NSy52XhNglg16JT/VjuS
         NmhNRMjgZlC26reAdiL0S2F82FGTZozTELpLGe9tB1XXpa+bellXkRZsLN4Op2g85wd/
         STPPGLJ3Sp/up+GfQdtl7rklD3dIpQYCFbQ2o3ONlb/grmEMBfXuOz7bb3iIGO7iOAzV
         w/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732310825; x=1732915625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PR7F7XTsh9EYwx+6XSEGfF16KAwGmVjEKrYXOk1ZuZw=;
        b=gRUgCW1kHzw954AEnpjxTjZOAw2zpc7JjQRGvm/wgoq/S990J3xX330gWUVGz0wrUV
         I3zPQ1Lll4PInr2ThE1nWBXBaFCrOYushkViDFkkNkRbF9Vt3XNJ8OyD8oSc8ohgqbjd
         tzj5Y2NfcEtZBUGNo/SilvlROSDvRQi1UgO47FW7WfCHXM6cAO05jBpM3t2f854gM6PZ
         eeX0XOTXmdye7Sc6duZfQDejKhqCcvOxo6nlJNPleZiR5wdRh71qxFInKnpY5zFfYwi1
         fg4T/UejNYVvCxs5a7RL+V3uMDlqjUY6zWb5JKgwto7vjsz48J+FZeAJeHxc/CFpjudO
         PDzQ==
X-Gm-Message-State: AOJu0YykULpcgFau0KyOJmqRtMTuwKppzXJEA0VofW+2YhdE39IJqdrm
	4icr/dYDRxg1JkV3ThIGa1KbNASNMAMsPbtXMSYdHBicag8IlxqEYtO8M1SHfVCAsFh/dcg2fCF
	M
X-Gm-Gg: ASbGncs7GayHoJbAy0XdCEF4zXS7E+fsvrva0qTYf6XyXyxqsdq+dNibjcxgcYPkcUg
	IypLZD23WVlrd0hvIzTsQE00PUQjy1YFGzVTYi6iYDSFFrJlaNlOI5qUXAM4ji/mj3b8/XeZU4W
	G5wUVDCwoBeks78YgtJtK0QYxnAfapiDP1e7j5FBurMJX8CclBerw5iZLMwLRb8EMJc5xoMe8Aq
	9kHB1Tdr4Vw99rxWfpKAzoC2s8u+ER62PbtlYo=
X-Google-Smtp-Source: AGHT+IHqWWUzX8Y8KA2+PFXireCGpkKByfMf6SUiAc3aYfBA4baI6nlPbfYfI1TmgsDP9PnLXKsOcg==
X-Received: by 2002:a17:902:e84f:b0:212:2fde:1a1c with SMTP id d9443c01a7336-2129f82d755mr60600755ad.47.1732310825574;
        Fri, 22 Nov 2024 13:27:05 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfe6fasm20814095ad.160.2024.11.22.13.27.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 13:27:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/19] scripts/install-buildtools: Update to 4.0.22
Date: Fri, 22 Nov 2024 13:26:31 -0800
Message-Id: <ca09d02ae7628d7d003aaaaa7b600aa6d58d515c.1732310669.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732310669.git.steve@sakoman.com>
References: <cover.1732310669.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 21:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207662

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 4.0.22 release of the 4.0 series for buildtools.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 9054eb5f36..616330dfdc 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.21'
-DEFAULT_INSTALLER_VERSION = '4.0.21'
+DEFAULT_RELEASE = 'yocto-4.0.22'
+DEFAULT_INSTALLER_VERSION = '4.0.22'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.34.1


