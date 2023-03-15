Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE676C76196
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:01:50 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.8794.1678888906073626051
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=51hl7TN7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id k18-20020a17090a591200b0023d36e30cb5so1933451pji.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678888905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTBa7jYtbm2+xo0vFjcOh5csS/cbZtiVADtBra2ETEs=;
        b=51hl7TN7VpoH/hlF4VbRwiTYEb9skYFRcznE+HihYOQhdSeulmCsbSwzBtQx3v3lRg
         bWczLrEKDfZ89IJ4eULsJ59PAtKmkt8X6u6G7RR8Yy6sZctH3gELkPHuCSZvMzhdENWF
         lsXjlIiCkZxs+AKJUzNXSh+Zuf52L0iJi8eCsaMPgzDEwF5VgpV2C1BNPtJ4RE2Sg2//
         rwWzJMwUPHWgTNPozrdVPlQjC0zDdt1ruEl9a2w3uqtNoQ7j9icEgVSCB5QilU4FMRfV
         Bn28PrOFZmcNijAWbs5sprOTMOLdKQUmfvdkB/8C0O4u0r0Gt8VD6hSMwdRx7ZefJ2Py
         2a+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTBa7jYtbm2+xo0vFjcOh5csS/cbZtiVADtBra2ETEs=;
        b=gT/hu5EQS+sK+gfgq1TLtA5gbkNoHxcB4YCaQddAbjEDppmH/gGOrPt8lQf1vj0GYH
         MHMiVAdPYEAwMYQ7kh5R0t+egmlIVfn35HWj18H6zRlk7KnVgfGrxDCvi10PntZ4bEFO
         vc6cC14UXye6K6JWw1uL+w1YtUnBMijBU8tFCrhEl4cS9UMpybGK9KdlOd4af1H6ZKua
         HrjjVgCmEMkC9tDRURpTbAdj0pic7Dvkf3lGUBAWL3cqBLQ8Zx4UKG/3ZW0L5EIKTJzg
         5nzYvz0IP0fSHs0wvZ7++KuIQY2ye70Vmldo9XrxbacQNpEWHqs+BHr1FRW+b7/zuI2e
         FIjw==
X-Gm-Message-State: AO0yUKW0ALHyhgoabEPHd1aF/v09oTd7qSDus7SqZXouWhjAu15qiKTQ
	UUsSY7UFfr+UdV6VcM9jmEfeGFwmj/Khi8i+ae8=
X-Google-Smtp-Source: AK7set+qZxlEjnmDafFFi1pGLCZbaVbYdaT1DY1KvivHD6nB1tS9e8POzg1i1vfsCJRp88JNUmxJWQ==
X-Received: by 2002:a17:903:1252:b0:1a0:549d:39a1 with SMTP id u18-20020a170903125200b001a0549d39a1mr3272513plh.32.1678888905132;
        Wed, 15 Mar 2023 07:01:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001a0432ca99csm3663755plf.269.2023.03.15.07.01.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:01:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/22] iso-codes: upgrade 4.12.0 -> 4.13.0
Date: Wed, 15 Mar 2023 04:01:03 -1000
Message-Id: <e2c6593b1e2bd004c233e6b9fd27170365e00c95.1678888649.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678888649.git.steve@sakoman.com>
References: <cover.1678888649.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178563

From: Wang Mingyu <wangmy@fujitsu.com>

Added
=========
- ISO 3166-1: Add missing common names for Laos, Iran, and Syria.
  Fixes #32

Changed
===========
- Translation updates for ISO 3166-1
  - Kazakh from Debian BTS. Closes: #1025423
  - Catalan from Debian BTS. Closes: #1026972
- Translation updates for ISO 3166-2
- Translation updates for ISO 3166-3
- Translation updates for ISO 639-2
- Translation updates for ISO 639-3
- Translation updates for ISO 639-5
- Translation updates for ISO 4217
- Translation updates for ISO 15924

Fixed
==========
- ISO 3166-3: Fix withdrawal dates of AN, CS and YU. Fixes #28

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f2c8b9c9a97ba5ec9c5da94da84ebe216650d6cc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../iso-codes/{iso-codes_4.12.0.bb => iso-codes_4.13.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.12.0.bb => iso-codes_4.13.0.bb} (94%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.13.0.bb
similarity index 94%
rename from meta/recipes-support/iso-codes/iso-codes_4.12.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.13.0.bb
index ea7c43cdae..f3ead5e8c1 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.13.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
-SRCREV = "5e4dddbd1f8902ab0252ccbb19b783cc0359505a"
+SRCREV = "ab6b01d5b56af7da9f0d2d1619a3cf84e43ed76a"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.34.1


