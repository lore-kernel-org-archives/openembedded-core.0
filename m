Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.10319.1619186416947394214
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 07:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=uo+Hlia2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so1251785pjh.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 07:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zeUDQT7bG8GsMJwiUv1MoloVqEtUNwJ+zzm5L3T0+1o=;
        b=uo+Hlia22w0plHuNNrTiVhc7zL8h49SJbnRmr8PD1fyjkd788NlOKWRKzygpfar644
         TDIrz4NwGdaJYp3qPb7IyTV+yvZ8bXaSepTcw9pekVl11psUNEg0mzrNRFhaZWg9BFUQ
         HKQ4GQ6e0pGljQFTKSioMaA/qk1NqjJRQDKXPU2U8Dxl4WlW9cCNNe3CMoYmtUzfh5EW
         ljHydH2m8FR2ORTNGfEQ/kkb0wgSIXbaqNWJ8GLVszsUATs1xSphXuKJMRPkn+f7srrR
         8AVaIL8Wc60kqhDttRkX+FpV9NAR89YMjVcTvx+6upSqp0263WfelhrW76LYMDTNv9ZL
         3wkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zeUDQT7bG8GsMJwiUv1MoloVqEtUNwJ+zzm5L3T0+1o=;
        b=EJ0aZFq1W5CHp9kVfzCwYuvFZOflnVh8xdKlTiMdjdc+nn+grF/68lg4spmVRvRSXt
         cfYUO5W9aWL+l3cUeU5FT21uog9QOBZNdSf11d3xH4dG+vLUtXFGkJD0kDrS3AaHIurM
         Rnb/w1xFKY+suoHvGAzGGXAtZg+W6xjooF37jMfMfs8FlDqqSEFTCnvgwCqw/FiEWxhI
         2azZ1GKKVM+RlFE5GlynlWH6bBw8pm5DnwdR5dUY6O91NVA42OceazT68uSgCMkWzdA1
         rkO2AdXexWK//Fg9Gxaad/qtr7W5XsYAAYMyfpK5ctQtXFeeEwMtlxzkuAS3BoOVdHOc
         3sEA==
X-Gm-Message-State: AOAM530cdB9h3eehIWcbWGoxKpsvo9x74QnVNqcpyyA13+ZpQhLomfGU
	gP3EnUjhixPaa9ZWFOWJ/THr2DqBbBly3PEfi/4=
X-Google-Smtp-Source: ABdhPJzjd7Z34/UyAmNzYFC7mjFsuBkl/L24YB2G/nJ2vTv71GeLZMqS3raWyRIYtYqNxd7d8bwj1A==
X-Received: by 2002:a17:90a:8906:: with SMTP id u6mr4636462pjn.162.1619186415927;
        Fri, 23 Apr 2021 07:00:15 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b25sm4988379pfd.7.2021.04.23.07.00.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:00:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/19] sanity: Further improve directory sanity tests
Date: Fri, 23 Apr 2021 03:58:50 -1000
Message-Id: <bfce6e9e3aab025938672731f9daedea24ad1fdb.1619186107.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619186107.git.steve@sakoman.com>
References: <cover.1619186107.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add tests to ensure COREBASE/TMPDIR doon't contain ".." as this causes
hard to understand build failures.

Also rework the code to test TMPDIR and COREBASE for all the patterns
since they may be set differently and one may contain problematic
characters.

[YOCTO #14111]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f22a6e46d003aba516a9a0cc7f94eae678d846b7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sanity.bbclass | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 5b6b7b598e..83bced2db3 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -882,15 +882,18 @@ def check_sanity_everybuild(status, d):
         except:
             pass
 
-    oeroot = d.getVar('COREBASE')
-    if oeroot.find('+') != -1:
-        status.addresult("Error, you have an invalid character (+) in your COREBASE directory path. Please move the installation to a directory which doesn't include any + characters.")
-    if oeroot.find('@') != -1:
-        status.addresult("Error, you have an invalid character (@) in your COREBASE directory path. Please move the installation to a directory which doesn't include any @ characters.")
-    if oeroot.find('%') != -1:
-        status.addresult("Error, you have an invalid character (%) in your COREBASE directory path which causes problems with python string formatting. Please move the installation to a directory which doesn't include any % characters.") 
-    if oeroot.find(' ') != -1:
-        status.addresult("Error, you have a space in your COREBASE directory path. Please move the installation to a directory which doesn't include a space since autotools doesn't support this.")
+    for checkdir in ['COREBASE', 'TMPDIR']:
+        val = d.getVar(checkdir)
+        if val.find('..') != -1:
+            status.addresult("Error, you have '..' in your %s directory path. Please ensure the variable contains an absolute path as this can break some recipe builds in obtuse ways." % checkdir)
+        if val.find('+') != -1:
+            status.addresult("Error, you have an invalid character (+) in your %s directory path. Please move the installation to a directory which doesn't include any + characters." % checkdir)
+        if val.find('@') != -1:
+            status.addresult("Error, you have an invalid character (@) in your %s directory path. Please move the installation to a directory which doesn't include any @ characters." % checkdir)
+        if val.find(' ') != -1:
+            status.addresult("Error, you have a space in your %s directory path. Please move the installation to a directory which doesn't include a space since autotools doesn't support this." % checkdir)
+        if val.find('%') != -1:
+            status.addresult("Error, you have an invalid character (%) in your %s directory path which causes problems with python string formatting. Please move the installation to a directory which doesn't include any % characters." % checkdir)
 
     # Check the format of MIRRORS, PREMIRRORS and SSTATE_MIRRORS
     import re
-- 
2.25.1

