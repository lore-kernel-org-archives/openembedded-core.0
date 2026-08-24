Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89226C5DF9C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:00:45 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16146.1787576439287269731
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 06:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SzK9nlUv;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4998590d392so12368095e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787576437; x=1788181237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=233awZRUtSvzG4du3jjVFKud4Fe2RcfR+/gypsvv+CU=;
        b=SzK9nlUvBN2hGFBn3AaglO0z17t/7Rwf++/RKvf38rVLcCEKa0n47d0s6gT/gXVrPX
         oETITuwF6AX8JU9zKe9P0aPtMlh9ye+2wurdzaoxUMhAlkPeAo6MkAB+iVgSy/mPh+22
         LyLZ9iPD6ekyQX8xaYPJPz1LYjDx2SM4sEY50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576437; x=1788181237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=233awZRUtSvzG4du3jjVFKud4Fe2RcfR+/gypsvv+CU=;
        b=R0CahnhaAM4zAwqZnGvCjEwhEG+ipb0AAlrhkJDbFxYH2HTO+IWbJmFBqHbGEn0qF4
         p/SDrudBsmaUjVFi4TWDEyjWantsbGsCOHupRdSLZV/CBYntlDOT6ltOKN75GzzEQMaT
         cPdXv7vXjmI5m08T7MRlZVm9y1HsRFpl/gM6/31TemiytOfHXMyjvzyeEMaj5q/8ebvZ
         TLyhh3k45i2hqBmIww5S/36v7t+s4Log7rmOmQXN79JsrJgeT9LZDUWIRLtL4m3cqorw
         GPWgiyzT0ABRh2ei9gl/6AbNQlnXD8ex9Q+H0lRFm0vPekyleAc7BouLMnn10dXdsGh7
         Ring==
X-Gm-Message-State: AFuF++m5ZsMrU2Ml4YF6kJZUTHMR/FVLZTgdQPiud5iKALsCtT3ErrTh
	e5EWEyEOsU5Vuyx8DKwlK4mGLdy70ZV8g+kE0DYJ42TDuhtjRQzGqpe4GQJsZdQtWDpWAltcuxi
	PTTjG/Ok=
X-Gm-Gg: AR+sD12sPr6CiJu4STuiiqPG11FU0mIwajlAZVqE9ZQAeLXwGlJjZYS3ah/ES3+A5T3
	zjyQUdRZhSN5r5hzfQN0PJEex7kQaZITqlzil0II4VPM3zGvAkIGS/DcK0q2/gnFcCXFev6G4Yo
	NHpXN4MX/HnjNJHSuCiOYBNFJwHGOq0U+x2yggH4kj+3+afrw/XqoNx2PFLl8wKPfyrPa2CaXtQ
	r3eLsdVBI+u5HldRb3lch2T7lw5mo9X7igTmrQZCg5UDoVifLHaQb4uqe2XvwpEfu6lNwbMP215
	WGNd5pYtxQqDt0AtcgERXvXUuCJA6Cd4704ndJi46cknCYoENzkoMLgEHub86OC25nMMEHU4DsC
	gptvrUQhhTa+CPwFiJHT19AW7nSF7wF7TQ7TMYfm5ndwe6J8WILlZxl18hCht27nkH2gwmq002R
	I5sJ3/6bW0N7EFH17y3IyU8ZbxE5i3V37MydkkC6gCOfs1fIk1LX6vleNKY+MnBjB+tlrDWvy7V
	1OZ8d8OxzPciWxcYmAe6UHU/MHwBgFPhDoDzKY4GSBuoftp+DzJsWJN782alg3YDCAokLSe/ZUw
	yqWhEw==
X-Received: by 2002:a05:600c:8b16:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-499b8343dd3mr284729855e9.11.1787576437243;
        Mon, 24 Aug 2026 06:00:37 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35935f5sm61379865e9.2.2026.08.24.06.00.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:00:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 00/19] Patch review
Date: Mon, 24 Aug 2026 14:59:42 +0200
Message-ID: <cover.1787576160.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244099

Hello,

(I'm back from holidays. This is a series prepared by Fabien. Thanks to
him for handling things while I was away :) )

Please review this set of changes for wrynose and have comments back by
end of day Wednesday, August 26.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4542

The following changes since commit ef022bf82d79015802309d14c28b13373ebe53f5:

  build-appliance-image: Update to wrynose head revisions (2026-08-18 08:40:33 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-nut

for you to fetch changes up to f7397af248e1e338929d70a910b0fbc2341528ec:

  mirrors: Disable YP mirrors on autobuilder (2026-08-21 18:06:46 +0200)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  libssh2: fix CVE-2026-58050

Deepak Rathore (2):
  curl: fix CVE-2026-4873
  nghttp2: set status for CVE-2026-58055

Jaipaul Cheernam (6):
  libssh2: fix CVE-2026-66032
  libssh2: fix CVE-2026-66033
  libssh2: fix CVE-2026-66034
  libssh2: fix CVE-2026-66035
  binutils: Patch for CVE-2026-15003
  binutils: fix CVE-2026-18220

Michal Sieron (1):
  rpcbind: Drop dependency on quota

Peter Marko (6):
  busybox: patch CVE-2026-38754
  libsndfile1: patch CVE-2026-37555
  bison: patch CVE-2026-56389
  cpio: patch CVE-2026-66485
  cpio: patch CVE-2026-66484
  cpio: patch CVE-2026-66486

Richard Purdie (3):
  rpcbind: upgrade 1.2.8 -> 1.2.9
  oeqa/maturin: Update dependency version
  mirrors: Disable YP mirrors on autobuilder

 meta/classes-global/mirrors.bbclass           |  19 +-
 .../yocto-autobuilder/autobuilder.conf        |   1 +
 .../files/maturin/guessing-game/Cargo.toml    |   2 +-
 .../busybox/busybox/CVE-2026-38754.patch      | 155 ++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |   1 +
 .../binutils/binutils-2.46.inc                |   2 +
 .../binutils/binutils/CVE-2026-15003.patch    | 402 ++++++++++++++
 .../binutils/binutils/CVE-2026-18220.patch    |  65 +++
 .../bison/bison/CVE-2026-56389.patch          |  56 ++
 meta/recipes-devtools/bison/bison_3.8.2.bb    |   1 +
 meta/recipes-extended/cpio/cpio_2.15.bb       |   3 +
 .../cpio/files/CVE-2026-66484.patch           |  28 +
 .../cpio/files/CVE-2026-66485.patch           | 210 ++++++++
 .../cpio/files/CVE-2026-66486.patch           | 497 ++++++++++++++++++
 .../0001-systemd-use-EnvironmentFile.patch    |   7 +-
 ...pcbind_add_option_to_fix_port_number.patch |  25 +-
 .../{rpcbind_1.2.8.bb => rpcbind_1.2.9.bb}    |   4 +-
 .../libsndfile1/CVE-2026-37555.patch          |  44 ++
 .../libsndfile/libsndfile1_1.2.2.bb           |   1 +
 .../curl/curl/CVE-2026-4873.patch             |  52 ++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 .../libssh2/libssh2/CVE-2026-58050.patch      |  45 ++
 .../libssh2/libssh2/CVE-2026-66032.patch      |  36 ++
 .../libssh2/libssh2/CVE-2026-66033.patch      |  45 ++
 .../libssh2/libssh2/CVE-2026-66034.patch      |  40 ++
 .../libssh2/libssh2/CVE-2026-66035.patch      |  56 ++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |   5 +
 .../recipes-support/nghttp2/nghttp2_1.68.1.bb |   2 +
 28 files changed, 1776 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-38754.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-15003.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-18220.patch
 create mode 100644 meta/recipes-devtools/bison/bison/CVE-2026-56389.patch
 create mode 100644 meta/recipes-extended/cpio/files/CVE-2026-66484.patch
 create mode 100644 meta/recipes-extended/cpio/files/CVE-2026-66485.patch
 create mode 100644 meta/recipes-extended/cpio/files/CVE-2026-66486.patch
 rename meta/recipes-extended/rpcbind/{rpcbind_1.2.8.bb => rpcbind_1.2.9.bb} (95%)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-37555.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-4873.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66032.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66033.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66035.patch


