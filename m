Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793A6D1267A
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 22:19:42 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.991.1764713980527993250
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 14:19:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FAiI2/q2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-297ef378069so60336395ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 14:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764713980; x=1765318780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qjka9aTbz8vsSNk1FBKsxLVBt1r/B8IswC3MCTA0gFM=;
        b=FAiI2/q2b9wBpjwnrzSGoK7v8h2Au6jEhQa8ytc2Wh8KRCxs+tsPxa47JV59fU7lcY
         Od4i4fb58hvos8+P1xmFudG+wCPVt0NRw5B4hPdFmA6tYXC0ZAdge60uPGwhbMLUJ+Sc
         lsJKMjob7G+mXETz9apgGCTNORsmmf3WQ1Tvhehf2YCCXFroiXeCCtBspPxAhh4YG8Dp
         /HAAYQPcIPYhI2nFG8RhxhVSceKJvjNC0ShNl9SIDzGxxDc0vnbuACa975fYZ+dPkpBC
         GV0OgDPesMhKebY2IXn8wx+iSYAXIptoosUCmvwwqoRznmie3imX78TGTCLHvL0MthXf
         pqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764713980; x=1765318780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qjka9aTbz8vsSNk1FBKsxLVBt1r/B8IswC3MCTA0gFM=;
        b=PAUbbq2Lh4i7MxKI3+PeWCnbPbPbWyA1LHCb3azuVcQb1zHTU61e5+vyCamuoEcvBb
         CR92oS6BYd+MFrPEbaT58A/s7IPsWsSw+qwndYqJHV36pZmDwlQRclW4PsOenVA1P/5y
         9fr5lmIf+NLbzLMBIIP8l9HLjGfCr3lyRt0MHzKCftZQGxdzHKscYgDY4G+WJJKfM3ob
         5lgVizlG6DDFnouIg9a5GZWIIq40tFlZjm7CcCUsFjzuCWstdPBSv2d3WXAFC7kmDMeZ
         Sz0qJx5HaSoDyhhlw0Ii1oOQR+2j4x8jpQm7cNZ7whqnAiudOBOTKdM8tgOb/wGdbku6
         O1jQ==
X-Gm-Message-State: AOJu0Yy6qihQz9YMhqN8Eqt7KDkVWxKnDIhmxHKi+NsO1CpWewpOp5nv
	4BRgqsMM5cBZCON5AM5RF595KDgHGdx8h/2gENsvpBLXTyedBJxAlU+P+9rzrJmVavtF8qcffvm
	gjyiG
X-Gm-Gg: ASbGnctwQG1b7D+gpRyIIckv2GvrZXYHxxwIfahmPa8/uckyI3DZJyUQUnMfcZOZTx+
	Q60u9Q9ocZJ1GkTIToWxmj2jCx0TWonhz6f/6ykoQdCF9bZA8NyPcFp/YeaWNzPUSxftPHwTibz
	5F18iXbtjFvl3OcnHc+k4IUz76bdhPHr/vCyMnK31NE2TkS5f6kzb2UIJh98aupipeiLU4ge5gv
	KLb7uG4pCkC2KwbsXcY/0O/2TmDswYoFdRkHSYG1kJ8aHqhaWrYEQ355WmgR+JFrGtt2ugUaVuo
	dyt8IHtc88fhmf4RztHqF12RcJUCfdtjZMPmCQB3XHAQxORd2gUtVKWQEgBsquAgH0kfULQjCNc
	2yQi5Pf32v7DUJY3p3ZCArdW7nHywwVSToViC3kyM5YfuqIGSTmG28PVyrSLydHVbTdgo+c/s7Z
	HcDw==
X-Google-Smtp-Source: AGHT+IHqIewm0Gw0JlIlCc2Irf4ED5UGFABctAiHwBtswP1EVRneILyZf3xN4ywc3dKtMjSPcLI2SA==
X-Received: by 2002:a17:903:fa5:b0:295:1a63:57b0 with SMTP id d9443c01a7336-29d6838352amr1354375ad.23.1764713979572;
        Tue, 02 Dec 2025 14:19:39 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:b8d9:92cd:3fd4:9b7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40acc7sm163700565ad.2.2025.12.02.14.19.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 14:19:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/8] Patch review
Date: Tue,  2 Dec 2025 14:19:22 -0800
Message-ID: <cover.1764713862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 22:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227186

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, December 4

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2811

The following changes since commit 1fbd9eddbdf0da062df0510cabff6f6ee33d5752:

  libarchive: patch CVE-2025-60753 (2025-11-24 08:08:18 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Changqing Li (1):
  libmicrohttpd: fix CVE-2025-59777, CVE-2025-62689

Moritz Haase (1):
  curl: Ensure 'CURL_CA_BUNDLE' from host env is indeed respected

Peter Marko (5):
  gnutls: patch CVE-2025-9820
  libpng: patch CVE-2025-64505
  libpng: patch CVE-2025-64506
  libpng: patch CVE-2025-64720
  libpng: patch CVE-2025-65018

Praveen Kumar (1):
  python3: fix CVE-2025-6075

 .../python/python3/CVE-2025-6075.patch        |   355 +
 .../python/python3_3.12.12.bb                 |     1 +
 .../libpng/files/CVE-2025-64505-01.patch      |   111 +
 .../libpng/files/CVE-2025-64505-02.patch      |   163 +
 .../libpng/files/CVE-2025-64505-03.patch      |    52 +
 .../libpng/files/CVE-2025-64506.patch         |    57 +
 .../libpng/files/CVE-2025-64720.patch         |   103 +
 .../libpng/files/CVE-2025-65018-01.patch      |    60 +
 .../libpng/files/CVE-2025-65018-02.patch      |   163 +
 .../libpng/libpng_1.6.42.bb                   |     7 +
 .../curl/curl/environment.d-curl.sh           |     4 +-
 .../gnutls/gnutls/CVE-2025-9820.patch         |   250 +
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |     1 +
 ...0001-Remove-broken-experimental-code.patch | 14471 ++++++++++++++++
 .../libmicrohttpd/libmicrohttpd_1.0.1.bb      |     3 +-
 15 files changed, 15798 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-6075.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64505-01.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64505-02.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64505-03.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64506.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64720.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-65018-01.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-65018-02.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch
 create mode 100644 meta/recipes-support/libmicrohttpd/files/0001-Remove-broken-experimental-code.patch

-- 
2.43.0


