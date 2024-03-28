Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188F1CD11DD
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 18:43:16 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.4422.1711651390145601089
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 11:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jm1FJ4B9;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-ddaebc9d6c9so1364813276.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 11:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711651389; x=1712256189; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lh31DbjMm5S7eu22SIwR21xIzN7T2EfVmB2Snoiaz/4=;
        b=jm1FJ4B9qcnV46RN7WjYk++f8naOqElw8Gl7+Jc4S2qx1jSoFZS+eiTiM+Jk9c686A
         36PjWxXeus75V+gYMgRlwJ8Rb0u+nwrcI4vcffKmYPrGYQhYuYOzER91uzHqkxs7Is79
         +9hLVvbtRCMVg59AzUNgz4qknImyvi0IVj/6XnFbg42kX+ofUVfm1+uS7sNr41OtYeAy
         +sooWLazecNrVq9xlHwyX7dbHpgr4ZzGIW+b9wbN0U+7uTK0TzVkW7A+nu+cXjYAEBAm
         xNznb61aUlcTmysGThyd+Us5ZWhIfr1ID1kPMdh+Z/qTYpfKinjy2bXsJDI7ICYONghy
         lStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711651389; x=1712256189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lh31DbjMm5S7eu22SIwR21xIzN7T2EfVmB2Snoiaz/4=;
        b=ZDuJjg8fcMYPUYlcplZrX+klTAJCPqDR+1RtXLrWAHYOZ5uZQBiz47FI4COqDDAK6I
         +w5y2i8AG5emcs/yinkjpVs2ksq5dvnPlD2qQ+rrXqzG5b3irB+5H0rH69ZzNaU1jqhD
         Hht143tVmPRFGLoS7i8tbLdvLFOtF826tlPO8rmMHZzx40+NejmIxXHhgCLff/1424+4
         IEVnk9FEOtsOCu/rdsVrxWjn+dw2F/cNMO02HgZgmMsRrzKxmSWI7zOWH+zZWZG9SowB
         jNtx/EZ6dMZav6KJcGgr1hXPFWSLvzvvGwWo+yb5JJyFXuUfjJg8J+X/94LBQvUmg4HN
         GprA==
X-Gm-Message-State: AOJu0Yzc3W5sbu5JePOFnIbGuquvu9Rd5kwxr5HAtoTnpfk+pa1CyGFh
	CuVn+wmImyhDVVhwWWel1bGq+weBwXb7PMtg0ZCz4f0cFZDmWuLk92LNfocieihHAw==
X-Google-Smtp-Source: AGHT+IFfB4WJRniS+LHSo0P24kWxQBfDjGiuHoN5yIKkdDkhAdI2SbAZKAzU3ZR5l7Iq2E6f25c0iA==
X-Received: by 2002:a25:c141:0:b0:dd1:7532:c0f3 with SMTP id r62-20020a25c141000000b00dd17532c0f3mr215112ybf.16.1711651389151;
        Thu, 28 Mar 2024 11:43:09 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id oo14-20020a056214450e00b00690c9256676sm874425qvb.49.2024.03.28.11.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 11:43:08 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/6.6: nftables: ptest and cleanup tweaks
Date: Thu, 28 Mar 2024 14:43:02 -0400
Message-Id: <8f637003dd84c4ca42b627592688a95bd3a5fe2c.1711651290.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1711651290.git.bruce.ashfield@gmail.com>
References: <cover.1711651290.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 18:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197604

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/2 [
    Author: William Lyu
    Email: William.Lyu@windriver.com
    Subject: features/nf_tables: nft_objref is now builtin
    Date: Wed, 27 Mar 2024 08:52:14 -0700

    Starting from kernel v6.2 (including all rc versions),
    CONFIG_NFT_OBJREF has become builtin and cannot be disabled [1]. So,
    this configure option is removed from nf_tables.cfg.

    References
    [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d037abc2414b4539401e0e6aa278bedc4628ad69

    Signed-off-by: William Lyu <William.Lyu@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/2 [
    Author: William Lyu
    Email: William.Lyu@windriver.com
    Subject: features/nf_tables: Add net_fib_* options for greater ptest coverage
    Date: Wed, 27 Mar 2024 08:52:15 -0700

    Several nftables ptest testcases failed due to missing features. The
    following kernel configuration options are added as part of the missing
    features:

    -   NFT_FIB_INET (tristate "Netfilter nf_tables fib inet support")
        This option allows using the FIB expression from the inet table.
        The lookup will be delegated to the IPv4 or IPv6 FIB depending
        on the protocol of the packet.

    -   NFT_FIB_IPV4 (tristate "nf_tables fib / ip route lookup support")
        This module enables IPv4 FIB lookups, e.g. for reverse path filtering.
        It also allows query of the FIB for the route type, e.g. local, unicast,
        multicast or blackhole.

    -   NFT_FIB_IPV6 (tristate "nf_tables fib / ipv6 route lookup support")
        This module enables IPv6 FIB lookups, e.g. for reverse path filtering.
        It also allows query of the FIB for the route type, e.g. local, unicast,
        multicast or blackhole.

    Adding those three kernel configuration options above pass the following
    ptest testcases:

    -   tests/shell/testcases/parsing/large_rule_pipe
        Previously failed due to using rule:
            meta nfproto ipv6 fib saddr . iif oif missing drop
    -   tests/shell/testcases/nft-f/sample-ruleset
        Previously failed due to using rules:
            fib saddr . iif oif eq 0 counter drop
            fib daddr type { broadcast, multicast, anycast } counter drop
            fib daddr type { broadcast, multicast, anycast } counter drop
            fib daddr type { broadcast, multicast, anycast } counter drop
    -   tests/shell/testcases/optimizations/ruleset
        Previously failed due to using rule:
            fib daddr type broadcast  drop

    Signed-off-by: William Lyu <William.Lyu@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index e2e3c01285..50dff1c3ff 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "1c3234ba160c59eb50739f23591a87daf09fac35"
-SRCREV_meta ?= "8daefb4bf68e9cbbecdb833dc3fc536f08f5d46a"
+SRCREV_meta ?= "70cabea69443e974db04d6dcbe73031d0d726bc1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index f076aa45c7..d2304b1b49 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
-SRCREV_meta ?= "8daefb4bf68e9cbbecdb833dc3fc536f08f5d46a"
+SRCREV_meta ?= "70cabea69443e974db04d6dcbe73031d0d726bc1"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index a0218eb876..764ea67cf1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
 SRCREV_machine:qemux86-64 ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
 SRCREV_machine:qemumips64 ?= "6cb075269e42d03857c95ebc8b5f8e154f155add"
 SRCREV_machine ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
-SRCREV_meta ?= "8daefb4bf68e9cbbecdb833dc3fc536f08f5d46a"
+SRCREV_meta ?= "70cabea69443e974db04d6dcbe73031d0d726bc1"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


