Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B25B1099B54
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 23:07:43 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1899.1774048048062628522
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 16:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0q6Ig436;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b45bb7548so1689503f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 16:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774048046; x=1774652846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=W6IGzDGldbMe30ySza7XrH7WUji/BaZlzSfyA9YzX/g=;
        b=0q6Ig436kg5SxvC5cXQKwumuxpzvc9aCKVoAPnCdUvqL0SCR7ONKFHuWXReEDM1GEZ
         5Q7LDpaHiOynd78cHWvVpz8BGfVL0MpvnifzgU00/mCzEMEWAfEuMqNyTeeNUu4oI1zM
         kb/F0DMMf5/9kJoOCIj5iBLRkU07abh6BewOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774048046; x=1774652846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6IGzDGldbMe30ySza7XrH7WUji/BaZlzSfyA9YzX/g=;
        b=GovgLhdwTIpdTSknkugimp5wfJqqgQSDiXUhjaeYBZXQIIX+KQXbahj8UmKYPQBfl6
         +l3wpXwGwhWFaSFk3uwPD8lIqAgS1uIIA9W2X9IA3F22Vy7XzedlBNjcluhj5hYcu1ph
         VzcgPPSO9l6M0TbVv8EzkaXXCQAWf5B7hFZs+UH8nyVymz6mOABWEP1YnoJlxiHDWFVO
         86plJt1h2Qr7LiAT+nqSV0SJYukMDkWS4XxempLF1wn5cxJMImaJzVDjcfk2cDUoYDbj
         uEttmeuop4kaE45Zziyx5us8yuzr7ZdRieKLg5vEWZNcGQ7FahVg69hTPe7kC0xfvGqv
         4bBA==
X-Gm-Message-State: AOJu0YxWKea7DUjtD2InTnwyBFmA/oPOL+U5BpCkTrMh+1PzlOv2lTfY
	vsumOeovuvg3bthWVOU0dJYczVTp+4rB8tUsr/0YUHO7bjVbDiD4/X/u3f6OHCJZFMIL7nyz9zB
	NSdrB
X-Gm-Gg: ATEYQzxk2zqxwx92Hw/WQ7VI23fkgOMVnOqI3DDgVMex/ASzyGz7lKkJRL4rOcDb6Nq
	t5Ew0pPFoVG9/0qKyGYTbno87B4qdIkGBBFVvr6U6D/pBjMeqFLThuAUsUR5BkUOByRaJvGDlkO
	TldKJtujLqeNwz1g4lX5+Z3QAOmkznobCXm/mBDTjNfl83paXxxUeM0z3MLrpZHb5SCA8MUsZeW
	N4zzHOjxLD6MEakKETlMOb6nQ6qoEZNT10UC4tovmIZpiRmg6YcpDxXvZJBx44gZYMXk2MqejWW
	T4oKw7nFkaQdtxht+mLP3uxMePqtOJgI6z9B2cco4H1c/RkDPQ6HLaoHYFt4QO0PLyCcgc/71Dm
	CLRx7XEg+GTVeb6UpLFnQNKln0xvYBpdj+Fe1rqfKFqA/NUYAIcfN8sfsvEshu1gOXqyKqfCOhq
	Iu3k4NXEcsrlUdDG5DgCfT+5d96VE99YVQ5R9kXeeh73X5AJxy+NgBfO8mGHKmfCbC/BkEXlGhT
	zipDLaOEdNOzoYlQjp6+seZRow=
X-Received: by 2002:a5d:5d13:0:b0:43b:3bed:f3b with SMTP id ffacd0b85a97d-43b64277fafmr7456866f8f.34.1774048045852;
        Fri, 20 Mar 2026 16:07:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6425eeb4sm9238332f8f.0.2026.03.20.16.07.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 16:07:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 0/7] Patch review
Date: Sat, 21 Mar 2026 00:07:15 +0100
Message-ID: <cover.1774047909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 23:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233636

Please review this set of changes for whinlatter and have comments back by
end of day Tuesday, March 24.

Passed a-full on autobuilder with 1 AB-INT failure:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3471
* meta-arm failed. I reported it to the meta-arm mailing-list:
  * AB-INT failure in whinlatter/edk2-firmware do_compile https://lists.yoctoproject.org/g/meta-arm/message/6967
  * Successfully retried as https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/3303

The following changes since commit ab57471acad7ce2a037480dc7b301104620f1ebf:

  build-appliance-image: Update to whinlatter head revisions (2026-03-16 11:05:22 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-nut

for you to fetch changes up to 2d6383491f4246a93e1a49a9fe258d873adf8b76:

  curl: patch CVE-2026-3805 (2026-03-19 08:45:38 +0100)

----------------------------------------------------------------

Krupal Ka Patel (2):
  python3-setuptools: drop Windows launcher executables on non-mingw
    builds
  python3-pip: drop unused Windows distlib launcher templates

Peter Marko (4):
  curl: patch CVE-2026-1965
  curl: patch CVE-2026-3783
  curl: patch CVE-2026-3784
  curl: patch CVE-2026-3805

Vijay Anusuri (1):
  inetutils: Fix CVE-2026-32746

 .../inetutils/inetutils/CVE-2026-32746.patch  |  40 +++++
 .../inetutils/inetutils_2.6.bb                |   1 +
 .../python/python3-pip_25.2.bb                |   9 +
 .../python/python3-setuptools_80.9.0.bb       |   9 +
 ...d-macros-warnings-and-related-tidy-u.patch |  44 +++++
 .../curl/curl/CVE-2026-1965-01.patch          | 138 +++++++++++++++
 .../curl/curl/CVE-2026-1965-02.patch          |  29 ++++
 .../curl/curl/CVE-2026-3783.patch             | 148 ++++++++++++++++
 .../curl/curl/CVE-2026-3784-02.patch          | 162 ++++++++++++++++++
 .../curl/curl/CVE-2026-3805.patch             |  67 ++++++++
 meta/recipes-support/curl/curl_8.17.0.bb      |   6 +
 11 files changed, 653 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch
 create mode 100644 meta/recipes-support/curl/curl/0001-build-fix-Wunused-macros-warnings-and-related-tidy-u.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-01.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-02.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784-02.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3805.patch


