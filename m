Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B9CCF58DD
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 19:56:20 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16290.1763582173508908852
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 11:56:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=r5L+0JVC;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so1041945e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 11:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763582171; x=1764186971; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMvc5Xe2AV5XWfpViGz8eSZbZ3+Nll5/dIvunCLsye8=;
        b=r5L+0JVCi/mzq6sBsO9il6omC2YtwFrPG9mXFNVPJmF8tVE1D2YrDkZViKY4Sfr8CP
         JSUczMWn470awHKBGCx92KjUcQSkUFY6KvLp645VC4laLsRjm4wO7uTjZxiKk/W88lRA
         3Qq70LeicLiKYLM9VI3TlSz64bknazCOoZ8Ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763582171; x=1764186971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SMvc5Xe2AV5XWfpViGz8eSZbZ3+Nll5/dIvunCLsye8=;
        b=AlpjKS99DoUtdS774KIQ885gaB/sgE4Md2qUDTnjqskLeaaHW+mzh7HHUrqiRQfZqJ
         yKTjkmbOvTvhoNOaf9TXJv9ufOnHh6xwKKqHImMJU7jB8zww8mLAy0oeRPTUmJ2a2dhr
         qVqS8zRleS21DCjpe8F3EJZE6/70gWaqsJKwgqclUp09UiAn9D/Q6a8ZQEtGAZmdajOl
         IqptY6J6h01vb2QoYzVu09Qdcx4zfnRMnrO5J2z84xL6fpKmsTvDb+HQXjXINLmUqSD8
         Yw8Fzi1uvQWbDwE/i/b2iJjmAwCjFX3IEGZjsvAaQyQzCeWzGALfnMIGwZKvkyN0xC98
         XkYQ==
X-Gm-Message-State: AOJu0YyAx/HPWigXO9uMijCXjxeUq8GmmwcOAxqL0CqT4kIvEu2z6OMI
	E4LGLsB4Hov/rqOrfiwS5LMAIx4UNmyiIfoxfkyE4KyAl4BXiUqxv0NIfi9vNO93dslcBQ0dp4z
	gpsr+1EM=
X-Gm-Gg: ASbGncuwcQXSInhEEfiuTCK+TByu53t2ehCDaMV4CnjafJHG68K/1ZCT882BRnwROX/
	ofPltCYIVwhdFBWzxdzRpmcc4pp8tIS6hfa+UhUCkbcJgXugsD0raV2k/iW4LHGfr0pF77vP1U9
	SJ8WWkpuQNl6BXg2P0/XX0FTR9WT94eLWECGws8cJ76zdlT5flAy5xddc0QxdkozujjV/Q06wyC
	OJmxI/oyLTjHxlCmqjdpEnM8ipHNuCyIU60F2kbfp+g9sqi+PnU5NX2COhksxWd5IYS0Jym4JRg
	4LLUFhx2/fWPRL/XcC9ESyTCwZGnEKG25RcjPYfzABK9iIyChFLO1G3SVqYrRjiVfL/9A/9Urp9
	Yv/BkHGz4x0H6LuT0Eq7fF8wEpkzA90GnDENbuBpaSKlZ8eVVIVkt10+evIrZ2hooxThJnxcaMW
	/0fPyl8v1BrrvtHbJA/hAztNvyM1KRcw0z9K4CBtEL1oBUC/XPMA2CxUQ0giSudifgZ/ox1Fh/y
	BR5+jvPAR0c5u8o7f7BMvpm8DsLwBmR
X-Google-Smtp-Source: AGHT+IHKdWTY/cxcUsn+i8NR+qlPPLcSa2bQXmpJ7vdqw5PYV7JGJ/G7GLRebIdioy/swxUAG6PzDA==
X-Received: by 2002:a05:600c:444c:b0:45d:e28c:875a with SMTP id 5b1f17b1804b1-477b8aa06c0mr4687085e9.31.1763582171443;
        Wed, 19 Nov 2025 11:56:11 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a96a58c5sm50519895e9.0.2025.11.19.11.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:56:10 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [RFC PATCH 2/5] module.bbclass: Prepare out-of-tree rust module compilation
Date: Wed, 19 Nov 2025 20:55:37 +0100
Message-Id: <20251119195540.2671856-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251119195540.2671856-1-yoann.congal@smile.fr>
References: <20251119195540.2671856-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 19:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226581

From: Yoann Congal <yoann.congal@smile.fr>

Conditioned to the "rust-linux" DISTRO_FEATURES:
* Add dependency to rust-native
* Remap ${S} in compiled output to avoid buildpath errors

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/module.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/module.bbclass
index 4948e995c5d..7dbd4194d17 100644
--- a/meta/classes-recipe/module.bbclass
+++ b/meta/classes-recipe/module.bbclass
@@ -87,3 +87,11 @@ EXPORT_FUNCTIONS do_compile do_install
 KERNEL_MODULES_META_PACKAGE = "${PN}"
 FILES:${PN} = ""
 ALLOW_EMPTY:${PN} = "1"
+
+# Rust module support
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'rust-native', '', d)}"
+
+RUST_DEBUG_REMAP ?= "--remap-path-prefix=${S}=${TARGET_DBGSRC_DIR}"
+KRUSTFLAGS:append = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', \
+                                             ' KRUSTFLAGS="${KRUSTFLAGS}"', '',d)}"

