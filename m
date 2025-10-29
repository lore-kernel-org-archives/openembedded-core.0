Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EFC4CCF9F6
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 12:08:47 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.4583.1761739724718570799
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 05:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hb0GvlMo;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-471b80b994bso98230115e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 05:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761739723; x=1762344523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuWJNRCxAU77n1jtds1E5srChcs1ir/3seUK1u3XTWw=;
        b=hb0GvlMoDWnJZG5XTOwYzmAldz1zbyzQctR5yxxZqzmGqtleOB3Ty6LResy7qw/BGq
         eWB7DXRcSek7zGAGggQNWKsTVFlpdu+jssYiyttue2oBNAiKol/VnQW6TV5KHks+z01c
         G4qbYeP9q8n+5csI97qBbuSjZyWjFD58kII5/hZGsfH0i99bx/QSIBNfur3QN4WwBHzR
         sr0Vl7oNMwwBriXGxOst25ZihcXglSDFGeNpxij5Fae5MtbSTEYplu7sGZe8ENd/8dLz
         BNmdQbwXeSdE+E5nWNi8GdiYseRKpoxfYmwpVaxET0Cm2pGhiLqDkBzJRwwuQPZ9zjlG
         WOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761739723; x=1762344523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QuWJNRCxAU77n1jtds1E5srChcs1ir/3seUK1u3XTWw=;
        b=xEQ1UTtU++kkIBfXxwDbOA9DbgAzla2mHFvpU40chWmnDPsIH3KjzcLiL5+bzCebwx
         wrg7vTHIslP5f1teebL6KP/bXaXI2ld+ZMsKtlqTiONnElW0FGQc7v6udX0+tbAcSIzw
         xRMkTvpDMuIV2uPMC7rlFmj6+ivnLwF0WjFb7oQAm/hf+1uONirisujO+pT7AMMKZ8w2
         TNl2Be/2j1Az10QHcNaEr99DJ4inKxql0odwsy016cLgjPL3EKnIb0tC0YiycWJ9WCW6
         /Wtq7EZWHUHPYQsvPn4SgsIWP+GDWuSZUVInu9lgYySQQYsq+vVafFXSvhAwitPHmDH7
         A0Mw==
X-Gm-Message-State: AOJu0YyosY8p6/Ug1vla48d79i2LRMdcnoXLm5C/alO348iDfxSETAsQ
	KiEg3084z/6tJmewS4XtAmBf0AeHwn2SO7JKj7BlRdzeBKdA/hzHR/2qMIDfkQ==
X-Gm-Gg: ASbGncsS6tBKBZn4mak4/sfpRw19jRl2ZN1C/xdrU2baXdRrqprwcl3NVHGYqFFHQCJ
	vRGtujQ6/yc29Uz5M3wPYcZXynXBGXVY5fuA4g9urcCpOAWEkI7IyIM175XDxUgL6my+E/XLzdv
	q0+Ar9ccCVRfXy09y4SKCf1xJ8RyN4ZnlMkiE0Tu9Xemnr63T30Wh3+0JPtFA4bmXuKkjxvQlNc
	MWxiqB1qg/Tei4Dd35AWsrnRseKvrspla5tXJVXBI9k7Z0W8kEKoy/JLk5SeFbfjTxt92sP/p9h
	izJTcVFhSt2LwE20tFSEm0+kWp/D7a8BCVZiUajfvHjzHaqrqf9Z2hqKB1dLJgblo80A91dL1M1
	0mTFQI73B/C/o/Q2Bk5SVhnQ0JlPbtW2/qfMcY0/jjeGz1SlZxxRp3s/DJYdGy+CNCwAJAOS5ST
	pmhzxaKhfNZ8yXG2If8XT22hxhAViIMTzFUfHxZXmMuoKzOVy84Rpu9eLJvbxCiRWdA+PWUwC9o
	Yuv+2pWU2Hjh0UNTm+FbAOlu9ZEt+PX4UV8IS4=
X-Google-Smtp-Source: AGHT+IGQWxGPSojg0Z7zFWGWNlwR4zsKr8IEtaIOriOZTpZCER6qFhQK0RGhZVRWvQVwa2inHxuIiw==
X-Received: by 2002:a05:6000:40ca:b0:3e7:45c7:828e with SMTP id ffacd0b85a97d-429aefaf7dfmr2030904f8f.33.1761739722928;
        Wed, 29 Oct 2025 05:08:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b2dsm25685793f8f.2.2025.10.29.05.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 05:08:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/6] fragments: add a 'root-login-without-password' fragment
Date: Wed, 29 Oct 2025 13:08:33 +0100
Message-Id: <20251029120835.4075555-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251029120835.4075555-1-alex.kanavin@gmail.com>
References: <20251029120835.4075555-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 12:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225452

From: Alexander Kanavin <alex@linutronix.de>

Please see this for background/some discussion:
https://lists.openembedded.org/g/openembedded-architecture/topic/115913545

Care should be taken to not enable this by default, and especially not for
production images. Poky and oe-core default templates did it, and it was
not a good starting point. Hopefully the fragment name, and the description
that users will see when enabling the fragment will provide enough warning.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../fragments/yocto/root-login-without-password.conf   | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta/conf/fragments/yocto/root-login-without-password.conf

diff --git a/meta/conf/fragments/yocto/root-login-without-password.conf b/meta/conf/fragments/yocto/root-login-without-password.conf
new file mode 100644
index 00000000000..e3857fc44b4
--- /dev/null
+++ b/meta/conf/fragments/yocto/root-login-without-password.conf
@@ -0,0 +1,10 @@
+BB_CONF_FRAGMENT_SUMMARY = "Log in as root without password on serial console and over ssh (use with caution)."
+BB_CONF_FRAGMENT_DESCRIPTION = "By default images are built such that root login is disabled \
+(which is the preferred, secure default). However, for testing and development purposes it can \
+be beneficial to be able to log in as root, both on serial console and over ssh connections, \
+which is what this fragment enables. Use with great cauion, and ideally only in tightly \
+controlled local builds and CI testing environments, and never in artefacts that are deployed \
+into products. \
+"
+
+EXTRA_IMAGE_FEATURES += "allow-empty-password empty-root-password allow-root-login"
-- 
2.39.5


