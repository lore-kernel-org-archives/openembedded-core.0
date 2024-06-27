Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC6CC2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 07:56:01 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.3033.1719474953512035529
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 00:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RiVp0SgA;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-70df213542bso5312523a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 00:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719474952; x=1720079752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tmqVRcP/5QgAHJZcELnGWLJUY+TBP6jquZBiL7N6KpE=;
        b=RiVp0SgAJbJeG32TSndd2wFGEuyBr5ujcqs14sfc9X0JHZq3BR7lQp8Yd+aqnSVZkc
         hyuwvtNUD5kO50crhfSpgpiOtUEWicjUqGK6Dtsnc68rDtPMFpZCzIV4K2KuetoWbh3u
         XM69RwC+88fTXoA7phT6OrJbHLIvvTBLKe3u7OGVCxCppHAP6dHyr7wCDlykfl79Boc/
         d7aWQK7fwvrtUf3PxHM5ydPwXEd9HzWYlGlprAkkZcHrIqtH9eyjDabWPRInA6/Hfgrj
         5uc/a1VW1zjXP2orq6RB1IdpqWR9p7A6SS4nZYYAcisJEG4OM9MFRuJGtZauUXNasdsL
         aeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719474952; x=1720079752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmqVRcP/5QgAHJZcELnGWLJUY+TBP6jquZBiL7N6KpE=;
        b=ETkcWVvcfSdMTHy+aeeO4vrlY9AGkz8VBWDDL53MFQtD2rrSWqGprGjyb+zGZZ+qxu
         RrdA3K/Vvon8Nis0TOA6g/+zBsHoswJL8jsWOG5nxDzX6nuFDet5JJAfT9LubNASULva
         6QX2pKvjqJRVcIRX80EhqEuA563lh2ZUHk8dkSZKTsN7IA2Iz42JIMh0Rn9uY8jkiiEI
         KGdl1hcXam17ka8Gb8+slHohRuH4KKKHd0SRlJJJ6RgEaJpLYv1gY8n84wJ49MGoJcXf
         oxzuWSz3Bzs2XaGNlZBKmhrElBR92ZWFmcOTVqbPMANv/c604n6VSBjT1o8wQ9ieavAW
         aGBg==
X-Gm-Message-State: AOJu0Yxo64G38skyr7mrxSrQRRZ19Gu/H5AMdeemzQ20Or58YVb/WqQR
	fe+Yw0zisXMlX5cqQUIxhm2EymzVVTOPU+E8G4WlR7ZnWeOjtrOn2x7PuQ==
X-Google-Smtp-Source: AGHT+IFTo3FcMnUaagqrNtusU6IOyMa85PVMBBktm3BpByVYKGeEaUHJ5DKBjt+DGrAyH1lEqo7EPA==
X-Received: by 2002:a05:6a20:30d5:b0:1be:c262:9c0e with SMTP id adf61e73a8af0-1bec2629f41mr3500050637.33.1719474952482;
        Thu, 27 Jun 2024 00:55:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac997d24sm7313775ad.214.2024.06.27.00.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:55:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] utils.bbclass: Use objdump instead of readelf to compute SONAME
Date: Thu, 27 Jun 2024 00:55:50 -0700
Message-ID: <20240627075550.1372766-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 07:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201191

LLVM has changed the ELF header dump format [1], the code in oe_libinstall
relied upon the format and processed the SONAME inside square brackets
e.g.

0x000000000000000e (SONAME)       Library soname: libreadline.so.8

with older readelf from ( llvm <19 or GNU binutils objdump ) we get

0x000000000000000e (SONAME)       Library soname: [libreadline.so.8]

The check in oe_libinstall will now trip over ELF files read by llvm-readelf
from llvm19+

To make it portable which works across GNU binutils and LLVM tools
switch to using objdump -p to dump the ELF file and modify the regexp
accordingly, as an aside, the post processing expression is simplified
too

[1] https://github.com/llvm/llvm-project/pull/96562

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-global/utils.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/utils.bbclass b/meta/classes-global/utils.bbclass
index 957389928f3..c9cae8930f7 100644
--- a/meta/classes-global/utils.bbclass
+++ b/meta/classes-global/utils.bbclass
@@ -15,7 +15,7 @@ oe_soinstall() {
 	        ;;
 	esac
 	install -m 755 $1 $2/$libname
-	sonamelink=`${READELF} -d $1 |grep 'Library soname:' |sed -e 's/.*\[\(.*\)\].*/\1/'`
+	sonamelink=`${OBJDUMP} -p $1 | grep SONAME | awk '{print $2}'`
 	if [ -z $sonamelink ]; then
 		bbfatal "oe_soinstall: $libname is missing ELF tag 'SONAME'."
 	fi
@@ -147,7 +147,7 @@ oe_libinstall() {
 		# special case hack for non-libtool .so.#.#.# links
 		baselibfile=`basename "$libfile"`
 		if (echo $baselibfile | grep -qE '^lib.*\.so\.[0-9.]*$'); then
-			sonamelink=`${READELF} -d $libfile |grep 'Library soname:' |sed -e 's/.*\[\(.*\)\].*/\1/'`
+			sonamelink=`${OBJDUMP} -p $libfile | grep SONAME | awk '{print $2}'`
 			solink=`echo $baselibfile | sed -e 's/\.so\..*/.so/'`
 			if [ -n "$sonamelink" -a x"$baselibfile" != x"$sonamelink" ]; then
 				__runcmd ln -sf $baselibfile $destpath/$sonamelink

