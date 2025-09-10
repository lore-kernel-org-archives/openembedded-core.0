Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C15CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 19:39:54 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.28302.1757533186221132707
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 12:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bbw9tZss;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4b61161c32eso28511cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 12:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757533185; x=1758137985; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DgHTjS5yrNpFxJm7WFpy2/jTrfJBppUO9AiNy1ouMMk=;
        b=Bbw9tZsscrNaOewUIJyUq8x7p7mPdmYILE3XoRm2bPPArGMVr7uDglTCX4bhddUa4R
         7D6cBZ6fPOZL8xSwhY3x1m0COEVCZARCrYS3FfOjd9pqOiB6t/njVwGzR5tiAYsDkONX
         vhDcvfCzTFx8tmlGOhd9nKY6m97dkuM96v9nXRRNv+ljgWmQQEqLbrFzwW3gEIj32uzB
         k+myg3bd7x282I3pTOGjOrdewYh21IlCz33wbgSiwjcDUGMPrV1Wqt+B4aaSBpQNZMbF
         hj5vn3x5nrPQcHUm+034Bw3A0TBAS0Rda0ViV7i6rxplVQftfWIhDRQn4LsMQZfJIE8r
         pT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757533185; x=1758137985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DgHTjS5yrNpFxJm7WFpy2/jTrfJBppUO9AiNy1ouMMk=;
        b=Sz9ghVfZQ/ih7kFkaeqJTEgc7Koohx8/wD0FyzMD7rjj/oSELGGOSF3i/mxtbUqXXu
         QSRjQjWzQAL+KsmbpUhwj5D2VaX8pQRxUCjpdZv1KuFCaPWVD3Vt4ZUeNlMyVdgMh+d/
         LoNHXjvwegc0/6BtfHVHeJHaqYZ9TUeg7I824EL9ixd5cgEErnq32w5of7I4X8JhwAj2
         uCM3ASBxF+kWfpPyoU2rp9XHtRVA9e+diOHnnCijjrxZYmpWVyJNUfQJTuhlXz8ujF7b
         4VaqXAlXtiuhmLbB6ewtQ5Thvjq+Y/ZkxD6DEw8ZkQuN4z4yXAbI9y2Cma48CYCohKOy
         2I0Q==
X-Gm-Message-State: AOJu0Yz4WwqggdYo7pN/elIgx0nufZS0XIaHUFkXjbM9dwwWaZnk5qqG
	2EfFdtXuSUK1SwZufkCOSD5joZjIXc/oQU+iJ9s1nxTKUpJFvu/GlEem
X-Gm-Gg: ASbGncuBvHG1c4HNu5KOeiesy2i2W3eLhnjPOWM7veHkq3+1KA9nBCdeDJIhM5uOPq+
	9c8AD2SinAYHHXV301MGhBXpIdwJhgpIsS5bh/12gXaVEGxq54Eht6LClN8wP/k1erbOdA2nnC9
	Q+J+EpkOqLhzYSv09pfSsojnXIvnd8mH2SbupVQDYc+0qPik37NQbgZCc/lZCoH9k/q4xIZEtxS
	5apnDBc2s8ad3sY57YfqGVR9JP6getWiWgMO9thaFSSSDcHMlDVAnYHTSIAZTEQ5UZQgoWRVebi
	hA0u0rj0rqvt8jt9K3UFcZwKs35n7sS9eloG7OeXocy+/ZFk61VzCORU/UlWwxoktswxcOToe/p
	z7mtquS2jZLl+zRe1il1u6rbWD9PrC87uumLQWAGib3cexXmGhDzEUZQtJpxgnt65n+oBXmruxn
	q/7zRgwg8KJeFiVF/+bCuTOYdmuFROXjlAdQBRCQSuO3nnwPBJit0896pVgKqgYqYKiA==
X-Google-Smtp-Source: AGHT+IHrlc6c7+w4bCXM585gaxQhsjQZdTLtXFQH/9+X+4J6QjPKrLuZU4T17e4+NF/h7hiXgThVUg==
X-Received: by 2002:a05:6214:5085:b0:71b:dd1c:5b10 with SMTP id 6a1803df08f44-7393f986199mr181702076d6.47.1757533184954;
        Wed, 10 Sep 2025 12:39:44 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-762c70e074fsm924336d6.53.2025.09.10.12.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 12:39:44 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/6.16: cfg: fix audit warnings
Date: Wed, 10 Sep 2025 15:39:42 -0400
Message-Id: <20250910193942.4072450-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 19:39:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223233

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/4 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: guest: make DRM guest options arch specific
    Date: Wed, 10 Sep 2025 13:38:37 -0400

    We only need some of the extended DRM options if the guest is
    x86-64 or arm64, otherwise, we get configuration warnings as
    the options are not valid.

    Restrict the architectures and we get a clean configuration
    and can build packages like vboxguestdrivers.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/4 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: debug-sched: drop SCHED_DEBUG
    Date: Wed, 10 Sep 2025 14:51:19 -0400

    Yes, we could drop the entire fragment, but then users of it
    would get config errors unessarily. We keep it to ensure that
    CONFIG_PROC is around in small configurations.

    This is dropped due to:

    commit b52173065e0aad82a31863bb5f63ebe46f7eb657
    Author: Ingo Molnar <mingo@kernel.org>
    Date:   Mon Mar 17 11:42:56 2025 +0100

        sched/debug: Remove CONFIG_SCHED_DEBUG

        For more than a decade, CONFIG_SCHED_DEBUG=y has been enabled
        in all the major Linux distributions:

           /boot/config-6.11.0-19-generic:CONFIG_SCHED_DEBUG=y

        The reason is that while originally CONFIG_SCHED_DEBUG started
        out as a debugging feature, over the years (decades ...) it has
        grown various bits of statistics, instrumentation and
        control knobs that are useful for sysadmin and general software
        development purposes as well.

        But within the kernel we still pretend that there's a choice,
        and sometimes code that is seemingly 'debug only' creates overhead
        that should be optimized in reality.

        So make it all official and make CONFIG_SCHED_DEBUG unconditional.

        Now that all uses of CONFIG_SCHED_DEBUG are removed from
        the code by previous patches, remove the Kconfig option as well.

        Signed-off-by: Ingo Molnar <mingo@kernel.org>
        Tested-by: Shrikanth Hegde <sshegde@linux.ibm.com>
        Cc: Peter Zijlstra <peterz@infradead.org>
        Cc: Juri Lelli <juri.lelli@redhat.com>
        Cc: Vincent Guittot <vincent.guittot@linaro.org>
        Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
        Cc: Steven Rostedt <rostedt@goodmis.org>
        Cc: Ben Segall <bsegall@google.com>
        Cc: Mel Gorman <mgorman@suse.de>
        Cc: Valentin Schneider <vschneid@redhat.com>
        Cc: Linus Torvalds <torvalds@linux-foundation.org>
        Link: https://lore.kernel.org/r/20250317104257.3496611-6-mingo@kernel.org

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

3/4 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: x86: drop CONFIG_HIGHPTE
    Date: Wed, 10 Sep 2025 15:05:46 -0400

    commit 0081fdeccbf610499b79784998b1fd36783209dd
    Author: Arnd Bergmann <arnd@arndb.de>
    Date:   Wed Feb 26 22:37:11 2025 +0100

        x86/mm: Drop support for CONFIG_HIGHPTE

        With the maximum amount of RAM now 4GB, there is very little point
        to still have PTE pages in highmem. Drop this for simplification.

        The only other architecture supporting HIGHPTE is 32-bit arm, and
        once that feature is removed as well, the highpte logic can be
        dropped from common code as well.

        Signed-off-by: Arnd Bergmann <arnd@arndb.de>
        Signed-off-by: Ingo Molnar <mingo@kernel.org>
        Cc: Linus Torvalds <torvalds@linux-foundation.org>
        Link: https://lore.kernel.org/r/20250226213714.4040853-8-arnd@kernel.org

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

4/4 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: hostap: drop obselete LIB80211
    Date: Wed, 10 Sep 2025 15:19:37 -0400

    These options are no longer valid in 6.16+

    commit 02f220b5267042d0de649614eec84ded8aeecb4f
    Author: Johannes Berg <johannes.berg@intel.com>
    Date:   Mon Oct 7 20:26:55 2024 +0200

        wifi: ipw2x00/lib80211: move remaining lib80211 into libipw

        There's already much code in libipw that used to be shared
        with more drivers, but now with the prior cleanups, those old
        Intel ipw2x00 drivers are also the only ones using whatever is
        now left of lib80211. Move lib80211 entirely into libipw.

        Link: https://patch.msgid.link/20241007202707.915ef7b9e7c7.Ib9876d2fe3c90f11d6df458b16d0b7d4bf551a8d@changeid
        Signed-off-by: Johannes Berg <johannes.berg@intel.com>

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Richard,

Apply these on top of all my previous patches.

They fix the overly agressive DRM options I enabled and address some
of the warnings in other configurations that had slipped through.

There may still be some issues lurking, but this will definitely
improve things.

Bruce


 meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.16.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
index 7725bcf20b..b86748d7d5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "c631c6cf05de829937afe048e6ae2fea15634cc8"
-SRCREV_meta ?= "5b4b90bbad3ada455c7c124bf704c519c6013aa1"
+SRCREV_meta ?= "6cd9824a84b5fd5c8557208a787252e31a063436"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
index befced7a98..254e6727fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
-SRCREV_meta ?= "5b4b90bbad3ada455c7c124bf704c519c6013aa1"
+SRCREV_meta ?= "6cd9824a84b5fd5c8557208a787252e31a063436"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 2ea54a5301..a773d8a426 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
 SRCREV_machine:qemux86-64 ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
 SRCREV_machine:qemumips64 ?= "2459c29bf2c3d221fd6d3222c7200b368156986e"
 SRCREV_machine ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
-SRCREV_meta ?= "5b4b90bbad3ada455c7c124bf704c519c6013aa1"
+SRCREV_meta ?= "6cd9824a84b5fd5c8557208a787252e31a063436"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


