Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B32C36008
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 05:43:50 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.12572.1743486224418594043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 22:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b9oyXHtK;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so9703872a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 22:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743486222; x=1744091022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wyTkVFuQw86RlLHWwav4bI0gUwpTWOs7xsLne4jVKOs=;
        b=b9oyXHtKehztUsxKE4z0GmdDRGpR+6jd14iZognezjuxVN5HEGLIQZeSzrUEkABc2Q
         Bawaic02ATOu7PQtu2gSmXY/XuBOJJ/HY6qQ9PbIma1fO5HEOm2pPN75mwRrNVu2m/rR
         69nJG7NczrUZQj5AyJcgU09obiPYSfU6Yjaus5G17QQN3RWFlJt9MjhACkt2qc8Gtntk
         xD3oifHRe8m+e8aLc77aaPwv7jpWT8p8vH5bYJGWugjIFrjmJzmB337NrOMJ0x2K97NO
         7+k0EaHR86BJiRsQVgv+YdsFKa+Yz2zwDczuKDKRpDgvZAueMsLixgtgAMUWC0Y3B3Jl
         BLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743486222; x=1744091022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyTkVFuQw86RlLHWwav4bI0gUwpTWOs7xsLne4jVKOs=;
        b=hakwXyQiWxV6AopIf0p0CpCHI1j/7QqXQCR6QAtG2kezxsnA7ZY8jFInLypZHzJ8AZ
         F+bQ7OCbZ7z0PhomYMfq/02L1XxOCZQiatnAlRTQKTiVw/ryOZ3HOvJbKS0aNoDVDeGy
         k1BaBkOSyfpj/6kFb5ibM1ksmzqpAUDnCIlzsrvBk+pOdwnyGTqNXnD7f+WKd6z8IKqe
         /t+gdTLB6NIhjEYgH+xDDGODdlJKkw3oWVKm2pXoHTSvzBHSgmTBllV2xzjMuDtRu16P
         H6oisapZapnq6IpA5lqmwTLH7tJrrukhc+T8gcvf/tNzSTcfuIjVdCCqnSrJl3dY0mbd
         +L5A==
X-Gm-Message-State: AOJu0YyoaX4V2sZHSSN8wzJfJ8B29V2ZeeES+H8oeK6t1UGXszusdMe6
	xUv8JvP0PpAGLPuSE/nqmCNCGSluLiITY9Rm88sDvKax8aGYdxdYP11UMy0c
X-Gm-Gg: ASbGncsGgmhCC7zVLs9X+wBJc/Ptnz0MWcDTJzj6TJTKu8u9QDfq20Mbl5MifOsMUKD
	SeCn+GDiKXMOiaptPucJ1x+orRwy7GHT0ATSYnNCdtBWWis03cTP7/E2bWstidB2u3qfBMVytbA
	qhfr28zL2YqvygndRqAoJdEbFsW50MRHqEvAUFWp1Z4Wr3wQamK4C9QSIDph86WVSCsPvezLh1p
	AZtjhz9OvOjYQaZNGefk7HcogV2zPV6kcPCRgmgm/m8wtmrHZ1Yx+YE336M0EaTMxhfIp0t3LBa
	cdgxOqAbz/lpMBOqlnNcsvDCSVrUNxm1v9YeLyoK14vUIrw=
X-Google-Smtp-Source: AGHT+IGdwTg3DynRPRFk8V7733q+v6RuexSf1EayV/x+s68FfHAinU0uXy06ZcJFlNY+ExL8QSTbNA==
X-Received: by 2002:a17:907:3f07:b0:ac2:9093:6856 with SMTP id a640c23a62f3a-ac738bf65d7mr994509666b.54.1743486222227;
        Mon, 31 Mar 2025 22:43:42 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac78c9e0756sm21003766b.128.2025.03.31.22.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 22:43:41 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Michael Halstead <mhalstead@linuxfoundation.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 1/2] yocto-uninative: Update to 4.7 for glibc 2.41
Date: Tue,  1 Apr 2025 07:43:33 +0200
Message-ID: <20250401054334.3043-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 05:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214000

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
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

