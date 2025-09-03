Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 784FDCA0FF2
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 16:15:23 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.17062.1756916121890818552
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 09:15:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=U1mQwp1D;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7722f8cf9adso100529b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 09:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756916121; x=1757520921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9ciXWgEG/JpY9Nuz1t+XKcAN2VoyNl7XNhCC9zhJDs=;
        b=U1mQwp1DbEOxXWgYaWEGerQe/99h/UCy6tQ8aUPL8hmW6FnkgC/gZLhDGjSNHp1LXV
         84r7O0Jqdw2ALT2rEzmVDrJVy15a2V2qEL2piEeh7pGM6Y+mNYJxuT9sVv2Ow7eg2vMd
         A0pk3Uaeo1eo2mGckqDczlF2ddyt51ZNB/D2ebPfgdL6yX3KuGKYRCmp65ghZE9a8r+H
         mETs3vOEyuJKC30ZqfPW/zPeB1njd05GUaVCgoat9iCOipbSgKrQQ6TW6Veh4YBVsvAE
         T0Lefb9DmbBCncWkp2WudGM3AVA7ICNjVYkOg3KDb+sPKNs4W3ChPbiowKpPMn3beoYl
         Uphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916121; x=1757520921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9ciXWgEG/JpY9Nuz1t+XKcAN2VoyNl7XNhCC9zhJDs=;
        b=D1FtxICo8QNspz3uCpYRi9p8/YEhfKyHb1/X8LDTFJh/oVTsxXFWus84/Nj1oB7LP6
         Hpp9oAKZi+koG9nUNHNlBi4IJbuQVVcdlJniZIkJKbxeVm5nkD1Eg3uZqeXYPYnWUkMm
         0zhOLMV8R8WJvjL4fYMweAdQ+bhcV9hp/FtcpqbmYHDvObzrVoASkfmkes7psfTIYp1s
         Ec98vP3IBWRQpx+aS09y86t4AvM+IA59nBWHcV3xLOZkKB06h0nr/3QICUFgEUHYUPoa
         gHPgKT5xoNC+Gy1KH6u0saDsB44l14/xiu9L5HQuWjQbLnUCXbwMx2uQT/RNx45HCQf2
         wnAQ==
X-Gm-Message-State: AOJu0YweFu+RXBbL69oXwn/4WLtiykDlFC2ZwizA1MSIlnn6OpAPiuoj
	kD/dPRj/ypov8AYyAr3bYNzCoM6GPgjionRHwRsdzLKFLXun/vVsf7D7Wsp4m0tXW3F/zHytYIA
	7dyKZ
X-Gm-Gg: ASbGncs26JMb7NMGLqtbto00nxslrWICoAa9SzDMsBjgkZTetS3wXAiV2IHQYR4QBJB
	S53nK0CdeNVacY2WHyhPUUL2Gi8iLnhjfOTb7xWVkFzrvtUELAcvcWIStj9MC27380un/iyMQRs
	zzp1hh9rTowCKDK8efnW8UPpJ7XdfpPv3xKAby/GofwZOoK00M11OZc11GYSsaEt0dnuLAWYpyX
	NfFE3Jzh5J+sWnTwBlQwgqXv6lgsLEOUWBbVfD+7Bk78tmnQTcKMq2QB2tg0eEicM/p2O/vNNSj
	4svgx4M+3uPvGhNbKYmIDqpX3tlSGoGjBdqAKyu8D7jieiacQY4QUW6HuDsf28whN/b+XVo1mU8
	BfExhyQ1yA3eJ4g==
X-Google-Smtp-Source: AGHT+IEl+n+cPjgEndiiJOGPDbIFgc81+9ewzN64AOQXieQMWZWeb6xnQUyiSmuQLYEy+9tvnDVDrw==
X-Received: by 2002:a05:6a00:2381:b0:771:f69a:c426 with SMTP id d2e1a72fcca58-7723e276e5dmr22451556b3a.14.1756916120894;
        Wed, 03 Sep 2025 09:15:20 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:9ffe:4bb4:e2b3:4b1c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7724f079b88sm11027602b3a.40.2025.09.03.09.15.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:15:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 9/9] pulseaudio: Add audio group explicitly
Date: Wed,  3 Sep 2025 09:14:59 -0700
Message-ID: <71ed9d8394f7e625270ee66f9c2816bba4aa2016.1756915922.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756915922.git.steve@sakoman.com>
References: <cover.1756915922.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 16:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222874

From: Kyungjik Min <dpmin7@gmail.com>

Since pulseaudio-server requires the audio group, we explicitly add it.

When use useradd-staticids or do not use the default group in
base-passwd, an error will occur because the audio group is not defined.

NOTE: pulseaudio: Performing useradd with [--root
TOPDIR/tmp/work/cortexa72-poky-linux/pulseaudio/17.0/recipe-sysroot
--home-dir /var/run/pulse --gid 998 --groups audio,pulse
--no-create-home --system --shell /bin/false --uid 998 pulse]
useradd: group 'audio' does not exist
ERROR: pulseaudio: useradd command did not succeed.

Signed-off-by: Kyungjik Min <dpmin7@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-selftest/files/static-group                  | 1 +
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index cbec6f1377..1744da6aad 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -25,3 +25,4 @@ weston:x:525:
 wayland:x:526:
 render:x:527:
 sgx:x:528:
+audio:x:529:
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 61d5bb00ba..7b9d245c07 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -147,7 +147,7 @@ do_install:append() {
 }
 
 USERADD_PACKAGES = "pulseaudio-server"
-GROUPADD_PARAM:pulseaudio-server = "--system pulse"
+GROUPADD_PARAM:pulseaudio-server = "--system audio; --system pulse"
 USERADD_PARAM:pulseaudio-server = "--system --home /var/run/pulse \
                               --no-create-home --shell /bin/false \
                               --groups audio,pulse --gid pulse pulse"
-- 
2.43.0


