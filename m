Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7B6C05052
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 20:35:45 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.24878.1713386143054857090
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 13:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1QjMqs/f;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ed20fb620fso202600b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 13:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713386142; x=1713990942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaiRWK9LDqa8ScUMBDrZkElUjAEd06Em8TeJAbfNCMc=;
        b=1QjMqs/f8L8oDewzCLH3a/sM3bkVk/0jgBB+mBQlf5+k8mdIWNCelI5UYMlPd2Bcuj
         MEvJgR6WfC3P+1/0rvXhh4psW0vs6zce9Tx9XtNizKdGZ3bxTvCvme1kV4Ij+WgAiWvb
         YTtrt9u155itPivXE5nmoP5tfkqbx3M02gyzqU/X4KSIHU8tODi0N4fKP4PCTFivjttF
         YuUAADczJ1spf2CFq0cCqHb/OLjJB6MuIn0d2W+ESJA7XcZ5YEpvZVbHMeyfR2H35yGz
         T308kDmMmkjPPJb5MhySUnECUUziRaDDeSSmdDnaqAMI4r0UGQIySgx6pJBtuefOtWiB
         R5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713386142; x=1713990942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kaiRWK9LDqa8ScUMBDrZkElUjAEd06Em8TeJAbfNCMc=;
        b=XA4UEIuKgUBv4Zw9eXwZqmh0bzUCl9Bsc59s2QgqTSv+3Ou/MZkCcLocgYZuJwVlIB
         eaJbKArrW0cUIPZb0IUSvPM+7tKhxs5suL85fr3QcR1sHpHMJWC4J6kXnm2R9lYzPYVV
         D7lhlgJULjv258aKyeN4xIUj+hQyDOwHWZFF08tkRWXo37sgwnIDYDCqZ+QyrK1AY7l5
         JN+rOJg3VgQd5Cnql4zruhorpMt+TDvRMCJZPVrKLSyGQgQY3YhAxk5BrLgj/xnznGGL
         zD4kNpZj6/PZbhygmRMQYEZj/rBQqAfCRymFvn2ctQpgrunh8wKJk/zKBbn2m/w7h5z7
         qYmA==
X-Gm-Message-State: AOJu0YwsG5Ea/vCnQ/FH3Iqi+J8JRX61RNpbLFFSTEnAeXyzsw3/wQU2
	IfhplYIv2vDApK++jruHUupj2zo/XtwxssrfgeCvSEC5OGBhDsz1/6ElqtDmLIryheYn5eILM/z
	3dTg=
X-Google-Smtp-Source: AGHT+IFDoECwi1PcQC2du/9quTTyMMcnG9+YN/qWfL7gjAgFkWz4Is2NcAoU4GYAYbv1kGN8cKBZfQ==
X-Received: by 2002:a17:90a:db93:b0:2ab:afb8:e44c with SMTP id h19-20020a17090adb9300b002abafb8e44cmr527838pjv.20.1713386142228;
        Wed, 17 Apr 2024 13:35:42 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id s22-20020a17090aa11600b002ab664e5e17sm76876pjp.1.2024.04.17.13.35.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:35:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/7] ruby: fix CVE-2024-27281
Date: Wed, 17 Apr 2024 13:35:26 -0700
Message-Id: <d01b73c51ceead4911a9a9306dbe728f1db2e029.1713385733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713385733.git.steve@sakoman.com>
References: <cover.1713385733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 20:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198479

From: Yogita Urade <yogita.urade@windriver.com>

ruby: RCE vulnerability with .rdoc_options in RDoc

References:
https://github.com/ruby/ruby/pull/10316
https://security-tracker.debian.org/tracker/CVE-2024-27281

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ruby/ruby/CVE-2024-27281.patch            | 97 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
new file mode 100644
index 0000000000..6f4b35a786
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
@@ -0,0 +1,97 @@
+From da7a0c7553ef7250ca665a3fecdc01dbaacbb43d Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <nobu@ruby-lang.org>
+Date: Mon, 15 Apr 2024 11:40:00 +0000
+Subject: [PATCH] Filter marshaled objets
+
+CVE: CVE-2024-27281
+Upstream-Status: Backport [https://github.com/ruby/rdoc/commit/da7a0c7553ef7250ca665a3fecdc01dbaacbb43d]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/rdoc/store.rb | 45 ++++++++++++++++++++++++++-------------------
+ 1 file changed, 26 insertions(+), 19 deletions(-)
+
+diff --git a/lib/rdoc/store.rb b/lib/rdoc/store.rb
+index 5ba671c..c793e49 100644
+--- a/lib/rdoc/store.rb
++++ b/lib/rdoc/store.rb
+@@ -556,9 +556,7 @@ class RDoc::Store
+   def load_cache
+     #orig_enc = @encoding
+
+-    File.open cache_path, 'rb' do |io|
+-      @cache = Marshal.load io.read
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
+-      Marshal.load io.read
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
+-      obj = Marshal.load io.read
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
+-      obj = Marshal.load io.read
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
++      unless obj.class.name.start_with?("RDoc::")
++        raise TypeError, "not permitted class: #{obj.class.name}"
++      end
++    end
++    obj
++  end
++  private_constant :MarshalFilter
++
+ end
+--
+2.35.5
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index 228a2204db..2ad3c9e207 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2023-28755.patch \
            file://CVE-2023-36617_1.patch \
            file://CVE-2023-36617_2.patch \
+           file://CVE-2024-27281.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.34.1


