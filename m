Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52DECCD193
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 03:09:04 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.4655.1760584141705749045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 20:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JZMabtnN;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-7946137e7a2so5306616d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 20:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760584141; x=1761188941; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSvb3eWGiB5h0DgMUYPzFpJ2Aw3IWeLbyJzwG9izvk4=;
        b=JZMabtnNgSLzs8A//bKDKIwQqHuVXIdy8p3HiQJl4ojsjv8aj3ShbO0j2dKTypIOXU
         vjw/UrLZC9/FuzUQnoxfejIPGy7tSM/JvFPgw4oXAyWTZNMwx6uO23/bWt9ZsWcAvicH
         MCLW8+V7Zobotfk7gnsKbhK9/lIMP1QDIXhtljI0uovreBfPQ6GnFvRYH1lR5RUw+468
         UrE7mTjLEnc/a4AM7mopM42UCn2ur0mdmtTniwtoPxKNFUDSvsYLdWGo9s8ZO3Ptq9PN
         72yfRr5hZFDaMu8dP/11CGjUAyWx6qIHDdFbuc1OOMxfcXyrDcaGW7zOmYjgzVhJD4PH
         d2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760584141; x=1761188941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSvb3eWGiB5h0DgMUYPzFpJ2Aw3IWeLbyJzwG9izvk4=;
        b=JLF7dJ1I1Xpwpm71OJLnwrN9EI5Mpkf7YEoTnTvS48KNGxmn0YIjurAYOLkFpUROS8
         reW+VV0C9dggGTKZehiHwyfGDHUx2fNf1Mp2D7epC49tQkW9yuvN1UovYdhR3bLYQ0Nw
         zp4w0/CX/6VGYNFm5snQflvGTEUL8J+/YxqCnyoNWkpLccuH1GzoEjq77vsANI+ttstT
         PyQMGD2sjK4S3bgz8O/9nwbSOEhMrgMZYKx2h7iEhryTeHtOMXfRpkipsSsTJRCq6X+O
         9yOpm+Ff+rsaCexT7xPuJ/xD02xVdY4eoXexxGssTmcTBODqP9pTdmL/+0KHIrMDLMCM
         ZYew==
X-Gm-Message-State: AOJu0YxerdPaCFKzpyw8iDVjd6Bo+aerOfe/ON6KaCtmdENhUpBFqM7m
	FtO77lebigLOWdbU4avejOyNqJwfiSez+1bWEblrGaAQ04rKcuW4BEAj
X-Gm-Gg: ASbGnctFzpx9WwbZVPP8SSdVGjWnHUiF5i6j/336/7IhAqo6fpZRMMScIFjrq4rhmQH
	0dRHmX49Vk5FPFrIjn5E9iMceHARwFJ+dI8I8UndgiC96eqTdj2jjQpyg9Onm5fTrTK14EQOsDD
	r1atm3eAoljROPrKlu4fo0plb7skalnyYlSD+J5K5TA6F0fVUxnqBdvAxparzsiq21LMjvU/Bzl
	J+mpeZ65OWX9ja3gaYmq+jfkja1DjpUU/hJhwlLJf7WyKtTNVJ0a70I1ORj5oBIGPUgGl0297Hb
	aSVD1EZL2ZpyY3n/lqjb0ELgAWI/yD4dV4oNMM3s/40s/M9a0fLx5WTIHOE6wM2fnqp7mQLVfi5
	FjorzgFw8KBadtCDpcpqg//E1rnIMLRbW2vvgbqmUDJaJ6AIcGbCTFZW4H8PQEvg7i0DceQhAjp
	qf9Gs+H2+VXwK36scpF+Rrw8Jt0QHGzmVgBFyKFibCWst63jYlzwM1q6iN/kJfo8X6/HZrDdQrw
	ZOF
X-Google-Smtp-Source: AGHT+IFcK2l9F2tF58v2qslByIMJ5RUEcxK4Gtf+NCtP6Y7mSzROOhJ8ip4nWCETtti+xbNMig5jrQ==
X-Received: by 2002:ad4:5743:0:b0:791:c933:ad45 with SMTP id 6a1803df08f44-87b2efc37e1mr429316836d6.37.1760584140528;
        Wed, 15 Oct 2025 20:09:00 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012a39d9sm30824986d6.44.2025.10.15.20.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 20:08:59 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/11] linux-yocto-dev: update to v6.18
Date: Wed, 15 Oct 2025 23:08:44 -0400
Message-Id: <c6cb67c984cd309eb6f9843ed74150f13192fc3e.1760583881.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1760583881.git.bruce.ashfield@gmail.com>
References: <cover.1760583881.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 03:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224926

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping the -dev kernel to 6.18+

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 196e6b4761..fb4e0864d2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v6.17/standard/base"
+KBRANCH = "v6.18/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "6.17"
+LINUX_VERSION ?= "6.18"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


