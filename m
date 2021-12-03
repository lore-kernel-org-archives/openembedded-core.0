Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3959C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 18:21:23 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.15342.1638555682688558250
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=OgQO4J8u;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id
 f18-20020a17090aa79200b001ad9cb23022so995662pjq.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tA04dsMCpAvmkwP6HZIUcWPal2F11DNm/x5kw64ntgI=;
        b=OgQO4J8uCl7YqkVVNSnbBXRgsfjO1d4g65z+kKX2H0AdKxy4xJrLyi3NSKidOXh2Zs
         TGmIvK72NCmZH/YPM9F//QKj6k7l27BelV4MsVayRs3uDHKiqUrBRtYRlJVj86l/SfUY
         b/aRweFhEPtsHdjuHIHWFbGcbM6Io1XQjvmIdvgk5+MomadDlKJ/cFE7s/oh9P8DtQMC
         RXXa0QGD+vfcX26HdzxD+kxWifdUG15oKzSYbqMkLEM8wvXj257fetcV9iHc0eDI+SAG
         pH+2F00ChUEXMBwPpwSUgCr11xM58JByLtWXvrA1SL/JjjKHqYvARd0F+RlT6cWFnodA
         cSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tA04dsMCpAvmkwP6HZIUcWPal2F11DNm/x5kw64ntgI=;
        b=FA8waOkl9cf3LsuYOMmlpEoqiqPs6pJGK+SLIkX7Gzbu+utmJrRoYqjYK1MgerokH/
         /R9ce9huFIlANANxAaT/yuvCEa8Z4qUdw2WqdHd/M1AwaCBetAjo68/+yU0//mnrZudV
         uX1EQcO96jeZIoyNhuc8dtBePeZ7n2atCF13rJgO6Eg7AoChOPEzACzgcxkN/O+VOMm7
         lJrff6uiKSBcrliOG9fU57OmZPebfuAWSbMRIS2vn7HP0c3+lbdfQljErrGytRpCTfag
         uDoMymtPa16JAUkpC/AQ3gq0yTDTfsRLOjj45HUaJkiJuqu73Cxxj1z8ZIpUGNxdhXbx
         ITqw==
X-Gm-Message-State: AOAM532A9llDu+c3+vHAszgKcQQ2tBgNIYjClRdFajU6SorU9o3da3qB
	QGk85iPllVjb8XMY6kDkXDT9N3zRpZ3KaG2zOO8=
X-Google-Smtp-Source: 
 ABdhPJyXJrQC/cCjIGvK7fejceVV3Nx/B2w7Uj6ANv9cx8uwDVu3pJCtA0vz8Q3CyYNwhGX8K3wObw==
X-Received: by 2002:a17:902:7d8b:b0:144:e29b:4f2b with SMTP id
 a11-20020a1709027d8b00b00144e29b4f2bmr24371667plm.57.1638555681025;
        Fri, 03 Dec 2021 10:21:21 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 130sm3959753pfu.13.2021.12.03.10.21.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 10:21:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/18] Patch review
Date: Fri,  3 Dec 2021 08:18:47 -1000
Message-Id: <cover.1638555254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 18:21:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159127

Please review this set of patches for dunfell and have comments back by end
of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2988

with the exception of a known autobuilder intermittent issue (on qemuppc test)
which passed on subsequent retest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4402

The following changes since commit f61fcb6e176f19f1e768ce63a693f238713c8887:

  openssh: remove redundant BSD license (2021-12-02 05:11:21 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Dhruva Gole (1):
  scripts/checklayer/common.py: Fixed a minor grammatical error

Eero Aaltonen (1):
  cmake: FindGTest: Add target for gmock library

Jate Sujjavanich (2):
  libdnf: Backport bugfix for upgrade calc
  dnf: Backport bugfix for upgrade

Khem Raj (1):
  libunwind: Backport a fix for -fno-common option to compile

Neetika Singh (1):
  glib-2.0: Add security fixes

Pavel Zhukov (2):
  busybox: Fix for CVE-2021-42374
  busybox: Fix for CVE-2021-42376

Quentin Schulz (1):
  README.OE-Core.md: update URLs

Ranjitsinh Rathod (2):
  ncurses: Fix for CVE-2021-39537
  libsolv: update tag for missing CVEs

Richard Purdie (2):
  buildhistory: Fix srcrevs output
  oeqa/parselogs: Fix quoting

Ross Burton (1):
  vim: fix CVE-2021-3968 and CVE-2021-3973

Steve Sakoman (4):
  cve-extra-exclusions: add db CVEs to exclusion list
  bind: update to 9.11.33
  bind: update to 9.11.34
  bind: update to 9.11.35

 README.OE-Core                                |  10 +-
 meta/classes/buildhistory.bbclass             |  30 +-
 .../distro/include/cve-extra-exclusions.inc   |   9 +-
 meta/lib/oeqa/runtime/cases/parselogs.py      |  14 +-
 .../bind/{bind_9.11.32.bb => bind_9.11.35.bb} |   2 +-
 .../busybox/busybox/CVE-2021-42374.patch      |  53 +++
 .../busybox/busybox/CVE-2021-42376.patch      | 138 ++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |   2 +
 .../glib-2.0/glib-2.0/CVE-2021-27218.patch    | 129 ++++++
 .../glib-2.0/glib-2.0/CVE-2021-27219-01.patch | 170 +++++++
 .../glib-2.0/glib-2.0/CVE-2021-27219-02.patch | 249 +++++++++++
 .../glib-2.0/glib-2.0/CVE-2021-27219-03.patch | 131 ++++++
 .../glib-2.0/glib-2.0/CVE-2021-27219-04.patch | 298 +++++++++++++
 .../glib-2.0/glib-2.0/CVE-2021-27219-05.patch |  54 +++
 .../glib-2.0/glib-2.0/CVE-2021-27219-06.patch | 101 +++++
 .../glib-2.0/glib-2.0/CVE-2021-27219-07.patch |  76 ++++
 .../glib-2.0/glib-2.0/CVE-2021-27219-08.patch | 101 +++++
 .../glib-2.0/glib-2.0/CVE-2021-27219-09.patch | 100 +++++
 .../glib-2.0/glib-2.0/CVE-2021-27219-10.patch |  59 +++
 .../glib-2.0/glib-2.0/CVE-2021-27219-11.patch |  63 +++
 .../glib-2.0/CVE-2021-27219-reg1-1.patch      |  36 ++
 .../glib-2.0/CVE-2021-27219-reg1-2.patch      |  38 ++
 .../glib-2.0/CVE-2021-27219-reg1-4.patch      |  38 ++
 .../glib-2.0/CVE-2021-27219-reg1-5.patch      | 100 +++++
 .../glib-2.0/CVE-2021-27219-reg2-1.patch      |  49 ++
 .../glib-2.0/CVE-2021-27219-reg2-2.patch      |  43 ++
 .../glib-2.0/CVE-2021-27219-reg2-3.patch      | 232 ++++++++++
 .../glib-2.0/glib-2.0/CVE-2021-28153-1.patch  |  27 ++
 .../glib-2.0/glib-2.0/CVE-2021-28153-2.patch  |  42 ++
 .../glib-2.0/glib-2.0/CVE-2021-28153-3.patch  |  57 +++
 .../glib-2.0/glib-2.0/CVE-2021-28153-4.patch  | 265 +++++++++++
 .../glib-2.0/glib-2.0/CVE-2021-28153-5.patch  |  55 +++
 meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb |  24 +
 .../ncurses/files/CVE-2021-39537.patch        |  30 ++
 meta/recipes-core/ncurses/ncurses_6.2.bb      |   1 +
 .../cmake/cmake-native_3.16.5.bb              |   1 +
 ...ndGTest-Add-target-for-gmock-library.patch | 255 +++++++++++
 ...ackages-in-upgrade-job-RhBug-1728252.patch |  60 +++
 meta/recipes-devtools/dnf/dnf_4.2.2.bb        |   1 +
 ...job-goal.upgrade-with-sltr-as-target.patch |  58 +++
 meta/recipes-devtools/libdnf/libdnf_0.28.1.bb |   1 +
 .../libsolv/files/CVE-2021-3200.patch         |   9 +-
 ...0001-Fix-compilation-with-fno-common.patch | 420 ++++++++++++++++++
 .../libunwind/libunwind_1.3.1.bb              |   1 +
 ...rash-when-using-CTRL-W-f-without-fin.patch |  92 ++++
 meta/recipes-support/vim/vim.inc              |   4 +
 scripts/lib/checklayer/cases/common.py        |   2 +-
 47 files changed, 3696 insertions(+), 34 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.32.bb => bind_9.11.35.bb} (98%)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2021-42374.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2021-42376.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27218.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-03.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-04.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-05.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-06.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-07.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-08.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-09.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-10.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-11.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-reg1-1.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-reg1-2.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-reg1-4.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-reg1-5.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-reg2-1.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-reg2-2.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-reg2-3.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153-1.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153-2.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153-3.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153-4.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153-5.patch
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2021-39537.patch
 create mode 100644 meta/recipes-devtools/cmake/cmake/0006-cmake-FindGTest-Add-target-for-gmock-library.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0040-Keep-installed-packages-in-upgrade-job-RhBug-1728252.patch
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0040-Mark-job-goal.upgrade-with-sltr-as-target.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind/0001-Fix-compilation-with-fno-common.patch
 create mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3611-crash-when-using-CTRL-W-f-without-fin.patch

-- 
2.25.1


