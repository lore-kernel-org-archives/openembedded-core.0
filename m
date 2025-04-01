Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71428C36017
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 19:59:35 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.3272.1743537574892150262
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 12:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rgeLndsn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2240b4de12bso98196595ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743537574; x=1744142374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wX0uupXd89EWWiA4ifnfMUkiyM5f1EYReZBVpDWeOlQ=;
        b=rgeLndsnZHsno38cEo0+EhkmFlhMKX9stgJ27Wh1BjXz8WyA2r2zCdmAqbyQpJ/XGR
         nw4tXAcL9IfPfW5RTDSrPHMxcvrVOWRKmP0NqjT+23cvpDeHF6ksVD1S8zhZV3wl4ed1
         i/MGJ80g0EsCXzxYYilws+BEWWEaVe/A4cVx+rK/ajm3B7aXfMGsi1m2nBAVvc5H0T1g
         GuCy9VP/dDY7ZHtxacnIHgXandqePbPiaRhlg89l6p2XuIvtUIuKvw0PDpSqck65BmR3
         tMs3Z4MaFQL/N8vhkzPw0syuVEzDxvdQkAENPp/WjPt9lv4HXoCLvQb+DdRUl1rUl9jL
         6ABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743537574; x=1744142374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wX0uupXd89EWWiA4ifnfMUkiyM5f1EYReZBVpDWeOlQ=;
        b=TOLKrXR/z8Ug99mMfDqWSxHLM2CVYloRFeujz+hGVE3KwubN15H34ab5mfYCqOvv1q
         ojgXiPxGw5Ge/SYO9+SXq0FAjLkwiS/hUkkE1MGobGU191Dc1FsNdjx5pjwygbB5vHP5
         qpKw3vc8orMtrD5Zc1ZWqAOsJgxZPeEp38im8PN99IvgttZOP3p6WHuR9DRgkTfxzXnz
         z4ziqUZfYbhs6PfrAibIpXhlSwQfWaZ3iyDU7mrVOAKhWJIfDZYWdWR7JoH4A3NRGU1g
         k6ev6NVYxlIwjZW7gWFnuhb6GNHV53Q/e+JIXNcRpceae9g+Z7QIp/hePDts+k3OvM68
         8wdQ==
X-Gm-Message-State: AOJu0YzgRS1aVmAqGl2tqWVLiGbwDtDQ625JApCxfSNjeSNULHLpgYpU
	UBRm+bp61vThEf9AtkS7UTPaQ9SOdD2Fyyyut2+xKMn885EYrt7YAssouTYfHYhNSz8eO91N66Y
	C
X-Gm-Gg: ASbGncu+9dO8nL7phkJ+KFZaVIOWa+AAZAFKbZYgNpeFdQDrrPg+2l3sOaHA/nWOUyE
	9XUIUfdxAz++N9tUjkRUEmNmNc0r0ONChxDIYfTkBBkj2pJaDygn7UK93huea9LH6Zh3whGvTiB
	xy5S14Skp5jgOQ8ZVc76NmToKF1G7oQeL23oSh1OOqk3TUzjAx9WGZBpDZrTxMzHON0HCO80kO3
	7ALEr8QbAt4oZBhkgY82hByQl4ZVAxFiFqGGP4mawshfY1qLdtzcUSPELYcj9pJtz0vpYwmGivG
	1xFacYhJiM1UUTzwDE62z0HFjBdaBJ3g9wAa
X-Google-Smtp-Source: AGHT+IHmCWPvobGLGL21UbvsJzczelpTS8w0cZcTh/7/Dp3dc3VGmCJGgh8jEMF9nGmZBXubv/P8Cg==
X-Received: by 2002:a05:6a20:8c92:b0:1f5:9ffc:274a with SMTP id adf61e73a8af0-2009f6489f2mr17461630637.23.1743537574122;
        Tue, 01 Apr 2025 12:59:34 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6021:5333:bc00:e45b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b52ea6bsm7234369a12.0.2025.04.01.12.59.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 12:59:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/5] yocto-uninative: Update to 4.7 for glibc 2.41
Date: Tue,  1 Apr 2025 12:59:21 -0700
Message-ID: <7626067432743657e9c536ca16a2dac513ba4929.1743537463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743537463.git.steve@sakoman.com>
References: <cover.1743537463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 19:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214149

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index a6f7107dfe..3d0f1fdccd 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.40"
-UNINATIVE_VERSION = "4.6"
+UNINATIVE_MAXGLIBCVERSION = "2.41"
+UNINATIVE_VERSION = "4.7"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "c2d36338272eba101580f648dd8dff5352cdb4c1809db7dedf8fc4d7e7df716c"
-UNINATIVE_CHECKSUM[i686] ?= "0041584678109c18deca48fb59eaf14cf725cf024a170ab537b354b63240c504"
-UNINATIVE_CHECKSUM[x86_64] ?= "6bf00154c5a7bc48adbf63fd17684bb87eb07f4814fbb482a3fbd817c1ccf4c5"
+UNINATIVE_CHECKSUM[aarch64] ?= "ac440e4fc80665c79f9718c665c6e28d771e51609c088c3c97ba3ad5cfed197a"
+UNINATIVE_CHECKSUM[i686] ?= "c5efa31450f3bbd63ea961d4e7c747ae41317937d429f65e1d5cf2050338e27a"
+UNINATIVE_CHECKSUM[x86_64] ?= "5800d4e9a129d1be09cf548918d25f74e91a7c1193ae5239d5b0c9246c486d2c"
-- 
2.43.0


