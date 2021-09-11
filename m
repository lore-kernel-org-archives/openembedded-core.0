Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.2665.1631329203939697464
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 20:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FdHyy9qo;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id u18so3620110pgf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 20:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u5wdbvUHwP180V64h5gsSlt8+iSeWaxGmkEnAWQPHik=;
        b=FdHyy9qoZuIdVSZ/BhQcwerTZ8Pd7i0s+ZrMZU6UrHHYWUkF4vaXzy+51VH5kftws8
         2uKATYVDaZjijVTrrKabieOYegq1GJf1Jn6YnfT4YnuolfSt2qZ3ka+axEVnlZ3jDvfb
         3hxkPWj9wIDizUdJ/wt+BNcXRPSAHPS1BynNShK+zrFKWEYBeaYDOIvBjB/L0B/+I9cJ
         q1u+zqs9nkQue9uuW2NoJ1raVJRSk6misR21/UgzQE10sqZhXnvOW6BxByJTpaYmVQZp
         gu5Vf263EDRGvgHB3g/fErTiee+S54s0Pnt0ekfP8Jz5l8/iRz0C0Hd/GPnuBKRv4lOF
         hpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u5wdbvUHwP180V64h5gsSlt8+iSeWaxGmkEnAWQPHik=;
        b=1V9wPSDt2sWvoWOmXvpeR6r7tc49ALtZE87XiD7SWp4RejY6wW2sUjvd07J/dSIL03
         Yl3f9jymYaelsS3MoqoUMZjc89vwd604Sr0hRrrooZNHT90jFEKH/7AR1DpHtLi/ilxi
         q6o8+VTnoDWIv/6CbthdHyrYRU8qVIgYyZZfrceSlqB1MWJKRkORSOzNKCt+AMin2bCy
         a09iGzYmD8umYliYeKXFZESxn7JeV+31z5kaEjr1lCLqLgJwfT8sQuQ8SSbTySkJyQPj
         0KSQKl64+CmSyO3ErOGEO3VDMx+5FSOC2GO+WVG4Xqt9ZPzth/qFgZ1IO6NZJSpaYTW4
         eMZQ==
X-Gm-Message-State: AOAM530ZSRlby32+H+HnfhNUZlrf0GuV/lw7vdSbS+HpiW67M4rYR2FN
	/WgH3Ep/Aw34TG+1jqlkA/k9lr1Uw5Y=
X-Google-Smtp-Source: ABdhPJxP5mPuYXNgsamTwLjdAvq3XwV2mQeeV1lLTwJtc/dfXkD3sFswX0B2oWOUEig0epQripQMYw==
X-Received: by 2002:a05:6a00:2352:b0:40b:2031:4827 with SMTP id j18-20020a056a00235200b0040b20314827mr855587pfj.6.1631329203221;
        Fri, 10 Sep 2021 20:00:03 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:580b:61a2:a85:3f46])
        by smtp.gmail.com with ESMTPSA id z131sm227902pfc.159.2021.09.10.20.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 20:00:02 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [dunfell][PATCH] apr: Security fix for CVE-2021-35940
Date: Fri, 10 Sep 2021 20:00:01 -0700
Message-Id: <20210911030001.1556295-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source:  https://dist.apache.org
MR: 112793
Type: Security Fix
Disposition: Backport from https://dist.apache.org/repos/dist/release/apr/patches/apr-1.7.0-CVE-2021-35940.patch
ChangeID: c8247210204ffcc7d1425e3d60f077ad3dd54ebc
Description:

An out-of-bounds array read in the apr_time_exp*() functions was fixed in the
Apache Portable Runtime 1.6.3 release (CVE-2017-12613). The fix for this issue
was not carried forward to the APR 1.7.x branch, and hence version 1.7.0 regressed
compared to 1.6.3 and is vulnerable to the same issue.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../apr/apr/CVE-2021-35940.patch              | 58 +++++++++++++++++++
 meta/recipes-support/apr/apr_1.7.0.bb         |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr/CVE-2021-35940.patch

diff --git a/meta/recipes-support/apr/apr/CVE-2021-35940.patch b/meta/recipes-support/apr/apr/CVE-2021-35940.patch
new file mode 100644
index 0000000000..00befdacee
--- /dev/null
+++ b/meta/recipes-support/apr/apr/CVE-2021-35940.patch
@@ -0,0 +1,58 @@
+
+SECURITY: CVE-2021-35940 (cve.mitre.org)
+
+Restore fix for CVE-2017-12613 which was missing in 1.7.x branch, though
+was addressed in 1.6.x in 1.6.3 and later via r1807976.
+
+The fix was merged back to 1.7.x in r1891198.
+
+Since this was a regression in 1.7.0, a new CVE name has been assigned
+to track this, CVE-2021-35940.
+
+Thanks to Iveta Cesalova <icesalov redhat.com> for reporting this issue.
+
+https://svn.apache.org/viewvc?view=revision&revision=1891198
+
+Upstream-Status: Backport
+CVE: CVE-2021-35940
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+
+Index: time/unix/time.c
+===================================================================
+--- a/time/unix/time.c	(revision 1891197)
++++ b/time/unix/time.c	(revision 1891198)
+@@ -142,6 +142,9 @@
+     static const int dayoffset[12] =
+     {306, 337, 0, 31, 61, 92, 122, 153, 184, 214, 245, 275};
+ 
++    if (xt->tm_mon < 0 || xt->tm_mon >= 12)
++        return APR_EBADDATE;
++
+     /* shift new year to 1st March in order to make leap year calc easy */
+ 
+     if (xt->tm_mon < 2)
+Index: time/win32/time.c
+===================================================================
+--- a/time/win32/time.c	(revision 1891197)
++++ b/time/win32/time.c	(revision 1891198)
+@@ -54,6 +54,9 @@
+     static const int dayoffset[12] =
+     {0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334};
+ 
++    if (tm->wMonth < 1 || tm->wMonth > 12)
++        return APR_EBADDATE;
++
+     /* Note; the caller is responsible for filling in detailed tm_usec,
+      * tm_gmtoff and tm_isdst data when applicable.
+      */
+@@ -228,6 +231,9 @@
+     static const int dayoffset[12] =
+     {306, 337, 0, 31, 61, 92, 122, 153, 184, 214, 245, 275};
+ 
++    if (xt->tm_mon < 0 || xt->tm_mon >= 12)
++        return APR_EBADDATE;
++
+     /* shift new year to 1st March in order to make leap year calc easy */
+ 
+     if (xt->tm_mon < 2)
diff --git a/meta/recipes-support/apr/apr_1.7.0.bb b/meta/recipes-support/apr/apr_1.7.0.bb
index 432fa3255c..92cc61a864 100644
--- a/meta/recipes-support/apr/apr_1.7.0.bb
+++ b/meta/recipes-support/apr/apr_1.7.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch \
            file://libtoolize_check.patch \
            file://0001-Add-option-to-disable-timed-dependant-tests.patch \
+           file://CVE-2021-35940.patch \
            "
 
 SRC_URI[md5sum] = "7a14a83d664e87599ea25ff4432e48a7"
-- 
2.25.1

