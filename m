Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5328FC3A59F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:28:12 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.2839.1702391291914962245
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:28:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DPRZP8NU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6cef51f7899so1115312b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391291; x=1702996091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5FYBhfx1l2w0Twz7aujhBgwDJXslV3lzqMwaRbBH+A=;
        b=DPRZP8NU6SBTmi5oW7kZk7io64GPzhWpPdxg8VjbfvXuoCdd1dBIl+xG+0imvoiPVs
         LjziAzhCW7Hd7axPTmPjIi5Z3x1OPtgEHrVLhRrIiF7REilTjzVreyQWTSr2QtHMBv/c
         pl4gwV4KqiNjtrUYk7wth+7VUUCqevGNXoxGo1LGh+Lwoc+klBAk6v7eM8nNCe+jB5FI
         FHmMBIWRKFCRvlgKsQrDvv0fd3RQbGVugwcATgQ7X3l6plL0xp1mXSYUjxBlSL7o2V8w
         8AM0Sw2M6pHdmRtBMPnav/pvYNMrRqoFE+5laW/Xw/4Ta1Q7yJ3oGw/Ii2Ajy7cqg+ar
         7H2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391291; x=1702996091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r5FYBhfx1l2w0Twz7aujhBgwDJXslV3lzqMwaRbBH+A=;
        b=RUqO81Zcm40vt1V26VNLdS2qpbvQ1ZuD907rWkthTS5k/s4QnWjiQFapfTVbIx/tuu
         5TsvbQJbWHMchKuscjIjPvfxRmS8bctQeNHayMDINUxdTIi8lYX2Wo5Fx65EJ3oULeca
         GoGbPJmflMH6btcuTpIRA51obJqYiMa0zBsjgKGSzdY6eZueCR9IqjXcArF2Hp7XiVZc
         lI7Va7LFA0GVED6XTnK1tlnlcPKqmOQOrebVnXU3aBYSq87yeqsrTd3pKu1h5cyNwJm5
         1RHYI3sw3YYd6tWmnSvqaUWZ5KkmgKH6ZnbklJjyQVouho4Y21Ntim/35C5LUvY8OxZc
         Et8w==
X-Gm-Message-State: AOJu0YwQ4F0c9EAoCyUS1bZvtj+YgZAFarlgy+1vc3kcSDJ5992al0hi
	ndSblVPlj2xShSWAw6oF+EJbbq3EmJwy78uWySw=
X-Google-Smtp-Source: AGHT+IE2fEl//Zh5yn0N4YWqgEC0IND2RbFKX8KshbsPGWdbeI6Z30+5YxBgVJ366ErhZEHK9Bvg0g==
X-Received: by 2002:a05:6a20:8b03:b0:18f:97c:5ba0 with SMTP id l3-20020a056a208b0300b0018f097c5ba0mr2294809pzh.110.1702391291050;
        Tue, 12 Dec 2023 06:28:11 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.28.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:28:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 15/29] linux-yocto/6.1: cfg: restore CONFIG_DEVMEM
Date: Tue, 12 Dec 2023 04:27:21 -1000
Message-Id: <5567b76143d5b6c49c97aa90e518a3c1129b2b5f.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192219

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: C. Andy Martin
    Email: cam@myfastmail.com
    Subject: security.cfg: restore strict-only /dev/mem access
    Date: Fri, 27 Oct 2023 11:22:06 -0400

    CONFIG_DEVMEM was mistakenly not enabled, which defeats
    CONFIG_STRICT_DEVMEM and friends, as it completely removes all
    /dev/mem support.

    Signed-off-by: C. Andy Martin <cam@myfastmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dfc0cc113eabb1160b6bfd630fa75c6a3cb9c7a5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 6ebf533bb0..408fac718e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "0dad5306907b9e6fb89103dfba80dbd0edafcdb6"
-SRCREV_meta ?= "0553e01ca003e82d32d9b85c0275568e8ce67274"
+SRCREV_meta ?= "3ec1b83af3b59f07cf04e1264fbd30fe2f2f873b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index af98525c4f..9bf6001353 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
-SRCREV_meta ?= "0553e01ca003e82d32d9b85c0275568e8ce67274"
+SRCREV_meta ?= "3ec1b83af3b59f07cf04e1264fbd30fe2f2f873b"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 9f17f244f8..f497ccedd9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
 SRCREV_machine:qemux86-64 ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
 SRCREV_machine:qemumips64 ?= "9f25eb5709ab8af0ece7306014d5e8b7c6150c68"
 SRCREV_machine ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
-SRCREV_meta ?= "0553e01ca003e82d32d9b85c0275568e8ce67274"
+SRCREV_meta ?= "3ec1b83af3b59f07cf04e1264fbd30fe2f2f873b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


