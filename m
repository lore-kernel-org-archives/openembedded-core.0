Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28886CA0EFA
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 22:41:55 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.2464.1755816106263544537
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 15:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bC+zBtzW;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6188b5ad681so2169381a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755816105; x=1756420905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAAOX2DHn2Wv1PMgD2Uwp31yHJVoI4n54+01juUsYhY=;
        b=bC+zBtzWc9ZnfaOFQxzE+1TXRutv6bg5olFuf4ZkT/uzUSzFmpG5RUIzuGzgcRuKGU
         aad0X0JQrGGbtD4xI1NlvCryo6krM4Las39/D7JWRAsD0ad42cFWangzyC/hURLf5x7R
         ggAUC7NHF0kCE3FfWkslHkAZOG96Wo2mpNhSCiNs/vpFJMYTXTiCBkiCH53LOJ5TKLfC
         15Lp+xYLNF/UxwudYEnzLveswr1ORveSD4CWbd0tr6rbXY/tEn55ITEgWqslRWgwzB+g
         uKFflUNw8E3zSD8GSoUlIP1Tk7BJ4fGKt+KQ1z1ojBt2Zm5+14ilxkK1TGDkpvLEO7P5
         OxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755816105; x=1756420905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LAAOX2DHn2Wv1PMgD2Uwp31yHJVoI4n54+01juUsYhY=;
        b=jIWC6b4X5cu3xicgdqbGn46PK0wHelhlwoloFIQNmmfTtqgkOYmT23TrGff56QwQMQ
         Sol8OudnwGzSN1Nn1rFD7c47DAkNmhlAOP+5jYs85myF314dPx8L0V/JpFfDFxmkv8pk
         WJuETQyK7xzzRrOinLe0n0R5xjjAgItrL5Gfhp5KqCx+i6bLzvlTFN1waADEBGeRfkcG
         ZrDpMu87/NuyB4Yf7ACcY5GOx+VLGilyTuHdi9+xd/5JdX0Ta6OvguaKZPCSFwqdB3BJ
         idkg9SOsHyjGGW0Q1i8QeUtNi9qf1ShJKgRfAZpqUPNR4oe/r9pU6+xj9HLOkS+tXzeF
         GClg==
X-Gm-Message-State: AOJu0YyVCLPGw+Px4fDH3ZRW0GtHm5J2TFwfpLuOW3Gk20qQ0gRAu7lY
	iTcaTsepA0CYiNkmvlhoRovIGrbb8s+hzj9JBsHAHTZsrvHhQrcyK+somoqI5A==
X-Gm-Gg: ASbGncuAWAewyPrtJQNY+ji2GLgRjjY9PlfoqeV41+fNmZO3WhTypHI6eVRMHuczQ1W
	Cuaj7qtT8QaWLpmRQlQCVOB1F8sMWgcSyUBk2IChrj6XKnfTcOU6Ht+gDl63YOiGA1kkrICfw3R
	XkbNu5811DERIjVMeYehRYRgIwqbn7neg+nVUJPtbQ4LHh6nrMLNzO2Hs5D5GfzuawEpOlmm9u6
	HUmk+FD8YAx/F1zit3x8vI2aXhFWuWN2dpjWdEq53DU+ElJeB0f/fJM0vYc2m31mzlFQkboNWka
	C8ZjPhVCCIYKqa1wiWBwTtprHy1rJXqhYVCJfJFhdDqMHhF7UWLoIIX8N9/Z46UoZmbbDaxKYXH
	t1PYshJougz/Z9O7RNL3OflSY9hoYJejTfZp0oCd7Tni93+GrWMFeFvYW
X-Google-Smtp-Source: AGHT+IEpvlz2x5IbgAG8pZSEVwbT8erNTuICcrKRo56fAptO0sIjAx6z9POG7U7bfVW85mA5E0iVTA==
X-Received: by 2002:a17:907:9443:b0:ae0:68a8:bd6a with SMTP id a640c23a62f3a-afe294b4608mr68077266b.15.1755816104393;
        Thu, 21 Aug 2025 15:41:44 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-afdfc4bfe65sm339191066b.85.2025.08.21.15.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 15:41:44 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Michael Halstead <mhalstead@linuxfoundation.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [walnascar][PATCH 2/2] yocto-uninative: Update to 4.9 for glibc 2.42
Date: Fri, 22 Aug 2025 00:41:36 +0200
Message-ID: <20250821224136.1674019-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250821224136.1674019-1-martin.jansa@gmail.com>
References: <20250821224136.1674019-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 22:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222285

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index dabd604e8e..3ced03d477 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.41"
-UNINATIVE_VERSION = "4.8"
+UNINATIVE_MAXGLIBCVERSION = "2.42"
+UNINATIVE_VERSION = "4.9"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "0d75ae3cc6e8245be40f55d48612285248ad331896ca3f4c772ed2fb34239fcf"
-UNINATIVE_CHECKSUM[i686] ?= "2cbfd7ad3e1362538764999dd4962eb2511211867ae17a327b65631f64f38e31"
-UNINATIVE_CHECKSUM[x86_64] ?= "6d5e28258176c52b9eecf882d4553033fa700902e60ba80d4b7ce0edacbe41d6"
+UNINATIVE_CHECKSUM[aarch64] ?= "812045d826b7fda88944055e8526b95a5a9440bfef608d5b53fd52faab49bf85"
+UNINATIVE_CHECKSUM[i686] ?= "5cc28efd0c15a75de4bcb147c6cce65f1c1c9d442173a220f08427f40a3ffa09"
+UNINATIVE_CHECKSUM[x86_64] ?= "4c03d1ed2b7b4e823aca4a1a23d8f2e322f1770fc10e859adcede5777aff4f3a"

