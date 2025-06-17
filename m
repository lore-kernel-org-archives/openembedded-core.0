Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C961C7115A
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:21:05 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.31419.1750195256111333363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=u/NLXSmX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-747abb3cd0bso80891b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195255; x=1750800055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZBjWYjfA8SItULboc/ftNmWzz5Wo1DMkEeaJQ1mC3Ek=;
        b=u/NLXSmXi1hpwr6joLvKPj5Sc1ANGy+2SJ7dRie3zXKECT+h8ztx84OJFrIKFH0EDv
         knUk+uJjPebYsFUdKNLpsFj7hyZqF9qH1negb2l9ieb94EGRWb/2reoFY4tc05dP/GfW
         da+5CfTC38AdzkMcYjfP0KNS2kOG2VtyfHUn5bw/nvV/8p57HjFP2S7Z6rCSSqlZ24yb
         8BRKDontTBt/pQS35TlZUnoBYRt3N8sHGecg1GhG0xHD8kesMPTcwAkffLyBtTD+t/E/
         dYgAeZLDChoVD526gicJQeIhcDWDVfhssks/bgM7KwSGZz+up6bNqE7B23XvG0vY1jAL
         UDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195255; x=1750800055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBjWYjfA8SItULboc/ftNmWzz5Wo1DMkEeaJQ1mC3Ek=;
        b=YA402H7gOutRecBb8OXN0PsvFFrIFfOiu/MJTh34/H40BTqG1cZXSq0oznfIDXwuWl
         amGYd1U1jMwp/FqgB84kQJgTqN/BYWsnkzPbSLErw2aZXq4N9efVxcR7fj4Nrio19uBf
         TH20rNZbd/Y77UfykhLWSAqSkVRQIogAPWqI0JbodRrEeQvRo3ph0LJRiuiB04bYaazv
         HyaaaJvjacoPgwRNZu/O3do2GpOFqeNxARcdFZEM609LjmP2fsP/Z8Ph3w0b1g0kVQ6l
         oiBL36r89YuCHwGo4mT9bH6e0tbTi29AOzqyVHwQe32KbWv9HwRx4bqTd1WmTgTvXkjV
         4Xbg==
X-Gm-Message-State: AOJu0YyREEa/QEw3W0+wpTQIS7w6uV0v+jiCOciVTwAc0SE/NDDDab8s
	LYiBRPdip5Ffv6HFJsEhy1cTgzKgOzvWw+eMsfnx0DKlQmesfPDDj0aKidfMD+ihwrfEDL4MKUX
	1VZU3
X-Gm-Gg: ASbGncts8Sd/6Bmm5GGfeqVhv4bGU/tpBFjDLcsbvArVsx/9qwJErI3BEwqoGL9a+A7
	EuC53/S6IEcjCaFNiBMZiAAQkW3esjukoQzMRX06jK+2SWJM78Kr2UjkDmobCBR/YVsxmJdqfCn
	L4Ci2eFZqRzxeUbbLASpJ2p063Bfs53n81xcvAbQ713DJ+mBLcHTfBwI090amhFr+K8AtVihPas
	EUjBLkT5wOjJ2J37ssDd2OD6dNORj3F4YNBSXecft4k77y6W6CWFnSh+9T+1cb85OOi0tyCmUki
	0EP7CpjX5IkILTvUtwWNQavXqmntGQ7FaegES2dGIovduCGrPvdwMg==
X-Google-Smtp-Source: AGHT+IEYEuQoQvDQ0M+vJ4sL4IG4rHgZj2OXs6bMbsmfSTyR84rdVvHR1cz9AT1ffuKdELIxWj3Upw==
X-Received: by 2002:a05:6a00:7596:b0:742:b928:59cb with SMTP id d2e1a72fcca58-748e6fcd4a7mr135773b3a.7.1750195255281;
        Tue, 17 Jun 2025 14:20:55 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.20.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:20:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/27] ffmpeg: Add "libswresample libavcodec" to CVE_PRODUCT
Date: Tue, 17 Jun 2025 14:20:11 -0700
Message-ID: <34df694e0cdf4c1e3dfc99502a9e615b8c802cdb.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218931

From: aszh07 <mail2szahir@gmail.com>

Currently, CVE_PRODUCT only detects vulnerabilities where the product is "ffmpeg".

However, there are also vulnerabilities where the product is "libswresample",
and "libavcodec" as shown below.
https://app.opencve.io/vendors/?vendor=ffmpeg

Therefore, add "libswresample libavcodec" to CVE_PRODUCT to detect vulnerabilities
where the product is "libswresample libavcodec" as well.

(From OE-Core rev: 9684eba5c543de229108008e29afd1dd021a9799)

Signed-off-by: aszh07 <mail2szahir@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Naman Jain <namanj1@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index ae257a3926..dcdb65d2eb 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -233,3 +233,5 @@ INSANE_SKIP:${MLPREFIX}libavutil = "textrel"
 INSANE_SKIP:${MLPREFIX}libswscale = "textrel"
 INSANE_SKIP:${MLPREFIX}libswresample = "textrel"
 INSANE_SKIP:${MLPREFIX}libpostproc = "textrel"
+
+CVE_PRODUCT = "ffmpeg libswresample libavcodec"
-- 
2.43.0


