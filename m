Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E0E9C0218C
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 03:03:37 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.34188.1737515007845284085
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 19:03:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jB0bH8z2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-216728b1836so109376415ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 19:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737515007; x=1738119807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0FvLfY1hEl5QVnhLATP42IES47yoOZRh2MHg/mw/Fl0=;
        b=jB0bH8z2WJtOlPpp6WS3imQdcEbV/xW2wPAJaim3d1PjAoYwESKtv3JlXV7eHE840M
         Z3uJBsqAP2xahmF/bDxH3qZlu4SJVeIy8J87ObU55Kl7pSnU2Glsr9nbNyQPAUh1HCoz
         5zJiXK2JpHXUvHjk2bPj7GGXWX//G+z4eBNYHMBh8Tdr9g0R1dASin8vMn6S0Rc4sl9M
         Q8hmEPLaNIB/If0fmFterS15+bsaA/Hpd+3y9QnfElZRdNNdk3AGAw8BqY3l0AJohwVa
         ENp9osnqgt57KFCw37obNWGNCLc96JLK5nQILSjo7YL/6cq9c4vaOhfEAe8Rih83EgpP
         bP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737515007; x=1738119807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0FvLfY1hEl5QVnhLATP42IES47yoOZRh2MHg/mw/Fl0=;
        b=Wt6l4TGTxBNxyHmMgxonrjBJoWpMGHnJdWQN5bxS6asBXgd5o+CvX1lfBw6BvTYjcy
         lnekTVV5ml6S6pkKEV8tBpitkvkWABJK6lVL1le9pUs3FID3CJ/LCP1dB0e4GfhLYMTE
         +Bl0nJddgdlZeEfngGU/RZOAaIsoGTBXwCqL+jh3vZQQ+kg4QpzpIFJXVBNqUoexjv67
         CgWzgKmFSY7V5ydTiSp2/Hlzab5LqpVP4ko9SRnQo4OX97YiSzoJzYZPNmje0HKF1eRo
         7KHCp6kMJRVa6MRwXImicA4oH7btnC4NJluxPOYzNf8V01St28ORJf7iLpmSHg6KDgDE
         TCLg==
X-Gm-Message-State: AOJu0Yyshu0EyrzJtPl5VqfE1Fi+l7ultgnIl9FrWY/IFfMHDfSuHoi9
	EAttiLWGIEYWUOuMy1uYU6T1GjmEJQkWS/0dr0Zm6gEafF5C7yKaVP65OJfzmQP7BfrUOJUJP+B
	hCzw=
X-Gm-Gg: ASbGncsdukyWokXpsVhO+6KYaHvrqK5+zJ76h7Oc5q5rCulLiceOQ4g4aHtS0PnFfm3
	34TglCr7s0w1f/+MSS6esraVXhLfT8yV0zXHmBScvjSahFn7ontMhgiZ2HYR5+CXH4FWevc+qMy
	43DKux6cgt3D+2xb3qBUpISueARXiWksBMR4GrGVvY1Rnb9n5wDbSoqNrUl9l/qZz5C0ON2gxPF
	iAODEBGy7Xa0ODGeUdokJwW1YSIVzgIrBqMo/OncM1Q591W2SqO+MqvqPQ=
X-Google-Smtp-Source: AGHT+IFPOMIUbFwPcvHhMQGMVlF8HuehjXdPPXLtAbYl2eY5N6/42nLrtOzWBEzonC3vVLEzKaXzYw==
X-Received: by 2002:a05:6a20:1593:b0:1e1:b44f:cff1 with SMTP id adf61e73a8af0-1eb21585eb8mr28511850637.33.1737515006921;
        Tue, 21 Jan 2025 19:03:26 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab8112c1sm9800337b3a.37.2025.01.21.19.03.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 19:03:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/14] Patch review
Date: Tue, 21 Jan 2025 19:02:56 -0800
Message-ID: <cover.1737514842.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 03:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210114

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, January 23

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/856

The following changes since commit 92eea72a25e553c698bee9e3f551a5880bd4631c:

  systemd: enable create-log-dirs (2025-01-13 06:16:07 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 5.0.6

Alexis Lothoré (1):
  oeqa/ssh: allow to retrieve raw, unformatted ouput

Catalin Popescu (1):
  Revert "bluez5: remove configuration files from install task"

Chen Qi (1):
  libgfortran: fix buildpath QA issue

Divya Chellam (1):
  wget: fix CVE-2024-10524

Esben Haabendal (1):
  pulseaudio: fix webrtc audio depdency

Hitendra Prajapati (1):
  ofono: Fix multiple CVEs

Peter Marko (4):
  socat: patch CVE-2024-54661
  ofono: patch CVE-2024-7540, CVE-2024-7541, CVE-2024-7542
  ofono: patch CVE-2023-4232
  ofono: patch CVE-2023-4235

Ross Burton (2):
  classes/nativesdk: also override TUNE_PKGARCH
  classes/qemu: use tune to select QEMU_EXTRAOPTIONS, not package
    architecture

Zhang Peng (1):
  avahi: fix CVE-2024-52616

 meta/classes-recipe/nativesdk.bbclass         |   1 +
 meta/classes-recipe/qemu.bbclass              |   8 +-
 meta/lib/oeqa/core/target/ssh.py              |  16 +-
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   1 +
 .../avahi/files/CVE-2024-52616.patch          | 104 +++++++++
 meta/recipes-connectivity/bluez5/bluez5.inc   |   8 +
 .../ofono/ofono/CVE-2023-4232.patch           |  31 +++
 .../ofono/ofono/CVE-2023-4235.patch           |  38 ++++
 .../ofono/ofono/CVE-2024-7539.patch           |  88 ++++++++
 ...024-7540_CVE-2024-7541_CVE-2024-7542.patch |  52 +++++
 .../ofono/ofono/CVE-2024-7543.patch           |  30 +++
 .../ofono/ofono/CVE-2024-7544.patch           |  30 +++
 .../ofono/ofono/CVE-2024-7545.patch           |  32 +++
 .../ofono/ofono/CVE-2024-7546.patch           |  30 +++
 .../ofono/ofono/CVE-2024-7547.patch           |  29 +++
 meta/recipes-connectivity/ofono/ofono_2.4.bb  |   9 +
 .../socat/files/CVE-2024-54661.patch          | 113 ++++++++++
 .../socat/socat_1.8.0.0.bb                    |   1 +
 meta/recipes-devtools/gcc/gcc-testsuite.inc   |   4 +-
 meta/recipes-devtools/gcc/libgfortran.inc     |   2 +-
 .../wget/wget/CVE-2024-10524.patch            | 197 ++++++++++++++++++
 meta/recipes-extended/wget/wget_1.21.4.bb     |   1 +
 .../pulseaudio/pulseaudio.inc                 |   2 +-
 scripts/install-buildtools                    |   4 +-
 24 files changed, 811 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-4232.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-4235.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7539.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7543.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7544.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7545.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7546.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7547.patch
 create mode 100644 meta/recipes-connectivity/socat/files/CVE-2024-54661.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2024-10524.patch

-- 
2.43.0


