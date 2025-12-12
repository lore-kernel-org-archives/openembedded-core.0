Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13495D44176
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 10:33:24 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9939.1765535598328493192
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 02:33:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=aakKjvbN;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.47, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6498a63422fso165879a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 02:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1765535597; x=1766140397; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rakWXif7/2W2aWvX2S8sH08Hq00+0jnjL6Ub+zmcJQ=;
        b=aakKjvbNdbcbURB2vl6K5k2p9fZrFPmTXKm0bWG9oNCln8j8d2Ay4fmTDtMm8lujQz
         4bpLwev8FNuS/CostKZ6TDoO4f+WgDIKpxnGNHXQeqaw/dWyUYb9Oot+WOWxqa0motJ6
         jHJK8p4ixSrTVczsdha4jGRxT3Qw9smedmiZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765535597; x=1766140397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9rakWXif7/2W2aWvX2S8sH08Hq00+0jnjL6Ub+zmcJQ=;
        b=hLH1Xi7/qWUINCKV+8t6e86XPZ1oOU4tWUC32oXsK8rxVyWUD+vAsu+BpR2R40o9cy
         AdfJQzw4SWdsCUnxkowkoq2YlieALe90UKMxN9d3BpCSFhu8ouainRiYMAQ1uUIobR+A
         4UOsECX95Fad197L1kEkcsN89hZS0mglCM1WnQajvVh1KbDGaqxYE6Yv5uxMkGqCGaD4
         FR3nBt6Km62pFAYggoB/p27XYeZ9CQnCrHhi3DQulT36ycnJFrnuqDCTwGFgbuGvxeqy
         0Uqlk2spM8qHf0uqNVJxL+lBrRbQO+k2m62BJXrEpcP2LPAJMvHmHH6NHOkBIMeG4tsH
         pfxw==
X-Gm-Message-State: AOJu0YzF9z90+04Cl1n41Rc1DDbwpWQRL7lgT0g1nroXEr413v6djzw9
	5t5A0gxgaA4KNhhqrxy9/1hfggrz6m0pKE9NZ6q2BY8BOOZUg8QK9x0XL4nFpD1YvjlH/54AJvL
	AQGWN
X-Gm-Gg: AY/fxX7TF5VH4TjKEeKnMtpYMFpUeZg7dphr+8AofJpf9dCdv5az4L2s+NCiWfKIw7c
	aPkX8vd/OXdd9/V4BqEwqJoyuB+YPlE/HRRilOl5WBfCtwbilhstXBSTJiC4ZTej43N8rJAx2GA
	VFSROYIbARZQ9iHVEv2ZKXdOQlHEbnZeh1h8KL8t85DkYleQNDc38DtYzXRumg3qC1G9DzmGtys
	qdoyZqwGW79g6O77/tTB0AELN8rlbBa5YLqszcJ6aOFghjP25Mm2dcYSyJiGk4uMARwywuTaJMe
	9rXRKqNtwb6tLBvqBOrnsVOCFkQdZVUZfdbW5HF81EdMFTXceV/7DW+wkYCN3URNQi1SCrO39Gy
	aGL/yCwSARG4GxnpV9ZUT6rEXH1sHBYd3iS+14O/BblT2Dw8SZbWsNtckBQyZMtP9dQj67zZPJ9
	uzXg3x09++Fpts5TdV5nh6nhrdmG5TmHBaBj+F7jRgzeLgurMO9j1L08t7tDI5EXUKvikLmbLlT
	qir6ZmW2YEKxWXTUZu2+aYfsiFX4UtqTbgDbB6hJsVBzX6oDaer0Tk4NQ==
X-Google-Smtp-Source: AGHT+IHq1THBuEjvS0MR3htqLgj5wnY2peBBNnLycOUkzZ59OpnsGeG05WxpJPvYoZZPHzsHCjVWcQ==
X-Received: by 2002:a05:6402:348e:b0:649:5709:aafc with SMTP id 4fb4d7f45d1cf-6499b312436mr756530a12.7.1765535596694;
        Fri, 12 Dec 2025 02:33:16 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-649820516desm4935216a12.14.2025.12.12.02.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 02:33:16 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v2 5/6] librepo: add PACKAGECONFIG[sequoia]
Date: Fri, 12 Dec 2025 11:33:11 +0100
Message-ID: <20251212103312.2077322-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251212103312.2077322-1-adam.duskett@amarulasolutions.com>
References: <20251212103312.2077322-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 10:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227584

Currently, librepo compiled with -DUSE_GPGME=ON (the default setting)
causes dnf5 to fail importing repository keys. A very long writeup
of the issue is linked below. [1]

Add a new PACKAGECONFIG[sequoia] option which sets -DUSE_GPGME=OFF
and adds rpm and rpm-sequoia to the dependency list which ensures
dnf5 works with repository signing.

1: https://github.com/rpm-software-management/dnf5/issues/2539

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Clean up several typos in the commit message

 meta/recipes-devtools/librepo/librepo_1.20.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/librepo/librepo_1.20.0.bb b/meta/recipes-devtools/librepo/librepo_1.20.0.bb
index 6557dda43a..7a2e9e6b9b 100644
--- a/meta/recipes-devtools/librepo/librepo_1.20.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.20.0.bb
@@ -15,6 +15,8 @@ DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 
 inherit cmake setuptools3-base pkgconfig
 
+PACKAGECONFIG[sequoia] = "-DUSE_GPGME=OFF,-DUSE_GPGME=ON,rpm rpm-sequoia"
+
 EXTRA_OECMAKE = " \
     -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} \
     -DPYTHON_DESIRED=3 \
-- 
2.52.0


