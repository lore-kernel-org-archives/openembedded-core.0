Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A6E3CCD185
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 07:36:22 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.13418.1759822576400047920
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 00:36:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ZiZ7yjfA;
 spf=pass (domain: mvista.com, ip: 209.85.215.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b556284db11so5614832a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 00:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1759822575; x=1760427375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OtweI1dapOjBealD8yylk67zfEPdGFwe5brxK7OdMYc=;
        b=ZiZ7yjfAgpOD+yCBBR9MHsc89rnhH/IIeOjz8jonleb8kh+FakgTxomh9qi8CWOmsT
         xyTHpc1HZdbyfpFxIpjycbewBiqduiIpVkMHCJCbCpAqGKTnSkLqW8J0lCtL8ENtlPm4
         W+nHQQaj/3BQnFsGoXR7clxZafseJUn3OT8h8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759822575; x=1760427375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OtweI1dapOjBealD8yylk67zfEPdGFwe5brxK7OdMYc=;
        b=Sqe2Sa/MvWMmI0L5QL3rTNZdk7xVcvXGp2zV5SKQw6kmQezuc3J+/3rm9aR6veAfsz
         PkQfAsJgf9M+XTXmTRVDAa5itKhvUIWi2C0BqCT5agvGs67EvzG2vyT+DqGpjFf4hoZN
         yGkoKn/TsJcng7cv3PcWbc5TSsE21sw1y0kosirzONz/GTx3P2yddfB2bV+vNEYQn21a
         pXhIykQmdwD+6zGfN4aw/R08WWUSMwKS5eE0VhaczW9eEOQGhlskXJTskL9wX9NmEyTT
         taYrdnnCW1WxiM2cRsChS0wxEFyM7k8z1o8HZ0A2B1TA8eBpBT/lC5WKwINdDj8VUz8E
         f3mQ==
X-Gm-Message-State: AOJu0Yzc+vHB8c1Hi6rlwMy4jE1rnzvF3BYjaB2bywg04GFbLvw0RXQ9
	wBja4Y3zdW5klYOoKT5IFPRH4BmIUWS4TngArCgHcxiEmjMltmZffO5S4NDeQfi2lW5oLBlW9nz
	D1qdvtmc=
X-Gm-Gg: ASbGncsMNZOXNPqUURj2mkcItEImjo/CRZFZlWYXmut3Tx/zLWORjY1/MLWn6DxgRvY
	mpy4W1fNBD8xzqlV/bC6yI14/m1QGqNTUONGAWw9TCcpFT0W9vfhv8EZPQ5zFPnph6rTn631+tI
	wAqDmUlyVV1pZTIQr1rWtLQvlR/3ueUctrHG41zJhFlBO4HiTPK2m+PM0tnjlQr8HjStM4ggPWr
	aSf5HIjj1lI6lPSjaGohKJvjuw9XsLPn4anKDW59j6ZLuV2piX6Z5Alh8LCI4fGmCv7Z2JEbiBv
	aDLuQJdcZXb2cKFpy8EWmhj2ZM8Gxp9+8kKgb7aqzQskhQLQCgw1X0NJae37xgclbzen+9uYDEN
	wTtmky/xD47TksZoGCvTdNRZzYPS2tRRinBO5uN3FgxUvBBvIc2Pi1zVAGPFI5w==
X-Google-Smtp-Source: AGHT+IFZ4QpvG5FiuUXGnPXUzCRVys0EBcdunuYysvyC5ZIw4WCU+I4XRc1Fbguf/SAXCJ5QsbHXLw==
X-Received: by 2002:a17:902:f792:b0:25c:d4b6:f119 with SMTP id d9443c01a7336-28e9a5bd325mr205585605ad.12.1759822575064;
        Tue, 07 Oct 2025 00:36:15 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:8fce:10c0:ed9d:912e:bd93:91cd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d126ad9sm155498605ad.45.2025.10.07.00.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 00:36:14 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 1/2] tiff: Fix CVE-2025-8961
Date: Tue,  7 Oct 2025 13:06:03 +0530
Message-Id: <20251007073604.856848-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 07:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224514

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/0ac97aa7a5bffddd88f7cdbe517264e9db3f5bd5

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libtiff/tiff/CVE-2025-8961.patch          | 74 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8961.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8961.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8961.patch
new file mode 100644
index 0000000000..05b11a866e
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8961.patch
@@ -0,0 +1,74 @@
+From 0ac97aa7a5bffddd88f7cdbe517264e9db3f5bd5 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Fri, 5 Sep 2025 21:42:35 +0000
+Subject: [PATCH] tiffcrop: fix double-free and memory leak exposed by issue
+ #721
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/0ac97aa7a5bffddd88f7cdbe517264e9db3f5bd5]
+CVE: CVE-2025-8961
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ tools/tiffcrop.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index e16bc2d..c7d2553 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -929,6 +929,7 @@ static int readContigTilesIntoBuffer (TIFF* in, uint8_t* buf,
+ 		      TIFFError("readContigTilesIntoBuffer",
+                                 "Unable to extract row %"PRIu32" from tile %"PRIu32,
+ 				row, TIFFCurrentTile(in));
++		      _TIFFfree(tilebuf);
+ 		      return 1;
+ 		      }
+ 		    break;
+@@ -943,6 +944,7 @@ static int readContigTilesIntoBuffer (TIFF* in, uint8_t* buf,
+ 		        TIFFError("readContigTilesIntoBuffer",
+                                   "Unable to extract row %"PRIu32" from tile %"PRIu32,
+ 				  row, TIFFCurrentTile(in));
++		        _TIFFfree(tilebuf);
+ 		        return 1;
+ 		        }
+ 		      break;
+@@ -957,6 +959,7 @@ static int readContigTilesIntoBuffer (TIFF* in, uint8_t* buf,
+ 		        TIFFError("readContigTilesIntoBuffer",
+                                   "Unable to extract row %"PRIu32" from tile %"PRIu32,
+ 			  	  row, TIFFCurrentTile(in));
++		        _TIFFfree(tilebuf);
+ 		        return 1;
+ 		        }
+ 	            break;
+@@ -969,6 +972,7 @@ static int readContigTilesIntoBuffer (TIFF* in, uint8_t* buf,
+ 		      TIFFError("readContigTilesIntoBuffer",
+                                 "Unable to extract row %"PRIu32" from tile %"PRIu32,
+ 		  	        row, TIFFCurrentTile(in));
++		      _TIFFfree(tilebuf);
+ 		      return 1;
+ 		      }
+ 		    break;
+@@ -983,10 +987,12 @@ static int readContigTilesIntoBuffer (TIFF* in, uint8_t* buf,
+ 		      TIFFError("readContigTilesIntoBuffer",
+                                 "Unable to extract row %"PRIu32" from tile %"PRIu32,
+ 			        row, TIFFCurrentTile(in));
++		      _TIFFfree(tilebuf);
+ 		      return 1;
+ 		      }
+ 		    break;
+             default: TIFFError("readContigTilesIntoBuffer", "Unsupported bit depth %"PRIu16, bps);
++		     _TIFFfree(tilebuf);
+ 		     return 1;
+ 	    }
+           }
+@@ -2535,7 +2541,7 @@ main(int argc, char* argv[])
+     }
+ 
+   /* If we did not use the read buffer as the crop buffer */
+-  if (read_buff)
++  if (read_buff && read_buff != crop_buff)
+     _TIFFfree(read_buff);
+ 
+   if (crop_buff)
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 0b4bef4c41..2ee6cdef73 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -63,6 +63,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2025-8534.patch \
            file://CVE-2025-8851.patch \
            file://CVE-2025-9900.patch \
+           file://CVE-2025-8961.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.25.1


