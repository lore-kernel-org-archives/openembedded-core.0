Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C92C46CCD
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 13:48:39 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.13923.1702993710156187019
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 05:48:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HQD3Zy3x;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.47, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1f03d9ad89fso3089062fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 05:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702993708; x=1703598508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=U8Xu0yILy6Ts4t6VVtyPhVwJZ0Dcx5sgL4xf1Sx4Q7s=;
        b=HQD3Zy3xsBOVY/vb/3DksOmSJsBWKUIUAyGZNwIwKBBmArcYS+QtND+LNAvoyn8cPJ
         HAw1lBSTRx/BIIztVVjhg+ZnxJzf4qMsIRUlpg0r9PFh/34WE++4Q92zF+4N1UicEtJb
         7LlJYkuvoHYQ/NOegGBrTQOdFGKc2cH9uf3zJA+36P85GwbaCTvwCg4lZT+I7rT9/1nf
         mEl3q0tp3VykQB28X129cLP5IjqDRTdXOnAjh3f0j/DtgJ5XZSFAdbbdFhUckw+4OGh6
         i++H3b7MbDhiyy8s4HQ86wDjqdxRgpO6HRT2GBFcw0wxdArApgeWWF7SUejNj6UyCS1O
         3Ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702993708; x=1703598508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U8Xu0yILy6Ts4t6VVtyPhVwJZ0Dcx5sgL4xf1Sx4Q7s=;
        b=FXm26BqRKkLY3VQKZ9E2ZlTtrprXDI8Bna9hUxkdcfdUBNxWaiMC3VG+Vu5ge3mvdT
         nosEwKRzWRAJ0WxvqVIXY99k+J9J/RPznjiT9eHTKQLSGNxZLdQ+BxoQW/ZwZrzCsxXT
         FaTErMz0OA2G2hs2LD7oWyzzq7I3dO0jxFr7kizDJTg8iCdvGh0F8EK1gwIOWEcKGrmP
         pYByZquO3DWI3EgKb8DSeXoZhB3gfptyCZx7S8BIwRRoJa9o/Pt2kCuhjNkv+k1EGOs9
         nxtXRmcuPkz0rPJHneTgM74o8zdv0larZoyxfWNMhhpZsFmOrMZoWEVdm+fWshXGRxS5
         aXXg==
X-Gm-Message-State: AOJu0Yzb23MeFDc2U7eMC2CBgTpuebs5Ij2JNkEgKmy0GqjGoM7mFgrJ
	Osx+t8fgukH22oRFjah0Z8i2IoBd1n+IRBPdzvoaqg==
X-Google-Smtp-Source: AGHT+IFPKn3qPurwTe9KrQXDmNJTglP7Yput2nEb9H6rotX6/NP/dhzsK0NIZlquKf39eQqptqpupg==
X-Received: by 2002:a05:6870:45a8:b0:203:70c9:aa81 with SMTP id y40-20020a05687045a800b0020370c9aa81mr8392277oao.16.1702993708154;
        Tue, 19 Dec 2023 05:48:28 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h4-20020a655184000000b0059d6f5196fasm16815398pgq.78.2023.12.19.05.48.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 05:48:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/5] Patch review
Date: Tue, 19 Dec 2023 03:48:18 -1000
Message-Id: <cover.1702993573.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 13:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192732

Please review this set of changes for dunfell and have comments back by
end of day Thursday, December 21

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6348

The following changes since commit 55157aa2f8b157b1cc63e1134d9eba6db0cf16da:

  build-appliance-image: Update to dunfell head revision (2023-12-11 05:13:51 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Bhabu Bindu (1):
  glibc: Fix CVE-2023-4813

Lee Chee Yang (2):
  perl: fix CVE-2023-31484/47038/47100
  binutils: Fix CVE-2023-25584

Vijay Anusuri (1):
  libxml2: Backport fix for CVE-2021-3516

Vivek Kumbhar (1):
  libsndfile: fix CVE-2021-4156 heap out-of-bounds read in src/flac.c in
    flac_buffer_copy

 .../glibc/glibc/CVE-2023-4813.patch           | 986 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb         |   1 +
 .../libxml/libxml2/CVE-2021-3516.patch        |  35 +
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   1 +
 .../binutils/binutils-2.34.inc                |   1 +
 .../binutils/binutils/CVE-2023-25584.patch    | 530 ++++++++++
 .../perl/files/CVE-2023-31484.patch           |  27 +
 .../perl/files/CVE-2023-47038.patch           | 121 +++
 meta/recipes-devtools/perl/perl_5.30.1.bb     |   2 +
 .../libsndfile1/CVE-2021-4156.patch           |  30 +
 .../libsndfile/libsndfile1_1.0.28.bb          |   1 +
 11 files changed, 1735 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2023-4813.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3516.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2023-25584.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31484.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-47038.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-4156.patch

-- 
2.34.1


