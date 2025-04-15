Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D19D6C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 20:52:48 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.4835.1744750359778839589
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 13:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sCKhbtgJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7376dd56f60so4113195b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744750359; x=1745355159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J1ixoJc/pEoZsZRNQ8WYMEES1DWOnnl+o7K7SfUzz9M=;
        b=sCKhbtgJlC9UYpFWo8rD5dnnxesn68CQh32f6zi+zHsNy510mCOEzxyYAPENVsjK2S
         2W+5oK0ZZGVv1qMSxY/xOe+p1puMqdoX2D551WBMiFRBaz6f+rlnPCnS0cUeRoWZtOvE
         3ISv1R/vdTrLCTLUqv5Ud52eUNFrejt9DzUHw/DceQNvJppEodvO3NOLmtrpjq/PbJXh
         bIO4QpSBHtKPGtQ+VnQuvw/glvd4XDOKNogJy0q1Rzp9HLOHltjAYYu2diarp6MZZ+9T
         Xc3tNnyGdTGaSindOJekXr2ZHfzK2UjYiqXFkbPrOjn2OeuW7i1rpiCxT8n2vGGAXA/e
         oX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744750359; x=1745355159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1ixoJc/pEoZsZRNQ8WYMEES1DWOnnl+o7K7SfUzz9M=;
        b=NrVHn81N6MhPosCOmUYgFMKXcIoLC1qwtqlfqn7zXwDdmWPBY2HJcjI7pNYs9PP/+0
         KUrEn/JtobE9OXl/23YSyyVZ/+gNRW8WRimABA1YzO7GrjcV3a1MbEC39njKuD0BlX1P
         LR5by5BhaRg67w98hi+/1XhWJraDV2nr6SPO5cjb9+P5DNfukKJEKIPFau6iUFfA/Qq+
         6bFWcLLrA85idHmBOW1hVLfjfldvE+S1E7J6NuoDzLa3N+7uYK+dqjxjO+X6eWd5dDPP
         RbE+AbcLUfWE0MrbtR1JcWk9D50jLnNkpKzMQu18GrOdYujU9LQElwGn1f0SiKsKFIa/
         7LEQ==
X-Gm-Message-State: AOJu0YyQ/Xm+R9CeLyeux36RNGzitqwn9lqzf3kTeYehdoGZiYw7RQBe
	35ox+O/Ic1QV50inXrOSFEs1A5ehS+5sVYQnpCyn2gzFvKON1guYud4AZb5kuNdhBjPAn9BH3OJ
	A
X-Gm-Gg: ASbGncu3trLMpNbi0ceK11UYkrotJSEuc3RVzhQooEMGbO+xXnWcMa1GdBj1mqkViEi
	h0yV3+wQ2rPaJLkLzWyWcdV5qlzqhSAvmjOpXje/vn4TETtrhyIN/n2PRnNztMWBiR/XzuVGJFe
	+r6/bZBpNmdSC/XGrT865Wr4dm/A5U7PSWp61AEfNFkTX4cnFe/pGLLfcDjfB2wqhNieakwtFk2
	ePHjRWaA8Aa2bAFRrp0WRC+2zYZlM/9UnX3tUSRwPZssvfm2Rhg7srSwqnOW4hIepC6ey8sFPwX
	dWD/wGw8H80Jrxf+AuIZ6gsKbb/ABJJ6
X-Google-Smtp-Source: AGHT+IHMdTv+yRNFFyXsAma0Gehlhm4CFj7fiKZQT/4RKZtreDExdJjFtRPCxz3yX0BwLXCgvAmGHA==
X-Received: by 2002:a05:6a00:140c:b0:736:a694:1a0c with SMTP id d2e1a72fcca58-73c1fb5af29mr1313903b3a.21.1744750358778;
        Tue, 15 Apr 2025 13:52:38 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6144:9704:3eb2:ee31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd23332a3sm8978307b3a.161.2025.04.15.13.52.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 13:52:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/4] ruby: fix CVE-2024-43398
Date: Tue, 15 Apr 2025 13:52:25 -0700
Message-ID: <f23d1bfca0ea57150c397bc2e495191fb61423d0.1744750227.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744750227.git.steve@sakoman.com>
References: <cover.1744750227.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 20:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214971

From: Divya Chellam <divya.chellam@windriver.com>

REXML is an XML toolkit for Ruby. The REXML gem before 3.3.6 has a DoS
vulnerability when it parses an XML that has many deep elements that have
same local name attributes. If you need to parse untrusted XMLs with tree
parser API like REXML::Document.new, you may be impacted to this vulnerability.
If you use other parser APIs such as stream parser API and SAX2 parser API,
this vulnerability is not affected. The REXML gem 3.3.6 or later include the
patch to fix the vulnerability.

Reference:
https://security-tracker.debian.org/tracker/CVE-2024-43398

Upstream-patch:
https://github.com/ruby/rexml/commit/7cb5eaeb221c322b9912f724183294d8ce96bae3

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ruby/ruby/CVE-2024-43398.patch            | 81 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-43398.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-43398.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-43398.patch
new file mode 100644
index 0000000000..02dc0a20be
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-43398.patch
@@ -0,0 +1,81 @@
+From 7cb5eaeb221c322b9912f724183294d8ce96bae3 Mon Sep 17 00:00:00 2001
+From: Sutou Kouhei <kou@clear-code.com>
+Date: Sat, 17 Aug 2024 17:45:52 +0900
+Subject: [PATCH] parser tree: improve namespace conflicted attribute check 
+ performance
+
+It was slow for deep element.
+
+Reported by l33thaxor. Thanks!!!
+
+The changes to the test folder files are not included in this patch
+because the test folder was not generated during the devtool source build.
+
+CVE: CVE-2024-43398
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/7cb5eaeb221c322b9912f724183294d8ce96bae3]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/element.rb     | 11 -----------
+ .../rexml-3.2.5/lib/rexml/parsers/baseparser.rb   | 15 +++++++++++++++
+ 2 files changed, 15 insertions(+), 11 deletions(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/element.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/element.rb
+index 4c21dbd..78e78c2 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/element.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/element.rb
+@@ -2388,17 +2388,6 @@ module REXML
+       elsif old_attr.kind_of? Hash
+         old_attr[value.prefix] = value
+       elsif old_attr.prefix != value.prefix
+-        # Check for conflicting namespaces
+-        if value.prefix != "xmlns" and old_attr.prefix != "xmlns"
+-          old_namespace = old_attr.namespace
+-          new_namespace = value.namespace
+-          if old_namespace == new_namespace
+-            raise ParseException.new(
+-                    "Namespace conflict in adding attribute \"#{value.name}\": "+
+-                    "Prefix \"#{old_attr.prefix}\" = \"#{old_namespace}\" and "+
+-                    "prefix \"#{value.prefix}\" = \"#{new_namespace}\"")
+-          end
+-        end
+         store value.name, {old_attr.prefix => old_attr,
+                            value.prefix    => value}
+       else
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index e32c7f4..154f2ac 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -634,6 +634,7 @@ module REXML
+ 
+       def parse_attributes(prefixes, curr_ns)
+         attributes = {}
++        expanded_names = {}
+         closed = false
+         match_data = @source.match(/^(.*?)(\/)?>/um, true)
+         if match_data.nil?
+@@ -641,6 +642,20 @@ module REXML
+           raise REXML::ParseException.new(message, @source)
+         end
+ 
++            unless prefix == "xmlns"
++              uri = @namespaces[prefix]
++              expanded_name = [uri, local_part]
++              existing_prefix = expanded_names[expanded_name]
++              if existing_prefix
++                message = "Namespace conflict in adding attribute " +
++                          "\"#{local_part}\": " +
++                          "Prefix \"#{existing_prefix}\" = \"#{uri}\" and " +
++                          "prefix \"#{prefix}\" = \"#{uri}\""
++                raise REXML::ParseException.new(message, @source, self)
++              end
++              expanded_names[expanded_name] = prefix
++            end
++
+         raw_attributes = match_data[1]
+         closed = !match_data[2].nil?
+         return attributes, closed if raw_attributes.nil?
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index 76e5ac81ed..ca061e7f70 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -48,6 +48,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2024-41946.patch \
            file://CVE-2025-27220.patch \
            file://CVE-2025-27219.patch \
+           file://CVE-2024-43398.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.43.0


