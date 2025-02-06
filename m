Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660AAC0219B
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 04:43:12 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.32821.1738816983200380343
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 20:43:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I/m1La/v;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so4386125e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 20:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738816981; x=1739421781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnSDjjT34p8QEzt0ueFTBVkiBtVX10f/2Lbca0f+/S8=;
        b=I/m1La/vfMGm/TbKZKSHwis0JJh9AKnYXTE+4zH7uNzl3x5BnWZHTqZOuU91BUNPS8
         wNkCeDjijsm74/nOZNlVb/SnOoSprpVb8RcSfpjjMyvDAYHGEaDtLJG9WJN6GUsYv+uJ
         jYjiJVc9gQf78YNmFvwBTf7LSwrkFSslOFF0Gm3AFlSGRFeB6uNpYimTqxp96OvwHWdL
         fhyJq9U1CIJsVxKYD1uobhzG/Ge7P0krS7gAjvpyVhEXbIEx0+KDGr6bVuZGneDX6hb/
         6d5H1IfKtkM8hL6cMHsogtcVsynW5sdW1izNZ/KH5NcCNApS5JTaP7DfHKampHX3Yrgl
         sRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738816981; x=1739421781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnSDjjT34p8QEzt0ueFTBVkiBtVX10f/2Lbca0f+/S8=;
        b=P9G7JUiu9IAItftDNzTF2qGTYIn+F26CM+TAInPpMLzxY4MbVinjo1WM00lXb0Bz90
         LYOxDLGwdHrOXFaQWmZt/I8xq/+41tt3p3BYN4a1DVk9j2xp/TidT47FtPFyrXpXN2A9
         t9wnC9LRvftsQdotjg2u/tJmO+ELQ9UA7+wWX5Vi8+tYDrP9diXva6dCOx3ko56bWX7b
         s1R5dJpYcFOPkGiQjakiXfPfGkSbeHCkA4oVN4/SX0I1mUylkQZ3DiiW68dTgeslcgcT
         8ecdNIIKM9GVCWitc8cKSYezK4Vn+O7h1iiMz/uiNHF+bj2knmWRDrYSb3Xv4hoFqFxZ
         ye4w==
X-Gm-Message-State: AOJu0YwlwqaaYTPqavw4dKPuXUKDcP1D+OBkX8+eSCNMEwa7Y9xBIrrw
	BBvVOb8eMmptH+bJ5/T6xbHe0dIqktI0OOaZjYEyYez/kEYMHo47ujcK3g==
X-Gm-Gg: ASbGnctmt+iODA8Sgj5fAQBxam4KnT5t/62yRFesl3StJ1K67C58xovDb32wW+HVDe+
	YiiV8ytX9ELF8vf2BCQt1I1//X7gcBQmT9KOTotU53sMpjoxfEU8L+LzMr4D1P4KTmtTjkl5n2t
	/3lqTYlBSIF+eIHfjkqTlyPLyOmsJMizHr8csvNCi4YcxOrJMMZYFhgdH/njIPaVLVn0VXstUm+
	patwp6rxttZNymNE5nbyrFw3MEJWbJN4szJQGP9FsGcIVIVrEM9iIawanYtwtNKp3BShH8lvd7t
	WdgMj6c5ve6/lhTizw8OUeQiu4xfJ0VtowsnTNvdi3OZMA==
X-Google-Smtp-Source: AGHT+IH+1e9DAwOzX9m0Reaz2c1HvWq+9Wg2WxnZCKvGL5+nnJmsCRCko2tHmAiQU9yCIfqSp4XpWQ==
X-Received: by 2002:a05:600c:4755:b0:434:a90b:94fe with SMTP id 5b1f17b1804b1-4390d43479dmr43341415e9.10.1738816981073;
        Wed, 05 Feb 2025 20:43:01 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dca34a8sm5819695e9.16.2025.02.05.20.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 20:43:00 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v7 4/5] dnf: Set SEQUOIA_CRYPTO_POLICY in wrapped tools
Date: Thu,  6 Feb 2025 05:42:49 +0100
Message-ID: <20250206044250.3311711-4-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206044250.3311711-1-zboszor@gmail.com>
References: <20250206044250.3311711-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 04:43:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210892

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


