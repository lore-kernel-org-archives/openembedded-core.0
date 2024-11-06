Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02236D44D69
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 13:49:57 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.46136.1730900988812096965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 05:49:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=o6MuqHov;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7ed9c16f687so4646993a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 05:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730900988; x=1731505788; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Z4CtALvulEZyWfGyzqCbNqKJy26vV2AjNROxY3Iyqo=;
        b=o6MuqHovMs6Q8h95+yhS/Q+uW7TkQdekZudSPgVEevOAPbZCNngTpgDzTg5+RAC4T/
         egTpSzpYjNTrzQ7r1k1g+9zf+IL4QvJ//UPDdfsiDkj2PVj+bW/EGwUl8KN+NPkdmFQM
         TmLNVrNPgViuVe+CFlwPgIwzs6fw7Np4i7zkojDveG2KehmG8CYcWL1wDLlk4agnWPDR
         2Ks66hT1u9Vdws+eC0r1MsGyUNjI15xrONuWpC48v1AEQlNzEXE+xU1YWHpT/URixbUq
         jhS5hbmlCOb+u72spaR2iR7m7YE6nqOvK47DfZAlda6WwiZ5wwNZzrgUcy1jnZdTP0MP
         Pbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900988; x=1731505788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Z4CtALvulEZyWfGyzqCbNqKJy26vV2AjNROxY3Iyqo=;
        b=m+PBRuZJXDju3xCMSs7LG2zsHAlh6PhrFNvOExsM0E1zwHTwiTaLJbaf5+XUeyaQ5z
         i7IL5sEDHqL02X+AnINA7LsGinIUNku3PXtPE3nohgN3qKv4LdG9j/sMxAhVNuehghG1
         C8bBmDtIQOh3PB2JyZ3m9TfCcKZxlgOYe0pBZUZPjqrtsbqREf/l5l6AqLZuc2H88WbE
         Q3f4rGxB4nsIu73Z5Tc+9mRDXSR2Fgzxae8Pfc/ztRo24/aBIRcKbobtDlYPuMUhpIWx
         LRy3Z9ufd9zcadABQK8fb0KPX9ph14BYXB2vRU6TaIDsPWsX4DU76WJkWXrJ5bLhZwOe
         b0NA==
X-Gm-Message-State: AOJu0YxnmFyY1T+/Snvc+8thSK6MDhbObb3PB1L4xcSLCHchHnDV3PqG
	AO1RUnDpnbpQSMWsaHCBWoOcmTKmoYmMnZ9vXs0peVKUt4iY4jI8hMrxKVxgBuDCfyUIUK84ZDL
	G
X-Google-Smtp-Source: AGHT+IGiT6iNDaVVQv4ghqhoBi3qYfyxbi+1lAkFgUYjYrCgMuDDQB4iIF+EP269J40Cw1zXAXUa7A==
X-Received: by 2002:a17:90b:3886:b0:2e2:d821:1b78 with SMTP id 98e67ed59e1d1-2e93beeed65mr29786359a91.0.1730900988104;
        Wed, 06 Nov 2024 05:49:48 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a541e16sm1491795a91.21.2024.11.06.05.49.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:49:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 3/7] ffmpeg: nasm is x86 only, so only DEPEND if x86
Date: Wed,  6 Nov 2024 05:49:33 -0800
Message-Id: <0830e65afc2e7d828ae1667addb6f7499ea8ddd0.1730900782.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730900782.git.steve@sakoman.com>
References: <cover.1730900782.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 13:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206776

From: Ross Burton <ross.burton@arm.com>

No need to depend on nasm if we're not going to use it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b99ea7f130c3f945af9a09a6ecf85b6ff8f4b710)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
index 9e60b5cd23..b16bd51dbd 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
@@ -46,7 +46,8 @@ ARM_INSTRUCTION_SET:armv6 = "arm"
 # libpostproc was previously packaged from a separate recipe
 PROVIDES = "libav libpostproc"
 
-DEPENDS = "nasm-native"
+DEPENDS:append:x86 = " nasm-native"
+DEPENDS:append:x86-64 = " nasm-native"
 
 inherit autotools pkgconfig
 
-- 
2.34.1


