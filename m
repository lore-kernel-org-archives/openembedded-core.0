Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.4358.1612602258745517007
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 01:04:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iMJgSBTZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id q7so10394349wre.13
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 01:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Kr1lW7aRCOn6Oqr0vQ0GOgSXVMsk2TnZMShDhKoNpI=;
        b=iMJgSBTZmiKWjUxe5UednJ4JuODNE6i0p3n50hjF/0c1yuVEZQwyTPBwRVl01JjyyY
         fosS67hGzfVK0ZnlfE0OMOnvfuAy3mP0etG6CTwgl9f2FZFUxodO7ghE1Pt7yTY05XO4
         LKs7wMz1omOvORcthuehSHEYwqflUPJUCkXiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Kr1lW7aRCOn6Oqr0vQ0GOgSXVMsk2TnZMShDhKoNpI=;
        b=cniPaK2HgiZmr8279ZvPY2qRbnE0CN/kD4DR2auwPNtfvVLHllVcjogdEFaMbaFo/Z
         hMhu3AJEerPRXCnTlpp20SO2y87svZT0sri6fZRGcb5yVfdPKFFLpYFNfB5eWF6OiNI8
         XS2ER6A/vLIFfzoCWWLLvhP7DgXISDPv1d/mdfdchk3EqJ8raJAcELxzTRQgcXKzzXzv
         Slje0vYnQhTkfzJOOma99fGfrtzIR67eLjAR/kcS/qzGZ7+3LMYqw2fgaPn6UrP8bfr+
         /YD6yBxR8C8bs7is/JB6Eg1Y6uqkftgGXEOPPZpq5cEpJb0jAIN4lcoAqE9HRMT5P+mR
         1D8A==
X-Gm-Message-State: AOAM533181US7/V2wRA+/AKbuJ5fKd8MsuZwdyIKV8IUYpJ1W3U+HWUV
	q86kmF8sf/uJOp8+T11lYjjt9I+4gsqBEA==
X-Google-Smtp-Source: ABdhPJzd9PbJzYt9NgaINev1uHvRZ1TmXqe/G72tmFDgN3SqQ1Vhw4M6z3VQ3MjlpucHE3gwsECC2Q==
X-Received: by 2002:a5d:6a8d:: with SMTP id s13mr840073wru.9.1612602257260;
        Sat, 06 Feb 2021 01:04:17 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:be75:a088:9c76:71df])
        by smtp.gmail.com with ESMTPSA id o124sm11332678wmb.5.2021.02.06.01.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 01:04:16 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 03/10] apr: Fix to work with autoconf 2.70
Date: Sat,  6 Feb 2021 09:04:08 +0000
Message-Id: <20210206090415.1707868-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210206090415.1707868-1-richard.purdie@linuxfoundation.org>
References: <20210206090415.1707868-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix an issue with autoconf 2.70 where duplicate macro includes
caused configure failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-support/apr/apr/autoconf270.patch | 22 +++++++++++++++++++
 meta/recipes-support/apr/apr_1.7.0.bb         |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr/autoconf270.patch

diff --git a/meta/recipes-support/apr/apr/autoconf270.patch b/meta/recipes-support/apr/apr/autoconf270.patch
new file mode 100644
index 00000000000..9f7b5c624cf
--- /dev/null
+++ b/meta/recipes-support/apr/apr/autoconf270.patch
@@ -0,0 +1,22 @@
+With autoconf 2.70 confdefs.h is already included. Including it twice generates
+compiler warnings and since this macros is to error on warnings, it breaks.
+
+Fix by not including the file.
+
+Upstream-Status: Pending
+RP - 2021/1/28
+
+Index: apr-1.7.0/build/apr_common.m4
+===================================================================
+--- apr-1.7.0.orig/build/apr_common.m4
++++ apr-1.7.0/build/apr_common.m4
+@@ -505,8 +505,7 @@ AC_DEFUN([APR_TRY_COMPILE_NO_WARNING],
+  fi
+  AC_COMPILE_IFELSE(
+   [AC_LANG_SOURCE(
+-   [#include "confdefs.h"
+-   ]
++   []
+    [[$1]]
+    [int main(int argc, const char *const *argv) {]
+    [[$2]]
diff --git a/meta/recipes-support/apr/apr_1.7.0.bb b/meta/recipes-support/apr/apr_1.7.0.bb
index c9b9bf0f50b..f879e2864a7 100644
--- a/meta/recipes-support/apr/apr_1.7.0.bb
+++ b/meta/recipes-support/apr/apr_1.7.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch \
            file://libtoolize_check.patch \
            file://0001-Add-option-to-disable-timed-dependant-tests.patch \
+           file://autoconf270.patch \
            "
 
 SRC_URI[md5sum] = "7a14a83d664e87599ea25ff4432e48a7"
-- 
2.27.0

