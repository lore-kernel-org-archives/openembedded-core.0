Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DFFC46CD3
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 02:30:35 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.94594.1703644228234745622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Dec 2023 18:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=L57+QEtP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5ca5b61f101so1217106a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 18:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703644227; x=1704249027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Pvt1AKPie1kc2BmfnubjOSKPA+Hx0Y2Z+RgkYJF6/s=;
        b=L57+QEtPK33sQr3klwYfc6h7pdQ5bKnJxd0HMjv/3599JyGd5J339FeJ3xJQ+YJour
         tLaDXuqUH3s+sQkX7D/KAPOmeWxucZH+2L+TdyIZM+ETWNTJdUuAkhOS2AGTHbSm2ldQ
         x6bSJScrEhDVsYdrIht7LUii1ygiQuoB3q0chimBL8DxAfH9bu2WdLhUJaHwuzgD11jI
         ZGz74k2UR4PDMWAsuxliWHdKXTASk1MxbGVZ9qQGYnfLXEiy7dLgHKl3lSYEY5VJE1bs
         R9rE4c7KkAWUewRfMGa8njMMRPWNxXY8A1wOVmH04z9nXL6tDpame20Bas5SBhywTJDR
         KDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703644227; x=1704249027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Pvt1AKPie1kc2BmfnubjOSKPA+Hx0Y2Z+RgkYJF6/s=;
        b=Q34wC9XrfNhsVG5hbeziYXVcZ9jIhtmeCZ6kvi0V3Qn25ghlMmaaCeCOo8PBF5k1qc
         mvfeOcn3odTJCyfbEFqSjknyKACVjFocZt6Ce7NKIUp0Npl67Fi1OhSdHE3tImKwA3io
         cI7FicjuFymk8DO4rEZ2GPeyY1NPaQfV0+W8LkriQt+qaWxwXhAz0FgdkIgVheO+NZ4T
         TYXOlA0PnpS6Uoc2XAsho4xN5qcThH3QSd9ihH1L/QLroBtVq1sFdBQhGOyHBbyiKmA3
         dMuzN+gevw7GsARQitJSmRq6cdeBNtndNwz++o/e37MUvUKb0Q0z/77KtD7HES+UhkQh
         GZUg==
X-Gm-Message-State: AOJu0Yy9QbzQnfRCRGXnfwnFaftae0MWZiZMqIWdGzbczbdmm1Bnn8Wn
	BGemRErqEV3oUUF5YLwJDqEvCiJ77KN8PedrzDPQ6M4eaLr24Q==
X-Google-Smtp-Source: AGHT+IHIBG8rKBuCyfTZBPdp9EFdHZ6+ILMtxZvi62dldRmp6aW8odtKu07buaseXXdmETKdwwgI/Q==
X-Received: by 2002:a05:6a00:2af:b0:6d9:93f1:dfe1 with SMTP id q15-20020a056a0002af00b006d993f1dfe1mr2598660pfs.5.1703644226633;
        Tue, 26 Dec 2023 18:30:26 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id z188-20020a6265c5000000b006d095553f2asm10982400pfb.81.2023.12.26.18.30.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 18:30:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/6] Patch review
Date: Tue, 26 Dec 2023 16:30:15 -1000
Message-Id: <cover.1703644078.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 02:30:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192915

Please review this set of patches for dunfell and have comments back by
end of day Thursday, December 28

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6376

The following changes since commit 05d9f9c6b27c0216fa4e349109ef42cf91bb4084:

  testimage: Exclude wtmp from target-dumper commands (2023-12-21 04:08:46 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Hitendra Prajapati (1):
  bluez5: fix CVE-2023-45866

Lee Chee Yang (1):
  curl: fix CVE-2023-46218

Steve Sakoman (1):
  testimage: drop target_dumper and  host_dumper

Vijay Anusuri (2):
  flac: Backport fix for CVE-2021-0561
  openssh: backport Debian patch for CVE-2023-48795

Virendra Thakur (1):
  binutils: fix multiple cve

 meta/classes/testimage.bbclass                |  21 -
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 .../bluez5/bluez5/CVE-2023-45866.patch        |  54 ++
 .../openssh/openssh/CVE-2023-48795.patch      | 468 ++++++++++++++++++
 .../openssh/openssh_8.2p1.bb                  |   1 +
 .../binutils/binutils-2.34.inc                |   6 +
 .../binutils/binutils/CVE-2022-47007.patch    |  32 ++
 .../binutils/binutils/CVE-2022-47008.patch    |  64 +++
 .../binutils/binutils/CVE-2022-47010.patch    |  34 ++
 .../binutils/binutils/CVE-2022-47011.patch    |  31 ++
 .../binutils/binutils/CVE-2022-47695.patch    |  57 +++
 .../binutils/binutils/CVE-2022-48063.patch    |  49 ++
 .../flac/files/CVE-2021-0561.patch            |  34 ++
 meta/recipes-multimedia/flac/flac_1.3.3.bb    |   1 +
 .../curl/curl/CVE-2023-46218.patch            |  52 ++
 meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
 16 files changed, 885 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2023-45866.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-48795.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-47007.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-47008.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-47010.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-47011.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-47695.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-48063.patch
 create mode 100644 meta/recipes-multimedia/flac/files/CVE-2021-0561.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-46218.patch

-- 
2.34.1


