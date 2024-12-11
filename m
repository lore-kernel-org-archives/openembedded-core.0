Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63814E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 14:47:45 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.12657.1733928464713874960
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 06:47:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Jr8+Df0Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-728ec840a8aso1248435b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 06:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733928464; x=1734533264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6G4xMyJkHH8JcYUk6BgwjFRVSNI6QfiyF9TuDZMIKVY=;
        b=Jr8+Df0ZGlOZIB5lmVNFcC+LNOSdI7ISReBjpsZ8Bis3Bl8khsrnewG/XBwih8Z/8T
         nS8OTL5cpHXin0Eh/3oxjBdHs9l+aGRQdlE4Xoe7ZyNCvTKoM/ot7SH8gB6QHqpNJXhj
         Mzu7e6Z7M1hc2d46KUKcOP9r2mpO28p4fSfKp/kW+rELJ+t3BTZc605/L0OlGzPpyPJP
         RUOgsLzeWUpClHuZ91AdSTsZkDpE1sb3Pj68LzqHxiCu46SGKvJJ35JYn/ol79NLYZoe
         Rzw8L9uN4fBj0Ya2Jw5KamvM7cXkmBeXGgCnngZHWZPk3svuW3gC5ejII7o3PWfUhuqZ
         yRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733928464; x=1734533264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6G4xMyJkHH8JcYUk6BgwjFRVSNI6QfiyF9TuDZMIKVY=;
        b=AiZnG0Es1KAHWOw0RzfUqb2Kv94Zea/lfd5YvFdzscp3IXtcb7RfcG6yejiCGCsrY3
         ePNR4GUvvrTAvT6Oe3tTCcycPBjG6Rd34lKhmOIRtBNgreore+HSIRJQ5jjQwXWDYRSI
         qKY0n89y7qiJW1qIvqUzd7aUP+spbNUtbnIsYy+euzXoLiXUuCcEG1BxtnWIEuVOGiIF
         AbKjQ5sQxD1cMB9XCeQksvi5wxfVbBedj0L12QPyfknBQ9cgNn1EW08KoLO60oFFs5ln
         ej67W6CXqS/IlXhlay5pSx6mDhEuBXMFBXn/R+2Txelc7Nh6EHicujlT+Sr5OUFHK7VT
         5mSA==
X-Gm-Message-State: AOJu0YwBdclaSuOX9qWbXLO8DYScS/5e86IwkZz9zJLfGpc41UTn/9nh
	fc+uT1L0s4jEndrDRcRE579VoqMNKhNTALq8IVwXeH+Ahubipet/ajZ5u6qJN8YJTtWJETMwlem
	s
X-Gm-Gg: ASbGncv/K5ahLUDrq95mnnNtsFRj1Az2eAknpYT3BC3B4kEcXGr8KqEAUgSol8SVMZj
	ze7blyE1GbVnCS/0wOGis9C9/yHA08gaT96440h4AeJPJ0HM9CAnBmur+MpVeT2uBTHsNVjHLyy
	pig8h8tYGcnYIaPc3nrhMm9Uo94pH4PV2DS/Kr7Ouwuq8fAfYrx5Artrk3JU9230dKhh+vET15R
	3UvEG8UiLRXtYvZyZXDaAiTD/VFWBLH3eahAcUFp2Q=
X-Google-Smtp-Source: AGHT+IGHwoCPHLAfwk6HhwfnPJByiHxczmL1lCCxvRiZcvHKL1uBiRq0M/dgNlESma5MfLqy3o6OKw==
X-Received: by 2002:a05:6a21:788b:b0:1e1:9f57:eaaf with SMTP id adf61e73a8af0-1e1cda88e69mr302834637.6.1733928463743;
        Wed, 11 Dec 2024 06:47:43 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd3891dc95sm7494377a12.42.2024.12.11.06.47.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 06:47:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/7] libsdl2: ignore CVE-2020-14409 and CVE-2020-14410
Date: Wed, 11 Dec 2024 06:47:31 -0800
Message-Id: <3079d562b4df69ab0ac20ec8d13a4240ce0a3514.1733928291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733928291.git.steve@sakoman.com>
References: <cover.1733928291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 14:47:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208586

From: Peter Marko <peter.marko@siemens.com>

This was fixed in 2.0.14, but NVD DB lists > 2.0.20 causing
false positives in CVE metrics.

NVD entries [1] and [2] list commit [3] which redirects to commit [4].
Also Debian 10 uses this commit, while Debian 11 with 2.0.14 does not
patch it and claims it's fixed.

Trying to apply the patch shows it's already applied.

Following shows git history of this commit wrt tags.
SDL$ git describe a7ff6e96155f550a5597621ebeddd03c98aa9294 --tags
release-2.0.12-305-ga7ff6e961
SDL$ git describe release-2.0.14 --tags --match=release-2.0.12
release-2.0.12-873-g4cd981609
SDL$ git describe release-2.0.20 --tags --match=release-2.0.12
release-2.0.12-3126-gb424665e0

[1] https://nvd.nist.gov/vuln/detail/CVE-2020-14409
[2] https://nvd.nist.gov/vuln/detail/CVE-2020-14410
[3] https://hg.libsdl.org/SDL/rev/3f9b4e92c1d9
[4] https://github.com/libsdl-org/SDL/commit/a7ff6e96155f550a5597621ebeddd03c98aa9294

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
index abcf232e25..6d30d0baa8 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
@@ -82,3 +82,6 @@ PACKAGECONFIG[x11]        = "-DSDL_X11=ON,-DSDL_X11=OFF,virtual/libx11 libxext l
 CFLAGS:append:class-native = " -DNO_SHARED_MEMORY"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# These are fixed since 2.0.14, NVD DB incorrectly lists > 20.0.20
+CVE_CHECK_IGNORE += "CVE-2020-14409 CVE-2020-14410"
-- 
2.34.1


