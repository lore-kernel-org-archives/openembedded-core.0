Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2EFEB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 09:28:19 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.17906.1688635694126569646
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 02:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=rvvvNEaF;
 spf=pass (domain: baylibre.com, ip: 209.85.128.48, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fbea147034so4586615e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 02:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688635692; x=1691227692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=haUdPGp6X6fPA+fuL7LU5GHXGsGniZimVFhn6QFQajk=;
        b=rvvvNEaF23ZtphmPL1l8dIPn+czDxJnWv731bFrv9ASGGzFM0ewNzl0Jyby9MLstQj
         8ue1NoIbFjamW7CDxCugm/lRrygvRQEQypHHnPiVrpmAAw+MUPEnE+T/Jb7PdhkpK1p/
         mXL1FVOTDbc+JqAzUyGrRmmt7vWUwydqIKFi0wHxx/J7vyxpILeJRdBuAo2UvVTvJmGn
         BfhaEtidXuUBDfxQIUzth0cy956/O00s2ntgrucstpgx2aWMmK1GxFlC70wQE4Yp54Zk
         N9a6Kg0gB+qC0Ib2qYkyUdMlzlQkiTYzaEOYNVnIVOBg8jAtWbjkOOJhNdDuOR9jt0CK
         t+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688635692; x=1691227692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=haUdPGp6X6fPA+fuL7LU5GHXGsGniZimVFhn6QFQajk=;
        b=l4/53+Asywy0C4jul/34ZHe6QMghsTYyMrOuGOBNWahhsrIRAi/Is/AqjbYTARDhjS
         WEDsHL/u+InlE+qHSO2kRn994f+SjgPV/JmmhNHwcrczmUgQOTc+WNgsdKRiCXZ3z7pE
         pOSLJcslrRNp1qTzRKaeGiKNAfP6zAkvMym5ej2fFNh+Uu21X0g+f8G05SXHJMWvKCtr
         L0uo72/2oR4LCix4Yku7xbM4+uE5Sd4LlkODkoohyCeFiQaEFIZOEEdorx9xHTMu8hTS
         PNj8BR+fAV7zzNjTBNLcQ03yrrCRyMIve47kOV9heNAnYJfmcPuwrtFsUEunkgLTBC/R
         VxsA==
X-Gm-Message-State: ABy/qLY+DLh7ktQvAEAKZ0JMxL0iTSCUnL7OKv7/clXqaMCUJUxZOSF8
	RczS2TId4C/TwU4THXQrmpb6sEmqwQHsV3ilJMsUhA==
X-Google-Smtp-Source: APBJJlH2W3Hh/dVh4TYGOTsLp5kCKFUkxjIZjwhUH8T2Azk0hWpWfkt78JTjnxpNHTgYeLJDfegJFA==
X-Received: by 2002:adf:db91:0:b0:30e:5bd0:21a2 with SMTP id u17-20020adfdb91000000b0030e5bd021a2mr912798wri.52.1688635691903;
        Thu, 06 Jul 2023 02:28:11 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id p14-20020a056000018e00b003113ed02080sm1339926wrx.95.2023.07.06.02.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 02:28:11 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v2 0/2] Add ptest for less
Date: Thu,  6 Jul 2023 11:28:04 +0200
Message-ID: <20230706092806.507075-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 09:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183919

Hi all,

This series is adding ptest support for less.

As of today, release tarballs are fetched from
http://www.greenwoodsoftware.com/ but the less test code is not bundled
within these releases. A github issue has been opened asking for
maintainer to add the test code into it [1].

So before test code gets bundled into the release tarballs, switch to
github URI.

Here is the output when running the ptest on the target:

 FAIL: chinese1.lt
 PASS: colorbars.lt
 PASS: github216.lt
 PASS: github265.lt
 PASS: github329.lt
 PASS: hdr-unicode1.lt
 PASS: hdr-unicode.lt
 PASS: proc-special.lt
 PASS: seq200.lt
 PASS: table-50x200.lt
 FAIL: utf8-2.txt.lt
 PASS: version.c.lt
 ============================================================================
 Testsuite summary for less
 ============================================================================
 # TOTAL: 12
 # PASS: 10
 # FAIL: 2
 ============================================================================

I am building a core-image-minimal image with poky DISTRO and run it into qemu.
I have 2 FAIL. All tests PASS on my computer.
I suspect a locale issue here but I may need some help on this.

I opened a pull request on less for Makefile modification [2]

And I also opened a github issue [3] to ask a reformating of the less
test summary to follow Automake simple test format to simplify the
run-ptest script.

My branch is available on poky-contrib repository [4]

[YOCTO #15073]

Best
Julien

[1]: https://github.com/gwsw/less/issues/344
[2]: https://github.com/gwsw/less/pull/398
[3]: https://github.com/gwsw/less/issues/399
[4]: https://git.yoctoproject.org/poky-contrib/log/?h=jstephan/add-ptest-for-less

v1 can be found here: https://lists.openembedded.org/g/openembedded-core/message/183894

Changes in v2:
- split commit in two: one for switching to github and one to add the ptest support

Julien Stephan (2):
  less: switch to github URI
  less: add ptest support

 .../distro/include/ptest-packagelists.inc     |  1 +
 ...akefile-allow-CFLAGS-to-be-overitten.patch | 28 +++++++++++++
 ...esstest-Makefile-add-LDFLAGS-support.patch | 41 +++++++++++++++++++
 meta/recipes-extended/less/files/run-ptest    | 25 +++++++++++
 meta/recipes-extended/less/less_633.bb        | 37 ++++++++++++++---
 5 files changed, 127 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/less/files/0001-lesstest-Makefile-allow-CFLAGS-to-be-overitten.patch
 create mode 100644 meta/recipes-extended/less/files/0002-lesstest-Makefile-add-LDFLAGS-support.patch
 create mode 100644 meta/recipes-extended/less/files/run-ptest

--
2.41.0

