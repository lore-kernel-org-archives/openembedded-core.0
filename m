Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E96C001DE
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 03:20:47 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.32115.1688959242781839748
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jul 2023 20:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=SFu41RTH;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7659db6339eso177186985a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jul 2023 20:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688959242; x=1691551242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Axb0QShNzJarCS0nCRrv+qDtMZ5h2nDcg7EU/JI4DOU=;
        b=SFu41RTHby5ZLF3JfCJXBYwu8TiahstbG7jiZrqHw/e5M+4xxzX74CUGP0Y3IfA+Au
         nU4r1OqFdFato+Plj87FJlIC8UUGaL65vkkaVcmohYMxbTAv5J36zyiTmVeAL9mrZu3U
         +59YAHgTAt/gMal0zwnNHhvjOa4xHNJSTyOvnEtUMjXpqePylRgCBjY7+f1y6OdYcYDw
         j7CvziScAOBICU54JNsFB3NBq7PHhVjq59yKhU6/A0/x8S+jqGpc4ew3eG43ETUCd092
         Qh7s6s4ukc+93bGZ/I0Ntt6CpiQN5mNsPP0/glsOA3dELSVRyHDKWx1c3usc04ByQ4we
         E5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688959242; x=1691551242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Axb0QShNzJarCS0nCRrv+qDtMZ5h2nDcg7EU/JI4DOU=;
        b=fmbXKri7RhPFfLfOgfCFm9sK71OGO/LqoBNCrNgevyhERDHR+Pd2HSs3MtYOo0tiws
         RI9wUuRlV1TlZx6EiOCMXk2S1ojbtHwBcSsCxssSe2KINI6oUIW8e9o3XjXm2IZQgiPX
         maKN6QgXAy56SxAxNVenIjfWcNDXGJv67Q1Be4UOHrWyIpa8J4lm0BCFvSRufYwLLExH
         EJSBaiW2HXLeLC7ciPorU3O44J+k6E9pU8Nrwhc0O1CJhO0sDlhprrc2eR1CtDvYBjnq
         Mplgx25MpQDIuIAUbl4kGOqkKKa3Qp3GRzFZUyW4avet0y14l+ciQ+O6OeEYD8jolClb
         LftA==
X-Gm-Message-State: ABy/qLbq8lqtnLfOUfegCa/ww+rcu/qa1HdHfERdkbUOhXhSpIC5YlWC
	P5Kgo87C/P3YA/YyCnUdrMw=
X-Google-Smtp-Source: APBJJlH/EjkUBnF1Qk5byMW+nJ+egKUQ9YI6HO75+ZUpWxlISXW4lmK0V9TNQDEOmqa3Mn6YM6Enfw==
X-Received: by 2002:a05:620a:4608:b0:765:5c3a:26d6 with SMTP id br8-20020a05620a460800b007655c3a26d6mr17250775qkb.12.1688959241752;
        Sun, 09 Jul 2023 20:20:41 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d15-20020a0cf0cf000000b00630228acc45sm5039863qvl.145.2023.07.09.20.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 20:20:41 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/15] linux-yocto-tiny/6.4: fix configuration warnings (HID)
Date: Sun,  9 Jul 2023 23:20:26 -0400
Message-Id: <3837299eb34f742d064e4aca39a63712e9cfa953.1688958789.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688958788.git.bruce.ashfield@gmail.com>
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 03:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184057

From: Bruce Ashfield <bruce.ashfield@gmail.com>

When building -tiny for qemux86 on 6.4, CONFIG_HID related warnings
were observed.

 [NOTE]: 'CONFIG_HID_WACOM' last val (y) and .config val (n) do not match
 [NOTE]: 'CONFIG_USB_HID' last val (y) and .config val (n) do not match
 [NOTE]: 'CONFIG_USB_HIDDEV' last val (y) and .config val (n) do not match

This is due to our allnoconfig baseline disabling HID, which dependent
drivers require.

Rather than universally enabling CONFIG_HID in the base tiny ktype, we
can create a fragment and include it from the common-pc tiny kernel
entry point.

    252c55e236c common-pc/tiny: enable HID by default
    849f920aa1b cfg: add CONFIG_HID base fragment

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index bd340adc15..a860232bf0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "0c7d2016a3a548fd8f7caf7b1f46abd71008cd5c"
-SRCREV_meta ?= "8a09ea80e6905baf80940dc8c4fe9326bd8d19e2"
+SRCREV_meta ?= "4655de57a68a86e651fcea2eb2c7e88f3de3bbfb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index 6490c69b93..d4b36d0e50 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
-SRCREV_meta ?= "8a09ea80e6905baf80940dc8c4fe9326bd8d19e2"
+SRCREV_meta ?= "4655de57a68a86e651fcea2eb2c7e88f3de3bbfb"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index e514251673..9ae3fc4221 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -28,7 +28,7 @@ SRCREV_machine:qemux86 ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
 SRCREV_machine:qemux86-64 ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
 SRCREV_machine:qemumips64 ?= "4dddf5763b3a26b7892ed75d02bcb9c25a3fe703"
 SRCREV_machine ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
-SRCREV_meta ?= "8a09ea80e6905baf80940dc8c4fe9326bd8d19e2"
+SRCREV_meta ?= "4655de57a68a86e651fcea2eb2c7e88f3de3bbfb"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


