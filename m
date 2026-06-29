Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E159EC43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:20:27 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38580.1782742826723077491
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 07:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kR+87AqZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-46cf972f281so1847061f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782742825; x=1783347625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cS9NyzrGM2ih/95PE9k8va5yu33TXSdVXZKRKzJjNhw=;
        b=kR+87AqZXNQDtAhn0r62AGbDRg9Sk1mbF95HoLfKmDSa3wGX3kO9fAGxunMFGdJBwN
         8nZPx9JAo61oL1MT/tgMLWYinQ2ES6Xobo7Aa7WMoYC5zP1qWEaCV5lcErl3gcwPruEQ
         g7bOsZkeYd3VlsgOaEPfo+XuGcbhZPAeUG5Ew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742825; x=1783347625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cS9NyzrGM2ih/95PE9k8va5yu33TXSdVXZKRKzJjNhw=;
        b=o7UtoqEuxDCjsT7X9tgW20SvmuLgcW64BlyvMwhaiIk31lOCSvc/yrOeABseSq+k1d
         HdWXUe0MTRVchupvNwC/KE81yq4Yy/BBvdNtOHA4CG5Im9jBuHYj08lI+7WCTgmo6cXp
         Y5/S3V0qhM9sukzPR3hzVk9fm8JLPFI3K96cYU0q6urmlwZYu6jAL6yRjrFUORVoyaMh
         mosIcKeoHZRTL8tn5jK8UYQlFKSaH3RixvLFnP04dgpofko3J2SX2xCnwOjSoRFgo1xV
         d1VR5T52iqmXXltCbn840HmlLgUmrqVE4p2WL1fXNXHxjVL4isNeyOoLI9eeKyNbOaUI
         n3Nw==
X-Gm-Message-State: AOJu0YxbGPF5JLChClB9sY+ey0SeKnsrXDXIVO8J5On6DyuJkko0Kt/w
	Wlj0ojYYrP1L+lcxQSZT9l91m+F/g55TNZBQHdxAjvYUr5EN6c6Z94KNUebSJzprK9uddqxqIJH
	pK3MyspA=
X-Gm-Gg: AfdE7ckLyxZtZcvzrTPr1BBb7JUf7N7wKbU0GUiHqZIYAiCFW3gXSiUt/MSxFChNm/d
	OqC3j9xsBbBOEJw85B5kd2/f0pOy/h/7K+RFZ/jA+RFSL4Z/gS79XR9HgxVlGwq+H6K9ZawESKT
	JVawP+fbGdBgVqpdJlXGYEtD0oEI5savBRwXCSW4nau1IBsfIBK87ysbMMtqf46aHnZycOSmfts
	WZbwZwG/JAzmHMvzybMhdndjdI/l8toPL5gS159peCuqLCVX0G1ao4bVAKuQX7Apn0nVClWi/rT
	b0KsqnFdRVJtFnHZxtxWrMgRp4A5WGSOPtR39rGFUJCOtUWNWcQqyjJ+KaAFIXg/jHCslYA5Tll
	ejvXBFOS9vkGMnch2Mz+fW+ISMg+zrGxfC7snfmc5PzzrlMt7loBc145GAePuaF8/huKOtD82qb
	FlNaH/Q5CixtNCmEGO0BE8mKkO3nEFhIbg1pJLTyuwjrWzxUjtXzPDc0JxSpRRlmdG4bJgr+OoL
	S3hnxxiwE8dLQ97Z9obtWSfvb72CuoZTw==
X-Received: by 2002:a05:6000:3111:b0:45e:e1a4:c4c3 with SMTP id ffacd0b85a97d-46dbf7d292dmr28362554f8f.15.1782742824419;
        Mon, 29 Jun 2026 07:20:24 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm44958410f8f.5.2026.06.29.07.20.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:20:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/19] Patch review
Date: Mon, 29 Jun 2026 16:19:45 +0200
Message-ID: <cover.1782742373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 14:20:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239788

Please review this set of changes for scarthgap and have comments back by
end of day Wednesday, July 1.

Some patches are aimed at progressing toward Ubuntu 26.04 support:
* gawk: use native gawk when building glibc and grub
* grub/glibc: Bump versions to resolve hashequiv/reproducibility issues
* gawk: trim native build configuration
* gawk-native: fix gcc-15/C23 compilation issues

Improving the NVD CVE data fetching:
* cve-update-nvd2-native: allow setting resultsPerPage
  NOTE: This patch does not exist in more recent branches
		(cve-update-nvd2-native was drop in favor of git based fetching)

Move away from /git/ in URLs for oe/yp.org servers:
* oeqa: Drop /git/ from our urls
* recipetool: Recognise https://git. as git urls

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4103

The following changes since commit 737293bead3e7b994347e47f09bc69437479d50c:

  linux-yocto/6.6: address ltp hang (2026-06-23 20:33:35 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-review
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-review

for you to fetch changes up to 54ce24005721f5c82d42242524eaed93c8cbeafa:

  recipetool: Recognise https://git. as git urls (2026-06-29 11:31:24 +0200)

----------------------------------------------------------------

Alexander Kanavin (1):
  gawk: use native gawk when building glibc and grub

Amaury Couderc (1):
  python3: fix CVE-2026-4224

Anil Dongare (1):
  libusb1: fix CVE-2026-23679 and CVE-2026-47104

Awais B (1):
  cve-update-nvd2-native: allow setting resultsPerPage

Harish Sadineni (1):
  binutils: Fix for CVE-2025-69648 and CVE-2025-69646

Hitendra Prajapati (2):
  libsoup: fix for CVE-2025-11021
  libsoup: fix for CVE-2026-2369

Richard Purdie (3):
  grub/glibc: Bump versions to resolve hashequiv/reproducibility issues
  oeqa: Drop /git/ from our urls
  recipetool: Recognise https://git. as git urls

Ross Burton (1):
  gawk: trim native build configuration

Sudhir Dumbhare (1):
  nfs-utils: fix CVE-2025-12801

Theo Gaige (Schneider Electric) (1):
  go: patch CVE-2026-27145

Vijay Anusuri (5):
  xwayland: Fix CVE-2026-33999
  xwayland: Fix CVE-2026-34000
  xwayland: Fix CVE-2026-34001
  xwayland: Fix CVE-2026-34002
  xwayland: Fix CVE-2026-34003

Yoann Congal (1):
  gawk-native: fix gcc-15/C23 compilation issues

 .../recipes-test/gitrepotest/gitrepotest.bb   |   2 +-
 .../gitunpackoffline/gitunpackoffline.inc     |   4 +-
 .../lib/oeqa/manual/toaster-managed-mode.json |   6 +-
 meta/lib/oeqa/sdkext/cases/devtool.py         |   4 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |   4 +-
 meta/lib/oeqa/selftest/cases/recipetool.py    |   2 +-
 meta/recipes-bsp/grub/grub2.inc               |   6 +-
 .../nfs-utils/CVE-2025-12801-build-fix.patch  |  44 ++
 .../CVE-2025-12801-dependent_p1.patch         | 450 +++++++++++++++++
 .../CVE-2025-12801-dependent_p2.patch         |  81 +++
 .../CVE-2025-12801-dependent_p3.patch         | 181 +++++++
 .../CVE-2025-12801-dependent_p4.patch         | 468 ++++++++++++++++++
 .../nfs-utils/nfs-utils/CVE-2025-12801.patch  | 254 ++++++++++
 .../nfs-utils/nfs-utils_2.6.4.bb              |   6 +
 meta/recipes-core/glibc/glibc.inc             |   6 +-
 .../meta/cve-update-nvd2-native.bb            |  13 +
 .../binutils/binutils-2.42.inc                |   2 +-
 ...ch => CVE-2025-69646_CVE-2025-69648.patch} |   2 +-
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-27145.patch                |  96 ++++
 .../python/python3/CVE-2026-4224.patch        | 121 +++++
 .../python/python3_3.12.13.bb                 |   1 +
 .../0001-Fix-some-C23-compilatio-issues.patch |  35 ++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |  15 +-
 .../xwayland/xwayland/CVE-2026-33999.patch    |  49 ++
 .../xwayland/xwayland/CVE-2026-34000.patch    |  72 +++
 .../xwayland/xwayland/CVE-2026-34001.patch    | 104 ++++
 .../xwayland/xwayland/CVE-2026-34002.patch    |  93 ++++
 .../xwayland/xwayland/CVE-2026-34003-1.patch  | 113 +++++
 .../xwayland/xwayland/CVE-2026-34003-2.patch  | 223 +++++++++
 .../xwayland/xwayland_23.2.5.bb               |   6 +
 .../libsoup-3.4.4/CVE-2025-11021.patch        |  57 +++
 .../libsoup/libsoup-3.4.4/CVE-2026-2369.patch |  32 ++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   2 +
 ...-2026-23679_CVE-2026-47104-dependent.patch |  46 ++
 .../CVE-2026-23679_CVE-2026-47104.patch       |  88 ++++
 meta/recipes-support/libusb/libusb1_1.0.27.bb |   2 +
 scripts/lib/recipetool/create.py              |   2 +-
 38 files changed, 2676 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-build-fix.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p1.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p2.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p3.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p4.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801.patch
 rename meta/recipes-devtools/binutils/binutils/{CVE-2025-69648.patch => CVE-2025-69646_CVE-2025-69648.patch} (99%)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-27145.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4224.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/0001-Fix-some-C23-compilatio-issues.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2026-33999.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2026-34000.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2026-34001.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2026-34002.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2026-34003-1.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2026-34003-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-11021.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2026-2369.patch
 create mode 100644 meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104-dependent.patch
 create mode 100644 meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104.patch


