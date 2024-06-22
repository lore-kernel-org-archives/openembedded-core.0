Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B28C27C53
	for <webhook@archiver.kernel.org>; Sat, 22 Jun 2024 11:57:47 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.95897.1719057464802836917
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jun 2024 04:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1sqzeXlq;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.54, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5b97a9a9b4bso1371823eaf.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 04:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719057464; x=1719662264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tclfdrPMHzE4gkK20jvGml30B2xd/JqLEUrdro9g8Ks=;
        b=1sqzeXlqC+aOcN0In+BLUJyE5CdtDTclPIxLwFNPSFC+lIn5E+uJ4+t+/N8bW/okYH
         8SA9YSLJF6Hnly+VW8w++3vEp4+i134+4FMbo3Zm1Xc3GfAShncMfzQF4xjrmliGK8ol
         5lPy3j6GeJumtmyL8WZ4IYAPPMvDkqQoGVSc8lLQWu1JuCfUm+BMpERFnadC6Pzyg5Am
         AFYDQqCAJDwyFJ3Xr2ciQ7LpG9qnINI6W7XAi/6qzFKuTV0/K7MPlzn02p/VdQSarb9j
         FRF9/mV39K7V9aRDOmQprfLHEb6elJXGCqm+R5vze2wtYM0nry3/2BgfkDkQUxP5YHE9
         zLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719057464; x=1719662264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tclfdrPMHzE4gkK20jvGml30B2xd/JqLEUrdro9g8Ks=;
        b=adctl0wXGRza8+p/xNZPhQcFt9BBzBI+tGn9SSl9LFxjagfSwlmB3r3vhRIDL0URLV
         oM6XeroTmVA/tYQGuJQNYeAYjHRxNDytnOWGSCTs5vPgXzF1DD1uOAURvc9I8G3Q+KrW
         6JONA1QNFRbVczFeMceGCKANEN5Dy0//nBJ8KVQVL2qlcl3cqPyE0pFhNg/uljjjtJEV
         pw9pv33Nt+rG0VE0T+ntq7YF/wK8PY9L72kVOj2+Ax2DR0GusJHh1BlUC1h9uW2XnKg0
         rmc3o3ErLfI1N8uFnywqeJD3ksvyeZx3NLWcl9MM4kZCVfyPUlhBY40i0OCdY7T4svf/
         NmXg==
X-Gm-Message-State: AOJu0Yzb9QGePI5SVnjbCf2Yux+GCQeUA8TQKXErYAFFEmiPXncsz/cw
	Du1deNlOK2/Gcjh32KgaLxFs9ZEw2wk7e9tOsw1dcOyxbe6aQXIpcoEQg8jM+s9LVyt2+ZwuVT8
	f
X-Google-Smtp-Source: AGHT+IGxrMXtUbcEOFLIaIk8ahsb4hTTcZjrZ5dXB3qBWsqHIcTaAB1eHxoSlCI9U7kD2QfUFI65+g==
X-Received: by 2002:a05:6358:4709:b0:1a2:89:298c with SMTP id e5c5f4694b2df-1a23c02a874mr29948955d.14.1719057463474;
        Sat, 22 Jun 2024 04:57:43 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-716b364687bsm2101074a12.12.2024.06.22.04.57.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 04:57:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/9] Patch review
Date: Sat, 22 Jun 2024 04:57:27 -0700
Message-Id: <cover.1719057291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 11:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201038

Please review this set of changes for kirkstone and hjave comments back by
end of day Tuesday, June 25

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7065

The following changes since commit ab2649ef6c83f0ae7cac554a72e6bea4dcda0e99:

  build-appliance-image: Update to kirkstone head revision (2024-06-01 19:12:27 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Changqing Li (1):
  man-pages: remove conflict pages

Deepthi Hemraj (1):
  glibc: stable 2.35 branch updates

Khem Raj (1):
  gobject-introspection: Do not hardcode objdump name

Peter Marko (1):
  glib-2.0: patch CVE-2024-34397

Siddharth (1):
  openssl: Upgrade 3.0.13 -> 3.0.14

Siddharth Doshi (1):
  libxml2: Security fix for CVE-2024-34459

Thomas Perrot (1):
  man-pages: add an alternative link name for crypt_r.3

Yogita Urade (2):
  acpica: fix CVE-2024-24856
  ruby: fix CVE-2024-27280

 .../openssl/openssl/CVE-2024-2511.patch       | 122 ---
 .../openssl/openssl/CVE-2024-4603.patch       | 180 ----
 .../{openssl_3.0.13.bb => openssl_3.0.14.bb}  |   4 +-
 .../glib-2.0/glib-2.0/CVE-2024-34397_01.patch | 129 +++
 .../glib-2.0/glib-2.0/CVE-2024-34397_02.patch |  62 ++
 .../glib-2.0/glib-2.0/CVE-2024-34397_03.patch | 985 ++++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2024-34397_04.patch | 253 +++++
 .../glib-2.0/glib-2.0/CVE-2024-34397_05.patch |  88 ++
 .../glib-2.0/glib-2.0/CVE-2024-34397_06.patch | 263 +++++
 .../glib-2.0/glib-2.0/CVE-2024-34397_07.patch |  45 +
 .../glib-2.0/glib-2.0/CVE-2024-34397_08.patch | 168 +++
 .../glib-2.0/glib-2.0/CVE-2024-34397_09.patch |  81 ++
 .../glib-2.0/glib-2.0/CVE-2024-34397_10.patch | 108 ++
 .../glib-2.0/glib-2.0/CVE-2024-34397_11.patch | 133 +++
 .../glib-2.0/glib-2.0/CVE-2024-34397_12.patch | 173 +++
 .../glib-2.0/glib-2.0/CVE-2024-34397_13.patch | 513 +++++++++
 .../glib-2.0/glib-2.0/CVE-2024-34397_14.patch |  75 ++
 .../glib-2.0/glib-2.0/CVE-2024-34397_15.patch |  47 +
 .../glib-2.0/glib-2.0/CVE-2024-34397_16.patch |  62 ++
 .../glib-2.0/glib-2.0/CVE-2024-34397_17.patch | 121 +++
 .../glib-2.0/glib-2.0/CVE-2024-34397_18.patch |  50 +
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  18 +
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../libxml/libxml2/CVE-2024-34459.patch       |  30 +
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   1 +
 .../ruby/ruby/CVE-2024-27280.patch            |  87 ++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |   1 +
 .../acpica/acpica/CVE-2024-24856.patch        |  33 +
 .../acpica/acpica_20211217.bb                 |   4 +-
 .../man-pages/man-pages_5.13.bb               |  12 +-
 .../gobject-introspection_1.72.0.bb           |   2 +-
 31 files changed, 3536 insertions(+), 316 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-4603.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.0.13.bb => openssl_3.0.14.bb} (98%)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_03.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_04.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_05.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_06.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_07.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_08.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_09.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_10.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_11.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_12.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_13.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_14.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_15.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_16.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_17.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_18.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2024-34459.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27280.patch
 create mode 100644 meta/recipes-extended/acpica/acpica/CVE-2024-24856.patch

-- 
2.34.1


