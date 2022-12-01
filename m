Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CB6C4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:23:42 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.44632.1669904615429564266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:23:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ZG60cuuY;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 62so1772256pgb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0biY2DaezOLysAT4nq3V9p2balG1j9ZbIaR5asdnTc=;
        b=ZG60cuuYi8hfe/egs3/8FqRRs0TfNZJIgJZi07jV6VhdIhsSHfx/F7T/ITarbUgPO2
         hq634dVtX01f5kYehndKanRS1hCIDP0GeAsc0ACuTyMpEc9/ZQc9ms51gpUKpY4+DEtX
         IHFSWmzbQPFzC81e7kUa6FnDoNTboB/KODcAjrz9AxkEhHWltpI/0tR5jNUix8mrGqGr
         OgjSUz4h/fkUVYxRxquqlkibVaZ50VydoeZW33SB7YmVrlKaxMJS1wx6BzNF2F+VLByo
         ZGkzNMmWmjqLi9GWrAyHi1Gkqm1NWWLg8lJTeKe8YhFpzZh8ymX4Mu2lbOEbw+u8PIEA
         L0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0biY2DaezOLysAT4nq3V9p2balG1j9ZbIaR5asdnTc=;
        b=1wtNom/zPETW8V1kc1F602iSU+R1qO0n7wzBBwCf+35HNv+I85jepps3+P2sZwKKI2
         /ILT2ACMSUa4hnGwKjcUgrqtcFANOspbMxXmzNJ0+x6a4b8PSKFocBevPgBmrFJAEvDB
         ks3ct+czebFVnEj6WLUUkct+LFUhZtPwcjeQPYkgbsGb1pY2Rru6Ntf5/tIGZ+C6+7mm
         u1pmwXTUH3LmuNVNwMPSi8v/NVtCyP9BESn3sYh+aFxxUINv4/vPD0KG4/WUxXa/ujH1
         e5yxVi3pfiA0O4cH13c3uvFdvKzcZJIxLMG96gT6ZsNPb82MOYBae7/y7BCPyO+LcmgH
         MWrg==
X-Gm-Message-State: ANoB5pm1hYD+7KXSNNSL+0K43hHil94btQWWrFWdi6F3JWTXa5mtkfRl
	I86VKoC/QZNIbgpVVN8E9RvvazLjTfckIDcwUQA=
X-Google-Smtp-Source: AA0mqf6UYuobLvZuw/7HZiFhHGL7Swu6G1abULpNtTmbYsab2RyyQdF2J3KS/uLRMxU+vGhm5X7Fdw==
X-Received: by 2002:a63:4643:0:b0:477:751a:4169 with SMTP id v3-20020a634643000000b00477751a4169mr41825298pgk.300.1669904614421;
        Thu, 01 Dec 2022 06:23:34 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p2-20020a622902000000b00575acb243besm3300615pfp.1.2022.12.01.06.23.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:23:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 13/22] linux-yocto/5.19: fix CONFIG_CRYPTO_CCM mismatch warnings
Date: Thu,  1 Dec 2022 04:22:43 -1000
Message-Id: <bb44f79c4025b16ab054c186546d956c608a8aad.1669904433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904433.git.steve@sakoman.com>
References: <cover.1669904433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174076

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    0cba9aa4044 qat: fix CONFIG_CRYPTO_CCM mismatch warnings

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit a2e40db0d957bc8b7e77e5f54e6646bb633ef42f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.19.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index 2b12b8b8df..5c316dbaf3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "2bd6711a4dcc49e51ae68152ed0b40384e291554"
-SRCREV_meta ?= "7381acde368f24529d8c9face1826fb54bf7feee"
+SRCREV_meta ?= "0cba9aa40445bf59bfa651e1bd43a31c2ca7d524"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index 0dd3816dc5..27fa6d9867 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
-SRCREV_meta ?= "7381acde368f24529d8c9face1826fb54bf7feee"
+SRCREV_meta ?= "0cba9aa40445bf59bfa651e1bd43a31c2ca7d524"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index b242dfa27a..44bb02b9c1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
 SRCREV_machine:qemux86-64 ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
 SRCREV_machine:qemumips64 ?= "20d5adcd760ffdc90b4e5babb85a07b9d6ff3113"
 SRCREV_machine ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
-SRCREV_meta ?= "7381acde368f24529d8c9face1826fb54bf7feee"
+SRCREV_meta ?= "0cba9aa40445bf59bfa651e1bd43a31c2ca7d524"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.25.1


