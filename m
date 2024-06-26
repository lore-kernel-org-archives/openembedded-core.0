Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D7AC3064D
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 14:15:11 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.27795.1719411301263011323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 07:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=w56xQkXb;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.167.50, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52db11b1d31so1415525e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 07:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1719411299; x=1720016099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YsgjXOttsWd9XAqxlPNUh/6XX9tOys53jfRD0epmDDs=;
        b=w56xQkXbBb86WlpTCMdYlP45SSwS2rAi4K5F886h1Qi8eXSSbIX2SAol88IgyIdrV1
         bky32B76AOyjtSIjHlRFKSB+wehEI/o4OuVZ0B47GuCYW7j1Gtjh10eWiuvWodGWmF5G
         d1r2XvAswHI939jZrlXV5xSCofVLfyJHpm/UHLMmpDByWTijxXnVAoXz50V5IJHCwyuY
         hugZv3SWy0AxxUP+Rc9rxAcQ7nKLxXy5oDA4gu4lfZDd3JbwNrGKsbwu5Ivxf2ckrLG7
         57Yc9xMoaGnZnqFWEgoRnwQOzsnNnT3KYGebH+wI7EP1i6VcE+ZBFZbAPRBtV94EVXcB
         oMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719411299; x=1720016099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YsgjXOttsWd9XAqxlPNUh/6XX9tOys53jfRD0epmDDs=;
        b=oyKzbEZuTl6HyQBNkUSeYrjzbHCV4tOanua70vkQokEgPYbANe5ugVZD0eZ1afNgcm
         UXESWnZj8p9AwBAwT4fClVNpHbLOnuno6aLNRBzoTHtnGbAipivfBwiW3+TyHjmrAkf/
         slpqUM2fOlV2R/O7JGmUob4yBHzHcbUJhtZPQyl804YdlHWww5n2cQAI6Wny0J6I2jDj
         6w95zHo0NfJHcrJWvuZe+quHh1AlpYvZ9Vf5x8kzdVrH/qZjEoFQkkXwBdtXuJh4ihCa
         k4sp1WmlBDIZ4E9hRes/3VrjgJo+NeV9yLYqysLYMdYtPKp1l+k7h9KFTdW+iuZp1pRn
         K3AQ==
X-Gm-Message-State: AOJu0YwRQSMBIs+WrBsbto+WJvbwCKXXMVwljUV4Y/uz6tr1BJNzHOEN
	lxa7eeJ9izXU1CcE//d8eLf3UsWCugesHVfjJtAlmHiT/QHUU2Tf5jLLRHhY+0WcqAfrCPsLeXe
	NQ1Jw8OnEhCW3yQHeQ882u6HahLpeR29NCcaw+t4FnHev+dUWhQinlHRo9btv2lQtPEQdXUfAv+
	WAEXasrVkQ
X-Google-Smtp-Source: AGHT+IHZ3ID22pHqDMUKAoNdiNVTK+rIbjvDZOGy9odsnBuGimFNNveiGHCMNpdS0jg0zaMiU6TU+g==
X-Received: by 2002:a19:6b08:0:b0:52c:8944:2427 with SMTP id 2adb3069b0e04-52cdf7f65f3mr7408185e87.31.1719411299191;
        Wed, 26 Jun 2024 07:14:59 -0700 (PDT)
Received: from localhost (dslb-002-205-022-096.002.205.pools.vodafone-ip.de. [2.205.22.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c827fed5sm28179745e9.23.2024.06.26.07.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:14:58 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] linuxloader: add -armhf on arm only for TARGET_FPU 'hard'
Date: Wed, 26 Jun 2024 16:14:53 +0200
Message-ID: <20240626141453.84243-1-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 14:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201170

There are two types of soft FPU options for arm, soft and softfp, and if
using the latter the wrong dynamic loader will be used.

E.g. go will link against ld-linux-armhf.so.3, but libc6 will only ship
a ld-linux.so.3, so go programs will fail to start.

Fix this by instead checking for TARGET_FPU being 'hard' and then
applying the suffix.

Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 07b4c7a2bd23f8645810e13439e814caaaf9cd94)
---
 meta/classes/linuxloader.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bb=
class
index 4447c8847c9e..1fd10f62c7bd 100644
--- a/meta/classes/linuxloader.bbclass
+++ b/meta/classes/linuxloader.bbclass
@@ -49,7 +49,7 @@ def get_glibc_loader(d):
     elif re.search("i.86", targetarch):
         dynamic_loader =3D "${base_libdir}/ld-linux.so.2"
     elif targetarch =3D=3D "arm":
-        dynamic_loader =3D "${base_libdir}/ld-linux${@['-armhf', ''][d.get=
Var('TARGET_FPU') =3D=3D 'soft']}.so.3"
+        dynamic_loader =3D "${base_libdir}/ld-linux${@['', '-armhf'][d.get=
Var('TARGET_FPU') =3D=3D 'hard']}.so.3"
     elif targetarch.startswith("aarch64"):
         dynamic_loader =3D "${base_libdir}/ld-linux-aarch64${ARMPKGSFX_END=
IAN_64}.so.1"
     elif targetarch.startswith("riscv64"):
--=20
2.45.1


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=F6psel


Commercial register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=A0DE283257294


