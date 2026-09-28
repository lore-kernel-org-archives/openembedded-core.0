Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5DCC9833E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 05:00:49 +0000 (UTC)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50754.1790571641355174823
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 22:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bzs0yFNF;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-13fc403e373so3604249c88.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 22:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790571641; x=1791176441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mk+YiwJHSPUaDvIkAy06+Q/PavejE6c1BdCwGgioDpE=;
        b=bzs0yFNFoJX5joFNQpS7X96scMVuDuzVDWPMnM0fYUHwOLdT6nszZk6iP9w7GKyqs6
         JGsOyOLVeEiOg7wFD/b+FOequBA2mOfCk4uQfLmgbjcOciBqKLoIFBqs4C/X0FTVds5e
         OsuEASojk3zkbpXS2CY3v6dyv7Az/oRTFPFhf40Avxn9X2Uetoz8orpzEklHSDccrYPS
         Hpfw0rxPZxxG/lELaPQ84ULiIaDBtrpsBk3bspYHXMlcLPJIlRPjSW717zPHqVjFF9Sw
         NFt+gw81jzkV/bPeL7/jobkRKeVD1fO3Bv7/FnJWVlf4WvvA53tf2+MxfhgXF38IxDD0
         Qb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790571641; x=1791176441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mk+YiwJHSPUaDvIkAy06+Q/PavejE6c1BdCwGgioDpE=;
        b=xU/hLL7AcgTHDtGO+0mFoTGq23njw0xQ5zGOfH48dR3ClGJ8sTKqZHdSZhFbT58+5m
         ZM+D7wGHl4EZACehUNQtg/RDTy6QoB3AaFE/zF+XwX3RwaNCCZu6M7cA2GSf0g4Ujypf
         k6Ro9+Tdj3LHtpOv2OjTMClhQTqra70LtXO+O59fq0lCX3yEw4Nf6HuzjS5Yv4qA4FRm
         to9t8pbj9/YbQlF4nD9tE1CDhF+DIM5afbT7qgy4XAr16zEpoup+SZG9+bkB5+WUnP8t
         FN+2ixUADcszVfNHqMUV4KZTdiM2KQqjD9K4XiyAKHRLVxlA9lMxbcr0YWW0Vyk7vS5P
         c+hA==
X-Gm-Message-State: AFuF++mtEkPSnNo1FrYzTtWOvYU/51eG7/0sJ2Wrloi1aF3vaZYs2NSd
	fAb6Z3TMsfHfNT5qItbv4osL4ukvaeAiUiH0E8MRGVg0T45mcl49wF9rR47Ep7xw
X-Gm-Gg: AYBFou3T5r9VXSsqJO6ciRfL4sE/lZHWdkyneXxAjvehZhvNKsiTnj27SDxINOk5psi
	LRTgTK1BXYtvEZ3a1lb1ZXJ4aEuiFWIvW+kABtCrrwKNRL4/zcRQn+KqIBwWu3cJxKjJgNeLSQr
	UxwFrOZ/XifgcAz5bE0vHYR8WzL8srHjUxjroDU7HcN7D8TrliGHwsVmYyKZQHhnUazekKFpmSS
	QMlpTDGE1xhUIY/BZSyK2NHdUUlDXiTDvIybykWJOTCnVXcTPSDD1kMa0Bl8xacPfC9SKyS21GZ
	nS9DfmHBn83wnIegvCu1nyjTynEn6JfBH4sTA2doakgUHyfK2s3WTnp+5qAMLuSthEpXeFFLdar
	4AHSDuoOxNOri/1E3SpCQkk4c1jTGhwpByuPr39glIoujrDnbBb6dhgkEGKvm3ocNIBE+AMhzhT
	cFomh0Ihuds3OQEUGSSq2PiKJP2V1uB93aqzYo+7J3x2bEO2IPpe+brQcTqiYkToB5cRWstWjT2
	H0QLVChX7Sana/UjsxLZ/yxuvRLsrO4dpfAGEyEM+XMnhpKkYdw5kNQifvz8fbIHVp7OBVpAY/H
	oupb9p1q26d+XNSSEi2HOM0Df58fEcGILkmKfV2Lm7fkKJPN8i4Dw8b3f5a/lJgj/5lxj+L2tTq
	ejOEg7lYKwV5dJK5WRDeJmb2njNl8XQfqYX7mIKX5lRDb7MSp+ugWM5TYPvqRcWhO0vZ3i4B7vA
	A0B+9Nn8UPCouOr4DK1QsNAPjJTinluhbCoJg/5uP4q/zu0bj7
X-Received: by 2002:a05:701b:2309:b0:136:4bbe:9524 with SMTP id a92af1059eb24-146ce9675afmr8726592c88.10.1790571640574;
        Sun, 27 Sep 2026 22:00:40 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c0ccsm21781677c88.4.2026.09.27.22.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 22:00:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 2/2] libc-test: Always add libatomic-staticdev to ptest RDEPENDS
Date: Sun, 27 Sep 2026 22:00:36 -0700
Message-ID: <20260928050036.3640902-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928050036.3640902-1-khem.raj@oss.qualcomm.com>
References: <20260928050036.3640902-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 05:00:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246724

libc-test builds its tests on the target with the compiler from
packagegroup-core-buildessential, which is always gcc. The toolchain
used to build the recipe itself does not matter, since do_compile does
nothing.

GCC 16 links -latomic_asneeded by default, so with the dependency limited
to the gcc toolchain every static test fails to link when the distro
builds with clang:

  ld: cannot find -latomic_asneeded: Invalid argument
  ld: have you installed the static version of the atomic_asneeded library ?

Add libatomic-staticdev unconditionally again.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-core/musl/libc-test_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/libc-test_git.bb b/meta/recipes-core/musl/libc-test_git.bb
index 15a2ce42f7..d9999ec377 100644
--- a/meta/recipes-core/musl/libc-test_git.bb
+++ b/meta/recipes-core/musl/libc-test_git.bb
@@ -36,14 +36,13 @@ RDEPENDS:${PN} = " \

 RDEPENDS:${PN}-ptest = " \
      ${PN} \
+     libatomic-staticdev \
      locale-base-en-us \
      musl-staticdev \
      sed \
      tzdata \
 "

-RDEPENDS:${PN}-ptest:append:toolchain-gcc = " libatomic-staticdev"
-
 install_path = "/opt/${PN}"
 FILES:${PN} += "${install_path}/*"


