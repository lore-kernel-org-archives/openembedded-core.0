Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 807B0C3271E
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 04:32:18 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.4725.1720672336811745691
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 21:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=a9fXGTny;
 spf=pass (domain: mvista.com, ip: 209.85.128.169, mailfrom: hprajapati@mvista.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6519528f44fso4322627b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 21:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1720672336; x=1721277136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pD+vPHmlvuKeAtR+pFmtkmRGmh1Ovuoyv6He79N3h+c=;
        b=a9fXGTnyBTdcKA3dYan0qRrdhr9UlnO4OwDDmzyhxb1+opeqeTmg1acwRZp/STkuFX
         alJumPOnFD5jhnV4pP/que1FxPoEEB9vt8vCrq0p1OggTZl2L8OyJs67mKYtWiPjWwpK
         K4OVYKVmjbxmO4/kL+K86Rp+NDiB3yUNV8NVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720672336; x=1721277136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pD+vPHmlvuKeAtR+pFmtkmRGmh1Ovuoyv6He79N3h+c=;
        b=vZjy163HCEnffrOrZnCViz81syZh+BgmAh1Ep75t1JQrTzTi9HfgIlg2Spg4QF+c8B
         ox8JoXYWcbpKIufa3HamiMgzU8ZyBg5bNvkUagCfhLbNCQ3/TAFnAgrxeiGqgc22ebEZ
         gXIzkONMkZ5Y8QnzynyetYIChI5PR/zW1SfGNDy0Gzq2hnzIlJWXQUSZeOj/RgJP4NbW
         0DhszAQeYTmVea9papwnSCugQinqCp/UUCUKK9o6yxUx2s4NzfvpjEbZeaoDUguV3JZb
         syoJ/KnFrQ5f2dUHU9CBRSA6Jf/aAqQeYqZxKOyI4damU53UT7yiJNcUBUt6ZKV8CtMd
         eVUQ==
X-Gm-Message-State: AOJu0YxMPxnmvTTt1m/XecFNTgc5joc9f7T68Dd2fd801fEA66b4cYZc
	HRueewYuhrKjdoU8sVDgrgPmGqC+x61WtkiPbCGxdqvCIdb9rYXATuYQBHqBv6cU7hPRFy9ABuW
	S
X-Google-Smtp-Source: AGHT+IEIss/e1N2UiCggnqxwvzX1lluAXO/ZRwgyvuJUc95qsDhiCQcf1Z4t7IsOwtnikxwe8ESfWg==
X-Received: by 2002:a81:4406:0:b0:65b:a403:9ec8 with SMTP id 00721157ae682-65ba403a076mr39790327b3.38.1720672335597;
        Wed, 10 Jul 2024 21:32:15 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.191])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e64ece0dsm9757097b3.94.2024.07.10.21.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 21:32:15 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] ruby: fix CVE-2024-27281
Date: Thu, 11 Jul 2024 10:02:04 +0530
Message-Id: <20240711043204.61686-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 04:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201750

References:
https://github.com/ruby/ruby/pull/10316
https://security-tracker.debian.org/tracker/CVE-2024-27281

Upstream-Status: Backport from https://github.com/ruby/rdoc/commit/da7a0c7553ef7250ca665a3fecdc01dbaacbb43d

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../ruby/ruby/CVE-2024-27281.patch            | 97 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.2.2.bb      |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
new file mode 100644
index 0000000000..f69f3bcf4f
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
@@ -0,0 +1,97 @@
+From da7a0c7553ef7250ca665a3fecdc01dbaacbb43d Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <nobu@...>
+Date: Mon, 15 Apr 2024 11:40:00 +0000
+Subject: [PATCH] Filter marshaled objets
+
+CVE: CVE-2024-27281
+Upstream-Status: Backport [https://github.com/ruby/rdoc/commit/da7a0c7553ef7250ca665a3fecdc01dbaacbb43d]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/rdoc/store.rb | 45 ++++++++++++++++++++++++++-------------------
+ 1 file changed, 26 insertions(+), 19 deletions(-)
+
+diff --git a/lib/rdoc/store.rb b/lib/rdoc/store.rb
+index 9fc540d..5b663d7 100644
+--- a/lib/rdoc/store.rb
++++ b/lib/rdoc/store.rb
+@@ -556,9 +556,7 @@ class RDoc::Store
+   def load_cache
+     #orig_enc = @encoding
+ 
+-    File.open cache_path, 'rb' do |io|
+-      @cache = Marshal.load io
+-    end
++    @cache = marshal_load(cache_path)
+ 
+     load_enc = @cache[:encoding]
+ 
+@@ -615,9 +613,7 @@ class RDoc::Store
+   def load_class_data klass_name
+     file = class_file klass_name
+ 
+-    File.open file, 'rb' do |io|
+-      Marshal.load io
+-    end
++    marshal_load(file)
+   rescue Errno::ENOENT => e
+     error = MissingFileError.new(self, file, klass_name)
+     error.set_backtrace e.backtrace
+@@ -630,14 +626,10 @@ class RDoc::Store
+   def load_method klass_name, method_name
+     file = method_file klass_name, method_name
+ 
+-    File.open file, 'rb' do |io|
+-      obj = Marshal.load io
+-      obj.store = self
+-      obj.parent =
+-        find_class_or_module(klass_name) || load_class(klass_name) unless
+-          obj.parent
+-      obj
+-    end
++    obj = marshal_load(file)
++    obj.store = self
++    obj.parent ||= find_class_or_module(klass_name) || load_class(klass_name)
++    obj
+   rescue Errno::ENOENT => e
+     error = MissingFileError.new(self, file, klass_name + method_name)
+     error.set_backtrace e.backtrace
+@@ -650,11 +642,9 @@ class RDoc::Store
+   def load_page page_name
+     file = page_file page_name
+ 
+-    File.open file, 'rb' do |io|
+-      obj = Marshal.load io
+-      obj.store = self
+-      obj
+-    end
++    obj = marshal_load(file)
++    obj.store = self
++    obj
+   rescue Errno::ENOENT => e
+     error = MissingFileError.new(self, file, page_name)
+     error.set_backtrace e.backtrace
+@@ -976,4 +966,21 @@ class RDoc::Store
+     @unique_modules
+   end
+ 
++  private
++  def marshal_load(file)
++    File.open(file, 'rb') {|io| Marshal.load(io, MarshalFilter)}
++  end
++
++  MarshalFilter = proc do |obj|
++    case obj
++    when true, false, nil, Array, Class, Encoding, Hash, Integer, String, Symbol, RDoc::Text
++    else
++      unless obj.class.name.start_with("RDoc::")
++        raise TypeError, "not permitted class: #{obj.class.name}"
++      end
++    end
++    obj
++  end
++  private_constant :MarshalFilter
++
+ end
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.2.2.bb b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
index d1359e388c..5c2b07e5e4 100644
--- a/meta/recipes-devtools/ruby/ruby_3.2.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch \
            file://CVE-2023-36617_1.patch \
            file://CVE-2023-36617_2.patch \
+           file://CVE-2024-27281.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.25.1


