Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF63CF6BFB
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 08:09:32 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1499.1767773363090584465
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 00:09:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=V2TTyikB;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47d3ba3a4deso9755295e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 00:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767773361; x=1768378161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TiwvNZkDaaTvNTl8cdXbotzt/nlczNhrjLtIYZVaB6M=;
        b=V2TTyikBwLqFi7aFUhUO8Ryu1tlEGssB1BEbSPziiEZ9TGKXjikPzLDSsxEbfyEYHE
         tDL9Zhd6RY07qiXQtwG/zFM0oxmpbipaMPpLNcKoKRsfKoNA7ksl7LRmgIk7L9SXzRXy
         beA5K0DpcAbqHWNce7U4hRHbvfq8zdXs2GCEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773361; x=1768378161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TiwvNZkDaaTvNTl8cdXbotzt/nlczNhrjLtIYZVaB6M=;
        b=r0TUEvTkHkDEuszXDblcl9UOs1eerDeK6hm/+EJLsi1g3QO9bKvXwAg6bPwFuwHseH
         6zM6EtnAhVKZjjv8ihVnTuvvSZgJ2LsDlD1U4jKtbfNeXFHAnSyJsLU+60b+1DFLPDMt
         xloo4h8hve4e8l4tnxZUM135SBiXcFrSshyBNpZaXNkaa6HHs0QBz+0k54EHMaPakj8S
         qyAG7ik9tbmO6GwjTK7xQVzEMeIiUhaB1mYsF5jR3iN7YTh2Jz6w1QQXPfJHOXrrIO1l
         thvSZXi/dlqHBht+HKWMdFw9vadw3m7+KXbsX8aNqkK4TkyrIlmQOAagp/ApzKcpX0xR
         kOPQ==
X-Gm-Message-State: AOJu0YwsZWAO7QLAxIS9L9VlmI74y7wHKX7nQAbtTOiJUzodI9g+spF8
	H1yEsn2adGzUjsmiRn5CYJxtjGwPQbQzs/lC/mD6U97Aj4xdEWroE0otKqjw9MeVp/w9KzQcmPC
	Xq8QK
X-Gm-Gg: AY/fxX7xPXQUeXzPojFyx0xtR9V16fMYIEDXvo11oZb2B3F/3MC1PcgEczVs34Dsgz5
	2S3Ha1uMYiUt/Xb5IPd8SNZRl6t4EszX7q1oHOQIzdWIiA5wAFD4mEH+cKhFOP9nSA2TVc0kM0F
	x95kLpiq8+seomtMzZtLJmeUZv8ja2Ft7Dv4QqAQZDD/8KcyeOsmOExhpJkRE+clRqCItSHFyp+
	ptQ0rqPTKq2J82pzrwS/MMisgZccWmUzowizN4X0yfsemi4yHFLI5iBCtnFVbPErTmCr2ZpUTDq
	BLpkIMGFE0yE8mzEHekS49Vj2iVmvttev5iPlEjoqeT1uFj76U6sp/F+k9tme+t8uc0U/vhPgdi
	DKy7V4Jz+xmmEKYMm2wobGrZgBwJIYCsU9x0y4AE+LfgijywWc4N5CfTmyw9f4JigLMDf/WCMEi
	HEP5XX5/Yc254OndruqGFu1n/CKx2kDqy7m8/r2HaaHkNJiKjU2v87P7gDidziKPkwa8W0rgg4C
	J20p64Gyy+k5cE=
X-Google-Smtp-Source: AGHT+IFJ4nj+B1tV2I8Uv9ap5ibjDso0k1gYQrMz+MEMWPczh39fRMPIeQyVg/cwvGezIkB5vU/T+g==
X-Received: by 2002:a05:600c:45c3:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-47d84b3f642mr15855675e9.33.1767773360795;
        Wed, 07 Jan 2026 00:09:20 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8715b5f7sm6093485e9.4.2026.01.07.00.09.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:09:20 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 00/11] Patch review
Date: Wed,  7 Jan 2026 09:08:49 +0100
Message-ID: <cover.1767772757.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 08:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228947

Please review this set of changes for whinlatter and have comments back by
end of day Friday, January 9.

Note that this series contains the revert of 2 commits (merged on
whinlatter before they were on master)

Passed a-full on autobuilder(*):

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3002

The following changes since commit 6c4c6d39ea3202d756acc13f8ce81b114a468541:

  cups: upgrade from 2.4.14 to 2.4.15 (2025-12-29 09:49:31 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-nut

Alexander Kanavin (1):
  glib-2.0: upgrade 2.86.1 -> 2.86.3

Peter Marko (8):
  dropbear: patch CVE-2019-6111
  sqlite3: mark CVE-2025-29087 as patched
  python3-urllib3: patch CVE-2025-66418
  python3-urllib3: patch CVE-2025-66471
  python3: upgrade 3.13.9 -> 3.13.11
  libarchive: upgrade 3.8.3 -> 3.8.4
  libpng: upgrade 1.6.51 -> 1.6.52
  libpcap: upgrade 1.10.5 -> 1.10.6

Yoann Congal (2):
  Revert "populate_sdk_ext: keep SDK_TARGETS so SPDX/SBOM tasks remain
    in locked sigs"
  Revert "create-spdx-image-3.0: Image SPDX/SBOM tasks are retained for
    eSDK installation"

 .../create-spdx-image-3.0.bbclass             |   2 +-
 meta/classes-recipe/populate_sdk_ext.bbclass  |   9 -
 .../{libpcap_1.10.5.bb => libpcap_1.10.6.bb}  |   2 +-
 .../dropbear/dropbear/CVE-2019-6111.patch     | 157 +++
 .../recipes-core/dropbear/dropbear_2025.88.bb |   1 +
 ...t-write-bindir-into-pkg-config-files.patch |  10 +-
 ...0001-Fix-DATADIRNAME-on-uclibc-Linux.patch |   2 +-
 ...-gio-querymodules-as-libexec_PROGRAM.patch |   6 +-
 ...ng-about-deprecated-paths-in-schemas.patch |   2 +-
 ...ces.c-comment-out-a-build-host-only-.patch |   2 +-
 ...on-Run-atomics-test-on-clang-as-well.patch |   6 +-
 ...ot-enable-pidfd-features-on-native-g.patch |   6 +-
 ...dcode-python-path-into-various-tools.patch |   2 +-
 .../glib-2.0/files/relocate-modules.patch     |   8 +-
 .../glib-2.0/files/skip-timeout.patch         |   2 +-
 ...l_2.86.1.bb => glib-2.0-initial_2.86.3.bb} |   0
 ...{glib-2.0_2.86.1.bb => glib-2.0_2.86.3.bb} |   0
 meta/recipes-core/glib-2.0/glib.inc           |   2 +-
 .../python3-urllib3/CVE-2025-66418.patch      |  74 ++
 .../python3-urllib3/CVE-2025-66471.patch      | 930 ++++++++++++++++++
 .../python/python3-urllib3_2.5.0.bb           |   5 +
 .../{python3_3.13.9.bb => python3_3.13.11.bb} |   2 +-
 ...ibarchive_3.8.3.bb => libarchive_3.8.4.bb} |   2 +-
 .../{libpng_1.6.51.bb => libpng_1.6.52.bb}    |   2 +-
 .../sqlite/files/CVE-2025-3277.patch          |   1 +
 25 files changed, 1197 insertions(+), 38 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.10.5.bb => libpcap_1.10.6.bb} (95%)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.86.1.bb => glib-2.0-initial_2.86.3.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.86.1.bb => glib-2.0_2.86.3.bb} (100%)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-66471.patch
 rename meta/recipes-devtools/python/{python3_3.13.9.bb => python3_3.13.11.bb} (99%)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.3.bb => libarchive_3.8.4.bb} (96%)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.51.bb => libpng_1.6.52.bb} (97%)


