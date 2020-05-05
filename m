Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web12.1498.1588648872638826270
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=k5nqPKqt;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.65, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f65.google.com with SMTP id h12so632921pjz.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+1useCoCjDzShssM6lo8qTTqhhM0S8hIjP0id5cbIWs=;
        b=k5nqPKqtfTLidrk0cTE3aImu+MtuJ3Sx0HWLuD8Z2qxa2jjlOTjfGaYCk+djksiGMU
         J/pndcaLnDp5Qcm1BPkzsdz7FybWFxmgNneT1k692vKbGAnKS4db/NG/OYPt4+nx+A4A
         CpfTKY7VgiUOmQEc38rMkZxpcEc+0T9p0D6C200JROSQkSJ9/VrUSwuBNapX8BulhNDW
         iMro4idcXok5UuSmVIUKEBk6LnqHnHKzgD1AemNeB/o4feOmDh/NVSkhszFVUyCBxZ/j
         9olw0AYOKEjiw6AmsZPAsYrE5MS7mNYIdk1uSUvR3CPBcSF2tEmiVPkDvzOsKEvj9ZX9
         wgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+1useCoCjDzShssM6lo8qTTqhhM0S8hIjP0id5cbIWs=;
        b=kn1Q6ER0HTFh1ZHLbUPOkpuWIk7UQDZ1rFza9E83MDrptxFkcePnRGstmk4dblhrXn
         m/Qqn9RmiqdSKYlGyc+GjY4113LQPw1Ov9vIAvo8P4vvcouHzD+W6FOWncH/aL3E9Vk2
         bt+Cc9vFzwRYT5DZtfLnxCpL+l0kmZ3cAys4FdOzEO9aBRV0Z8gZrXP8f0jlodUcWj3o
         udLTsR8mvk8lJhpCRseCkTVyBEkC7UCpHFrDcwrFo1LHhXG3OitklUdIe4FszIwNjyoU
         pEEUQ0nY/tXy2kJraqd07PwMKWrLrPVGEUJ8ljfHiXlQaimL35cprH+S/LvGX6hwS7gd
         5ePg==
X-Gm-Message-State: AGi0PuYUPXwYrYKEWbzAoLT+yGAuRa5Zhbdt/U/2e1JfLJA5w8bg/gkc
	8GNQG3FoTSmC1OHSJqEWQIJOM9bJj8qgMA==
X-Google-Smtp-Source: APiQypI2dxFyGdaG+7i9KWVy6Yu3fRTWofHnU/8JFpsabiPSniqxCeYtQbbFOTdr2m4RuMajqr+N+Q==
X-Received: by 2002:a17:90a:3266:: with SMTP id k93mr437451pjb.118.1588648871538;
        Mon, 04 May 2020 20:21:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.21.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:21:11 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 24/28] pseudo: add macro guard for seccomp
Date: Mon,  4 May 2020 17:19:19 -1000
Message-Id: <9fff03afb8e67b360042e80fda8213a67472b9ec.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

It fails to compile pseudo-native on centos 7:

| ports/linux/pseudo_wrappers.c: In function ‘prctl’:
| ports/linux/pseudo_wrappers.c:129:14: error: ‘SECCOMP_SET_MODE_FILTER’ undeclared (first use in this function)
|    if (cmd == SECCOMP_SET_MODE_FILTER) {
|               ^

Add macro guard for the definition to avoid the failure.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/files/seccomp.patch | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/files/seccomp.patch b/meta/recipes-devtools/pseudo/files/seccomp.patch
index be42eaf353..283f997941 100644
--- a/meta/recipes-devtools/pseudo/files/seccomp.patch
+++ b/meta/recipes-devtools/pseudo/files/seccomp.patch
@@ -7,6 +7,17 @@ Upstream-Status: Pending
 RP 2020/4/3
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
+It fails to compile pseudo-native on centos 7:
+
+| ports/linux/pseudo_wrappers.c: In function ‘prctl’:
+| ports/linux/pseudo_wrappers.c:129:14: error: ‘SECCOMP_SET_MODE_FILTER’ undeclared (first use in this function)
+|    if (cmd == SECCOMP_SET_MODE_FILTER) {
+|               ^
+
+Add macro guard for seccomp to avoid the failure.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
 Index: git/ports/linux/pseudo_wrappers.c
 ===================================================================
 --- git.orig/ports/linux/pseudo_wrappers.c
@@ -40,7 +51,7 @@ Index: git/ports/linux/pseudo_wrappers.c
  	/* gcc magic to attempt to just pass these args to syscall. we have to
  	 * guess about the number of args; the docs discuss calling conventions
  	 * up to 7, so let's try that?
-@@ -92,3 +108,42 @@ static long wrap_syscall(long nr, va_lis
+@@ -92,3 +108,44 @@ static long wrap_syscall(long nr, va_lis
  	(void) ap;
  	return -1;
  }
@@ -56,6 +67,7 @@ Index: git/ports/linux/pseudo_wrappers.c
 +		return rc;
 +	}
 +
++#ifdef SECCOMP_SET_MODE_FILTER
 +	/* pseudo and seccomp are incompatible as pseudo uses different syscalls
 +	 * so pretend to enable seccomp but really do nothing */
 +	if (option == PR_SET_SECCOMP) {
@@ -67,6 +79,7 @@ Index: git/ports/linux/pseudo_wrappers.c
 +		    return 0;
 +		}
 +	}
++#endif
 +
 +	/* gcc magic to attempt to just pass these args to prctl. we have to
 +	 * guess about the number of args; the docs discuss calling conventions
-- 
2.17.1

