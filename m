Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE795E77180
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 13:10:54 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.78495.1733663450917586451
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 05:10:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z/2c6J8Y;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so1900736f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 05:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733663449; x=1734268249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccVrYvktVBX4hX+RbQm6k50+Suwc5+z+zWjyXYbJQNw=;
        b=Z/2c6J8Yui+TLnjo1meZYonh7y+2N7caSuchO2Qj2MQh3NxIkRvf2AhUgVRmn9IDJ2
         aFwnml7reictMSBshXUAEtm/RQRa/TaJF2ngbW1NQ/hdkK1BQIpcg/iBj/JTLEdJPPqi
         glzCnrLF0jvFQvLd3mfCi2kvBymF1L/bjCHjKQJy4O41N9aRHNRD9gHYR0ykHnaAEvxF
         SOBDgP0ASFWO8RUsLp68d5lGJGLlL4CXewkerT/qZWI3k54c4r+mkgxW4Yh7l0RiFvpE
         A/Rh0PtUWUdBbRNooWySxL1ex+q+Iv/A7r9db92pJmRQijhXiRwcrkxBediQicMTJI0H
         Y0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733663449; x=1734268249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccVrYvktVBX4hX+RbQm6k50+Suwc5+z+zWjyXYbJQNw=;
        b=TK9e3WDNVzelT0Jyso2HoBL6ME3RsHX97BDv9cvomI0ZXVn0kgAlPRFNR23tL0E3cK
         6hKAW6d+bV2FJqpQkTSE0P3Q/W47y1l8pgEkhfGZsKkq+i5vuUmOyvVqt7TObwyj6QYH
         kuURINHp9M6Od5vi0PhNnBRTbHcT+aCYyoUaP1dzs0QAgNFUMOyM4sgwqbjrsRd7PPoF
         GzWkMugfuXC6tOeZO2X2eO+UnBPxHU9dKv0NZylRmTJap/WTM+VRuIR9h2PaYu572DRX
         /dQxofIgWAmf2RQpuMj4fvSAU5Luz7Xk+hWJT2R+tBJmbm/HuEThn54HtrJWMCjFufhz
         oU5g==
X-Gm-Message-State: AOJu0YwEv8rCleU+1KN3G/COrur/OjS5IGBf5guQbU4pTtecOEe3DRrs
	Ty6wX8LCvoo0/G66zDB/3rgbFuOp0XnstR3TPDXRueYVNdY60xlNdQYCTVXp
X-Gm-Gg: ASbGncspXcbS3hnKtXfmLBBqUBiW477cGrQ/g8RrHkX4f3jQKIHnWy57JI2loLHl20s
	6mtCNuOM0KogBjrnOC2dbfSUtQoZMiexzFurOM/hTPGeJwdgR4SX9OYbWUcxbj794wJEeoAjrcS
	h2xOWba9dWqJGmdtKt9nPfcMQlXlfGUDc9YgQ7zssk+XX5ldgjU/QmzNnmfjIL1s8D3mFzGNG+y
	dsp4/1acWEy7JO6s/VXNriJkcPPy34HRObz4/NPlVO8uJhCqw7u1CYM0VaWJz7u+6CtKX+X4zY=
X-Google-Smtp-Source: AGHT+IGW1iQl7aN/ivA7wSgmzsDnwiBW9gtOldPBEd0ndR3OsXALKVX5SHUaBeHbg6i5AUFBgu1seg==
X-Received: by 2002:a05:6000:1ac8:b0:385:fc32:1ec3 with SMTP id ffacd0b85a97d-3862b36b015mr6771938f8f.20.1733663449009;
        Sun, 08 Dec 2024 05:10:49 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862a4ae481sm7522689f8f.25.2024.12.08.05.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 05:10:47 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 2/4] systemd-boot: drop intltool-native from DEPENDS
Date: Sun,  8 Dec 2024 13:10:32 +0000
Message-ID: <20241208131034.4696-3-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208131034.4696-1-gudni.m.g@gmail.com>
References: <20241208131034.4696-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 13:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208456

intltool was dropped as a dependency in v236
See commit for reference:
https://github.com/systemd/systemd/pull/7313/commits/c81217920effddc93fb780cf8f9eb699d6fe1319

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/systemd/systemd-boot_255.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_255.13.bb b/meta/recipes-core/systemd/systemd-boot_255.13.bb
index 4ee25ee72f..397316fe9b 100644
--- a/meta/recipes-core/systemd/systemd-boot_255.13.bb
+++ b/meta/recipes-core/systemd/systemd-boot_255.13.bb
@@ -3,7 +3,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
 
 require conf/image-uefi.conf
 
-DEPENDS = "intltool-native libcap util-linux gperf-native python3-jinja2-native python3-pyelftools-native"
+DEPENDS = "libcap util-linux gperf-native python3-jinja2-native python3-pyelftools-native"
 
 inherit meson pkgconfig gettext
 inherit deploy
-- 
2.43.0


