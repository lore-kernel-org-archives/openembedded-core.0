Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88618C54F30
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 13:36:44 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.7105.1748093796772954451
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 May 2025 06:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mee/u56d;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so641946a91.3
        for <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 06:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748093796; x=1748698596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/bxzGi8iFEn4IGqbFdfqrx0ik6N3ptlbGcvesd2Klc=;
        b=mee/u56dA5O0IrTb05752v8bIfXst4N28rFK13rRYrSTy620wob+VK2RFaixMVlwni
         SyLo43moim19FWDIehEDc+HogOh4rxHkc8bNzUcvsN8D586l0N8FBbteQCYj8jV9g6RG
         FTd+4DG1pxHICXJCqHjD1+4ZyuWEx1ecWX+zOHvP28RiOdwYn9tC2ljDmYjJaINl1kt6
         jQWtapOGIYYDjgyBH0ccCYwZ1D72ZPgkqzU/Yk9FD8JMU5o+AljKmlJK/2TG7wkm7b4v
         5QKUGZcPJFtfY7dHK9ZQriz01AjgK8WtWt0e6QwFUReSpxoGVMnxbiK586Y+HA38W/ZC
         lvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748093796; x=1748698596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L/bxzGi8iFEn4IGqbFdfqrx0ik6N3ptlbGcvesd2Klc=;
        b=VKlAFbNMSode2Xprf0gDeqxg1jmt+H/9nNyVSUjtkOH7cGBJWYSFGjC7iB7rSC9biX
         qvr9uDiBwk6Jou/vtTdNX/6/oOUmppbrUiknhUmzW9ye2VB0PP+hrbFw4kelWX6WVMzt
         GgXmyVT5bJIGSNNziBNT/TquN6m9GqNqK9CglCMjrM0TsC8xI/G44hwIhYXX4qQaPWzn
         EVGHJtagZbrQvkJKsYrm8S4mvC95m9OQOOtEsuTIxEMW68DztMNMuYgq6CWinE5OmyeV
         9VW/II4p6v8YgfLSPhocwZ+0b+0LOTo7AJVA7wo0PyvacrqIBDWlyBjKe8XI9AwOg7Ua
         QHyA==
X-Gm-Message-State: AOJu0Yxkxt/lb0vFcxI1YGx7j4IrbmtZhCtGigBuK9bEW0IHfcs7RKbT
	IshRRN794Z6413+gvKtvtC0N9YHA/93/ymUSswxaLtFSB5p+2rDcNinp2j20MWP2EuyrVuEfwOG
	aTXMa
X-Gm-Gg: ASbGncsY65Yl1ncgUNUg89gVoGxnVNbH9Ro9dQE0FZZvTsgYDzSF4GtswECDc84V1b5
	zCJiga6/l0Mq1Sq6c5Uhi1xwSL+NgPaJ0Bqrwom9qne80ix4umRrnDtJlb2PcsC6R0zdMky3Ijm
	2La+junnYuqNx3vMkvzeInpfTU2vFmxin+jZwVt40LM8qSK8vBZxpQwxQk0kq2FSI9f9pwIGi5w
	y66EBAWV9nI0BKed5BnppBUlVOfLm3BG/78HK4IZkP3qo9O9OwOkrGIp6hXQ3LehSIu+if3ECIb
	hSZpi2Mqxp02RQ7emY1FRqb1UGHjz7lhO36bCuli3y4=
X-Google-Smtp-Source: AGHT+IGFtJxTsdKP3PjtsYyELAs/C9ZsYJOZs9mvedvFJV8oP/Jw7JJalYk/09Gsd4YlkmzkoVihKw==
X-Received: by 2002:a17:90b:3d07:b0:2fe:b937:2a51 with SMTP id 98e67ed59e1d1-311108a1d06mr4958476a91.33.1748093795705;
        Sat, 24 May 2025 06:36:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3157:44bf:9f62:fea8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4f9csm9058913a91.20.2025.05.24.06.36.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 06:36:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/12] Patch review
Date: Sat, 24 May 2025 06:36:16 -0700
Message-ID: <cover.1748093626.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 13:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217225

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday, May 27

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1647

The following changes since commit e8be08a624b2d024715a5c8b0c37f2345a02336b:

  build-appliance-image: Update to kirkstone head revision (2025-05-16 09:00:49 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Ashish Sharma (1):
  libsoup-2.4: Fix CVE-2025-46420

Divya Chellam (1):
  ruby: fix CVE-2025-27221

Praveen Kumar (2):
  connman :fix CVE-2025-32366
  glib-2.0: fix CVE-2025-4373

Sundeep KOKKONDA (1):
  gcc: AArch64 - Fix strict-align cpymem/setmem

Vijay Anusuri (5):
  openssh: Fix CVE-2025-32728
  libsoup-2.4: Fix CVE-2025-32910
  libsoup-2.4: Fix CVE-2025-32911 & CVE-2025-32913
  libsoup-2.4: Fix CVE-2025-32912
  libsoup-2.4: Fix CVE-2025-32914

Virendra Thakur (1):
  util-linux: Add fix to isolate test fstab entries using CUSTOM_FSTAB

Yi Zhao (1):
  iputils: Security fix for CVE-2025-47268

 .../connman/connman/CVE-2025-32366.patch      |  41 ++
 .../connman/connman_1.41.bb                   |   1 +
 .../openssh/openssh/CVE-2025-32728.patch      |  44 ++
 .../openssh/openssh_8.9p1.bb                  |   1 +
 .../glib-2.0/glib-2.0/CVE-2025-4373-01.patch  | 120 +++++
 .../glib-2.0/glib-2.0/CVE-2025-4373-02.patch  |  29 ++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |   2 +
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../util-linux/fstab-isolation.patch          | 419 ++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-11.5.inc        |   1 +
 ...rch64-fix-strict-align-cpymem-setmem.patch |  45 ++
 .../ruby/ruby/CVE-2025-27221-0001.patch       |  57 +++
 .../ruby/ruby/CVE-2025-27221-0002.patch       |  73 +++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |   2 +
 .../iputils/iputils/CVE-2025-47268.patch      | 143 ++++++
 .../iputils/iputils_20211215.bb               |   1 +
 .../libsoup-2.4/CVE-2025-32910-1.patch        |  97 ++++
 .../libsoup-2.4/CVE-2025-32910-2.patch        | 148 +++++++
 .../libsoup-2.4/CVE-2025-32910-3.patch        |  26 ++
 .../CVE-2025-32911_CVE-2025-32913-1.patch     |  72 +++
 .../CVE-2025-32911_CVE-2025-32913-2.patch     |  44 ++
 .../libsoup-2.4/CVE-2025-32912-1.patch        |  41 ++
 .../libsoup-2.4/CVE-2025-32912-2.patch        |  30 ++
 .../libsoup/libsoup-2.4/CVE-2025-32914.patch  | 137 ++++++
 .../libsoup/libsoup-2.4/CVE-2025-46420.patch  |  60 +++
 .../libsoup/libsoup-2.4_2.74.2.bb             |   9 +
 26 files changed, 1644 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-02.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/fstab-isolation.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0001.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0002.patch
 create mode 100644 meta/recipes-extended/iputils/iputils/CVE-2025-47268.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32911_CVE-2025-32913-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32911_CVE-2025-32913-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch

-- 
2.43.0


