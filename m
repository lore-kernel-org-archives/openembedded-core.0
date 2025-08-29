Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE6ECA0FF0
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 03:36:48 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.5165.1756438600795651612
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 20:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gbJfwhWw;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-771eecebb09so2251135b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 20:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756438600; x=1757043400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6p/EH2vItjysn99ZmdeecmUFhEv4rns9ddVy4N1LdFE=;
        b=gbJfwhWwybdq6v8OOc57yr8yRwkQkAScgucWO+nPkQ+MUTwNaYO8FHgLVx9ORNCkct
         by12FFLGJI86oYaomMD3MwsJf5c1/MD7+1c/uvDfaS7JAXUZeabTTJMU/RPmHmdakqvK
         WncMswqjLo/5hIMA0NC7p/fZW8C91NHYnn2T44jT1Y5bKKP1U4fJr7kmGHt5Z6WJFiYj
         pqDRhefxiUT8JtueTiaxKEUPNB8G9EtfkODVNaQPKOCwmavfIH0ra3BCvTSwFEM840xH
         hgLxybKWKHlwJhloSkIYQopkVu8ij/90V8A9semH8J1LkHDkJrFN3g4UEj7zBEdC+OYO
         WAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756438600; x=1757043400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6p/EH2vItjysn99ZmdeecmUFhEv4rns9ddVy4N1LdFE=;
        b=tu1Qc7W9nczlcKblpJvj6syp1OVoPkKY02Jf+IRcbTSxjESECMRXuIStXxgSwxgl3X
         EWECP9+XCUHzu7mZwWFGtCMVUwPbUvnNPW1ECmgiXRWiuKEX1qlAbhJImR2NDrsttlEU
         wbaBYyI4YOIEgP9toR6B28hHd9KF6buJmSxqygX+413CJXlHxOwjDnoo7N2yt/pKgv9D
         bOLyrEeUExh3rusy7Wr4hhLSjhcOQ+3BUTQsAGwOLMf32Fk/swpETBCkxnJBY0CpsRst
         DqsPVgXm/THiiin0h51M5a4yF13lOPe2TEB83AAIBSMSYk40RpTx9DZeSYRBN7hz4kuk
         YjeA==
X-Gm-Message-State: AOJu0YzGx56rs4c5WYat7H9jed5kJVnKHT21gumMEDxmTY7sUxk6USOd
	TuH59D5hWULgf3aX8gIzEri2WPIZd3ySCuY+HodcmOHzgv0Yj4acGDhyLYO2XdH2
X-Gm-Gg: ASbGnctqKBl7XCKiZR8HALVL7nqCW92qkWO7zwfgxcYgrCcwCOidzuuQ8Zcz6JqndzY
	J1FzlU0JVmcopmqAzdujuYqAcxdruqNVJV7gCVuMI2o6Y4j2T/BF0ayeszKkO5SjUVTlX1UfjHP
	gv/9B/TZEh7Y+NKpEZJDshbX4OGS+qGKQdY6o9YtX+QrLn7sMBB4Q6jHLO8pvP7FriPyljuPZGV
	n3byH2w5vuqAzwDe6sJFzwF3jMOK3ikLO9jwa4g09KL/7o0bZC5c0iSGKmfj9p8w/na8YwFAzfo
	NG/DjtFrdjE/LxCQj6ErH/Pxy0aSx5XO6SoDeUpKGFzbky+7RRnMkispO/YqLGcRBUZHFgbh5Rd
	0O36vgH99Qv9slDgIJs9rAyPYREpqqoeBMPR3CftrTLln99s35cBWCQb6i5wwaaIky9BUIdwQAc
	nSNoAeHEQW8Q3C4YyTQRXb5cj0CKQjIe8/1kC2lRDfK8DBdGhTwSQ=
X-Google-Smtp-Source: AGHT+IEUaFw664lyj3DXL3lb4bbZRJnc5aSRFqGtZCOtF2vP0DhIk0Ww+93JPR1N8+/tO8g8Qmn7VQ==
X-Received: by 2002:a05:6a00:c95:b0:771:ef50:34d with SMTP id d2e1a72fcca58-771ef50092cmr17621161b3a.16.1756438599778;
        Thu, 28 Aug 2025 20:36:39 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26abbbsm923763b3a.5.2025.08.28.20.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 20:36:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/3] boost-build-native: upgrade 1.87 -> 1.89
Date: Thu, 28 Aug 2025 20:36:32 -0700
Message-ID: <20250829033635.115107-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 03:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222596

From: Gyorgy Sarvari <skandigraun@gmail.com>

Changelog: https://www.boost.org/releases/1.89.0/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased

 ...st-build-native_1.87.0.bb => boost-build-native_1.89.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/boost/{boost-build-native_1.87.0.bb => boost-build-native_1.89.0.bb} (88%)

diff --git a/meta/recipes-support/boost/boost-build-native_1.87.0.bb b/meta/recipes-support/boost/boost-build-native_1.89.0.bb
similarity index 88%
rename from meta/recipes-support/boost/boost-build-native_1.87.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.89.0.bb
index 5b914b6f88f..911de72bc1f 100644
--- a/meta/recipes-support/boost/boost-build-native_1.87.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.89.0.bb
@@ -6,8 +6,8 @@ SECTION = "devel"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master"
-SRCREV = "4a52d8c06635435b64e31a56eaf7ca5dc912a71d"
+SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master;tag=boost-${PV}"
+SRCREV = "be69c44857e34fae250aa1321808a05c1d88bfde"
 PE = "1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "boost-(?P<pver>(\d+(\.\d+)+))"

