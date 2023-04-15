Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE1AC77B70
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 15:26:58 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.10377.1681572415910962598
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 08:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=DkVnDU2z;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1a516fb6523so16865445ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 08:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681572414; x=1684164414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=32rmiEhgg3hzu071n4YSZyeBJP3deTxvy7lTgu1Lk7o=;
        b=DkVnDU2z3gQc1nWZs/mQY+fNFfGCuHr29iFKkcmH9VlK0EQar8io2CCQTzdrXTr8EN
         Nw2BgBP0kcAcpzxzNhCynehWUKxJINafSuWNLfibND5bdOxRR7xL/Gln/2VIwdY23B3q
         Y0sZkTy/hLZnbRH53/NCnUW6NLoLatb2/MSNQxnv7wCplIqu4do9Y62qONpMgGX+jNpn
         rn2AAJsAQbChcFRgsT5OqpUoaP0NCKxZAsj7jNFPoMtpIwa/7Ym1CWsRUD+ocOrpIv0g
         5hwfS2xIc4cxAr8VTznK2sdANsp6AXmBuzd+mh5bpB/mEm/I6e4nRGJXyvljz5pt2Xte
         2BIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681572414; x=1684164414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=32rmiEhgg3hzu071n4YSZyeBJP3deTxvy7lTgu1Lk7o=;
        b=h7Skbxc8MAWo50AAZsrt3GYNQTpzG6zWoVYiMaAcIyLL6k6l5lD5gg0Usflnhnfijk
         N+1XneIKSP7F3zmo2VjG27x0KTS7efUXOy2MqOakiVn1yrgkNlm+m82JwYPu1/qTpHdo
         yl5E2j5u/e14rBLqNVdCFTtU4kenhmP6xEVgOLO5+zWEc8dTabYQMT6iF1TH6yomCiQP
         x6n865KMlqrq53R3stVwlTLhULw7mJRJD8CbnvO+Nf2lhnl8oGSeoBvAoHbCslkmzXOq
         BWrYfAAcKIdHPw3Y3Edmsd3/vQbt7aLdLMSuVj3gMCiS3YwhwAXwqTjKKz5+hLaXV+c1
         lQ2w==
X-Gm-Message-State: AAQBX9d0yZkR88TA8Ywb8r83bdXjuoe8iccu74WXNWQLnMLQu5+r5RT1
	1QcrisR96r3NGigU3v/da6S8ehDSJDFStkwI7nk=
X-Google-Smtp-Source: AKy350ZhnPOuPRGNC2EbO4OwaHWbR9WNmJaGXyZGfuTjt16bfVn2ajdHcRkbvCXg0WX8NpKK46b0yw==
X-Received: by 2002:a05:6a00:2494:b0:63b:244e:c8ca with SMTP id c20-20020a056a00249400b0063b244ec8camr14843644pfv.33.1681572414374;
        Sat, 15 Apr 2023 08:26:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id u22-20020aa78496000000b0063b1e7ffc5fsm4824410pfn.39.2023.04.15.08.26.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 08:26:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/7] Patch review
Date: Sat, 15 Apr 2023 05:26:37 -1000
Message-Id: <cover.1681572283.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 15:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180010

Please review this set of patches for kirkstone and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5185

The following changes since commit ff4b57ffff903a93b710284c7c7f916ddd74712f:

  uninative: Upgrade to 3.9 to include glibc 2.37 (2023-04-04 05:32:01 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Hitendra Prajapati (2):
  curl: CVE-2023-27533 TELNET option IAC injection
  curl: CVE-2023-27534 SFTP path resolving discrepancy

Joe Slater (1):
  go: fix CVE-2022-41724, 41725

Mark Hatle (1):
  openssl: Move microblaze to linux-latomic config

Pawan Badganchi (1):
  tiff: Add fix for CVE-2022-4645

Peter Marko (1):
  package.bbclass: correct check for /build in copydebugsources()

Yash Shinde (1):
  binutils : Fix CVE-2023-1579

 meta/classes/package.bbclass                  |    2 +-
 .../openssl/openssl_3.0.8.bb                  |    4 +-
 .../binutils/binutils-2.38.inc                |    4 +
 .../binutils/0021-CVE-2023-1579-1.patch       |  459 ++++
 .../binutils/0021-CVE-2023-1579-2.patch       | 2127 +++++++++++++++
 .../binutils/0021-CVE-2023-1579-3.patch       |  156 ++
 .../binutils/0021-CVE-2023-1579-4.patch       |   37 +
 meta/recipes-devtools/go/go-1.17.13.inc       |    5 +-
 .../go/go-1.19/add_godebug.patch              |   84 +
 .../go/go-1.19/cve-2022-41724.patch           | 2391 +++++++++++++++++
 .../go/go-1.19/cve-2022-41725.patch           |  652 +++++
 ...-of-TIFFTAG_INKNAMES-and-related-TIF.patch |    5 +-
 .../curl/curl/CVE-2023-27533.patch            |  208 ++
 .../curl/curl/CVE-2023-27534.patch            |  122 +
 meta/recipes-support/curl/curl_7.82.0.bb      |    2 +
 15 files changed, 6252 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0021-CVE-2023-1579-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0021-CVE-2023-1579-2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0021-CVE-2023-1579-3.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0021-CVE-2023-1579-4.patch
 create mode 100644 meta/recipes-devtools/go/go-1.19/add_godebug.patch
 create mode 100644 meta/recipes-devtools/go/go-1.19/cve-2022-41724.patch
 create mode 100644 meta/recipes-devtools/go/go-1.19/cve-2022-41725.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27533.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27534.patch

-- 
2.34.1


