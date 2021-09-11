Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web09.2796.1631329158857273315
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 19:59:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XBNcaVxa;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id 5so2337356plo.5
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 19:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cgw2oYdARW4/tUf5AqpSyUWvZb5kTNPYijbYIDhc2Wk=;
        b=XBNcaVxaNlz+XkB6MM6L0H2GbSZNVeR1/RQWvuxP9UAmslYRj8zzAkvGmtXkrW8jCN
         bf9O5RvXgKVFADVaG7EUjyX0/YV8sVEksfGKzrsCn/OC4YyykluYwY4d06CnVAQDFG+m
         a5VoiQxp2Mtr6J6I6OdTLSLKHRlV98P41h3WjkhYtG2ooVEa0aTk5xqM5/UuiZtph9Ed
         BQ0sWbJSamvOG8vU9/nT3wJ4ZIu0Bx4ZR1gtL/tCTaSAa7ygpd4aFxpbvPc7PTZ0e71j
         YJpK+TGjuolS3q9McS5hDQ8T2fyLMXk0q7oQNA2lAjZfipdRaJARZsdL+9mZl+61GRa2
         NiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cgw2oYdARW4/tUf5AqpSyUWvZb5kTNPYijbYIDhc2Wk=;
        b=wog79KUzDfmKJtCOqmIkI94NuY5IRGEiLxRgjKCIWFMR5Qhe4d5KM+FQQF5QA1QK+2
         5j8MD7Gys5h7tAPl8a4CETOmyzbHQgpR/T3LPF4jIJM2dpZ67vmwhvWk4EGwgSQ5AmXc
         m1Y7/bSBbD9bYZYDTevGG4GeUzjKmCKmpt17ctO3g/10d5xo2i6pjfMisvif9PvTOhKp
         vt4pLrvhCI6mN/4/IfD4XWRyO2xsVXSnOXwWeWD+tk+jIU6JeysVhDbYxGS4zj5igcaM
         hzpUs5WvG+j7ogtZTJhXVJJQlj/xwVPKOBl5CAzcSEue1VY1Gr+sbwAWzJKvcfp4J6HZ
         A8qg==
X-Gm-Message-State: AOAM530Fe2aVIOngB/82v5pThoQd1rcNvedQT8EzS+gX1aOXORzzcg/b
	22ua6Z7hQRlIqansDRSFe2B5iyzUQxQ=
X-Google-Smtp-Source: ABdhPJxfzXgmRN9CPLNb8xG2lC5jpnAnJTnoKk7QNbQir0JaM8YH7URTnHYCPbI2hRwAYjUarCsbag==
X-Received: by 2002:a17:90a:3ec7:: with SMTP id k65mr916875pjc.12.1631329158230;
        Fri, 10 Sep 2021 19:59:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:580b:61a2:a85:3f46])
        by smtp.gmail.com with ESMTPSA id gf9sm223635pjb.33.2021.09.10.19.59.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 19:59:18 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [master][honister][hardknott][PATCH] apr: Security fix for CVE-2021-35940
Date: Fri, 10 Sep 2021 19:59:17 -0700
Message-Id: <20210911025917.1556143-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An out-of-bounds array read in the apr_time_exp*() functions was fixed in the
Apache Portable Runtime 1.6.3 release (CVE-2017-12613). The fix for this issue
was not carried forward to the APR 1.7.x branch, and hence version 1.7.0 regressed
compared to 1.6.3 and is vulnerable to the same issue.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
index 82317396cd..b70edfaf42 100644
--- a/meta/recipes-support/apr/apr_1.7.0.bb
+++ b/meta/recipes-support/apr/apr_1.7.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://libtoolize_check.patch \
            file://0001-Add-option-to-disable-timed-dependant-tests.patch \
            file://autoconf270.patch \
+           file://CVE-2021-35940.patch \
            "
 
 SRC_URI[md5sum] = "7a14a83d664e87599ea25ff4432e48a7"
-- 
2.25.1

