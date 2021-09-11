Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.2655.1631329148767093038
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 19:59:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e8g+DdF6;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id d5so2616892pjx.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 19:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cgw2oYdARW4/tUf5AqpSyUWvZb5kTNPYijbYIDhc2Wk=;
        b=e8g+DdF6g7sU41bSqjA9DPhk8fajzyQc2Qz37gEE9QiWQ8jidZxZxh3EN96bEMciMH
         zTzurqTFUf8q+RRUxpyQHHDHXgDCmJNqTBFbx+Fsnt1knEfds15EUctVNAyLotsj0v1f
         Jzq6Ef6VhbJpADsQ7dqZ01Jh3JhSarZQ2yjQ9iLw+t78c403/jm2/laO6dM9ecYOqqzF
         sHslq/NaCeT5OXsd0WDutmziJtGMu7o1etb13/6iiq0dJohOT6HVAEdderqHFmiuVpl9
         KY4k5IRU4EZKMXj4u8IB7rG8/6klnUElUtz2Mf6QPSTCViHljzQBBTEg1NHdZJo4Otsd
         41Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cgw2oYdARW4/tUf5AqpSyUWvZb5kTNPYijbYIDhc2Wk=;
        b=64aZDVKDZ/cme4f9CFtO712WZIQkWM0a/X3SsIdG+oTe5JiksXWlT7+SW/ztJkXvtB
         VC5Ew8q9S60P6jGaJRJh52Y970DAPz54oXwpy3xAi2wuKD3UysvVup3pyVAYoINTX0P7
         Dl7bGfBcf5nHCWI8/ws412vWbAIDUU8zDvgPoEpowjd4SE7KuTNmeop12Z9oMnqx2Wuh
         TmhL+jjFqSw14TwxZbCEB7SKqi717luOyprceLasiS0PHZy9jIKZMs0FRQ3ibofcM+7x
         Lm035mlV/pIBxbsPwi/5WgW0ePR/j3CXYMyRuadJWrS7ItDRPafdxK4BhwgMycLeA73n
         IgJA==
X-Gm-Message-State: AOAM5310+ib3yVHgcUNnPOOxg9JLhf7BPxCKRQJ+dtsYNgcclXwN5v3R
	GWJWhu3LaE2N1DrpCXaUScropTGmRcs=
X-Google-Smtp-Source: ABdhPJyTsDic1yXmwORRM0FvdlFNiOvA6LqHvEsUdmDPqJ4v2BcmheQ8JZh9BSs60SwMlywdTyC4Qw==
X-Received: by 2002:a17:90b:1bc5:: with SMTP id oa5mr916909pjb.58.1631329147902;
        Fri, 10 Sep 2021 19:59:07 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:580b:61a2:a85:3f46])
        by smtp.gmail.com with ESMTPSA id m21sm231017pfa.216.2021.09.10.19.59.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 19:59:07 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [master][honister][hardknott][PATCH] apr: Security fix for CVE-2021-35940
Date: Fri, 10 Sep 2021 19:59:06 -0700
Message-Id: <20210911025906.1556070-1-akuster808@gmail.com>
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

