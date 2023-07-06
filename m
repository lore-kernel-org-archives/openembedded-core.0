Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6074DC001B0
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 13:09:50 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.21878.1688648982363644336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 06:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=cs2Vbv5X;
 spf=pass (domain: baylibre.com, ip: 209.85.128.53, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fba8e2aa52so7351215e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 06:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688648980; x=1691240980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mddQLoNqYISl6C2YoY5/E2tK+eq/y1yHT3KFUpx3Ehs=;
        b=cs2Vbv5XnJaCUS86fltyiuz/qCzGzMjnFETjGFLxSsD90c8FaQYT1LlTvHGcYn98+9
         f1Erku++mTFvaAEdJw7RLL2Po1PA3cZUYQnh7N0pZtJpQzmWJA5KUIk3OHN0QsjKaAdu
         wYldvSTLp5h2UGo7R9kOkjkQVGBnMj/XiH9z3gda2yiuftmrrE/FTpN0hBQw3jCCHu28
         +Bj1hxxMrOOK9nosVuKYQP/BCZlaWjYdykQGo3vq7473PMD7rTW7OEl3l9Mkc0Q0oTRs
         zOY3URTRvQX1+mOb9XpoK8nHDFnJhYniCko7xuzjLx2XRmtwK0oxSnkm0qBLYSUJ/wxm
         8A0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688648980; x=1691240980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mddQLoNqYISl6C2YoY5/E2tK+eq/y1yHT3KFUpx3Ehs=;
        b=Dtz1zqKC6SWyLBIS0fZEHG8kiPKd3KiJCWHvTSVKZTiw59fLDOOTTMlGobexl/P+jp
         Q4a9SkcTrHPIHI20FenwosZpRjLF+lm16GpTDkAQQiUzh913mlZktzbXeWP5n6GtHVUq
         /UtCUwDXS18GteKQVdHiMEuPKe105bXyLl8iqN7zOCT4I5YD5hRVqNr++cy94h5fTBys
         caP+dgRAITi1hvQL5enVeKZYkG/lgmTRJzkbOdiXHf75BJknzFwV+E00fyhMKKKNtnJE
         qwPYvT3wS3mAhvX4Sxuctsh0Rm1l4y/VIHcJblvty44MoNwAbs6BJ/k8bG/07ePfS34S
         LokA==
X-Gm-Message-State: ABy/qLaY7QN/oBhzYq4xJCQOx3MtKVZjECoMd5HMBsOsB6oxZjdyV9+K
	rcUYrvQB7IDowQ4/DDHsFkhRCiOv1K9oe7oDVKtBjg==
X-Google-Smtp-Source: APBJJlFFdgxIgqIQmNVji8YeuMgCtjAJjCBC9BYEGgc9xBH1bRwD0iHRICquaEBHDnFLh4uxcF9Rkw==
X-Received: by 2002:a7b:c39a:0:b0:3fb:ef86:e2e with SMTP id s26-20020a7bc39a000000b003fbef860e2emr1411046wmj.19.1688648980242;
        Thu, 06 Jul 2023 06:09:40 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id v13-20020a5d43cd000000b00314427091a2sm1828419wrr.98.2023.07.06.06.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 06:09:39 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v4 0/2] Add ptest for less
Date: Thu,  6 Jul 2023 15:09:32 +0200
Message-ID: <20230706130934.586539-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 13:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183943

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
v3 can be found here: https://lists.openembedded.org/g/openembedded-core/message/183931

Changes in v4:
- add verbose output on failure

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
 meta/recipes-extended/less/files/run-ptest    | 26 ++++++++++++
 meta/recipes-extended/less/less_633.bb        | 37 ++++++++++++++---
 5 files changed, 128 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/less/files/0001-lesstest-Makefile-allow-CFLAGS-to-be-overitten.patch
 create mode 100644 meta/recipes-extended/less/files/0002-lesstest-Makefile-add-LDFLAGS-support.patch
 create mode 100644 meta/recipes-extended/less/files/run-ptest

-- 
2.41.0


