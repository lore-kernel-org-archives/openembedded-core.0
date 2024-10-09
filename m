Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82054CEE32A
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 16:17:12 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.21076.1728490622465705032
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 09:17:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HJMjjKIZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20b8be13cb1so76263415ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 09:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1728490622; x=1729095422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hFlj/TGSf2BQP5ku57Z1mHYgnhAtK3llgRwNyJxKNTE=;
        b=HJMjjKIZX9gyO6CT5E2l5Yx/89J6iDFOrh3Z+rNgDKeWS1MX7s1xQXsrv3ORf4R4WY
         4oNx2+PFFmZfb+8GBpflE4Uej8hBJFZFmsecPIF6nGrsS+2ZODHvctowIZYngtjHhCbZ
         U0dOpJAh1SgFqfAY6voESL1ogAn1yIzn9N5KHzUAMvEIy/3+bvgENDVAlU317EgN9IPJ
         gUdK9eZuhsqVycSdLghnHXqBVFRi8HqOUOiOL/nRB46zL8Q6jHAeKVcaUG9CPSKjMz7Y
         LcnA3jGeZVcKSP7TJtQ7ipp3CmPOPFEBZIi4K5WEqZHk3innEE9a97GncrcxJ+nEQWds
         fgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728490622; x=1729095422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hFlj/TGSf2BQP5ku57Z1mHYgnhAtK3llgRwNyJxKNTE=;
        b=VDHtcc03fgiVlTNcL21Us2HB/UZDV/0kubyNNJ97v5/7Jsfcc3FmDcuJqvxTUu5d3b
         id5m/oM3uak3hlPDzod6VMk3pXYT8MG42djSjHnXrphLln//sJ1tNOrd+n5MjA/7DQWW
         eRiU+IhmObjjTBWuSVRRi5xY3T2TiLQEBeBIrNIpTCC0u5bi6EbhFOYWHHW5n+ZOUyd2
         4N6cZ3XFWB+p+meOhC4P2JGvYv62MWJUEy+FwS4yW2fHbgAGf9RE4Y9IizlP90G7NNbj
         7TgxJ/MFEeO29E82QELovjuqsVxxnM8oXS1HErDY6Twc9hAlgrZRX3sNee8ay59lCAam
         OYNA==
X-Gm-Message-State: AOJu0YySXLFZjMb1SlvwJlPNpVDccEh+4aM30ajw93DWIXoBixiYe2gk
	ilVo5Gr0hBq7WIEi3GSk1cMW5CJAYA8QrqVQWZi6SS3yfTHbwSz/9FPNCbbJ7YyXNaThkbPbftI
	j
X-Google-Smtp-Source: AGHT+IExQorrNZivaMavQ8nXqJ+RZsdt7yZ3tch+7RPk3uOtOKiPinmb/kLrDBaW96B6LiTiZCBNSQ==
X-Received: by 2002:a17:902:ef43:b0:20b:b40b:3454 with SMTP id d9443c01a7336-20c63598bccmr48797255ad.0.1728490621399;
        Wed, 09 Oct 2024 09:17:01 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13934817sm72545045ad.158.2024.10.09.09.17.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 09:17:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/5] Patch review
Date: Wed,  9 Oct 2024 09:16:50 -0700
Message-Id: <cover.1728490465.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 16:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205360

Please review this set of changes for kirkstone and have comments back by
end of day Friday, October 11

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7379

The following changes since commit 3b646f322b4ffd5ed520f3815ce0726cf225ced2:

  populate_sdk_base: inherit nopackages (2024-10-01 15:29:08 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Martin Jansa (2):
  meta-world-pkgdata: Inherit nopackages
  cdrtools-native: fix build with gcc-14

Massimiliano Minella (1):
  zstd: fix LICENSE statement

Peter Marko (1):
  rust: ignore CVE-2024-43402

Vijay Anusuri (1):
  cups: Backport fix for CVE-2024-47175

 meta/recipes-core/meta/meta-world-pkgdata.bb  |   1 +
 .../cdrtools/cdrtools-native_3.01.bb          |   6 +-
 meta/recipes-devtools/rust/rust-source.inc    |   4 +-
 meta/recipes-extended/cups/cups.inc           |   5 +
 .../cups/cups/CVE-2024-47175-1.patch          |  73 +++++
 .../cups/cups/CVE-2024-47175-2.patch          | 148 +++++++++++
 .../cups/cups/CVE-2024-47175-3.patch          | 116 ++++++++
 .../cups/cups/CVE-2024-47175-4.patch          | 249 ++++++++++++++++++
 .../cups/cups/CVE-2024-47175-5.patch          |  37 +++
 meta/recipes-extended/zstd/zstd_1.5.2.bb      |   2 +-
 10 files changed, 637 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-2.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-5.patch

-- 
2.34.1


