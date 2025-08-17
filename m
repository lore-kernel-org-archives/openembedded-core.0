Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECEF0CA0EDC
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 20:51:32 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.60850.1755463888778241743
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 13:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MDZ01Y+c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45a1b05fe23so19884195e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 13:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1755463887; x=1756068687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GIXltXNOmx/0nU27cIgPLJiS7u06poKSevKzi0brhXY=;
        b=MDZ01Y+ck54ERB+IU2l9U1yWzJjl8va6fLKlGFFVSnpPnFNyKSEvS3hMnCKJhdfAlI
         JDFfyE4M40AWbmg2HyRB1zdTb3B0bSUjw0b+oHIVYYQuyf3EaJXviLivD68uRrz0r/Fn
         h4Hdvro5MdHZVqpeVRkXV0VKU6iwnTQGYjeyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755463887; x=1756068687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GIXltXNOmx/0nU27cIgPLJiS7u06poKSevKzi0brhXY=;
        b=U2991SHfDRcCYvo4+R1Wy1wsLpP8FhbX5ywa7a8QbT7xehtgdTvRCY9wV7pY/RKo3G
         Lc08Q7LJxtyYQdoTMk1JYSfoJbvvNY8Bq6OzUeotskNqYEEh6tFLQfoasJGjExJdQLq6
         o1zmMdg0J6lOOew+TlxRe2lQj/Yc8XBiJzm+aIRuckWObfhCwirzU8LZxA8PS4vXiD0D
         MockRXgh1Lr4A7o3A+D8U8xHogT54cCfbqOhyG+RxveUB8z/Czix2RqobBPH+k2MKhzL
         Yx2Gbxbd2hX60jMhHpMYLgo38USV1JEirRlBvw7XRDlrXD4UqFBI3gp/IL9g8iTet5J6
         oX7A==
X-Gm-Message-State: AOJu0YwdG/EfXZHeiD6csQQsjnIcIW8uAiHkaiR69YQXx6tDMc9U0t9K
	HuRTfpDK3UThfekZaTq7sSpIfvESCAraKDHZVCX9vHSSd9VJbltTzg248MqpauWIJ1JYGwv/msG
	UdyvI
X-Gm-Gg: ASbGncu9Qpq2jwXemel9zYv5a9xQ/MbdXu9XaRlsk6TiNj1lvoXJSegfx0R8AQ9XsTD
	Ol0wQIOLqlHVnP2IcozzB/ft72mmaJddzJZZN2hrnaHqos+Ave2CZGQSVvLPdMyhEnMsNZ2KpG+
	ABz+L4o8NT5EdQ3IpM2JfljeyvuBEWzIlFEbPEQwiDgmShUlsvckd78Rm1Dgik/v7E1U7AV1zz2
	Exx2yON6xskXZLGWdw3XbK2zp5oiDo8/AKLwDz6gknuNaNX+7i0hMgj3c+POq0IYnf0p8irdx0Q
	T+LhOjvVi2tlP5z4jRH7Y2tHOpwO9rwihWuQQmp/SjJFFCWCGDLpXoqGdam1mtkB5hJV36Vh1m8
	2VFNHv+POtxs7L+tuIBJk8LGNwbUyl0Q710Fl36w2MCsZqjqIkBpYXT4d1cPmQpXRHtfyWDIa
X-Google-Smtp-Source: AGHT+IEQ2odF629FnwwNKMFoTVsPWgNY28Zf+JI8EvIoVse5QGCk7b/K+0li41GK9vEeZbmJnjhExw==
X-Received: by 2002:a05:600c:1c81:b0:456:1e5a:885e with SMTP id 5b1f17b1804b1-45a21801321mr82843385e9.3.1755463886781;
        Sun, 17 Aug 2025 13:51:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:128f:f0b2:1625:2f99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6ce764sm143284475e9.10.2025.08.17.13.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 13:51:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>
Subject: [PATCH 1/5] lttng-ust: Upgrade 2.13.9 -> 2.14.0
Date: Sun, 17 Aug 2025 21:51:15 +0100
Message-ID: <20250817205124.3384337-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 20:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222021

From: Mingli Yu <mingli.yu@windriver.com>

License-Update:
  implement REUSE with SPDX identifiers [1]

[1] https://github.com/lttng/lttng-ust/commit/e03d7c66c57bf268b87296566a5160039f35ccfb

(From OE-Core rev: d1c2269fbff355d00c6f6ac8ea496546f3ca747d)

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lttng/{lttng-ust_2.13.9.bb => lttng-ust_2.14.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.9.bb => lttng-ust_2.14.0.bb} (92%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
similarity index 92%
rename from meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
index dd7657e0cc1..1a15c5b4201 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://lttng.org/ust"
 BUGTRACKER = "https://bugs.lttng.org/projects/lttng-ust"
 
 LICENSE = "LGPL-2.1-or-later & MIT & GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a46577a38ad0c36ff6ff43ccf40c480f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b04e8f34dbcf08198c6618d05e8fe7b"
 
 PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
                  am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
@@ -33,7 +33,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch \
            "
 
-SRC_URI[sha256sum] = "2ad6d69a54a1d924c18a4aa7a233db104e3cc332bcdd240e196bf7adbed3f712"
+SRC_URI[sha256sum] = "82cdfd304bbb2b2b7d17cc951a6756b37a9f73868ec0ba7db448a0d5ca51b763"
 
 CVE_PRODUCT = "ust"
 

