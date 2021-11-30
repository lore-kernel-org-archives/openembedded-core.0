Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD7CC433EF
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 22:37:50 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.84453.1638311869481160320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 14:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FwNKqHlI;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id bu18so57764165lfb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 14:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6DPmYsYcKGuXiPAtawln3MnnwoVFTAgHSPBO2IiHMXc=;
        b=FwNKqHlI2OynMSSPfefWAxxLRpmOk1g8RLFgD+f7w53p83XPT0uyP60ZDpJvCG0Iaj
         CuqCk7EI1Mxrp90IAIPApH4h8MT/GAPFyHQv69lMYZ5TUwQeekbvcGV5XLcWUrwaxiBc
         7jwK94dH1Td3MIALk9yPjt5oeu5VicWarOTLSLR05bYQpw64Ss+3o2wPcUJcbPiLGubf
         vNZe4kdepDSa3Lrn+B03MtJOWfxDyNFiWHzsgREzIBlcjgQ3RleO+ItjNDiUXDWbXVEM
         B2p7wr1SJMCQbWxTudt+zIrYQJyD0nWvPDSM7I6oixbKp5/0AUE6uJzFwvX73HE+JXIU
         N/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6DPmYsYcKGuXiPAtawln3MnnwoVFTAgHSPBO2IiHMXc=;
        b=N03J8uHMIf0MR820LCAgqQeao3H+Gvc4fRGMvtemLiSpbdZkyZUD2B4oNT0TZEzNc/
         0cxPyAnCp6us/bZz1aihmcj03R7pRKf/eFT/dvk/cA/LeuyFvc8tpuW9ud25Z4Y05AIU
         sa73d6eitbgUQvehZKnt/hwlCYKrs71k/BSoEWIXf9vzyMcZyJkJsIc1Li5y7Rgo118j
         wT3B9cCmcijOwtLo6SSnE7jpCtmTgvRiBtMjnP6fJvrBpLj7I86bdjHu0svIICwzzpbG
         zrdmhqyiADX0qlahSBlqQ4JLuiMdF629b0wruy6yk5nz3LMvsQfFKFtH5RjhZ95DPcwl
         f5IA==
X-Gm-Message-State: AOAM533panN2laNoK5lenkuoibXl7zggW05hEbq3k9aauKtePookSASZ
	/kfvJGCnh8xgdKMRirDKPk+ilAbmGog5uA==
X-Google-Smtp-Source: 
 ABdhPJxCwIiVWpKHPk0XAxg1UYkjvkSsL3h0MuWCpIVrLY8jjuAgfBR75+1oyBDzI1j6znQa92FsjQ==
X-Received: by 2002:a19:4895:: with SMTP id
 v143mr1982728lfa.142.1638311867407;
        Tue, 30 Nov 2021 14:37:47 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 o14sm1860428lfk.225.2021.11.30.14.37.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 14:37:46 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH v2 0/2] Improve native/cross reproducibility
Date: Tue, 30 Nov 2021 23:37:20 +0100
Message-Id: <20211130223722.852434-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 22:37:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158998

This patch series is not intended for merge. I only send it out to
highlight where the problems are and to get some discussion going on
how/if we want to improve the sitation.

This is a patch series that tries to improve the reproducibility of the
native/cross binaries when building in different directories. This has
been tested on a Fedora 35 system which uses gcc 11.2.1 at the time of
writing.

The RUNTIME hack is questionable, maybe there is a better way to enforce
a fixed RUNTIME entry size during linking.

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
 * Fixed building icedtea7-native/openjdk-8-native by prepending a '/'
   to the rpath padding
 * Squashed all the recipe-fixes together in one commit for now

Jacob

Jacob Kroon (2):
  bitbake.conf: Pad rpath and remove build ID in native binaries
  Improve native reproducibility in recipes

 meta/classes/chrpath.bbclass                  |  3 +
 meta/conf/bitbake.conf                        |  5 +-
 ...sysroot-and-debug-prefix-map-from-co.patch | 78 -------------------
 .../openssl/openssl/strip-buildinfo.patch     | 13 ++++
 .../openssl/openssl_3.0.0.bb                  | 10 +--
 meta/recipes-core/ncurses/ncurses.inc         |  4 +
 .../util-linux/util-linux_2.37.2.bb           |  2 +-
 .../libtool/libtool-native_2.4.6.bb           |  1 +
 ...ism.patch => perl-cross-determinism.patch} |  0
 .../perl-cross/perlcross_1.3.6.bb             |  4 +-
 meta/recipes-devtools/perl/perl_5.34.0.bb     |  5 ++
 .../pkgconfig/pkgconfig_git.bb                |  1 +
 .../python/python3/determinism.patch          | 15 ++++
 .../recipes-devtools/python/python3_3.10.0.bb |  8 ++
 14 files changed, 62 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/strip-buildinfo.patch
 rename meta/recipes-devtools/perl-cross/files/{determinism.patch => perl-cross-determinism.patch} (100%)
 create mode 100644 meta/recipes-devtools/python/python3/determinism.patch


