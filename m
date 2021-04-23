Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web09.10271.1619186430764501759
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 07:00:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ufRil/bf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id a12so34133184pfc.7
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 07:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2rHOvznFG5c2JC2zi2awpRbU/5RNZSx/ucYbT4aIZX8=;
        b=ufRil/bfeWeXba8DDzXzqrE801AtqdbFPVmpJwsSF2D73UGR6mbeYn0T1nG5XJDTxn
         xD2pyngQ/6lnuILMJggFDBO4idnqUN3uumNLlx/mn85UdjxDY/WLzyo7g90u2wUicnYm
         EPvjbUI91GV1ETZARFEQ/iRv7sl6+/vJaHsNqs0q4wQpVn58V/gBvlTfAfcwJNkyzl2J
         3FYTrag6hlb5Elw8rLbEYlRHRZVq2ap5xjrvA7wSyRkAWsHDMVS3gt0uwIlLjzjgIrwP
         Fr4OXNOO8+ZyChXkRuwX+HdjFfy1EvRKzZj+trJF2TqHetREgSzNExu+Ke40pVk/Kg4R
         VjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2rHOvznFG5c2JC2zi2awpRbU/5RNZSx/ucYbT4aIZX8=;
        b=SKkgKTNEstFe5qCao2LifayRxikvNNefbasvd0Fy7kYCmHNg6uoxNsRZQZp126vbbx
         bH6TfrmlRMSPjg45kVARai6DluJvXEtBZiuxSoyRfoj4/cIak+bcu9zQkfHfEMrENSy/
         gtq3SXJW0JnF41NFcW7IH9CSGtYz+qhaJX1RgUkafGYiXUTksWaDoOvEZZ/k3sBAMh96
         CEV0D/Qk77EesEd02fkY9ERLe9n76r4rw0/j/1GrlWuhcDmALyKQY9tWvjBLhm89WWyt
         ouO4QfERyb8reaXSBfDm578Z96B8D9zg5xbInIhc3NwgIjPziEaQnOCAjI8XA3EBJdWO
         2+Pw==
X-Gm-Message-State: AOAM530DmziPoFap44PqDeITX0Mb4LVC8Vvv2KoJBig+h5TJHBqdL15J
	YXUwg+2dQSH+Pu5FCboY9QNtj8NfpDyH93dIghw=
X-Google-Smtp-Source: ABdhPJwUD0lkVU5Uyym2hcWaqcQxY8OoEc8Yikt72U/tBYZOfO2kidyPJN/j/o5jVmm9Thh0dNLqTw==
X-Received: by 2002:a63:db47:: with SMTP id x7mr3977851pgi.360.1619186429868;
        Fri, 23 Apr 2021 07:00:29 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b25sm4988379pfd.7.2021.04.23.07.00.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:00:28 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/19] libtool: make sure autoheader run before automake
Date: Fri, 23 Apr 2021 03:58:54 -1000
Message-Id: <0d5dd68a07707f8b8428fe564414e2f5b7433ed5.1619186107.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619186107.git.steve@sakoman.com>
References: <cover.1619186107.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mingli Yu <mingli.yu@windriver.com>

When use automake to generate Makefile.in from Makefile.am, there
comes below race:
 | configure.ac:45: error: required file 'config-h.in' not found

It is because the file config-h.in in updating process by autoheader,
so make automake run after autoheader to avoid the above race.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1fc0a4a98e65db7efba8bb5cb835101ea5dd865b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtool/libtool-2.4.6.inc                 |  1 +
 ...-sure-autoheader-run-before-automake.patch | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-automake.patch

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
index 19a03d4733..e9225e140c 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://0001-libtool-Fix-support-for-NIOS2-processor.patch \
            file://0001-libtool-Check-for-static-libs-for-internal-compiler-.patch \
            file://0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch \
+           file://0001-Makefile.am-make-sure-autoheader-run-before-automake.patch \
           "
 
 SRC_URI[md5sum] = "addf44b646ddb4e3919805aa88fa7c5e"
diff --git a/meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-automake.patch b/meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-automake.patch
new file mode 100644
index 0000000000..87f8492346
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-automake.patch
@@ -0,0 +1,35 @@
+From e82c06584f02e3e4487aa73aa05981e2a35dc6d1 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Tue, 13 Apr 2021 07:17:29 +0000
+Subject: [PATCH] Makefile.am: make sure autoheader run before automake
+
+When use automake to generate Makefile.in from Makefile.am, there
+comes below race:
+ | configure.ac:45: error: required file 'config-h.in' not found
+
+It is because the file config-h.in in updating process by autoheader,
+so make automake run after autoheader to avoid the above race.
+
+Upstream-Status: Submitted [libtool-patches@gnu.org maillist]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 2752ecc..29950db 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -328,7 +328,7 @@ EXTRA_DIST     += $(lt_aclocal_m4) \
+ 		  $(lt_obsolete_m4) \
+ 		  $(stamp_mk)
+ 
+-$(lt_Makefile_in): $(lt_Makefile_am) $(lt_aclocal_m4)
++$(lt_Makefile_in): $(lt_Makefile_am) $(lt_aclocal_m4) $(lt_config_h_in)
+ 	$(AM_V_GEN)cd '$(srcdir)/$(ltdl_dir)' && $(AUTOMAKE) Makefile
+ 
+ # Don't let unused scripts leak into the libltdl Makefile
+-- 
+2.29.2
+
-- 
2.25.1

