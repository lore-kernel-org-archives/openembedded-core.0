Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D36CA0EFF
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:59 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.6656.1756330251484531086
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EEML/zRk;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b475dfb4f42so280592a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330251; x=1756935051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cc/7gkIF/rU4DwvhPImrwrbI/vYONruWImgVriSASG4=;
        b=EEML/zRkXTLZTq1fDIa0JHjKkLDfJ8S2U3y1aCRc7KBPg+3np3cSI0Mew0rcrlODOV
         C+V+J4rSkqZ9/qM1NcXnuBYMoNxcN4j6kfV1UysZ/tCSOWhQzn8reQLSDvarUc0edTvR
         x7L5o2k1lzuZsPUI1MkGmFDfnOzA0Q/VpEJrBrJmOYgKqd2PfbBbrBYLBsD4mKrsjK6Q
         rHOKLUJOQfPQ3fvGyo6aikT3GWUU6d/csAkTktqD4RR+Kafx9FWcqdQ9zPFHxsa8XlXU
         gV0UtijtLKTqpMyH12vCXNsIIEk2eQ7LBndWX0eeXo4XF2aVKEG30NC/NP0luxZBLFp3
         Uzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330251; x=1756935051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cc/7gkIF/rU4DwvhPImrwrbI/vYONruWImgVriSASG4=;
        b=ILz+XU2V3AfCVaUGmpbMJjZylBNoeVzQmjpjScFIzBM5TAdoCPeN6mtwS2BPOlNZL9
         DobMzozBIAwGdm+4akVTVgwrei/7kas1xWIOR6GGX8lo9M7CTyNTG3Pb5C02eieamBv3
         gnx/59hu8PH+jEWooNC+0vrC7Axzc/x5obgHqLyUPE5tjnJmFYxXXEyve575PcMKT+Hb
         s3t4TAVO7j4y01D1Jsg5v67RPcywdOF7NuU0O3MkuqX62patbMVIe8cLi4RpB0wSf0ao
         02RyDJBe+zXSYrvX8nXHipAF2/Dc4wExtqCchi8/7G2bP6Jwj9olNwxPwJaDIUOTUybw
         qQhw==
X-Gm-Message-State: AOJu0YwTn/dNp83uRIE3HTeXwpIav57fLDH8lCvRrOb6VVw14Ojc22/P
	aWBuqFo9HqUMh3mNb8QnPzn6/U3cPIKUxuVLA1jqFZhhIaLwJjD/zDQ1AnebccuY0jSK6F9xTdj
	4UP+q
X-Gm-Gg: ASbGncuL5hXvUghEihM0ice3yi4Dj+5Vt2X0ruzWHP5MEUj9vKaSDoQ1vLAmgrK2bjf
	Lz7NGKeK+W5JlS32VXaE2YJ5hcyk3Hcr9uSPI4YdAWmuHEPITjCuOdlJki9JUh9lIuljubzR3fu
	/8CGd/7WD+JqEhvGfXU/QK6UXJsKzRqdqJgZYi1I8f9MSzf9ETBq5I+vN5eKe1TxUVcu6e0/DxG
	9ogNaPzv47weq77+VHS8OZNihJAy+q3huLXnYrPm7/L9P+lfi+4KoBmCSQcaE9J9ZRy/x5heOmy
	0sPEeuxkQgiYWUad5a4XynO/74n8gRVI55J3QLfw8HFJC82C+hsh+7oVRM9fAkG+grKDLXirsAp
	zzeO2lOfoK6Ykiw==
X-Google-Smtp-Source: AGHT+IF9TKMNwz14vWKpxDWS3HqMF22M3Au8FZBajJJ9aNq/wXl/OWkuTguIOxuqwux01tRFzCa55A==
X-Received: by 2002:a17:90b:3e89:b0:327:aaeb:e80d with SMTP id 98e67ed59e1d1-327aaebeff2mr522736a91.7.1756330250614;
        Wed, 27 Aug 2025 14:30:50 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 32/33] ruby-ptest : some ptest fixes
Date: Wed, 27 Aug 2025 14:29:39 -0700
Message-ID: <fbbfbfd59fe74c6f742af29d32fae1327068b9ff.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222540

From: Jiaying Song <jiaying.song.cn@windriver.com>

- Skip the test_rm_r_no_permissions test under the root user, as
  deletion always succeeds.
- Filter out tests under the -ext- directory in run-ptest. Due to the
  commit [1],the packaging of .so test files under the .ext directory
  was removed. As a result, adjust the test filtering rules to avoid
  test failures caused by missing files.
- Add installation of rdoc.rb and did_you_mean.rb files in
  do_install_ptest to ensure complete test dependencies.
- Add init.rb file to PTEST installation path.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ..._rm_r_no_permissions-test-under-root.patch | 30 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby/run-ptest     |  2 +-
 meta/recipes-devtools/ruby/ruby_3.3.5.bb      |  7 +++--
 3 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch

diff --git a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
new file mode 100644
index 0000000000..dc06891bbc
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
@@ -0,0 +1,30 @@
+From cc5e563f0fa5212e4a624b954fbc97cc6d8900d4 Mon Sep 17 00:00:00 2001
+From: Jiaying Song <jiaying.song.cn@windriver.com>
+Date: Mon, 25 Aug 2025 16:31:18 +0800
+Subject: [PATCH] Skip test_rm_r_no_permissions test under root
+
+Skip the test_rm_r_no_permissions test under the root user, as deletion always succeeds.
+
+Upstream-Status: Submitted [https://github.com/ruby/fileutils/pull/133/commits/3c831389c5e1523af5869d025f573ff043486b99]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ test/fileutils/test_fileutils.rb | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/fileutils/test_fileutils.rb b/test/fileutils/test_fileutils.rb
+index 481f913..a2ed414 100644
+--- a/test/fileutils/test_fileutils.rb
++++ b/test/fileutils/test_fileutils.rb
+@@ -757,7 +757,7 @@ class TestFileUtils < Test::Unit::TestCase
+   def test_rm_r_no_permissions
+     check_singleton :rm_rf
+ 
+-    return if /mswin|mingw/ =~ RUBY_PLATFORM
++    return if /mswin|mingw/ =~ RUBY_PLATFORM || root_in_posix?
+ 
+     mkdir 'tmpdatadir'
+     touch 'tmpdatadir/tmpdata'
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/ruby/ruby/run-ptest b/meta/recipes-devtools/ruby/ruby/run-ptest
index de7c415aba..17404e3509 100644
--- a/meta/recipes-devtools/ruby/ruby/run-ptest
+++ b/meta/recipes-devtools/ruby/ruby/run-ptest
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-test_fullname=`find test -name test_*.rb` 
+test_fullname=$(find test -name test_*.rb | grep -v '/-ext-/')
  
 for i in ${test_fullname}; do 
 	ruby ./test/runner.rb ${i}  2>&1 > /dev/null
diff --git a/meta/recipes-devtools/ruby/ruby_3.3.5.bb b/meta/recipes-devtools/ruby/ruby_3.3.5.bb
index b37f0d03e7..8b45946f6b 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.5.bb
@@ -30,7 +30,8 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2025-27220.patch \
            file://CVE-2025-27221-0001.patch \
            file://CVE-2025-27221-0002.patch \
-           "
+           file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch \
+          "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
 inherit autotools ptest pkgconfig
@@ -102,11 +103,13 @@ do_install:append:class-target () {
 
 do_install_ptest () {
     cp -rf ${S}/test ${D}${PTEST_PATH}/
-
+    install -D ${S}/tool/test/init.rb ${D}${PTEST_PATH}/tool/test/init.rb
     install -D ${S}/tool/test/runner.rb ${D}${PTEST_PATH}/tool/test/runner.rb
     cp -r ${S}/tool/lib ${D}${PTEST_PATH}/tool/
     mkdir -p ${D}${PTEST_PATH}/lib
     cp -r ${S}/lib/did_you_mean ${S}/lib/rdoc ${D}${PTEST_PATH}/lib
+    cp ${D}${libdir}/ruby/${SHRT_VER}.0/rdoc.rb ${D}${PTEST_PATH}/lib
+    cp ${D}${libdir}/ruby/${SHRT_VER}.0/did_you_mean.rb ${D}${PTEST_PATH}/lib
 
     # install test-binaries
     # These .so files have sporadic reproducibility fails as seen here:
-- 
2.43.0


