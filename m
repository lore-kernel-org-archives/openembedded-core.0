Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF156C433FE
	for <webhook@archiver.kernel.org>; Sat,  2 Oct 2021 22:18:09 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.16203.1633213088161506462
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Oct 2021 15:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=axwtpKXM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id o20so3847092wro.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Oct 2021 15:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vEzpKBs0xlElXwgyyBE8BmEG1zEEfrn3fTuhM5Micj0=;
        b=axwtpKXM0t8GHWnLk0IccqJQFV5vRVPHbymnA28/bPuBasp3LzvreWGmRDcvFICriq
         HMFdU/KMAyKH/ZzEIDkjv3Ry7C5tY3MvpNlfx5H80fHfawmEyIrMUS0VQSDBn0tAmKlN
         Zlq6ThmENkLa17adfD1wvm5F+1jyFBpeyOALM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vEzpKBs0xlElXwgyyBE8BmEG1zEEfrn3fTuhM5Micj0=;
        b=EGjXscwdmG11ZLpuPOMr5HJ8YWHmjhM/kPZFVwnGa0mYi9207TSWAsczvf06iQNt4i
         L57EvVoDPYvpLp3pdAJrJwp/qqK0FPXY/0JrWmBxgCiGVm1/0GgUKnEoenEEFejCzhtb
         bVwSBQUvxfRDW03JkIhyCC9+cLMU3xmntCwbaYKihPA3+sNA/VpZX/mxcZtDwQKCFKUI
         DiRue38MITitRKXXKhpt4Fbh8MeASmYd87PSIMHqPXkM5W5n3F4bZtGti1eNNLuCarzO
         qAF4iAibG0yj5jBwQXqnwa7Mo27U1vgPL/UoAeoqS0l7TgovYbzBH/OL14lwagTrBGrm
         ZHIg==
X-Gm-Message-State: AOAM530OtymhzmCER7vWy8JG4Htjep/mmR0yL8qw26p0S26dz2RbSn4v
	u4dvOcy2FoQV7soZoX4aUasy3bYJgVF+Qv/J
X-Google-Smtp-Source: 
 ABdhPJyqCp2wTnhlhyLzmmzSXaH/8qzYyz45UunAy1UcocEJZ1mRhCZrW09nAmtt1Enouzw6IzDIkQ==
X-Received: by 2002:adf:f187:: with SMTP id h7mr5296769wro.358.1633213086657;
        Sat, 02 Oct 2021 15:18:06 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8657:7fac:b2bf:59a6])
        by smtp.gmail.com with ESMTPSA id
 z8sm11172777wrm.63.2021.10.02.15.18.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 15:18:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] abi_version/sstate: Bump HASH_VERSION and SSTATE_VERSION
Date: Sat,  2 Oct 2021 23:18:02 +0100
Message-Id: <20211002221803.2283254-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211002221803.2283254-1-richard.purdie@linuxfoundation.org>
References: <20211002221803.2283254-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Oct 2021 22:18:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156542

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
index 89e9f561787..06a722c735d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1,4 +1,4 @@
-SSTATE_VERSION = "3"
+SSTATE_VERSION = "4"
 
 SSTATE_MANIFESTS ?= "${TMPDIR}/sstate-control"
 SSTATE_MANFILEPREFIX = "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-${PN}"
diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index 35faef9a368..515a6def405 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -12,4 +12,4 @@ OELAYOUT_ABI = "14"
 # a reset of the equivalence, for example when reproducibility issues break the
 # existing match data. Distros can also append to this value for the same effect.
 #
-HASHEQUIV_HASH_VERSION  = "5"
+HASHEQUIV_HASH_VERSION  = "7"
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


