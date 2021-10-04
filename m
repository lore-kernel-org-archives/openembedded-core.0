Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADD3C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 12:58:35 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.8906.1633352299801092305
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 05:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hVf8z/Ya;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id u18so30650029wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 05:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xy959lbSRIke5HP8MXFT2H+UnVA77vd+Kx437uv+q/A=;
        b=hVf8z/Yaf8Nuj4v14L1ZB9rJW1XtSXjSj2K73nrFXmy9VKSq2N+I70ys/o9XTcdqQs
         Q20IVU0cWhZ7el/PPI+WhTh7hclG3t4t+clBCCg/J8Y5OoWfkuECo24Hmjs/9iIFtt2N
         0luthJPFVOg6E0O7WR6uWLqbpk1eEd6ntIhoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xy959lbSRIke5HP8MXFT2H+UnVA77vd+Kx437uv+q/A=;
        b=BbV98DjFaLEFDas5ahdHCkI1iLEaP2R+xatQJRA2QE36Y3ho8rPDFWUpDk2yiXP6By
         0pohCsUDGgPQPll0rEq1MEhPFttwBHtXhWcR6YEgiNcZIWlBGW/5wT+hRc21eTHwZLbV
         ipy72cYOdMHYeSeMZkjfxZ33NvNk4q+CbrMbhvFjoYs1D7J3MsAxaqUxBsBgwiX6xmTQ
         tqjcr7ObT6OhRwrUOMx739P05qnyWQi8aBcfWm8owbsXNtPKyA0GHzn9P8AEJv+rMGAN
         hNBTgLcBjF2EoXycFI9N2Grmy6xtyeP+PTsFtYp7ll6yzYDgD3/JFgyItbJOQXi9RAKo
         HXkA==
X-Gm-Message-State: AOAM530/h5JrVDlzlVccA5JKEVMt40fanigpOxInn9RCSd+V5HRt+1P9
	DnzdnIivwf54cJwfhcKE5u9f7Es6XTR85lGS
X-Google-Smtp-Source: 
 ABdhPJyKIBvRe4YmBWk8a7b9iNpVHrg//YeJXXeVNM1JbWwwAo0s6B45P8FLWtE3EYyctOpy6/Pxpg==
X-Received: by 2002:a5d:6c6e:: with SMTP id
 r14mr14224347wrz.264.1633352298291;
        Mon, 04 Oct 2021 05:58:18 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:dd7:3f6:3509:4eb9])
        by smtp.gmail.com with ESMTPSA id
 h18sm14091712wrs.75.2021.10.04.05.58.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 05:58:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3 v2] abi_version/sstate: Bump HASH_VERSION and
 SSTATE_VERSION
Date: Mon,  4 Oct 2021 13:58:16 +0100
Message-Id: <20211004125817.2323818-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211004125817.2323818-1-richard.purdie@linuxfoundation.org>
References: <20211004125817.2323818-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 12:58:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156584

At this point the hash equivalence and sstate is 'junk' on the autobuilder
unforuntately due to the volume of fixes and also the volume of slighly
not quite right patches tested during the development of the fixes.

In order to try and help any remaining sanity I might have, bump the
version numbers to start with a clean slate so we're working from a known
good baseline rather than risk chasing phantom issues. For those
upgrading, there wouldn't be much reuse anyway after the changes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass                          | 2 +-
 meta/conf/abi_version.conf                           | 2 +-
 meta/recipes-devtools/elfutils/elfutils_0.185.bb     | 1 -
 meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb | 1 -
 4 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 89e9f561787..7f4b1f6804c 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1,4 +1,4 @@
-SSTATE_VERSION = "3"
+SSTATE_VERSION = "5"
 
 SSTATE_MANIFESTS ?= "${TMPDIR}/sstate-control"
 SSTATE_MANFILEPREFIX = "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-${PN}"
diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index 35faef9a368..e84cad1019a 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -12,4 +12,4 @@ OELAYOUT_ABI = "14"
 # a reset of the equivalence, for example when reproducibility issues break the
 # existing match data. Distros can also append to this value for the same effect.
 #
-HASHEQUIV_HASH_VERSION  = "5"
+HASHEQUIV_HASH_VERSION  = "8"
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.185.bb b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
index 9ea4de8e407..f4769e36328 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.185.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
@@ -34,7 +34,6 @@ SRC_URI[sha256sum] = "dc8d3e74ab209465e7f568e1b3bb9a5a142f8656e2b57d10049a73da2a
 
 # remove at next version upgrade or when output changes
 PR = "r1"
-HASHEQUIV_HASH_VERSION .= ".2"
 
 inherit autotools gettext ptest pkgconfig
 
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index 0dd18d7a068..62aa1b0e877 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -28,7 +28,6 @@ SRC_URI[sha256sum] = "4441a5d593f85bb6e8d578cf6653fb4ec30f9e8f4a2315a3d8f2d0a8b3
 
 # remove at next version upgrade or when output changes
 PR = "r1"
-HASHEQUIV_HASH_VERSION .= ".1"
 
 RECIPE_NO_UPDATE_REASON = "6.04-pre3 is broken"
 UPSTREAM_CHECK_URI = "https://www.zytor.com/pub/syslinux/"
-- 
2.32.0


