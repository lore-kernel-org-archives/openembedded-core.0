Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B05CCD18C
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:29 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.9191.1760038286712745547
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bC5feFRQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-781010ff051so970753b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038286; x=1760643086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ma/xjlwhrCSuRxFwd4OZnvy73fmFWNTgWWKC0ai3RXU=;
        b=bC5feFRQEtWZVE0gQr54yNotZI+gu0AuSRrKAj5NP0hBEiD/Kat/PBpaNZPUK8Ogk3
         Q2RHRzDkdlV0KnNvzwG1ye2onhKoBSui5aOqU2ibU1HaKHqLO8P8S/07L+YoqwoW0DTv
         YzMX1PfoSODKxNlwb/gXgiMJmNl1tn+oI7ag+rXAXXi3zHAhkOIPfzQSeIAbLw/gKKLa
         xgHifAYRp/HOH2+taasCyze58nqZ7T/N878mtAt5kY1GYqIEBOoUPowLxurp9CY35y4o
         JL5mcjocroOixVSUSu5nJnjFP3wU2YV199rVnckrY1dZjabIZeqgoxX5K92VbOnk82Z/
         9w5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038286; x=1760643086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ma/xjlwhrCSuRxFwd4OZnvy73fmFWNTgWWKC0ai3RXU=;
        b=safLaVWVyMTlHpieW6F2IqEe6A2dlFeQlRMRx0wei375ynuRbjM9Q0Pbq5mR84M3/j
         J2YY7TbKSiGcowp4iptE8hHJhUUbY5kR5FUEEmdeNA2Rz1e28WKeN6qhSLVdaVBtLSZN
         L1mEerLOtBkbsxRyVbMrz02n4+GoX+PUfkpq6g2cat1s57FRI8QdIpl8jFUxIUIVSvLl
         7Rds+Zqhw+zK2wqCgibFNxqsiMQ8o8Fuh34IaoiXHmXvAJRnrA2nq3HTpLbkTF0RopvN
         5RPLWni4gpLE/Ni0JkVG+0GSu0WESPQr23avz44YCrs+lc+FoYniS9EbKTarDnvKoKep
         xHTA==
X-Gm-Message-State: AOJu0Yx7NqqP5GPI8+s3HtKNSmNl3voGkcd6pnPXppz+NS8jb7kxE0KZ
	r2avXT34NtoFRu278u0QxIpZJWerXV7zepkyPsjZY9cxuS2A9mp+tOAjZbsaZCv4J8AWe7iq4wg
	8FTbZ
X-Gm-Gg: ASbGncv04Ak7F8hWWC/kUF7RR26dbzwC4yN+tmYU+W1g2863ybBrebIsRjbsHrn0DVg
	LY53eilTsd8IOitf4nqDdMopkppLyHFa56sTfg6VduT+lfQ1JI27P633gzl3P72hYC26Rj7v+iQ
	p3OgjcLKu88hSFBTGWtcRswtXEOEH64c+Sgo9uDUZxHUAuj4DT4jV2mzrwOglcLQ99XmM6yLa77
	ALUOZSGm1I+dgOr0D89vwFVi58QItwfMavM3NcTHGbJN2z3qSUPRk6T6Lj/4s+VoT38T9JiirfE
	CxHC+reFzER76XuyK2Ybc/5OvPTwHXZQK4mB88+dCTZ68Jik4hXYZqiIJIOzVt1qyVtDBSQGD4f
	CZ+WDtT/FZGJLz+kbc49AzxsPXTE7ZpyH01miNnU+CuXZAdVb
X-Google-Smtp-Source: AGHT+IE3MXPcqsmMf53Y/82VKNRmNcl3nXIsvmPLtsRBN+tUpAU7k/wNhMw8WiUQV32i4PzoJTOOtg==
X-Received: by 2002:a05:6a00:1890:b0:77f:4641:e5ac with SMTP id d2e1a72fcca58-79385136259mr10733806b3a.6.1760038285619;
        Thu, 09 Oct 2025 12:31:25 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/24] tiff: Fix CVE-2025-8961
Date: Thu,  9 Oct 2025 12:30:49 -0700
Message-ID: <8d956d80f0eae39f9de68c0cd5a361c69b47cda4.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224624

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/0ac97aa7a5bffddd88f7cdbe517264e9db3f5bd5

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


