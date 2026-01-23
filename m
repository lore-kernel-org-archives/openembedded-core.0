Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 898B8D74EF8
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 16:04:10 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1703.1769184241246285965
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 08:04:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=orKVmI4/;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso12689425e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 08:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769184239; x=1769789039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T7qt4O6wxVZJG7QMRRsLAmX1WPaJwQTFrt3MBNPT2WQ=;
        b=orKVmI4/JAZLXUOe2stbf22Tw4HGNxGPNmOaJT2HthQzcrtLiBtEDZAPYJbIXU0is0
         gx3gEHLhOt0aogvqRTjKgG2vuMTk6RKBpgTFqWgJanDgE1tO4iO2DJbCYVcKi6ndG9rF
         dIJR1dGeMxlbUlcyokSrR7ph3vgZe10zOt1U0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769184239; x=1769789039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7qt4O6wxVZJG7QMRRsLAmX1WPaJwQTFrt3MBNPT2WQ=;
        b=FpcKcX8QMrHcs1RNeIgloNI8ohyvWhzfwlZVsPGUqsb+5RPY7a3IfMh+zoochpUkok
         Ii0J8+ktRU9mT+YcbNDhMNDRJunRiK3MloRYQjA4FUBoNJNAUCZfVNkfzCAuIp4JRrRF
         tAsguAvIzKDJ35Jat34CuttJC46bHTfHRgBfRs/nAhPXxNDK7lllh4tR0zbhbwjEYngU
         ko1niPR+wE0PYWf3Xd+HWUajFbOAyvGZi0Z01bzbmALUemjXxp3urFK4YvkMc6wQB3VR
         NbH8R6hHwhankTUtupDnPyyg5AFeufmHgrchjYGDtCOI8Z0iXrU409e/HW9hxqJ/YCe+
         Fx5g==
X-Gm-Message-State: AOJu0YzpJUCXaT5Af0GHJaM0nU1LsfjXS0wTydsaFrIbHkNyLv7Ozh0r
	MOb87BFPjg+/jznNe74R9lRj9tyeuuTqPw+IZMTxr+/awLyfNF0zqc8KRL8E6+Ecv5BWXpkvdLF
	bMcFBbtM=
X-Gm-Gg: AZuq6aIYoZwk0K7DElGYWPLXKsXTyp5a4C+AMacIvhAh5lC10PlP5Uz/cdrFib2LJAK
	sJuFHgssu9vHYG6RwKhHCOvgamoPbGumy4OgI0OP6ocAzCYbCzLNuhAlA5aNhw4r36pDGr061Jk
	vr57bG/Jg9WxxT0RRMDiXJquEQ/K4WNPdRqTlYfyGpkYymj9fAl/PvufpO2aRdi00lPVgNr/mev
	2N9CiCTb4yZdue36wkL1Z8b78h+Hm9Cg3yKdnMzvfCvj8PhOwwhIfRPtfYh/gI1jFimBEBdTDAl
	wH30XmMqZOsfQZl4B1Xr8f5jvCE+akU1e1pdM2avnHIncTs95NTeG1gpqFcd34R0sVBrIuqQdEp
	yF9cXawPj0bZo31+vsqgqbIBc7J7pRJoSpbd5sTMhXOUUaCHyoSTtvmy+MxNshzp8/kjY2H2mPX
	3DDcx9a0tEEEehhH3XbozyMgGtcx7uVr4roo0p7jnPnk6TuPFmoYyb336ZsXaKcvhYwmkFacj5V
	UXyjFTNQnftZsU=
X-Received: by 2002:a05:600c:3586:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-4804c94fe7cmr64041745e9.13.1769184239225;
        Fri, 23 Jan 2026 08:03:59 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d84588fsm67057015e9.2.2026.01.23.08.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 08:03:58 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/22] Pull request (cover letter only)
Date: Fri, 23 Jan 2026 17:03:34 +0100
Message-ID: <cover.1769177912.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 16:04:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229895

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1768910519.git.yoann.congal@smile.fr/

Note: this PR has patchs related to the whinlatter PR:
https://lore.kernel.org/openembedded-core/CAMSfU+779ANtEvXg9Z4M8a4wZu_Z4-+a1RJvE__OvfR92Oq=ZQ@mail.gmail.com/T/#t

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3113
via https://git.yoctoproject.org/poky-contrib/commit/?h=stable/scarthgap-nut&id=9fd46f5c882971ac222fc661cf0804ee5a458316
oe-core tip is at https://git.yoctoproject.org/poky-contrib/commit/?h=stable/scarthgap-nut&id=a7e7530d8ece2ee31ffcb220264cc9c52616b526

The following changes since commit 6988157ad983978ffd6b12bcefedd4deaffdbbd1:

  build-appliance-image: Update to scarthgap head revision (2026-01-02 06:57:59 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to 199c6518f5e363a2d8648bdfe14233afd9b0ba6e:

  pseudo: Update to pull in 'makewrappers: Fix EFAULT implementation' (2026-01-19 17:44:48 +0100)

----------------------------------------------------------------

Paul Barker (1):
  pseudo: Add hard sstate dependencies for pseudo-native

Peter Marko (16):
  python3: patch CVE-2025-12084
  python3: patch CVE-2025-13836
  util-linux: patch CVE-2025-14104
  qemu: ignore CVE-2025-54566 and CVE-2025-54567
  glib-2.0: patch CVE-2025-13601
  glib-2.0: patch CVE-2025-14087
  glib-2.0: patch CVE-2025-14512
  dropbear: patch CVE-2019-6111
  libpcap: patch CVE-2025-11961
  libpcap: patch CVE-2025-11964
  cups: allow unknown directives in conf files
  libarchive: fix CVE-2025-60753 regression
  curl: patch CVE-2025-14017
  curl: patch CVE-2025-14819
  curl: patch CVE-2025-15079
  curl: patch CVE-2025-15224

Richard Purdie (4):
  pseudo: Upgrade to version 1.9.1
  pseudo: Update to pull in memleak fix
  pseudo: Update to pull in openat2 and efault return code changes
  pseudo: Update to pull in 'makewrappers: Fix EFAULT implementation'

Robert Yang (1):
  pseudo: 1.9.0 -> 1.9.2

 .../libpcap/libpcap/CVE-2025-11961-01.patch   |  38 ++
 .../libpcap/libpcap/CVE-2025-11961-02.patch   | 433 ++++++++++++++++++
 .../libpcap/libpcap/CVE-2025-11964.patch      |  33 ++
 .../libpcap/libpcap_1.10.4.bb                 |   3 +
 .../dropbear/dropbear/CVE-2019-6111.patch     | 157 +++++++
 .../recipes-core/dropbear/dropbear_2022.83.bb |   1 +
 .../glib-2.0/glib-2.0/CVE-2025-13601-01.patch | 125 +++++
 .../glib-2.0/glib-2.0/CVE-2025-13601-02.patch | 128 ++++++
 .../glib-2.0/glib-2.0/CVE-2025-14087-01.patch |  69 +++
 .../glib-2.0/glib-2.0/CVE-2025-14087-02.patch | 240 ++++++++++
 .../glib-2.0/glib-2.0/CVE-2025-14087-03.patch | 150 ++++++
 .../glib-2.0/glib-2.0/CVE-2025-14512.patch    |  70 +++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   6 +
 meta/recipes-core/util-linux/util-linux.inc   |   2 +
 .../util-linux/CVE-2025-14104-01.patch        |  33 ++
 .../util-linux/CVE-2025-14104-02.patch        |  28 ++
 .../0001-configure-Prune-PIE-flags.patch      |  44 --
 .../pseudo/files/glibc238.patch               |  65 ---
 .../pseudo/files/older-glibc-symbols.patch    |   4 +-
 meta/recipes-devtools/pseudo/pseudo.inc       |   7 +
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   6 +-
 .../python/python3/CVE-2025-12084.patch       | 144 ++++++
 .../python/python3/CVE-2025-13836.patch       | 162 +++++++
 .../python/python3_3.12.12.bb                 |   2 +
 meta/recipes-devtools/qemu/qemu.inc           |   3 +
 meta/recipes-extended/cups/cups.inc           |   1 +
 ...pping-scheduler-on-unknown-directive.patch |  43 ++
 ...25-60753.patch => CVE-2025-60753-01.patch} |   0
 .../libarchive/CVE-2025-60753-02.patch        |  46 ++
 .../libarchive/libarchive_3.7.9.bb            |   3 +-
 ...st-qual-fix-or-silence-compiler-warn.patch |  85 ++++
 .../curl/curl/CVE-2025-14017.patch            | 115 +++++
 .../curl/curl/CVE-2025-14819.patch            |  73 +++
 .../curl/curl/CVE-2025-15079.patch            |  32 ++
 .../curl/curl/CVE-2025-15224.patch            |  31 ++
 meta/recipes-support/curl/curl_8.7.1.bb       |   5 +
 36 files changed, 2271 insertions(+), 116 deletions(-)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-01.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-02.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601-02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-03.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14512.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2025-14104-01.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2025-14104-02.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-configure-Prune-PIE-flags.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/glibc238.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-12084.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13836.patch
 create mode 100644 meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch
 rename meta/recipes-extended/libarchive/libarchive/{CVE-2025-60753.patch => CVE-2025-60753-01.patch} (100%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-60753-02.patch
 create mode 100644 meta/recipes-support/curl/curl/0001-build-enable-Wcast-qual-fix-or-silence-compiler-warn.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14017.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14819.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15079.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15224.patch


