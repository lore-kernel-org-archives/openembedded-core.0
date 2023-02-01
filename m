Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E49C8C636D7
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 22:16:31 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.100.1675289781777048544
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 14:16:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=YAgQOlWB;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id s67so8228pgs.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BVNMEmX7Ka7SyBEViUus4tcwwXPWy6QuZbsYjhbKOXM=;
        b=YAgQOlWBlo5ckpnR6K/9VCthMx64AfuPij5ypfqHV9Y4tgLLljp5ooXheXDzwBaaAu
         MB0HNggz/kkD3AUkhTyiRUpy8vZhzjgD0Gq/ij3kDqkA99yBqDuzCeEdz8ec+7qMgdQe
         8b1HcQEKM7GNEHfs3HaCA0A9nKADVTUxjZx9RUqIEXC+IUecBwSf4q1/1+c9XnrmWBdF
         oW/JMsiIx9NYciahgjYlVK1VxCSN6ojslO9ACQQ3dlBQsKvwem5Vk8fr5WG0oMdTF1nX
         PH6NYAIz+YxJwWzTqkBxPXXMonPjMcqX98fLyIJKSqbnQpVMmhVw4Qn3FVpKD8MNFYf1
         G5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BVNMEmX7Ka7SyBEViUus4tcwwXPWy6QuZbsYjhbKOXM=;
        b=q/FITVJ3yugCAOvk2q+wQiUT4HgbxJl5ZFWhZV+9h2EPkl6iml8fBPJKIjCVrHTpMY
         xSQu4x+Ra1KAgVkDHBjuZFL84f5I6XHPDWbWTGh/rfhlYXwRGxu2Kfp6kqJjmp9M0MZ7
         DXIIro5hj3ZZZ8OqWug37Ubwech3u8A1RmCQ8Lnf3TAedk8542/nr3LZ1ADf1v9g8yI3
         iFOgk3ov0hNVEm0XyMCLoVuyVcm0yVn8WfCUEwS7KCEx6Oy1VJeBnRhJGqFCoCYsTKRj
         4wJ5DWStuuKS+pb7ZmkFhWfz4at5Dzl5R3gNwRYgMFDiUsGZtUfni5QalnN4jYFiy/H4
         pJiQ==
X-Gm-Message-State: AO0yUKU/81j12oi901IxqGa8Op59sAhg8bzt/KtszdEzt32Pum7JszL+
	/vofOeJwSWeu1bNDvpWECpjfMt9LxsS0cMr6rps=
X-Google-Smtp-Source: AK7set9yrc+W0VFDXGyI1SfwvKx1QZNDJZ3Rf3LuGZRBrQSSyE5F37NNpYT9durA97ptQi/6Td+qSA==
X-Received: by 2002:a05:6a00:328e:b0:593:dc6d:53ab with SMTP id ck14-20020a056a00328e00b00593dc6d53abmr3511193pfb.27.1675289780283;
        Wed, 01 Feb 2023 14:16:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a001a4a00b0058df440d51esm11904810pfv.193.2023.02.01.14.16.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 14:16:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/13] Patch review
Date: Wed,  1 Feb 2023 12:15:56 -1000
Message-Id: <cover.1675289652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 22:16:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176662

Please review this set of patches for kirkstone and have comments back by
end of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4872

The following changes since commit a8c82902384f7430519a31732a4bb631f21693ac:

  build-appliance-image: Update to kirkstone head revision (2023-01-26 23:40:27 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Armin Kuster (1):
  lttng-modules: Fix for 5.10.163 kernel version

Bruce Ashfield (1):
  linux-yocto/5.15: update to v5.15.87

Khem Raj (3):
  libtirpc: Check if file exists before operating on it
  libusb1: Link with latomic only if compiler has no atomic builtins
  libusb1: Strip trailing whitespaces

Niko Mauno (1):
  Fix missing leading whitespace with ':append'

Richard Purdie (1):
  native: Drop special variable handling

Ross Burton (4):
  ppp: backport fix for CVE-2022-4603
  quilt: fix intermittent failure in faildiff.test
  spirv-headers: set correct branch name
  quilt: use upstreamed faildiff.test fix

Thomas Roos (1):
  devtool: fix devtool finish when gitmodules file is empty

Xiangyu Chen (1):
  numactl: skip test case when target platform doesn't have 2 CPU node

 meta/classes/core-image.bbclass               |  2 +-
 meta/classes/externalsrc.bbclass              |  2 +-
 meta/classes/native.bbclass                   |  2 +-
 meta/classes/populate_sdk_ext.bbclass         |  2 +-
 .../distro/include/ptest-packagelists.inc     |  2 +-
 .../ppp/ppp/CVE-2022-4603.patch               | 48 +++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.9.bb    |  1 +
 meta/recipes-devtools/quilt/quilt.inc         |  1 +
 .../quilt/quilt/faildiff-order.patch          | 41 +++++++++++++
 .../libtirpc/libtirpc_1.3.2.bb                |  2 +-
 .../spir/spirv-headers_1.3.204.1.bb           |  2 +-
 .../linux/linux-yocto-rt_5.15.bb              |  6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 ++++----
 .../fix-jbd2-upper-bound-for-v5.10.163.patch  | 52 ++++++++++++++++
 ...e-the-correct-print-format-v5.10.163.patch | 61 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.8.bb             |  2 +
 ...k-with-latomic-only-if-no-atomic-bui.patch | 46 ++++++++++++++
 meta/recipes-support/libusb/libusb1_1.0.26.bb | 13 ++--
 .../numactl/Fix-the-test-output-format.patch  |  3 +-
 .../recipes-support/numactl/numactl/run-ptest |  6 +-
 21 files changed, 292 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch
 create mode 100644 meta/recipes-devtools/quilt/quilt/faildiff-order.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-upper-bound-for-v5.10.163.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format-v5.10.163.patch
 create mode 100644 meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch

-- 
2.25.1


