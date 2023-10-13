Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8BACDB484
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:53:13 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.51137.1697233983811050153
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aGI90Ei7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6b70a73f8c4so506857b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697233983; x=1697838783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AbLr4e3zmLcOe3UphSpmdHOPATJPataVXPrNkbfZVlM=;
        b=aGI90Ei7iHVfVb9gENpgurMcne2fjtWEKsXtSG2MC0D8UQ2boqphNJpOKlG+u6BXqH
         KBzArKqKJoAIdhz5vQlvD/meJ7frKdPsT/g6iQowKW8U9mKWixNzgqu7gekd+VIsVbnc
         bGbYf4XEjjjtyP6moa+Gwr+qKvNX7p8oyo+nrAT9uNMgdpqbOf55tmIjSYN4fPAJGzIy
         xMWcGY1SjuwE1t68i7skeWK9nTdE/mS3UeJxZinay3xAMO4tHWn1QUQKzfxFBMD1WSVV
         zENNhya3e1o8gfHSEd+jL3FjwDGggtlg+Jw0ODCYV7PvHQJ0URvn/Km4cqeZLZo4g+wv
         64jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697233983; x=1697838783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AbLr4e3zmLcOe3UphSpmdHOPATJPataVXPrNkbfZVlM=;
        b=SObQfJWWpjlUbINJuiLixcxEvGz68yhL7fJC3junBuhF0fqa2lagPJm/kZNpBpX+wA
         9ZAh9dhE7yzz5tGefr05vsYV/DQyZAJdU7zU642fB+MKipcpu0VumOkOJDKGYt+DcUoL
         DmJMk3SwyKcBU+i6IlreQBU/HB+wPI9/bUqmwbpFK1aN3EdeT5SSmLY+iQh+CHvEQ8L7
         6PAAEArKvVWTUl79ASZ0ksbJaEVHY9n3wNDm9KF7MC7xaZbMkFCj58SCUzFLGXbArEgF
         14Mmr3lpJ4GrEmaneNBYdvXeGtQOa1E4B8ei3rIlP9O2VdK7mAe4XqEQGW1apzJbu0eX
         QXMg==
X-Gm-Message-State: AOJu0Yz9zES3tAA+61quMc5EjrRTswI4QDOKyfAfh2bVsFlOCN8UghuR
	sSqAwenN7PSqzAE6P6G15izWXyEx6/DtEBjxwnQ=
X-Google-Smtp-Source: AGHT+IHjWD4yY9w1HJu0wtM3qtVD5/y3jKUXnjvQx5VHH73OmzO9pDhPXDupHpsG2sn69xJVjEK6ww==
X-Received: by 2002:a05:6a00:1388:b0:68c:a81:4368 with SMTP id t8-20020a056a00138800b0068c0a814368mr29488306pfg.6.1697233982783;
        Fri, 13 Oct 2023 14:53:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.53.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 01/27] tiff: fix CVE-2023-40745
Date: Fri, 13 Oct 2023 11:52:25 -1000
Message-Id: <3340e024ae8676081488f23a0678c28c23ab0b42.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189078

From: Yogita Urade <yogita.urade@windriver.com>

libtiff: integer overflow in tiffcp.c

References:
https://security-tracker.debian.org/tracker/CVE-2023-40745
https://gitlab.com/libtiff/libtiff/-/issues/591
https://bugzilla.redhat.com/show_bug.cgi?id=2235265

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c3d4fbeb51278a04a6800c894c681733ad2259ca)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/files/CVE-2023-40745.patch        | 35 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.5.1.bb |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch
new file mode 100644
index 0000000000..73f1f37bab
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch
@@ -0,0 +1,35 @@
+From 4fc16f649fa2875d5c388cf2edc295510a247ee5 Mon Sep 17 00:00:00 2001
+From: Arie Haenel <arie.haenel@jct.ac.il>
+Date: Thu, 14 Sep 2023 04:31:35 +0000
+Subject: [PATCH] tiffcp: fix memory corruption (overflow) on hostile images
+ (fixes #591)
+
+CVE: CVE-2023-40745
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/4fc16f649fa2875d5c388cf2edc295510a247ee5]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tools/tiffcp.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/tools/tiffcp.c b/tools/tiffcp.c
+index 3b2d1dd..57fa6e8 100644
+--- a/tools/tiffcp.c
++++ b/tools/tiffcp.c
+@@ -1754,6 +1754,13 @@ DECLAREreadFunc(readSeparateTilesIntoBuffer)
+                   "Width * Samples/Pixel)");
+         return 0;
+     }
++
++    if ( (imagew - tilew * spp) > INT_MAX ){
++        TIFFError(TIFFFileName(in),
++                  "Error, image raster scan line size is too large");
++        return 0;
++    }
++
+     iskew = imagew - tilew * spp;
+     tilebuf = limitMalloc(tilesize);
+     if (tilebuf == 0)
+--
+2.35.5
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb b/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
index 5af3f84265..9cd790a2da 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a3e32d664d6db1386b4689c8121531c3"
 
 CVE_PRODUCT = "libtiff"
 
-SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz"
+SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
+           file://CVE-2023-40745.patch \
+           "
 
 SRC_URI[sha256sum] = "d7f38b6788e4a8f5da7940c5ac9424f494d8a79eba53d555f4a507167dca5e2b"
 
-- 
2.34.1


