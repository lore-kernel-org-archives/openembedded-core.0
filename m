Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89731C369B1
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 20:34:03 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.36740.1744403641928727388
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 13:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=l7sRWXLD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7370a2d1981so2008941b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 13:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744403641; x=1745008441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6buF+Vd28RQOKVbHuwbrvxhlyzmDoUg0/rB/3BjYaVs=;
        b=l7sRWXLDYP0SwRQk81GkSxcy5Lwr+JgLmiH3zReYQWxvUk3S/jpvKtlwDLnSneKQVI
         l+iLIuvqiFaFl4rEu8hBA2FxT23JoRT192idbnNL7mvSH5NbjnUpFdj9SRCDBy8YpgHk
         IAWY0Fe2FXGFB3f6Xy2W46b5+v8G5M7TWSTr4rrg6LGgqp9zdIiHEczaWHxcwvk7bomW
         T4/RG6dPdo5kTnlrCb2VoO7ntc3++Id87/4etQArzRrMOx6NiProCSkLHrNd9ASiYo+3
         zjwvgTycVFpYkThZ1OsO6QdXcFsgBDPxJIGW8F5m+y8yt+OpQ1yFy8iy82H/vXQnhfF5
         9KFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744403641; x=1745008441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6buF+Vd28RQOKVbHuwbrvxhlyzmDoUg0/rB/3BjYaVs=;
        b=Lp7+abgypSNDhs/NlEDztJljLWsmnMoyulRfQrufJ0yWeZFxzepxYEMA6Z/alyUI+h
         LsKfVhKwn0iltRgKptO+K2Gpnn/6uvnZJ/Jh8VDHl76PVLXEWzxwP8eL9s/4JZ7fOpnx
         +X+kjoKlhSf7SQV+tGUn5vxzC8BpnCAOqQUocYD8fgyhX+zo85hprmyIQoJ3ssWpoHb5
         K+ZXEN8SRFa5ty1ROqDyj5bdCuLyq3rKDA6XB7pVclVaLkuWx/lSwCyGrQ+0Jyghcw+h
         2QUjGQW7z6whTm9CQSvNfOmjoYOYT/FbD67QVPgzgKygGg/p6+q/ZKM3IdbY2D/M8hcS
         WT1g==
X-Gm-Message-State: AOJu0YzOmjyeuQe9Cyp/fl+Q1NKDepBPxCg/MgxqBfE9SvSmVrjhveHy
	4YbE+56IhYKk9ddGX/azaQZcSO0EmwPcMH4YkDvCsyW2m5eKA2gkily6GQnV0LcbrdR+hfoaPLn
	1
X-Gm-Gg: ASbGncte25ZcgBnllY+30pg1mvL1MDvZ5PA4W8DIoTb9a+rHnzXtXoIIRoh1Z9fjeUh
	AzYdOumYBSSVifOZGg8R8/oHwtc4VHpRN1stMw9g2QQG+a+6NpPPaSPPvmv5YKhtuXr6BkdkG9V
	pwEkmlVo7WVszJ7dsHMBfezYkRRCxpnO99kUz/8vN3PzwdXScdQuli6KtDJ/9a1zGNP/vGhHRXq
	48Q2ODuLc7GlGRXd7bcCEsqTYN096eEDol5lzG7v9QazAwWoo4EwXm99otClIwTG+DeS125ZXlp
	3JacD8UcGdpXBh2A6fu0crokmck/hVqx
X-Google-Smtp-Source: AGHT+IENdbN7NkKeiaUvpIE2EXycTKjF0IXBwn/ey7h35uUbmM8nTB9+7aponG0W8kGt8Q2Watr+aQ==
X-Received: by 2002:a05:6a00:1414:b0:736:57cb:f2b6 with SMTP id d2e1a72fcca58-73bd11fe7d1mr5668038b3a.12.1744403641107;
        Fri, 11 Apr 2025 13:34:01 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c93f:3642:a7d6:27ed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230d697sm2067498b3a.123.2025.04.11.13.34.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 13:34:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 7/8] ghostscript: upgrade 10.04.0 -> 10.05.0
Date: Fri, 11 Apr 2025 13:33:33 -0700
Message-ID: <2c851f74fa72c30d447d59d450eb9bc036404f55.1744403103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744403103.git.steve@sakoman.com>
References: <cover.1744403103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 20:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214760

From: Archana Polampalli <archana.polampalli@windriver.com>

This upgrade addresses CVEs:
CVE-2025-27835 CVE-2025-27832
CVE-2025-27831 CVE-2025-27836
CVE-2025-27830 CVE-2025-27833
CVE-2025-27833 CVE-2025-27834

Changelog:
https://ghostscript.readthedocs.io/en/gs10.05.0/News.html

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{ghostscript_10.04.0.bb => ghostscript_10.05.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.04.0.bb => ghostscript_10.05.0.bb} (97%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.04.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
similarity index 97%
rename from meta/recipes-extended/ghostscript/ghostscript_10.04.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
index 546d734333..1d05945c30 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.04.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://avoid-host-contamination.patch \
            "
 
-SRC_URI[sha256sum] = "c764dfbb7b13fc71a7a05c634e014f9bb1fb83b899fe39efc0b6c3522a9998b1"
+SRC_URI[sha256sum] = "56e77833de683825c420d0af8cb90aa8ba7da71ea6fb5624290cbc1b53fe7942"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.43.0


