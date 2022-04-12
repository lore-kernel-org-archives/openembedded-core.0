Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46F6C4167E
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 23:50:13 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web09.2027.1649799973097941594
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 14:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mEr7pm1d;
 spf=pass (domain: gmail.com, ip: 209.85.221.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id c4so9649749vkq.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 14:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c3R874X3mTmmGf4ABukgej+daDPgwRth0WTIpfiOWjE=;
        b=mEr7pm1dkKsKvjCFbXtXjvQNoAsjEkvZaGtqk1SZzhcoOo24zUCiyFod9sqAJ3iPo7
         74Imgg79UEdoNWcmH+683m7860ouL7UOuyqyylYbkbF5KLq1y1nRM3+KU1Nf15HdAW6i
         nvfRU47Ot0zsNYpPZSrw1GfrjFjPV0vN/Exsuj02yPOlwzGP3upRLFAmcGPg9KKAc7yu
         m9/z1OVFqNNhnsPgU7oCuRbwjC9k9t/e8Qy/6LoKZzlX96Ii7g6jHcdDFSxywBNx87RU
         sQ/zUTFDhRx1SUqWx7VpTu6mVm2ljwl6qfZzbXZsmlOR1Lo+EawR8+bbUDt+BWnmxi++
         oDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c3R874X3mTmmGf4ABukgej+daDPgwRth0WTIpfiOWjE=;
        b=tAlAvyMIgcdFJBbpb6FjuH05hRoOBg1JJq/+LG/iikOSIzYy5Rwohe45SPJC9y/nqt
         D9Sst9l9ecZzGZ7xOcgK/rC4jMersfG6KK+EarADGgqIO50tb+IPvc/gwTMvWx9GJZCt
         Nit332ZZvy3ahCFKR5MXWe2LMv0u1zRcTARgoDl6LxV2TOuGu+qQ5y31BKb+BfWN1Zz9
         bZuwxtBgyEnYLRJA/uZLeNZFH/5BULS2wzoj1MFhsBscYLpLt2FCO3aMhMijwUGcIhDJ
         HxNGuIwZ7GD86umdePTMRZaamC2P9y3tHjR0xVlkEwULFHEAUru580MQ+HozZbo9k1rf
         J/RQ==
X-Gm-Message-State: AOAM5320R6NljOO8VLi5cP+qvFpilKqZs4qE2Ci7dJO77rsKiVCEkMMl
	CzGvJcRhCcWfp2Aqpo4dR2I=
X-Google-Smtp-Source: 
 ABdhPJzgGmwZI9lysY5WWQTDdhceoOEFnk5J7CDRhFlkR+oqimF0bEfUbwxxv9JRerHN8EmVU1h4dg==
X-Received: by 2002:a05:6122:1814:b0:345:99bb:2e40 with SMTP id
 ay20-20020a056122181400b0034599bb2e40mr4074897vkb.39.1649799972044;
        Tue, 12 Apr 2022 14:46:12 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 n14-20020a9f3ece000000b0035d20c94b68sm1527638uaj.29.2022.04.12.14.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 14:46:11 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] linux-yocto/5.15: base: enable kernel crypto userspace
 API
Date: Tue, 12 Apr 2022 17:46:00 -0400
Message-Id: 
 <d1c1cec49a804defe9c611b618462456fb2e8a2a.1649799823.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1649799823.git.bruce.ashfield@gmail.com>
References: <cover.1649799823.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 23:50:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164288

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    645b337371e base.cfg: enable kernel crypto userspace API

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
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
index 7ef05574b0..441a2e6334 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "c817d3d0f654665fe3d5e56b62ea48d567bf3ab7"
 SRCREV_machine ?= "ea49628781d5a5e42616c73f0dbf2d02d533f29b"
-SRCREV_meta ?= "34f5ef44b9aca6708c44d0fb652ec9a4ccc2d13b"
+SRCREV_meta ?= "645b337371e7e080e71f7d7f2435326242451a95"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 5c4d932df0..6322e999e5 100644
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
2.19.1


