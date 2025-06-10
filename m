Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F7BC61DB2
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:34:29 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.95763.1749584066016526504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=C4DgEeDl;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2350fc2591dso1781125ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584065; x=1750188865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qHG39ZXP6Qj0DnPtbDNR4fdajX5oZYJU8AmigzbhPFc=;
        b=C4DgEeDl7exKpm4uAK4EfVBkrHgmi2OErhY2s/AQktY5etZQ8Ydi8xdil682NLYuMm
         f8mscw5H6wENEojv5iXYVdLHxHX2biTeDsRZp6KiOW7uZmKAkSmwHjLdN3Ehbs7Ol8Ew
         grp34YkQr66REjxBy47RTp5G+3Wta6zgNkylpBWQMVvxHbaIloT2Q5BvtkmtDvX0xHJy
         cXzwMkPeQG98mxRCR2RaqSZ7pXqB/sO/ekWamn1kQ51kn/mZjGVOCITLn1z44zi4X7xB
         1LRc8cGOvPPltmVu5aUZwl4Sk5hpLkHNeEcceWd5e4kMXQZgg+FJvok1LWbrClRyJ8jl
         xQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584065; x=1750188865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHG39ZXP6Qj0DnPtbDNR4fdajX5oZYJU8AmigzbhPFc=;
        b=qDDhFCfsxFxyIaCGLqFERLgkVIW3c0jBMcJyIXmIroIc4V/m/yGIGOQVggu5T1ceT4
         uyCaUz0aYGqJaF6eRPtQe0tcG7r4hKcoejILBQtnzg4JHtXPfdupQBVqiqbhg95MVMQm
         cdnl2CGcBy/e8Y3NzHZFunOM7lf4CML6LM8gUXlpUioAmXbuesvkq92oGR1igdE2sZVL
         i39G8qVG/xSNbnB2pLH57T9Y/CQ3+t5wRtT3eqe+F+zYMH2is8i4GTTfG+nXM629B04P
         Eqk2A5gbfNUHv6mjrWKkQif6KCdQr4pC5J2wuZGqgtHg9GofP0Osd30VPjaEAAiywL+0
         d7DQ==
X-Gm-Message-State: AOJu0YwBNmWrikXR1mKLIth9wwwU0JIYTPNwJ+ZqEemp6lFoZ/F78huz
	TqNr+sZpJVrcnQZ0UtCALBlhaQHAObaeW6jJ3BVqAKpW/GT6KfZ343CVw5uoskpTg31u+oDQ+32
	wJZCe
X-Gm-Gg: ASbGnctSS6CaT4l5fxYZk/cj2sL6LGX2BWKE4Fno2gvgtyx2xcIDCMbgQKUiDR4mFCe
	9ixXItf0gGkS4HtHmgea18kyh0jTTRx0a7TozhVyiOSnJsUo3S/aMtqfD0Klu8M1ZneYWJwbMRV
	cDS7hcMkw0s30vIt7xV0FYywsUujkLpC9YoBYv7C+gyVfV+XQ1Ua/WDYLwVsRJhM/cdx7JLwYIM
	WQ//HLv1SZ+YokYJruYgoyg9QCeNASlcaEFW7NefAJBXMMm6fo3o9ch+nqD0hTl+V84p5aKwgTZ
	iHI8IXv0EJ8osBoZEpXKFPVPRIgioMptMEwkMIVyT57WDNVHjKFRyQ==
X-Google-Smtp-Source: AGHT+IESIiA8u6md2EoOQKQb/fEyTlyzr3JQtJunPiF1f0xtv/Yl+PHqrXNeLOgqrKJhSrD3WICRHw==
X-Received: by 2002:a17:903:1b63:b0:234:b3fb:8ed with SMTP id d9443c01a7336-2364169ef21mr8726055ad.1.1749584063824;
        Tue, 10 Jun 2025 12:34:23 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b10c7a88sm73897a91.33.2025.06.10.12.34.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:34:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/16] Patch review
Date: Tue, 10 Jun 2025 12:33:55 -0700
Message-ID: <cover.1749583904.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:34:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218405

Please review this set of changes for scarthgap and have comments back by
end of day Friday, June 12

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1777

The following changes since commit 29e623b2ad00555788412fa520fbb9ffec794cbb:

  systemd: upgrade 255.18 -> 255.21 (2025-06-05 09:11:42 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Andrew Fernandes (1):
  gtk+: add missing libdrm dependency

Changqing Li (12):
  libsoup-2.4: fix CVE-2025-32052
  libsoup: fix CVE-2025-32052
  libsoup: fix CVE-2025-32051
  libsoup-2.4: fix CVE-2025-32050
  libsoup: fix CVE-2025-32050
  libsoup-2.4: fix CVE-2025-46421
  libsoup: fix CVE-2025-46421
  libsoup-2.4: fix CVE-2025-4948
  libsoup: fix CVE-2025-4948
  libsoup-2.4: fix CVE-2025-4476
  libsoup-2.4: fix CVE-2025-2784
  libsoup: fix CVE-2025-2784

Peter Marko (2):
  python3: upgrade 3.12.9 -> 3.12.11
  testimage: get real os-release file

Vijay Anusuri (1):
  kea: upgrade 2.4.1 -> 2.4.2

 meta/classes-recipe/testimage.bbclass         |   4 +-
 .../kea/{kea_2.4.1.bb => kea_2.4.2.bb}        |   4 +-
 ...shebang-overflow-on-python-config.py.patch |   2 +-
 ...-use-prefix-value-from-build-configu.patch |   2 +-
 ...sts-due-to-load-variability-on-YP-AB.patch |   6 +-
 ...001-ctypes-correct-gcc-check-in-test.patch |  53 -------
 ...e-treat-overflow-in-UID-GID-as-failu.patch |   2 +-
 ..._fileno-test-due-to-load-variability.patch |   2 +-
 ...orlines-skip-due-to-load-variability.patch |   2 +-
 .../python/python3/makerace.patch             |   2 +-
 .../{python3_3.12.9.bb => python3_3.12.11.bb} |   3 +-
 meta/recipes-gnome/gtk+/gtk4_4.14.1.bb        |   1 +
 .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 +++++++
 .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 ++++
 .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 ++++
 .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 +++++
 .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  47 ++++++
 .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 +++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   6 +
 .../libsoup/libsoup-3.4.4/CVE-2025-2784.patch | 137 +++++++++++++++++
 .../libsoup-3.4.4/CVE-2025-32050.patch        |  29 ++++
 .../libsoup-3.4.4/CVE-2025-32051-1.patch      |  29 ++++
 .../libsoup-3.4.4/CVE-2025-32051-2.patch      |  57 +++++++
 .../libsoup-3.4.4/CVE-2025-32052.patch        |  31 ++++
 .../libsoup-3.4.4/CVE-2025-46421.patch        | 139 ++++++++++++++++++
 .../libsoup/libsoup-3.4.4/CVE-2025-4948.patch |  97 ++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   7 +
 27 files changed, 788 insertions(+), 67 deletions(-)
 rename meta/recipes-connectivity/kea/{kea_2.4.1.bb => kea_2.4.2.bb} (94%)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-ctypes-correct-gcc-check-in-test.patch
 rename meta/recipes-devtools/python/{python3_3.12.9.bb => python3_3.12.11.bb} (99%)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-2784.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32050.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32051-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32051-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32052.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-46421.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4948.patch

-- 
2.43.0


