Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44140E7719C
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 21:17:34 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.31970.1736371052888154834
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 13:17:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qfDspM11;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2165cb60719so3346355ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 13:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736371052; x=1736975852; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nG0dTBHSr0nONIybrilem9SxA+OmLkYubYwSBdRRKUo=;
        b=qfDspM11ET84v2xaLWlStMuTKAyY7R1vbg9DGZ6QFUeJkz5n1ILeBeJhUXBfItOxMe
         Al6HXfkpPXwTCGnHmhvCWMmhA9n8wd9r5oulX8pkpBQ+3P7et1yQbnzP2D5nmv7wDl4+
         NL/Iroy+5Sbo4osha4leHk8Pf27tkV+7QKWaPEEEyOciMHmltDAgufhCPlUlBBNhZuk4
         yjdX1P2Rz9K3FjISfzIoKcMGuYGiOXgKip5H50t0iBnP8tBJLP+3D3QkDGpEIv0SP+M4
         xXjgUvwRdJGbNan4p1CdrHQril3y/Zh7fFcj6zgpRVMAaK93wWYoKfe98egsVDpZWK3b
         YA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736371052; x=1736975852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nG0dTBHSr0nONIybrilem9SxA+OmLkYubYwSBdRRKUo=;
        b=kvjO49ro/zqAto9BPaJgm2MYdrvAPezX2YDyIoXnjD82npB7wMJ9U3E/pxrIGhxa3m
         o9ecNk/YUaEQDoI8AK9JjBgqkY7phvWf1QMKFIAgYV66xlEzBcdgcFDxE6Dm4KnvyA1W
         n0cnMSfrhsbG+0Wv1TQCEXDrSyRKpSKkxnmOvTujuORK3tT3aB6ySTssbOUSA8DbcZ84
         S6YA/uvJPbjJyQhx19CR7ksXJLVhtWfbBM1BKgF9KzarQEP4Ab86xslDwCBovu0APJyY
         lIobZFVXcifzrFNbioMpbGuAX00jsqF4tb36cuc/ejJoK0ySCODJW7rRDJF/ZoicgDfT
         Cc/g==
X-Gm-Message-State: AOJu0YwGoxGk2Wa4TmZzBLYbYa25dgbofk1OcH/yYA4j0rQ77G3fvGPd
	HAOJS4Ff76QxKpZ17L6bq5Viw2uAnoGi11//U/RTlCbMRiszi3g8P9L5ZO82Oat+fVOBu14yA+l
	k8lI=
X-Gm-Gg: ASbGncvWU2aIfuAtPWPMm9AVlUt97GGCet19OQXwqvP6SnvKutiDZYVqrEcs9EKnJPB
	6g8/YsPDu6gWPxEimoKRSoCTUPpKP603zttZGqSpXMm+4HZ+4mw6dD21uHngY7ssOlbOMUepr5/
	LlP+bQV/MdCWdgL8fSmjPcqxwTEvtbfsV7/zlksRC5y8kbMoxA6c/Rlsn7IuHQOlX6sOX/ZnMe5
	3K9gKzeuz2aO9m8biLT1YiYCyPzFTevFZwC8XEAAAzxBA==
X-Google-Smtp-Source: AGHT+IEyTD44NG5inAeVwYuO0CJmR3752d8BGmYNgLIK/OtCu4S/e4XqxG7FyFFQcWWBevGQ8U/2zA==
X-Received: by 2002:a17:902:d2c6:b0:216:2426:767f with SMTP id d9443c01a7336-21a83ffc1f1mr60418615ad.49.1736371052136;
        Wed, 08 Jan 2025 13:17:32 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdd9bsm331403495ad.132.2025.01.08.13.17.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 13:17:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 10/18] linux-yocto/6.6: bsp/genericarm64: disable ARM64_SME
Date: Wed,  8 Jan 2025 13:17:00 -0800
Message-ID: <a8f56a7de3e82bdf5f6d1d21c30c83054f97a2cd.1736370890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736370890.git.steve@sakoman.com>
References: <cover.1736370890.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 21:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209600

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp/genericarm64: disable ARM64_SME
    Date: Thu, 21 Nov 2024 15:53:35 +0000

    From upstream:

        arm64: Kconfig: Make SME depend on BROKEN for now

        commit 81235ae0c846e1fb46a2c6fe9283fe2b2b24f7dc upstream.

        Although support for SME was merged in v5.19, we've since uncovered a
        number of issues with the implementation, including issues which might
        corrupt the FPSIMD/SVE/SME state of arbitrary tasks. While there are
        patches to address some of these issues, ongoing review has highlighted
        additional functional problems, and more time is necessary to analyse
        and fix these.

        For now, mark SME as BROKEN in the hope that we can fix things properly
        in the near future. As SME is an OPTIONAL part of ARMv9.2+, and there is
        very little extant hardware, this should not adversely affect the vast
        majority of users.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7ed7b6ad39bdab4e67acc7a5841b4519fd15a2dc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 99e8248c72..b02aeb2d08 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "67f358194225f9936b9a98ee9366417597be1769"
-SRCREV_meta ?= "ccfbc11e4a21d87bd7ab9f176d1b941c4d44e6bb"
+SRCREV_meta ?= "0d6304e8cd2ae4269ef1151edef0d9e7b5a1babc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index dce2633842..0990260ec1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
-SRCREV_meta ?= "ccfbc11e4a21d87bd7ab9f176d1b941c4d44e6bb"
+SRCREV_meta ?= "0d6304e8cd2ae4269ef1151edef0d9e7b5a1babc"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 924a9c709e..c6355ff33d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
 SRCREV_machine:qemux86-64 ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
 SRCREV_machine:qemumips64 ?= "9b078a376adbf198325e1569246106e480191063"
 SRCREV_machine ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
-SRCREV_meta ?= "ccfbc11e4a21d87bd7ab9f176d1b941c4d44e6bb"
+SRCREV_meta ?= "0d6304e8cd2ae4269ef1151edef0d9e7b5a1babc"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


