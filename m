Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E07C3601B
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:12:08 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.2178.1743577925458088692
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Go9pqzVf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so3236291f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577923; x=1744182723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rNgsEQ/NtjscLUr2z3IrklsrNzHcEFkH6JoVqxqzGUA=;
        b=Go9pqzVfw/6dUfy+ZeCc/OBg/91lQ9cJHMFw8w7FwkdJfZPB5bKn2YckFtNHjbELea
         7GkV3Rt/VGWL5eV79x5/BRty2d4HFJE94AHZhMdNZLOqLvXsgA0XCrY3QQsyMPG8+gCO
         82IQfY96ygY9Usf4t/dKFVHJzmgQQtoK32XVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577923; x=1744182723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNgsEQ/NtjscLUr2z3IrklsrNzHcEFkH6JoVqxqzGUA=;
        b=E5Y10kpvf07xt/TGaudSvyYGelM1J1jeefIqfK4pvXY0t/blUKWGw9MjgmYXbA23HG
         6LLhjTuPQc55OFJOSIPRI0z7cs2L8rnb/g3BJCtcwgwxpI14bFW7WC+7KRAJf8yduLhA
         ktesYWzwpnb91xW9aRqffmIt0jY5/IYGQahI9aBM9LJC2i1IELK9x+7Azg4jhYdknW5+
         NC45mToL3yrjdfMFSpzSQu1Qndyx5rY6VCou7tU1Y/X85+QEp4c4lbdXmZ5auanXyaFg
         4BLDpK2Lafdv8hBYrFelg/MwqdEByyxS2TrHv4kOybrKjB/bfTwoJkPGREeHK6vPXPPa
         1h4w==
X-Gm-Message-State: AOJu0Yy/f9XFVY12qxRSi4zfIhGmsIW6vINUN1b5lVEk4EJQR1Tnbt6z
	6+FLqbkc5HNv6kSig2BI2V+BxkM8n8feUDlPIVr/CgbEyxR8S0q6yHXcTzjASOeAmEDJc2KFTG9
	w
X-Gm-Gg: ASbGnct1pyRvbiDFzErp19d4ezk0VEJywMxIbO4Xc0+uLxLbe4fU2gXMsIHCkzScd6D
	7vPRz0s03GLJFhSYCjsXZkDmEpaL05jQEFyn7Js+Dw59o3XEN4XBgEhxHto3YzYxHjtMSUHMXFr
	doF6TMAG9ox4tHelKua7VUkUhkXbBr9j1/zvxq/DtjZbtgMsGF0ogDTGhI/lh3Kpx4UcrlnY28q
	BQHD35kDz2JgDmCtnpERJX1M5rVvEQoRHHWU5bj2avcx6sSK/YIsyiYbjlq2Tt0TjqvGfOy8G6a
	ePddB1X47nCV4eRZ1pGM7y2LaOCBkYM7lUQrTBp8Q0zmmZT4J51d426kW1xiFi5yl83JnwzHMH9
	9XUcsm5l3
X-Google-Smtp-Source: AGHT+IG9diYP/ubQvP8J1HzAjCFJT3u/E9jTctGFiia+SCxWkYlukUfYl2hEZDytcfV4UpJsCFcggQ==
X-Received: by 2002:a05:6000:1a8e:b0:391:3915:cfea with SMTP id ffacd0b85a97d-39c121139b7mr13490680f8f.38.1743577923112;
        Wed, 02 Apr 2025 00:12:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.12.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:12:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 40/48] python3-trove-classifiers: upgrade 2025.3.13.13 -> 2025.3.19.19
Date: Wed,  2 Apr 2025 08:10:09 +0100
Message-ID: <20250402071017.2157620-40-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214213

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...025.3.13.13.bb => python3-trove-classifiers_2025.3.19.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2025.3.13.13.bb => python3-trove-classifiers_2025.3.19.19.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2025.3.13.13.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2025.3.19.19.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2025.3.13.13.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2025.3.19.19.bb
index f2b06b2919d..39fb997e885 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2025.3.13.13.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2025.3.19.19.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "2a5e24ddafb20da2225a825fe167c4fd4ecbf312cef4310d67f19dc40da7dc8d"
+SRC_URI[sha256sum] = "98e9d396fe908d5f43b7454fa4c43d17cd0fdadf046f45fb38a5e3af8d959ecd"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"

