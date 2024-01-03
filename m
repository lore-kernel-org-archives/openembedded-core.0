Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6BAC46CD2
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 03:14:12 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.6130.1704251646229708193
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 19:14:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AQlHewE5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d480c6342dso37772385ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 19:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704251645; x=1704856445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hAVg13hiRG4roBxsoVPLZbtP3CIiAd9bGMmQOoT8ydo=;
        b=AQlHewE5lVuBu6JNv+DpV8kkG6VzAnhJCtxbLRaMLjXHO/7/0j0o2ODw/PviKBQYU9
         yxAAuFVUKFrMufNot/Hu+bPMxc6PyTDiqOsWBYACgyAG+kwJfpMA2KBIAPnCe9eAdMXI
         ebs9HHbNNXh9F6a+IfJ5RVrBIh8FdxMsXTe3pnhv0ALFuNKAWMSSd7DuF/VaP22tb0z1
         15h+jYPwlkHjlgy7prblbAxPNfQcwdYs2K5QcV0whpPSZ+UZ8IcLktMUzMmZ9Ka8UPNk
         ytNiTzE+obJiQ+HQ0GKwX2/X/TrN4rqDF5ZjqyAILXN64e6FoGZNbcSGkBoRWWg2DA3M
         VGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704251645; x=1704856445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hAVg13hiRG4roBxsoVPLZbtP3CIiAd9bGMmQOoT8ydo=;
        b=SA9uz9Q+0mooV5oTxCg5HlC0vJh8qwJ+lI6xWzq/2VbvBU9xWmBeI4nvx0MUnLxShc
         05AP6vQv9JJITDdGcLicmH1hWC7Ll2wZV3OY66SAa4sUFn8fsODCwDu75jQ4VR2ciVPx
         51Emvbm6gwMTOIvqE62lD06r3Uecsrpf6qcxUxqDCPVxrDFyKGNT8Kolf3nhNwzHmJXj
         rUQaCcGQ2JR9FX91/ol/FmxNvVzahkqdvh2ibTeZkeE/hWapdoELHhwzlvth5wjkA0o3
         JRi4hEFzFCW9Y1knb+PPnwmqueJ4ViBYXPnloJq0UDvc3/UDgas6NkRxQTla6CdSCzMX
         hFyA==
X-Gm-Message-State: AOJu0YwG0qKE1jImSJ5CJgiCA0b5wO6BGi2j8p8l1e41QWZ3OMCpItd8
	s99+J175FXW+NOboqTda73AzVrUPXMCtGjaNwBG+6QRxpkI4/w==
X-Google-Smtp-Source: AGHT+IHKvVyD8QUwAIbRvWjAbfGDHeEo2B85qlaViWFQiLZY7Id4kN249S+J3XP5pJSVh9XwO3afxw==
X-Received: by 2002:a17:903:22d0:b0:1d4:bd03:ab13 with SMTP id y16-20020a17090322d000b001d4bd03ab13mr4625118plg.69.1704251644694;
        Tue, 02 Jan 2024 19:14:04 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id ay5-20020a1709028b8500b001d4ac8ac969sm5868681plb.275.2024.01.02.19.14.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 19:14:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/3] Patch review
Date: Tue,  2 Jan 2024 17:13:54 -1000
Message-Id: <cover.1704251506.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 03:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193265

Please review this set of changes for dunfell and have comments back by
end of day Thursday, January 4.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6406

The following changes since commit 94e9019d2f170a26206c2774381a1d183313ecaa:

  testimage: drop target_dumper and  host_dumper (2023-12-26 04:18:08 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Shubham Kulkarni (1):
  tzdata: Upgrade to 2023d

Vijay Anusuri (2):
  go: Fix CVE-2023-39326
  qemu: Fix CVE-2023-5088

 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2023-39326.patch           | 181 ++++++++++++++++++
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2023-5088.patch             | 114 +++++++++++
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 5 files changed, 300 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-39326.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-5088.patch

-- 
2.34.1


