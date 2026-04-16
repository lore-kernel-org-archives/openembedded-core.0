Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D1EF4384C
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:54:20 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7103.1776318852232903849
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=daUySU3G;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2d9916deb14so6309508eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 22:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318851; x=1776923651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xgfsq4d6tqaBpw/buFNbc4wVztksX23TZ3Fp9ejQW9c=;
        b=daUySU3Gw3pQoxFWNWaZKKHZ+OjPtwkgzW6MFzscA9iTDyUIPe6fFsHUsBzQAV1MAM
         cxB7FCUDCiluFuGmNxe2cAk7AtHrt0KKs+OKPACM1aLAgvKSoHHjwPRjk3tHnHPiik0O
         v/dW8Ge6enRd6V5imqNpOdQvbfddREfEzE7/m8W4G826PoJ0iB1ZNUuqG6GxPcqVX+9j
         C8hknr8aYw9G6G7/dROAtqmXuUtJwPAT8Z6Pr8npikMbe1EOMOhWgA8b/D/foaqZ6hgY
         oWxlt+K8Cse8bwJFuHb+/D+o53EEFkUNYuVNCxF5JwfT5ki+ZadKhG/Yr2eyO6pNP3PV
         O3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318851; x=1776923651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xgfsq4d6tqaBpw/buFNbc4wVztksX23TZ3Fp9ejQW9c=;
        b=Ucx7/lhmTGEKlvLegrEddlkgjXUf7N/xLO1nTzEVOzxeIOvC6V2F+Ko/tspSr3zN4n
         TmnuKG/11tMQloBuF3dT7lcnv0C4lFjo6VVN5X8FrgNu+R5eH6AeX3SHiNXv2N/p5U5Q
         LKFfRM9piNJIUr5+WGcE5i/9OraoqduGIfPc5ll3xy1qhHV4iB7JysK5iFZj2xrWQ5ZG
         cCMxG5UiguxAAxNZKymzgf+39+fnVGX+XgrG5kRFlWK/AYFO4OsWFdYlnwFeTRLXovzf
         3nlySMxi+OSFActn5MS/UZrvjuJIZHKfdYDmFOPFApis43WeqPvDwSp5I4iMvKnKRrGB
         DfqQ==
X-Gm-Message-State: AOJu0Yw5weryalc1DNf97aoCMdMgOtQu2ZWlAdVE0Bb72BSki0pc/YBY
	55ENn04h2A9s4AoRXzFe+GczdKwZ0RWmWisap/ThS5+l37SLe5/2LwsfY/UiObBi
X-Gm-Gg: AeBDieuhT2WKL1IaeCKKTu6TxhUQCwsGP5QSidVBV90wpHc/3qIexZFSN5vJam/EIs5
	FTwUjQk1Lfy14vgrBXW4SX+HR+MP6H0rU/GuUXaLiAlaksOo6bpLEXaxuJNRl1W65N/ejYecmj2
	bRFDdUZSDBHmGhpWVz2/pT8slEw18cnvKu+1eFBDOb9WuBMKwDJUtFMUhf+Fgq7To7DWSHSo+ca
	uBs8e/sOvnu+Do9zAfpsHT10n46qkRIuev1XfPC4bKWyssWn5BKHZTBC81myJbNn1iMTkgXIWC8
	BGduRL+jd4Niz7a5k1gzoJ7tsbbvfzTsWY8IOK6fdiCYDcx7FCf7S3CHJix+Rxx6JjrQ3m+R0Ec
	hTvZjcOXVWeYMFQSNjNqqI2D7HKmTMbklb6SSKKccNtegt++WXCnhSJ5vf+49sHK5TheGiEmcl/
	1JpQBtfrqqjiZzwsibUewHQAXvpIgDP7YJ7eqAAodN72Y70Aq/9OJmo6yTXvJSQiSSy7MbgiSUo
	QPLD5jSdHBNFG6cfj2XD0xLhgi+BSSahr4h/LFipMluCksWaIjj3mz5VXHjzAZ2WvZSS/gCYwLQ
	eCwxPwf4Ox/mDZB7090RqKQtjuw86ZbDbJI+oVR44QSTmzHgdaw=
X-Received: by 2002:a05:7300:6da6:b0:2c7:8e1c:956a with SMTP id 5a478bee46e88-2d589662875mr13760670eec.19.1776318851337;
        Wed, 15 Apr 2026 22:54:11 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb8443csm6060212eec.14.2026.04.15.22.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:54:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 2/7] dos2unix: upgrade 7.5.4 -> 7.5.5
Date: Wed, 15 Apr 2026 22:54:02 -0700
Message-ID: <20260416055407.795016-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055407.795016-1-khem.raj@oss.qualcomm.com>
References: <20260416055407.795016-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 05:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235334

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../dos2unix/{dos2unix_7.5.4.bb => dos2unix_7.5.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.5.4.bb => dos2unix_7.5.5.bb} (95%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.5.4.bb b/meta/recipes-support/dos2unix/dos2unix_7.5.5.bb
similarity index 95%
rename from meta/recipes-support/dos2unix/dos2unix_7.5.4.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.5.5.bb
index 87d51574cc..aa078ed200 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.5.4.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.5.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af1174fd3d1a254eec3a4a1d1da170a9"
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "dd37537e5fe03ac123aca9a9c944ef87fb998dcd"
+SRCREV = "54524999eece4e9ad0dab580c79b02855fc85028"
 
 S = "${UNPACKDIR}/${BP}/dos2unix"
 

