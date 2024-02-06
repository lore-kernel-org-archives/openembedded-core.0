Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4144C48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 20:53:45 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.4286.1707252818772311306
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 12:53:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nJub3IQc;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7838af983c1so450668685a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 12:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707252818; x=1707857618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SDGFW5bx+YenhHMGKB702qrx05n8xCwtLeE9IUDoLc=;
        b=nJub3IQcLnq87sz1/JDNOJm9h7TgWPir7GbuZK4mDm8oHgP6XM/GA1qRSgEYBcj+2J
         o1ihCdLRmc+sMyHsfNtZ6L/LWTaLEvs96MGRFR9kVb5RZXcNB0eYkEOoYrvLKMsfL9Xq
         Zy1/QVxYKaaRCN+P5qp5LQ1pp4KL+VrVOJYYUSyHooYSsNrmJtpCCB4W6tzpidkdBfes
         mNex+HLSY4FS3bP6waBhCp9s/aeZUZWlDGljckuGlnBHMtfTC9CI8Algz12V5fsLIUKW
         PYETBt75tNzLcgdaaiAuBM6VcrPVBGsqGXSiivAyP/5fB7bydDYlv4g2sLd3yUwLBv1S
         JKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707252818; x=1707857618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SDGFW5bx+YenhHMGKB702qrx05n8xCwtLeE9IUDoLc=;
        b=rzbvSN4uN1WGszw9/bkj305M0ZJHMgKW2tLgp8U2sLProahb/K7CXrYiHqm+H74a/4
         ede/VbMfN0zvjKNsYKar1JyMcIFjWVmxOrgae76XFF+Cwjg1DlbkOFnJlDYZAHJBErfy
         u6spQkDZ7IppA9OH0NV8UhbEezJ/zpZrf473/f2JZEjPcPnLllRrtz1i+KdqFwrnCRyP
         P4+2pONIvVBa/r9VFSMUAwwnREMhbsj5V9N6eg/i68gqrSVaqWGjewR6BbChbNrVtib3
         B5pvCQLYfObeA6TLPRsYryhBVtEwDuvIebx1s+qsTYHWLV4iQeXX91CvqTdWkoIzzeJq
         MTiQ==
X-Gm-Message-State: AOJu0YwsGqYhHCHfgWC08pjr/XHgoikKk+cf6kkiXmrZ4/8KmImCTUZF
	Ml5AinKEs2ia7/XxHdgp/ES/NYnVH9ddBauvzflyQmQCU/sHC3WKOJzxDxEKeWVpNA==
X-Google-Smtp-Source: AGHT+IGKnnbh/R4dajGxrDBesTYWZQKrHv5oCZgIu107fFWExDTw7NUDr2e3ctsxHEE9hcYFb/gvFw==
X-Received: by 2002:a05:620a:a04:b0:783:e2ed:da61 with SMTP id i4-20020a05620a0a0400b00783e2edda61mr3567284qka.20.1707252817773;
        Tue, 06 Feb 2024 12:53:37 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id y13-20020a05620a0e0d00b00783de6b5ccfsm1253506qkm.88.2024.02.06.12.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 12:53:37 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] linux-yocto/6.6: features/qat/qat.cfg: enable CONFIG_PCIEAER
Date: Tue,  6 Feb 2024 15:53:28 -0500
Message-Id: <50a08ec9f1c930a486cf1c95e223fc06d36b44f6.1707252636.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1707252636.git.bruce.ashfield@gmail.com>
References: <cover.1707252636.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 20:53:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195027

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Naveen Saini
    Email: naveen.kumar.saini@intel.com
    Subject: features/qat/qat.cfg: enable CONFIG_PCIEAER
    Date: Fri, 19 Jan 2024 13:29:57 +0800

    Error:
    4.24.0-00005/qat17/quickassist/qat/drivers/crypto/qat/
    qat_common/../../../../compat/qat_compat.c:401:19: error:
    'struct pci_dev' has no member named 'aer_cap'; did you mean 'ats_cap'?
    |   401 |         if (!dev->aer_cap)
    |       |                   ^~~~~~~
    |       |                   ats_cap

    https://github.com/torvalds/linux/blob/296455ade1fdcf5f8f8c033201633b60946c589a/include/linux/pci.h#L339

    Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index d30389124b..25ff894ef2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "59ee8cb752a7e280cfe2d480964aa5b6c74e4203"
-SRCREV_meta ?= "48f7c852bd375b9340c68897ccd87ad89ead5f38"
+SRCREV_meta ?= "80606e5b79499427524c82e4965de27e1f57c61c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 628a7cbd82..b530990f20 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
-SRCREV_meta ?= "48f7c852bd375b9340c68897ccd87ad89ead5f38"
+SRCREV_meta ?= "80606e5b79499427524c82e4965de27e1f57c61c"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index ab72df5c61..ed722f2f80 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
 SRCREV_machine:qemux86-64 ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
 SRCREV_machine:qemumips64 ?= "d41c8b84fcfcb4c2dd8eb856172cdc2b6a1bd342"
 SRCREV_machine ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
-SRCREV_meta ?= "48f7c852bd375b9340c68897ccd87ad89ead5f38"
+SRCREV_meta ?= "80606e5b79499427524c82e4965de27e1f57c61c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


