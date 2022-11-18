Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A493C43217
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 22:29:22 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.7451.1668810556877504815
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 14:29:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BixVyZBp;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id i9so4442773qki.10
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 14:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hib51yQHDdV2xL4rinwlmoPnHfNMyEUxJBxZ75svE/k=;
        b=BixVyZBpf/c84GFBbEu68Ha+bXApJQmp0xMSrrTe7EeqNslJrupNjC6UTfrcqH3Llk
         KUACvPelJ4JDYBiQMLUbgg3QaC1tzfC/aeJAyfHVMdzYtC1jZJPRODXoz4eSSh3Rsekd
         Lk2+oRSlZEQxuGnkIdTySfd3esvfeqn38q//pzAIjt8XaGHDWRezhnEI+Akj9le/hDVr
         X0XPWPJDIdFzFDHbr/E5vplFKuzmCdqHCzXnm9ZRwJx0k2JNUraRX0FJvQ4Z1bFsvnz2
         qxogcXBCw15zC2ZIfgBn3SsTFcR+HdRbiPVucrCXrBbeVjqge5RD6qZ+4JjUJ8dfJn4C
         eN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hib51yQHDdV2xL4rinwlmoPnHfNMyEUxJBxZ75svE/k=;
        b=kXLEMKTAtI5Fd0KteNJoTbbr1wYoKlSnOyIbIV+TU9Mg/PzrTaiBFfTilx0WNdOHd4
         op2aYUqH+el/z4pqGI/n0ngxel2uuGkyP96QOF5b3EWx6zdY8ilOoRf1+0hAWlbiBlQw
         sLPDLeYpltKnkAA79oL0I7dUfWrWXwVMZzHVUFOB+n42Lq4EcOdV/PSe99uTJVqJQwry
         b3Exh6dw3BsIQRWEN1HuvwFfxLo1pti+vIfWBBfLskvAV/3w8wiPAnlBRV60+L0X49+K
         lHaP3Xbk9+WpVVuXFIjmcdJ2SZa1jUlxZEMl4qqnKOjgrfnzQbOnZ90wJlgeIUgjteFU
         601w==
X-Gm-Message-State: ANoB5pn/7C0/Xz12H3TWllCbH52zNdlJKtvTY1OupEEQLbFSjFlsTRh7
	JHtXhiqL3NSvRxtssi/lEpwLJ8tEmZUcmg==
X-Google-Smtp-Source: AA0mqf6mFSaVLVLpLASpPOLFhywELR8N74Eg3X+EOk/jUKgnmMW98fTrBIMEQAkEIv8nmSze7MV9pQ==
X-Received: by 2002:a37:a893:0:b0:6fa:2721:2e74 with SMTP id r141-20020a37a893000000b006fa27212e74mr7951374qke.467.1668810555941;
        Fri, 18 Nov 2022 14:29:15 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id h9-20020a05620a284900b006f9ddaaf01esm3304068qkp.102.2022.11.18.14.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 14:29:15 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/15] linux-yocto/5.19: fix CONFIG_CRYPTO_CCM mismatch warnings
Date: Fri, 18 Nov 2022 17:28:57 -0500
Message-Id: <8507e57f665029ffa505b6c8f636be1413ed717b.1668810409.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1668810409.git.bruce.ashfield@gmail.com>
References: <cover.1668810409.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 22:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173507

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    0cba9aa4044 qat: fix CONFIG_CRYPTO_CCM mismatch warnings

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
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
2.19.1


