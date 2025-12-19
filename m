Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3CCD5C0C8
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:22:25 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9313.1766114537043110774
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:22:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QW6bZB+H;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso1344941b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114536; x=1766719336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2hNRzazTsyMhHofXfXtPWlsAbWNnhD4P+8xrDOBNtjw=;
        b=QW6bZB+H0UUvUJIT5Nj/Cq5Pnpg8lnTJxgptCMC4GJV6JUJlY/63fWUzFRlgyxSGQw
         oDYt+Fv6Mtcw5qFeMO5wAGeoS9NifZnB4/4yqzHDNYJjMy4m0Yll91AKdYolIN7AFd02
         qyr5VmhlhrMOCBVesN0jb9AUM9yQ2UyXcBMu0z8T9RJm5BxDMBNnbNozMrF7AQNmfm/Q
         vegzeo94NjRdzBajWD6iWxlpxmFsOiDkdD/Y1W36PpDF2rOuOzY/rtVu+rL6jYfV7V73
         FSMJIY35vZ1jMDUa27yoJeVeHIKV5mmJn9yLYT4FPSiuSe/XDVU0pVaPiM7XPj7VGlvW
         X/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114536; x=1766719336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hNRzazTsyMhHofXfXtPWlsAbWNnhD4P+8xrDOBNtjw=;
        b=kOgzLOsMvjcjYg0wbmPLg7hSwvJY5EV5RItWu6r+TlcjO4tRPbBzB6YipANIIKz4ai
         J6qBWuD6d6HOKwfWJDuNg0zk9aPAXBPMPkyrYfrCdKDPwqqgt64OfCVO39bhVfSxFx4d
         pzzue/d2uHZpmWkV4TwO3mGREeXoPhAJAhvNYzez0knNlqH25If6HYrW189MBYsWFcaY
         r3ISKavxERkuZ/nURmzh5FnrNLWmKvdCyipnWMRZym8OW1zmOimmUr6QFvpEH4KJ7+VI
         39/P9/GmsEF3Omm/KwhOoAUK+K7nQLknRutJZiZBbLLX3xA990oAhTgN/ffQ8jVYAQhQ
         IiZg==
X-Gm-Message-State: AOJu0YxJ9c1Tubj9eKj8q3BlcYdGP3ylch6tE3o5ulHyDuun/PJj+Vv9
	C18CxDFeTY88vIZ+NuRM+Ek5YwhAYhNilEc7bf6Qwyh6STJOZLkxeL+tuLoE3g==
X-Gm-Gg: AY/fxX4ALQXTlS6LgBuoz+i5rtUFPn88pBqOJbKjWJvisPOlit5XQZSNzfHZhGHNVSm
	jeO/BF6dbRuJRS0rFRCxH38wyqM3xhusjUK6OiibQ8xAGYrZzG2luzpHCQp7bNLroDuvkdPmnkE
	a852wtFo+rCxSUjXF1WELKtHn9uOoQGOROqEFI+NudlbCPNXmPz9wVcj2VtUQ56F6bs2gcbLi+i
	DMYrQ0PkcqUCW2pPE6XVCEgvzfQ/CFbPBWz5A3zgmYub+r6AOjre9mnwVfgUVt8u/BcDlRTMCEF
	pzV90CURToCjrpcMQahgWT3MTlwiDn/63txGRhkLktwqu4RDPF2KPLh+r7t2TCFiA18XTRnI7aL
	hMOcMxO9K3O3+LoeVifN73PBxl8UWRM+1EwU1/oPDbp9cm++t9BXCaM64xc67hB6LDzA3lIdHHM
	UJYW2bf5wDJFSXEnDCPOyMECJH
X-Google-Smtp-Source: AGHT+IGw1RcQeqDS3EiSnXu1vpo3cZ4Ii0nYJYABRAmAE2MihvMqsdNGfiyRML3t8za22rbGEBM2DA==
X-Received: by 2002:a05:6a00:1d27:b0:7e8:450c:61c1 with SMTP id d2e1a72fcca58-7ff66679547mr1201301b3a.49.1766114536129;
        Thu, 18 Dec 2025 19:22:16 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:22:15 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 00/29] Updates for Whinlatter
Date: Fri, 19 Dec 2025 08:51:39 +0530
Message-ID: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228168

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

This series of patches includes:
- recipe updates which are cherry-picks from master branch bringing bug
  fixes
- CVE fixes

Patches have been build-tested successfully on:
- qemuarm with musl and clang
- qemux86 with libc and gcc
- qemux86-64 with libc and gcc

Changes in v2:
- Dropped patches not meeting release branch criteria

Ankur Tyagi (4):
  libxmlb: upgrade 0.3.23 -> 0.3.24
  gnutls: patch CVE-2025-9820
  sqlite3: patch CVE-2025-3277
  sqlite3: patch CVE-2025-6965

Chen Qi (1):
  cups: upgrade from 2.4.14 to 2.4.15

Deepesh Varatharajan (2):
  llvm/clang: Upgrade to 21.1.6 release
  llvm/clang: Upgrade to 21.1.7 release

Dmitry Baryshkov (1):
  mesa: upgrade 25.2.5 -> 25.2.8

Gyorgy Sarvari (1):
  enchant2: upgrade 2.8.12 -> 2.8.14

Jörg Sommer (1):
  glib-2.0: Upgrade 2.86.0 -> 2.86.1

Khem Raj (1):
  spirv-llvm-translator: Upgrade to 21.1.2

Peter Marko (2):
  libarchive: upgrade 3.8.2 -> 3.8.3
  go: upgrade 1.25.4 -> 1.25.5

Robert Yang (2):
  e2fsprogs: misc/create_inode.c: Fix for file larger than 2GB
  ccache: 4.12.1 -> 4.12.2

Wang Mingyu (13):
  ell: upgrade 0.79 -> 0.80
  gst-devtools: upgrade 1.26.5 -> 1.26.7
  gst-examples: upgrade 1.26.5 -> 1.26.7
  gstreamer1.0-libav: upgrade 1.26.5 -> 1.26.7
  gstreamer1.0-plugins-bad: upgrade 1.26.5 -> 1.26.7
  gstreamer1.0-plugins-base: upgrade 1.26.5 -> 1.26.7
  gstreamer1.0-plugins-good: upgrade 1.26.5 -> 1.26.7
  gstreamer1.0-plugins-ugly: upgrade 1.26.5 -> 1.26.7
  gstreamer1.0-python: upgrade 1.26.5 -> 1.26.7
  gstreamer1.0-rtsp-server: upgrade 1.26.5 -> 1.26.7
  gstreamer1.0: upgrade 1.26.5 -> 1.26.7
  gstreamer1.0-vaapi: upgrade 1.26.5 -> 1.26.7
  ccache: upgrade 4.12 -> 4.12.1

Zhang Peng (1):
  libpng: upgrade 1.6.50 -> 1.6.51

 meta/conf/distro/include/maintainers.inc      |   4 +-
 .../ell/{ell_0.79.bb => ell_0.80.bb}          |   2 +-
 ...l_2.86.0.bb => glib-2.0-initial_2.86.1.bb} |   0
 ...{glib-2.0_2.86.0.bb => glib-2.0_2.86.1.bb} |   0
 meta/recipes-core/glib-2.0/glib.inc           |   2 +-
 .../{ccache_4.12.bb => ccache_4.12.2.bb}      |   2 +-
 meta/recipes-devtools/clang/common-clang.inc  |   2 +-
 meta/recipes-devtools/clang/common.inc        |   2 +-
 ...inode.c-Fix-for-file-larger-than-2GB.patch |  40 +++
 .../e2fsprogs/e2fsprogs_1.47.3.bb             |   1 +
 .../go/{go-1.25.4.inc => go-1.25.5.inc}       |   2 +-
 ...e_1.25.4.bb => go-binary-native_1.25.5.bb} |   6 +-
 ..._1.25.4.bb => go-cross-canadian_1.25.5.bb} |   0
 ...{go-cross_1.25.4.bb => go-cross_1.25.5.bb} |   0
 ...osssdk_1.25.4.bb => go-crosssdk_1.25.5.bb} |   0
 ...runtime_1.25.4.bb => go-runtime_1.25.5.bb} |   0
 .../go/{go_1.25.4.bb => go_1.25.5.bb}         |   0
 .../cups/{cups_2.4.14.bb => cups_2.4.15.bb}   |   2 +-
 ...ibarchive_3.8.2.bb => libarchive_3.8.3.bb} |   2 +-
 .../{libxmlb_0.3.23.bb => libxmlb_0.3.24.bb}  |   2 +-
 meta/recipes-graphics/mesa/mesa.inc           |   4 +-
 ...1.1.bb => spirv-llvm-translator_21.1.2.bb} |   2 +-
 ...tools_1.26.5.bb => gst-devtools_1.26.7.bb} |   2 +-
 ...mples_1.26.5.bb => gst-examples_1.26.7.bb} |   2 +-
 ...1.26.5.bb => gstreamer1.0-libav_1.26.7.bb} |   2 +-
 ....bb => gstreamer1.0-plugins-bad_1.26.7.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-base_1.26.7.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-good_1.26.7.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.26.7.bb} |   2 +-
 ....26.5.bb => gstreamer1.0-python_1.26.7.bb} |   2 +-
 ....bb => gstreamer1.0-rtsp-server_1.26.7.bb} |   2 +-
 ...1.26.5.bb => gstreamer1.0-vaapi_1.26.7.bb} |   2 +-
 ...er1.0_1.26.5.bb => gstreamer1.0_1.26.7.bb} |   2 +-
 .../{libpng_1.6.50.bb => libpng_1.6.51.bb}    |   2 +-
 ...{enchant2_2.8.12.bb => enchant2_2.8.14.bb} |   2 +-
 .../gnutls/gnutls/CVE-2025-9820.patch         | 233 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.10.bb  |   1 +
 .../sqlite/files/CVE-2025-3277.patch          |  29 +++
 .../sqlite/files/CVE-2025-6965.patch          | 117 +++++++++
 meta/recipes-support/sqlite/sqlite3_3.48.0.bb |   5 +-
 40 files changed, 455 insertions(+), 31 deletions(-)
 rename meta/recipes-core/ell/{ell_0.79.bb => ell_0.80.bb} (88%)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.86.0.bb => glib-2.0-initial_2.86.1.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.86.0.bb => glib-2.0_2.86.1.bb} (100%)
 rename meta/recipes-devtools/ccache/{ccache_4.12.bb => ccache_4.12.2.bb} (93%)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
 rename meta/recipes-devtools/go/{go-1.25.4.inc => go-1.25.5.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.4.bb => go-binary-native_1.25.5.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.4.bb => go-cross-canadian_1.25.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.4.bb => go-cross_1.25.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.4.bb => go-crosssdk_1.25.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.4.bb => go-runtime_1.25.5.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.4.bb => go_1.25.5.bb} (100%)
 rename meta/recipes-extended/cups/{cups_2.4.14.bb => cups_2.4.15.bb} (51%)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.2.bb => libarchive_3.8.3.bb} (96%)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.23.bb => libxmlb_0.3.24.bb} (93%)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_21.1.1.bb => spirv-llvm-translator_21.1.2.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.26.5.bb => gst-devtools_1.26.7.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.26.5.bb => gst-examples_1.26.7.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.26.5.bb => gstreamer1.0-libav_1.26.7.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.26.5.bb => gstreamer1.0-plugins-bad_1.26.7.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.26.5.bb => gstreamer1.0-plugins-base_1.26.7.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26.5.bb => gstreamer1.0-plugins-good_1.26.7.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.26.5.bb => gstreamer1.0-plugins-ugly_1.26.7.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.26.5.bb => gstreamer1.0-python_1.26.7.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.26.5.bb => gstreamer1.0-rtsp-server_1.26.7.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.26.5.bb => gstreamer1.0-vaapi_1.26.7.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.26.5.bb => gstreamer1.0_1.26.7.bb} (97%)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.50.bb => libpng_1.6.51.bb} (97%)
 rename meta/recipes-support/enchant/{enchant2_2.8.12.bb => enchant2_2.8.14.bb} (91%)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-3277.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-6965.patch


