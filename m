Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588BECAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 20:05:05 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.33496.1758139501030299858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 13:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=co4SnwKf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-772301f8ae2so307548b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 13:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758139500; x=1758744300; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NJCBibXNlHGdhRhLx/nxGNA5DNVQHPeoVlwqxMUETBc=;
        b=co4SnwKf+go8gbdG57nR6zJq8XlsKEay2zIDGRFI8ypqI67+bkznOvGQ/xoHMN7WUC
         G4Qj22l6g1KhTK3Y+UZbyonV+Z3lcK0Qlq+vRPW7gfUDFq7wfSDBw+1OyMd804HRWQum
         o7J26nnJv9Wonxq0Eh6Y9TWee2506aT6W4qBlAuK8dQhEE6uPj5GEP6oGd+GiimmidzC
         0aFxhEex+4yLmzxtGztOjMOFr/r8IMGsrcGItWo/9AYK3tAFxiQZxqFsthDgQRAHRmwx
         uC3UFlySEdKqrg6SR4VejB84Hp0PME7wm/zTAjAVU469QStGOAGrRU2aUHxOqsaZ6HqF
         fFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758139500; x=1758744300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NJCBibXNlHGdhRhLx/nxGNA5DNVQHPeoVlwqxMUETBc=;
        b=V4+9ABgiYoicdy9kJRjCYZ8tLOf4uqNLjeyq4HybfXQxs6xOULLtD/SKq5n5HkDfYo
         vBMLe96BY1ngzHi4qBw08Grr3l01vDBSboylfs4NPlG/ifAitnC87XfHNqBxqgFdERyK
         BlvPkBo0DK8qT/WSP9QiqUqEgyybID9+5AVD7UHfJNVh4JmXCxb716YP0RmmWrFjfg0/
         pkavpbZA4pSPy/DwyfeHw3dk1G0FCMJMkdX1X+TbnK495dlY0/YabMVeNfqM0cBwjRbT
         MQxHDVTJwn8JET+7cinHWVvg9paRy4JXgKezFrIKdZWWxBq68fQODgGWd/gyItMTe0ui
         pljQ==
X-Gm-Message-State: AOJu0YwwNW+csURVwlJIb1osH/V3EgXE2rFd9hSYGYZyow2nvTGuHo9F
	ZUkiDi6npogQzgCQKA1EQkA/f0tHYh0peTvSTUHPb3ZtasyGSWAv2AOtq2VmmxVvvwHAcsf8StI
	uWnZb
X-Gm-Gg: ASbGncu+lrVFja9nwZ06oKEv1JrPyDl1dD4jGakoGcnb3NPKxbE0vsb3tZNheHSiQzK
	JR2k6GJTUYEwmwhRJLdMe2Lw8cp2R8sV5MrOWXhq5MtfDMMUYXAIy19Ow+Ss0zRruQC7dkO9xfJ
	oKLUKef6zwmfvELTwJFYplIryDJ1/QleZMe1W7Q+jO936SlIMY3ktzS2MkfpB4wkNIMnvYD1yrA
	luRF/bnUEZ/whSHyMkhnzaB4g3ftmY4zAIglOfpF8fYO2lCb8KthceykwXFF99EfEjs1OfcCt1h
	PJxm4Vjm7P1HF2uTE8fcFCSpyDoHEHtMqWbaXG08Q5UO/MAyKEGWx8wZRVm6apR5tFKpwnmOtdg
	zaDC7P/5IyJJupHZ6V+5rCQ0dXP6LphwJayE3XmIhwrU=
X-Google-Smtp-Source: AGHT+IGmZL7eMJJpCPJWObn1Yy6G+m1VK1/zgEaEG73s+XWM7Nji8e741yt0yhW7T1SMkXOIG8w6mg==
X-Received: by 2002:a05:6a00:1789:b0:772:45ee:9ba6 with SMTP id d2e1a72fcca58-77bf71d4dbcmr4062795b3a.8.1758139499918;
        Wed, 17 Sep 2025 13:04:59 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3ed6:a4e8:9109:79e1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb79b81sm247452b3a.10.2025.09.17.13.04.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 13:04:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/8] Patch review
Date: Wed, 17 Sep 2025 13:04:37 -0700
Message-ID: <cover.1758139278.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 20:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223615

Please review this set of changes for scarthgap and have comments back by
end of day Friday, Spetember 19

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2395

The following changes since commit baa5e7ea5f37f54c2a00080798ad7fb4c0664f69:

  pulseaudio: Add audio group explicitly (2025-09-02 09:27:13 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Divya Chellam (1):
  wpa-supplicant: fix CVE-2022-37660

Haixiao Yan (1):
  buildtools-tarball: fix unbound variable issues under 'set -u'

Jinfeng Wang (1):
  systemtap: Fix task_work_cancel build

Libo Chen (1):
  runqemu: fix special characters bug

Martin Jansa (1):
  license.py: avoid deprecated ast.Str

Ross Burton (1):
  grub2: fix CVE-2024-56738

Vijay Anusuri (2):
  cups: upgrade 2.4.10 -> 2.4.11
  cups: Fix for CVE-2025-58060 and CVE-2025-58364

 meta/lib/oe/license.py                        |   4 +-
 .../grub/files/CVE-2024-56738.patch           |  75 ++
 meta/recipes-bsp/grub/grub2.inc               |   1 +
 .../openssl/files/environment.d-openssl.sh    |  24 +-
 .../wpa-supplicant/CVE-2022-37660-0001.patch  | 254 +++++
 .../wpa-supplicant/CVE-2022-37660-0002.patch  | 139 +++
 .../wpa-supplicant/CVE-2022-37660-0003.patch  | 196 ++++
 .../wpa-supplicant/CVE-2022-37660-0004.patch  | 941 ++++++++++++++++++
 .../wpa-supplicant/CVE-2022-37660-0005.patch  | 144 +++
 .../wpa-supplicant/wpa-supplicant_2.10.bb     |   5 +
 .../git/git/environment.d-git.sh              |   8 +-
 .../environment.d-python3-requests.sh         |   4 +-
 meta/recipes-extended/cups/cups.inc           |   9 +-
 .../cups/0001-use-echo-only-in-init.patch     |   2 +-
 ...-don-t-try-to-run-generated-binaries.patch |   2 +-
 ...-fix-multilib-install-file-conflicts.patch |   6 +-
 .../cups/cups/CVE-2024-47175-1.patch          |  73 --
 .../cups/cups/CVE-2024-47175-2.patch          | 151 ---
 .../cups/cups/CVE-2024-47175-3.patch          | 119 ---
 .../cups/cups/CVE-2024-47175-4.patch          | 249 -----
 .../cups/cups/CVE-2024-47175-5.patch          |  40 -
 .../cups/cups/CVE-2025-58060.patch            |  60 ++
 .../cups/cups/CVE-2025-58364.patch            |  61 ++
 .../cups/cups/libexecdir.patch                |   5 +-
 .../cups/{cups_2.4.10.bb => cups_2.4.11.bb}   |   2 +-
 ...sk_work-compatible-with-6.11-kernels.patch | 103 ++
 .../recipes-kernel/systemtap/systemtap_git.bb |   1 +
 .../curl/curl/environment.d-curl.sh           |   8 +-
 scripts/runqemu                               |   7 +-
 29 files changed, 2019 insertions(+), 674 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-56738.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0001.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0002.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0003.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0004.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0005.patch
 delete mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch
 delete mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-2.patch
 delete mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch
 delete mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch
 delete mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-5.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2025-58060.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2025-58364.patch
 rename meta/recipes-extended/cups/{cups_2.4.10.bb => cups_2.4.11.bb} (51%)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Make-stp_task_work-compatible-with-6.11-kernels.patch

-- 
2.43.0


