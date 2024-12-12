Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40AB8E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 14:08:11 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.20311.1734012485548904854
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 06:08:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xJmHfdJa;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2167141dfa1so5850375ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734012485; x=1734617285; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vJVubPcgOL+RGJy+vCZNZt1vdjFk3rtK5Wb7kD5gMVo=;
        b=xJmHfdJaqWhoK6MwiDgA6BlLCBlrysJWHOJS2c3HoQITQjOiF0Rg80WH0PFSkuZlNa
         hqsd1w6QlQ3tf+LLomd5SYcdGjocOTy/8/p+A3wijrSZckfjD5qpb4j0+53sGEkxRUbT
         1cv/7bkoVKTZSgvr22I6mVH4gpw2uTAriqqa7emrRI0YYtuER5K7gAG5gzu6yskE3HHg
         HkwxHBccuEsnLLFnSB70qDzNtYBPdjCS6+jFBgkmQNSb/8FvFtwnCnS1X0T1Iv6Y2TSs
         XR0bfXbFZlVa66hc0ZJBs3Boinpnl3mR4lrX3ppD2QLWEONvMHqe+lB0GwrMU9H2DQse
         8XIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734012485; x=1734617285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vJVubPcgOL+RGJy+vCZNZt1vdjFk3rtK5Wb7kD5gMVo=;
        b=ulK6H2il3NIq4d2rRpW66DUGrh8gyaRwwNwDpSUgzNzkuVym7eE71EPxAQPUmwMTVG
         pDAc4ZIgWZPJKfSw99HNoIGjK2lOGiFqrpHh1tYNTW9RIcou/SlEM5nwDrvsxIQ42/JF
         bInSbljKOOtFeo601udPkuF8YdPdQpVKAl9eXkPkzHQMj6oAj5Bm5AQ89KAz45DbakMu
         3BOXSIUrIMCrNgenQQrBhGtHHJrsOffnlOTtg6MBtzh5l1E1tOK4gnmYZo/VFHz+hJOz
         /n2HziVBnQ5rtQz9WNRsGl4xkWbM4jQQLm2kmlYiVkVIXXwpDIl3Hq8D7tupvR+fDkA9
         bsnQ==
X-Gm-Message-State: AOJu0Yz8Z6vhOOYvOqpdBS724YXAd1VmjydYjk6pQ5lKt7cpsdSl5VY+
	nOY677kt3PsPggHOwAFOxiHIYP34Ymfc1zQ/CVI0nqVaXLiNHmUKU3unOG4jJB67fk7tbf/dPRD
	P
X-Gm-Gg: ASbGncsS13wO+923nR85/X1fnTCX42Wl8yO9IFnPkmj5ehi+r94ilKFEIkiDj5VcVZ9
	BNK907J9MYid4CxTAWlP4Jca5n7fOkJZw2ItfovgVMzFqgXsfHrB5YAYkm9qacx2BbzNpazWcLZ
	6YCJwrk0usyWmVrxY/3k0kdNZjnefO0UuepSvGcwvMrelLDYYyNuPhemT5NNWyEUXr+nbguQIqV
	DTxyY9LcejLduW6haYEoBgNk4dqEjVm7VOj2LbPuUK2Gw==
X-Google-Smtp-Source: AGHT+IG5N6ij9nz8z2hTthObzOGckJOQS2icQ+N40KtLDQ2mIgepHgngmXHsLgQnYPRS+lmyotlsfA==
X-Received: by 2002:a17:902:db02:b0:215:58be:334e with SMTP id d9443c01a7336-2178c8384ccmr58466745ad.10.1734012484680;
        Thu, 12 Dec 2024 06:08:04 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21630fee27bsm88847705ad.269.2024.12.12.06.08.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 06:08:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 00/12] Patch review
Date: Thu, 12 Dec 2024 06:07:46 -0800
Message-Id: <cover.1734012352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 14:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208634

Please review this set of changes for styhead and have comments back by
end of day Monday, December 16

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/628

The following changes since commit 8717a2e2161378bab4e27d515a71396b2a6bcf00:

  resulttool: Improve repo layout for oeselftest results (2024-12-04 07:21:02 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/styhead-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/styhead-nut

Guðni Már Gilbert (4):
  systemd: drop intltool-native from DEPENDS
  systemd-boot: drop intltool-native from DEPENDS
  python3-poetry-core: drop python3-six from RDEPENDS
  dnf: drop python3-iniparse from DEPENDS and RDEPENDS

Hitendra Prajapati (2):
  libarchive: fix CVE-2024-48957 & CVE-2024-48958
  ghostscript: upgrade 10.03.1 -> 10.04.0

Peter Marko (4):
  builder: set CVE_PRODUCT
  qemu: patch CVE-2024-6505
  rust: ignore CVE-2024-43402
  curl: patch CVE-2024-9681

Ross Burton (1):
  libsndfile1: backport the fix for CVE-2024-50612

Sid-Ali (1):
  shadow: use update-alternatives to handle su.1 and nologin.8

 .../systemd/systemd-boot_256.5.bb             |   2 +-
 meta/recipes-core/systemd/systemd_256.5.bb    |   2 +-
 meta/recipes-devtools/dnf/dnf_4.21.1.bb       |   3 +-
 .../python/python3-poetry-core_1.9.0.bb       |   1 -
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2024-6505.patch             |  40 ++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 .../avoid-host-contamination.patch            |   6 +-
 ...ript_10.03.1.bb => ghostscript_10.04.0.bb} |   2 +-
 .../libarchive/CVE-2024-48957.patch           |  36 ++
 .../libarchive/CVE-2024-48958.patch           |  40 ++
 .../libarchive/libarchive_3.7.4.bb            |   5 +-
 meta/recipes-extended/shadow/shadow.inc       |   4 +-
 meta/recipes-graphics/builder/builder_0.1.bb  |   3 +-
 .../libsndfile1/CVE-2024-50612.patch          | 409 ++++++++++++++++++
 .../libsndfile/libsndfile1_1.2.2.bb           |   1 +
 .../curl/curl/CVE-2024-9681.patch             |  85 ++++
 meta/recipes-support/curl/curl_8.9.1.bb       |   1 +
 18 files changed, 630 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-6505.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_10.03.1.bb => ghostscript_10.04.0.bb} (97%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50612.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-9681.patch

-- 
2.34.1


