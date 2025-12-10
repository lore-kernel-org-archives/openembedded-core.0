Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F13F4D3C91D
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 14:59:13 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17812.1765378745841882995
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 06:59:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J8MSKHv3;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477aa218f20so46535135e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 06:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765378744; x=1765983544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GmHN4fkB+QAIgZK5GGdcnggEbKlBRMTzeeQjMFQe6SU=;
        b=J8MSKHv3v38lMES4TeZ8n5LgonHf2aWe6Wddx9QE3aLFhhm2vypgh6d1+2Aas+Dx63
         wwRF6CtqAAqXDIhrlljLLeivFgpFwjXnflHSisio9BLJ/0FF96OWf6SgFNajAHEzVpjT
         ApP/HgPpqQ0hseqEEJfjsws+tLP8St73BI0h/cGv9xOJx6q5mg7wvQ4vlPH7+67w5xJU
         sBcbhDYDMuHOhRLEUfJrNLkm59DaT7frL0AgR/vDUepfn79tsdfTLKsmEV0vFr8gO/+m
         phrYw5AVnk6OFYrT3ek/g9I0Gr5eH0gapPFzhfdRaxYeDPgC3LenKFf9XK3nJzHvNBfh
         0xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765378744; x=1765983544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GmHN4fkB+QAIgZK5GGdcnggEbKlBRMTzeeQjMFQe6SU=;
        b=kmiMwPxXO0Zc5CqJqGJibOKF8W2l0LUgbC5okaLx6X9Lo03kqsk2r+Mh2Slg8lXktI
         hQGUQxtNxj2CkAcjlrUG6HQvlV2OcE9jQhW7buegZvoeJWRX53QOqk0brc5QFi4++Mgi
         LpxjIEszLU227R07/nYqE5kmTs4lbfoDNfHp599zZVpVaGf6eSmVO9ILVmy1HmhyHmdz
         E5rlcLEhvWHcnTn41SzVlIKj+UHL6PP/30Kr3fHjEZ2+ijK7ad0X3HwjKRW5CS6uOVg9
         qtgJlGraY2P42qV4Z30OB8I/FHv+HhVbsKgj1oecDLoFDBsE/o2KM4lpO9E2qKIyfqw6
         Z2kQ==
X-Gm-Message-State: AOJu0Yy7md2XzQaU7UdNwSCJVnxfA7yXE1DJHapKn/9aB6B1njtXRqFi
	ZblNE3dxz3RKMXTNJQkcZM4igOEQCC39fCp0QT7avT9mIe/eofDp1qwxUjMLsw==
X-Gm-Gg: ASbGncvD8lFctcW3wIzfFdWqXGw0/XdWLfV0Ee7g0GRNpT1ajti/tpqgqXCWihTCoJB
	3Pgypiatp46kbY2zYzmXT/ZReoD91a55d+an4+toYzQ4viUy0zZTGmmC/gDjD68kGDATI6Tay58
	J2RKnJg4H6JevHiORrpb54Hs6jHuC/IKrOG8EP2EU1kW6mpRDMpEJEyAA+yisntEdupIWbjjFnC
	vkxLwF236NImEx/gDd4tO25WsUATRYRHPxoD4Ak6gBqIKj7cPU45+BCviwWTpuM17hYr0eI/khv
	M2zElgRqDM+GWkuuvko8UuP8aYCi7tKDgteqiudWhk+OM0n5r5B73zA6t5kU0ZTTH1jgdVlNe7G
	+qAsk0JcTUKtCaV0pIAKH544pbnvQH/D4QXQO+HFhghBmk2TzU+WrmfyWinj4myfbRItF2F8qsJ
	ydEOC10zfDiiokTUYBZPQ=
X-Google-Smtp-Source: AGHT+IF7pc6Nj346aEf1mBETAcwpb0wedp6ziWujMjrBJEJoYb1IKa3/9m2VKGvCTzETgy43uw5nzg==
X-Received: by 2002:a05:600c:3e1a:b0:46e:32d4:46a1 with SMTP id 5b1f17b1804b1-47a83790b5fmr26736435e9.22.1765378743946;
        Wed, 10 Dec 2025 06:59:03 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d397a2fsm43295635e9.5.2025.12.10.06.59.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 06:59:03 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] maintainers.inc: remove self
Date: Wed, 10 Dec 2025 15:59:02 +0100
Message-ID: <20251210145902.725552-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 14:59:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227481

Remove myself from the maintained recipes.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8971b9b552..523ac09b53 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -170,7 +170,7 @@ RECIPE_MAINTAINER:pn-efivar = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-efibootmgr = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-elfutils = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-ell = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-enchant2 = "Gyorgy Sarvari <skandigraun@gmail.com>"
+RECIPE_MAINTAINER:pn-enchant2 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-encodings = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-epiphany = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-erofs-utils = "Unassigned <unassigned@yoctoproject.org>"
@@ -856,7 +856,7 @@ RECIPE_MAINTAINER:pn-usbutils = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-util-linux = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-util-linux-libuuid = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-util-macros = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-utfcpp = "Gyorgy Sarvari <skandigraun@gmail.com>"
+RECIPE_MAINTAINER:pn-utfcpp = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-v86d = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-vala = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-valgrind = "Mingli Yu <mingli.yu@windriver.com>"
@@ -903,7 +903,7 @@ RECIPE_MAINTAINER:pn-xcursor-transparent-theme = "Unassigned <unassigned@yoctopr
 RECIPE_MAINTAINER:pn-xdg-utils = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xdpyinfo = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xev = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-xeyes = "Gyorgy Sarvari <skandigraun@gmail.com>"
+RECIPE_MAINTAINER:pn-xeyes = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xf86-input-evdev = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xf86-input-libinput = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xf86-input-synaptics = "Unassigned <unassigned@yoctoproject.org>"

