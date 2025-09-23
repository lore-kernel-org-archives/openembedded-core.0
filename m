Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB39CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 20:57:01 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.473.1758661013945725304
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 13:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OgHHN+T6;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-826311c1774so643732185a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 13:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758661013; x=1759265813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WryFedRG4SzY6gQYNwSwGOsx+Hu+LWQ7xs/k0kJ5qkE=;
        b=OgHHN+T6Uazs0rBTRa1HwAdq/gWNI5SHrrjXX54BahPSqM3q9zmFV0KuWNnVkXwfc3
         hV7QUUXOTAnxgXDCpEUp2f3m94JD0jfUKf/3o0HgDLcw9cfauc6peYtRNhjo5LYe5+XQ
         URtjHnbLfg0JkoXCXE2h42UGp6kDAApABnZJZbdHtgklj/yu6ZB5qzaMWGq1AhjI3c95
         2szW9VetUZm/UkpeEcSMY259hLqS5MAI1RewTm5IfMZAtbJ9b/aJQeIyycBgkwDZSvdN
         08wkoFz2Wyww8/jxz9BT5y05+OfDb2F8i43tkMQkoQqwlbZv+GX/I+rKUXDxWmTtvaRl
         Rl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758661013; x=1759265813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WryFedRG4SzY6gQYNwSwGOsx+Hu+LWQ7xs/k0kJ5qkE=;
        b=wrruLM61MAnF4zSud00fSGzXfKz/DqtModqQo8PawwFU21kpYpoO5a4BHORXxM6wL8
         LtaFTIW+g1hkcCPH/U90a3G1eT/DRSCymc3Bi2B0NzqTSmK3oiYNjFmaAYsBDHZ/4rc8
         D9DomHTkXZXJgwPzNZbOqjpyQz2WDfTf0dvTAHn+sTabGLWj5reMs2xEdTqevZfzA5OL
         8BnymZuwl5b/USFjMjNIL184mpj2WoktHlW/eSp9b328kQl4aRYM+EpeKkKmu0ms1L3o
         /ep7cICF5wE53TtRM3jT7g1teW32LOWSw9lY6g6YSk3P38mPrbFK4hA+RMpf0q18+o/P
         Q7rg==
X-Gm-Message-State: AOJu0YyBwzdc/Xz1ZzZSb2BH0OX2UaquSge9DGbO/7aDlaLjAS9pK0aw
	iIOdKk1AlerXdf65rIdeTzGPLOsvweiyZJDOFfpP1hWekhU9l+MIMkGwL5iCH+5O9gU=
X-Gm-Gg: ASbGnctt/RVruZ79/4YrR6/falekdaghCUmPaqkvKoMtArAufnjtAhxr+wegP2sGmv7
	oA1CfWrGVZ0gOKZiaCoY3Qno2Kd20fusragUq6extER7jAnFctb3PY6LYOPGaXOKwC+d5lqZj9O
	hlIIKre2uJTKlo7UFFikGdQnSrmB36saeFbwsqg8AIvDmj8xE6p1hmAF5Jl/8TEsjRyHhpladYk
	8Cbaf2BRQsFe7UyWgaebjIXesGwlDt3aGey6URYvvig9xVbSyxa07N1NNDBJaj+oIhwuiR0ORHN
	+PVNP8fThAcI0LJ+4DVoXgrc2CcK+muwtqhfYEw/kTeSunihlYSdSXl4HrsCfQsM7aSDWbIq1lN
	Ko7l+uwplXgyLWI7GTg+XYTZGnXFZ4L6DJ+Xxp560mCriZXs4BxNzVBv0c5U2e/9IN9N6t4hy+p
	79r1UtP5e0hDZPgx4bkGwh1KXupud8QXt329ZcWrSyXnDa99aYq/wpe/0=
X-Google-Smtp-Source: AGHT+IG8qx53gNa1knY0ull/9AowdXVvNcVu6jYdQr9bWrtbcXUqRgMFqoD4COd0QZxTMtGahKbhZA==
X-Received: by 2002:a05:620a:6010:b0:855:cfe0:b6e0 with SMTP id af79cd13be357-855cfe0d26emr127116785a.57.1758661012638;
        Tue, 23 Sep 2025 13:56:52 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4bda9afc96fsm90640671cf.43.2025.09.23.13.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 13:56:52 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/6.16: cfg: drm for x86 32bit
Date: Tue, 23 Sep 2025 16:56:50 -0400
Message-Id: <20250923205651.2900699-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 20:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223927

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: drm: add x86 (32bit) to valid architectures
    Date: Tue, 23 Sep 2025 15:55:27 -0400

    vboxguest drivers / DRM aren't valid for all architectures and
    throw warnings if they are enabled for those invalid architectures.

    ARM/x86-64 were previously enabled, and we add x86 32bit to the
    list to allow vboxguestdrivers (and similar) to have the kernel
    configuration options they need to build (and run).

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Apply this after my series of commits for 6.16-stable and
genericarm64 configuration changes.

With this vboxguestdrivers will build for qemux86.

Bruce

 meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.16.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
index ddd97d02fd..55df04e188 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "d9ac79e651b849ad8b16bc3f96af4cc54c30148e"
-SRCREV_meta ?= "58666126fdb734568fed6166d39940208a35d53f"
+SRCREV_meta ?= "cc3c965edfdad3a665bc69430e58ea726e02063f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
index e9e8019a63..d1af7c89bd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
-SRCREV_meta ?= "58666126fdb734568fed6166d39940208a35d53f"
+SRCREV_meta ?= "cc3c965edfdad3a665bc69430e58ea726e02063f"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 0d9306cd8f..fd180db380 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
 SRCREV_machine:qemux86-64 ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
 SRCREV_machine:qemumips64 ?= "e6f7e24a7b76c6d1b3eaa3716fa1c4185de94aa5"
 SRCREV_machine ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
-SRCREV_meta ?= "58666126fdb734568fed6166d39940208a35d53f"
+SRCREV_meta ?= "cc3c965edfdad3a665bc69430e58ea726e02063f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


