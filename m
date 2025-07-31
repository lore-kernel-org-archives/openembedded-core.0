Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69065C87FCB
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 01:15:56 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.51423.1753924551707251226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 18:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f3hwkXLj;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-71b52d6d1e3so4238507b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 18:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753924551; x=1754529351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kzSY9lt/Qc38RpnQg673OMvoIzNoH+rfsZNAZnvN9mg=;
        b=f3hwkXLjQknYZNZc7KMoS3xeF7kfAHQApZTF+fd/+kZiiSq20EiA7+0GMVLbWtEGou
         2ZH6KDMDocaGcl44YQIxA0p2buyKa0bfvqT+bpko+E3toADSCVE73soXuc44jnNwgxOq
         DVIIz3/mMwsFVOoG5Ni0L3Kq9Bm8PkCTJNDpBnpWvKeFoHoJmw1GX+G6v3wxkfrxte/Y
         uksvkxoMwDVCB0+iVhwpnoy8bAiow625iDkRh0LzPJDDhI4CQ45Og+HUFuRfMZdvC89I
         Giai6mF0MFUmWdqikYP2fyfFdSrUiHRg/VXBUHRDiNWIayyUUKnaKBWCHP2X3SfCuG9D
         B8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753924551; x=1754529351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzSY9lt/Qc38RpnQg673OMvoIzNoH+rfsZNAZnvN9mg=;
        b=MpJ1X9jZbNDadD1AdISnpo8Qm1gjBxSz80P1O89OF7h5uRxkO5be5DxzE0FeVIb9Cf
         azBVRsdOi+c5Z7Ea/DtyDmDpP4N9Sw2uz3LP4Y4qM0rdeTFGbTXRWWYEPSEtd8A9TXOV
         aTWWS1x8b4MBu3Pi50EVE97Fx42HVcFDNGjHB5IRvmWn1PdWGzA1Yz2cOtx5WbVKv1Pv
         QAHSGZHr6vTtHSpNEbLA+X64fOV2B+xnxP+mSiaXAdx4SQ7E1gTp8YBontCB2XAR0B85
         QeMroIVzF6flhSOfpr438PmbiEQxS7vEgmd/+iLeWx+qvV4YkljN6RjvIFsyvtw9DUWP
         8JnA==
X-Gm-Message-State: AOJu0Yz8/HzMFUDAy5DUgf+EGkQb4e6rAszM68vHe0SkjcB0tfWRyLeZ
	iRRPD9j2a/ka/RzmKHW+rXWKk0CChLCU77vNOzvKfhif7dZiytP4zVtJuaRgZQ==
X-Gm-Gg: ASbGnctZuUEeHYPnr7IF2Ijk9Lj3vrSuFmqGtxSxIFaoqyYPON1NEEovZbI5UEBC+3R
	wnb0LdSeRQjgNbSK6+X7ex8zT2hkklAF8E/E1tBOQ35xA4d8dmvx8hHineWY88JkvWfvxEo6XrD
	hJSAkEs7Og/s9rwVZYc7NQijvXEZUEOUQhH0ppE3PLsniiKQffv9EKr+WqDZ2lTP7cPVlumcaB3
	bVC3GikwZXRDwXR78Jzsx5WyorLuicM9V9IAoOxxK1VIOXZAvHcD6V7qAs2hCgpyvi/nkicEeSZ
	ZD1qZISE8DqxFJX4+8He9ufYFGBK7Okb2/zqgV8cPWNvQ03MOVaP5CWigoTnog7ae65un5AQnt2
	jCHy0Tvdpf4xnWlEADKEdmHfZt0UN
X-Google-Smtp-Source: AGHT+IFZUIt2ILqOzWi/cNSywSPoBmdoQtu4nahoDT/Pj6n2JDY6lpa9s/shA8jHzqrJrAIJB/Hviw==
X-Received: by 2002:a05:690c:380b:b0:719:4dab:4322 with SMTP id 00721157ae682-71a4665ad33mr78004887b3.22.1753924550320;
        Wed, 30 Jul 2025 18:15:50 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71b5a598112sm601917b3.43.2025.07.30.18.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 18:15:49 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [PATCH] libsdl2: update SRC_URI to use https
Date: Wed, 30 Jul 2025 21:15:12 -0400
Message-ID: <20250731011512.1216729-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 01:15:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221173

This fixes :
WARNING: libsdl2-native-2.32.8-r0 do_fetch: Failed to fetch URL http://www.libsdl.org/release/SDL2-2.32.8.tar.gz, attempting MIRRORS if available

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
index c56027d4ab..98291e0f80 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
@@ -21,7 +21,7 @@ LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'arm-neon', 'f
 
 PROVIDES = "virtual/libsdl2"
 
-SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
+SRC_URI = "https://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${UNPACKDIR}/SDL2-${PV}"
 
-- 
2.43.0


