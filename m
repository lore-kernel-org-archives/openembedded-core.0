Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C3CC369DC
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 02:54:17 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.8290.1745981656914653269
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 19:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IvTXqZZ9;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b0db0b6a677so6677270a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 19:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745981656; x=1746586456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=On4+AvefXgEbv845OyDzC6KQoiXavoVdDgY224a0T1I=;
        b=IvTXqZZ9A+NB65PuDCSPJw5UGt/LdqxZOLicnS8JmhiyCx+ILCngfBDEf4//ltB2RJ
         et6/VG5gUUpfsnPkbnwHtM4RykEL7iaq4/UlGzh0OnLvQqp5zxCmsO+BLWKNsaB/SlV3
         9ieAnT3lmg8qbYh5XcEwpMx+sZrJDd7kL+/fjPlTte++uiUdondzPm2k7xWNEmp4+px/
         Q32mV98i4gF9gun33L0MnqhbXGLBLmgNVgr1L0YcgTFwzS0qEAHdrmU4ifBCYvu+sBYk
         SksEaoNhM2zFBqeTOM06xagnYCLMGbMvxjBAgSKWeUHYQCeeD6oulYhqNLtGjAKPPWuo
         ospQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745981656; x=1746586456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=On4+AvefXgEbv845OyDzC6KQoiXavoVdDgY224a0T1I=;
        b=kzrvuEat3YD+ehJR6w6cHrBwkaqYxABQRrZvYpY7FkbnlZRq/PBPIHCFXhoUBLRlBj
         +cIRNt/FG2I4mXCxzZonkns9GiXMcZmXCk9hFhh6/cemiKhFSPHdcNjPEGKtZm/ta/pQ
         eceAlcNkBS6uT77y8jHJ1ZmvW6svbDdOWRadV/N16x42EQy4/RPKbNLWg6cYqjhjjWFA
         rpsacyup5rNoEPi86sqCtsh3S4SUUp3GDY4UJbt3O1E9MuqwyQYyApgLMrIlwp8vGzY/
         YJfmW++JN4F4VPRF92Rkf/4W8wmVsDpy2MtA+3wQVWvFlFb2aWSbsqtaS206h84rgzrT
         i/gw==
X-Gm-Message-State: AOJu0Yx7sfw0lz/HjsQeC5/z8hbB39i+MmUChgn5mwwseq9tVhbZvP8o
	bdABvWb0TnJ6KTgFcjucKxgiJLeApFjCxM5OGqJLTLSKcyW2esiix1Ep5mX1kUZRaKyLRDisQRI
	g
X-Gm-Gg: ASbGncu9SQ4VZAMK+SnTTjExcKyaPJ+DgRNXSr6PJV6ukSn2V0unhuilbo+CWlLD65q
	QSzk1NuocKYgZ1kavWAA1rlxr0hk7FPx0+MPp533qTdsCDrn+LotUglEFz5kkphFao/C52Drvk3
	Tx0FKK4+LyKL/o9SCizTsIyblz6OuwO7CTjiokwBwusKBXdNDJlRxtKIDyKzz6vbQtnKX6bUWVy
	LXfe3FSpyd4Yy61lMDYB4c6apZz7mD/77R+BDLWkfe7zZ9ujEqNFrZG9Hg9iujXv2P91uD4f9UR
	IMyvkAMs1GsUW69oDqFf4k9Od6d1vKA=
X-Google-Smtp-Source: AGHT+IEmoSPULpsN0S6MHQ8oMo1abQ2ztiaZiIM9CWTCX7x1uDWpdKZzYRqP+YA7RLZYsVC9kC2lyQ==
X-Received: by 2002:a17:90b:2e4a:b0:2ee:d024:e4fc with SMTP id 98e67ed59e1d1-30a3336490bmr2578805a91.33.1745981655497;
        Tue, 29 Apr 2025 19:54:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a2ea46sm347852a91.31.2025.04.29.19.54.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:54:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/14] tzdata/tzcode-native: upgrade 2025a -> 2025b
Date: Tue, 29 Apr 2025 19:53:36 -0700
Message-ID: <2568f7ce707d63df1f98b3eeec6639d7a5a2d642.1745981510.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981510.git.steve@sakoman.com>
References: <cover.1745981510.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 02:54:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215702

From: Priyal Doshi <pdoshi@mvista.com>

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 3fe6c3142b..bb81d77ccc 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025a"
+PV = "2025b"
 
 SRC_URI =" https://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            https://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "https://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "119679d59f76481eb5e03d3d2a47d7870d592f3999549af189dbd31f2ebf5061"
-SRC_URI[tzdata.sha256sum] = "4d5fcbc72c7c450ebfe0b659bd0f1c02fbf52fd7f517a9ea13fe71c21eb5f0d0"
+SRC_URI[tzcode.sha256sum] = "05f8fedb3525ee70d49c87d3fae78a8a0dbae4fe87aa565c65cda9948ae135ec"
+SRC_URI[tzdata.sha256sum] = "11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474"
-- 
2.43.0


