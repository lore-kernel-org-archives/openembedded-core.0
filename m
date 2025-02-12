Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FBCC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 04:35:53 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.7956.1739334943425151651
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 20:35:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SNvzrHOZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38dc0cd94a6so3013995f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 20:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739334941; x=1739939741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPu4S32qezSc3KLY7SyMngOyXn0YoKwhtJNV1US/CBo=;
        b=SNvzrHOZywDR7XfCZjlk5B5zqyGWiv4Z85FwNl9mluGx5DoT5C4wVNIBia1smtqTzh
         /H0cKVuXDIt6L3WwclJsYCb9DCLvmTLGvUhekVE4bun8Bgd35tQZoY82/jaGWqAhOvF3
         311OidG/td6LuTlNBTzxHNK5MiPO8jw1acJts29rmavMkiV+Z92S56RcKybvslMQUU9B
         ldVDmHrrAgE6DrXGWvnfMxmEp5hYcgm3uZq/ppnlgDtLr7LS67CMPsksyzV8Gc4aIyHY
         jA4xyH0BrE4PwT9e82Chbk9LZAUH2BV64HlGncIZ25cue26L5DydwBV0GpQNSQMzplsg
         O8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739334941; x=1739939741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPu4S32qezSc3KLY7SyMngOyXn0YoKwhtJNV1US/CBo=;
        b=ZmkTFcBERrp8bBU6UEqqyGyuqto4xNp5TT+Ok0juPHXnqcNbp/HLImoLj0TujIpWXg
         ucw38o2WSkE5V6r82LJ2tBBKvcbHlPQfqBebgcjy6bjzo0qeNOi6O8V4rMVCPKHE9kT8
         jKQCN+bsMiZeHGHmY3byPQdcHttu4ZLQv/VRmYovJYPEc2yOAIIVlv+01RcTZb4b/OJ6
         tbphB0mzExPYeIr3M+VDqnjUijWhAd8Q96Ij7w03OFXkgdNDL2HuAy0EbK0m6E9dBFHQ
         wjLr3CXS6df47d7SoheHy/dwi7wXUxY/V75l9pMx+lgqkz2dpVflZQ38II7zOOOrOsvH
         KO6w==
X-Gm-Message-State: AOJu0YzgKGE3N1jaH8RCl5Hk244SjN8Yt7ptFOZNYV2ftyZ3IbiAAfV+
	/ljhiI4fj0uRHKF3b3KXZvrh8a5yYjPNn8M9BjLWvu8UkqvZlGAqoRMbDQ==
X-Gm-Gg: ASbGncsCahOD2z8UrMgCxOhG9MZg85g5oXaml/JzkBOAlIP1TkGbarakzT2Jq8655K1
	5yEoTm0AmEj2vlYjHfuePXktYCGaPqVIAGQpRGWDeZGlKTemFw/1KgbnGTKdtI8qsZnQLc3hH8B
	uJ7tYVr4d0uf43AwTkIu0K62f4dG6Wg1fUhMEP2/BAgBHhPeZrPp4gTRMKJfR5kQi0QI8uK1aO0
	DjPYRZKhNK5ITBtxKZRj8WCdwJrs4xNtM1K8aKMtCW3vpL0vm+Hzzh9jy9So+ZYgDAk9Br4fPf0
	QB7HaeImeXLNl0rybqOL+zICCCJQuEDF2/5lHZVO37O7Gg==
X-Google-Smtp-Source: AGHT+IH84gSWMIPql1gZ48jrfuGUNuac4h0UQkSv4A1MEjRNXONwl+WKUZ5XBV7G0KX6ztBwCAP7Vg==
X-Received: by 2002:a05:6000:1a8c:b0:38d:dd52:1b5d with SMTP id ffacd0b85a97d-38dea2517c9mr831351f8f.4.1739334941220;
        Tue, 11 Feb 2025 20:35:41 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a070ea7sm7487815e9.25.2025.02.11.20.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 20:35:40 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v12 4/5] dnf: Set SEQUOIA_CRYPTO_POLICY in wrapped tools
Date: Wed, 12 Feb 2025 05:35:31 +0100
Message-ID: <20250212043532.1258912-4-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212043532.1258912-1-zboszor@gmail.com>
References: <20250212043532.1258912-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 04:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211206

Point to the crypto policy file	so dnf can work with signed packages.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/dnf/dnf_4.22.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/dnf/dnf_4.22.0.bb b/meta/recipes-devtools/dnf/dnf_4.22.0.bb
index f9d6ea1fa6..e5ac3c9824 100644
--- a/meta/recipes-devtools/dnf/dnf_4.22.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.22.0.bb
@@ -69,6 +69,7 @@ do_install:append() {
 # Direct dnf-native to read rpm configuration from our sysroot, not the one it was compiled in
 do_install:append:class-native() {
         create_wrapper ${D}/${bindir}/dnf \
+                SEQUOIA_CRYPTO_POLICY=${STAGING_DATADIR_NATIVE}/crypto-policies/back-ends/rpm-sequoia.config \
                 RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
                 RPM_NO_CHROOT_FOR_SCRIPTS=1
 }
-- 
2.48.1


