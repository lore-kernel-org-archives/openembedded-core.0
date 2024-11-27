Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806FBD66BB4
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 04:11:47 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.64658.1732680704438508623
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 20:11:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YMGh4776;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-724f42c1c38so3369795b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 20:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732680704; x=1733285504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=leygUT2LtvPW5c+2Kpc+dQXoZucfmMiveH3azC8AOz4=;
        b=YMGh4776DIXUNn97A/guM4n1SPtMfhcmoXsnbgqq71JLwBN1ieQzy/oOIBQDs2IvvH
         6tvR9TWQcIDThqfwuODcdbizYuH9tg4yDWKm6VJj+CoS9NdUi5BLsMxOZzZ73gMh+Q1q
         XiefofgzftnLloQef3EznSY6Ro5Sp7ToZ+NiSweaJI+UMU62+HbxCGAFYTeAy+l2vSxX
         YGauZhiYn7TK10ztjOz5jdp5IrArmcSgsXRT+4uHU11DwgWmMLrN8JPuED5tdMZCzNhD
         3wx2DmuyDcZNQ0ntU9mzsYR7s76+Yi1syXnTWiEpkkVFUpUxfXns8i+wI0RftWRGarvj
         9hgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732680704; x=1733285504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=leygUT2LtvPW5c+2Kpc+dQXoZucfmMiveH3azC8AOz4=;
        b=BBYJXQO2u/yRBrBX5dztZP99ra7PzwtOBa63TLVMcdONrhttfX8pBk5q57q7UG2dn7
         MF6oCA89vhTVIVhmEp7+e1Xk9dw/LFhFOe+dQQSXOQM2a1WmKz4c1jsHVYk8pVQvxQ/2
         XTMzDJr4sKlPtGYEI77/OXo4C0xE7CXNHNHVSva63sMGeWeqhbIic2puaaWp6jC7bXbR
         BpjGOwx88qXnoRBJ+qBkVVaDHfVTKvwSMSSPmPgdgOJvpuSjFxtWGRWlnw+wLowaEJCl
         1qS1BHEAXqStPsbrBeUzFvprgrzh1IE7TwG6TlMV7l4Dut+g7udOYvW8f62A06/x6TMe
         2cwA==
X-Gm-Message-State: AOJu0YzWfcjI5KXykWuVwgrUCkKLLCA4o9k+WAB7K0eAvSI6P6Q/Dvv0
	xVA2sUutg0haiWKEH8635dHntLuY3oESnN+BjD0HF0Z0ad9V0ps58qLxde0+0k9eDqWQE8fzrd1
	q
X-Gm-Gg: ASbGncuvup8wJoQngxLqVPTK97JGt13LTPhE0qT51Iy5U3spkNkGy0lb8lLvCff9smT
	h55TEEe951pFJ97nBKETsLXFjq9ZNg23BObjALkxxAoI8OofQiSBNOhyP5wOOsIphUIzqidGaRm
	GKDkRcMw81W1yYADe8PZG2r6DxCzb2y2BgXRJLMg5q7NxbXfhmHlhaogy+2W9dfneomAISRVxnW
	wiIsnWV8qMk7Wl1P1UcxvKNczkuhNIQ1m9vpzY=
X-Google-Smtp-Source: AGHT+IHed+9/U8aJoL+ikZbABU4D/kKuc2+K7rXrhnWxI7Uh7c432sIapSEgdaMrNBzdDyMrlW11SQ==
X-Received: by 2002:a05:6a00:1956:b0:71d:e93e:f542 with SMTP id d2e1a72fcca58-725301740d7mr2297476b3a.21.1732680703438;
        Tue, 26 Nov 2024 20:11:43 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de485c84sm9240796b3a.80.2024.11.26.20.11.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 20:11:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 00/18] Patch review
Date: Tue, 26 Nov 2024 20:11:20 -0800
Message-Id: <cover.1732680538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 04:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207894

Please review this set of changes for styhead and have comments back by
end of day Thursday, November 28

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/532

The following changes since commit 045d50e63bcaf13056ce749c616eecc4d4516958:

  e2fsprogs: removed 'sed -u' option (2024-11-22 05:46:04 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/styhead-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/styhead-nut

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 5.1

Alexander Kanavin (3):
  selftest/sstatetests: run CDN mirror check only once
  package_rpm: use zstd's default compression level
  package_rpm: restrict rpm to 4 threads

Bruce Ashfield (3):
  linux-yocto/6.10: genericarm64.cfg: enable CONFIG_DMA_CMA
  linux-yocto/6.10: cfg: gpio: allow to re-enable the deprecated GPIO
    sysfs interface
  linux-yocto/6.10: bsp/genericarm64: disable ARM64_SME

Chen Qi (1):
  shadow: use update-alternatives to handle groups.1

Jinfeng Wang (1):
  tzdata/tzcode-native: upgrade 2024a -> 2024b

Kai Kang (1):
  kexec-tools: update COMPATIBLE_HOST because of makedumpfile

Markus Volk (1):
  gcc: add a backport patch to fix an issue with tzdata 2024b

Martin Jansa (1):
  ffmpeg: fix packaging examples

Peter Marko (2):
  cve-check: do not skip cve status description after :
  cve-check: fix malformed cve status description with : characters

Richard Purdie (1):
  openssl: Fix SDK environment script to avoid unbound variable

Vijay Anusuri (1):
  xwayland: upgrade 24.1.3 -> 24.1.4

Wang Mingyu (1):
  xwayland: upgrade 24.1.2 -> 24.1.3

Yi Zhao (1):
  systemd: fix broken links for sysvinit-compatible commands

 meta/classes-global/package_rpm.bbclass       |   3 +-
 meta/lib/oe/cve_check.py                      |   4 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py   |   2 -
 .../openssl/files/environment.d-openssl.sh    |   2 +-
 .../packagegroup-core-tools-testapps.bb       |   1 +
 meta/recipes-core/systemd/systemd_256.5.bb    |   6 +-
 meta/recipes-devtools/gcc/gcc-14.2.inc        |   1 +
 ...4fffe3fc82a710bea66ad651720d71c938b8.patch | 549 ++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |   3 +-
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 ...{xwayland_24.1.2.bb => xwayland_24.1.4.bb} |   2 +-
 .../kexec/kexec-tools_2.0.29.bb               |   3 +
 .../linux/linux-yocto-rt_6.10.bb              |   2 +-
 .../linux/linux-yocto-tiny_6.10.bb            |   2 +-
 meta/recipes-kernel/linux/linux-yocto_6.10.bb |   2 +-
 .../recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb |   2 +-
 scripts/install-buildtools                    |   4 +-
 17 files changed, 575 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.2.bb => xwayland_24.1.4.bb} (96%)

-- 
2.34.1


