Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3431C001DD
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:10 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.26507.1688656025390994082
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=sF12glES;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1b8bd586086so4956225ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656024; x=1691248024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vMw/qgNGSrm5gX/IjTne9DLDL/PNfr9ezi78NbanxFc=;
        b=sF12glESxj+F/xt6UqjIRcYJ0YZ89Msc/6Zd+DZPLYKlvHK1sTg8S/zKCxslsLW0C4
         mXg5F1j94fyZF1w9ZsqF8Tyk7eS7h4NpFm5ihpRbgc64SSQSQDZ4S8Wuseta1F1q6AZK
         59GgVvlwyZeKJKbqDgBP5MpYzUwk2RsRPn7jb3j7oNQGulexHvrKweCNfkpJdZd+GmLy
         JOYgt1OLRzOSFf4bQLn97g9Ilk70O9NCaJsuusGtefrh/ZIkY7uLURRZDGvFNjj0XY4K
         p8MW7i0C2XJURRngaQsIxeyVPb7bLHFb16+aSjuo2b9I40TWsIG6SepskKgsNN7wKxXN
         ciqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656024; x=1691248024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMw/qgNGSrm5gX/IjTne9DLDL/PNfr9ezi78NbanxFc=;
        b=blbHZ8sBzky5+cmYth/FoM7Dp+tcrdAvVPEPRTsU1wLQEZHVZ1LD8xF+iyMmwfd9i3
         8ktwS+Er7YVOOrVa4/5FggWVb0vo+lflkQr6qPd9kg6+MU30gFG953y9SVdBgbtsRLiX
         JcK0c+/kI3dXuAVt1EWKxJFuqoXh4aUIsA0jIe5DS02dmC61NQFtpMjJ3t6Mc5/fkhWs
         +vcCAeuIOlsXUK1QgEayXA8PjyGJ/UHWDT+W5wtvG25zzsWPD52+fqWrw6iLK+BC+8Aq
         ZgjXLQsG/NF0C/V+7cXUU/FEFnkp2K802UcdbYWjmi+lNMmIQigSF40E5EqiNOELxRPc
         9qSA==
X-Gm-Message-State: ABy/qLZ/Az20yCupZtVi6kRTpeFJE7nHo+dcPdpOtHmqNfHs0H6L9GzF
	yqZSATY5yxMwfpLTgMFO+aycfkAH72eVbfWJxOw=
X-Google-Smtp-Source: APBJJlGTyWfN1SGVyAuFemQ0lWwfHdN8b0ZfgwwS29W9v5tvke4+CxmCeNuyuHQwcmLf4fBgoUOW8w==
X-Received: by 2002:a17:903:2349:b0:1b5:5fd2:4d6e with SMTP id c9-20020a170903234900b001b55fd24d6emr2650500plh.58.1688656024375;
        Thu, 06 Jul 2023 08:07:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.07.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:07:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/28] linux-yocto/5.15: cfg: fix DECNET configuration warning
Date: Thu,  6 Jul 2023 05:06:15 -1000
Message-Id: <4c063286ab115abf3d15e4713ea9bcd4f5fb1ab2.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183965

From: Bruce Ashfield <bruce.ashfield@gmail.com>

-stable merged the DECNET removal to 5.15, so we integrate
the following kernel-cache commit to fix the kernel configuration
audit warning:

    b647d9611cb base: drop CONFIG_DECNET

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 06ef70ac1fa8201c5b46050e098ebea3b1423f9f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 924e6ffa10..8e5ff78790 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "b2a7dbd4edac7627c091c2ab14fec83726a4c79b"
-SRCREV_meta ?= "a6e18bacddf8ebca0c151e809c9996e17e08a7b0"
+SRCREV_meta ?= "b647d9611cb4936536e60a438292fc22df2fe000"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 859ef2b687..77e11c100b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "b79e89ab973aeb8ec48e2cd987436ab52678e795"
-SRCREV_meta ?= "a6e18bacddf8ebca0c151e809c9996e17e08a7b0"
+SRCREV_meta ?= "b647d9611cb4936536e60a438292fc22df2fe000"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index e88e465467..c4266c6f30 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "079c88490578df99b38570c8968b836b8347ed44"
 SRCREV_machine:qemux86-64 ?= "079c88490578df99b38570c8968b836b8347ed44"
 SRCREV_machine:qemumips64 ?= "47d334232ab28f0f8d5316e07e11f8f14c6aaecc"
 SRCREV_machine ?= "079c88490578df99b38570c8968b836b8347ed44"
-SRCREV_meta ?= "a6e18bacddf8ebca0c151e809c9996e17e08a7b0"
+SRCREV_meta ?= "b647d9611cb4936536e60a438292fc22df2fe000"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


