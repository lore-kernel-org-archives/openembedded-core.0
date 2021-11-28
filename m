Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51ED9C433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 09:46:08 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.45734.1638092766518459880
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 01:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a3Cj8aou;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id z8so28400365ljz.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 01:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jxWJXminh1Psamh+wOzj6ihQvuXa/8ejAjhstKnnXdk=;
        b=a3Cj8aou45RBjprZyMI9QtA1Dz6CYS4Qku3gKtFLBRtU3CSbSVN9S8nUPOAJ8DzK0L
         dxbQ2Nw9B/gDEPG/1TNuLiBgEivRgIAvNjH60pNcB8SDxhePRuBm5rvwy12RMk+u+QHy
         zE+TufnJjQkm6tn4BJLZBtQJIbEDLvheJtReQBE5hSs2r1BvhOb/ymfF3JIpmW56i4ZR
         UwEekFjsyiKoNn+G+nHYWM3iQMSnui5TF8wguM2mfF9vBPSpR9lJ/p2abzeZKIgbN6JY
         zuCFudGS3un6wD170EleYEbIM7aRV6sj/mhkMcr4j1hzE/49+BKsaxEI7j8eUYQd/zaw
         WZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jxWJXminh1Psamh+wOzj6ihQvuXa/8ejAjhstKnnXdk=;
        b=0eLLAF7UbcEfvOCPECEdqAe/Np1ITf2Vf46mGb+mUp4S+1WSq1DSsG9l85lfLhbjTX
         nskewliLPW6nVBHFdXGi3A8LmrvgKWp3dMX+M4HHkbZPjdihUDwZg60HCTm/gHJ6tVog
         f7pP8TB4P+yCdYfjIn/T0+cgDFcHMyi8gbSrrm5GijFZbdKolO9DqKIQEKwcADfupEaI
         ODVjB0zfHJttF421qXR2DMxiwZ6Nf2gzzLQ3w8bVaqLNbscp3dMbpML7WWi6OqQQUGHp
         md+dmVnZJ3yYvii0kLaMVca+RcqrFFjVXO76um+MTsXbiiZWSvGBGLrb52/udKrd1fJj
         T/Uw==
X-Gm-Message-State: AOAM533z7CUZs1M+3e3LeXC8+0r3as+6ntvfYy2efRLJhaV8JR7Hri3v
	IvsuiY9YGwuszHpf4vLwbMVYaKOjQGExaA==
X-Google-Smtp-Source: 
 ABdhPJwRLIdEuPrW/7alNEtJpwT7dtMLJW9awxwYT77k8iiubkoVIEmvRBJDTaKgNAipW+KVc83waQ==
X-Received: by 2002:a2e:720b:: with SMTP id
 n11mr42209451ljc.351.1638092764337;
        Sun, 28 Nov 2021 01:46:04 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 k15sm1031749ljg.123.2021.11.28.01.46.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 01:46:03 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 0/9] Improve native/cross reproducibility
Date: Sun, 28 Nov 2021 10:45:23 +0100
Message-Id: <20211128094532.1145820-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 09:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158867

This patch series is not intended for merge. I only send it out to
highlight where the problems are and to get some discussion going on
how/if we want to improve the sitation.

This is a patch series that tries to improve the reproducibility of the
native/cross binaries when building in different directories. This has
been tested on a Fedora 35 system which uses gcc 11.2.1 at the time of
writing.

The RUNTIME hack is questionable, maybe there is a better way to enforce
a fixed RUNTIME entry size during linking. It probably breaks for
recipes that do additional rpath manipulations at link-time.

If in the end we do come up with a solution, then it should be tested on
the autobuilders, since otherwise this is going to degrade overtime. It
would then be important that the build paths are of significantly different
lengths. TMPDIR=/tmp/sysrootA/ and TMPDIR=/tmp/sysrootB/ will *not* uncover all
rpath problems.

The end result of this patch series is that I can build python3-native
in two different build paths, and the resuling sysroot-components/x86_64/
directories are identical, except for the 'fixmepath.cmd' files, which
are not included in the hash equiv calculations. Even so, there remains a lot of
other native builds that are going to need to be fixed in similar ways
as the ones in this patch series.

For my images to build I had to avoid the rpath-hack for icedtea7-native
and openjdk-8-native.

/Jacob

Jacob Kroon (9):
  bitbake.conf: Pad rpath and remove build ID in native binaries
  libtool: Improve native reproducibility
  openssl: Improve native reproducibility
  perl/perlcross: Improve native reproducability
  pkgconfig: Improve native reproducibility
  ncurses: Improve native reproducibility
  util-linux: Improve native reproducibility
  python3: Improve native reproducibility
  bitbake.conf: Avoid rpath hack for Java recipes

 meta/classes/chrpath.bbclass                  |  3 +
 meta/conf/bitbake.conf                        |  8 +-
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
 14 files changed, 65 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/strip-buildinfo.patch
 rename meta/recipes-devtools/perl-cross/files/{determinism.patch => perl-cross-determinism.patch} (100%)
 create mode 100644 meta/recipes-devtools/python/python3/determinism.patch


