Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA3FC25B7E
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 21:44:43 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.3690.1717105481148202335
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 14:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QLnbqSAF;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-792e4c2a002so90252985a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 14:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717105480; x=1717710280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BC1tJta8OsFzF33HXJPkhAJ/k3LdpNrhTwEKg1yslgg=;
        b=QLnbqSAFa2TdzJ+xzWOIkI/DOTLrLYoq5zSob94dYa1KxgcHm1VSm3oCULtB74PzPW
         ZfdElBkmcbZL2KizN2CRXq7Hiu6K7P3zFXhLK0CBpkmmVcDnr8LVQMfPB5S7+MvP/qRB
         GcwPbKPZ+M1eS2GfL06pT0wG2k0a9/2sLk9UBJ+/ukh1hnWHgExgYR1hFb9tg+7130jZ
         7hVDnAgx5vetHCW4CHZov9jVyXxsJD093eTsgEpngNfPd3/0Mk7aBLrh25N1fVkl3/iM
         7at8WLJR6ya2y8OWiVlzhMX9P3zSSqbS53/KAJ7k3YXK7I69PzLQlUb4gBlnGaE3VgcY
         agLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717105480; x=1717710280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BC1tJta8OsFzF33HXJPkhAJ/k3LdpNrhTwEKg1yslgg=;
        b=RzwTlcdlstDZouHWGWwSL2uAblv16vJnKhyC1LcnRa8VRkgsdqM5USXDiyNACpD7Ns
         b45TSqQYUn7nbbdQM2Lyclx2TDRZdnH7AepxIEDOkL3ctuqAiFqu8CDfWXpUsh3fWSCX
         sX4yCBDOtJjFZ1RZFNLCJcO3cdepncwQEU/6j8AgXZOl6iw7jBKqmwbNhgvBzWePNGfM
         qXDpychL21hTxoYkw4B+tbQ5qxXFcZeiJs2z3Wi3RPqeLpIHVrkRl7Hv7fJ6zvRCXPZb
         kthru3dGF0Z5NkeEtozvsMa0h8YrUAogtCZt/XF5YPg744c3LfBGIRUtxYxTM/toBdAm
         TK2g==
X-Gm-Message-State: AOJu0YyNgYtRxdtratPQn3ZZFzwDw44MdHpcsRB/xtoz4dE8NWn6RPBO
	YBJuVLDNAXP6gRWOkqwxk1mnkTmAzHpOpLOg8ZCW6HpQjxVxpk2b3SQ7pPba
X-Google-Smtp-Source: AGHT+IFWRXUu1qClomAO+anS7rcOkxSGFdBjiqXEH+MHHfLw9rwIUZOV/4cbJngJmSgfHEkrvc50fg==
X-Received: by 2002:a05:620a:a02:b0:792:c0b6:c011 with SMTP id af79cd13be357-794e9dabce8mr325271785a.30.1717105480029;
        Thu, 30 May 2024 14:44:40 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794f2f120f5sm14642185a.36.2024.05.30.14.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 14:44:39 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] linux-yocto/6.6: cfg: introduce Intel NPU fragment
Date: Thu, 30 May 2024 17:44:32 -0400
Message-Id: <a986a3d5808479def829890a5abee2f4dee03c62.1717105222.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1717105222.git.bruce.ashfield@gmail.com>
References: <cover.1717105222.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 21:44:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200051

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Naveen Saini
    Email: naveen.kumar.saini@intel.com
    Subject: features/intel-npu: introduce Intel NPU fragment
    Date: Wed, 15 May 2024 13:44:57 +0800

    Add config fragment for the  system with an 14th generation
    Intel CPU (Meteor Lake) or newer. It will allow users to
    enable Intel NPU (formerly called Intel VPU)
    which is a CPU-integrated inference accelerator for
    Computer Vision and Deep Learning applications.

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
index ea4360215d..f8d47a9dba 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "59b2635b04e2ef8162e52f82e848b81073cea708"
-SRCREV_meta ?= "5114225a4b9ca817be4456f43e26963005955e13"
+SRCREV_meta ?= "66bebb6789d02e775d4c93d7ca4bf79c2ead4b28"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 10a8ec0656..7378a37521 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
-SRCREV_meta ?= "5114225a4b9ca817be4456f43e26963005955e13"
+SRCREV_meta ?= "66bebb6789d02e775d4c93d7ca4bf79c2ead4b28"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 45a6c970fe..fdb7702594 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
 SRCREV_machine:qemux86-64 ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
 SRCREV_machine:qemumips64 ?= "aa0c0197b3a0628992e959708a2ad015603e93ad"
 SRCREV_machine ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
-SRCREV_meta ?= "5114225a4b9ca817be4456f43e26963005955e13"
+SRCREV_meta ?= "66bebb6789d02e775d4c93d7ca4bf79c2ead4b28"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


