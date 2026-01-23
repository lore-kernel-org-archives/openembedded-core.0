Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C77ED74ED8
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 13:50:39 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68255.1769176233993633580
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 05:50:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wo7inczN;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4327790c4e9so1428949f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769176232; x=1769781032; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOU6ADqW/Kioc0WWg4dnC19OWcoBwb9fFkgfr0RBfN4=;
        b=wo7inczNRHP3etlHFaYxxyKUF+CAzcdxZXui4vNDvrg55xfF5WNJ6JkCSwH+UtdWT7
         ZdvNbWuyh10O7kUr96jt4BnLqFynHV57T9ONY5vK620ME6h6xOrnGFZ7yDCsH+fhI03M
         RZ+t23Lu+SQ/gfBDKvbZWX00nsMCfjPMu5HFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769176232; x=1769781032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOU6ADqW/Kioc0WWg4dnC19OWcoBwb9fFkgfr0RBfN4=;
        b=XKT+UsYPwB6ewQuydKzdcMX/E7ab6zE68m4YtrXuTuYWT8T8hR/DAnaUZC3kvQ2Rza
         Qy72AR40Rc0AYMwnN9Sa4Ir6BnaOozFCHXo63wn+2Qh6JlAWB/AXfF6RZJXWW/wpGSNu
         /PyNg5AYlFioqrTOAKoKB/YwKgAoC/JiaAFFKD4SsGVyh+ty7SPu2zin8NlYH2qlZyNh
         W5FJXkMApgjqcZ39YHh4jXOZ3DKXKcD3LKHLJfI4qiGWojcZ5bs5Q1lO/X5+ARof4j+2
         gWjvvb0QzETaQ3YlPzV8tiPYJaeVegXZQ2PxtkVdPTYJc7ZMeCulV6eHxsfoS1r7JmS8
         o2vg==
X-Gm-Message-State: AOJu0YxPlT68UIpuDsmTfw5G8bARIW+eYRaW661+P9s/dwVDde/gAWb0
	VuTUI4bgH/rEfKC2AyJn5WPFRBgfJB2EVGruBto41mjM3NmDPPJRi/ZBpBiC1wIq+dMXfuXPfj5
	UaUiS8vs=
X-Gm-Gg: AZuq6aJALSZtQp/YiRzvvbKjr27Q5VGF1CACwr/n3bYBv/iyXvZXKQYwtoM5LUucB9e
	b4wsxbkTLrVSJFFXqUI4Qm+1HIGYmM+76lB8bkZZ+gbH9pg5ADgH2z8G9woG7gmjmb553rd/r1f
	uX5jgC796N3g7Ucl/3+88yeeTYix4CytslJFAkHbkcXEZJC/YgTV17b5OhZouhqpjbiJhDrMTXq
	35goZ9f3nE1ZwF0eSIB09NS2GHOy8vkN+6u+0dISjGdVkabu/6A4ldo3B/ZAir8T6lTj822u7E7
	f5OCs/tK+owhIy3qy0B5RSgf8uIvHClgBmCnPADFBFv5gmAaUxlh9dKbPMpftq1xqof0kP5q/h8
	ylVqjR8FBEEHSqZH33GwiWJxAQUwozd57dVAEykIMFUQpjnqRXmVHhvmy0K8fK6uXZ6B7fx4kpQ
	jPKSYPdz9GCkWNJJCU1IWjcI0QuC5obYuVjMZC50OCJORPO8j6K61ifAcpSwVhR9tjmPt9ygSSF
	ZerXNTjIPzsjh02TQUMeiFcQw==
X-Received: by 2002:a5d:588b:0:b0:435:ad52:31d8 with SMTP id ffacd0b85a97d-435b1607764mr4921301f8f.44.1769176231998;
        Fri, 23 Jan 2026 05:50:31 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02ba3sm6918997f8f.2.2026.01.23.05.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 05:50:31 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][whinlatter 00/15] Pull request (cover letter only)
Date: Fri, 23 Jan 2026 14:49:58 +0100
Message-ID: <cover.1769175900.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 13:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229892

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1768906687.git.yoann.congal@smile.fr/

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3112
The "Send QA Email" step failed, that is a known AB-INT bug:
#15696 – AB_INT: resulttool: File exists
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15696

The following changes since commit dd10706cfafb5574b7cf316fca2300d166ef71b0:

  build-appliance-image: Update to whinlatter head revisions (2026-01-12 10:58:53 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-next

for you to fetch changes up to e7891f39ae90d1c23bfcb59af0064591513a671d:

  libarchive: upgrade 3.8.4 -> 3.8.5 (2026-01-19 23:29:16 +0100)

----------------------------------------------------------------

Alexander Kanavin (3):
  libpng: upgrade 1.6.52 -> 1.6.53
  ffmpeg: add a (possible) build race fix
  ffmpeg: fix a build race, hopefully for real this time

Paul Barker (1):
  selftest: devtool: Set PATH when running pseudo

Peter Marko (9):
  util-linux: patch CVE-2025-14104
  gnupg: patch CVE-2025-68973
  curl: patch CVE-2025-13034
  curl: patch CVE-2025-14017
  curl: patch CVE-2025-14524
  curl: patch CVE-2025-14819
  curl: patch CVE-2025-15079
  curl: patch CVE-2025-15224
  libarchive: upgrade 3.8.4 -> 3.8.5

Richard Purdie (2):
  pseudo: Update to pull in openat2 and efault return code changes
  pseudo: Update to pull in 'makewrappers: Fix EFAULT implementation'

 meta/lib/oeqa/selftest/cases/devtool.py       |   5 +-
 meta/recipes-core/util-linux/util-linux.inc   |   2 +
 .../util-linux/CVE-2025-14104-01.patch        |  33 +++++
 .../util-linux/CVE-2025-14104-02.patch        |  28 +++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 ...ibarchive_3.8.4.bb => libarchive_3.8.5.bb} |   2 +-
 ...k-Consolidate-pattern-rules-for-comp.patch | 106 ++++++++++++++++
 ...s-Fix-double-build-by-disabling-.d-f.patch |  78 ++++++++++++
 ...ak-ensure-target-directories-are-cre.patch |  43 +++++++
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb  |   6 +-
 .../{libpng_1.6.52.bb => libpng_1.6.53.bb}    |   2 +-
 .../curl/curl/CVE-2025-13034.patch            |  37 ++++++
 .../curl/curl/CVE-2025-14017.patch            | 116 ++++++++++++++++++
 .../curl/curl/CVE-2025-14524.patch            |  40 ++++++
 .../curl/curl/CVE-2025-14819.patch            |  73 +++++++++++
 .../curl/curl/CVE-2025-15079.patch            |  32 +++++
 .../curl/curl/CVE-2025-15224.patch            |  31 +++++
 meta/recipes-support/curl/curl_8.17.0.bb      |   6 +
 .../gnupg/gnupg/CVE-2025-68973.patch          | 108 ++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.5.11.bb    |   1 +
 20 files changed, 745 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2025-14104-01.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2025-14104-02.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.8.4.bb => libarchive_3.8.5.bb} (96%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-ffbuild-commonmak-Consolidate-pattern-rules-for-comp.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-fftools-resources-Fix-double-build-by-disabling-.d-f.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.6.52.bb => libpng_1.6.53.bb} (97%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-13034.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14017.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14819.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15079.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15224.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch


