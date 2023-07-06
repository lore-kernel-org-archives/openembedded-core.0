Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F8BDEB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 12:01:30 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.20338.1688644880859161850
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 05:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=vQBFWvy9;
 spf=pass (domain: baylibre.com, ip: 209.85.167.49, mailfrom: jstephan@baylibre.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso819927e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 05:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688644879; x=1691236879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eim2sOaoBi3Le/B8HNLr9NRzaswx+9jlfkdfBoZocqM=;
        b=vQBFWvy9vDfNdiBBq78hQBCpjPBDx3TrRbyv0Rc1cQbsfZB/9bDNJWu/JzV7Ma0zi0
         BOx3ZQpuED2hVeyp6JLFG3rSS2Vqu302r/RTw/dCNsOVFSZh4zHIgdSL37+/Wllh/EcW
         87uFAeAmfQoIfE5Wa5dU+9X51ysPCLTj7CR/JPqS0G1Ort0jVwpk6WQcntcjPX64rI/c
         D2X127UF68tiqIbtUPsVs+W2EA5Qcbn8EXR7ZVvIKsAfxI5n8t/BroCpiTCDJZvGavTp
         2bUtzWHpLGgLu8ALseJHA+i6FiM0eooWF6NBvY1JhmfJbRuXHE4tF2Spp0o+ki7dFx50
         VcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688644879; x=1691236879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eim2sOaoBi3Le/B8HNLr9NRzaswx+9jlfkdfBoZocqM=;
        b=OM1JN/eFMnNGFWdaWfHgIUAy8ItNEHGYMWSTyUAcRWk1ObUKmFiN8PBJj0LZX2Fr3z
         NqRNLo+A2PzSNUGFgq780g+nUL0GgozaPusWYn3BAiFjL7mDVsyE6TiGVfRrv4kb9FkZ
         zwXgUOCADvtP5nDMfCdoR674TXeQASIp0oHFBPwXb+ml5xnFJKUSo3dbgxgyEdi0pYmB
         cpskktgCFVAj6Q6mBP2LVn6d7IPNCecmuhuM8rX4/ck+nPdNmxw05fWOzBS/s3AbMErz
         qwwyeOgtdPwWWvYIHtQ+IrKT0+rFFJ40xEuZy6li14CsKS7uSL8ffcz9TS1xqhjvNhh7
         cagw==
X-Gm-Message-State: ABy/qLY81MFGYoxD+0tQHyJh8N708RofH6u5zChu/e5SCQjd2aOGFcrU
	qY0soZl2PjAsxYYTO4mzZwfH6mt5WONQ4TTyWzDQEg==
X-Google-Smtp-Source: APBJJlEM1HLqDuDmGPjEQbPundu6tIu+TSIl3udKlCCiZc+40gTsy6bE/g7s856mDCvlglkJAekTxw==
X-Received: by 2002:a05:6512:3ba4:b0:4f8:8be4:8a82 with SMTP id g36-20020a0565123ba400b004f88be48a82mr1719260lfv.22.1688644878183;
        Thu, 06 Jul 2023 05:01:18 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id e20-20020a05600c219400b003fbca942499sm4910848wme.14.2023.07.06.05.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 05:01:17 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 0/2] Add ptest for less
Date: Thu,  6 Jul 2023 14:01:03 +0200
Message-ID: <20230706120105.553140-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 12:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183931

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

EDIT: added locale-base-en-us in v3 to fix these issues

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
v2 can be found here: https://lists.openembedded.org/g/openembedded-core/message/183919

Changes in v3:
- add locale-base-en-us in RDEPENDS:${PN}-ptest to fix the failing test

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


