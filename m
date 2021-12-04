Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8019C433F5
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 21:30:15 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.30134.1638653414104018265
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Dec 2021 13:30:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n4AbMQ67;
 spf=pass (domain: gmail.com, ip: 209.85.208.170,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id v15so13326521ljc.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Dec 2021 13:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O6PIrmMdcsDO3wt7lX3EvMO/D9kAbnRyvoaMK24KJao=;
        b=n4AbMQ67OsLJsspBmQS4zzBEX0dUtolq5Bcm64c5o8v4NeGx1ZDKLVOq0MClE/ITzI
         81Rpt2EjPlqpICk2FJolAkmW0fDRcw5qXJGKUwLhDK+49UE9zBSQtZSxj7N6D6hcXoel
         +th+91YUr7Enk52HBTfYWX56Gr9TDre3Z2PlZoDbYgKAGlD5etBbHptiqkkSxlYtMhuh
         hP1aNL+4Sn8CpfZrtcfOPFDc4qU0uyZDxzXLENrror5EYK4mfMysFQyx68OohT5q7cTQ
         AqVb8f+FyYsM78ZujB4IJTXLtqBgHBMm4nozC38HPK2bMqcBgK45N2DvrRNaMe+s7VGJ
         RK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O6PIrmMdcsDO3wt7lX3EvMO/D9kAbnRyvoaMK24KJao=;
        b=D9nCU1EcrOcLPl0mJFlMX8SI/2T3qO0RCZXc9+gKIqFl+gZvLweEr2J4cTK8BnSSFw
         qp1tPNGFTBbBb4slOVLqs0JNpnqFpuqvj9+s5fivN/WqEiIxpf+S4Ky9Tmys6IHs0fiv
         H15l6ONO0qckpzxF3f4nMisRRl+XySsxYduzBT//F5OlSdoaS9bu+qN4/y6Ms/oZf3Me
         MbXBD0Tgcn5WQkORSi/Sh9j5ELIBrP7G7qKHyEE2/EiOTPG9Qz3U2bRtljhhDHofUyMV
         u7aqV5M19FSJpQtykq4ZlbZykEmI4aQc3iFAzSa16x6TNpPPmxm499mdSJFiK8wDxQ5D
         kG+g==
X-Gm-Message-State: AOAM531otnSsh6FY+77pUPBGPB2LyBASYRO3S6mmwZWhjCLhkdFS4WBr
	cDoandgAQ+w6TjIu/nUe1qvxkujsJrbvHQ==
X-Google-Smtp-Source: 
 ABdhPJyHocf8GsjmvM+uULRbf/6j+VNVqMiFOg0wOTQtaDznUjstOmLhro6uuPSVxPNv8SWEFP0UnA==
X-Received: by 2002:a2e:a4b6:: with SMTP id
 g22mr26003313ljm.447.1638653411813;
        Sat, 04 Dec 2021 13:30:11 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 p3sm874262lfh.124.2021.12.04.13.30.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 13:30:11 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH v3 0/4] Improve native/cross reproducibility
Date: Sat,  4 Dec 2021 22:29:36 +0100
Message-Id: <20211204212940.3787349-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 21:30:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159181

This patch series is not intended for merge. I only send it out to
highlight where the problems are and to get some discussion going on
how/if we want to improve the sitation.

This is a patch series that tries to improve the reproducibility of the
native/cross binaries when building in different directories. This has
been tested on a Fedora 35 system which uses gcc 11.2.1 at the time of
writing.

The RUNTIME hack is questionable, maybe there is a better way to enforce
a fixed RUNTIME entry size during linking. The build system does not do
any additional rpath manipulation for target binaries, so in those cases
this is not a problem.

If in the end we do come up with a solution, then it should be tested on
the autobuilders, since otherwise this is going to degrade overtime. It
would then be important that the build paths are of significantly different
lengths. TMPDIR=/tmp/sysrootA/ and TMPDIR=/tmp/sysrootB/ will *not* uncover all
rpath problems.

Another thing that would be useful is if buildhistory could start
monitoring the depsig.do_populate_sysroot files, since that would highlight
changes in the actual file contents, which is currently not covered by
buildhistory.

The end result of this patch series is that I can build python3-native
in two different build paths, and the resuling sysroot-components/x86_64/
directories are identical, except for the 'fixmepath.cmd' files, which
are not included in the hash equiv. comparisons. Even so, there remains a lot of
native builds that are going to need to be fixed in similar ways as the
ones in this patch series.

Changes in v2:
 * Fixed building icedtea7-native/openjdk-8-native by prepending a '/' to the
   rpath padding
 * Squashed all the recipe-fixes together in one commit for now

Changes in v3:
 * Rebase on top of master
 * Instead of adding a padding entry to rpath, set phony rpaths in bitbake.conf
   and add patches for unbreaking python3-native and kernel
 * With the changes above we don't need to remove the build ID, so add it back

Jacob Kroon (4):
  kernel: Pass rpaths in BUILD_LDFLAGS
  python3-native: Skip testing import of modules
  bitbake.conf: Use dummy rpaths in native binaries
  Improve native reproducibility in recipes

 meta/classes/chrpath.bbclass                  |  5 +-
 meta/classes/kernel.bbclass                   |  1 +
 meta/conf/bitbake.conf                        |  4 +-
 ...sysroot-and-debug-prefix-map-from-co.patch | 78 -------------------
 .../openssl/openssl/strip-buildinfo.patch     | 13 ++++
 .../openssl/openssl_3.0.0.bb                  | 10 +--
 meta/recipes-core/ncurses/ncurses.inc         |  4 +
 .../util-linux/util-linux_2.37.2.bb           |  2 +-
 .../libtool/libtool-native_2.4.6.bb           |  1 +
 ...ism.patch => perl-cross-determinism.patch} |  0
 .../perl-cross/perlcross_1.3.6.bb             |  4 +-
 meta/recipes-devtools/perl/perl_5.34.0.bb     |  3 +
 .../pkgconfig/pkgconfig_git.bb                |  1 +
 .../python/python3/determinism.patch          | 15 ++++
 .../python/python3/no-import-test.patch       | 14 ++++
 .../recipes-devtools/python/python3_3.10.0.bb |  9 +++
 16 files changed, 75 insertions(+), 89 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/strip-buildinfo.patch
 rename meta/recipes-devtools/perl-cross/files/{determinism.patch => perl-cross-determinism.patch} (100%)
 create mode 100644 meta/recipes-devtools/python/python3/determinism.patch
 create mode 100644 meta/recipes-devtools/python/python3/no-import-test.patch


