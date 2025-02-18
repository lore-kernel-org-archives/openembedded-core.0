Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097E3C021AA
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 21:10:18 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.7192.1739913017653612737
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 13:10:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uSeRkG9i;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fc0026eb79so11262507a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739913017; x=1740517817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOV5BpCUZ3FEV+KwajxqDwrWaZ4jSFQR9MK4Q7GCAvU=;
        b=uSeRkG9iPOG0a1bK0WCi0LSRLvtA1mBUZV3IQPqr4Kvx3nL4pBXVt76mHEQgBmFigo
         NXrgeUMZ/DNZEVDmXKe+JSX5f8NFLnG38ZY7fFDaBVYGB2a/5UFndXOcwLwd5pLPf2nf
         j1Uri5vzuMolQQnYY9oV6ovHkmqXnjAJYY87fJ3IScoYHcpTuo+k88qbgpEAYLckL4Z8
         vCAqspxbVPQO6EK9BI6h5TUel/cT5tfSMomxMENKh7sI9aWCuAthZLxWaPFN0OnPp3H8
         HkZybPTFRCaieW9ht4cunfWJ9Wu+7y3DP25KCHtkFnEwua3vqkEZSNOImpPLix9BNlY8
         O5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739913017; x=1740517817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOV5BpCUZ3FEV+KwajxqDwrWaZ4jSFQR9MK4Q7GCAvU=;
        b=mi6bX4FTIV92j8HjWaIk2Yi/TMXkxjwjko6rlx0vJ8lHN2UHI8+9ejyGVQOI2YU013
         6F8z2jgKCA665+D88xFHsaz4MA/jI9P8I+kvks5N4fv1xXsr3vuizh0RqXE+1S3gtC/e
         WKlYkdMGHwMJJZGdmNCEolv+agJYHJaDbb/12q0NmtkkvLrx4Cr5APN22gtQrqOJyWMX
         7ZjqCVi1Hi35eaKO/8q9cltUtTvSejd2YDuRbovn9lXfJnHr23qXYaD7HyT351o6Q3fd
         Jm4G8fcsNQoFXeq+BBjjJDGOv17bN+4YzweloG4sJW49+Vy/XG6TAt0nUeryuu/e/M28
         JjVA==
X-Gm-Message-State: AOJu0YwrKAWuhj66jaG5imzk763OBsxlpDsrfZ45pf+e5cN62OWuFZQk
	/NCvHSL/miCcLxW1YRYbpenDw7dA1S71T4g0zVe/2Pgv/ghBX37Pofy5I/C8cKYfOy/3SjqNvup
	l
X-Gm-Gg: ASbGncvW+L2Pb9Tr4GqE3eBV8xiB/OChgAiB4daL3sjSGCD3sXSOdoekyD1eQtlRUhP
	hk7eR1iEZ4Oa0aBpsoUiQICkcWGOTWbDVB5MwouA6C9QWt09hlhYUtZZ8VBdswbLryzvWhDznUb
	3oXJmmM0O9lsSb5UU1wJ7CtguMwwrYNOfBLXRw2P7zYCqp9OKb/GEXDY/bSl/yOUnrDsu2nLBDo
	WExye7shUcy5pjsWHkTUU3O4cEgMEFhkGxKgflFCNS95sDKa6IHZWG1+FSS4DUG/ui0LPWb8eTe
	nFlRb84=
X-Google-Smtp-Source: AGHT+IG+WTgoxVjjJPd665G6iGLvaM3aw+JEOd5JyQztuSXL5nBu/e3vVibYTA87mtg1QnJYi6Zgnw==
X-Received: by 2002:a17:90b:520d:b0:2ee:f687:6adb with SMTP id 98e67ed59e1d1-2fcb59ec21dmr1368952a91.3.1739913016876;
        Tue, 18 Feb 2025 13:10:16 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:83c7:94a9:a555:bf05])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b326bsm12820720a91.1.2025.02.18.13.10.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 13:10:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/12] ruby: fix CVE-2024-41946
Date: Tue, 18 Feb 2025 13:09:57 -0800
Message-ID: <38b077c9238b1fa9bbd73b7611a68cc17fc51c73.1739912869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739912869.git.steve@sakoman.com>
References: <cover.1739912869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 21:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211643

From: Divya Chellam <divya.chellam@windriver.com>

REXML is an XML toolkit for Ruby. The REXML gem 3.3.2 has a DoS
vulnerability when it parses an XML that has many entity expansions
with SAX2 or pull parser API. The REXML gem 3.3.3 or later include
the patch to fix the vulnerability.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-41946

Upstream-patch:
https://github.com/ruby/rexml/commit/033d1909a8f259d5a7c53681bcaf14f13bcf0368

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ruby/ruby/CVE-2024-41946.patch            | 117 ++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-41946.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-41946.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-41946.patch
new file mode 100644
index 0000000000..0da383f9b9
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-41946.patch
@@ -0,0 +1,117 @@
+From 033d1909a8f259d5a7c53681bcaf14f13bcf0368 Mon Sep 17 00:00:00 2001
+From: NAITOH Jun <naitoh@gmail.com>
+Date: Thu, 1 Aug 2024 09:20:31 +0900
+Subject: [PATCH] Add support for XML entity expansion limitation in SAX and 
+ pull parsers (#187)
+
+- Supported `REXML::Security.entity_expansion_limit=` in SAX and pull parsers
+- Supported `REXML::Security.entity_expansion_text_limit=` in SAX and pull parsers
+
+CVE: CVE-2024-41946
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/033d1909a8f259d5a7c53681bcaf14f13bcf0368]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .../lib/rexml/parsers/baseparser.rb           | 19 ++++++++++++++++++-
+ .../lib/rexml/parsers/pullparser.rb           |  4 ++++
+ .../lib/rexml/parsers/sax2parser.rb           |  4 ++++
+ 3 files changed, 26 insertions(+), 1 deletion(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 661f0e2..e32c7f4 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -135,6 +135,7 @@ module REXML
+       def initialize( source )
+         self.stream = source
+         @listeners = []
++        @entity_expansion_count = 0
+         @attributes_scanner = StringScanner.new('')
+       end
+ 
+@@ -143,6 +144,7 @@ module REXML
+       end
+ 
+       attr_reader :source
++      attr_reader :entity_expansion_count
+ 
+       def stream=( source )
+         @source = SourceFactory.create_from( source )
+@@ -447,7 +449,9 @@ module REXML
+       def entity( reference, entities )
+         value = nil
+         value = entities[ reference ] if entities
+-        if not value
++        if value
++          record_entity_expansion
++        else
+           value = DEFAULT_ENTITIES[ reference ]
+           value = value[2] if value
+         end
+@@ -486,12 +490,17 @@ module REXML
+         }
+         matches.collect!{|x|x[0]}.compact!
+         if matches.size > 0
++          sum = 0
+           matches.each do |entity_reference|
+             unless filter and filter.include?(entity_reference)
+               entity_value = entity( entity_reference, entities )
+               if entity_value
+                 re = Private::DEFAULT_ENTITIES_PATTERNS[entity_reference] || /&#{entity_reference};/
+                 rv.gsub!( re, entity_value )
++                sum += rv.bytesize
++                if sum > Security.entity_expansion_text_limit
++                  raise "entity expansion has grown too large"
++                end
+               else
+                 er = DEFAULT_ENTITIES[entity_reference]
+                 rv.gsub!( er[0], er[2] ) if er
+@@ -504,6 +513,14 @@ module REXML
+       end
+ 
+       private
++
++      def record_entity_expansion
++        @entity_expansion_count += 1
++        if @entity_expansion_count > Security.entity_expansion_limit
++          raise "number of entity expansions exceeded, processing aborted."
++        end
++      end
++
+       def need_source_encoding_update?(xml_declaration_encoding)
+         return false if xml_declaration_encoding.nil?
+         return false if /\AUTF-16\z/i =~ xml_declaration_encoding
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/pullparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/pullparser.rb
+index f8b232a..36b4595 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/pullparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/pullparser.rb
+@@ -47,6 +47,10 @@ module REXML
+         @listeners << listener
+       end
+ 
++      def entity_expansion_count
++        @parser.entity_expansion_count
++      end
++
+       def each
+         while has_next?
+           yield self.pull
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/sax2parser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/sax2parser.rb
+index 6a24ce2..01cb469 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/sax2parser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/sax2parser.rb
+@@ -22,6 +22,10 @@ module REXML
+         @parser.source
+       end
+ 
++      def entity_expansion_count
++        @parser.entity_expansion_count
++      end
++
+       def add_listener( listener )
+         @parser.add_listener( listener )
+       end
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index eec7e4684c..96873fd7fa 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -45,6 +45,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2024-49761-0007.patch \
            file://CVE-2024-49761-0008.patch \
            file://CVE-2024-49761-0009.patch \
+           file://CVE-2024-41946.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.43.0


