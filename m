Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A94E3C54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 21:02:49 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.3561.1748552564658102162
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 14:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HDmFx6n+;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22e16234307so11926665ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 14:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748552564; x=1749157364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Df7G0Ok20CYfuEMqUh9V5Cg6gIPOOh/AD3WpgfZo2HQ=;
        b=HDmFx6n+Kq3yhKqUspbLcDZo7qUxoxwZHEs08VJkpm5m2q5ED4rlLK50pKXj1F4zIx
         GPbXWF2Ry+an1v+Z06GY0Pre4RzDj/xmPN1taP2YnQwEDB0wkHQuNxQrtLyf80zntFZK
         pOUymYyzX7TKJVa9++jF8ZxNr6s091evcAirIDUSbb5QAV0uodY24KFC4RfLnqbs8DmH
         WdJu5mHqZoHCQa02AikIu7ZV12FfvBsafMbpftD781jKXh6Q1DS9QDSbZwYntHUTt53b
         d+jevmfmbOfLAN796JOd+TfVq7c4a3QeDHmY8VlcQd05f/evokI8damnbJufcAhI4K02
         dyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748552564; x=1749157364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Df7G0Ok20CYfuEMqUh9V5Cg6gIPOOh/AD3WpgfZo2HQ=;
        b=R3FFiSOL4xqdrAF98/JEcplhuTY+C6/nNHhHxmBQ7UprpOhMbQtmYdb8IhtIuzLYJN
         o9DQqUBzru6GavEgJJyRwUDJm+Ihkh8wnbOfAgWLFVqT4xl3GGh4lVyskP7yj28OQGZa
         mUuUSdZDVRWoC8Qv+HW6Wu+IqWIM27XGW33gEj8npvXbXHCte2P+ZOPXNARUczLTdsHJ
         cpKb2swrqp6Flx8jWS1Ht6/ssPFxnZuvZzO9KGMaCVv2qBsd+7QWZagy3liQMUmLFPvn
         Fnit6jxN3DyhttupSwARFwJU8WkqRKh0ckB7Fpq7UkxErp9+yWqCZutnfAJ+Pjm1pBK/
         3jVw==
X-Gm-Message-State: AOJu0YxM6TrKq/sE9m9v/hyFiunKL7syCDERnBzCFxYUajbppf0Cz+3l
	XpEDfClhz79K8Pf66Ynn9qKo1FW+8mIbtQQLeV/BjD1nLdrECsMn8AS6AMhSwx0g
X-Gm-Gg: ASbGncuw4M2XHTq3Bm0olAxq0/Ic83pv+vjm4VA/Vu9i2YtK/YUr/hqqR2uwoCr9oLm
	49mVCMRCs+ZE8vFhTOfuLjPO9clBQU9uCKaFyIut1upq5m+q/hS2bkW76WQbss/3ACw65eG+daJ
	uDE2azoo6XWw/3b5d6AetmmZjUuCZASKlGeVU3yKqaWvkQq+EPmHcKyNlSJIuG12e7pW6AnZo4v
	1TeoRqKbUxfh+2nEMCKvzosEcKhztkYJpNPr3i7YuH+v1L5RzhvzX4VSScf0IaUOGU6nqaQQ8cE
	m6bGn9gOGFfDz949wpDq68s3rQzoD1rXYkDd3ovuhgX2wRMou+S44w==
X-Google-Smtp-Source: AGHT+IFbGhjp2v9xWdkyB2vNF3N0VxffjN4zPit1EmcqXKm/MHsdMi+a7NL4Gy0PcuAb0GdOPdLXEg==
X-Received: by 2002:a17:903:28f:b0:234:325:500b with SMTP id d9443c01a7336-2352b686548mr11705815ad.22.1748552563869;
        Thu, 29 May 2025 14:02:43 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::deb9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc89desm16486405ad.36.2025.05.29.14.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 14:02:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 3/3] vte: Pin to use GCC
Date: Thu, 29 May 2025 14:02:39 -0700
Message-ID: <20250529210239.2070257-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250529210239.2070257-1-raj.khem@gmail.com>
References: <20250529210239.2070257-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 21:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217454

Fixes Qemu usermode crashes during GI data generation for armv7ve
when using clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/vte/vte_0.78.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/vte/vte_0.78.2.bb b/meta/recipes-support/vte/vte_0.78.2.bb
index 0593d16cd86..b8a19a03693 100644
--- a/meta/recipes-support/vte/vte_0.78.2.bb
+++ b/meta/recipes-support/vte/vte_0.78.2.bb
@@ -26,6 +26,10 @@ SRC_URI[archive.sha256sum] = "35d7bcde07356846b4a12881c8e016705b70a9004a9082285e
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
+# qemu usermode crashes when using clang as system compiler but works with gcc
+# see https://patchwork.yoctoproject.org/project/oe-core/patch/20240923234336.3978188-1-raj.khem@gmail.com/
+TOOLCHAIN = "gcc"
+
 EXTRA_OEMESON += "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dvapi=true', '-Dvapi=false', d)}"
 EXTRA_OEMESON:append = " ${@bb.utils.contains('GI_DATA_ENABLED', 'False', '-Ddocs=false', '', d)}"
 

