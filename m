Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CBCC25B07
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 05:54:47 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.3240.1660197279961718203
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 22:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D8uhUgKm;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id f30so15278487pfq.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 22:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ny92+QKnX8kITEt7bQsvUDz38Zb2J4+Fck7d/iDURtg=;
        b=D8uhUgKm7My2/T3I+d444fhhcbGN/98uHsbaM3k61mwlSa/jMnI/KKKUg4lBSusgnW
         z1aXvhfTqCNBMvNi5+TQtT+dNRhSFPNiNbrrptRfAMlUUb18bom2ChsTaJXeW5rDv2ng
         UGaHXTnkj20Zro0XRPJx+B8OJc4ytJK9Jr2IDZM4/MxWFc8JVqBFUpTZSGKXr++TJjeW
         iFEdQYbCjaFDOS6tmRkGN58aQxdIxq7pX7bOsqWuPJmAqpjHL3IK50jUa1cfcxS23xvh
         vbMOAuN+RA5p11a4C8A1+j4E7jjyd+PKrm4SnQRwhMBScC7iAwZM+lz7x85SSr8zVzFK
         K3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ny92+QKnX8kITEt7bQsvUDz38Zb2J4+Fck7d/iDURtg=;
        b=PzAP2I4FsbHmykBQ8rOQgLnpARuN3t7I+lYS8NBRPtaKL/qmQOUHrERN9w8pYJi+Nk
         j42yEDrpfL5s9NjaeqK89VYD8+ZVLcANLRKsdf+ugjTlCmoAd+miW7dzK4WMC5pdB0Wv
         Fts/fOdeBOmxIpW2g1qXgc8fQkYFkUEYLjs3JbUkwd/iupxglpN7sGWwlGI5toETitz9
         qVCTV0IuHKzST0OQ4Rxs7mO+tu+okFgwsgkzj4mfdNMlsg+3oh8UjUco0jcptvocw+Vj
         JSLoPQFi2uyS5FibMKLnEEJO2+vBLS4R9NDpZgRN7J+0T6G9qSjtkgtkwg8vEHOA5gso
         SZ0Q==
X-Gm-Message-State: ACgBeo2+z/gS7WjG6McnRqA8yzyaM1HeGCBIXT/GAew4Qs/8fbAdEa0N
	eHiL8kvm1/+zpAD/fkDu4xJTBTZ466k=
X-Google-Smtp-Source: 
 AA6agR45TOzn04nHZyS9Fu6WTOKPhnvBLBf4un0g8UGmGCcLvutsF9/Gtx5ehbTr9/ngKwu3rwqllg==
X-Received: by 2002:a63:180a:0:b0:41b:ff59:257c with SMTP id
 y10-20020a63180a000000b0041bff59257cmr26306728pgl.113.1660197278954;
        Wed, 10 Aug 2022 22:54:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 e11-20020a17090301cb00b0016db6bd77f4sm14290483plh.117.2022.08.10.22.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 22:54:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/5] unzip: Fix configure tests to use modern C
Date: Wed, 10 Aug 2022 22:54:31 -0700
Message-Id: <20220811055433.819522-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220811055433.819522-1-raj.khem@gmail.com>
References: <20220811055433.819522-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 05:54:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169229

Newer compilers end up with errors while compiling these test snippets
and build results in failures.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rrect-system-headers-and-prototypes-.patch | 112 ++++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/0001-configure-Add-correct-system-headers-and-prototypes-.patch

diff --git a/meta/recipes-extended/unzip/unzip/0001-configure-Add-correct-system-headers-and-prototypes-.patch b/meta/recipes-extended/unzip/unzip/0001-configure-Add-correct-system-headers-and-prototypes-.patch
new file mode 100644
index 00000000000..f7e0854cd9f
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
index f35856cf617..15235540890 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -31,6 +31,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
         file://CVE-2021-4217.patch \
         file://CVE-2022-0529.patch \
         file://CVE-2022-0530.patch \
+        file://0001-configure-Add-correct-system-headers-and-prototypes-.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.37.1


