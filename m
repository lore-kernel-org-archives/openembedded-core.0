Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51554CA0EEB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:08:05 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.3381.1755634082247164619
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 13:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CK5GqYWY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e2eb9ae80so4572887b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755634081; x=1756238881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IjyB6ADeX00U5KxAGLA5MZads9+4m6WMBErZrXuZ+kQ=;
        b=CK5GqYWY+Q5E0FRZBHqB2ae2ShwNYzoFSe0C4ULm6VVHT/Kt75Bt+C66L0ROboXuh9
         hY/GEuUzpT76Y3ey+xy9Tqabdfx7KpRikkN3PE/ShBZEEuiRR8bOLYaS9xw4CiKgns20
         Plw+w75roDcVG0nr+8R4lj3XovPxlkMfwXipfjQJrAXQSzH57Y4IPAzOBm4Cy8FaLRJl
         YumF4eAb76PLfDEr3V/SuklP804jrGn7pI6B9HFXd1kAi6f+ysm6pPfjPzTEMXsNxDvR
         ZE2m/sVXh8m2cumGRHzFxLcpOupyMxyPioU4jas0oKkZBBaEsMZHNNMK0p/8hQZ9p1S+
         x4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755634081; x=1756238881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IjyB6ADeX00U5KxAGLA5MZads9+4m6WMBErZrXuZ+kQ=;
        b=WdKtP2b2TKTUTDR1zCvNODeMpN9ZL5hv40vB+gtSzbGgtbOClBx6DbH2G/YeX+SV2D
         ZANnzmPQb6I9TsOrKI2LU6Bs81r0cJMwvhKlL6W4tFqITVtQ+69o8JGzLqsybBGMhcps
         XAnn7ZfH0vTeWA5rJYQS7u+6lVqpn8pdTLYRISATDL04HCckjrfAV7vwpeb3I6fsrUN4
         RhDyYW0DZhUL7MNXpvcOcYBmeCq3xTQimS5SXGTnmUvR3BuNnHHwDrcjSJvpb/+2uTls
         x8vIwkVpp3OPDYQJiaWa6glgHcsKbPxuoYihSRrnD7kZ9kwrWaEDaFynyXXrMyMD/VTU
         m/VQ==
X-Gm-Message-State: AOJu0YyrIDbmhzwODZiFNcWInGVU8zbyRfadXU7YPkYru4CUgQ6HxHhV
	xOyHvAGf6lnbESwghsIBpd+UeZU0L/u9on+EwFDUFbQ0y/PtHblwbUxcjoktYR/IEA0zHi7D/8O
	AAMAW
X-Gm-Gg: ASbGncsSw06iZuPYfEuQdHv9YoYihDZiavrs19VPYB57K/W4XrMPARyFb082nh0Xx8q
	SflOlfKu/lDjeC9VGLX9YqPFXh/WceN5mngjwN0zuGCcwXHKk9GSKFEzCA04O3z+1Tyb/qfXOzT
	27Rp0CAf/bPtDK9bZmFDeWBF6NgqVSk2IjHedfuv4e3u85mIH0ni8TcRlRMCeIDCPyflAbIeMXZ
	Hf1Kqn5Y0i7NfkDx4ZnUY9plG0XHvO4VNuIcms69S0JIMiGRscb+xY29KHqkLIuBYGV5B1BTqH+
	ZOvl9IXWDzsME7hjjzQHqXX9z6gg3+GIiJqBKAt/1/6a6umcufET/J3MY35dzD7mds7cdAThV3y
	FnVNr7FDPXk/pK7AJQ3ivbepZ
X-Google-Smtp-Source: AGHT+IG1vi/8Y6RaodnekV8JbWRcCDalRvKQdRct5luD2rZIQ0NEOUQa/9ZJZeIoRoPx67LIe1VF3Q==
X-Received: by 2002:a05:6a00:b45:b0:76e:7aee:35f2 with SMTP id d2e1a72fcca58-76e8ddb229fmr482625b3a.30.1755634081283;
        Tue, 19 Aug 2025 13:08:01 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f07e:6fcf:4f52:4db2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdd6sm3348855b3a.29.2025.08.19.13.07.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:08:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/10] Patch review
Date: Tue, 19 Aug 2025 13:07:43 -0700
Message-ID: <cover.1755633925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 20:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222127

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, August 21

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/2234

The following changes since commit fa45d6d5bec8fe503ff6b9166a3b4af31ea95369:

  go-helloworld: fix license (2025-08-14 07:34:07 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Daniel Turull (2):
  xz: ignore CVE-2024-47611
  libxml2: ignore CVE-2025-8732

Khem Raj (3):
  e2fsprogs: Fix build failure with gcc 15
  parted: Fix build with GCC 15
  bash: Stick to C17 std

Martin Jansa (2):
  cairo: fix build with gcc-15 on host
  bash: use -std=gnu17 also for native CFLAGS

Peter Marko (2):
  dropbear: patch CVE-2025-47203
  glib-2.0: ignore CVE-2025-4056

Philip Lorenz (1):
  cve-check: Add missing call to exit_if_errors

 meta/classes/cve-check.bbclass                |   1 +
 ...iable-with-DROPBEAR_CLI_PUBKEY_AUTH-.patch |  27 ++
 ...-length-paths-and-commands-in-multih.patch |  63 +++
 ...and-also-forward-this-when-multihop-.patch |  81 ++++
 ...add-missing-DROPBEAR_CLI_PUBKEY_AUTH.patch |  29 ++
 .../dropbear/dropbear/CVE-2025-47203.patch    | 367 ++++++++++++++++++
 .../recipes-core/dropbear/dropbear_2022.83.bb |   5 +
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   2 +
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |   4 +
 ...-libext2fs-fix-std-c23-build-failure.patch |  42 ++
 .../e2fsprogs/e2fsprogs_1.47.0.bb             |   1 +
 meta/recipes-extended/bash/bash_5.2.21.bb     |   5 +
 ...CH-parted-fix-do_version-declaration.patch |  40 ++
 meta/recipes-extended/parted/parted_3.6.bb    |   1 +
 meta/recipes-extended/xz/xz_5.4.7.bb          |   2 +
 .../cairo/cairo/0001-Require-C11.patch        |  25 ++
 .../cairo/cairo/0002-Meson-Require-C-11.patch |  22 ++
 meta/recipes-graphics/cairo/cairo_1.18.0.bb   |   2 +
 18 files changed, 719 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/0001-Avoid-unused-variable-with-DROPBEAR_CLI_PUBKEY_AUTH-.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/0001-Handle-arbitrary-length-paths-and-commands-in-multih.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/0001-add-o-BatchMode-and-also-forward-this-when-multihop-.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/0001-cli-runopts.c-add-missing-DROPBEAR_CLI_PUBKEY_AUTH.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-47203.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch
 create mode 100644 meta/recipes-extended/parted/files/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
 create mode 100644 meta/recipes-graphics/cairo/cairo/0001-Require-C11.patch
 create mode 100644 meta/recipes-graphics/cairo/cairo/0002-Meson-Require-C-11.patch

-- 
2.43.0


