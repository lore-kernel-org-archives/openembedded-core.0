Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.803.1589820568818688139
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 09:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=07lHoRzP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.194, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f194.google.com with SMTP id t11so5099046pgg.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 09:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=3MGtoQyb0mK5r/8OFMiLPS7Y447Fjxt6m/grJwHLsZk=;
        b=07lHoRzPgz5a8jphh7o55H2MBim6ne/qO3AlvjMyW0DVga1+/MGzY+uuUErG5+CNh/
         yEgkZMTNZT+ZRxJFFOmXB0zs0fR2XdT27wjbpeu39jG6juXF6Rx/QA6hvQHsFdI/A9af
         xC13O+0tTfo61ZwNrq50ta+ZFNDzDFkzfdwO/Dbde7EcJ+az8fEZzQsIOQ+pwNYwzVEj
         Ya2As58MjX9CHI4+j8UBJNOTNwunqq9B2bgddzjCWLoBo1u8RzDlvqnT8Vs2w01v1PPB
         U3dYN07fmW5yVCioDyJEEsMsRTmvvEQ52ALzDGGQC69B3/OVDF7r0XMbf2TWRt7geZ0p
         tUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=3MGtoQyb0mK5r/8OFMiLPS7Y447Fjxt6m/grJwHLsZk=;
        b=JgelJT/uB2frZUIh2Pt2xb3uVQt+tAhF+SsFdIikQRiG7nW4+bKKeBXBYVHRJz4oMp
         WXSot9k1pzsUSgXEgk+TXpm9nhvP9uKQlyAo4vphp6QLPgvAk/vTCDtLhYRjBG8WEkac
         WhTl+7PfOTlxsJHnmmfEPA8AVE3gxGnVgtZbPlaNo1UszjvD7eFy/Bu1q/33bVf7pyUO
         YCRn6kulUuD8upTMmcKSKUHHxMUCgpX2ecSHUsk5egoZ8fSw/SQ0zvF12v5ZQ1cxvmvL
         XN6tAU+F9FdfN+ExjsD7gOCmJby23lfpOJ3t1G6XdFa8+Bh4b9rIUw4z7xQtjecWGWpD
         g9Mw==
X-Gm-Message-State: AOAM531JFSfz9MvTYPUDkytA+DCt4Poso7oRhsurI1fpSFFbCvtxkvZc
	YTmXsVjyXWuXd7lMFCtDvnXxNUaOZHvFcg==
X-Google-Smtp-Source: ABdhPJzBJl4ZFPOUlVnTJs4Dqf7E9VltjcvOe+mSez1xE/D+J+ROK0jLsQLq4yBrNPhpvLdPGP7j/w==
X-Received: by 2002:a63:2f41:: with SMTP id v62mr15740435pgv.178.1589820567855;
        Mon, 18 May 2020 09:49:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g6sm62869pjx.48.2020.05.18.09.49.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:49:27 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/19] scripts/tiny/ksize: Fix for more recent kernels
Date: Mon, 18 May 2020 06:48:29 -1000
Message-Id: <8a883c3b0773960908491c03c46e7ed320e41dc5.1589820011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589820010.git.steve@sakoman.com>
References: <cover.1589820010.git.steve@sakoman.com>

From: jan <jan.vermaete@gmail.com>

In the past kernel built object files were named 'built-in.o'.
Nowadays it is 'built-in.a'.

The script is modified to work with both.  I expect
it will not happen that there are built-in.a and built-in.o
files in the same kernel.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/tiny/ksize.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/tiny/ksize.py b/scripts/tiny/ksize.py
index 8316b85cb1..db2b9ec39f 100755
--- a/scripts/tiny/ksize.py
+++ b/scripts/tiny/ksize.py
@@ -4,7 +4,7 @@
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 #
-# Display details of the kernel build size, broken up by built-in.o. Sort
+# Display details of the kernel build size, broken up by built-in.[o,a]. Sort
 # the objects by size. Run from the top level kernel build directory.
 #
 # Author: Darren Hart <dvhart@linux.intel.com>
@@ -59,7 +59,7 @@ class Report:
             p = Popen("ls " + subglob, shell=True, stdout=PIPE, stderr=PIPE, universal_newlines=True)
             for f in p.communicate()[0].splitlines():
                 path = os.path.dirname(f)
-                r.parts.append(Report.create(f, path, str(path) + "/*/built-in.o"))
+                r.parts.append(Report.create(f, path, str(path) + "/*/built-in.[o,a]"))
             r.parts.sort(reverse=True)
 
         for b in r.parts:
@@ -139,7 +139,7 @@ def main():
         else:
             assert False, "unhandled option"
 
-    glob = "arch/*/built-in.o */built-in.o"
+    glob = "arch/*/built-in.[o,a] */built-in.[o,a]"
     vmlinux = Report.create("vmlinux",  "Linux Kernel", glob)
 
     vmlinux.show()
-- 
2.17.1

