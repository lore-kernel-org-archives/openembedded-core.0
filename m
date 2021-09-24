Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.8790.1632492959200078851
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=nirYmCz0;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id x191so3051155pgd.9
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+579FOr4IuQCySLx78w1FZj7rHici3nPHSLg9vcFqCE=;
        b=nirYmCz0E6kXKTW9k7LJofuPiPjKGnPFqGdvFt94mrPlrSKtlpratPT5HxXI6WXmN7
         J5o4a8T4x0HJMYYvMT8INFwvxBRPXczQ0OzxqycTuUYcrUtOTwEqGHje8yMojrxO4Wfq
         OjKqC4WBXZH+CjqiAg2wW+x/Q3v8FQKdqJUmWnZBxnOV/k4m2Zz092rBviPC8kRukBv6
         F6M0SLKcD0mMx59V4IuA33na9R+ZbNXwuEAvOiBp/Lu/pXeQDk0QsnrFAAiuIRvMrL3v
         T8TV4pvOLU0w7jf1foFDJnSJ86n7os5Suv3383O5jwfj8FVzuJxSz2XiKKW1xB7dAmhb
         9QOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+579FOr4IuQCySLx78w1FZj7rHici3nPHSLg9vcFqCE=;
        b=vOjRhYN7YDW9u9O5QeP1Jouhu9sIUFBWXmso9uXFcxwf4zYQw68+j3SpDuGBgTQqLT
         GJngrMFt3l0Hkf7gslN/bNjPlGGOJlXhJlWOehwAVkVyw6Ib5ly6O1UurD0js2I/igxH
         akUFsH6bpxQqTwaevFraziGagujBOXAAjFkdzuBUiJfLtTZ2ahV2Lm8g4jaSoeZZ8+xG
         4gIMhYD61Vr+AXtYdbym8XRiVGoOhNFe6o42SZT32DHVn6TqsOUlQ17ruZG0CRk+AVWg
         jSEKfv+BEze3eZa4hje2fkvarO/DoJw5f9AM7zVZ+zrRuY9CpSaNlbx56p/dB8J6XsDG
         nHBw==
X-Gm-Message-State: AOAM5334PzB0kcYrzSQXcZ3pjY/8GIvY2dmGzJMOpxC8sV5ayZmnsfX7
	jZR8o9H0tcQ4e31cWlXDIaA77usPCK3RR142NDU=
X-Google-Smtp-Source: ABdhPJzIV0y/X7nEZpduVXts7lEF2ceOaCBHCY5ZV1IV+CI6GKfqQrqdU464clhVHs/ZtmphucaFrQ==
X-Received: by 2002:a65:5a8e:: with SMTP id c14mr4062168pgt.125.1632492957866;
        Fri, 24 Sep 2021 07:15:57 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f144sm9200284pfa.24.2021.09.24.07.15.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:15:57 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/25] apr: Security fix for CVE-2021-35940
Date: Fri, 24 Sep 2021 04:15:06 -1000
Message-Id: <bbf9fe51abe5b89b8198a0d179a33bd75218e557.1632492565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632492565.git.steve@sakoman.com>
References: <cover.1632492565.git.steve@sakoman.com>
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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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

