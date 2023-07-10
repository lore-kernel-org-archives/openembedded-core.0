Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70632C001DE
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 03:20:37 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.32104.1688959229894610404
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jul 2023 20:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dJK65aiM;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7659924cd9bso456828285a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jul 2023 20:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688959229; x=1691551229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9egHGe7BdQzn4ScUo/bmT0YB8XbMIAM5GwtzGT7wzno=;
        b=dJK65aiMWkNxOcHqTqQGpjvx1N1TZTbMUwiPWxqoXFPj6Q7j/P29b8+UimW1mS6oin
         EadbfcjQExbdbmu37ojx5PU3wlAQg96Km82ZwjPysHRVJA1LzZ3jpimg8/S6EzNl4XXT
         1Fi9e4rpZi9U3loTZmU4oL4+mc9UiGzDeh52k3hZe8bvysngAD/pqAgILw0BwarxY6Zs
         hk41AYxwgKvzR4uwWfx+FSUMsV+v21YDzDGm7RQZlmYRP2JY2jbwUlPPzRCvUfBkF2Zq
         bA6PWmbJPr/BTQ7IzAln6LJdoTzZzX/gejL9j1zm9vZ5COLhBaDb/6VmTRoxGgYeNvLY
         Sy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688959229; x=1691551229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9egHGe7BdQzn4ScUo/bmT0YB8XbMIAM5GwtzGT7wzno=;
        b=esVALsrrvZXyxVySa8MvsRZr4TNId7RZm4QZPJoWez2OEf32hcLShuuq0BwlBDH8xz
         qy0g6xpArDRyLd4y4saOJWOy/xWX7zSu1jGlpyGZTny6WouD/IWqAnY1ch3P8LT2r669
         JQWxu8TEUDaOWN7criEBp1CGhlADte4HOywEtm6SZSPrOZH1yueVh3u6Oy6+2yNZzmo2
         nsjdxZVOt+5qUkG5lQX+6D6nkK8kovMniA32yUNY3/OVkw0/JBJ1NfXeiq3TS3J84sFP
         ifn0apR1fnsNWThU6xoyU7/iE0sfzGIw92i8y+8y/1F393rwA9CRItb5Ja5aRBVSruAO
         df0g==
X-Gm-Message-State: ABy/qLZNZ1Jn64ky/v//Zsn9vBxi5Y7ddwFPjzjqQ0g2SwU7Dz+2r3BS
	qK7JpjJBBC/AHCh3ynHMe99ZqpSnUGo=
X-Google-Smtp-Source: APBJJlEBAkX9HKvUmdK0kZM4CREr5TkxNGhYwjtpNIgQKK+Wzs5w7Z1R4I3bCJWfyT130tx7iLKRLA==
X-Received: by 2002:a05:620a:3195:b0:765:ac6f:df84 with SMTP id bi21-20020a05620a319500b00765ac6fdf84mr13022162qkb.4.1688959228742;
        Sun, 09 Jul 2023 20:20:28 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d15-20020a0cf0cf000000b00630228acc45sm5039863qvl.145.2023.07.09.20.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 20:20:28 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/15] kernel: consolidated pull request
Date: Sun,  9 Jul 2023 23:20:11 -0400
Message-Id: <cover.1688958788.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 03:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184042

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the latest queued kernel changes. There are the expectd -stable updates
6.1, but those of course aren't the most interesting part of this queue.

We have the 6.4 reference kernel initial integration.

I've tested this on all architectures, core-image-sato + core-image-kernel-dev
as well as -rt, standard and -tiny kernels.

We also have the matching libc-headers bumps. I've already send patches
for some applications that had issues with the 6.4 headers, but the issues
were relatively minimal.

I've included the poky and oe-core preferred version bumps in this
series, just to make it a bit easier to test. They can be ignored if there
are issues, and we can just make the 6.4 kernel available in tree, and
fix the remaining issues before making it default.

I ran into perf and localversion issues (which broke the on-target
module builds). The patches to address them are in the series.

qemumips64 is seting a smp preemptible trace on boot, and I haven't
been able to track it down. If that is the only issue, it would be
better to get this into the tree, and try and find a mips expert to
help us out. I'll continue looking into it, but haven't had much luck
yet.

Bruce

The following changes since commit d221e59a5067266c3f620259a1e56a56823df1fb:

  bitbake: cooker: Log when parsing starts in server log (2023-06-30 18:05:30 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (15):
  linux-yocto/6.1: update to v6.1.36
  linux-yocto/6.1: update to v6.1.37
  linux-libc-headers: bump to 6.4
  perf: fix buildpaths QA warning in 6.4+
  kernel: fix localversion in v6.3+
  linux-yocto: introduce 6.4 reference kernel recipes
  linux-yocto/6.4: update to latest
  linux-yocto/6.4: aufs6 integration
  linux-yocto/6.4: refresh configuration
  linux-yocto-rt/6.4: integrate -rt6
  linux-yocto/6.4: update to v6.4.2
  linux-yocto/6.1: update to v6.1.38
  conf/machine: set preferred kernel to be 6.4
  poky/poky-tiny: set preferred linux-yocto version to 6.4
  linux-yocto-tiny/6.4: fix configuration warnings (HID)

 meta-poky/conf/distro/poky-tiny.conf          |  2 +-
 meta-poky/conf/distro/poky.conf               |  4 +-
 meta/classes-recipe/kernel-arch.bbclass       |  7 ++
 meta/classes-recipe/kernel.bbclass            |  6 +-
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 meta/conf/machine/include/x86/x86-base.inc    |  2 +-
 meta/conf/machine/qemuarmv5.conf              |  2 +-
 ...linux-stddef.h-in-swab.h-uapi-header.patch | 42 -----------
 ...aders_6.1.bb => linux-libc-headers_6.4.bb} |  3 +-
 .../linux/linux-yocto-rt_6.1.bb               |  6 +-
 .../linux/linux-yocto-rt_6.4.bb               | 48 +++++++++++++
 .../linux/linux-yocto-tiny_6.1.bb             |  6 +-
 .../linux/linux-yocto-tiny_6.4.bb             | 33 +++++++++
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 ++++----
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 71 +++++++++++++++++++
 meta/recipes-kernel/perf/perf.bb              |  2 +-
 16 files changed, 191 insertions(+), 73 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-include-linux-stddef.h-in-swab.h-uapi-header.patch
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.1.bb => linux-libc-headers_6.4.bb} (74%)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_6.4.bb

-- 
2.34.1


