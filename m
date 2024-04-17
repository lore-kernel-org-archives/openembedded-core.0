Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA30C41513
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 20:35:45 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.24872.1713386137122386824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 13:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sG8dVKSp;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2a4bdef3d8eso174678a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 13:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713386136; x=1713990936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/kaVN9FTSMfnidGRwHIRv301YBlXDHKJip10mZcyeso=;
        b=sG8dVKSpaVyC7odbKX22qfeViI3Q1omdzXxxIDlcQphD7liSYfnURPolxIdEkJYPpb
         B5FYqWAcGwhlT1sd7cSBnC6WWFSCi2o/3iA1zzJOLykA3KtgDd9Om5ehrmEiB/ka5C6R
         dPUwz/JOL7KRAPaFUD42PaDQU/qqU+yNtN0uzcanwQsKmiN0iPguc5SIkWPQ4Cp95Clm
         JN1bx4JKF6L4D0KydeH5NpDE20FW195O3so4VdgNf3nSoYB283weXrptpt9deJ3QoIZO
         stB/blGXAT4RkvvYzyBWXAWDkWA9zhO8o5flMQg/eTuZ9J3rduYUALknXXRKZxKWTDci
         l/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713386136; x=1713990936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/kaVN9FTSMfnidGRwHIRv301YBlXDHKJip10mZcyeso=;
        b=P5bRM30dWjgqBe+2rBSllXSMtX//0+hCwO4dy7gXN1uYnrAfqBFmkU1joP1tMFxnSt
         zVvgd7wdnSaj6yZyFbTB68YVhxs1LBE3Se3nAkhJeb3ZXj98C8Ws6lrt+KZpErdGA1FV
         5+fu74qCcqc3IneZ+dIDPNS67xY8vdCmdxfVMq4dcyVB83rrh0lEoKzvbFnZVji3rNPZ
         h+k2fWhLbAYHsTVupBv1+w+TJrlOFYh+D/DRL9cy/CgkwfWl1e7HjnDI0ETntr2VKMf+
         LrRyKEZnw0N+sC4Gi/yhR7DNewri5o50xzj25M+yJqClgQOUTuvRp0JRZGXQRxMrQGKC
         f9Mg==
X-Gm-Message-State: AOJu0YwG2U3ISlnYlqJiJHRGEEcdjt8HXbmIU2Sd2ZihSpsJ7f22h6kS
	ou5/PhYIzmyjI1aU2/q9dbTf8Gwdw68Jh6yF/vQX+Cl8iWXv+gDdYsNVPSVYCK4gCCJQyxgxAkZ
	dLaY=
X-Google-Smtp-Source: AGHT+IGX5fOZxXGa1zSVTJdvoyDeQTmYWsQuW7KxF5XB5P4BueT+cK4ZZVIa5aoeM0+PSkfFiz7tMw==
X-Received: by 2002:a17:90a:a8f:b0:2a4:f53d:e732 with SMTP id 15-20020a17090a0a8f00b002a4f53de732mr523327pjw.13.1713386136134;
        Wed, 17 Apr 2024 13:35:36 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id s22-20020a17090aa11600b002ab664e5e17sm76876pjp.1.2024.04.17.13.35.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:35:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/7] Patch review
Date: Wed, 17 Apr 2024 13:35:24 -0700
Message-Id: <cover.1713385733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 20:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198477

Please review this set of changes for kirkstone and have comments back by
end of day Friday, April 19

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6817

The following changes since commit f94c74cee8b2650dd3211a49dc7e88bf60d2e6a7:

  tcl: skip async and event tests in run-ptest (2024-04-16 05:00:24 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Harish Sadineni (1):
  rust: add CVE_CHECK_IGNORE for CVE-2024-24576

Meenali Gupta (1):
  libssh2: fix CVE-2023-48795

Poonam Jadhav (1):
  ppp: Add RSA-MD in LICENSE

Sana Kazi (1):
  systemd: Fix vlan qos mapping

Soumya Sambu (1):
  nghttp2: Fix CVE-2024-28182

Steve Sakoman (1):
  valgrind: skip intermittently failing ptest

Yogita Urade (1):
  ruby: fix CVE-2024-27281

 meta/recipes-connectivity/ppp/ppp_2.4.9.bb    |   2 +-
 .../systemd/fix-vlan-qos-mapping.patch        | 140 ++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |   1 +
 .../ruby/ruby/CVE-2024-27281.patch            |  97 ++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |   1 +
 meta/recipes-devtools/rust/rust-source.inc    |   3 +
 .../valgrind/valgrind/remove-for-all          |   2 +
 .../libssh2/libssh2/CVE-2023-48795.patch      | 459 ++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.10.0.bb |   1 +
 .../nghttp2/nghttp2/CVE-2024-28182-0001.patch | 110 +++++
 .../nghttp2/nghttp2/CVE-2024-28182-0002.patch | 105 ++++
 .../recipes-support/nghttp2/nghttp2_1.47.0.bb |   2 +
 12 files changed, 922 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/fix-vlan-qos-mapping.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2023-48795.patch
 create mode 100644 meta/recipes-support/nghttp2/nghttp2/CVE-2024-28182-0001.patch
 create mode 100644 meta/recipes-support/nghttp2/nghttp2/CVE-2024-28182-0002.patch

-- 
2.34.1


