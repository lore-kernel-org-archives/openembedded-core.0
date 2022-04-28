Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E2FC4332F
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 13:48:17 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.10682.1651153691757664563
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FU3H1iTu;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id t11so3424234qto.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C/nTNoiYylAvnQDlDNHe/9IA3bqrt4Mf64BrAhmwB0I=;
        b=FU3H1iTu50DGKqZJ/uM2KDXg57TlLcjTpEsGHNRm+crpyBAEk6SwaYDTndHTBScQQD
         cIITWuOuxyqgDT1AL+z7ArrYT8F2gjWgWzpJV8Yw8Db66NKJyQRfgwNws6JumonWECor
         7DuwqSOmC/NHNVh+wgpRJaIGxROChPaRj2vgfpyZb702/KNZpa3Ibrtavq8gaqyP75WQ
         4J114ym1EKgtTtYDAnXExVfR8HtTOKEDCjdgZcN4DGl3egbjEGF6GarsVsqvgeBk4YQt
         SjWOH+LHi4yxGdijwlVbkVPaa+V9djNgBzAj+tFRGUmJDrPVkV4kfl2tkKB6P9y31hoS
         mi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C/nTNoiYylAvnQDlDNHe/9IA3bqrt4Mf64BrAhmwB0I=;
        b=6w59T4a2EHs+P5Gcmg8LjlOuN/G2UKFpgVgvgCOLfZDcE4cGf85bgAmFuIdQ5dpo9E
         C9UQeakVkjdK6ya2khv1Byw2/OK0CspnJwyAFC1hkcavrL1FLVMRcqGwIBUbKr4zZCKu
         yzsliNSryoMllKpgO6pjs5CDDVS5O8ku2m6gEsRs0JMDX465+Q9pnxgDliKpXFTL9WFe
         1ncISF12/zEWZ3rExZkBcpZmxH/dSqx2CBjYql/9/0c0QR74dqgTDhjAUTH5zUf7kPcg
         StAaoU5A9/RQW9RKFZXnt2rMX9SZ12XWQW1VdTdo3cdvm3GDeeH95QoM4sTYNhYOPFM7
         Leeg==
X-Gm-Message-State: AOAM531Be9CLt5hHltQkO+ZDDGf1ikY1TF73Cq5hiqbyJoqvgpvB0x85
	ZLWzZir4yjhkv2jNGeDG5PM=
X-Google-Smtp-Source: 
 ABdhPJyjuidvHujHhDGN8icB6Y+uhyPoU2a/xcVZbrbjlD018VI5gvAXGTkVtLz/fOp0IMalrW8tpg==
X-Received: by 2002:ac8:7c51:0:b0:2f1:f3d5:4157 with SMTP id
 o17-20020ac87c51000000b002f1f3d54157mr23689588qtv.562.1651153690788;
        Thu, 28 Apr 2022 06:48:10 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a059400b002e1d59e68f3sm20809qtb.48.2022.04.28.06.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 06:48:09 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com,
	jdmason@kudzu.us
Subject: [PATCH 05/15] linux-yocto/5.15: base: enable kernel crypto userspace
 API
Date: Thu, 28 Apr 2022 09:47:51 -0400
Message-Id: 
 <84a1b777e1bb6d71af261118b50b08431119e3f3.1651153370.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1651153370.git.bruce.ashfield@gmail.com>
References: <cover.1651153370.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 13:48:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164953

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
2.19.1


