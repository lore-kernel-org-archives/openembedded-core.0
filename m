Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web12.37287.1628865092649453631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 07:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PzY7NX5/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id n12so11551298plf.4
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 07:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qyhAqQ8X9IX/I0YVnSdbTfjG+RPOF3U/cy+XNNeCxQ4=;
        b=PzY7NX5/Nffswshmcg26dkjnEk9sQ+g360JfV8dHvo4urQYUmTWoCU8ruzFkhBRoTP
         OZoAO3ldOWNmYcTECxqFN+TyoX86dmfwdQyCnk+5K/n41WNHlFUdNaeTH8ka7E+UhSjZ
         12EB/b6AV+ZFyXcXJmbEYdxqgL/L+Rp6Bskh5WtNsfgpAtxU2/ixc+mHxBv/bRADfp+F
         BJeFZ8BnLqyLWduiLwoTYqJ/kQT+DuIb3OiB+bMIWGrmmUVkhbpyFwSBvfaznyKR05t1
         SS5IF9UdBIFqr/2F0tr1hWyFUgCjhnDLE07tsmQxaQ9YTp+V7/XqmmERpw6eshuSKWjh
         zV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qyhAqQ8X9IX/I0YVnSdbTfjG+RPOF3U/cy+XNNeCxQ4=;
        b=qlqTposHJM8cgwbZIh61SwXCorGdHDMNKXVCWy6zlHhvdd4hT6PRohLrx/jz1vI5Qr
         YK1zkL9Rwoatz7d9CxKaCN77z/dFTddMSW8tackASGYPYT8Q+Ozp4OtpmjzdrrgbmkMv
         kYGDJlgmLLZnGxEHB8qUdGH7GeBmoIqQNUUCtCXg+ylokJau7cQ8x99YcSQIt5ESV0PJ
         tj12iOsvZBDjguLgNrJ0ANLtfjJzLcaj1aRtAzgyOA9tfVFpwgHs/lfNVYb1IyNy0k4H
         bbd+0mM3hXWnLUFV9qJmXulyUaeoQejuioSdYzplrQK1ASbd8m24oAky5As58aKOTP5Q
         /VHg==
X-Gm-Message-State: AOAM530dB79M7pHYkPcBWlcIIkkSTAGjBvJduLaVczLcB14l+GSXvcj9
	v32p2QUUOcLSCrrCLSQtwva0ymBkdqb9t95m
X-Google-Smtp-Source: ABdhPJwAzrtQ/XSD0aiRdXXNj9+rjwak70p8EKQw8csDKjTendJBW1qFwjMQWBNarcr+RwBFFE4wMw==
X-Received: by 2002:a63:4b60:: with SMTP id k32mr2606300pgl.198.1628865091771;
        Fri, 13 Aug 2021 07:31:31 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id nl9sm2113182pjb.33.2021.08.13.07.31.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 07:31:31 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/17] libsolv: fix CVE-2021-3200
Date: Fri, 13 Aug 2021 04:29:46 -1000
Message-Id: <e8e06e4175c010a7dc0a4e3598b70b89d43f8475.1628863869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628863869.git.steve@sakoman.com>
References: <cover.1628863869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsolv/files/CVE-2021-3200.patch         | 67 +++++++++++++++++++
 .../libsolv/libsolv_0.7.10.bb                 |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-extended/libsolv/files/CVE-2021-3200.patch

diff --git a/meta/recipes-extended/libsolv/files/CVE-2021-3200.patch b/meta/recipes-extended/libsolv/files/CVE-2021-3200.patch
new file mode 100644
index 0000000000..74164ab495
--- /dev/null
+++ b/meta/recipes-extended/libsolv/files/CVE-2021-3200.patch
@@ -0,0 +1,67 @@
+From 0077ef29eb46d2e1df2f230fc95a1d9748d49dec Mon Sep 17 00:00:00 2001
+From: Michael Schroeder <mls@suse.de>
+Date: Mon, 14 Dec 2020 11:12:00 +0100
+Subject: [PATCH] testcase_read: error out if repos are added or the system is
+ changed too late
+
+We must not add new solvables after the considered map was created, the solver
+was created, or jobs were added. We may not changed the system after jobs have
+been added.
+
+(Jobs may point inside the whatproviedes array, so we must not invalidate this
+area.)
+
+Upstream-Status: Backport 
+https://github.com/openSUSE/libsolv/commit/0077ef29eb46d2e1df2f230fc95a1d9748d49dec
+CVE: CVE-2021-3200
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ ext/testcase.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/ext/testcase.c b/ext/testcase.c
+index 0be7a213..8fb6d793 100644
+--- a/ext/testcase.c
++++ b/ext/testcase.c
+@@ -1991,6 +1991,7 @@ testcase_read(Pool *pool, FILE *fp, const char *testcase, Queue *job, char **res
+   Id *genid = 0;
+   int ngenid = 0;
+   Queue autoinstq;
++  int oldjobsize = job ? job->count : 0;
+ 
+   if (resultp)
+     *resultp = 0;
+@@ -2065,6 +2066,21 @@ testcase_read(Pool *pool, FILE *fp, const char *testcase, Queue *job, char **res
+ 	  int prio, subprio;
+ 	  const char *rdata;
+ 
++	  if (pool->considered)
++	    {
++	      pool_error(pool, 0, "testcase_read: cannot add repos after packages were disabled");
++	      continue;
++	    }
++	  if (solv)
++	    {
++	      pool_error(pool, 0, "testcase_read: cannot add repos after the solver was created");
++	      continue;
++	    }
++	  if (job && job->count != oldjobsize)
++	    {
++	      pool_error(pool, 0, "testcase_read: cannot add repos after jobs have been created");
++	      continue;
++	    }
+ 	  prepared = 0;
+           if (!poolflagsreset)
+ 	    {
+@@ -2125,6 +2141,11 @@ testcase_read(Pool *pool, FILE *fp, const char *testcase, Queue *job, char **res
+ 	  int i;
+ 
+ 	  /* must set the disttype before the arch */
++	  if (job && job->count != oldjobsize)
++	    {
++	      pool_error(pool, 0, "testcase_read: cannot change the system after jobs have been created");
++	      continue;
++	    }
+ 	  prepared = 0;
+ 	  if (strcmp(pieces[2], "*") != 0)
+ 	    {
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.10.bb b/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
index 1cf5e2eb29..eadf04aa5a 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "expat zlib"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
+           file://CVE-2021-3200.patch \
 "
 
 SRCREV = "605dd2645ef899e2b7c95709476fb51e28d7e378"
-- 
2.25.1

