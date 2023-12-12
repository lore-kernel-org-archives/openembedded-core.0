Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3C5C4167D
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:28:22 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.2934.1702391299447692038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sBQGumxF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6ce72faf1e8so3431411b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391298; x=1702996098; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mgJrcqpsTwMV424V+JFoCDg70NKC8aad94VnxnusWNw=;
        b=sBQGumxFoj9ICYGIBKjgNo+OXbMaQ222dwj6O169hcWLWLzMR5iexoOJXUkRPzhHLv
         xpxCpQ08iRtPhgCPJZgVaZZH0EIZfvr4uZKiDeAJ25d+7Lgn7/iaxXO5S6Dut/FoRvyZ
         y9WDe0uC91FEZ7kHHrwURE2XfsONOOarqp7b0IWEPZWGHs237DaUiZx43/FznjICZfns
         F9i8oN3SQ868MNL59U5EbwtpKtMZY6Plf9efcMPR9DFHez3u+Tqi+FYlhYyOC1FiWEf+
         WpKXIr86l0DklJRDGIe8XnTPiFPXSMlmoRiZC5CV2P0l132hfqRLnB0aQ4v24Dddl6im
         nFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391298; x=1702996098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mgJrcqpsTwMV424V+JFoCDg70NKC8aad94VnxnusWNw=;
        b=NNkmMpaAzXWRHkukbzw4HRzAwpBUbFl2ex0105nURPZkRl74QhlJKMNE9kHOK20FOv
         eSZFUosVVGp76tcFmb0X3W3gHeTrBQPZDCtuCGRXdN+elu+n2K3Gzpoe9+yKNekUfSzd
         o4bWG7zed/8gOvU8mI2EC3jlR6sLuCIkr58S3NUNMzZY4XrF645X/H7bUirpIFacebSi
         GrVJEfqlNg2TUKW5u/lD2PR+vPCpf5f+N7WMkUILv6tp+idtZxB8A5Jz/21T36xEcA4/
         RSAvZlfYUfAV0M7/UJLf+lfR0Io5tre3yY/HBtQuDADOVArCxf3lDNQgni74Jgt6KRt1
         Rcbg==
X-Gm-Message-State: AOJu0YwMCiB8O93h8ZBuQ2trHhxyBEaRqwzpwdYk4YgwMCG+HTDi19Qz
	zJQEq5Vaq/EV6h0AdMIM7oOTQLfjlTAnQewwYz0=
X-Google-Smtp-Source: AGHT+IGF3hhbh2F2eywoZGmQH6UWWfhPNCYDXc5ztQ5Cq8ejUs2pCsl3cOsVY2yCUvGEIX3qBrg7PQ==
X-Received: by 2002:a05:6a20:3ca6:b0:18a:b5c3:55c1 with SMTP id b38-20020a056a203ca600b0018ab5c355c1mr3670199pzj.57.1702391298610;
        Tue, 12 Dec 2023 06:28:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.28.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:28:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 19/29] linux-yocto/6.5: cfg: restore CONFIG_DEVMEM
Date: Tue, 12 Dec 2023 04:27:25 -1000
Message-Id: <98d448d05a3f4166569159756f8bfaac4ce358ab.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192223

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
(cherry picked from commit c459be32000d703aad179a4bf5ef2479813f0404)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.5.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
index b34351529d..552df49949 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "a19b0be3292c96a0cc9c0ebb8f9d104d6a4d3e10"
-SRCREV_meta ?= "6e1f2cc45e8c78278fea51b7cfd0bf1180e5605a"
+SRCREV_meta ?= "fa8ffc924f6d91ea09c9f792a5bb8a184ec1657a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
index abf548b2c8..194c5c10f2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "4e79d57b9c5cc230d2d8cb40c393515fedfed134"
-SRCREV_meta ?= "6e1f2cc45e8c78278fea51b7cfd0bf1180e5605a"
+SRCREV_meta ?= "fa8ffc924f6d91ea09c9f792a5bb8a184ec1657a"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.5.bb b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
index 120a3afe25..bec4b7c049 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "11bbc8db249543905b6fe9b660575202fa0e3ed0"
 SRCREV_machine:qemux86-64 ?= "11bbc8db249543905b6fe9b660575202fa0e3ed0"
 SRCREV_machine:qemumips64 ?= "3b119ebc63b9889194b0125bfae96ee5830e538c"
 SRCREV_machine ?= "11bbc8db249543905b6fe9b660575202fa0e3ed0"
-SRCREV_meta ?= "6e1f2cc45e8c78278fea51b7cfd0bf1180e5605a"
+SRCREV_meta ?= "fa8ffc924f6d91ea09c9f792a5bb8a184ec1657a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


