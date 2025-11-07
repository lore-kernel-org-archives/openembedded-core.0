Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5CA0CCFA19
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 08:13:38 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6810.1762503211958492315
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 00:13:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KdTA7glD;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-33292adb180so480941a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 00:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762503211; x=1763108011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=px0QyWjoN+/kvLvKRrpXLuNKIoKbRJmKayE9oeifKSY=;
        b=KdTA7glDhnZc7wldbV1qEbwzL3qWGKKq4t7NrQS5W6QXEpWPxxeUQIqOIFJ06NZ4PZ
         Yy0gvLmlARkAejJUSOgRtcbo7mlpOFxXQxeLSQQgBNtN99/INoZdZTOWSYlf5mcpEf1C
         kG9eMt1hwzWRWjW3yD8Qa0LH1yLWk74Ab1qx72ni1kDS9e2tCkF8RYeMsvipAHJaQQnD
         EzF8UzIiHA2+BXH/rRhP0tU9Pv2azkldQBP33aLTrA8uWM0eWohOLPfF9hqa5gdC5/oi
         tfVklH70P8HLshSkQjYdW/imAY+DnMWF5u5MgdUU+gWGUzsaq0CQl/cOViKnVQrjpFGn
         /HzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762503211; x=1763108011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=px0QyWjoN+/kvLvKRrpXLuNKIoKbRJmKayE9oeifKSY=;
        b=cnT1cEWlgr/dMTSoWFEVtFGASXtI2aBo9d2s4aXpNGuocua+WIgLcln9YTjsnPpbfi
         WgTmiC7a53FuIBTbAyARa1CTufLeNU3B74cefly8TOJKW/PYLRvjr9tNGeAT81BFGyJP
         t9KaSqeB/ySPsfMu7gSEKwLwyWIALUrTF06cIfYgxlC++X1iJqKUs/MaGS1vvCDda3yL
         iEcmhE2SZhrAAhgynJ+Ft6CC+UwxZHf4G3y31sLR+9uv0o91zi6QH4zTMJQOboIh7Zdf
         Gi/N9vH8dGn5tTzGSrwUockrG5f/3OXJtgGrLVpGnzDjF9rdbvamXj5YB/FCGN1TG6JP
         u7Eg==
X-Gm-Message-State: AOJu0Yw07w4dAsXrr2pf9MzvEZYvHXJzBS403tS1xkh2ZPdkU13FKr/8
	e6dnX2G2bIingnwFiIT0ttuu8chnNYIdmGLOuYxYLSAl66L/RzhFq6oRldVKKg==
X-Gm-Gg: ASbGncufhs3dLharNo7jv83S5L35N2npDgAhbXXYqVczFEFLYqzPbqy+F/SBUlo+W4y
	l9QlTWDwzqeCZ2/W/S/xB5KX0j1kWKj3YVRTsSLokMtUeiQrHbKUTEth0FjYvwmfDcCjfBAL8Kv
	qmCGExSgq2rCSCTnkN5DEGMAlhonrRGe/8Z3ClFWrdOCPxRiWhSg8p3qGB2aMslVijI0sTztX2E
	+i9BW/HwedP+oxYmaFfOjbxduOuwcUiPsR2U9iG9dUvfdx/fxnOT6GTd7UvU6qyMO2mWhtp3tKO
	Qk9rb9KVxbmDWvBLBT32FSxCEgIkYkgp45PIWPO9vmVlCMlbOMtlK54s15xIKQKT4+L1j9tg7GL
	oAW+IwHgjHi/qa0YRMvHoQV5kAVEmIO7t2yoQZ2KmJ2jFKi7PmybiSYheKhEpu8V6NAuMp8Dfcu
	ygUX++gT5vh3BufQ==
X-Google-Smtp-Source: AGHT+IHNzKIGpt8TgiyFmDqU6X0AIxg9UySw3VGJWKJDRy8PoppAOtrkIk3lBNwR0qoCqdNx/8NzgQ==
X-Received: by 2002:a17:90b:5383:b0:32b:65e6:ec48 with SMTP id 98e67ed59e1d1-3434c4efbf4mr2981474a91.8.1762503211029;
        Fri, 07 Nov 2025 00:13:31 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bad33c801d1sm1043010a12.7.2025.11.07.00.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 00:13:30 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 1/3] mpg123: upgrade 1.33.2 -> 1.33.3
Date: Fri,  7 Nov 2025 21:13:21 +1300
Message-ID: <20251107081323.4111387-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 08:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226018

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
* Fix build with newer toolchain on Android by using __ANDROID__ macro (bug 380).
* Consolidate and more consistently use .rodata switch in macro.

https://github.com/madebr/mpg123/blob/master-with-github-ci/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mpg123/{mpg123_1.33.2.bb => mpg123_1.33.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.33.2.bb => mpg123_1.33.3.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.33.2.bb b/meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.33.2.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb
index 23bb400ce5..b1897fe95d 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.33.2.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "2c54fabbfa696dce8f9b137c8ef7a429a061f8fe633cd7d0a511809855f2c219"
+SRC_URI[sha256sum] = "6a0c6472dd156e213c2068f40115ebbb73978c2d873e66bae2a250e2d2198d26"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 

