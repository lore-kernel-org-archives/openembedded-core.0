Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD72C7EE43
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 16:02:57 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.38994.1686499373756664266
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 09:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=x2LBlB+A;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b3afd2f9bdso5436995ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 09:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686499373; x=1689091373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n6ClvgQapIKS1jF9UV6414k3mz8ORNc7/+jcQimbAbs=;
        b=x2LBlB+AMithLAgDhe8A6kSYVCPYV10QhSMalT5N/Q46YxVyrXSQgAbdcIF/mNuOgA
         +qGF91uJYgugbAb13PIloaoHDvOja5FDnh4x3/4gJvRe3mVtLp97bRiEHgfabZFLLJpa
         vjOZS7RDdqZ3updYd6O13Bthd5ObkHGFhbloWVf+XcKmMXkbCZmgXRa5FXywRlpIK01e
         mckFfiWfzbJJZd5OCUF6LRy5dvieFDfkZ4ddS/ql/qikjDZXyh9iGfkDi5ezwnGWI4yo
         pH0FSumx1+lDUEUzBFebgpidSEoZVwo1Mxn9sOv0rMN+YqcjgF/JkERI9fBS9BaDEMAY
         0XSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686499373; x=1689091373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n6ClvgQapIKS1jF9UV6414k3mz8ORNc7/+jcQimbAbs=;
        b=EleZqGZnhXIElzHvQel1G1wCHqCZP78NbXOwcvjIA+P0SIzoY6UNaJaOxu6NkAr0Fd
         CXnblDpKE6p9/Yg2KjIQZO8U6QK3nA/rImsHoTz/Kb59CBUToaSjBdY6xChOAyFiT6yc
         WDhrtVgsaTu/I46JWcpmoBFkKSgCzCXWOlOlCyVIKThji5ptZyFrq3pUucV4p2xWHREa
         XRjYy5ni2zRyczkf1DH1eOoOGWINBlnkCVLvLpWSn620gFNSTglNR77SYeDWclNjH30D
         suOffdh/hh54om0dnYmGyI1y8dDV4HzYEqiyxScHnCqLfGKUOxEqfn46grauR0/vrXmn
         k9qw==
X-Gm-Message-State: AC+VfDySarbHifgCk0UEa32CZolvGfQYXalvfWH2dZFMR4n6xdTql/sI
	5D2KkOLOg3S1l6f2u7CyzrPdBAnXE6JFJSxOq3c=
X-Google-Smtp-Source: ACHHUZ5pEnSB1wNRPhgtkmUP1c8QSymlLHCp/GW/IVTwoCM0sikrywRZzl4dIo3JANlr/HoHPA2HqQ==
X-Received: by 2002:a17:903:124f:b0:1b0:3a74:7fc4 with SMTP id u15-20020a170903124f00b001b03a747fc4mr5595507plh.24.1686499372561;
        Sun, 11 Jun 2023 09:02:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ix4-20020a170902f80400b001b3d20ef257sm113378plb.97.2023.06.11.09.02.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 09:02:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/11] Patch review
Date: Sun, 11 Jun 2023 06:02:33 -1000
Message-Id: <cover.1686499221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 16:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182622

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5438

The following changes since commit 717b9f18a51e9c9fd5a471238aa2ea4de439ef17:

  kernel-devicetree: recursively search for dtbs (2023-05-30 04:06:12 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

C. Andy Martin (1):
  systemd-networkd: backport fix for rm unmanaged wifi

Hitendra Prajapati (1):
  sysstat: Fix CVE-2023-33204

Michael Halstead (2):
  uninative: Upgrade to 3.10 to support gcc 13
  uninative: Upgrade to 4.0 to include latest gcc 13.1.1

Narpat Mali (1):
  python3-requests: fix for CVE-2023-32681

Omkar Patil (1):
  curl: Correction for CVE-2023-27536

Peter Marko (1):
  openssl: Upgrade 3.0.8 -> 3.0.9

Richard Purdie (1):
  selftest/reproducible: Allow native/cross reuse in test

Riyaz Khan (1):
  openssh: Remove BSD-4-clause contents completely from codebase

Soumya (1):
  perl: fix CVE-2023-31484

Vivek Kumbhar (1):
  go: fix CVE-2023-24539 html/template improper sanitization of CSS
    values

 meta/conf/distro/include/yocto-uninative.inc  |   8 +-
 meta/lib/oeqa/selftest/cases/reproducible.py  |   4 +-
 ...401bdd77ca54be6867a154cc01e0d72612e0.patch | 984 ++++++++++++++++++
 .../openssh/openssh_8.9p1.bb                  |   1 +
 ...1-Configure-do-not-tweak-mips-cflags.patch |   2 +-
 .../openssl/openssl/CVE-2023-0464.patch       | 225 ----
 .../openssl/openssl/CVE-2023-0465.patch       |  56 -
 .../openssl/openssl/CVE-2023-0466.patch       |  50 -
 .../{openssl_3.0.8.bb => openssl_3.0.9.bb}    |   5 +-
 ...nly-managed-configs-on-reconfigure-o.patch | 358 +++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |   1 +
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2023-24539.patch           |  53 +
 .../perl/files/CVE-2023-31484.patch           |  29 +
 meta/recipes-devtools/perl/perl_5.34.1.bb     |   1 +
 .../python3-requests/CVE-2023-32681.patch     |  63 ++
 .../python/python3-requests_2.27.1.bb         |   2 +
 .../sysstat/sysstat/CVE-2023-33204.patch      |  80 ++
 .../sysstat/sysstat_12.4.5.bb                 |   5 +-
 .../curl/curl/CVE-2023-27536.patch            |   3 +-
 20 files changed, 1586 insertions(+), 345 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/7280401bdd77ca54be6867a154cc01e0d72612e0.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0465.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.0.8.bb => openssl_3.0.9.bb} (97%)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-network-remove-only-managed-configs-on-reconfigure-o.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-24539.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31484.patch
 create mode 100644 meta/recipes-devtools/python/python3-requests/CVE-2023-32681.patch
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch

-- 
2.34.1


