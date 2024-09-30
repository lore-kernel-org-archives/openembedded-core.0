Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA9FCF649E
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:58:16 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.45600.1727661488388644310
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CZQxsueq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2db89fb53f9so2810441a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661488; x=1728266288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ip60YIZ89lkijt5CVWlOIdHfOkS5zRin22qO1CXxBAo=;
        b=CZQxsueq7p679C4d5jn1LmzfnMj9mZzFG32EJqE+r2yb4O/Z9nqZiT8V9dsst3AVRm
         v9R4onTt4QqcziEvV6slFaCgCiq8ZtpVmAig8t1OpQnGNeyYzT4bV/EfWvc8CdjGT3et
         kW/9G3vlokH6HhbGCA+T9cmErg+PHakzemutn/Z89XWOT5kpO8n5yh4RBuBBOBRV4B8i
         a4RT1R0Uzqs8UtMx7lUkn7L3jqsWEOsJoqNh6DcCZ1V4cdC8rhtcxcmixZrbnfupIiMa
         vJlN7VyQb9Ruwsx/MAzAAbf7+7gbMQ+z1ioWNZNHupUaVyeq+1KQKDz/d0f1RSBiHyVk
         lYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661488; x=1728266288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ip60YIZ89lkijt5CVWlOIdHfOkS5zRin22qO1CXxBAo=;
        b=Uu4dF57Ftyxnn4/AYF8BOBA+pTA11cwLKzL/Eevpi7jO8yyi1RFmwttVtCccApEkPc
         Hy0Ug9jgOX39RCEhQwGPsf4b0vP8WXZe2S+kq3SA1JdrEaSc+WzesI2Yg/zpH4Fk7mdo
         35CzwZK6xDaPs/PprukFZO495f59V6Ob0BTfggSRbfGN+g1Pnot0QftFqkQSaHDKgeee
         g/rVa2vtWa1LsC+repCZkRy7aso2kxM/ndbWKen4tfys02rDB3gu/W5nEo2v/Con6UIB
         p8q8kWep4ZQ9EG0kBy16nOWyjlSKemQ4tTzzDqTCIfTxxuMjmHqHJ1PxtE3HJaqzlO2X
         gpTw==
X-Gm-Message-State: AOJu0YzlpV8H/9hh2nEcWfVYXwt/heEZ8ySFXeiNIF+NeotQEaj/6EuU
	tWT51Xnc++vwl9vwlcOdSW9iKVLUVVvy2XAboD2tQKxl/9P8tGjeL6CBOsIe5in8eW3maED37G3
	CR2c=
X-Google-Smtp-Source: AGHT+IFhRzikuKEHuwtEnB6FgbMgk5C9JZATJ+n58NkXXTQtOVAdIkq4T5BAXNoHdP+IVNR/FppByw==
X-Received: by 2002:a17:90a:f2cd:b0:2c2:5f25:5490 with SMTP id 98e67ed59e1d1-2e0b8ee5bc1mr11962900a91.34.1727661487625;
        Sun, 29 Sep 2024 18:58:07 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.58.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:58:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/27] kernel-fitimage: fix external dtb check
Date: Sun, 29 Sep 2024 18:57:18 -0700
Message-Id: <74054f3614922e331620a4dcb37975c5f679ab4e.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205085

From: Adrian Freihofer <adrian.freihofer@siemens.com>

If EXTERNAL_KERNEL_DEVICETREE and dtb_image_sect are empty variables
dtb_path ends up as "/" which is available on most Unix systems but
probably not the dtb_path which is needed here. Checking for a file
makes more sense and also solves the issue with the "/".

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c8f629b6991449cc6726f48a607d9e1bd50807ee)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 16c8d88802..18ab17bd2c 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -429,7 +429,7 @@ fitimage_emit_section_config() {
 	fi
 
 	dtb_path="${EXTERNAL_KERNEL_DEVICETREE}/${dtb_image_sect}"
-	if [ -e "$dtb_path" ]; then
+	if [ -f "$dtb_path" ] || [ -L "$dtb_path" ]; then
 		compat=$(fdtget -t s "$dtb_path" / compatible | sed 's/ /", "/g')
 		if [ -n "$compat" ]; then
 			compatible_line="compatible = \"$compat\";"
-- 
2.34.1


