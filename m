Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B490ACF58D6
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 19:56:20 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16221.1763582175073414108
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 11:56:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MStL7h0q;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso1663675e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 11:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763582173; x=1764186973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWL6Mv6zSYOBj3OQBzFLXoZBK3mW1Gn2TmDcDMnnqXg=;
        b=MStL7h0qyN1H8MtXW2KY2anWUp+KY7M8kulrlYeCW18RVey7q6JORKzh1IW5xPW4z0
         QRWK0V5SYQGOgLYRYnGVUbq8jT6k+BKlv+y3NSOJRIXvyuBKwX2uFfZ1FQDh3vsFYAIZ
         bksM4IxNrhOm+BZ6+ys5Yh8qVYE/9iY7BfQMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763582173; x=1764186973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TWL6Mv6zSYOBj3OQBzFLXoZBK3mW1Gn2TmDcDMnnqXg=;
        b=ZiYiPM+kkW+tF03aPXNERBD49enyXD5Vwkh7MfBVhAha38SN0ETDq7qUAZ/u6sylnQ
         jF6nBddsKXq4NeNfWZTQseR43txCYjbnzi13A/qVS44Wua9kJ4hCBBCgGdOK4voB4s1M
         RVrzmAiS7FHZR4F7jKQ78ns7DAz+mtHtC2kRpUcYXP7LH+mDEIIh0fp0vmCEMmxCtL94
         n1MTH8KNSUfADtyQgWv4Ra7R5SLlSZzHGanm2qS7qrcgc3RcWgx/o1eFG6hHSl0q3Bxj
         tbd5ewJ84BXfhkVNkTRxgYUw4mVMLo+wqgu6Qkhi0vWs7uKvmuisYjrZ2vClQnHYsh5w
         DPNg==
X-Gm-Message-State: AOJu0Yz6lks7x6/PDLKzhNPFczQzgtOgtjQfUKH+A8jt068pZ5YOz15s
	ZnGA1md79vf6+Ki2UjYLSYPWqt/B1G5XOSNrDO4jONzT9hLbMjG75hL+94gt0uiCGf5y0SdxZNk
	ejRdKkoM=
X-Gm-Gg: ASbGncvWC8F1x/87VeZ3naYXtp6yMfHJPp9box8NiBJnocPrydKjTylEUmAdN2E0qYX
	pTZpxbozb2pskIjDjACIJ5IQavK2PRi3wfslSr3YdbHC9Yjln968VRHg+G+ImcqMvQhwVKrYJUc
	nOWQBaQBMGWDpaOjgw/07eFXJNplltOAn08X0/MzlylsTK2QIGnTYt+1JbM4ECxFJ6znVEuKUEO
	Lc5zW5k93uRoDbMqcDePmtzrjhXhcAZ+gfGUouukvN7kadB02MpgPthHSkRkfpUU3UJcneM6LzQ
	1bpP2Fm8Ki3u3kYZ9fh1U/k2XETffCcQvhR13gjoAT5DoLTg8zlxO9JOw2PcB8z+mxsDa+zeNmc
	DzFEJGLSwog3B40KuvsOwbcHEXx/01h2wraWPYBP5tZCyIxJ+NyKeudYeNIoF3O5aU+lMf6i5Av
	GXy6elOITJXWuGPZ27bBoT377Oj/8Dt2/lqJ/1qhnnxMiAgEmGolBggT1K+aPeg5P+AibVNYOGo
	dA4zvxBenUSVp9o0oXGTeYHExZO11Ix
X-Google-Smtp-Source: AGHT+IGIOoDFEsrcpxhUZ9WEBjlGC7EJCyHZoUrHZc++NWDGqzu4CtEXHzMGkOeF53w26E0Drb52+A==
X-Received: by 2002:a05:600c:3586:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-477b866e362mr4179205e9.6.1763582172524;
        Wed, 19 Nov 2025 11:56:12 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a96a58c5sm50519895e9.0.2025.11.19.11.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:56:11 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [RFC PATCH 3/5] meta-skeleton: Add rust-out-of-tree-module recipe
Date: Wed, 19 Nov 2025 20:55:38 +0100
Message-Id: <20251119195540.2671856-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251119195540.2671856-1-yoann.congal@smile.fr>
References: <20251119195540.2671856-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 19:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226583

From: Yoann Congal <yoann.congal@smile.fr>

Basic template for an out-of-tree Linux kernel module written in Rust.

Mainly to test Rust integration into the kernel.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../rust-out-of-tree-module_git.bb             | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb

diff --git a/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb b/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
new file mode 100644
index 00000000000..642fa80319a
--- /dev/null
+++ b/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Basic template for an out-of-tree Linux kernel module written in Rust"
+HOMEPAGE = "https://github.com/Rust-for-Linux/rust-out-of-tree-module"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit module features_check
+REQUIRED_DISTRO_FEATURES = "rust-kernel"
+
+SRC_URI = "git://github.com/Rust-for-Linux/rust-out-of-tree-module.git;protocol=https;branch=main"
+SRCREV = "00b5a8ee2bf53532d115004d7636b61a54f49802" 
+UPSTREAM_CHECK_COMMITS = "1"
+
+EXTRA_OEMAKE += "KDIR=${STAGING_KERNEL_DIR}"
+
+# The inherit of module.bbclass will automatically name module packages with
+# "kernel-module-" prefix as required by the oe-core build environment.
+RPROVIDES:${PN} += "kernel-module-rust-out-of-tree"

