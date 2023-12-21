Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A08C3DA6E
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 02:09:25 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.43006.1703124557825940206
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 18:09:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1EYYpbcR;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso246241a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 18:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703124556; x=1703729356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EhpcK1wSgUI1coxzTnJU0msdvATokUr4ifU2sSAFYYs=;
        b=1EYYpbcReb85S1b9YSTRpiYvmLVFQUZJTH2qcIygOPbNtwMx3i5tWQ49GfOk5U6xve
         8o85AeaNjsWu/BjWWhsTaXGmqf1W2Uzy514s0DEzqZaVmJ1tKGEc7wyScGlL/7J9TG0/
         uaLKudlCfeh43rLwC0zJkp6C3sHrkMmlCv3I8R8s5fwkSSlRpL4RCVuXFTh3MHiSSobe
         rFP+eVIIdticSkqdDeSLES7IE4SRJitPRqOHe+oX6WnJExnXKa0+qRBSdD8ZBDYMhaSV
         iYfI/8SEUg6Yot66DvORbPMW4yJz/elOGgYknUDhdYf65zEzQaz/a3zyJdgsj5Ss9LkU
         wbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703124556; x=1703729356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EhpcK1wSgUI1coxzTnJU0msdvATokUr4ifU2sSAFYYs=;
        b=UwOeNgaWA8D/aA1AxkIGaWT640HCRhFTeH4sHndwEK9Xm+j1nm/bi0mYDFiqXMrGzQ
         4GwE2RSvYAcvmBxy3SaDHmtdw88ol4kP4YWcZ8wqoP/lmrxdVwx/xLXgTlXB4w9J8VDD
         cYmxoTuI2BymEj5/4dHEK7UWYZBpCjyg+JJdU442rT6bYylPdM25R+tFgybUSCwefxw9
         9AU+phokn622kdoLRJnk5fHPPr00nooeYRr7vkuH0MDCc/7AC+B+CD/IW0S5C1bTckgr
         zrjIx8fVGVGaeSVN4Z2sTyZXf6KHIjEjxDwttjUvgEOya6gahT1EgX7RHE+k0Hw1biNS
         LJSw==
X-Gm-Message-State: AOJu0Yy9w6lJ6+rKRNWd/BELPczGZvwC7ZnN3jUTRE5VHrTXqQlHpy1e
	ZarFlQnV4lRRKTxAUqHZ0X/m4OE3aACX3krtzlEMwg==
X-Google-Smtp-Source: AGHT+IE+AfzNuW5bVGnVE2uypBjazTl6//ZeAUO41vOrNisrJCQ3polJcmSXVq9pBou4AwUXCb5iqg==
X-Received: by 2002:a05:6a20:8f1c:b0:190:5d48:ddcb with SMTP id b28-20020a056a208f1c00b001905d48ddcbmr904334pzk.66.1703124556235;
        Wed, 20 Dec 2023 18:09:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id qb4-20020a17090b280400b0028aecd6b29fsm4447297pjb.3.2023.12.20.18.09.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 18:09:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/11] Patch review
Date: Wed, 20 Dec 2023 16:09:00 -1000
Message-Id: <cover.1703124430.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 02:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192812

Please review this set of changes for kirkstone and have comments back by
end of day Friday, December 22

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6355

The following changes since commit eea685e1caafd8e8121006d3f8b5d0b8a4f2a933:

  build-appliance-image: Update to kirkstone head revision (2023-12-15 04:01:10 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Poonam Jadhav (1):
  curl: Fix CVE-2023-46218

Richard Purdie (1):
  testimage: Exclude wtmp from target-dumper commands

Soumya Sambu (2):
  go: Fix CVE-2023-39326
  perl: update 5.34.1 -> 5.34.3

Sourav Pramanik (1):
  qemu: Fix CVE-2023-5088

Trevor Gamblin (1):
  python3-ptest: skip test_storlines

Vijay Anusuri (2):
  ghostscript: Backport fix for CVE-2023-46751
  openssh: backport Debian patch for CVE-2023-48795

Yoann Congal (1):
  externalsrc: Ensure SRCREV is processed before accessing SRC_URI

mark.yang (2):
  ffmpeg: fix for CVE-2022-3964
  ffmpeg: fix for CVE-2022-3965

 meta/classes/externalsrc.bbclass              |   4 +
 meta/classes/testimage.bbclass                |   2 +-
 .../openssh/openssh/CVE-2023-48795.patch      | 476 ++++++++++++++++++
 .../fix-authorized-principals-command.patch   |  30 ++
 .../openssh/openssh_8.9p1.bb                  |   2 +
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.20/CVE-2023-39326.patch           | 182 +++++++
 ...ile-check-the-file-if-patched-or-not.patch |   4 +-
 ...{perlcross_1.3.7.bb => perlcross_1.5.2.bb} |   2 +-
 .../perl/{perl_5.34.1.bb => perl_5.34.3.bb}   |   2 +-
 ...orlines-skip-due-to-load-variability.patch |  32 ++
 .../python/python3_3.10.13.bb                 |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2023-5088.patch             | 112 +++++
 .../ghostscript/CVE-2023-46751.patch          |  41 ++
 .../ghostscript/ghostscript_9.55.0.bb         |   1 +
 ...c-stop-accessing-out-of-bounds-frame.patch |   2 +-
 ...c-stop-accessing-out-of-bounds-frame.patch |   1 +
 .../curl/curl/CVE-2023-46218.patch            |  52 ++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 20 files changed, 943 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-48795.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/fix-authorized-principals-command.patch
 create mode 100644 meta/recipes-devtools/go/go-1.20/CVE-2023-39326.patch
 rename meta/recipes-devtools/perl-cross/{perlcross_1.3.7.bb => perlcross_1.5.2.bb} (92%)
 rename meta/recipes-devtools/perl/{perl_5.34.1.bb => perl_5.34.3.bb} (99%)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-5088.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-46751.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-46218.patch

-- 
2.34.1


