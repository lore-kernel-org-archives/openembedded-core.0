Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A674C433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:39:15 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.10703.1652193552513959524
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xUfrkxaJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id
 j10-20020a17090a94ca00b001dd2131159aso2228667pjw.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6gLYmr7487unSVFoSTfit/lhvMWgWE6x15A5ox/z4dQ=;
        b=xUfrkxaJ16n6KOLNl9ie818D7QUB7xK2i3q/UTAX5Rhwq0EoVlFT+48jOFKMAbsxGf
         N6XdCOYQGYpcwx11CiP6wb/dqb75MUwmWYBzYNdTWSI8up329tpIA5AMMbf3BjN6btKN
         ijNoD2/q+FSGvJPYrlkKdgLA1UcfG3omW+gIJEaLIXdXZc0/CBexqZGfczPB+2PpqjF9
         nG61DBpIa/POJ8+kNxiYBnaFkCrbZBZ6M+GBoDNT1HO6Xr6vZ9zg3NVVP55/p70jO77d
         hkS1GzoIFRT8DqT2EOICrAe9+vcATVmFA4vflHfzmlyhcGZPPTdM/Tbo7IA6JbLHQwpz
         GAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6gLYmr7487unSVFoSTfit/lhvMWgWE6x15A5ox/z4dQ=;
        b=GfEu8z8sFmyf31bLLMhzIXVQ3+AkB1Yhyr2UHaxG7sTwtIZKeQchvoP2B9OrjsKlcc
         YCmCqN6jh7RN2y1oJRcmAGAIHQTJCq1dvUiziA0NZRH+nT+dj42jzGq91u6c33h1DeNe
         zZmH6p7zZtAKIAAnrOExhasaWJQL8u5ROVOGISF6v4lOTDxrdXaHmG3ETPsCvx2viLcO
         UU6Iu+AzfE83J0WKgCAAepPf4tGwPdb9ukZhgx7O7D/UK8LuVPprTJBEtqAaq3XFSAwk
         8Vpg/9/c4A/TzPQT2ag4KvkFO66AsqlykECIHl6vzsU3k1cewToz58qF3Duz8upsE1/j
         MxwQ==
X-Gm-Message-State: AOAM530/tv0+0a6cG67g5MmAAEdgFxX2xxJDmds7wTkv7qbGb8XklTYy
	isaLE3Lj9bwCqB2lfJqLnG0g5FHmq0oOZBxB
X-Google-Smtp-Source: 
 ABdhPJxjkgH1Rxjv5LaHIId5SAC92+tAJ0RiPkzLL6RLAUYErOHFRD5twU69mM0oDoihXL5PkdGJxQ==
X-Received: by 2002:a17:902:d044:b0:15c:eec0:2bc with SMTP id
 l4-20020a170902d04400b0015ceec002bcmr21120089pll.28.1652193551388;
        Tue, 10 May 2022 07:39:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.39.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:39:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/40] linux-yocto/5.15: base: enable kernel
 crypto userspace API
Date: Tue, 10 May 2022 04:36:55 -1000
Message-Id: 
 <0b6d826557cb395a9d4ed5bab85145314707071f.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:39:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165433

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    645b337371e base.cfg: enable kernel crypto userspace API

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c769807e3a150496f62be88bec9678c9f9dce211)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index d9ec799d7a..dc9b5dd266 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "21c75f01103d61c2382d334b3ffbfe99dda7e262"
-SRCREV_meta ?= "34f5ef44b9aca6708c44d0fb652ec9a4ccc2d13b"
+SRCREV_meta ?= "645b337371e7e080e71f7d7f2435326242451a95"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 94911d309d..14279920ba 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "ea49628781d5a5e42616c73f0dbf2d02d533f29b"
-SRCREV_meta ?= "34f5ef44b9aca6708c44d0fb652ec9a4ccc2d13b"
+SRCREV_meta ?= "645b337371e7e080e71f7d7f2435326242451a95"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 8035a87c57..0ca177cc8b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "2fa9f5b7eded592b4a38e505f914971e48601e00"
 SRCREV_machine:qemux86-64 ?= "2fa9f5b7eded592b4a38e505f914971e48601e00"
 SRCREV_machine:qemumips64 ?= "6aa2697e458c5a67404566ddbb3027a48593a7bc"
 SRCREV_machine ?= "2fa9f5b7eded592b4a38e505f914971e48601e00"
-SRCREV_meta ?= "34f5ef44b9aca6708c44d0fb652ec9a4ccc2d13b"
+SRCREV_meta ?= "645b337371e7e080e71f7d7f2435326242451a95"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.25.1


