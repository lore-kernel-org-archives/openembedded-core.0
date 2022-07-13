Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C951DC43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 16:55:48 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.327.1657731344333877930
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 09:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CYCDX8jT;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id l42so6814002wms.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 09:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3bn6jOyzAcqp3A8BzTgDPWMKK1LsHScM3C4mtHaoYHA=;
        b=CYCDX8jTxVMRiAZExpghSqgXjg/6vjtiPOdjygjqOTS7TXipijK0C4U+sRUJGzRC0S
         5uYX4s5qT5fHpWl1hWaYGAvSnGrzQ0iori5IjI9ImCx6wwQOSOb/45HGg9mLI8lRMF9t
         QFKYceqbHkHhFO+2bOBIAWE2PQqZ4TU6B6usfu+Z9ng9XBwTotIFG3knodEQaZnS46m8
         8F3eqi+WD4Filyse7nyggGGDviPT6tkULh41RekmBa+wyCc4SnD55APxsmnh8LgK6D4U
         HDsRoToXk0v3ZNQmlrg7A+I9fmgT3ZvjYdmVBMMhg0YNKh9FoM518fVzQjtpMHl3w7a6
         mFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3bn6jOyzAcqp3A8BzTgDPWMKK1LsHScM3C4mtHaoYHA=;
        b=mPVu6Rf2ZpbEz5RNA9m0lNja8MMHe9jCKHe/cfx8UgMvFp11FxgP47NMG+UQKvdJXZ
         kdo1/wFN6jArts/mZaFB7Y1OGMW9QlpbusR5uQTWl63dMpfD5OgjYRvujFnHzK0RsBrR
         IipdYEj3oiXRQMxpgiUgVa0s+8DOcaWj2oz9lJ3FhhA0L4g71a1uM9HWmEgna+P3PTDR
         yTpRAg4Y17tFufQvUUtIjZDPkM/g0I0YugwKwAwuEg/SH4d1rRZ0ZgVkn2Co9VDzHEVo
         ApE/6Q6d2RY/uEmUULD2U+pAxOKkhcu+DVo6yR9/ewiX2bWcasp+BNFWLUS6jCetaqxs
         dCAg==
X-Gm-Message-State: AJIora8py1kR5cle8kvnUrwzOAIm6/ZxljU+d4Dil8DE1oMHMxMBKqFa
	o7yZVRt6WdZq7/QZv/1vwWKEMebS5VY=
X-Google-Smtp-Source: 
 AGRyM1sKnD22pct7NUOpqodQE3ZfqY99ugZAOWy3ggcj7jrwuanBy8WhfG7DqySdtw3XDY1PA58KBQ==
X-Received: by 2002:a7b:c31a:0:b0:39c:4783:385e with SMTP id
 k26-20020a7bc31a000000b0039c4783385emr10569608wmj.185.1657731342437;
        Wed, 13 Jul 2022 09:55:42 -0700 (PDT)
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 l26-20020a1ced1a000000b003a17ab4e7c8sm2598499wmh.39.2022.07.13.09.55.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 09:55:41 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 2/2] systemd: add usrmerge to REQUIRED_DISTRO_FEATURES
Date: Wed, 13 Jul 2022 17:55:33 +0100
Message-Id: <20220713165533.125600-2-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713165533.125600-1-luca.boccassi@gmail.com>
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
 <20220713165533.125600-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 16:55:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167976

From: Luca Boccassi <luca.boccassi@microsoft.com>

Support for unmerged-usr is deprecated upstream, taints the system and will be
removed in the near future.
Enforce building merged-usr images when using systemd.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v3: use += without :append

 meta/recipes-core/systemd/systemd-compat-units.bb | 2 +-
 meta/recipes-core/systemd/systemd-serialgetty.bb  | 2 +-
 meta/recipes-core/systemd/systemd.inc             | 5 +++++
 meta/recipes-core/systemd/systemd_251.2.bb        | 2 +-
 4 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index 55ebf99117..8831578010 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -14,7 +14,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 ALLOW_EMPTY:${PN} = "1"
 
-REQUIRED_DISTRO_FEATURES = "systemd"
+REQUIRED_DISTRO_FEATURES += "systemd"
 
 SYSTEMD_DISABLED_SYSV_SERVICES = " \
   busybox-udhcpc \
diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index fd888bb834..0987c3f416 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -14,7 +14,7 @@ S = "${WORKDIR}"
 
 # As this package is tied to systemd, only build it when we're also building systemd.
 inherit features_check
-REQUIRED_DISTRO_FEATURES = "systemd"
+REQUIRED_DISTRO_FEATURES += "systemd"
 
 do_install() {
 	if [ ! -z "${SERIAL_CONSOLES}" ] ; then
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index b8dbe2263a..f9e109bba4 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -21,3 +21,8 @@ SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${S
 "
 
 S = "${WORKDIR}/git"
+
+# unmerged-usr support is deprecated upstream, taints the system and will be
+# removed in the near future. Fail the build if it is not enabled.
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "usrmerge"
diff --git a/meta/recipes-core/systemd/systemd_251.2.bb b/meta/recipes-core/systemd/systemd_251.2.bb
index bb3c59f418..ade2e61676 100644
--- a/meta/recipes-core/systemd/systemd_251.2.bb
+++ b/meta/recipes-core/systemd/systemd_251.2.bb
@@ -12,7 +12,7 @@ inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu
 
 # As this recipe builds udev, respect systemd being in DISTRO_FEATURES so
 # that we don't build both udev and systemd in world builds.
-REQUIRED_DISTRO_FEATURES = "systemd"
+REQUIRED_DISTRO_FEATURES += "systemd"
 
 SRC_URI += "file://touchscreen.rules \
            file://00-create-volatile.conf \
-- 
2.34.1


