Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7806DC433FE
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 16:04:02 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.17564.1667750641776044634
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 08:04:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=8NfiEBA7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso8307705pjc.5
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 08:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4G/1a0n1Zlo9lGNM+Ws5zeIwCu8cmLSCZ4b3M76XYOo=;
        b=8NfiEBA7DOtn8EIQrh7DF81BCHW7Hx4ln++Lx5EZbLwWE4wEIaBYrlncsl5mjp00Cp
         4idezxTF2MRdDRi1xyXZYSeKN/cLU5QZO6cneUGzOVyApdUynXQlcgu82QBzJl5iB5PW
         URh63t8wp0m3AoSBVJaUG9Jx9+ZTCkAOFb30RdN+bV2M0m+j0cKdpmkHNrw+a6+KFF+j
         j7pzbxklD/1pgwhYLcUZYrVyTDzf8Ba2P0ck6DqyD24r6pV6KW3d7rTwnIpmQ89BdSF5
         uUXnBNKu89FXWRiNcOgqxELG1qeFmOv4DwYpDI5HagNpqK50BZ9cC3RkDZ0kSP7sFkdU
         c2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4G/1a0n1Zlo9lGNM+Ws5zeIwCu8cmLSCZ4b3M76XYOo=;
        b=7sqJ2arNe6a6BzVFsupGsKfBtF1dNmHmcIvpX82XzwReGanyHmNhPGaJaMFn8InaSX
         GjS2AYdrGWhEan6dypZ/MUF6BggQR71AJKqi7ajBGxrsSCmrEK7OVTHBjCsSYVRfpK/A
         Pba798ZFSEDNre2ejit4GBeDE4dgWIfVEp6u49VieTPT7P0eBN8ksoQ8LqHDbhCq2Vs0
         XcmQcvfFGsMOB3JPB6XrGY/EMuxKJz+K57RRVHPUuUglkDD1i+E6thMQPYNNVQrp1QEp
         tndwH2QJWF/f8WBKICWzLqxwU1e5d3hNO7eOiapnoTZhFOlkOBVlIhiJ5VtqlpMO144H
         vtpA==
X-Gm-Message-State: ACrzQf2PXxEEf0XhYRklwzvysKRgUmeQ6OMEJGwEptu2YMRnBSa+CLV8
	acJ8BA4AqHBR5QcYMgaJyFOVMTmzwhx/JwaB
X-Google-Smtp-Source: AMsMyM5t2mOkTQX71gs8kLoKwr2JEfO56J8BJCFghZZi4aVjlVoFRVAsa2hicAWThn8Zn013XKDE3A==
X-Received: by 2002:a17:90a:2847:b0:213:9ae5:b9b4 with SMTP id p7-20020a17090a284700b002139ae5b9b4mr50874358pjf.136.1667750640772;
        Sun, 06 Nov 2022 08:04:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s11-20020a170902ea0b00b0018700ba9090sm3294683plg.185.2022.11.06.08.03.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 08:04:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/8] Patch review
Date: Sun,  6 Nov 2022 06:03:45 -1000
Message-Id: <cover.1667750511.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 16:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172806

Please review this set of patches for dunfell and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4435

The following changes since commit 54bbfe94ae4514386c572564bf221edfdbb2ce38:

  selftest: skip virgl test on all Alma Linux (2022-10-21 06:28:52 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (1):
  tzdata: update to 2022d

Bartosz Golaszewski (1):
  bluez5: add dbus to RDEPENDS

Daniel McGregor (1):
  coreutils: add openssl PACKAGECONFIG

Frank de Brabander (1):
  cve-update-db-native: add timeout to urlopen() calls

Hitendra Prajapati (2):
  golang: CVE-2022-2880 ReverseProxy should not forward unparseable
    query parameters
  libX11: CVE-2022-3554 Fix memory leak

Ranjitsinh Rathod (1):
  expat: Fix CVE-2022-43680 for expat

Teoh Jay Shen (1):
  vim: Upgrade 9.0.0598 -> 9.0.0614

 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 meta/recipes-core/coreutils/coreutils_8.31.bb |   1 +
 .../expat/expat/CVE-2022-43680.patch          |  33 ++++
 meta/recipes-core/expat/expat_2.2.9.bb        |   1 +
 .../recipes-core/meta/cve-update-db-native.bb |   9 +-
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-2880.patch            | 164 ++++++++++++++++++
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../xorg-lib/libx11/CVE-2022-3554.patch       |  58 +++++++
 .../recipes-graphics/xorg-lib/libx11_1.6.9.bb |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 11 files changed, 272 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-43680.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-2880.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3554.patch

-- 
2.25.1


