Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F101AC79F9E
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 01:17:41 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9884.1788830257152436258
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 18:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=f5ItCvYq;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-90ccbed6edcso63801116d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 18:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788830256; x=1789435056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CzxR/Ob22iJG36jfFuBTYDfwN1ZauUcESBvI0fCu9SQ=;
        b=f5ItCvYqiVGa2QS3eOaWFMA4BW9zqWP4DIv1l7zchngi7IseYckFCemevs8FfAOu5V
         U9bEFBuw/9WHW9fHQLFTrJOKJxCxKldGIn8wcLquQHz/dYSVCytbwe7qh8iOJsHJ4lx7
         GJeymWpqcPDf/unpZEUrrK9mAaWnneHh3b29sIZPNBJcKKyJije+ZmlI5AGUhrw4Em2e
         t19XBLhTDB5sZY08jz+oQvgCs1Bzne3m9Srk4f7SGz9XyVdood6DRi40GsYQCqeqilrb
         YoZK7yd0orpFhfEw6D3FXTAdvqmmqZAHQEupPYEQ+TDwSiYakiSMg7r8XsNUO+B4NXXX
         M0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830256; x=1789435056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CzxR/Ob22iJG36jfFuBTYDfwN1ZauUcESBvI0fCu9SQ=;
        b=DSx5scP3ygGYM3237tVSe8kiU5GtLZVuVWsM2djAUE8ki7F87VvR355msEVRmUIxan
         Yi9qY8nuL/N+43CBXIPlpOHVO+vjUxzW8JPXsVJv2HY/kgYHh+xwmhEzJXHTcnHF6+i+
         FPa7apVO6rRI5PZVjarux/HgWbHLcWIZng4SMB3BsBXO/F6sKGGMQEirc46+VTflSq80
         HtMl0/RuTvO8NRdwtIVf+LSw6xC6Hkf/5bEUfk51t5Jahwt1FSa8BHObRKo5GkD0+EIw
         8+g4+WR4y4RaxzBKPqog1bW/FWF+DqOw2D/FqawWE7p9D4aXM+ubvAiwtwJHy3bhM4Np
         c85Q==
X-Gm-Message-State: AFuF++lV1DkggMkwDY2CT251EKRFfbd+cAqtD83Ps4YoGDSvgAUeKNYj
	zqSRLsXZSd0H19f6ToXo8ELQEvOgSv9U4NQv56t5+XaQvJPl4mBrm9VPOHewl9qt
X-Gm-Gg: AYBFou1/yVg/zr+AgJx34Vp7Idi2wQzXRT8ZnU3zbKonUkvz3h+sVjxXwCKn5tI6xwG
	7tNgx5ZAQT1mHd+KGSI65KL+tYqyuw8oX/3Uo+699QTvniw8hhe5oxtmgn0CDU6HjuXADVCepAd
	RJqBw7Er74vtzRR/zAY+rh0ENyePJ/7qQ/gTvph7pvAmlwFIibzBQ+8TemYe2PAG9rla+NJB52I
	4WQ/IG0vZ0GYHSgab0RMm7gUlbgBhVgHN9X2vlxEb9WRd1T6cBXczINeyRji6IonywoBDZnOY55
	2zqAeRDyM5NcnNkXV0r4BUg6yLsuYRgDJN/nnlFwwN4sYOMs2nMtrhnqs50HLkvhOukw9Ktqc8E
	0oZOPnkh/kQyJY0Sjhfab+WSq8W3/Xtb89/nM3ac6AwtpVFI9AYoV1Cvw7Wp8MTUfVfTcLQtSDy
	u0Lj8hqi8wkAqSt5tYwLelE1/avS5t3Mf94iw+davJgfLsI6fmN3+0ynWac9xe9R6T7lHvolcIm
	6zNU+Py53l1VyofTbC3PTTDzETbQYkmvgwDmPRNNJwifO5+4G0AOvGQhBrk1GwIZ/TnBsON6+VI
	Qk5YS/eYKmbekOEZoX2p4I2tTQw1jSp9WBAI2/8WVxgosqEnxX3+Y2M7BRlTLrYbsD4qvfVD1MR
	8G7Af
X-Received: by 2002:a05:6214:1253:b0:910:54d5:ac9c with SMTP id 6a1803df08f44-91054d5aeebmr164443016d6.18.1788830255930;
        Mon, 07 Sep 2026 18:17:35 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104049d30asm105271876d6.0.2026.09.07.18.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 18:17:35 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 02/05] linux-yocto/7.2: rt: update to v7.2-rt5
Date: Mon,  7 Sep 2026 21:17:27 -0400
Message-ID: <20260908011731.2895743-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908011731.2895743-1-bruce.ashfield@gmail.com>
References: <20260908011731.2895743-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 01:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245314

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/7.2:

1/4 [
    Author: Sebastian Andrzej Siewior
    Email: bigeasy@linutronix.de
    Subject: v7.2-rt4
    Date: Tue, 18 Aug 2026 08:33:25 +0200

    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
]

2/4 [
    Author: Sebastian Andrzej Siewior
    Email: bigeasy@linutronix.de
    Subject: ARM: Update "ARM: enable interrupts when arm_notify_die() is handling"
    Date: Tue, 18 Aug 2026 12:27:42 +0200

    Update "ARM: enable interrupts when arm_notify_die() is handling" to the
    version that has been applied upstream as "ARM: 9484/1: enable
    interrupts when unhandled user faults are triggered"

    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
]

3/4 [
    Author: Sebastian Andrzej Siewior
    Email: bigeasy@linutronix.de
    Subject: serial: 8250: Update the nbcon series
    Date: Tue, 18 Aug 2026 12:30:41 +0200

    This is an all-in-one update, replacing old version 8250 nbcon support
    to the version 11 which has been applied upstream.

    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
]

4/4 [
    Author: Sebastian Andrzej Siewior
    Email: bigeasy@linutronix.de
    Subject: v7.2-rt5
    Date: Tue, 18 Aug 2026 12:31:54 +0200

    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_7.2.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
index fc76baf359..f736bbe632 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
@@ -15,8 +15,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "97c8cde82374f1359a27f1bca7783406a8c58a7f"
-SRCREV_meta ?= "03cb449bc3f6a9ce9599e2b3fb4ad2b3fc0c0b85"
+SRCREV_machine ?= "cff23f97ddddc1bb6c11f4b0eb7c0f0457503cfb"
+SRCREV_meta ?= "31a9aee38a2827fac9db03afde5bc9fe88b49957"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-7.2;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
index 76521bf9fc..9bf604ace0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
@@ -19,7 +19,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "6a8c7c1a4e71cb451c93ec975591179856cf885d"
-SRCREV_meta ?= "03cb449bc3f6a9ce9599e2b3fb4ad2b3fc0c0b85"
+SRCREV_meta ?= "31a9aee38a2827fac9db03afde5bc9fe88b49957"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_7.2.bb b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
index 1decf0c608..2ff4a59f96 100644
--- a/meta/recipes-kernel/linux/linux-yocto_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
@@ -28,7 +28,7 @@ SRCREV_machine:qemux86 ?= "6a8c7c1a4e71cb451c93ec975591179856cf885d"
 SRCREV_machine:qemux86-64 ?= "6a8c7c1a4e71cb451c93ec975591179856cf885d"
 SRCREV_machine:qemumips64 ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
 SRCREV_machine ?= "6a8c7c1a4e71cb451c93ec975591179856cf885d"
-SRCREV_meta ?= "03cb449bc3f6a9ce9599e2b3fb4ad2b3fc0c0b85"
+SRCREV_meta ?= "31a9aee38a2827fac9db03afde5bc9fe88b49957"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


