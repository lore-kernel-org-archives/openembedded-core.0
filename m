Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1E5FD88CC
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 23:08:49 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8321.1773184120530034731
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 16:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=IAtDpePe;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-485345e1013so2887855e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 16:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773184119; x=1773788919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WoPJ7xWV+8iX/dfB87NOT8kQMpBomdFC9kf1XI2tmak=;
        b=IAtDpePewDrSnMHTYDa0fLF6QIXBnia6USPjjLl3EakRenx8IBFoFBbb5m4oUT+3gS
         uwX6bEW972UfWXzRifXuswtt4IUQo3c7yrVe8D4v2L1LhUY+UKIn81fD56glAYO7EF+Q
         6a90kYpeT1avkWlv3vyRyfTCwperrh90haTqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773184119; x=1773788919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoPJ7xWV+8iX/dfB87NOT8kQMpBomdFC9kf1XI2tmak=;
        b=sUiHZQ+83E71pmCcjaabORG0inAA32WuctDYRL+CBmKVBytYaYn6UN4ejpl6ESen0q
         aW1G9GShii19TKAuhdyaRl0Gtot9keHJuXwkJsr7BFsgB0fi3WrAOLm2rqEddWVb7NY8
         wJm+QyJiGzlz7u/NZZouUZx1j/UrWu0Vk0StIgHElXnmsZqKOTd42ok62w0cnKTKB1a4
         bpTDdxVpXADBKY7IYuSL0j18TMxcc/tfGgV/k94ODy3Eob+r/HJC1xQ8UVy7DvFNxg/G
         KS9YTtOO04LwruFa/6TcofLjzikbqDME4WMTxzewlZnHTyS4E0H69MVeraY7ijOE8npA
         ClFA==
X-Gm-Message-State: AOJu0YxWxFblAImMu+uFqGnDpMnH7uIbNAvX2yDVw4GRzA9PVw7Yebkx
	qwLHHfEsezkiKMyLDBAlBDwJgZLgR29idskBVTid/axzuNXjonoGNy2QvW4VI7B5Ht+/CPYFC5J
	CmqP6
X-Gm-Gg: ATEYQzyVzHK/hPOHUbB3jWp5GS8p5G/oCrMet8dwPC+8ZRFfQhC2buy2yWyEzI9iz3c
	FM/JmDwvbRmNWD2aJI5kZZ4WRw9V1XX+ySoPAGqqMYuHVF9fXkiyt3z7sJLuy5YQDtq6UtO0nb1
	pDfC181QMTeTBJ0BCjdppRnbYnSlHzehIUVu6+0gXud9hyBbdIpQIjvIpnXgGpFIYHfeYye4e5h
	AkN0U/9VBdShDj9u0suIdc2Nc0vPgJIxeh80+XJre4WQi2esyGvqofi5kN03Cx+LmcSXyrhnfQd
	HuxtjRd4P7JNVcktsAyS2+PEvrJkQwWMDVTaCP2mNj34LQNBH/Z5a4RWBTohgpdIeYDgHPQQwiU
	6JGCftg7vLw/2xmmQvOosYvGYioPXPWL1EGG6FKNEQoKwgxBWSF0Y3cE64Qfy4nc72VmePKJwaa
	1Bc2rpsZ5XBePk1aDdlK8leXJK6fFFlLp+5At71ZhQIjZY4uSzzqs19dhvqyTDzem5YlJ/N050J
	XuB+k3zPeqVtEXDm1YwCuFVv4I=
X-Received: by 2002:a05:600c:1c16:b0:47e:e981:78b4 with SMTP id 5b1f17b1804b1-4854b288424mr6128885e9.12.1773184118536;
        Tue, 10 Mar 2026 16:08:38 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6b7sm141090935e9.9.2026.03.10.16.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 16:08:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/11] Pull request (cover letter only)
Date: Wed, 11 Mar 2026 00:08:34 +0100
Message-ID: <cover.1773183644.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 23:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232828

Note: this series contains a major OpenSSL upgrade (agreed by YP TSC).

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1772923420.git.yoann.congal@smile.fr/T/#t
(no changes during review)

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3349
Ignore the warning about Centos Stream9 (its support is a work in progress)

I also did a full meta-oe build: https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1342
(the warnings are unrelated to this series)

The following changes since commit a9a785d7fa0cfe2a9087dbcde0ef9f0d2a441375:

  build-appliance-image: Update to scarthgap head revision (2026-02-27 17:45:15 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to fd8a140eb0742bbc12a23e36c9d24378bc0f462d:

  busybox: Fixes CVE-2025-60876 (2026-03-06 23:58:42 +0100)

----------------------------------------------------------------

Hugo SIMELIERE (2):
  zlib: Fix CVE-2026-27171
  harfbuzz: Fix CVE-2026-22693

Livin Sunny (1):
  busybox: Fixes CVE-2025-60876

Paul Barker (1):
  create-pull-request: Keep commit hash to be pulled in cover email

Peter Marko (3):
  ffmpeg: set status for CVE-2025-10256
  ffmpeg: set status for CVE-2025-12343
  openssl: upgrade 3.2.6 -> 3.5.5

Shaik Moin (1):
  gdk-pixbuf: Fix CVE-2025-6199

Tom Hochstein (1):
  uboot-config: Fix devtool modify

Yoann Congal (2):
  scripts/install-buildtools: Update to 5.0.16
  README: Add scarthgap subject-prefix to git-send-email suggestion

 README.OE-Core.md                             |  2 +-
 meta/classes-recipe/uboot-config.bbclass      |  2 +-
 .../openssl/files/environment.d-openssl.sh    |  9 ++-
 ...ke-history-reporting-when-test-fails.patch | 32 ++++----
 ...1-Configure-do-not-tweak-mips-cflags.patch |  4 +-
 ...sysroot-and-debug-prefix-map-from-co.patch | 26 ++++---
 .../0001-extend-check_cwm-test-timeout.patch  | 32 ++++++++
 .../openssl/openssl/CVE-2024-41996.patch      | 44 -----------
 .../openssl/openssl/CVE-2025-15468.patch      | 39 ----------
 .../openssl/openssl/CVE-2025-69419.patch      | 61 ---------------
 .../{openssl_3.2.6.bb => openssl_3.5.5.bb}    | 75 ++++++++++++-------
 .../busybox/busybox/CVE-2025-60876.patch      | 42 +++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  1 +
 .../zlib/zlib/CVE-2026-27171.patch            | 63 ++++++++++++++++
 meta/recipes-core/zlib/zlib_1.3.1.bb          |  1 +
 .../gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch | 36 +++++++++
 .../gdk-pixbuf/gdk-pixbuf_2.42.12.bb          |  1 +
 .../harfbuzz/files/CVE-2026-22693.patch       | 33 ++++++++
 .../harfbuzz/harfbuzz_8.3.0.bb                |  4 +-
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb |  2 +-
 scripts/create-pull-request                   |  2 +-
 scripts/install-buildtools                    |  4 +-
 22 files changed, 305 insertions(+), 210 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-15468.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-69419.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.2.6.bb => openssl_3.5.5.bb} (76%)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-60876.patch
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch


