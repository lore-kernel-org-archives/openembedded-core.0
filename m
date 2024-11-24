Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24EAAE668B1
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 13:17:20 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.66538.1732454239588921250
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Nov 2024 05:17:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NVG0fnCU;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so34097025e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 05:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732454237; x=1733059037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJmVW9TPO7lrusWPN3Y+ziwcNKX+KjMuOkFVXZwbLWw=;
        b=NVG0fnCU9YRDPfBREOgxwZ7hDHagwnP4A/MXvCGqmVY9w2f0vHtJcfHsFymUptOHGh
         CRCJ/WYXbjbuNw2fQQYn3PP/V2++X+UwAryCr/ahe6uHrx4Mvge/ZG5de3ZF+5/DbsJo
         66fKEErI37euax9IH22I3Rzk39kKddjdFZi5W5r/y/ekQpEmbCxBM1oo2WiNhoPU0Jc4
         Rk6eVZXVaA3D6ICxPDmEJ/K7IKxME3ZHv/wErsMJxOKdhp4vEo5w4pSaUoFR7mntZorS
         4ciBpWcg/ZYN0bBKuKwDXfQ7ZZnpYA/f79770TwO04w8KsDSF/yD+0EHvTDHOWOcpBvo
         QrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732454237; x=1733059037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJmVW9TPO7lrusWPN3Y+ziwcNKX+KjMuOkFVXZwbLWw=;
        b=YrOAf+xhpEYm0g8DoarVIIem1eNmWFJIzfaM3zXbmXY8Rm3XHUADHLma2LL40pDi7D
         a6C4ZTmnoUutmXt3Q188mJse+rgsqXlSUQLvu9HecGjXaBh9BZ3Z3GUbsMDbCt/AtVwN
         Blarlgu/c3WHHSWaBCAje6ZqLguoCS3nbRE8ijCXxmMkh6vLgIh8P6v6nO6dReeFQDgI
         g8VlyHSuXR9gVtUAJ6FeZnJI4I0lMXSyIQ3dt7eSB5aCnBNlZDtPNi6NWqF/enD6uJoH
         H0OuYhWnwzPEOQUx6DzvuzQgghTpbXw7p/omu9+t554sIMHTwSy9hKzr1fa1F1U+xY4a
         57Bw==
X-Gm-Message-State: AOJu0YxqJ8kq6wtfl5BNSuVej8/9NJE4RDNGPqlQIym/RO9eNgeV6nI0
	C+09be8cJQMWM1sqo6yeriw7Nmg05zytcXec7Egnurs6IkpkP4x7902tcw==
X-Gm-Gg: ASbGncsdKz9S6n7S0vbYg0eCWSErWKl01SUIbuXd8HJc7KNqrFbj+JwFpyzJLsFN+G7
	ldYpIh06wWa/AuQhbr0ziP/aJGuaex65ejqJV0hj1q3DZzUWD9ATiulQDvfJF3+RDqjd4sK6Kvs
	MQL6vLVJYJ/8ia+eLxsdc+/HbUjUvWhIH5RTEFD1seTnplYZJMTyYaekLaVJLGs9Cp3/m2cJigc
	4rHh2vYCPNhMnQUqLFiXj8h4QvIN2QtqLbVYjuew8Wy7V9ycB+mTDcHO0bYRP2X+bPd436uHWU=
X-Google-Smtp-Source: AGHT+IHj3RSsr4UXdRFTklUtlN+Zq0yC0KAcWnEkIuTwcdbm1ZfE4Woqhg5nwYqU4C5djYzmljHf1A==
X-Received: by 2002:a05:600c:4692:b0:431:5f55:28ad with SMTP id 5b1f17b1804b1-433ce495fd4mr71276545e9.22.1732454237061;
        Sun, 24 Nov 2024 05:17:17 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349cc29406sm26546375e9.0.2024.11.24.05.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 05:17:15 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH v2 1/2] systemd: drop intltool-native from DEPENDS
Date: Sun, 24 Nov 2024 13:17:06 +0000
Message-ID: <20241124131707.4129-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 13:17:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207707

intltool was dropped as a dependency in v236
See commit for reference:
https://github.com/systemd/systemd/pull/7313/commits/c81217920effddc93fb780cf8f9eb699d6fe1319

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-core/systemd/systemd_256.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_256.7.bb b/meta/recipes-core/systemd/systemd_256.7.bb
index 97537d09ba..c17100a636 100644
--- a/meta/recipes-core/systemd/systemd_256.7.bb
+++ b/meta/recipes-core/systemd/systemd_256.7.bb
@@ -4,7 +4,7 @@ PROVIDES = "udev"
 
 PE = "1"
 
-DEPENDS = "intltool-native gperf-native libcap util-linux python3-jinja2-native"
+DEPENDS = "gperf-native libcap util-linux python3-jinja2-native"
 
 SECTION = "base/shell"
 
-- 
2.43.0


