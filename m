Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587B8CA0EFA
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:41:06 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.64939.1756215664788646702
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UlfYyrGK;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3253f0c8788so4423802a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215664; x=1756820464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uFRes6S85ooIqorgSTOUaDukN0FATejEfwWYdXLGuXk=;
        b=UlfYyrGK96mVgNqyUfGmGvoRYYlzkmNLMH50YWRicGF5Tjb+OcND2xoMCvIsBwdFtZ
         UHTYAu1ikPg2fwx9EOoJcxWeQHPyUwQaBb/nuwmNpXFP+PoTAopVeK5qmT/5drXh1kF4
         9dMAI7X4s52xa0GScz4G/fKUKZTAArSLlBQYICtBL4QQj0kbIPVBOPt5A7nn2XHRIr+U
         ytLPv2qAkIkpZ1M7bBZZ4wpsxwvO8GzG5nNtkCrDTb9OHQiyOnsmb9anOBD9Ybzkybh6
         RMKpfAfhtP/pKilASWjHmys1eZmF+i4k0wjDqcn/2TMqYxHTYjQCwxDOTve+Fa33tuqd
         GLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215664; x=1756820464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uFRes6S85ooIqorgSTOUaDukN0FATejEfwWYdXLGuXk=;
        b=M5sv1NQZcjK+trw3b/RdBZJ55w/PpGioPaSABqCbgmte0zGVHY2BlBsww2FCAoZr4B
         P/Dl71F7E4OKQKZdxFeoYn7gaHnQ4JqrzyakOIBI+KbUW6E8jLbuYZ224RYfNydUB3D+
         O5u8f8KuGlgghiWrKwvRhlX4BgTN0NM75i33UWSU7OUiS9xX1Xss7X9T9hBM1kteXior
         Z7Fy1PInYBZiHM+0/e6yQOMksodvHcg2cXGS+SSDSudaNx27URvWiELieUcs+fjpv8vR
         vW3owvwocf+yghdtYFQ5RdnUNYJBR5tiUYSOWWTg9ZKuAGaELegElQFdn5OirvYLE3EE
         TMiw==
X-Gm-Message-State: AOJu0YwdyPqOl95PQfrG0A7zctmmT4BYl/tfGxKQeUTXXUX+iTK+4R+r
	ZoDus58gyAAbTWaNAglsmkDplCkrOWMckU8+QSpRgAm3d2hcK+ZDuqUHZrrPCbUpU7HvywZQuWw
	128ol
X-Gm-Gg: ASbGnct30ESpWdFcibYwlxZE9Nchdg6ULf8z0zzzqLltFkR/Q+V++MvDLbevTePwE7J
	4kQ3QrNS49lyx4gQTgIFj8+K/1hWOIvBAPP1N4j8yXfIFePNmQl4+yIf5yn7tVG2ihrVDxGT51f
	3kLmhXOI7wSL1TORZGCDCi38BMvuV+hlCz8Sx/6eDuLoTI19k/Q2gkPVDc286aVVsgnAukvr8kY
	tS8xMUvgfLRPZfPpDnf91DB54IW6OVTM8+iMLzEe0sOxn6z+6cSO1RN6szhJpqmy4FUWlrSvPsu
	6Fgyz+tyHZXGsy5CfFTqOb52sTJvtHOeVmSIRY2d0Z9zQx2be+hkite4OJkKMyjUZ55BZcsRLLu
	Yo9wp4pGq3wfBKA==
X-Google-Smtp-Source: AGHT+IFfNB2akVI45Bs+xqKQ1iYyFBwD5ra2Tk1q0JDaqn879ja5VSNAalRbbiAlF6xfTgSJ4Elvug==
X-Received: by 2002:a17:90a:d404:b0:312:1d2d:18e2 with SMTP id 98e67ed59e1d1-32515ec1334mr21616655a91.20.1756215663774;
        Tue, 26 Aug 2025 06:41:03 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3274191c389sm1007414a91.4.2025.08.26.06.41.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:41:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 00/19] Patch review
Date: Tue, 26 Aug 2025 06:40:34 -0700
Message-ID: <cover.1756215509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222440

Please review this set of changes for walnascar and have comments back by
end of day Thursday, August 28

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2268

The following changes since commit 4b785d2d416944a78bf4c09e85a508ae80e35ca4:

  linux-firmware: fix FILES to drop RDEPENDS on full package (2025-08-20 13:27:57 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut

Archana Polampalli (10):
  gst-devtools: upgrade 1.24.12 -> 1.24.13
  gstreamer1.0-libav: upgrade 1.24.12 -> 1.24.13
  gstreamer1.0-plugins-bad: upgrade 1.24.12 -> 1.24.13
  gstreamer1.0-plugins-base: upgrade 1.24.12 -> 1.24.13
  gstreamer1.0-plugins-good: upgrade 1.24.12 -> 1.24.13
  gstreamer1.0-plugins-ugly: upgrade 1.24.12 -> 1.24.13
  gstreamer1.0-python: upgrade 1.24.12 -> 1.24.13
  gstreamer1.0-rtsp-server: upgrade 1.24.12 -> 1.24.13
  gstreamer1.0-vaapi: upgrade 1.24.12 -> 1.24.13
  gstreamer1.0: upgrade 1.24.12 -> 1.24.13

Michael Halstead (2):
  yocto-uninative: Update to 4.8 for GCC 15.1
  yocto-uninative: Update to 4.9 for glibc 2.42

Peter Marko (7):
  gnutls: mark CVE-2025-32989 and CVE-2025-32990 as fixed
  libarchive: patch CVE-2025-5916
  libarchive: patch CVE-2025-5917
  libarchive: patch CVE-2025-5918
  binutils: set status for CVE-2025-8224
  cve-update-db-native: fix fetcher for CVEs missing nodes
  vim: upgrade 9.1.1198 -> 9.1.1652

 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 .../recipes-core/meta/cve-update-db-native.bb |   2 +-
 .../binutils/binutils-2.44.inc                |   1 +
 .../0001-Improve-lseek-handling-2564.patch    | 319 ++++++++++++++++++
 .../libarchive/libarchive/CVE-2025-5916.patch | 111 ++++++
 .../libarchive/libarchive/CVE-2025-5917.patch |  49 +++
 .../libarchive/CVE-2025-5918-01.patch         | 217 ++++++++++++
 .../libarchive/CVE-2025-5918-02.patch         |  51 +++
 .../libarchive/libarchive_3.7.9.bb            |   5 +
 ...ols_1.24.12.bb => gst-devtools_1.24.13.bb} |   2 +-
 ...24.12.bb => gstreamer1.0-libav_1.24.13.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-bad_1.24.13.bb} |   2 +-
 ...b => gstreamer1.0-plugins-base_1.24.13.bb} |   2 +-
 ...b => gstreamer1.0-plugins-good_1.24.13.bb} |   2 +-
 ...b => gstreamer1.0-plugins-ugly_1.24.13.bb} |   2 +-
 ...4.12.bb => gstreamer1.0-python_1.24.13.bb} |   2 +-
 ...bb => gstreamer1.0-rtsp-server_1.24.13.bb} |   2 +-
 ...24.12.bb => gstreamer1.0-vaapi_1.24.13.bb} |   2 +-
 ...1.0_1.24.12.bb => gstreamer1.0_1.24.13.bb} |   2 +-
 meta/recipes-support/gnutls/gnutls_3.8.10.bb  |   3 +
 ...src-Makefile-improve-reproducibility.patch |  10 +-
 .../vim/files/disable_acl_header_check.patch  |  12 +-
 .../vim/files/no-path-adjust.patch            |   2 +-
 meta/recipes-support/vim/vim.inc              |   7 +-
 24 files changed, 788 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Improve-lseek-handling-2564.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5916.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5917.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-01.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-02.patch
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.24.12.bb => gst-devtools_1.24.13.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.12.bb => gstreamer1.0-libav_1.24.13.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.24.12.bb => gstreamer1.0-plugins-bad_1.24.13.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.24.12.bb => gstreamer1.0-plugins-base_1.24.13.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.24.12.bb => gstreamer1.0-plugins-good_1.24.13.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.24.12.bb => gstreamer1.0-plugins-ugly_1.24.13.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.12.bb => gstreamer1.0-python_1.24.13.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.24.12.bb => gstreamer1.0-rtsp-server_1.24.13.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.24.12.bb => gstreamer1.0-vaapi_1.24.13.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.24.12.bb => gstreamer1.0_1.24.13.bb} (97%)

-- 
2.43.0


