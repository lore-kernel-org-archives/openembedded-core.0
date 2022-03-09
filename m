Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E0BC433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 20:26:12 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.1581.1646857571071188887
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 12:26:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KYDrXNYp;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id v4so3364315pjh.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 12:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=umjOD7gf3Nq9F367A/+Eh0VjYEacS7cMl/Y2cokrI54=;
        b=KYDrXNYpqV3imkVnmY7IM8OFhagWaVF5gSWVtnxfl8uQkdEfF95c0fK9RRYJyvrV4I
         62fo07V6Sau1h6xDGO/xxfzx7dHwizHLhexwQSpKzExkwid/IQb7QKl7Wn/xAgwNQ+yf
         2afTOMFZS2T5yuZepBmI5JmdxvX9tREb7lvQ43v+louONmUICY+tIb5jDAmc5AKVmxbM
         rvOxv2x6GghbAPTOsAyU5o8K6fcih8CW7DAGDrw+MxDY6aEZ4AdLlilHotuCAnJAiv3v
         GUVJurtc4THch1NzhxJFNhFpnUTi3N4VzDfG78yJJZHdinPqwQzPW790o/bN67t5XZTz
         w6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=umjOD7gf3Nq9F367A/+Eh0VjYEacS7cMl/Y2cokrI54=;
        b=R/5a6UT3DuJ2LHbaNYtmZ48pamY9eUmT5k8ugdu6o193koJ/g5/U8cv58JLLutrbZ/
         jafqpazbJ0u3Jr8DT3iNUWA631W0zvw5z1JLYyja9ckzAtmP3d53yqcYubltp0CU8WAi
         us5SNmrC0bq5HBcV1uE9mRFzMYvJqdknkoRUnIBTX/EInMILkwNrsuL3Y93wkfh710MI
         1rszCldF3FD44bgOW4eGzEKeIhCGVwtej7rgrFhgxIAhx6c0SrgMzxHdh2XEbVU2ygDD
         TBv8GmgDY6bxSUjkPOP5Iw/ulQbUiJ19e6GbgKf2QOEEgW6EwLzfE7QegxtxHdc/vg/6
         hjCw==
X-Gm-Message-State: AOAM533VV1kIv0/cl8Q9gtTykWJgWpBLP1IFleA+OKS2+tvW43m74EJt
	amALq5N4EFDzh5ZOne2yLM6aTUS/08oe9A==
X-Google-Smtp-Source: 
 ABdhPJyxMnPEAf+TFPZqVl2a1pJnhuvT0Vt5GTfPOtyoyXPsogNDNKbZhPvfUlBSZkQJM0+DJ7SXRg==
X-Received: by 2002:a17:902:b208:b0:14f:14e8:1e49 with SMTP id
 t8-20020a170902b20800b0014f14e81e49mr1458733plr.35.1646857569145;
        Wed, 09 Mar 2022 12:26:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm3936591pfa.77.2022.03.09.12.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 12:26:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] unzip: Pass LDFLAGS to configure tests
Date: Wed,  9 Mar 2022 12:26:05 -0800
Message-Id: <20220309202605.3041569-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 20:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162990

Ensures the configure time tests are compiled/linked with the Options
that it will be using to build.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ass-LDFLAGS-to-tests-doing-link-step.patch | 137 ++++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |   1 +
 2 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/0001-configure-Pass-LDFLAGS-to-tests-doing-link-step.patch

diff --git a/meta/recipes-extended/unzip/unzip/0001-configure-Pass-LDFLAGS-to-tests-doing-link-step.patch b/meta/recipes-extended/unzip/unzip/0001-configure-Pass-LDFLAGS-to-tests-doing-link-step.patch
new file mode 100644
index 00000000000..716766de294
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/0001-configure-Pass-LDFLAGS-to-tests-doing-link-step.patch
@@ -0,0 +1,137 @@
+From da29ba6a27d8e78562052c79061476848915eb2a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 Mar 2022 12:13:28 -0800
+Subject: [PATCH] configure: Pass LDFLAGS to tests doing link step
+
+Ensures that right flags from recipes are honored, otherwise tests fail
+which otherwise should not.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ unix/configure | 28 ++++++++++++++--------------
+ 1 file changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/unix/configure b/unix/configure
+index d4b0a8e..49579f3 100755
+--- a/unix/configure
++++ b/unix/configure
+@@ -116,7 +116,7 @@ _EOF_
+ 	# Special Mac OS X shared library "ld" option?
+         if test ` uname -s 2> /dev/null ` = 'Darwin'; then
+           lf='-Wl,-search_paths_first'
+-          $CC $CFLAGS $lf conftest.c > /dev/null 2>/dev/null
++          $CC $CFLAGS $LDFLAGS $lf conftest.c > /dev/null 2>/dev/null
+           if test $? -eq 0; then
+             BZLF=${lf}
+           fi
+@@ -276,7 +276,7 @@ int main()
+ }
+ _EOF_
+ # compile it
+-$CC -o conftest conftest.c >/dev/null 2>/dev/null
++$CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
+ if [ $? -ne 0 ]; then
+   echo -- no Large File Support
+ else
+@@ -322,7 +322,7 @@ int main()
+ }
+ _EOF_
+ # compile it
+-$CC -o conftest conftest.c >/dev/null 2>/dev/null
++$CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
+ if [ $? -ne 0 ]; then
+   echo "-- no Unicode (wchar_t) support"
+ else
+@@ -383,7 +383,7 @@ for func in fchmod fchown lchown nl_langinfo
+ do
+   echo Check for $func
+   echo "int main(){ $func(); return 0; }" > conftest.c
+-  $CC $BFLAG -o conftest conftest.c >/dev/null 2>/dev/null
++  $CC $BFLAG $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
+   [ $? -ne 0 ] && CFLAGSR="${CFLAGSR} -DNO_`echo $func | tr '[a-z]' '[A-Z]'`"
+ done
+ 
+@@ -395,14 +395,14 @@ temp_link="link_$$"
+   echo "int main() { lchmod(\"${temp_file}\", 0666); }" \
+ ) > conftest.c
+ ln -s "${temp_link}" "${temp_file}" && \
+- $CC $BFLAG -o conftest conftest.c >/dev/null 2>/dev/null && \
++ $CC $BFLAG $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null && \
+  ./conftest
+ [ $? -ne 0 ] && CFLAGSR="${CFLAGSR} -DNO_LCHMOD"
+ rm -f "${temp_file}"
+ 
+ echo Check for memset
+ echo "int main(){ char k; memset(&k,0,0); return 0; }" > conftest.c
+-$CC -o conftest conftest.c >/dev/null 2>/dev/null
++$CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
+ [ $? -ne 0 ] && CFLAGSR="${CFLAGSR} -DZMEM"
+ 
+ echo Check for errno declaration
+@@ -422,12 +422,12 @@ cat > conftest.c << _EOF_
+ int main() { return closedir(opendir(".")); }
+ _EOF_
+ 
+-$CC -o conftest conftest.c >/dev/null 2>/dev/null
++$CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
+ if [ $? -ne 0 ]; then
+   OPT=""
+   for lib in ndir dir ucb bsd BSD PW x dirent
+   do
+-    $CC -o conftest conftest.c -l$lib >/dev/null 2>/dev/null
++    $CC $CLFAGS $LDFLAGS -o conftest conftest.c -l$lib >/dev/null 2>/dev/null
+     [ $? -eq 0 ] && OPT=-l$lib && break
+   done
+   if [ ${OPT} ]; then
+@@ -440,9 +440,9 @@ fi
+ # Dynix/ptx 1.3 needed this
+ echo Check for readlink
+ echo "int main(){ return readlink(); }" > conftest.c
+-$CC -o conftest conftest.c >/dev/null 2>/dev/null
++$CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
+ if [ $? -ne 0 ]; then
+-  $CC -o conftest conftest.c -lseq >/dev/null 2>/dev/null
++  $CC $CFLAGS $LDFLAGS -o conftest conftest.c -lseq >/dev/null 2>/dev/null
+   [ $? -eq 0 ] && LFLAGS2="${LFLAGS2} -lseq"
+ fi
+ 
+@@ -501,7 +501,7 @@ int main()
+ }
+ _EOF_
+ # compile it
+-$CC ${CFLAGS} ${CFLAGSR} -o conftest conftest.c >/dev/null 2>/dev/null
++$CC ${CFLAGS} ${CFLAGSR} $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
+ if [ $? -ne 0 ]; then
+   echo "-- no MBCS support"
+   CFLAGSR="${CFLAGSR} -DNO_MBCS"
+@@ -515,7 +515,7 @@ else
+   do
+     echo Check for MBCS $func
+     echo "int main() { $func(); return 0; }" > conftest.c
+-    $CC $BFLAG -o conftest conftest.c >/dev/null 2>/dev/null
++    $CC $BFLAG $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
+     [ $? -eq 0 ] && CFLAGSR="${CFLAGSR} -D`echo $func | tr '[a-z]' '[A-Z]'`=$func"
+   done
+ fi
+@@ -557,7 +557,7 @@ elif [ -f /xenix ]; then
+ elif uname -X >/dev/null 2>/dev/null; then
+ # SCO shared library check
+   echo "int main() { return 0;}" > conftest.c
+-  $CC -o conftest conftest.c -lc_s -nointl >/dev/null 2> /dev/null
++  $CC $CFLAGS $LDFLAGS -o conftest conftest.c -lc_s -nointl >/dev/null 2> /dev/null
+   [ $? -eq 0 ] && LFLAGS2="-lc_s -nointl"
+ else
+   SYSTEM=`uname -s 2>/dev/null` || SYSTEM="unknown"
+@@ -565,7 +565,7 @@ else
+   case $SYSTEM in
+      OSF1|ULTRIX)
+         echo Check for -Olimit option
+-        $CC ${CFLAGS} -Olimit 1000 -o conftest conftest.c >/dev/null 2>/dev/null
++        $CC ${CFLAGS} ${LDFLAGS} -Olimit 1000 -o conftest conftest.c >/dev/null 2>/dev/null
+         [ $? -eq 0 ] && CFLAGSR="${CFLAGSR} -Olimit 1000"
+         ;;
+ ###     HP-UX)
+-- 
+2.35.1
+
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 4720fddf487..af94a39195c 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -27,6 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
 	file://CVE-2019-13232_p2.patch \
 	file://CVE-2019-13232_p3.patch \
 	file://unzip_optimization.patch \
+        file://0001-configure-Pass-LDFLAGS-to-tests-doing-link-step.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.35.1


