Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D58C10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:05:10 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.8610.1715256308473205721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eHfum5Nt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6f44ed6e82fso728436b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715256308; x=1715861108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=58Rd2GHXvWb581RlOZYamQAPKgulYy6xVL3vUzPtEmw=;
        b=eHfum5Nt+vE4KYchpvdrJSgg0k0+b7/C39tc0OpRqDhyr7p/rrFw/c1dMQdQcv1d/A
         U+Sly78J1iDyYy5I3WyeREit+OgwKIDP4FfkBNh/KWbXiuSmAahv9+L9aWd93NhoDwvb
         95R8e1md6Ho+GNBy4bmQc8EjXVVkJmaNgOxldLU398WFyvL0wGlESAPNCg1WU4yJuK3N
         s8YxQtFBrB5dWYXMyTG6yL1vkZSodiqKVWcyUntuDsnCVRRfNLg3FoncMZB9ovLMo81P
         B5FhrUhh+kVg7MwrotwGBrKuJU2FrPeI+tI8m1cEwhDqapPXPSqufX1S0qA8/8JMHIIC
         C9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256308; x=1715861108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58Rd2GHXvWb581RlOZYamQAPKgulYy6xVL3vUzPtEmw=;
        b=SIecRj6ivlUWyhQ6WUnDuMadt14jNNWQsX378OSICBvoaJJN3ZP1ckKEzhpf+UvQg1
         RN6QI7kpZX/7Usq5PAqwwmmxXURkTrQM6v4W3p4nxBF2wysI29eYD39TpDC6D1PdaSxE
         8/7IRjLWtbuyDJNxJAzqNRvje8gAVuQGA+ol8AYgCbAfxHOWajaJPWZNtTDK4XNAK+8h
         QBe+RQ65iyDhlJcw+769wEHs1yqlCGQk4yoZ7BpD7OFSGgVnFaO0+oSBdTzggwpOWaoW
         P3g5CkD2WQKjpcrN8rskLjb4rv3WHRP4mu4FkUfnSY8tdVB1NhZ6ggXOu5OR/26FNZO2
         fikw==
X-Gm-Message-State: AOJu0YwdQYB994DDHn1GQm2+td4djP/c3BoGpQSB3Zv8viHP4uudrlH6
	M4Zl9hykh7RL10goCwq6+jS3BuHSzEJ9G0E4pTDHk4p9rteJLRDF+ViXs6dkIBpVpKLy29/SXQp
	A
X-Google-Smtp-Source: AGHT+IFYXmzibzW9xRw/0rEdRyBd4kxfOtETUWYxcFu1DvJoSpwAuhpmJn4ouGvLvL4Z1TV8+0GulQ==
X-Received: by 2002:aa7:820b:0:b0:6ea:c2c7:5d6a with SMTP id d2e1a72fcca58-6f49c206b3cmr5474588b3a.2.1715256307445;
        Thu, 09 May 2024 05:05:07 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c41sm1185613b3a.172.2024.05.09.05.05.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:05:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/23] Patch review
Date: Thu,  9 May 2024 05:04:38 -0700
Message-Id: <cover.1715256149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:05:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199147

Please review this set of changes for kirkstone and have comments back by
end of day Monday, May 13

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6889

The following changes since commit 8a502301209ef144932ef5071c1a9b738db23270:

  rootfs-postcommands.bbclass: Only set DROPBEAR_RSAKEY_DIR once (2024-04-26 06:15:55 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (4):
  ofono: fix CVE-2023-4234
  ofono: fix CVE-2023-4233
  gstreamer1.0-plugins-bad: fix CVE-2024-0444
  gstreamer1.0-plugins-bad: fix CVE-2023-44446

Bruce Ashfield (13):
  linux-yocto/5.15: update to v5.15.151
  linux-yocto/5.15: update CVE exclusions (5.15.151)
  linux-yocto/5.15: update to v5.15.152
  linux-yocto/5.15: update CVE exclusions (5.15.152)
  linux-yocto/5.15: update to v5.15.153
  linux-yocto/5.15: update CVE exclusions (5.15.153)
  linux-yocto/5.15: update to v5.15.155
  linux-yocto/5.15: update CVE exclusions (5.15.155)
  linux-yocto/5.15: update to v5.15.156
  linux-yocto/5.15: update CVE exclusions (5.15.156)
  linux-yocto/5.15: update to v5.15.157
  linux-yocto/5.15: update CVE exclusions (5.15.157)
  linux-yocto/5.15: cfg: remove obselete CONFIG_NFSD_V3 option

Heiko (1):
  kernel.bbclass: check, if directory exists before removing empty
    module directory

Peter Marko (2):
  python3: Upgrade 3.10.13 -> 3.10.14
  libarchive: fix multiple security vulnerabilities in pax writer

Poonam Jadhav (1):
  ppp: Add RSA-MD in LICENSE

Soumya Sambu (1):
  ncurses: Fix CVE-2023-45918

Vijay Anusuri (1):
  less: backport Debian patch for CVE-2024-32487

 meta/classes/kernel.bbclass                   |    2 +-
 .../ofono/ofono/CVE-2023-4233.patch           |   32 +
 .../ofono/ofono/CVE-2023-4234.patch           |   39 +
 meta/recipes-connectivity/ofono/ofono_1.34.bb |    2 +
 meta/recipes-connectivity/ppp/ppp_2.4.9.bb    |    2 +-
 .../ncurses/files/CVE-2023-45918.patch        |  180 +
 .../ncurses/ncurses_6.3+20220423.bb           |    1 +
 ...{python3_3.10.13.bb => python3_3.10.14.bb} |    2 +-
 .../less/less/CVE-2024-32487.patch            |   69 +
 meta/recipes-extended/less/less_600.bb        |    1 +
 ...ix-multiple-security-vulnerabilities.patch |  107 +
 .../libarchive/libarchive_3.6.2.bb            |    4 +-
 .../linux/cve-exclusion_5.15.inc              | 4508 ++++++++++++-----
 .../linux/linux-yocto-rt_5.15.bb              |    6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |    6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |   26 +-
 .../CVE-2023-44446.patch                      |  329 ++
 .../CVE-2024-0444.patch                       |   42 +
 .../gstreamer1.0-plugins-bad_1.20.7.bb        |    2 +
 19 files changed, 4007 insertions(+), 1353 deletions(-)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-4233.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-4234.patch
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2023-45918.patch
 rename meta/recipes-devtools/python/{python3_3.10.13.bb => python3_3.10.14.bb} (99%)
 create mode 100644 meta/recipes-extended/less/less/CVE-2024-32487.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-pax-writer-fix-multiple-security-vulnerabilities.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-44446.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2024-0444.patch

-- 
2.34.1


