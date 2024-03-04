Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55480C54E4A
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 15:23:30 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.101491.1709565803179511003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 07:23:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SqeFW2oc;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-29aa8c4710bso3321372a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 07:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709565802; x=1710170602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=36rRttSbmnpYKAFyJWz7ihwHWOPkMoGIaSGq2t2mv4Y=;
        b=SqeFW2ocBcNTlRLouNDAGngAoOmLaqM3fH/H0kLZKBeeIsZvJMUKRPlCxgbngl4opM
         ZjAL5wK39Gs2sozs6cm9qxtpq6GoIhIdSPlWE83bvAUaakZ+2dD5Ss3w0ciwKnH1C4PJ
         35NAx1n7I6LxAuX6DefnabHP05I4+7SeFsfp+j0HA6CIGN46H6Xjk8mzABwa/g5QXuRJ
         uWsLj5Jw6x7ujUx0LwP89wO+ZRdEA019pfcp30uPhelBCrFWRCb5x75QUhMF9Q9awNhd
         JUMRuV3s7OBKp4vts462Bn+CoVPDyhoDarVgzg11WCphlDbe+1NJroRwV76/LbovzvRK
         u++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709565802; x=1710170602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=36rRttSbmnpYKAFyJWz7ihwHWOPkMoGIaSGq2t2mv4Y=;
        b=vdWyR+58Sj8Z4YD3U7N7Zqe6dnIG9qZtBc6R7XK5SKk2uNDNeyj3JUbFByC/8S4b57
         8qmqbVVLUhOomSeH4iIMLJRwqMPcp+IdyYrSgkgUjEn/oFP4A+YTTVF4foHQgmAO6TtA
         rXlLRcvmoL5rs8N841IpEgWCYL19Z5T9Yhjcerva6C8f2ZVTbYiIA5PyrbQdVqvajSbi
         5u9FoXHiguuwYwQyFjdWXojuifIWpiKqmR7aYl7PswAod7qzYtYXzZ6DvIsX1haJtWVm
         bNxkYmJsAwxjJ8b5glt8EtQ/DE+x2hyb88MEeWaPfIXFGYQgW6MoUvzPeqhLGy5hoRci
         qjvQ==
X-Gm-Message-State: AOJu0YzEM9Ch1f+8cyOv3WN/7pIdf90xPZMog3ZTi5RJV8EPMugjj/lk
	Y6e/jSM8AGWejH/nAg9BxhPmMqE7opdRjDZ+TE2Uoo1HLBFxvkYqs+eqolhN+5Eo8PZxg4F+E1l
	OoIY=
X-Google-Smtp-Source: AGHT+IHHwU9WHkvbZDHZ6MJ2+N89ewb6V25M79yXhVXE+nP+uHY2FHyj9wiMaubI53N/uQ97xliajw==
X-Received: by 2002:a17:90a:a798:b0:29b:171f:4f8e with SMTP id f24-20020a17090aa79800b0029b171f4f8emr12521645pjq.14.1709565802382;
        Mon, 04 Mar 2024 07:23:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 1-20020a17090a0f0100b0029981c0d5c5sm8898968pjy.19.2024.03.04.07.23.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 07:23:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/11] Patch review
Date: Mon,  4 Mar 2024 05:23:05 -1000
Message-Id: <cover.1709565668.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 15:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196598

Please review this set of changes for kirkstone and have comments back by
end of day Wednesday, March 6

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6640

The following changes since commit cca0971a7d92d823cc0c2b16cf14a7b2ed8ecb61:

  kernel: make LOCALVERSION consistent between recipes (2024-02-27 03:51:58 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Sverdlin (1):
  linux-firmware: upgrade 20231030 -> 20231211

Dhairya Nagodra (1):
  dbus: Add missing CVE_PRODUCT

Munehisa Kamata (1):
  kernel.bbclass: Set pkg-config variables for building modules

Peter Marko (1):
  glibc: ignore CVE-2023-0687

Poonam Jadhav (1):
  qemu: Fix CVE-2023-42467

Priyal Doshi (1):
  tzdata : Upgrade to 2024a

Ross Burton (1):
  cve_check: cleanup logging

Soumya Sambu (1):
  bind: Upgrade 9.18.19 -> 9.18.24

Vijay Anusuri (2):
  less: Fix for CVE-2022-48624
  qemu: Fix for CVE-2024-24474

Vivek Kumbhar (1):
  qemu: Backport fix CVE-2023-6693

 meta/classes/kernel.bbclass                   |  7 ++
 meta/lib/oe/cve_check.py                      | 13 ++--
 .../bind/{bind_9.18.19.bb => bind_9.18.24.bb} |  2 +-
 meta/recipes-core/dbus/dbus_1.14.8.bb         |  2 +-
 meta/recipes-core/glibc/glibc_2.35.bb         |  2 +-
 meta/recipes-devtools/qemu/qemu.inc           |  5 ++
 .../qemu/qemu/CVE-2023-42467.patch            | 46 ++++++++++++
 .../qemu/qemu/CVE-2023-6693.patch             | 74 +++++++++++++++++++
 .../qemu/qemu/CVE-2024-24474.patch            | 44 +++++++++++
 ...lock-desriptor-to-set-the-block-size.patch | 54 ++++++++++++++
 ...ero-and-changes-limited-to-bits-8-15.patch | 67 +++++++++++++++++
 .../less/less/CVE-2022-48624.patch            | 41 ++++++++++
 meta/recipes-extended/less/less_600.bb        |  1 +
 meta/recipes-extended/timezone/timezone.inc   |  6 +-
 ...20231030.bb => linux-firmware_20231211.bb} |  7 +-
 15 files changed, 355 insertions(+), 16 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.19.bb => bind_9.18.24.bb} (97%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-6693.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-24474.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/scsi-disk-allow-MODE-SELECT-block-desriptor-to-set-the-block-size.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/scsi-disk-ensure-block-size-is-non-zero-and-changes-limited-to-bits-8-15.patch
 create mode 100644 meta/recipes-extended/less/less/CVE-2022-48624.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20231030.bb => linux-firmware_20231211.bb} (99%)

-- 
2.34.1


