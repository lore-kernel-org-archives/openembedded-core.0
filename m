Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95CBCDB47F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:26 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33424.1782253642501924862
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2O1DA4+O;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b7866869so3293495e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253641; x=1782858441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTjqkYQtj70uPO+cD6ehbfuwD/x/+aLO0BtXlhnQJy0=;
        b=2O1DA4+OnecQ4FV/kJg4M2s4RI7KRMPhsjFxY3JfbeJ/7AqKM9icC8xBOLDShUzpca
         2z3IV+1yfPnb8tkAP/idb1pVNkEtvjFydlEvGEoHA6VTk+r2aFxuVxsSUQ+tFQkJrjvZ
         ydL0+msWneW240NFd53wGnCNnZlcQ+LChcwG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253641; x=1782858441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CTjqkYQtj70uPO+cD6ehbfuwD/x/+aLO0BtXlhnQJy0=;
        b=jytFfYnN/wVGIFQ8umq5Uury+fKemGE3pNBHxgsm/T29peKj4Bws43+ueXz3hJdpgr
         V3fvWpLqSj0spJ3V2HCe/sPQ94z9S4k+Gu1pshowLzyR0W0IlE+zoYW5WYeLLGo7qht8
         kLzzg/lTWCUMS/Ahk/ixccCUtqH49OUpyClegud1R5fMhrmKZzj9mEhjw7Nt2FpmA18s
         97evT2NGM3jzNTOrZBJBnOBOeW3KO714/mN0/GafoYfX9Bv3egWxH8V0q3XB0hH2Jk0g
         KZGIoZwESoMVUP4BltBFNmQ+jVoEzMO3/8VTzCUbtJx/l+TpUYtLahJ5oYAbS9q9UrLy
         C4vg==
X-Gm-Message-State: AOJu0Yyr/tvFE0yqKUvrsNEk2bht2pTlSO7XD/v7kSNnsUAHN6fJDg+y
	Dlg+yEcyOSDAihKnxF9gY6bKkPDid4j3VI2DRs4+zCS6tIs6fD4yNoOWNQs6gqr6d7oYsK1bR2M
	m3XYh
X-Gm-Gg: AfdE7cl7Ag3ey793YX7tQNfJtTRcRYxU8qeg7X+pzHIr1oHePElrWGn2ToBvpEfdGrR
	O3ZUizGXAwpDhE1QjbLu3ATwsM3S0oVZ6xtavpp26GeBIZ8c86/Yi6EdRz74s8QfVTWnt5NN0tr
	LKTnGKT2JqEAUWg5U8yeT5YQpf5daM+N8+uoAnqN+Nnq7PV8OceSybduBWZxiNsNRq8mzE/0rLM
	Jk2JxX9enS/HvVtOALurTUGSXGibwhNl6LGnSwtfDw4w1VymWQ43LrBi4zn4iLBenCwnkPIz2gU
	eomuoPHchPq45SK7Sw4iqleo8gityp8zTOKxjs+zfsZV3taJSePaFNW9REa3IhTifv2Xu2VXGrM
	jM4Upha8NawfLsGsto6Nz5KLloNzadFrq2sBfgadKxt5koVKO/MZ6Tnv33/HUfnTfod/9UGFjRb
	QjlGqORM7Jt2phz/sTb7/gT/C8rxFhhsLgFf1UmVll7981Cm46VGAG+SFKR9h0H8LrM1CH57AKm
	79BaBWGsCUOaccK
X-Received: by 2002:a05:600c:3e88:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-4925b3532ffmr69874555e9.9.1782253640688;
        Tue, 23 Jun 2026 15:27:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 40/41] linux-yocto/6.6: genericarm64 fix configuration audit warning
Date: Wed, 24 Jun 2026 00:26:39 +0200
Message-ID: <535c5940d92c39d220ab2d36b15c2dc31b41b8e0.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239462

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: genericarm64/serial: change SERIAL_IMX_CONSOLE to =y
    Date: Fri, 19 Jun 2026 00:54:55 +0200

    With the following upstream commit, this option is no longer
    tristate, so we set it to =y instead:

      commit 3f8b835a63341163da0400befb3c6e8f6d4085da
      Author: Randy Dunlap <rdunlap@infradead.org>
      Date:   Sat Jan 10 15:26:40 2026 -0800

          serial: imx: change SERIAL_IMX_CONSOLE to bool

          [ Upstream commit 79527d86ba91c2d9354832d19fd12b3baa66bd10 ]

          SERIAL_IMX_CONSOLE is a build option for the imx driver (SERIAL_IMX).
          It does not build a separate console driver file, so it can't be built
          as a module since it isn't built at all.

          Change the Kconfig symbol from tristate to bool and update the help
          text accordingly.

          Fixes: 0db4f9b91c86 ("tty: serial: imx: enable imx serial console port as module")
          Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
          Link: https://patch.msgid.link/20260110232643.3533351-2-rdunlap@infradead.org
          Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
          Signed-off-by: Sasha Levin <sashal@kernel.org>

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
    (cherry picked from commit 465cb5bcefd72f429e0b3ad6ab5b3fcff5b390fc)
    Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index c7f8b73fa94..67fb5141ce0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "422bdbd919836dc6565f5bbeb5b662b9c52dc038"
-SRCREV_meta ?= "113d5637ef24d6ca9e43d64dec47efa3f7548c89"
+SRCREV_meta ?= "4a6f16d14b76e28ab7615c88e2fbdf95ee15fc98"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 151d63c8a20..7b4f0430a60 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "597d6818e83dc368f871fccf981a2a54a93196d0"
-SRCREV_meta ?= "113d5637ef24d6ca9e43d64dec47efa3f7548c89"
+SRCREV_meta ?= "4a6f16d14b76e28ab7615c88e2fbdf95ee15fc98"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 4288688afed..3261ad6ac3f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
 SRCREV_machine:qemux86-64 ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
 SRCREV_machine:qemumips64 ?= "44180b7d240f83de490ab570bc092afe5d123207"
 SRCREV_machine ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
-SRCREV_meta ?= "113d5637ef24d6ca9e43d64dec47efa3f7548c89"
+SRCREV_meta ?= "4a6f16d14b76e28ab7615c88e2fbdf95ee15fc98"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same

