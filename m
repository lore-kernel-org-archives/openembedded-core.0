Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3526AEE49A5
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:35 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71906.1767125545273167554
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MrA6n31m;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a12ebe4b74so182996245ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125544; x=1767730344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBCg26FL3coVbKY0JezK5Q3VZKsVp4OBNgYrEncFuvo=;
        b=MrA6n31mS2IXcoPHiJuBJam5KiYHb4CviABaZdJkSZy0LpWB690FhKYrF+XutdcIoJ
         5UCgojkOnIFF52ea89mTs5oACPSmTFGww4v4YpQy4u4UDjGCEyzXcxUF8qhRYr5lNYGy
         ztV7m0Hl+t8M0elOk366iueg4o9I1dTgjev9AGc6/oI854cwPNOKTv8zL1FFBji6UzdL
         MMRX1RSbJ2mqP6ODTsySAsWuM9EBGiyfDetRZjUsfxLKZrBOIp0GKye2YUzmBY/VpXD5
         kFvyqh/AZzrOW9rdNCCC8KPceO/yPBOuF6AlMdtIY2ydibkS01xRVhwZWDO088BGKbjc
         frXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125544; x=1767730344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBCg26FL3coVbKY0JezK5Q3VZKsVp4OBNgYrEncFuvo=;
        b=MIXQPCibediUfn2j/iP2rlDPUroMBGM/3y3/Z5wZr8gsylzG2QsImNR7BJSFy9kC3t
         q++0n92UfwE23QVb80r+m/WhwQW8danBKRA3OECT6vMSzitdiMwbTqDwU6MCOIXTQaLc
         1zyNzx2PcJ3qowaJeNjk9AB7QxyBv+9KDPrSZ6yaUtmQUc1l6acFKg/Zi5gs97LE+VjX
         RW/T/xC5IlTMQRYbLg4hqvbzGgtGl7EupcNQHoC3doWJntw/dYZxmhuh+5iwU1R3fc0V
         N0RMrlSQNzWjh9gIbTMDkBy47iEobPzA1FWm2qyd566G0+J962Ix3OFVU2ZSjFL5kklC
         U5zQ==
X-Gm-Message-State: AOJu0YzTW290swlfuqJQmc+VHKzQhNrTB5qRhzfOG4uMA7Khua1V2W44
	MUMINulTUUHsQDpRrjctlU48KO3+2iVRqcyZeyrIfkuPtXnopzzHofYVWcBM3T5HUtAuuujAkyH
	/81JG
X-Gm-Gg: AY/fxX4QoKJ1wYHZi3tCZQFQ4672bBg/E1YkelxqlpF35MMzc1UHodMCSF7VR5yc+lK
	6xWzi/ROgvohuvI/XYnlO+ltU4yI+W/o9/KIJssTQJMqJ1AjGpc7rkMeYWrofBErMBpMafxYz9f
	RhCX6ZBUW+f0C1DAeT6LLbCxoQRrw09Mk/5ZJ3ptR2euLbN0ib9lzN6aROpbxQi+S2x5YWkxpA8
	d0WAvuqgnxmG/VXhzPlCr5EtHm5hd7cR1biQUXnlS4QhYNYkSmw9U/lOOHLEg67WdAnaJGW2C/T
	riYbNhCIRr/VHrm56JT1lqeFSAMBKk5nZJNDzOBF7atSlPvuUNf8bqcwo4sY+XEdUoiMj9Oh4ho
	6FkjEdb3xBXE5W8Ug8yBMa0SCB7m8oUz4P5xJuURD9FfwEDhRp2LFAy9blE9OpoWg0nUzn01sw5
	V2n63MNaU6moGd
X-Google-Smtp-Source: AGHT+IFuxC/dezeGpJhF0Z6E6rq/KPaYZxLo8RXyqWoh3REZiJ+b1jAacUkfqNetde5Qzz5Dpwoz/Q==
X-Received: by 2002:a17:902:e552:b0:2a0:d4e3:7188 with SMTP id d9443c01a7336-2a2f2223bc0mr384689965ad.13.1767125544548;
        Tue, 30 Dec 2025 12:12:24 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 09/29] ell: upgrade 0.79 -> 0.80
Date: Tue, 30 Dec 2025 12:11:39 -0800
Message-ID: <b4c2d98f2614fa684d68cbecc5f4f2ac2df3bf1f.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228701

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Fix issue with ECDHE client key exchange.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 6a1a278de3183a1b8e6e27a38b17dd1dc8890ac2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ell/{ell_0.79.bb => ell_0.80.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.79.bb => ell_0.80.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.79.bb b/meta/recipes-core/ell/ell_0.80.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.79.bb
rename to meta/recipes-core/ell/ell_0.80.bb
index 8bd0f8badd..90474dadae 100644
--- a/meta/recipes-core/ell/ell_0.79.bb
+++ b/meta/recipes-core/ell/ell_0.80.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "28dabdb1966fd2e47363c44e041de507e9420411b846947efa01b4cb0cda0d6b"
+SRC_URI[sha256sum] = "6efc70ae6d3e2ca1ec255ecd855a3d5fadefe59897f4307816e3ba7a771f3d00"
-- 
2.43.0


