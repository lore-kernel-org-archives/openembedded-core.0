Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C94C46CC5
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 02:34:09 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.11198.1702002842485820100
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 18:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mxKTcQI0;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5c65ca2e1eeso1181198a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 18:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702002841; x=1702607641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QmZ/b0rzCuH5B5RKQ+ldRnLwAHvpIeHAhTc0AzNpSU=;
        b=mxKTcQI0019MnO18+3xDzworcx5wSMl4XJEzLILJOZH6+RWBUjlypIpW4DwcXMDAbI
         wLZtahSW366da8WYZbg+tAJE6itzLDwF6cpPA0WPwReIy33mwf8HHl5P8lCPTxd/98sj
         INlDE7tlri9E1XeX3IpCYOw6LtNer9yV9QnjjsPHf9RCYlYor7CuhkXR5z07mvNj4r5O
         sOKIn9bxCyGImnwh9Dr0oL8NznIdsJ8hoNemwSspxWsnkd8qNL+cFAWbVxJKougxJ0sA
         FGWpS2Xk55+56zZiwZgOv+uaI4kFFTTB2C+8/FOK42kBNgepE7M+VskdUb42kXL/haBb
         Egkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702002841; x=1702607641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QmZ/b0rzCuH5B5RKQ+ldRnLwAHvpIeHAhTc0AzNpSU=;
        b=ADP3jQckqQCXNjyw/v6Ac8hULzQNnJ2/wlaYEwCNBDisE4EwZvQJWinW35wn9uDIik
         0bfiCVVyhOYgE4+AiuVe1Q9JpfKGv4D6atXC2GB3qWflNn6VAY8WLLvVFiWi1StsOmB0
         rVkp7/0OdjecNwcXMGKvLAjiyusqdSpZ8jnZpNwP8wjRA0ekKJ8TLbMhV71v/dk2s0B+
         jZzvE+nN5Val5HZJ5UpsHY+FyFMYBFN27xUVlqAiyTOyOWeBMTrKtox/7D8MJg5ZB8wt
         M9CL4XvkWXr1SHp1/MQiJZZSG3Ku/yd+MX8y9tEDiY9R8P+HGwBJFZj0RpXkqt1f5nsy
         2Ltg==
X-Gm-Message-State: AOJu0Ywlmy5C6KDdBs15UsscLsDaaZeuOBDRMvAn+89l5mjKAUK6I3Lw
	y6HysDnf9Wmq6SkXEsOKx1CO7W6arRYzPcoX9jI=
X-Google-Smtp-Source: AGHT+IFFlak6V47mDfCiMZ01P6YZhLV8aD88w60N1UMbaDkGhCoIbNw6hjDVXy4KNAsplR4augENbQ==
X-Received: by 2002:a05:6a20:748d:b0:187:ce5a:2a87 with SMTP id p13-20020a056a20748d00b00187ce5a2a87mr3409932pzd.12.1702002841115;
        Thu, 07 Dec 2023 18:34:01 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id i11-20020a170902c94b00b001c9bc811d4dsm499752pla.295.2023.12.07.18.34.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 18:34:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/15] native: Clear TUNE_FEATURES/ABIEXTENSION
Date: Thu,  7 Dec 2023 16:33:21 -1000
Message-Id: <09ecafaf0e128c4dea062d359de37cbef461aed2.1702002667.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702002667.git.steve@sakoman.com>
References: <cover.1702002667.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192007

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Some recipes reference these. Rather than continually trying to chase down the references
and taskhash issues, clear the variables for an easier life and simpler code. These
wouldn't convey anything useful in a native build.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f8edeead263708889d31a7ff578ef8274cb678b4)
Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/native.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 4de96cd59b..56726301bd 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -23,6 +23,8 @@ TARGET_CFLAGS = "${BUILD_CFLAGS}"
 TARGET_CXXFLAGS = "${BUILD_CXXFLAGS}"
 TARGET_LDFLAGS = "${BUILD_LDFLAGS}"
 TARGET_FPU = ""
+TUNE_FEATURES = ""
+ABIEXTENSION = ""
 
 HOST_ARCH = "${BUILD_ARCH}"
 HOST_OS = "${BUILD_OS}"
-- 
2.34.1


