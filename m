Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484DFC38145
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 02:28:48 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web08.727.1662604123998164046
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 19:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zGn4abzO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id c198so6610944pfc.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 19:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=aJG4E1OcpbwY9ibEPQRW6WVcXw4Vrm45LBZ2jMokI1Q=;
        b=zGn4abzO66TUz1lVCfJ48Qbi+kM2J2yaoi3XYZG5qbOZQ0zcJX3j4GwydqhbJZh4sV
         XERi7P6Q3uRrI+dSx2gUO29Uv4ks60WiNy9yIiEIKs7DEhHV0cX9cbani+EJEMfq+Ep1
         /dIvCUJ/qO8VibHros2VO4MIGkagpVuBSnvCPT4YdZsUN/22ftpn5WFFHDbNXwqIcHYY
         rVLVmbWUD755j0NLU34nZffkst9KezDd4vB6XlgdkNCP0sg3MSFb3GcvYIY7KpRi7aQm
         Zuu3MB3gXRFzezAMSsJ9fKlqeKidd5Bv+0vrmX9kfuipd80eev/g1ZXJ/Aue7pDpJ2ja
         2rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=aJG4E1OcpbwY9ibEPQRW6WVcXw4Vrm45LBZ2jMokI1Q=;
        b=RRnGXNkXThvGcwEByJgUL8i/WHUwLXbMn8+IrXhRAo2CMv+BK+271lhFIC2HfAFBB8
         0XQ7RvekdRySSO+RuvWn7WItGjCbKDwwiqXVV7idvMTkLcuK2R++0UcFujro4clKy6Wq
         ExWb8irOSISfOqJgxbd6/oiBoLXoKGsmdngacx6fNKYU51xislBbeuK8H+tv3upkd0Yb
         LTHJqLchnBeiom3ZUVUCZSsVP50779RiluR4l9EdASv+Wn9WXIP5tOwWP46PuOSoKVNg
         w3UTgQOeqV+lMHmOQOLriDj/LUeg/KJ5v3hbhJpNL9GvFxlVO90O1kS4GV0C4QkFT/q5
         Iy/w==
X-Gm-Message-State: ACgBeo3qSU3Kv6jCMgZuPwPPNlAi/dhjCtva5e/pqbRFzDzKg321j+8V
	Tb19XwZfe8CP6gNaTc25Q2RZVs3R+q57ouT6
X-Google-Smtp-Source: 
 AA6agR7/MCPziYmBj1XkY5QcLSrT2/dabuCQxnHxR4PK2WDxQ/cInH2g9vBZzJfpoUxxjfdmWL6Cuw==
X-Received: by 2002:a62:ea14:0:b0:535:c678:8106 with SMTP id
 t20-20020a62ea14000000b00535c6788106mr6786839pfh.9.1662604122831;
        Wed, 07 Sep 2022 19:28:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 b11-20020a170902d50b00b0016c0c82e85csm1901398plg.75.2022.09.07.19.28.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 19:28:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/7] Patch review
Date: Wed,  7 Sep 2022 16:28:25 -1000
Message-Id: <cover.1662603861.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 02:28:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170439

Please review this set of patches for dunfell and have comments back by
end of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4200

The following changes since commit 345193f36d08cfe4899c65e8edf3f79db09c50d2:

  relocate_sdk.py: ensure interpreter size error causes relocation to fail (2022-08-29 05:02:16 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Hitendra Prajapati (1):
  sqlite: CVE-2022-35737 assertion failure

Joshua Watt (1):
  classes: cve-check: Get shared database lock

Ranjitsinh Rathod (2):
  libarchive: Fix CVE-2021-23177 issue
  libarchive: Fix CVE-2021-31566 issue

Richard Purdie (1):
  vim: Upgrade 9.0.0242 -> 9.0.0341

Robert Joslyn (1):
  curl: Backport patch for CVE-2022-35252

Ross Burton (1):
  cve-check: close cursors as soon as possible

 meta/classes/cve-check.bbclass                |  36 ++--
 .../recipes-core/meta/cve-update-db-native.bb |  51 ++---
 .../libarchive/CVE-2021-23177.patch           | 183 ++++++++++++++++++
 .../libarchive/CVE-2021-31566-01.patch        |  23 +++
 .../libarchive/CVE-2021-31566-02.patch        | 172 ++++++++++++++++
 .../libarchive/libarchive_3.4.2.bb            |   3 +
 .../curl/curl/CVE-2022-35252.patch            |  72 +++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
 .../sqlite/files/CVE-2022-35737.patch         |  29 +++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 11 files changed, 535 insertions(+), 40 deletions(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-23177.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-31566-01.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-31566-02.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-35252.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2022-35737.patch

-- 
2.25.1


