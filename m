Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0515DCCF9EE
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 18:12:47 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.40359.1761588764503916002
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 11:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z97mphFH;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b5b823b4f3dso644837066b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 11:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761588763; x=1762193563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FOHxa/sjOkla9FLYE7vMztSEan6eGTQh2QuIWh5V/oA=;
        b=Z97mphFHUkBCnVPqX+egkvTqfX0W2gBpFV/TatUm537sQ5/xUD5+CmbW37p+eBUf17
         YW0QlfWVM5qTlY9y6Xn7MDslUDdkdjKDYQrAWz4meKHGbg/bnC3bCv7HSgp/HRnAKsWi
         mEyErC4v4hTwnie8tCPmL6ZMdaTvngz9kvezym/+FWbRBTCgwgbaJB1vujRdXEr9W8jT
         egt25BcGnpOYo6exMOCwqCKRXaM9LgFLD4VdkJNJB7Om+lpADcupWntwNlKwzN18Ibnx
         GtPXe25raBkGyPcTWvJaf+l+b7jLTuh0JPCBSj2ReDCBvufWhm5UWNbmLWI4kbQNlyUM
         +OEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761588763; x=1762193563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOHxa/sjOkla9FLYE7vMztSEan6eGTQh2QuIWh5V/oA=;
        b=YzbIu8xe5atd/Ajf4vZWXmXY6Kv+nRJKGrtg4xVhkDOHpBuch8+5oNjsq4CrJdYlmC
         Ix+x8Kg4P12OlEvTivEWTOqUUdDbRUieejpEVkmTHP8smkuTvi6teYL6mclPxXVtZHl/
         Ds6nlDOOYH2SfI93SCxqKZzL3afbDX76WIDtB10E176cmCYntM9JszqSnBsazHJM2OBc
         YLpfwvMHKyt4MixDMomDIGIn0dSiaNnRAU6jSJ+A/nP7Cfsd09k2IpF8K+cy6vvzKeRt
         dh9ZprzOjQ8BvArukcWk4ic+67WNdOVwL7YthdnB7r8GpnNkhtIVP2F/sFgnEbCKRHjK
         FFww==
X-Gm-Message-State: AOJu0Yw2t8h8hVLoe/evd0ECBlTZU2JUYSjtiLZzN2A/zN6jKBWRjs2Z
	F1QzvqsZzF7Fd3Nh2RfAkIdvKtQcntKg4iZs9gtd8BqrVZms8t846fC+ddEnLA==
X-Gm-Gg: ASbGncvjiwvKY2Kn2mSKahCyeXSpSk2dsMVtgynq75tYxWU22GCxN+5K0qlAUFG48uA
	rLdMGV3SoYbnsI1VC9CZk8KiYhtFpb2kWyMRs85GzZgHQ6xjDGgHTspIWMzbkV5MUZP8ov54QIo
	uHdORow8fPRyQqGCg1hiP7U8ffxK7hdSX/wXmzo8VCMqOhHWlQLhit2cIPKJhGJrNxiq68cpOgW
	fhjX00CDSbEoPqlNj5gxj9YEWQjX4+UNzaUm2EVkRibQ7FPMD6eyZwUYb/rSnCl2BP22OMgBCJ1
	MvEfPOcJJxpkZRk3ndovNP2J9GGhln8sOKr4z2NDCYxuhX8LpTn1Y6sMUy+ICxfvX5aRRJz+E/Q
	mf+/AsAiAfhq/ZU83mTCrPhpSJDgpst3sGTfdkNld7Mir4+lnOTUF0H7gYLfcOVPV1GjAYaXW3g
	YPFrvg8rmfMa9aFD1trrU/HhZhocMA41FfK0eH+oEyARZerAe/59HuqsqqQWnQmJwlFQH1BBduc
	VPth18cb+qcoaGJgBJvxqE0X7c0feZ5Mf37bDVv/qXVFuj5g2sxb9kMxRJc
X-Google-Smtp-Source: AGHT+IFnTTzKQiDblJFwKX2foF89+Fy2m9r6SCwwGrqcIGuh2tbwgMY2ZlgYnSbdIV7zw7IPP9v//g==
X-Received: by 2002:a17:907:1b1a:b0:b3d:9c3c:9ab6 with SMTP id a640c23a62f3a-b6dba4a69e6mr69881166b.29.1761588762699;
        Mon, 27 Oct 2025 11:12:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d854430dbsm824723066b.63.2025.10.27.11.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 11:12:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] layer.conf: add a bb_min_version statement to perform an early bitbake version check
Date: Mon, 27 Oct 2025 19:12:38 +0100
Message-Id: <20251027181238.3798758-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 18:12:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225346

From: Alexander Kanavin <alex@linutronix.de>

Please see the corresponding change in bitbake for the rationale:
https://lists.openembedded.org/g/bitbake-devel/message/18223

This change also means the identical later check in sanity will never fail, and so
that can be removed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/sanity.bbclass | 5 -----
 meta/conf/layer.conf               | 3 +++
 meta/conf/sanity.conf              | 2 --
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 6934e071a3d..bdd4d1474ef 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -845,11 +845,6 @@ def check_sanity_everybuild(status, d):
     if sys.hexversion < 0x030900F0:
         status.addresult('The system requires at least Python 3.9 to run. Please update your Python interpreter.\n')
 
-    # Check the bitbake version meets minimum requirements
-    minversion = d.getVar('BB_MIN_VERSION')
-    if bb.utils.vercmp_string_op(bb.__version__, minversion, "<"):
-        status.addresult('Bitbake version %s is required and version %s was found\n' % (minversion, bb.__version__))
-
     sanity_check_locale(d)
 
     paths = d.getVar('PATH').split(":")
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 54fa04e213e..d6dbad040c2 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -1,3 +1,6 @@
+BB_MIN_VERSION = "2.15.2"
+bitbake_min_version ${BB_MIN_VERSION}
+
 # We have a conf and classes directory, add to BBPATH
 BBPATH .= ":${LAYERDIR}"
 # We have recipes-* directories, add to BBFILES
diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index 71828542748..602a7701f4c 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,8 +3,6 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "2.15.2"
-
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 
 SANITY_VERSION ?= "1"
-- 
2.39.5


