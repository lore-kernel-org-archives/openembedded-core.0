Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFF2C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 06:48:04 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.3031.1646808482799812994
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 22:48:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b0gLe9LN;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id n2so1162753plf.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 22:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S5LgpcCl3/ysmBzRnqvtglmKf/Iz+mkryTpMAQYjsC0=;
        b=b0gLe9LNXQ3tYpR3H217Wjx8PhrbuHhafD2AfOBPUcRIzm1IA0+8H/RIbcfghIt+En
         c3o/nQw5lT5mst0s+gJz3XgoBatWwaIg6y0o5JZnGCjiHA7LC0vdrELzWIr1CkIx96su
         UU3j6JV/66Ja7Uce26Zqm9l4v77GmMbru9eMazNn49xUcYwzFhotgYnQeObdNOmllKcP
         1c9tAGgQgHhbgy32OgpMKzwizd4Oc++y5n0huJlGiX9BdlhJgVqgRwJpCpLwStxCtY7l
         ESrFCX67f+ehj7vSfxfxa5pnY7IDeUfgGhvD18aQKlfn/knzDRKBV7ba/H7qrffMDSQ2
         AtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S5LgpcCl3/ysmBzRnqvtglmKf/Iz+mkryTpMAQYjsC0=;
        b=aAv/mH/dagxBezDjcJBn10vSd1Fooink6ErF55eQifMYrNoGeQ1o4/2OB1FZOF+zN5
         2xaFeqWweEoW6k4A5jj7XdVW7p3BvRSxCOPAExt9HH4lQIAea5uF50HnmRyCiCJcUciH
         VraBMcXuhfvEb5ieddKC/RvOdS5E7W6uuXooWcUdLQuetzwzTfUMnHtJO6YhFgSYbsvD
         l08No7wFOWLpG+iVTPgx1T+Kcb2nshx6gA2WgUmWj8+7qYSxRMlefHBTChhOxaIZbWfa
         lCwOFfhnr/X0bDgepujlzwT7y3oz97ihDapyYiE1qS543VQtwyDGK8HUQYiB9PB9r1Du
         lK2g==
X-Gm-Message-State: AOAM531Z0+8KJy9b9WDg30Z4fKdeunEazutrMMEsOXavWoGF2o5qOSI9
	W9p+G+t+j/9JDkNxhg16/eY4FtaEyqAqsw==
X-Google-Smtp-Source: 
 ABdhPJxG+JuW8/twhN6oVmfMK+XpcWjRYMEHF8MwfU5UeU5ZkN31dT7p/PLBuEHtS9P58dJFyH2qVg==
X-Received: by 2002:a17:90b:1812:b0:1bf:2395:8d53 with SMTP id
 lw18-20020a17090b181200b001bf23958d53mr8730525pjb.178.1646808481587;
        Tue, 08 Mar 2022 22:48:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a62830a000000b004f73c34f2e8sm1237053pfe.165.2022.03.08.22.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 22:48:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] zlib: Pass ldflags to configure tests using linking
Date: Tue,  8 Mar 2022 22:47:57 -0800
Message-Id: <20220309064758.1716951-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 06:48:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162949

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...configure-Pass-LDFLAGS-to-link-tests.patch | 79 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tests.patch

diff --git a/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tests.patch b/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tests.patch
new file mode 100644
index 00000000000..91a1b4a09a1
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tests.patch
@@ -0,0 +1,79 @@
+From 001971eef84485562f912d8edd4fc7688acfad91 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Mar 2022 22:38:47 -0800
+Subject: [PATCH] configure: Pass LDFLAGS to link tests
+
+LDFLAGS can contain critical flags without which linking wont succeed
+therefore ensure that all configure tests involving link time checks are
+using LDFLAGS on compiler commandline along with CFLAGS to ensure the
+tests perform correctly. Without this some tests may fail resulting in
+wrong confgure result, ending in miscompiling the package
+
+Upstream-Status: Submitted [https://github.com/madler/zlib/pull/599]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/configure b/configure
+index e974d1f..69dfa3f 100755
+--- a/configure
++++ b/configure
+@@ -410,7 +410,7 @@ if test $shared -eq 1; then
+   echo Checking for shared library support... | tee -a configure.log
+   # we must test in two steps (cc then ld), required at least on SunOS 4.x
+   if try $CC -w -c $SFLAGS $test.c &&
+-     try $LDSHARED $SFLAGS -o $test$shared_ext $test.o; then
++     try $LDSHARED $SFLAGS $LDFLAGS -o $test$shared_ext $test.o; then
+     echo Building shared library $SHAREDLIBV with $CC. | tee -a configure.log
+   elif test -z "$old_cc" -a -z "$old_cflags"; then
+     echo No shared library support. | tee -a configure.log
+@@ -492,7 +492,7 @@ int main(void) {
+ }
+ EOF
+   fi
+-  if try $CC $CFLAGS -o $test $test.c; then
++  if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
+     sizet=`./$test`
+     echo "Checking for a pointer-size integer type..." $sizet"." | tee -a configure.log
+   else
+@@ -530,7 +530,7 @@ int main(void) {
+   return 0;
+ }
+ EOF
+-  if try $CC $CFLAGS -o $test $test.c; then
++  if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
+     echo "Checking for fseeko... Yes." | tee -a configure.log
+   else
+     CFLAGS="${CFLAGS} -DNO_FSEEKO"
+@@ -547,7 +547,7 @@ cat > $test.c <<EOF
+ #include <errno.h>
+ int main() { return strlen(strerror(errno)); }
+ EOF
+-if try $CC $CFLAGS -o $test $test.c; then
++if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
+   echo "Checking for strerror... Yes." | tee -a configure.log
+ else
+   CFLAGS="${CFLAGS} -DNO_STRERROR"
+@@ -654,7 +654,7 @@ int main()
+   return (mytest("Hello%d\n", 1));
+ }
+ EOF
+-  if try $CC $CFLAGS -o $test $test.c; then
++  if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
+     echo "Checking for vsnprintf() in stdio.h... Yes." | tee -a configure.log
+ 
+     echo >> configure.log
+@@ -744,7 +744,7 @@ int main()
+ }
+ EOF
+ 
+-  if try $CC $CFLAGS -o $test $test.c; then
++  if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
+     echo "Checking for snprintf() in stdio.h... Yes." | tee -a configure.log
+ 
+     echo >> configure.log
+-- 
+2.35.1
+
diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-core/zlib/zlib_1.2.11.bb
index 1c06aa0ab5e..d699719554e 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef6
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
            file://ldflags-tests.patch \
+           file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
            file://run-ptest \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
-- 
2.35.1


