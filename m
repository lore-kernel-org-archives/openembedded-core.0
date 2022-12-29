Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A7C2C4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 07:13:20 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.200907.1672297994564832435
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 23:13:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lX3VetH9;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d3so18156104plr.10
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 23:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i+UifP2/plBXWqjWXsscYjijISuDjtMxWhbkgkv2yG8=;
        b=lX3VetH9GnhZkxzYvUaqtByrUM9elpCVx32tSNs/EeYqqV2s4O8gLIoy5BFYPq29p5
         1z63p+3+NOYPvt+gDehBiO3g8JloIIgOQKDi5QoYY11YfIc8sMzjqfg4c2b2k8AAyqh0
         NOLHhswGUG4VhEpCHSAn/Sq2QoOW11JcyW5pEnzMCqZB3j7TZmX8bxdNXStp595JErxU
         IYsQQQkIlezMEpf3FHUroE8wpNS3C8EmfhPu6pGuyPYoF4yO8BmRhjUqHtH24y9V2U5U
         MhM1TfteXZ1DCgjj4lkDHW2zc6Pg6ZHMlwKoByLfwuFCIlQkL067zQn9u61xN0CmaSPK
         STQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+UifP2/plBXWqjWXsscYjijISuDjtMxWhbkgkv2yG8=;
        b=VYcFoF53JGKI9HCBf474WaAOQlyceAUxoBMQRolpm6IzoZSpcW/Irg1GkG30gkbPIe
         OMWorrKweW5n+Ff9gL8yoibJDfJNPPR1anDIYJvAuX2cVGuBrNh4PS8C4VTDz4jIny0R
         NEM4Xrpm09lVidTMP+JRS+F1JW1v8Tr63XvQ+vKCUHllDc1VrvQO6FE34XrG9yDHnsjh
         5RDaMqk9GwHVUM0fLEpT+IktP9DYLqHNkGqsvwCz62Ez17Z4aoL5HJezMZQnJi6WKDAG
         5TX6Z2BjIDUh4iu1Pd8OZWWn9l2y0jyb2j8tXdjHhEI0na0NY7oY4OmxGOXL0+a4bjEr
         HBDA==
X-Gm-Message-State: AFqh2kpBRTj5sbKhZwitWcXDN5GI1bPaWNgD63i3s/v2sChCfOxBUpeS
	kTohMY16TUry7AksgYXjq4m8o3c5hMs=
X-Google-Smtp-Source: AMrXdXssyyqebZ4x8wTNZNanj6r0c8Rmt5NjwAKgKJ5XhbPSSQRNgwG62aqPp+qP0LlN/UNu//GRWg==
X-Received: by 2002:a17:902:8ec7:b0:192:52d6:7fc7 with SMTP id x7-20020a1709028ec700b0019252d67fc7mr26524970plo.63.1672297993761;
        Wed, 28 Dec 2022 23:13:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id p8-20020a1709027ec800b001929f0b4582sm932045plb.300.2022.12.28.23.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 23:13:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to latest on tip of trunk
Date: Wed, 28 Dec 2022 23:13:10 -0800
Message-Id: <20221229071310.4111511-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 07:13:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175094

Brings following changes

* f47a8cdd ldso: fix invalid early references to extern-linkage libc.page_size
* 377218cb pthread_atfork: fix return value on malloc failure
* 29e43191 fix double-processing of DT_RELR relocations in ldso relocating itself
* b50eb8c3 fix strverscmp comparison of digit sequence with non-digits
* ad5dcd39 fix async thread cancellation stack alignment
* 8f925945 fix return value of gethostby{name[2],addr} with no result but no error
* 63402be2 clean up dns_parse_callback
* 0a7b4323 dns response handling: don't treat too many addresses as an error
* 41603c77 dns response handling: ignore presence of wrong-type RRs
* cf76df0e fix missing synchronization of pthread TSD keys with MT-fork
* 5ff3eea9 fgets: avoid arithmetic overflow when n==INT_MIN is passed
* d8f35e29 fix AS-safety of close when aio is in use and fd map is expanded
* 26c76a90 fix use of uninitialized dummy_fut in aio_suspend
* aebd6a36 fix potential deadlock between multithreaded fork and aio
* d64148a8 fix potential unsynchronized access to killlock state at thread exit
* 36b72cd6 fix potential deadlock in dlerror buffer handling at thread exit
* 833a4691 configure: disable TBAA optimization because most compilers are buggy
* e6e82132 disable MADV_FREE usage in mallocng
* 25e6fee2 remove LFS64 programming interfaces (macro-only) from _GNU_SOURCE
* 246f1c81 remove LFS64 symbol aliases; replace with dynamic linker remapping
* dec8f0a4 dns query core: detect udp truncation at recv time
* 8c408937 getaddrinfo dns lookup: use larger answer buffer to handle long CNAMEs
* 759bf785 arpa/nameser.h: update RR types list
* 51d4669f dns: implement tcp fallback in __res_msend query core
* e2e95176 res_send: use a temp buffer if caller's buffer is under 512 bytes
* c87d75f2 adapt res_msend DNS query core for working with multiple sockets
* 85050ac5 getaddrinfo: add EAI_NODATA error code to distinguish NODATA vs NxDomain

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index a72d87ea6f..7749495ec6 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "dc9285ad1dc19349c407072cc48ba70dab86de45"
+SRCREV = "f47a8cdd250d9163fcfb39bf4e9d813957c0b187"
 
 BASEVER = "1.2.3"
 
-- 
2.39.0


