Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web08.7909.1611915867094530741
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 02:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OPrElQ5J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f43.google.com with SMTP id w1so12170819ejf.11
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 02:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Iig5JnrhYZYFJ5zGIolnTMWe2TSRw/XrE33wxIW4DA4=;
        b=OPrElQ5Jk/3m2Y3eK+nqN94we/sxauwOA6JbemZBHMQXEiUp9wMetjZ6yunaWheUBU
         DGdqFE5itGr7NLHIpyskLtnmpZa4KN8bjJn+1rncNy8Gz9JCPuRzmw2Z9V+jaieBWqPA
         //HOLSFOOQDz2EW2svCa/hEx1556SOp90eTxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Iig5JnrhYZYFJ5zGIolnTMWe2TSRw/XrE33wxIW4DA4=;
        b=CnTZobhnxOV8M4NHANOvIQV/1RKSGO+yey/WkJxZw0f9d4yKmJenhrlU9eh2JfSqFl
         +B4fuYb3SPqC6Oz5wakVm3s6Fay5EfSwrKUaN43LaAc7DAlmdXETj9v5osZJrqTCb+bE
         pGGYFPx4zUGYfo0elO4zuuU8NsfxsIggfGqfiioCVvcWCnvWHWD7fJd2LEf7VlWS65qY
         Oq4aZZixexXiOfFnrb2CTUGxvdA3sRVJYwVpIHRhhtj2JfoAH0iNKrmlbXd+XoujXmSV
         rHrLu/6J4hSphZult/r4CKwHWJUOsZD1YiglDCmeEzmu1l/B/Io2g85zjOuZYU/eVOTP
         nF5Q==
X-Gm-Message-State: AOAM532J9Llca8Bf0hOx8MD9FvMT3kD9BFqHBnYC5VrydDtH7bDBkBek
	bMNHEWkSk0CXLtWS6ubEv3fBVfyheJykbQ==
X-Google-Smtp-Source: ABdhPJxYysKaP3YwkTDoeE3QSSrhlN763ottUb5xbbqENWaXQdyGf9f6uVtZ/sXycecqYRvZUTr/vQ==
X-Received: by 2002:a17:906:c1d9:: with SMTP id bw25mr3787004ejb.452.1611915865601;
        Fri, 29 Jan 2021 02:24:25 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:93ef:509c:4f16:14ff])
        by smtp.gmail.com with ESMTPSA id k22sm3554574eji.101.2021.01.29.02.24.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 02:24:24 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/13] apr: Fix to work with autoconf 2.70
Date: Fri, 29 Jan 2021 10:24:15 +0000
Message-Id: <20210129102419.1360572-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
References: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix an issue with autoconf 2.70 where duplicate macro includes
caused configure failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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

