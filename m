Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6118C678D4
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 14:09:04 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.197079.1673964535072720118
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 06:08:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Qj4n+rCT;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id q23-20020a17090a065700b002290913a521so15000160pje.5
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 06:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HBMaZFMrVxIr5Usn7r1iK67D5fson3Fo/Rmw3jEibHw=;
        b=Qj4n+rCTZVcGNn5ArAdXHo3hDej0M3xtwXOzcBD3bGH9UeVGFGwS2EADJibGG8d9nv
         OFvm/hB4LGjKkwDazkBwMil4N5Mk8r8zVWPyW4iRbhmxxl5Ed5MaepD15MO97F3qFcUc
         JU0PnGgwL/Su82i/0AQGx0nvggC+v8fsgRRT6+DMa11dQ/+Lug7rv9+WqvDFfsa4muUH
         QZ7+iuktF6F78TXwm7e0mhOzu94YdDbUPphyUJ46c2jdj146NRp6h0OijD6hRSQ4mgrB
         weHUaPd0DbQBpvckFe/TlJXRW2SW8Fr/AJ4ZEPbxuHhEN8pVSPTVRO9V2fCs2omNd+Ss
         d2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HBMaZFMrVxIr5Usn7r1iK67D5fson3Fo/Rmw3jEibHw=;
        b=bGGeI+Svfb3y6WYml1z5ROAYyWjR1EfIrgFE6wb3vOCJHh03sI80hbOfXl6g2K6iRG
         GM76QdYuQ21LncqAVNAml3Vdapdt/f6VKb9Kz/+pF9AUMPbtU1XxSmTeKqxEBbDlGlK+
         Zfu/Q3fMA1wLOQDxkaV/cYygx3+eqOiBYcSohCGIWFbGE7gK/0bM7HWoYx0hE5ZpC66f
         Vn3VlMTT4+jVvGJu3/Z/eHzmwtQKG/DSHhYzv7XTzsF+Cuj8KimE+Fbq074Wqyy08HyC
         p+D3pLcfoTpukBkjas+bjHhvDtHCksYRWkFJhJeNngApdqpmYSk/NPehDsJewNLEm5qm
         GrOw==
X-Gm-Message-State: AFqh2koX1zQU3b1uJQGwl3AvSwYD8CXDwA90VESfLbeL+Exu5h49oiBb
	eRJz46DfMgWmEcw/pDqCled/eEflyXarOLM+Yig=
X-Google-Smtp-Source: AMrXdXtvqajlxKQD7upWmfRTD3Pv9IbEgOcInHu8e8ZyevrZjU9YRLNh8Tx9ARZpbAt0cQx537Zb/w==
X-Received: by 2002:a17:902:cf10:b0:194:5fc9:f55a with SMTP id i16-20020a170902cf1000b001945fc9f55amr4372818plg.35.1673964533950;
        Tue, 17 Jan 2023 06:08:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090264c200b001930b7e2c04sm18197788pli.287.2023.01.17.06.08.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 06:08:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/9] Patch review
Date: Tue, 17 Jan 2023 04:08:36 -1000
Message-Id: <cover.1673964419.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 14:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176038

Please review this set of patches for kirkstone and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4800

The following changes since commit 4760fac939a6204e3cb7dcd3699cd9a2508f9dee:

  devtool: process local files only for the main branch (2023-01-12 04:56:26 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Bhabu Bindu (1):
  qemu: Fix CVE-2022-4144

Daniel Gomez (1):
  gtk-icon-cache: Fix GTKIC_CMD if-else condition

KARN JYE LAU (1):
  freetype:update mirror site.

Martin Jansa (1):
  ffmpeg: refresh patches to apply cleanly

Narpat Mali (3):
  python3-setuptools: fix for CVE-2022-40897
  python3-wheel: fix for CVE-2022-40898
  python3-git: fix for CVE-2022-24439

Yash Shinde (1):
  glibc: stable 2.35 branch updates.

Yogita Urade (1):
  libksba: fix CVE-2022-47629

 meta/classes/gtk-icon-cache.bbclass           |   2 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 ...-git-CVE-2022-24439-fix-from-PR-1518.patch |  97 ++++
 ...-git-CVE-2022-24439-fix-from-PR-1521.patch | 488 ++++++++++++++++++
 .../python/python3-git_3.1.27.bb              |   4 +
 ...-of-whitespace-to-search-backtrack.-.patch |  31 ++
 .../python/python3-setuptools_59.5.0.bb       |   1 +
 ...tential-DoS-attack-via-WHEEL_INFO_RE.patch |  32 ++
 .../python/python3-wheel_0.37.1.bb            |   4 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2022-4144.patch             |  99 ++++
 .../freetype/freetype_2.11.1.bb               |   2 +-
 ...c-stop-accessing-out-of-bounds-frame.patch |  19 +-
 ...c-stop-accessing-out-of-bounds-frame.patch |   7 +-
 ...-vp3-Add-missing-check-for-av_malloc.patch |  12 +-
 ...overflow-in-the-CRL-signature-parser.patch |  72 +++
 meta/recipes-support/libksba/libksba_1.6.2.bb |   3 +-
 17 files changed, 848 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1518.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1521.patch
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch
 create mode 100644 meta/recipes-devtools/python/python3-wheel/0001-Fixed-potential-DoS-attack-via-WHEEL_INFO_RE.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
 create mode 100644 meta/recipes-support/libksba/libksba/0001-Fix-an-integer-overflow-in-the-CRL-signature-parser.patch

-- 
2.25.1


