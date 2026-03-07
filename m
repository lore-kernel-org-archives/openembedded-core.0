Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7965CF55117
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 22:52:56 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19036.1772923972311289901
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 14:52:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=agTC7Z+V;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b9b1900bso5038903f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 14:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772923970; x=1773528770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iSBMHbFGsllu3X23XVbDSoYP00NpYevpJApErSLoFAw=;
        b=agTC7Z+V6Sz7eGDBdK9PMGMAisoXZh748GmiL0EGK0wGh74mNbXhQRrWKKO/v4yknw
         680Psw9uOVGcfKwDQKDIYD05MNCaHX/q8k4eSMnCQCS1XyiNfYInslApf+9tU8F4lHeN
         fBMOe6sjl++86+kETnbr5zxMENIq4FT2hyzLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772923970; x=1773528770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSBMHbFGsllu3X23XVbDSoYP00NpYevpJApErSLoFAw=;
        b=lczfAnP/PTCCcecgAaguacSg8i5LdXpM4jm/gV0jHtKeuDheJnysXItupyAbnSXBOQ
         Q9zdwtiv8W66hHRuAQL3VWDZ8dM+JW7V2TMAFyLYoD8bou87apmL01nmvoGWu6AjEbk1
         9QytVqho+/NrnxhockgYc9Xt7mbcaajM5npeh1DnaErNgk+iG75Lxh/IDSWAejgPNRqL
         SOyeu45nIfNT9UEb68myASg14AMw2o1l5ZCXjXr6pQnSCe2Rkz/QqxmIrQ4FHIoPUEvn
         NqZ0ZWgnrT9aD7V68jCd/lz/GR4GCelLcHFeItGXwf+gU4/uRhNWau0b1YUc8A6llkAM
         J1Hw==
X-Gm-Message-State: AOJu0Yw7WJXFofq7wR63DQcgeuRuMzoE5MpmInVWgVR3tVWEg/ujCC0X
	xUYVtmB3sqAilmMVJ79jlCuxYbHYYgbaMCffPZ3lUR+rnJbs0gDVAf5xqgJQCyQ3u8wYvCYzklO
	a90HC
X-Gm-Gg: ATEYQzwjDwA3yj6KvoTYC2VxX1SdChksmhZkT89Swtix7JjWsmgT/955SecwjzODtGB
	bV2sTOlIyXGojJQ8Yp6LaUuQXYRa3BOXhEAQUEYNGiD8NsjlY2ozYCBct1/pjIt+RctdYCTXWWv
	DPgzaF8M6Ddpu/VTKHgxn/vG38k8DokmMJdygyNGl4b+y5HMVFZ6tEBx7fbUCusuappD8Bb/f7i
	W8Xm8jjhkJu7nhjXIyy4zue7e4JhcPri3JuVyt/ZG0l3J6kB8ywBPMO5SB1nYu8mts0EwOEfDbi
	ZA1jilxTslvwkqlbXXFXkNN62Llx3uS5h0TOvv8Ig2KD0KXhpNuncv1y0b1k1dQosZ11Kcl5nNf
	BH6P6KOMRdqzP77x02r2IJGRszzT0ASfK4/xIvf3jNPQvrdUF5XJcPNLaa6lchTjBgGQWg6ljKc
	3zTmmnxFcA8ZCvMgMhJ0rhNXChAzrBUkuOnsw0yLpnNFS347L6ezsD3CmzoI0bcEXyU7C6KQhRb
	SusTJR6hVkadbMQZxdeSVtAy41t8yS+/gRccg==
X-Received: by 2002:a05:600c:34d0:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-4852696b8e3mr111775195e9.19.1772923970144;
        Sat, 07 Mar 2026 14:52:50 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm133287175e9.6.2026.03.07.14.52.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 14:52:49 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/11] Patch review
Date: Sat,  7 Mar 2026 23:52:17 +0100
Message-ID: <cover.1772923420.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 22:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232625

Note: this series contains a major OpenSSL upgrade (agreed by YP TSC).

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, March 10.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3349
(Ignore the warning about Centos Stream9, its support is a work in progress for scarthgap)

I also did a full meta-oe build (to check for build failure with the
OpenSSL upgrade)
https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1342
(the warnings are unrelated to this series)

The following changes since commit a9a785d7fa0cfe2a9087dbcde0ef9f0d2a441375:

  build-appliance-image: Update to scarthgap head revision (2026-02-27 17:45:15 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

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


