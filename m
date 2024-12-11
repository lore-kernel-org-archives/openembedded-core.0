Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9C0E77183
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 14:47:55 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.12663.1733928472741270078
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 06:47:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=azouvueM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-723f37dd76cso6072354b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 06:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733928472; x=1734533272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xPmtiSQLs3xBqEHyRTw+QGs5Qegq0wRzY2CllMc1TY=;
        b=azouvueMI9LouO7A3tdnHg9mU/q9MBcekESSh4vTmJSfMTADWundKBplW2Ajqr2fht
         hUpD7g3w8VzGldBPTQzW9YOJJDeTigrNagtKtgTtB2bGrEFDpthmsUmmRLW5/sxWWItd
         IveYwG+7wIiyniS+h84ViM236MgaqxiP/Z6xfbNOSg4FW06Iso7+56bzkyZF9Y6RECO2
         srmspx+oFSoHdBp+zLuNedKkThIereDKnVCFpcMVSwjPjMVIDYjbJz1euIL3c/NOmmVg
         EXfpSthMFbeBswsFGyKfk4WKuTSvBtCMntkHykVpy85F5SEB7BC+wGPz7QMSEFsz+8x+
         QyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733928472; x=1734533272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xPmtiSQLs3xBqEHyRTw+QGs5Qegq0wRzY2CllMc1TY=;
        b=NrvpZ4JpFf2g6w34Uk6xRMKHMjxNsApeDTgVR+DlfP/UWMqtV/tr3WMK6Auv+F7YWF
         jR737EyOphxt1pHUWSVaXzczDjgJ7v+P1/bvp/9D3JNQtACzBmw0MrZT9bKhpb1C5Zd7
         rzq3XcYjoNCVYCihY5PEjxjGs+Tfle8Cqsv8wLGTUxGoeztEQovOmrPE3c38csgwxqBQ
         cauNuhpIaeBnHszSB4RNSqDW7DukD+3L+TD11PcsNyQlzsNZh0ldUkEeA5H2MS+C1RVG
         hQmHqPsH3lj7Du1NI8ULEr2YEk7HKy7t1rnQ/91AgMJuLx3YmK7mCHg6fPDGt8bOeOUA
         Jubg==
X-Gm-Message-State: AOJu0YwihVC4PgMjBaXOcN8x2laYMMY5MZW6VW+hwkWkHq9yr/gQeXkE
	N28U4JYVCQlO5GIPkwUuKeJwrI4VzB+Q9AvCBJNl086l8sG10eIi8bxxlOsSF6AZ1egVDEic4ZQ
	d
X-Gm-Gg: ASbGncvAsf4fJkQ+2VbYkbheQ4fsDr0IFokS9cObtr8ckv5j8eiaj6ULiFlywP1a3Y1
	6uCZdyCkbTi5iaVi5awCOHyiHp/NhkfqxeNDXdrHjRf0tJkXaNHhVGiNqnEVZWWhZaOxosmd19A
	uiI705UmoFd//gsZAMYbZA8DUf58appfYD+wi69yi2vOnqulVRW/9O2LDdggt+ADFcvJKR8kgjF
	UnP+3Bnl32oRvDv98bCNRuWv0OWPVyhOLw1kBysN9w=
X-Google-Smtp-Source: AGHT+IHpqF6mvIgXg1yjfhGUrCHV2zcMnkNoXAMQitGLBpV1uT2xldHWCpxuFEg/IcKXPQYG6/evrw==
X-Received: by 2002:a05:6a20:72a4:b0:1e1:a434:2959 with SMTP id adf61e73a8af0-1e1c126dcbamr5562192637.6.1733928471940;
        Wed, 11 Dec 2024 06:47:51 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd3891dc95sm7494377a12.42.2024.12.11.06.47.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 06:47:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/7] unzip: Fix configure tests to use modern C
Date: Wed, 11 Dec 2024 06:47:36 -0800
Message-Id: <61bd7eccd8e305e2dd95f0b0b86b09d72e99fc1a.1733928291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733928291.git.steve@sakoman.com>
References: <cover.1733928291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 14:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208591

From: Khem Raj <raj.khem@gmail.com>

Newer compilers end up with errors while compiling these test snippets
and build results in failures.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...rrect-system-headers-and-prototypes-.patch | 112 ++++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/0001-configure-Add-correct-system-headers-and-prototypes-.patch

diff --git a/meta/recipes-extended/unzip/unzip/0001-configure-Add-correct-system-headers-and-prototypes-.patch b/meta/recipes-extended/unzip/unzip/0001-configure-Add-correct-system-headers-and-prototypes-.patch
new file mode 100644
index 0000000000..f7e0854cd9
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/0001-configure-Add-correct-system-headers-and-prototypes-.patch
@@ -0,0 +1,112 @@
+From 5ac5885d35257888d0e4a9dda903405314f9fc84 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 10 Aug 2022 17:53:13 -0700
+Subject: [PATCH] configure: Add correct system headers and prototypes to tests
+
+Newer compilers e.g. clang-15+ have turned stricter towards these
+warnings and turned them into errors which results in subtle failures
+during build, therefore make the testcases use the needed headers and
+modern C
+
+Upstream-Status: Inactive-Upstream
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ unix/configure | 51 +++++++++++++++++++++++++++++++++++++++-----------
+ 1 file changed, 40 insertions(+), 11 deletions(-)
+
+diff --git a/unix/configure b/unix/configure
+index 49579f3..8fd82dd 100755
+--- a/unix/configure
++++ b/unix/configure
+@@ -379,14 +379,37 @@ $CC $CFLAGS -c conftest.c >/dev/null 2>/dev/null
+ 
+ # Check for missing functions
+ # add NO_'function_name' to flags if missing
+-for func in fchmod fchown lchown nl_langinfo
+-do
+-  echo Check for $func
+-  echo "int main(){ $func(); return 0; }" > conftest.c
+-  $CC $BFLAG $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
+-  [ $? -ne 0 ] && CFLAGSR="${CFLAGSR} -DNO_`echo $func | tr '[a-z]' '[A-Z]'`"
+-done
++echo Check for fchmod
++cat > conftest.c << _EOF_
++#include <sys/stat.h>
++int main(){ fchmod(0,0); return 0; }
++_EOF_
++$CC $BFLAG $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
++[ $? -ne 0 ] && CFLAGSR="${CFLAGSR} -DNO_FCHMOD"
+ 
++echo Check for fchown
++cat > conftest.c << _EOF_
++#include <unistd.h>
++int main(){ fchown(0,0,0); return 0; }
++_EOF_
++$CC $BFLAG $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
++[ $? -ne 0 ] && CFLAGSR="${CFLAGSR} -DNO_FCHOWN"
++
++echo Check for lchown
++cat > conftest.c << _EOF_
++#include <unistd.h>
++int main(){ lchown(NULL,0,0); return 0; }
++_EOF_
++$CC $BFLAG $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
++[ $? -ne 0 ] && CFLAGSR="${CFLAGSR} -DNO_LCHOWN"
++
++echo Check for nl_langinfo
++cat > conftest.c << _EOF_
++#include <langinfo.h>
++int main(){ nl_langinfo(0); return 0; }
++_EOF_
++$CC $BFLAG $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
++[ $? -ne 0 ] && CFLAGSR="${CFLAGSR} -DNO_NL_LANGINFO"
+ # Check (seriously) for a working lchmod.
+ echo 'Check for lchmod'
+ temp_file="/tmp/unzip_test_$$"
+@@ -401,14 +424,17 @@ ln -s "${temp_link}" "${temp_file}" && \
+ rm -f "${temp_file}"
+ 
+ echo Check for memset
+-echo "int main(){ char k; memset(&k,0,0); return 0; }" > conftest.c
++cat > conftest.c << _EOF_
++#include <string.h>
++int main(){ char k; memset(&k,0,0); return 0; }
++_EOF_
+ $CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
+ [ $? -ne 0 ] && CFLAGSR="${CFLAGSR} -DZMEM"
+ 
+ echo Check for errno declaration
+ cat > conftest.c << _EOF_
+ #include <errno.h>
+-main()
++int main()
+ {
+   errno = 0;
+   return 0;
+@@ -419,6 +445,8 @@ $CC $CFLAGS -c conftest.c >/dev/null 2>/dev/null
+ 
+ echo Check for directory libraries
+ cat > conftest.c << _EOF_
++#include <sys/types.h>
++#include <dirent.h>
+ int main() { return closedir(opendir(".")); }
+ _EOF_
+ 
+@@ -523,10 +551,11 @@ fi
+ # needed for AIX (and others ?) when mmap is used
+ echo Check for valloc
+ cat > conftest.c << _EOF_
+-main()
++#include <stdlib.h>
++int main()
+ {
+ #ifdef MMAP
+-    valloc();
++    valloc(0);
+ #endif
+ }
+ _EOF_
+-- 
+2.37.1
+
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index cf532c09d6..0f73cfaa22 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -32,6 +32,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
         file://CVE-2022-0529.patch \
         file://CVE-2022-0530.patch \
         file://0001-unix-configure-fix-detection-for-cross-compilation.patch \
+        file://0001-configure-Add-correct-system-headers-and-prototypes-.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.34.1


