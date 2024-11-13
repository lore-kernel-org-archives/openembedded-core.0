Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D865D597CD
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 03:16:28 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.3461.1731467778617174784
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 19:16:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=igxBCB4I;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.44, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-28cdd9d8d01so3301258fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 19:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731467778; x=1732072578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mptNzkWo5PSc4tM0tf/pp8IaHJGNJAUFx1jBneuTdAw=;
        b=igxBCB4ImKA1H9RvICbQ2i/Y8jT+L65rAILr/6cAvm3g+fKe4vWVywVlNjKVPYO6Nm
         ZVTFz9zraD59RAS6wrAj26LdDU9/Q7KPKnPmeQXtP1lsrAsFoSLwxrTvKvHtm+VYa5Zr
         ibwIEVx9ZMGoSLTe8J36MOK5UGQJZFQyWsLP7K5BFVvhTVTd60uVM0yEgJWa6R1LjS4B
         WVTlloXgcT8QorOsi4eneYA+wRehOwgl+Jg6+aa6ZwCNgIOkgfXQqDu3f20fL0NLLfOl
         rWL8LS2l4cxkU49RkgdHnXp4tlzoAE9tMsjoz6D9MMfqkJT/t2aMOJAaclDgUzNgRfzh
         YdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467778; x=1732072578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mptNzkWo5PSc4tM0tf/pp8IaHJGNJAUFx1jBneuTdAw=;
        b=xH9bt6swgaudhUSwzxVqgJS9G/DZS8brkhqentDRjRR9bCmHzv6M14XHkChVwONYwu
         aNF1r1pBw+23bptEnMTkUcl7epYiTTOl1SmeMEVTKNlvjXCvxQrWE4SxNJ3Wog+dk1ZA
         xNqzNrqXRrL5jgWmRer58IOdH+iQAAxTXQyQ/VbCTWRxZQQFv26DHjw3NE4nmfLYs18Z
         wBKs2NqsRkPdo23XdUBHt0ylSS0iIcNe9ytkdyxaV3k+FKPThEHo32G2Y8ztf5SUEUPD
         8gZjdgGOoGo0tbjVT0kO/ZzCFQhYSv9EK/Fe57flejTqzN/1w+0zrObR6Vv7PP5ZtsKH
         Y7pA==
X-Gm-Message-State: AOJu0YyIRCnbCvbj1tq0kwdSU/iEejYD8GmfWQ8YPeao7f8ktEDLcxmf
	pK5Q3/56Hj5asYWz9zelCaGesxmpTQ0Hudx/7ESCaUM0ugauf0WWdaTxIyEq3IykHKI9wOwWsZR
	3
X-Google-Smtp-Source: AGHT+IFCO+x7PNwDgBIJLqCXI4Zr+MR9VFAsIQFjW8jU4c1XNZ45/y/yMk4ZhmNXLMJYufUhPH2dQg==
X-Received: by 2002:a05:6870:5d8b:b0:277:e512:f27a with SMTP id 586e51a60fabf-295ccfd9242mr5137739fac.16.1731467777573;
        Tue, 12 Nov 2024 19:16:17 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f64616csm9660213a12.64.2024.11.12.19.16.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 19:16:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/19] Patch review
Date: Tue, 12 Nov 2024 19:15:53 -0800
Message-Id: <cover.1731467662.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 03:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207073

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, November 14

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/426

The following changes since commit 2e8819c0b9ada2b600aecc40c974a18eb7c0a666:

  xmlto: backport a patch to fix build with gcc-14 on host (2024-11-05 14:15:16 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexandre Belloni (1):
  pseudo: Update to pull in fd leak fix

Archana Polampalli (1):
  ghostscript: fix CVE-2023-46361

Khem Raj (1):
  pseudo: Disable LFS on 32bit arches

Ola x Nilsson (1):
  patch.py: Use shlex instead of deprecated pipe

Peter Marko (4):
  curl: patch CVE-2024-9681
  gstreamer1.0: ignore CVE-2024-0444
  expat: patch CVE-2024-50602
  glib-2.0: patch regression of CVE-2023-32665

Philip Lorenz (1):
  cmake: Fix sporadic issues when determining compiler internals

Richard Purdie (10):
  pseudo: Update to pull in linux-libc-headers race fix
  pseudo: Switch back to the master branch
  pseudo: Update to include logic fix
  pseudo: Update to pull in syncfs probe fix
  pseudo: Update to pull in gcc14 fix and missing statvfs64 intercept
  pseudo: Update to pull in fchmodat fix
  pseudo: Update to pull in python 3.12+ fix
  pseudo: Fix to work with glibc 2.40
  pseudo: Update to include open symlink handling bugfix
  pseudo: Fix envp bug and add posix_spawn wrapper

 meta/lib/oe/patch.py                          | 11 ++-
 .../expat/expat/CVE-2024-50602-01.patch       | 56 ++++++++++++
 .../expat/expat/CVE-2024-50602-02.patch       | 38 +++++++++
 meta/recipes-core/expat/expat_2.5.0.bb        |  2 +
 ...aliser-Convert-endianness-of-offsets.patch | 68 +++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
 meta/recipes-devtools/cmake/cmake.inc         |  1 +
 ...mpilerABI-Strip-pipe-from-compile-fl.patch | 52 ++++++++++++
 .../pseudo/files/glibc238.patch               | 23 ++---
 meta/recipes-devtools/pseudo/pseudo_git.bb    | 11 ++-
 .../ghostscript/CVE-2023-46361.patch          | 32 +++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 .../gstreamer/gstreamer1.0_1.20.7.bb          |  3 +
 .../curl/curl/CVE-2024-9681.patch             | 85 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 15 files changed, 362 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-50602-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-50602-02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gvariant-serialiser-Convert-endianness-of-offsets.patch
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-46361.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-9681.patch

-- 
2.34.1


