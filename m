Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 453DAC83F22
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:56:11 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.40207.1752720961940491739
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:56:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XXee7oaX;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b3aa2a0022cso431034a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752720961; x=1753325761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xphVIyYd5aVu0bT9kSeqBWcN52bQ7uCr3eZBgnxWqL8=;
        b=XXee7oaXY+axbdK1uLajhV9MM+7pCOv/F4x2Qv+JRi7qK5E2jc4Y2SoiwpH3DFr+vu
         wsZ1MbJBocTLCZeWHOkbLrk/3cZBud2oaz2NXOhr1PAjaDJQUKJwB2rOaijMQdVaafl/
         KiKATbAuZUqa33s0hN/J6LxSSGrirH8IHOvEaHP04XSz7A1gDRCv2TdOqyWnIqjT2dxd
         bVVFhMbr5edNPeUcarEu6L7D0q3YeRJ3XWuFSVWgapxtlw4n95Q1mTuLXd/3IzhWoRKi
         vnw/f0K0N49VdUln9SyzVtrHEwyDcWNN1IDggoC1fh4vcoDlX9DJs9Qgm/YzNteYuV62
         obdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752720961; x=1753325761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xphVIyYd5aVu0bT9kSeqBWcN52bQ7uCr3eZBgnxWqL8=;
        b=tPgrSO9bZMyFVTxYaV9ftg4OvwJu4vJhbDHWUDDr5I2aFdZB0kZjR82BD7i20YzyYj
         3M5ZKP0pSuBnoPT9MNMEZlmHXjnhQQkMwQiFvF+VyWVvb9V9gmcb0OLvhxu+f5ZCVcN8
         MxcEbAoH6DQDxGCg/ibmR1F7oC0cTXxSc8K9cmQ7uPrKL7L7VnfFy5IJ9oq0XRJWEdDj
         b7eHbdARHVlgBE+Fb+7Ybpmz90g1MLV/vrYrN5b8sCYTu91DSYPkqklLxx4a0ZMlXPh+
         9VpKQOaVskyM+72GmVlTqdISE5YeGreuVp3DT3zXGab7druUneqiIw5Ph/7iL/ZzrJh4
         jYdA==
X-Gm-Message-State: AOJu0YzbLU50TFVL1juS/dwnATj8SJNAqAnnR6RgKwfjOZniMD9x5Tzz
	fqFFtXbslZNZAWH469XtR5SZuzsDnSH3cfMRcZlPrcAXgNHHfM6POiqcA16dxmTAeShSZm/AnKj
	99CO3
X-Gm-Gg: ASbGncvtZEluami4YUsiQtzz3FgpPNPb9Wr7u9zpS8mzqoFrs0InObxQa72Zv2ITYb7
	KhDfuze4NwbzQxZEHW41lQ1lU+dUc8CBbo+eF1tMuBMHPDfJa1oXXSsE5FupTu5TG48xQCCeRNP
	9elWL0EqLN1lB82VsZlNBntZQNZD7ITosK5x7jrr1jqE2MdgIhWSHOeuLAZgeW3LnCPjDOzFJwZ
	zv8Oqkw7iKGUfVcPTA8EhKFRmPq+jJQz9i/EwS+V6YcMesLpCO8FTJiHgWN6C8ZHupxywcmriow
	lPMtZH7Yop/hGD1ZbKPuRq0nIoexD8iAf1jRcf/ByKY7OC5Zz43MljOsqT3R11GtnVCTVugWcmY
	+OxtzS37MGsLNRHokiygoi2WM
X-Google-Smtp-Source: AGHT+IGg0vE9elHsf+1L+u9S5v+bDqOD3vRROLAAIrlOrw3p1vfXPfwSsS64IOrGORpHFsbQI//1gw==
X-Received: by 2002:a17:90b:5385:b0:312:e51c:af67 with SMTP id 98e67ed59e1d1-31c9f3ef43cmr6218784a91.1.1752720961106;
        Wed, 16 Jul 2025 19:56:01 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f288173sm2333256a91.25.2025.07.16.19.56.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:56:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 12/13] ruby-ptest : some ptest fixes
Date: Wed, 16 Jul 2025 19:55:35 -0700
Message-ID: <e2686031a0ee8c6e24898b70059d1a50e956625d.1752720827.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752720827.git.steve@sakoman.com>
References: <cover.1752720827.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:56:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220498

From: Jiaying Song <jiaying.song.cn@windriver.com>

- Skip the test_rm_r_no_permissions test under the root user, as
  deletion always succeeds.
- Filter out tests under the -ext- directory in run-ptest. Due to the
  commit [1],the packaging of .so test files under the .ext directory
  was removed. As a result, adjust the test filtering rules to avoid
  test failures caused by missing files.
- Add installation of rdoc.rb and did_you_mean.rb files in
  do_install_ptest to ensure complete test dependencies.

[1] https://git.openembedded.org/openembedded-core/commit/meta/recipes-devtools/ruby?id=4d4485442830bb52b152f0419f4ff9f1d581d46a

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ..._rm_r_no_permissions-test-under-root.patch | 32 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby/run-ptest     |  2 +-
 meta/recipes-devtools/ruby/ruby_3.4.4.bb      |  5 ++-
 3 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch

diff --git a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
new file mode 100644
index 0000000000..e3574f1a81
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
@@ -0,0 +1,32 @@
+From 9c4748aae4f69390a36875aa27d70c3c632ae944 Mon Sep 17 00:00:00 2001
+From: Jiaying Song <jiaying.song.cn@windriver.com>
+Date: Mon, 7 Jul 2025 15:05:57 +0800
+Subject: [PATCH] Skip test_rm_r_no_permissions test under root
+
+Skip test_rm_r_no_permissions test under root user and Windows environments since deletion always succeeds.
+
+Upstream-Status: Submitted [https://github.com/ruby/ruby/pull/13828/commits/c510b5ac475e6d3eef935725d21910861816b7a9]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ test/fileutils/test_fileutils.rb | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/test/fileutils/test_fileutils.rb b/test/fileutils/test_fileutils.rb
+index d2096a0..80e3368 100644
+--- a/test/fileutils/test_fileutils.rb
++++ b/test/fileutils/test_fileutils.rb
+@@ -768,8 +768,8 @@ class TestFileUtils < Test::Unit::TestCase
+ 
+   def test_rm_r_no_permissions
+     check_singleton :rm_rf
+-
+-    return if /mswin|mingw/ =~ RUBY_PLATFORM
++    
++    return if Process.uid == 0 || /mswin|mingw/ =~ RUBY_PLATFORM
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
diff --git a/meta/recipes-devtools/ruby/ruby_3.4.4.bb b/meta/recipes-devtools/ruby/ruby_3.4.4.bb
index 39e86fdd28..5d088f32c0 100644
--- a/meta/recipes-devtools/ruby/ruby_3.4.4.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.4.4.bb
@@ -27,7 +27,8 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
-           "
+           file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch \ 
+          "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
 inherit autotools ptest pkgconfig
@@ -104,6 +105,8 @@ do_install_ptest () {
     cp -r ${S}/tool/lib ${D}${PTEST_PATH}/tool/
     mkdir -p ${D}${PTEST_PATH}/lib
     cp -r ${S}/lib/did_you_mean ${S}/lib/rdoc ${D}${PTEST_PATH}/lib
+    cp ${D}${libdir}/ruby/${SHRT_VER}.0/rdoc.rb ${D}${PTEST_PATH}/lib
+    cp ${D}${libdir}/ruby/${SHRT_VER}.0/did_you_mean.rb ${D}${PTEST_PATH}/lib
 
     # install test-binaries
     # These .so files have sporadic reproducibility fails as seen here:
-- 
2.43.0


