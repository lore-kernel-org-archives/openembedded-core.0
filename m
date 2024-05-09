Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961AFC25B78
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:06:00 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.8412.1715256352079448145
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:05:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=s74Bc7RR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6f4178aec15so745218b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715256351; x=1715861151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gRpQ2Q/p80ngRDhd0qDom9TxTXv7tNY0HCw/llF4xq8=;
        b=s74Bc7RRW7W6cDMg8KJ/WGl1IsGj5nOZK0/J5WgdGaN/HtGkDTeJzj7KMPjWFUZ8Dh
         qbTZRIJYs2eJzVQV5kvRC8DXmLhsq7VR6czs7ecI5d0iVJ3qCoKCfRWBPzYP4/umwgQv
         26ZCQMljjAaYCmcuJlVRBoIhHzq26SVPOoQtuxbYMh/kzPVne7A6rj5A7JxlZP1ErT+b
         4azovD7COeAsX3mAm5VJq8frvTKGKlYBt1gNzwrKdis5eMr19LRUxc0EiJ4FjOGuPRf6
         2KVePv2/dJR/tq+V+fFdrdn1oQ3yjzI8GVhQPjI5T8x46yQ1RPzvgBOT8Iqs/M0z0it9
         F9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256351; x=1715861151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gRpQ2Q/p80ngRDhd0qDom9TxTXv7tNY0HCw/llF4xq8=;
        b=k5Rk6FH889DFSu20unciUANokjWDkLpu7cJjjvBkoDdHNrsLzhhlmXU71WE/HSEncI
         0eu1OPZg3EysiTd2EYss7Du0aumLnMnQsPczOzAuVLh9yo6GoqgjvP1Ml8qjcVA5hzJ/
         6v4B/rqkiFyRnm/uPl3QvAr8mTze4Pm+z4iK7olJL0S4UFwue7aSqlyJzjSlevFpZpWx
         uMqW263liqpUNWpdT+Ij7B30PgbDb9cMftu91C7fkqQlfjmUl0j0h0axK7R2FJi1glKv
         lujV5nuA+ygkoWnzoYqdYrY2/IJgnsTF8y/c+C3TyPOLlt+egSvcVi398yzjQaqZ3HKy
         Gugw==
X-Gm-Message-State: AOJu0YyqlqHFZjvLW8UycjfkB6aFlvwC/XtIjfhZ61X9f2gg3ySN6ebo
	/NuEePTopNAzD11awY2hGJgT7mRWcgYoAuPlnOCZsICIGarxMF97+uU5qYmxJD5IEuJOmflnTQR
	y
X-Google-Smtp-Source: AGHT+IHjSQ3f9e4u4KcymaWnduf8ppFwjRNkOPRdXue8IbcdwjfAcGJ/lRmU+yMzcxUnu9O2u3rrtg==
X-Received: by 2002:a05:6a00:4f0f:b0:6ea:950f:7d29 with SMTP id d2e1a72fcca58-6f49c23e0d9mr5017706b3a.20.1715256351282;
        Thu, 09 May 2024 05:05:51 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c41sm1185613b3a.172.2024.05.09.05.05.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:05:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/23] linux-yocto/5.15: cfg: remove obselete CONFIG_NFSD_V3 option
Date: Thu,  9 May 2024 05:04:58 -0700
Message-Id: <dcbca1aedd9b41e78e00d6b763b2e99886be0780.1715256149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715256149.git.steve@sakoman.com>
References: <cover.1715256149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:06:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199167

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: nfsd: drop CONFIG_NFSD_V3
    Date: Tue, 2 Aug 2022 10:52:25 -0400

      commit 5f9a62ff7d2808c7b56c0ec90f3b7eae5872afe6
      Author: Chuck Lever <chuck.lever@oracle.com>
      Date:   Sun Feb 6 12:25:47 2022 -0500

        NFSD: Remove CONFIG_NFSD_V3

        Eventually support for NFSv2 in the Linux NFS server is to be
        deprecated and then removed.

        However, NFSv2 is the "always supported" version that is available
        as soon as CONFIG_NFSD is set.  Before NFSv2 support can be removed,
        we need to choose a different "always supported" version.

        This patch removes CONFIG_NFSD_V3 so that NFSv3 is always supported,
        as NFSv2 is today. When NFSv2 support is removed, NFSv3 will become
        the only "always supported" NFS version.

        The defconfigs still need to be updated to remove CONFIG_NFSD_V3=y.

        Signed-off-by: Chuck Lever <chuck.lever@oracle.com>

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 91bf0350d5..349aa9854d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "f8d4297d452f7c832d90bfb992d90db2e30ffc23"
-SRCREV_meta ?= "21fd5becb1ed083a28e57af46709578f83dd2910"
+SRCREV_meta ?= "7cdb56640a7854c921c292100445334745d5d534"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 722523ced9..054e17e871 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "7a8fce8cbd9a8a7d68a0c2537141c85d63f6eda3"
-SRCREV_meta ?= "21fd5becb1ed083a28e57af46709578f83dd2910"
+SRCREV_meta ?= "7cdb56640a7854c921c292100445334745d5d534"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 6784703ce2..c066797436 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -24,7 +24,7 @@ SRCREV_machine:qemux86 ?= "f0d16a142e32a7934da39a12bd983a00e629bb48"
 SRCREV_machine:qemux86-64 ?= "f0d16a142e32a7934da39a12bd983a00e629bb48"
 SRCREV_machine:qemumips64 ?= "d34e0789d8d5e0d7ab521889e80967edcac38dc6"
 SRCREV_machine ?= "f0d16a142e32a7934da39a12bd983a00e629bb48"
-SRCREV_meta ?= "21fd5becb1ed083a28e57af46709578f83dd2910"
+SRCREV_meta ?= "7cdb56640a7854c921c292100445334745d5d534"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


