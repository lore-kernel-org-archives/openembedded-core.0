Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.7465.1611915868972496108
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 02:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W6LpeNI6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f54.google.com with SMTP id s11so9962787edd.5
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 02:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KjRn52ELVKc8PSIv7jQGJijQFa4M1rIU75DyBT4v9fw=;
        b=W6LpeNI6+pJLUIQSS9JEs7hCyLZS+R8x8TmHfH0t+P0CzaZrx9bXSJj3IvtP0JYjCf
         deFfEO5jl8wQ6M7fjpsqvlO9ly2DO25NHHrjeU78C68lg/SY2Nv1G20AGoROEmGMdeGs
         35tNQHPFe65cJPoR8qcovx6KWnsh+yPOQ9Jew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KjRn52ELVKc8PSIv7jQGJijQFa4M1rIU75DyBT4v9fw=;
        b=GFOclGxzeROWPCGKawK3QoOz69NEOigSNome2iM196u8e5b6qHoSyL50CqwAN6kHrB
         EhNX9BxyIT26ZYF7be+iMoTpWWPu4YA015+cBatvLSD4vzoctpfLAOKNCQx8XTrWnUA9
         spzS8KYOPVmvX0WdaiJeCimfJDEGVvNCFKULEyIu9RoSQSzBjEcBw+/v4oKprAqzvP6D
         8qvkAceGgnjQ60jxDDhALoPVxNvmveNJOGbBCiZwhCeDmnGtHAHm5zATMAGiJTS43wXD
         RrFFV9tQqK13bi4cZxHGmmeBNE55zNLsNMOdL0q8if0Q32iDVirnDFoK8uWe1HIDFGlh
         YwzQ==
X-Gm-Message-State: AOAM531VfUC8ckbFC1eGo8WvVMXD4qQSAOQsxJdZ4csHlUlorKr0YT65
	omZvHlz103JkYRaggjKEH8GGsxSRVt0sng==
X-Google-Smtp-Source: ABdhPJx3VSeh04v+7L1mHZ4wfPFUL9EdCeKjeg3dpAKuYYrk5Q2cr/f1QlI5GFb7qT/nYi8UoXvA0w==
X-Received: by 2002:a50:c94c:: with SMTP id p12mr4232391edh.154.1611915867115;
        Fri, 29 Jan 2021 02:24:27 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:93ef:509c:4f16:14ff])
        by smtp.gmail.com with ESMTPSA id k22sm3554574eji.101.2021.01.29.02.24.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 02:24:26 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/13] at: Upgrade 3.1.23 -> 3.2.1
Date: Fri, 29 Jan 2021 10:24:17 +0000
Message-Id: <20210129102419.1360572-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
References: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes flex issues with autoconf 2.70 rather than backporting patches.

Patches refreshed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../at/at/0001-remove-glibc-assumption.patch  | 23 ++++++++-----------
 .../at/at/file_replacement_with_gplv2.patch   |  8 +++----
 .../at/at/fix_parallel_build_error.patch      | 11 ++++-----
 .../at/at/makefile-fix-parallel.patch         |  8 +++----
 .../at/{at_3.1.23.bb => at_3.2.1.bb}          |  5 ++--
 5 files changed, 24 insertions(+), 31 deletions(-)
 rename meta/recipes-extended/at/{at_3.1.23.bb => at_3.2.1.bb} (90%)

diff --git a/meta/recipes-extended/at/at/0001-remove-glibc-assumption.patch b/meta/recipes-extended/at/at/0001-remove-glibc-assumption.patch
index 7fdecc7fd1b..fd57f94cd5a 100644
--- a/meta/recipes-extended/at/at/0001-remove-glibc-assumption.patch
+++ b/meta/recipes-extended/at/at/0001-remove-glibc-assumption.patch
@@ -18,21 +18,21 @@ Signed-off-by: Dengke Du <dengke.du@windriver.com>
  parsetime.y | 11 +++++++----
  1 file changed, 7 insertions(+), 4 deletions(-)
 
-diff --git a/parsetime.y b/parsetime.y
-index 7005e88..324e6d3 100644
---- a/parsetime.y
-+++ b/parsetime.y
-@@ -8,6 +8,9 @@
- 
- #define YYDEBUG 1
+Index: at-3.2.1/parsetime.y
+===================================================================
+--- at-3.2.1.orig/parsetime.y
++++ at-3.2.1/parsetime.y
+@@ -14,6 +14,9 @@
+     ((y) % 4 == 0 && ((y) % 100 != 0 || (y) % 400 == 0))
+ #endif
  
 +#define is_leap_year(y) \
 +    ((y) % 4 == 0 && ((y) % 100 != 0 || (y) % 400 == 0))
 +
  struct tm exectm;
  static int isgmt;
- static int yearspec;
-@@ -217,8 +220,8 @@ date            : month_name day_number
+ static char *tz = NULL;
+@@ -230,8 +233,8 @@ date            : month_name day_number
  				 mnum == 12) && dnum > 31)
  			    || ((mnum ==  4 || mnum ==  6 || mnum ==  9 ||
  			         mnum == 11) && dnum > 30)
@@ -43,7 +43,7 @@ index 7005e88..324e6d3 100644
  			   )
  			{
  			    yyerror("Error in day of month");
-@@ -261,8 +264,8 @@ date            : month_name day_number
+@@ -274,8 +277,8 @@ date            : month_name day_number
  				 mnum == 12) && dnum > 31)
  			    || ((mnum ==  4 || mnum ==  6 || mnum ==  9 ||
  			         mnum == 11) && dnum > 30)
@@ -54,6 +54,3 @@ index 7005e88..324e6d3 100644
  			   )
  			{
  			    yyerror("Error in day of month");
--- 
-2.8.1
-
diff --git a/meta/recipes-extended/at/at/file_replacement_with_gplv2.patch b/meta/recipes-extended/at/at/file_replacement_with_gplv2.patch
index d5ef0032be2..11023bdf52f 100644
--- a/meta/recipes-extended/at/at/file_replacement_with_gplv2.patch
+++ b/meta/recipes-extended/at/at/file_replacement_with_gplv2.patch
@@ -10,11 +10,11 @@ update the Copyright file information to reflect the replaced files.
 Date: 2010/08/31
 Nitin A Kamble nitin.a.kamble@intel.com
 
-Index: at-3.1.12/Copyright
+Index: at-3.2.1/Copyright
 ===================================================================
---- at-3.1.12.orig/Copyright
-+++ at-3.1.12/Copyright
-@@ -31,10 +31,10 @@ The files posixtm.c and posixtm.h have t
+--- at-3.2.1.orig/Copyright
++++ at-3.2.1/Copyright
+@@ -34,10 +34,10 @@ The files posixtm.c and posixtm.h have t
     Copyright (C) 1989, 1990, 1991, 1998, 2000, 2001, 2002, 2003, 2004,
     2005, 2006, 2007 Free Software Foundation Inc.
  
diff --git a/meta/recipes-extended/at/at/fix_parallel_build_error.patch b/meta/recipes-extended/at/at/fix_parallel_build_error.patch
index 30d2324126d..e4f32b82b6c 100644
--- a/meta/recipes-extended/at/at/fix_parallel_build_error.patch
+++ b/meta/recipes-extended/at/at/fix_parallel_build_error.patch
@@ -22,10 +22,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  Makefile.in | 2 ++
  1 file changed, 2 insertions(+)
 
-diff --git a/Makefile.in b/Makefile.in
-index 4c11913..18ecc23 100644
---- a/Makefile.in
-+++ b/Makefile.in
+Index: at-3.2.1/Makefile.in
+===================================================================
+--- at-3.2.1.orig/Makefile.in
++++ at-3.2.1/Makefile.in
 @@ -83,6 +83,8 @@ y.tab.c y.tab.h: parsetime.y
  lex.yy.c: parsetime.l
  	$(LEX) -i parsetime.l
@@ -35,6 +35,3 @@ index 4c11913..18ecc23 100644
  atd.service: atd.service.in
  	cat $< | sed -e 's![@]sbindir[@]!$(sbindir)!g' | sed -e 's![@]atjobdir[@]!$(atjobdir)!g' > $@
  
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/at/at/makefile-fix-parallel.patch b/meta/recipes-extended/at/at/makefile-fix-parallel.patch
index d6056dceffa..adb8652053b 100644
--- a/meta/recipes-extended/at/at/makefile-fix-parallel.patch
+++ b/meta/recipes-extended/at/at/makefile-fix-parallel.patch
@@ -15,11 +15,11 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  Makefile |    4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
-Index: at-3.1.20/Makefile.in
+Index: at-3.2.1/Makefile.in
 ===================================================================
---- at-3.1.20.orig/Makefile.in
-+++ at-3.1.20/Makefile.in
-@@ -76,7 +76,9 @@ at: $(ATOBJECTS)
+--- at-3.2.1.orig/Makefile.in
++++ at-3.2.1/Makefile.in
+@@ -77,7 +77,9 @@ at: $(ATOBJECTS)
  atd: $(RUNOBJECTS)
  	$(CC) $(LDFLAGS) -o atd $(RUNOBJECTS) $(LIBS) $(PAMLIB) $(SELINUXLIB)
  
diff --git a/meta/recipes-extended/at/at_3.1.23.bb b/meta/recipes-extended/at/at_3.2.1.bb
similarity index 90%
rename from meta/recipes-extended/at/at_3.1.23.bb
rename to meta/recipes-extended/at/at_3.2.1.bb
index b74882d342b..9574b27792b 100644
--- a/meta/recipes-extended/at/at_3.1.23.bb
+++ b/meta/recipes-extended/at/at_3.2.1.bb
@@ -22,7 +22,7 @@ PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
 RCONFLICTS_${PN} = "atd"
 RREPLACES_${PN} = "atd"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20180825T090248Z/pool/main/a/${BPN}/${BPN}_${PV}.orig.tar.gz \
+SRC_URI = "http://software.calhariz.com/at/${BPN}_${PV}.orig.tar.gz \
     file://fix_parallel_build_error.patch \
     file://posixtm.c \
     file://posixtm.h \
@@ -37,8 +37,7 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20180825T090248Z/pool/main/
 PAM_SRC_URI = "file://pam.conf.patch \
                file://configure-add-enable-pam.patch"
 
-SRC_URI[md5sum] = "1cec945506b5ddf1d776c92c315fc581"
-SRC_URI[sha256sum] = "97450aa954aaa8a70218cc8e61a33df9fee9f86527e9f861de302fb7a3c81710"
+SRC_URI[sha256sum] = "aabe6e5cb6dd19fe9fb25c2747492f2db38762b95ea41b86f949609c39fb55c4"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/at/"
 
-- 
2.27.0

