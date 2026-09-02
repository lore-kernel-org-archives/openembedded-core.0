Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F024C624D9
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 13:23:18 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12766.1788355393168999002
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 06:23:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SIeJq6aU;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-52ff7e275e0so9168621cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 06:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788355392; x=1788960192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EO3m5cnAdAuBaY1kWrscHNyArSJE3pzj5aAFOf3AEGo=;
        b=SIeJq6aUC7BQb52/OBjSoioK5Fw5vDdS+Zdvruagnvk2MWBOtKjiSQSueLYL4whRk4
         6hEnRsL9wx+saK4Lihn5pJ0Fw3G7tE77/gj/IYov9RBvwohlJVTJE307qe4kfpG67CY3
         JeUgSw2Bg5QdKkRIOlo/Ks2Z/Z+qScxlmCtVlFmei4M28CT6UTvwe12h9gvv7qAwchXl
         OZbI0JmTB/tGQrU4cmtyqO3ycKEZ4mmB2DNvzMhl9E6r1qQ6Dx2ThqJFWuDt1SHoJeag
         Ak0vntRi267K8H219mFeIFt8unJuXWxtQfXVW+5OZteLRnNQBDW6qxj8VD+aRsmKHBen
         eTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355392; x=1788960192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EO3m5cnAdAuBaY1kWrscHNyArSJE3pzj5aAFOf3AEGo=;
        b=ENOX2yCM2OWa5djI/7n21tf+3OwDWTiF9lkjQ0QIFvcT5LSkyJIMkgKRxhk3Z9WF3x
         6MZx503J1whypITVPvT8Q8kxC4U2nakav9ToXzEVcBEL9Dx4G3S6dVe4flh4xxIKAfQ0
         TfG/0mQqrRR1cV9GJXlfpr+eNl+cgMAy7Fns2/WdDAi8VY7nkng4ts7DAZ3toslvfxav
         hUPg5G/4EHGYyYY3TLUBRSQTSnBP1U+UilQN6/SF5OfxechShgGMiA31l/6zJnQZNeZ3
         gMObJOW0rW6KmyqTzzyN/vTEmexBJmHAF+B8qLxUVndKGDZZ2xQrpoAhQ3wggaJDL2Ek
         MiZg==
X-Gm-Message-State: AFuF++nT33bAk8zTpFfXERSC5+nW7Q7cQT5liZUsycfH+PDNdIWG9N0f
	7HqHEB3Nzbdp0bK9JpWe8GISFZ4bBQEqnM6JCqR+JmFtj+/uoYsYQNAT
X-Gm-Gg: AR+sD13mqU3FwZQz4GBoIHauUnpriVZHJa30R1NSR6ZZzgb7XNe92DlpNej3UrkY6Il
	sSa3g0p8gI1FqkmBCfRSg6m1KbHs6j5tk6FmYvVx4fo3LpelK8UcrSJo4iaHSeFhQzn/tfjjdjL
	kTZGIawGGXpbtQ8bVc5ZQx/rB34SwOi2p+IVBN7WplbbpgYAThCzbFWD26cN7OEoQhcHZ8kE38M
	sHAKTeMVrBPpHa6yKch0DCM22ZAone6k2lG0RGiAbKk1wMXa7fDHw7I2zE3eLS2JCLJU7GaB0K0
	kNoKvXkKB7sDyPzs+sD8bcoJfM/8dh5djAm8p8pweyHHpb42wMdEfT8c0voQ8eOYLsX0C0l0rHB
	WqVSAYZH+XZjulxLgSgo+Msodk/8Z3U4xxCRlu47xZXqV9ui/WyHOi2DfYncqsRirEX7SWgbux9
	saL28XKsrLhmb2h/jUaMgBGyP1WaswmrtEdRezeLpcZG7NG9kWHwrwmJpsbY2XoyAc2nzSTZ0GN
	Tjxuo3vbzY2JJItOTlGqXAAQmdX8eP3AFn3A7Bk93sMZN8FWlncU4B7um/Ttwb1U1IxBI8P4Z8s
	toifdjSAVSGS8OMW9IyLicx8h4ZJtHk06ttaIS8aH9uWaQFYDOf/m/aq9xs/I2gkL5r1s6Zn5+P
	lkr2XhJ8JGMABJVg=
X-Received: by 2002:ac8:5e09:0:b0:530:1229:94d4 with SMTP id d75a77b69052e-53036cd4d09mr48794271cf.26.1788355389679;
        Wed, 02 Sep 2026 06:23:09 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee43763sm18059076d6.22.2026.09.02.06.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:23:09 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 02/07] linux-yocto/7.2: BSPs: fix configuration warnings
Date: Wed,  2 Sep 2026 09:22:59 -0400
Message-ID: <20260902132305.3685228-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902132305.3685228-1-bruce.ashfield@gmail.com>
References: <20260902132305.3685228-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 13:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244951

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/2 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: cfg: drop CONFIG_FB_MODE_HELPERS (now an internal option)
    Date: Mon, 31 Aug 2026 22:16:52 -0400

    Upstream commit c031bffabaf7c ("fbdev: Turn FB_MODE_HELPERS into an
    internal config option") removed the prompt from FB_MODE_HELPERS, making
    it a non-user-selectable symbol that is select-ed by the fbdev drivers
    which need it. Fragments can no longer set it directly, so it trips
    do_kernel_configcheck on v7.2 (e.g. beaglebone):

        'CONFIG_FB_MODE_HELPERS' last val (y) and .config val (n) do not match
        config 'CONFIG_FB_MODE_HELPERS' was set, but it wasn't assignable

    Drop the now-ineffective assignments; the FB drivers select it as needed.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/2 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: bsp/qemuarma15: drop removed CONFIG_CRYPTO_AES_ARM
    Date: Mon, 31 Aug 2026 22:17:34 -0400

    Upstream commit fa2297750c2c ("lib/crypto: arm/aes: Migrate optimized
    code into library") removed the CRYPTO_AES_ARM Kconfig symbol, folding
    the scalar ARM AES implementation into the crypto library. The stale
    assignment trips do_kernel_configcheck on v7.2 (qemuarm):

        the following symbols were not found in the active configuration:
             - CONFIG_CRYPTO_AES_ARM

    Drop it; the functionality now lives in the always-available library.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_7.2.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
index 64b1c0affe..48f304ef22 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
@@ -16,7 +16,7 @@ python () {
 }
 
 SRCREV_machine ?= "1177250341f415eb484ad60cbef9107d4fca08c8"
-SRCREV_meta ?= "a594a8179dfd8d677083ab6389616f3d1223c396"
+SRCREV_meta ?= "622c1c473d1d14aae5a94c1883274f77094caabc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-7.2;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
index e494b22e4f..b62f25b2cd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
@@ -19,7 +19,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "d8eb6bd48aa600ae8ceb8e3a37c2bde59c581e3d"
-SRCREV_meta ?= "a594a8179dfd8d677083ab6389616f3d1223c396"
+SRCREV_meta ?= "622c1c473d1d14aae5a94c1883274f77094caabc"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_7.2.bb b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
index b684c0590e..3047c310ef 100644
--- a/meta/recipes-kernel/linux/linux-yocto_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
@@ -28,7 +28,7 @@ SRCREV_machine:qemux86 ?= "d8eb6bd48aa600ae8ceb8e3a37c2bde59c581e3d"
 SRCREV_machine:qemux86-64 ?= "d8eb6bd48aa600ae8ceb8e3a37c2bde59c581e3d"
 SRCREV_machine:qemumips64 ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
 SRCREV_machine ?= "d8eb6bd48aa600ae8ceb8e3a37c2bde59c581e3d"
-SRCREV_meta ?= "a594a8179dfd8d677083ab6389616f3d1223c396"
+SRCREV_meta ?= "622c1c473d1d14aae5a94c1883274f77094caabc"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


