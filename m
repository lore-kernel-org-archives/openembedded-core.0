Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FF1C3DA42
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:08 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.15455.1720960746733279670
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cj3vtc08;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fb4a807708so30526745ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960746; x=1721565546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ynqZOWLyYgm/sX2a6o3lEPugKkOkO0Vi2Gr1j8SSA8=;
        b=cj3vtc08q4YuOq1wTjG9frD3ispqSrrgM++RTeoFmA8WIlJFssGiUzJjTsNunoOeWC
         4CzoQzKcWueaEuAF1MTkluB3ddU46ASemnJUPVNQUOF/1Oe1IZOm3ezEVIsLiyXkrttP
         1DMsUVvvEc5Jij6h3nEjB9+Jzhs74hSduBmGCj2+YX+Xkk0pN8JBCdlMpy+NMX1p9WhJ
         +V2JYeePSV/NjoclHH07DHxlAXOLokuRJ4YVEnzN9DQnNpb8f6q0hcQeyocmq6sLtltO
         uPcTdFMXujOzWC2BVf/lV5AdY5s6AU7UhAfdkZxZ+Vc20fGRSdNgOSa/JD4YfpGEIuza
         LkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960746; x=1721565546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ynqZOWLyYgm/sX2a6o3lEPugKkOkO0Vi2Gr1j8SSA8=;
        b=waUyN0dGMra69NToIkucxSAuzLX9s1ozHkT1SR6n6rqRx4kDbroFJY7R1VmvgnC1+e
         AzX+1WB5W3uDpW7rZp3I2ssOO5tZ/flbdnOg2WFFre4d2gLWOB27Jc5bfwWikTj4+fUT
         twW3lLBQT4D8Gkf7RKkXrrKO8e/NHZOYQla8ocmEWeADSI6DxizwkzOuBsAACVkhs4ie
         mrbKFLfce1OPnBxDAU+ARKuT7zo2yKExITiTOme93x7RfQfV4Pk3x79dTYhKQXXsekjL
         1+JzwxnpsiHtHt2mXfjM+ImlImUjopO8a32oxGJANO3yZj9diN0dCodAW1er88piFOgT
         JN5A==
X-Gm-Message-State: AOJu0YwR4+ln5TlhOmFJkfsL5aIlIvNfDa1/r4O+1DGFCVSgiN8Q8u05
	ezWMXZ9eXnPpIQUQM/gJE7QZWpSeYt7AxheWh3mrEGR1lfxceRYaAq57zgXYB3UzoFRW3Mm230P
	Vhcc=
X-Google-Smtp-Source: AGHT+IHkyz/47yAY6KS9l6fGI/3v6s+ZVlYBnwOtj4lvBvKCHR0BwnHcWTJ2sCEaMOCIlOvAvtT10A==
X-Received: by 2002:a17:903:1ca:b0:1fa:7f7e:2e0a with SMTP id d9443c01a7336-1fbb6f0ce2cmr148566235ad.65.1720960745873;
        Sun, 14 Jul 2024 05:39:05 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/27] ruby: fix CVE-2024-27281
Date: Sun, 14 Jul 2024 05:38:31 -0700
Message-Id: <16685f3b2d22eac20f0134cbd589c3b23a187084.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201861

From: Hitendra Prajapati <hprajapati@mvista.com>

References:
https://github.com/ruby/ruby/pull/10316
https://security-tracker.debian.org/tracker/CVE-2024-27281

Upstream-Status: Backport from https://github.com/ruby/rdoc/commit/da7a0c7553ef7250ca665a3fecdc01dbaacbb43d

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


