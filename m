Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D10CCD184
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:39 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.9194.1760038290999676858
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wqC7xi6I;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1341978b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038290; x=1760643090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YT8EE1z/Fntu1XWe0BptLiJklPK+k+NBD4cUsyaks9Q=;
        b=wqC7xi6IxZy5oIjH7JZnd9OkRfQ0lBWhTVPz1Y6uJK/P+86UiMqf44StuvJMsNUN8D
         cNZU7ThpQ7/PKZEFPhGFelGBVYbhicHky+Laa6LY1EA4KY6VJQVgKTqNanGfAnwquWE7
         yn6HG2nZykRlt3vG4rQ+iPddvRxy7H6v8cKrHDJJkWPAtktq0QArEfJkth/OotqVo64y
         CS+9iXhIJTot/At6i+yInP5LqYwRTTMlYXpAOki5QtuTbkADGcyeUJdSusKj6Tu83waH
         uSFe9KUtIdiLgIekgSF0jmyN3ScXAmcL2VUo9fTYg1zYehhzsldHNDFfi6bGNa18aGUX
         SsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038290; x=1760643090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YT8EE1z/Fntu1XWe0BptLiJklPK+k+NBD4cUsyaks9Q=;
        b=X7yr9HRuGyb4LrnXat5cPeYVrHg6FEHesTVpZijQjKS0aUGjVe6+QYWf4YsNY4H78q
         Dum1lqpQOhBSoz1jw789i081yGt3+K34I2QbgGAOONjV9sY80SCK93C9EY/J0yAmtg8t
         zrEuVfwBGvkkhcyPe9nuABWmA4kkrzAx9kUBYZDsbkvi4CWdSDMCUbwW3rJvsk0oou9+
         gkIY/QatoGtACZyb7sf0RaCJyjjZgeKugYeerUoXJSG+XDy6tCUVoTi9EcHGLBTMtR78
         40ThHecP6568zzMFsxAc9tQUttKohMDgJf/lvM86uSFNYBUjJhLE5wrF+18xd66QxOV4
         GfCg==
X-Gm-Message-State: AOJu0YyTg8giYlecsKeriCRqfw8IsNpLmw5/VE9W8Hb/2/HE6iq3YaOI
	1oUVd/iIQlfNuaRSMKmwzAQti+jHa/4mJ9C5gkPcmX7Tz9IzraDatBW4dZ1c8H6J5ByIt47kODo
	aljxM
X-Gm-Gg: ASbGncvX59+HY9/cGTHy5fVuAME6LW3Sm5YZPlDvSzyooKDTAGhD8oVO4ezVa4WPCQo
	0LGBRuk44Jlc25VPgenlktNIXoT22iGsvxsEb1/nF+LazWzDBav+8tRz/T+2p8SCiVuHeOofIVe
	0wiB2TpkrAv6rUrpsvVB7sNB61HRJ/7Hv1z1U+yBbaei+sBncjC9+kEaC6vIxjUgoqYOeu9hSFN
	zDs+16ZMi5hJgVVZM++wJKL5rEZ0A/nGc+ONlubV/Vplr21lFAGnjggNDwmQ9VQsC/kWqXwKTUV
	pm7ElPvAcNOsbKDK2NYcVFyS9+SHu11KtJ1oyFpA1KJnVvIn8cyEVUyjRMJmUfywkTZ2FVzzdvl
	hHPKGajQGyE9+1+ONDzwmygUhjiw/+ktUA82lug==
X-Google-Smtp-Source: AGHT+IEz5IpYD9E9iJOEs2vPWjQTm1+w5pXFyINu+KhTvlEv8mfD8QvBwZqXVSc3yGqy7jiDfE6GTA==
X-Received: by 2002:aa7:90d3:0:b0:784:27cb:a2c6 with SMTP id d2e1a72fcca58-7922fab2444mr11980175b3a.2.1760038290006;
        Thu, 09 Oct 2025 12:31:30 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/24] gstreamer1.0: ignore CVE-2025-2759
Date: Thu,  9 Oct 2025 12:30:52 -0700
Message-ID: <2162bc3b305a0b088018e251baad54c356f7855f.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224627

From: Peter Marko <peter.marko@siemens.com>

Copy statement from [1] that it is problem of installers (non-Linux).
Also [2] linked in NVD says "Fixed in 1.25.1 Gstreamer Installer".
Since Yocto builds from sources into our own packages, ignore it.

[1] https://security-tracker.debian.org/tracker/CVE-2025-2759
[2] https://www.zerodayinitiative.com/advisories/ZDI-25-268/

(From OE-Core rev: 99ee1df6bde2ffd4fa2ddea44c0a9b94d9d77bae)

Reworked to CVE_CHECK_IGNORE format.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
index b9b9551bc3..3b37503608 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
@@ -88,4 +88,7 @@ CVE_CHECK_IGNORE += " \
     CVE-2024-47777 CVE-2024-47778 CVE-2024-47834 CVE-2025-47183 CVE-2025-47219 \
 "
 
+# not-applicable-platform: affects installation packages for non Linux OSes
+CVE_CHECK_IGNORE += "CVE-2025-2759"
+
 PTEST_BUILD_HOST_FILES = ""
-- 
2.43.0


