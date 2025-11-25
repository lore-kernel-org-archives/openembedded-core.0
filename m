Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D2BD0EE33
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 20:55:10 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4188.1764104105948894109
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 12:55:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gVsA8IAb;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-343774bd9b4so4537110a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 12:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764104105; x=1764708905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awthmEkyCKuPTWRCYTzIZirEYaZ+QUb6+XaRcQ5fv+E=;
        b=gVsA8IAb3cvFTNVfxn5THJYMiya+05yT6ttxAoHY8T/bZVX785Ti0bAReZNv39o6fo
         gNXSC9YsfAG0tnX5RABi5la+/9QgUTsTGsPSXCF6nyxeRrD0swlGB7p49UIWIGWKPQ31
         GT8X83mEK3+zAb/XSoCUzdeV/FXSfbNMgSOPhZoJVenPX2tat/D6phdUo0bj2k+MtiIV
         kHTEPefZ887rsCNKFjT8NxY9dACamtp8QLhdF6Ue9PedGV1yqJQtxPh3O0Wq6ieo6CaL
         ez3vFq5QJWSpOqCkj75Apv7kLGTS0n4uJjRUX3olmjSU4uT5j4DhPRvNDNplos2iQHvo
         +DHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764104105; x=1764708905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=awthmEkyCKuPTWRCYTzIZirEYaZ+QUb6+XaRcQ5fv+E=;
        b=jUnfcWJqjitmB3EOGY1iBFAIlQGht3dOJlwYczRKc8Vw+n65L0b9dlxnIgpG94lPa4
         JS7utbyri4OINDaso0EfX/bgSduW1y+9EWbX1OuolfbOCbgceDYyuQ/YYkQnwq/IA/iE
         YzbcniY6QtNCVKoYVP2NjIKMZEM3EdyfLkR08oboZh+i86uwyZMc0T4Ou4IZPlilli1d
         9m0MARy/437s2bK/iUYVXEB2WWQCg5GGSfawg28G5EtVBnXthSc2L7W2j7OCo9Vk/WZ5
         1MgpM7fvFb1WjyhuyW5Ted/zUfuyDA036DjHaqg2zhioONpDdt7ByW/EELFuSoRpT95U
         aDwQ==
X-Gm-Message-State: AOJu0Yy6IKYxi1B3BQAb4FJdNpkHz1ZRaac7wam74sDToy41EQjptEB1
	wIxe+JQfcUIt5l1oE7AZTwZOR7ERRm3MZ1b7YSpOJIhI/CAGFUeIt8O3rnPcwt6HAHv3N2PmciQ
	BsLaK
X-Gm-Gg: ASbGncvl144VB0O98dQdRKPuXgbzYhAiVIw9NWlwGobZRQMnrs80QvKeY8t1tJdXMS7
	SXIwHXKhicJPrYH+aGdo5k9j5D0ZWP/V7jHeAvuuBy2pRgsgCw4LaJz6oqNccTTPs3wlSdXOXv+
	QY5Xo9YbxVGjB/bxxotsKK5IHdnmbeTp8YZfBAKuTO9O29D0S/Jl+3jU/w8TYe/RmkKb/ZPwojB
	+JNWJG8BKQJstf9pN1aivsFEUjozzFCVfsmTMAhWUgnF6kMNTF3LfJF5B6bbXIbz91cnpFiohTJ
	bcOTGQI48JzmBXJLEgElt5ujJp8ZzqTvvh1J7sp8zlNkBF+RZ7siWJvFFzEyBa56jlROGymr+PP
	5gMTdIAY26PGcMAqwkjHhc+mDpmUO1H/S/uGTZ/73LVS4O9h2P9u0hXVsRGNd8jcAK/A+rCnHQp
	HEOw==
X-Google-Smtp-Source: AGHT+IGQ4FXJ72DcpdxQbp8pOStk/pDTafQYMazGdoI/l8JKEfJi8TwDIpf3CYWaxK852xkJKUi9vA==
X-Received: by 2002:a17:90b:2b50:b0:343:653d:31c with SMTP id 98e67ed59e1d1-34733e4cb69mr13690960a91.5.1764104104514;
        Tue, 25 Nov 2025 12:55:04 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a5a3099sm322602a91.11.2025.11.25.12.55.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:55:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/9] ruby: fix CVE-2024-39908
Date: Tue, 25 Nov 2025 12:54:46 -0800
Message-ID: <6e0b70843422cd7cdb25a9e1520dd64bf701fea6.1764103986.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764103986.git.steve@sakoman.com>
References: <cover.1764103986.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 20:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226778

From: Divya Chellam <divya.chellam@windriver.com>

REXML is an XML toolkit for Ruby. The REXML gem before 3.3.1 has some
DoS vulnerabilities when it parses an XML that has many specific characters
such as `<`, `0` and `%>`. If you need to parse untrusted XMLs, you many be
impacted to these vulnerabilities. The REXML gem 3.3.2 or later include the
patches to fix these vulnerabilities. Users are advised to upgrade. Users
unable to upgrade should avoid parsing untrusted XML strings.

Reference:
https://security-tracker.debian.org/tracker/CVE-2024-39908

Upstream-patches:
https://github.com/ruby/rexml/commit/f1df7d13b3e57a5e059273d2f0870163c08d7420
https://github.com/ruby/rexml/commit/d146162e9a61574499d10428bc0065754cd26601
https://github.com/ruby/rexml/commit/b5bf109a599ea733663150e99c09eb44046b41dd
https://github.com/ruby/rexml/commit/b8a5f4cd5c8fe29c65d7a00e67170223d9d2b50e
https://github.com/ruby/rexml/commit/0af55fa49d4c9369f90f239a9571edab800ed36e
https://github.com/ruby/rexml/commit/c1b64c174ec2e8ca2174c51332670e3be30c865f
https://github.com/ruby/rexml/commit/9f1415a2616c77cad44a176eee90e8457b4774b6
https://github.com/ruby/rexml/commit/c33ea498102be65082940e8b7d6d31cb2c6e6ee2
https://github.com/ruby/rexml/commit/a79ac8b4b42a9efabe33a0be31bd82d33fd50347
https://github.com/ruby/rexml/commit/67efb5951ed09dbb575c375b130a1e469f437d1f
https://github.com/ruby/rexml/commit/1f1e6e9b40bf339894e843dfd679c2fb1a5ddbf2
https://github.com/ruby/rexml/commit/910e5a2b487cb5a30989884a39f9cad2cc499cfc

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ruby/ruby/CVE-2024-39908-0001.patch       |  46 +++++++
 .../ruby/ruby/CVE-2024-39908-0002.patch       | 130 ++++++++++++++++++
 .../ruby/ruby/CVE-2024-39908-0003.patch       |  46 +++++++
 .../ruby/ruby/CVE-2024-39908-0004.patch       |  76 ++++++++++
 .../ruby/ruby/CVE-2024-39908-0005.patch       |  87 ++++++++++++
 .../ruby/ruby/CVE-2024-39908-0006.patch       |  44 ++++++
 .../ruby/ruby/CVE-2024-39908-0007.patch       |  44 ++++++
 .../ruby/ruby/CVE-2024-39908-0008.patch       |  44 ++++++
 .../ruby/ruby/CVE-2024-39908-0009.patch       |  36 +++++
 .../ruby/ruby/CVE-2024-39908-0010.patch       |  53 +++++++
 .../ruby/ruby/CVE-2024-39908-0011.patch       |  35 +++++
 .../ruby/ruby/CVE-2024-39908-0012.patch       |  36 +++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |  12 ++
 13 files changed, 689 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0001.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0002.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0003.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0004.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0005.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0006.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0007.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0008.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0009.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0010.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0011.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0012.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0001.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0001.patch
new file mode 100644
index 0000000000..44d3e1dffe
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0001.patch
@@ -0,0 +1,46 @@
+From f1df7d13b3e57a5e059273d2f0870163c08d7420 Mon Sep 17 00:00:00 2001
+From: Sutou Kouhei <kou@clear-code.com>
+Date: Mon, 20 May 2024 12:17:27 +0900
+Subject: [PATCH] Add support for old strscan
+
+Fix GH-132
+
+If we support old strscan, users can also use strscan installed as a
+default gem.
+
+Reported by Adam. Thanks!!!
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/f1df7d13b3e57a5e059273d2f0870163c08d7420]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .../gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb  | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index eab942d..8ea8b43 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -7,6 +7,17 @@ require "strscan"
+ 
+ module REXML
+   module Parsers
++    if StringScanner::Version < "3.0.8"
++      module StringScannerCaptures
++        refine StringScanner do
++          def captures
++            values_at(*(1...size))
++          end
++        end
++      end
++      using StringScannerCaptures
++    end
++
+     # = Using the Pull Parser
+     # <em>This API is experimental, and subject to change.</em>
+     #  parser = PullParser.new( "<a>text<b att='val'/>txet</a>" )
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0002.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0002.patch
new file mode 100644
index 0000000000..25a9e70891
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0002.patch
@@ -0,0 +1,130 @@
+From d146162e9a61574499d10428bc0065754cd26601 Mon Sep 17 00:00:00 2001
+From: NAITOH Jun <naitoh@gmail.com>
+Date: Mon, 4 Mar 2024 05:24:53 +0900
+Subject: [PATCH] Remove `Source#string=` method (#117)
+
+We want to just change scan pointer.
+
+https://github.com/ruby/rexml/pull/114#discussion_r1501773803
+> I want to just change scan pointer (`StringScanner#pos=`) instead of
+changing `@scanner.string`.
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/d146162e9a61574499d10428bc0065754cd26601]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .../lib/rexml/parsers/baseparser.rb           | 19 +++++++++++--------
+ .bundle/gems/rexml-3.2.5/lib/rexml/source.rb  |  8 ++++++--
+ 2 files changed, 17 insertions(+), 10 deletions(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 8ea8b43..81415a8 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -231,8 +231,9 @@ module REXML
+         #STDERR.puts @source.encoding
+         #STDERR.puts "BUFFER = #{@source.buffer.inspect}"
+         if @document_status == nil
++          start_position = @source.position
+           if @source.match("<?", true)
+-            return process_instruction
++            return process_instruction(start_position)
+           elsif @source.match("<!", true)
+             if @source.match("--", true)
+               return [ :comment, @source.match(/(.*?)-->/um, true)[1] ]
+@@ -244,7 +245,7 @@ module REXML
+                 else
+                   message = "#{base_error_message}: invalid name"
+                 end
+-                @source.string = "<!DOCTYPE" + @source.buffer
++                @source.position = start_position
+                 raise REXML::ParseException.new(message, @source)
+               end
+               name = parse_name(base_error_message)
+@@ -285,6 +286,7 @@ module REXML
+         end
+         if @document_status == :in_doctype
+           @source.match(/\s*/um, true) # skip spaces
++          start_position = @source.position
+           if @source.match("<!", true)
+             if @source.match("ELEMENT", true)
+               md = @source.match(/(.*?)>/um, true)
+@@ -344,7 +346,7 @@ module REXML
+                 else
+                   message = "#{base_error_message}: invalid name"
+                 end
+-                @source.string = " <!NOTATION" + @source.buffer
++                @source.position = start_position
+                 raise REXML::ParseException.new(message, @source)
+               end
+               name = parse_name(base_error_message)
+@@ -374,6 +376,7 @@ module REXML
+           @source.match(/\s*/um, true)
+         end
+         begin
++          start_position = @source.position
+           if @source.match("<", true)
+             if @source.match("/", true)
+               @namespaces_restore_stack.pop
+@@ -386,7 +389,7 @@ module REXML
+               if md.nil? or last_tag != md[1]
+                 message = "Missing end tag for '#{last_tag}'"
+                 message += " (got '#{md[1]}')" if md
+-                @source.string = "</" + @source.buffer if md.nil?
++                @source.position = start_position if md.nil?
+                 raise REXML::ParseException.new(message, @source)
+               end
+               return [ :end_element, last_tag ]
+@@ -410,12 +413,12 @@ module REXML
+               raise REXML::ParseException.new( "Declarations can only occur "+
+                 "in the doctype declaration.", @source)
+             elsif @source.match("?", true)
+-              return process_instruction
++              return process_instruction(start_position)
+             else
+               # Get the next tag
+               md = @source.match(TAG_PATTERN, true)
+               unless md
+-                @source.string = "<" + @source.buffer
++                @source.position = start_position
+                 raise REXML::ParseException.new("malformed XML: missing tag start", @source)
+               end
+               tag = md[1]
+@@ -641,11 +644,11 @@ module REXML
+         end
+       end
+ 
+-      def process_instruction
++      def process_instruction(start_position)
+         match_data = @source.match(INSTRUCTION_END, true)
+         unless match_data
+           message = "Invalid processing instruction node"
+-          @source.string = "<?" + @source.buffer
++          @source.position = start_position
+           raise REXML::ParseException.new(message, @source)
+         end
+         if @document_status.nil? and match_data[1] == "xml"
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
+index 7132147..b20cc4f 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
+@@ -80,8 +80,12 @@ module REXML
+       end
+     end
+ 
+-    def string=(string)
+-      @scanner.string = string
++    def position
++      @scanner.pos
++    end
++
++    def position=(pos)
++      @scanner.pos = pos
+     end
+ 
+     # @return true if the Source is exhausted
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0003.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0003.patch
new file mode 100644
index 0000000000..4208555c3c
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0003.patch
@@ -0,0 +1,46 @@
+From b5bf109a599ea733663150e99c09eb44046b41dd Mon Sep 17 00:00:00 2001
+From: Hiroya Fujinami <make.just.on@gmail.com>
+Date: Thu, 13 Jun 2024 15:12:32 +0900
+Subject: [PATCH] Add a "malformed comment" check for top-level comments (#145)
+
+This check was missing. Therefore, `REXML::Document.new("<!--")` raised
+the ``undefined method `[]' for nil`` error, for example.
+
+This PR also adds tests for "malformed comment" checks.
+
+---------
+
+Co-authored-by: Sutou Kouhei <kou@cozmixng.org>
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/b5bf109a599ea733663150e99c09eb44046b41dd]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 81415a8..49c313c 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -236,7 +236,14 @@ module REXML
+             return process_instruction(start_position)
+           elsif @source.match("<!", true)
+             if @source.match("--", true)
+-              return [ :comment, @source.match(/(.*?)-->/um, true)[1] ]
++              md = @source.match(/(.*?)-->/um, true)
++              if md.nil?
++                raise REXML::ParseException.new("Unclosed comment", @source)
++              end
++              if /--|-\z/.match?(md[1])
++                raise REXML::ParseException.new("Malformed comment", @source)
++              end
++              return [ :comment, md[1] ]
+             elsif @source.match("DOCTYPE", true)
+               base_error_message = "Malformed DOCTYPE"
+               unless @source.match(/\s+/um, true)
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0004.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0004.patch
new file mode 100644
index 0000000000..11a4c1ca54
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0004.patch
@@ -0,0 +1,76 @@
+From b8a5f4cd5c8fe29c65d7a00e67170223d9d2b50e Mon Sep 17 00:00:00 2001
+From: Watson <watson1978@gmail.com>
+Date: Tue, 16 Jul 2024 10:48:53 +0900
+Subject: [PATCH] Fix performance issue caused by using repeated `>` characters
+  inside `<?xml` (#170)
+
+A `<` is treated as a string delimiter.
+In certain cases, if `<` is used in succession, read and match are
+repeated, which slows down the process. Therefore, the following is used
+to read ahead to a specific part of the string in advance.
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/b8a5f4cd5c8fe29c65d7a00e67170223d9d2b50e]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 3 ++-
+ .bundle/gems/rexml-3.2.5/lib/rexml/source.rb             | 6 +++---
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 49c313c..767e134 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -125,6 +125,7 @@ module REXML
+ 
+       module Private
+         INSTRUCTION_END = /#{NAME}(\s+.*?)?\?>/um
++        INSTRUCTION_TERM = "?>"
+         TAG_PATTERN = /((?>#{QNAME_STR}))\s*/um
+         CLOSE_PATTERN = /(#{QNAME_STR})\s*>/um
+         ATTLISTDECL_END = /\s+#{NAME}(?:#{ATTDEF})*\s*>/um
+@@ -652,7 +653,7 @@ module REXML
+       end
+ 
+       def process_instruction(start_position)
+-        match_data = @source.match(INSTRUCTION_END, true)
++        match_data = @source.match(Private::INSTRUCTION_END, true, term: Private::INSTRUCTION_TERM)
+         unless match_data
+           message = "Invalid processing instruction node"
+           @source.position = start_position
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
+index b20cc4f..08a035c 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
+@@ -72,7 +72,7 @@ module REXML
+       @scanner.scan_until(Regexp.union(term)) or @scanner.rest
+     end
+ 
+-    def match(pattern, cons=false)
++    def match(pattern, cons=false, term: nil)
+       if cons
+         @scanner.scan(pattern).nil? ? nil : @scanner
+       else
+@@ -184,7 +184,7 @@ module REXML
+       end
+     end
+ 
+-    def match( pattern, cons=false )
++    def match( pattern, cons=false, term: nil )
+       read if @scanner.eos? && @source
+       while true
+         if cons
+@@ -195,7 +195,7 @@ module REXML
+         break if md
+         return nil if pattern.is_a?(String) && pattern.bytesize <= @scanner.rest_size
+         return nil if @source.nil?
+-        return nil unless read
++        return nil unless read(term)
+       end
+ 
+       md.nil? ? nil : @scanner
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0005.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0005.patch
new file mode 100644
index 0000000000..0726927865
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0005.patch
@@ -0,0 +1,87 @@
+From 0af55fa49d4c9369f90f239a9571edab800ed36e Mon Sep 17 00:00:00 2001
+From: Watson <watson1978@gmail.com>
+Date: Tue, 16 Jul 2024 10:57:39 +0900
+Subject: [PATCH] Fix ReDoS caused by very large character references using
+ repeated 0s (#169)
+
+This patch will fix the ReDoS that is caused by large string of 0s on a
+character reference (like `&#00000000...`).
+
+This is occurred in Ruby 3.1 or earlier.
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/0af55fa49d4c9369f90f239a9571edab800ed36e]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/text.rb | 48 +++++++++++++++-------
+ 1 file changed, 34 insertions(+), 14 deletions(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/text.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/text.rb
+index 050b09c..0957d70 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/text.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/text.rb
+@@ -151,25 +151,45 @@ module REXML
+         end
+       end
+ 
+-      # context sensitive
+-      string.scan(pattern) do
+-        if $1[-1] != ?;
+-          raise "Illegal character #{$1.inspect} in raw string #{string.inspect}"
+-        elsif $1[0] == ?&
+-          if $5 and $5[0] == ?#
+-            case ($5[1] == ?x ? $5[2..-1].to_i(16) : $5[1..-1].to_i)
+-            when *VALID_CHAR
++      pos = 0
++      while (index = string.index(/<|&/, pos))
++        if string[index] == "<"
++          raise "Illegal character \"#{string[index]}\" in raw string #{string.inspect}"
++        end
++
++        unless (end_index = string.index(/[^\s];/, index + 1))
++          raise "Illegal character \"#{string[index]}\" in raw string #{string.inspect}"
++        end
++
++        value = string[(index + 1)..end_index]
++        if /\s/.match?(value)
++          raise "Illegal character \"#{string[index]}\" in raw string #{string.inspect}"
++        end
++
++        if value[0] == "#"
++          character_reference = value[1..-1]
++
++          unless (/\A(\d+|x[0-9a-fA-F]+)\z/.match?(character_reference))
++            if character_reference[0] == "x" || character_reference[-1] == "x"
++              raise "Illegal character \"#{string[index]}\" in raw string #{string.inspect}"
+             else
+-              raise "Illegal character #{$1.inspect} in raw string #{string.inspect}"
++              raise "Illegal character #{string.inspect} in raw string #{string.inspect}"
+             end
+-          # FIXME: below can't work but this needs API change.
+-          # elsif @parent and $3 and !SUBSTITUTES.include?($1)
+-          #   if !doctype or !doctype.entities.has_key?($3)
+-          #     raise "Undeclared entity '#{$1}' in raw string \"#{string}\""
+-          #   end
+           end
++
++          case (character_reference[0] == "x" ? character_reference[1..-1].to_i(16) : character_reference[0..-1].to_i)
++          when *VALID_CHAR
++          else
++            raise "Illegal character #{string.inspect} in raw string #{string.inspect}"
++          end
++        elsif !(/\A#{Entity::NAME}\z/um.match?(value))
++          raise "Illegal character \"#{string[index]}\" in raw string #{string.inspect}"
+         end
++
++        pos = end_index + 1
+       end
++
++      string
+     end
+ 
+     def node_type
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0006.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0006.patch
new file mode 100644
index 0000000000..9d78112edd
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0006.patch
@@ -0,0 +1,44 @@
+From c1b64c174ec2e8ca2174c51332670e3be30c865f Mon Sep 17 00:00:00 2001
+From: Watson <watson1978@gmail.com>
+Date: Tue, 16 Jul 2024 10:57:50 +0900
+Subject: [PATCH] Fix performance issue caused by using repeated `>` characters
+ inside comments (#171)
+
+A `<` is treated as a string delimiter.
+In certain cases, if `<` is used in succession, read and match are
+repeated, which slows down the process. Therefore, the following is used
+to read ahead to a specific part of the string in advance.
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/c1b64c174ec2e8ca2174c51332670e3be30c865f]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 767e134..81753ad 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -126,6 +126,7 @@ module REXML
+       module Private
+         INSTRUCTION_END = /#{NAME}(\s+.*?)?\?>/um
+         INSTRUCTION_TERM = "?>"
++        COMMENT_TERM = "-->"
+         TAG_PATTERN = /((?>#{QNAME_STR}))\s*/um
+         CLOSE_PATTERN = /(#{QNAME_STR})\s*>/um
+         ATTLISTDECL_END = /\s+#{NAME}(?:#{ATTDEF})*\s*>/um
+@@ -237,7 +238,7 @@ module REXML
+             return process_instruction(start_position)
+           elsif @source.match("<!", true)
+             if @source.match("--", true)
+-              md = @source.match(/(.*?)-->/um, true)
++              md = @source.match(/(.*?)-->/um, true, term: Private::COMMENT_TERM)
+               if md.nil?
+                 raise REXML::ParseException.new("Unclosed comment", @source)
+               end
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0007.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0007.patch
new file mode 100644
index 0000000000..bb2325bbbd
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0007.patch
@@ -0,0 +1,44 @@
+From 9f1415a2616c77cad44a176eee90e8457b4774b6 Mon Sep 17 00:00:00 2001
+From: Watson <watson1978@gmail.com>
+Date: Tue, 16 Jul 2024 11:04:40 +0900
+Subject: [PATCH] Fix performance issue caused by using repeated `>` characters
+ inside `CDATA [ PAYLOAD ]` (#172)
+
+A `<` is treated as a string delimiter.
+In certain cases, if `<` is used in succession, read and match are
+repeated, which slows down the process. Therefore, the following is used
+to read ahead to a specific part of the string in advance.
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/9f1415a2616c77cad44a176eee90e8457b4774b6]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 81753ad..c907f8c 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -127,6 +127,7 @@ module REXML
+         INSTRUCTION_END = /#{NAME}(\s+.*?)?\?>/um
+         INSTRUCTION_TERM = "?>"
+         COMMENT_TERM = "-->"
++        CDATA_TERM = "]]>"
+         TAG_PATTERN = /((?>#{QNAME_STR}))\s*/um
+         CLOSE_PATTERN = /(#{QNAME_STR})\s*>/um
+         ATTLISTDECL_END = /\s+#{NAME}(?:#{ATTDEF})*\s*>/um
+@@ -416,7 +417,7 @@ module REXML
+ 
+                 return [ :comment, md[1] ] if md
+               else
+-                md = @source.match(/\[CDATA\[(.*?)\]\]>/um, true)
++                md = @source.match(/\[CDATA\[(.*?)\]\]>/um, true, term: Private::CDATA_TERM)
+                 return [ :cdata, md[1] ] if md
+               end
+               raise REXML::ParseException.new( "Declarations can only occur "+
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0008.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0008.patch
new file mode 100644
index 0000000000..e9413ba2c0
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0008.patch
@@ -0,0 +1,44 @@
+From c33ea498102be65082940e8b7d6d31cb2c6e6ee2 Mon Sep 17 00:00:00 2001
+From: Watson <watson1978@gmail.com>
+Date: Tue, 16 Jul 2024 11:11:17 +0900
+Subject: [PATCH] Fix performance issue caused by using repeated `>` characters
+ after ` <!DOCTYPE name` (#173)
+
+A `<` is treated as a string delimiter.
+In certain cases, if `<` is used in succession, read and match are
+repeated, which slows down the process. Therefore, the following is used
+to read ahead to a specific part of the string in advance.
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/c33ea498102be65082940e8b7d6d31cb2c6e6ee2]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index c907f8c..5391e0a 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -128,6 +128,7 @@ module REXML
+         INSTRUCTION_TERM = "?>"
+         COMMENT_TERM = "-->"
+         CDATA_TERM = "]]>"
++        DOCTYPE_TERM = "]>"
+         TAG_PATTERN = /((?>#{QNAME_STR}))\s*/um
+         CLOSE_PATTERN = /(#{QNAME_STR})\s*>/um
+         ATTLISTDECL_END = /\s+#{NAME}(?:#{ATTDEF})*\s*>/um
+@@ -375,7 +376,7 @@ module REXML
+               end
+               return [ :comment, md[1] ] if md
+             end
+-          elsif match = @source.match(/(%.*?;)\s*/um, true)
++          elsif match = @source.match(/(%.*?;)\s*/um, true, term: Private::DOCTYPE_TERM)
+             return [ :externalentity, match[1] ]
+           elsif @source.match(/\]\s*>/um, true)
+             @document_status = :after_doctype
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0009.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0009.patch
new file mode 100644
index 0000000000..1de0551879
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0009.patch
@@ -0,0 +1,36 @@
+From a79ac8b4b42a9efabe33a0be31bd82d33fd50347 Mon Sep 17 00:00:00 2001
+From: Watson <watson1978@gmail.com>
+Date: Tue, 16 Jul 2024 11:18:11 +0900
+Subject: [PATCH] Fix performance issue caused by using repeated `>` characters
+ inside `<!DOCTYPE root [<!-- PAYLOAD -->]>` (#174)
+
+A `<` is treated as a string delimiter.
+In certain cases, if `<` is used in succession, read and match are
+repeated, which slows down the process. Therefore, the following is used
+to read ahead to a specific part of the string in advance.
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/a79ac8b4b42a9efabe33a0be31bd82d33fd50347]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 5391e0a..c22b632 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -369,7 +369,7 @@ module REXML
+                 raise REXML::ParseException.new(message, @source)
+               end
+               return [:notationdecl, name, *id]
+-            elsif md = @source.match(/--(.*?)-->/um, true)
++            elsif md = @source.match(/--(.*?)-->/um, true, term: Private::COMMENT_TERM)
+               case md[1]
+               when /--/, /-\z/
+                 raise REXML::ParseException.new("Malformed comment", @source)
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0010.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0010.patch
new file mode 100644
index 0000000000..a46ba171de
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0010.patch
@@ -0,0 +1,53 @@
+From 67efb5951ed09dbb575c375b130a1e469f437d1f Mon Sep 17 00:00:00 2001
+From: Watson <watson1978@gmail.com>
+Date: Tue, 16 Jul 2024 11:26:57 +0900
+Subject: [PATCH] Fix performance issue caused by using repeated `>` characters
+ inside `<!DOCTYPE name [<!ENTITY>]>` (#175)
+
+A `<` is treated as a string delimiter.
+In certain cases, if `<` is used in succession, read and match are
+repeated, which slows down the process. Therefore, the following is used
+to read ahead to a specific part of the string in advance.
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/67efb5951ed09dbb575c375b130a1e469f437d1f]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index c22b632..c4de254 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -124,11 +124,15 @@ module REXML
+       }
+ 
+       module Private
+-        INSTRUCTION_END = /#{NAME}(\s+.*?)?\?>/um
++        # Terminal requires two or more letters.
+         INSTRUCTION_TERM = "?>"
+         COMMENT_TERM = "-->"
+         CDATA_TERM = "]]>"
+         DOCTYPE_TERM = "]>"
++        # Read to the end of DOCTYPE because there is no proper ENTITY termination
++        ENTITY_TERM = DOCTYPE_TERM
++
++        INSTRUCTION_END = /#{NAME}(\s+.*?)?\?>/um
+         TAG_PATTERN = /((?>#{QNAME_STR}))\s*/um
+         CLOSE_PATTERN = /(#{QNAME_STR})\s*>/um
+         ATTLISTDECL_END = /\s+#{NAME}(?:#{ATTDEF})*\s*>/um
+@@ -304,7 +308,7 @@ module REXML
+               raise REXML::ParseException.new( "Bad ELEMENT declaration!", @source ) if md.nil?
+               return [ :elementdecl, "<!ELEMENT" + md[1] ]
+             elsif @source.match("ENTITY", true)
+-              match = [:entitydecl, *@source.match(ENTITYDECL_PATTERN, true).captures.compact]
++              match = [:entitydecl, *@source.match(Private::ENTITYDECL_PATTERN, true, term: Private::ENTITY_TERM).captures.compact]
+               ref = false
+               if match[1] == '%'
+                 ref = true
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0011.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0011.patch
new file mode 100644
index 0000000000..505007af9a
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0011.patch
@@ -0,0 +1,35 @@
+From 1f1e6e9b40bf339894e843dfd679c2fb1a5ddbf2 Mon Sep 17 00:00:00 2001
+From: Watson <watson1978@gmail.com>
+Date: Tue, 16 Jul 2024 11:35:41 +0900
+Subject: [PATCH] Fix ReDoS by using repeated space characters inside
+ `<!DOCTYPE name [<!ATTLIST>]>` (#176)
+
+Fix performance by removing unnecessary spaces.
+
+This is occurred in Ruby 3.1 or earlier.
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/1f1e6e9b40bf339894e843dfd679c2fb1a5ddbf2]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index c4de254..a9b1b44 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -340,7 +340,7 @@ module REXML
+               contents = md[0]
+ 
+               pairs = {}
+-              values = md[0].scan( ATTDEF_RE )
++              values = md[0].strip.scan( ATTDEF_RE )
+               values.each do |attdef|
+                 unless attdef[3] == "#IMPLIED"
+                   attdef.compact!
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0012.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0012.patch
new file mode 100644
index 0000000000..5a7cbe18dc
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0012.patch
@@ -0,0 +1,36 @@
+From 910e5a2b487cb5a30989884a39f9cad2cc499cfc Mon Sep 17 00:00:00 2001
+From: Watson <watson1978@gmail.com>
+Date: Tue, 16 Jul 2024 11:36:05 +0900
+Subject: [PATCH] Fix performance issue caused by using repeated `>` characters
+ inside `<xml><!-- --></xml>` (#177)
+
+A `<` is treated as a string delimiter.
+In certain cases, if `<` is used in succession, read and match are
+repeated, which slows down the process. Therefore, the following is used
+to read ahead to a specific part of the string in advance.
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/910e5a2b487cb5a30989884a39f9cad2cc499cfc]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index a9b1b44..4864ba1 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -413,7 +413,7 @@ module REXML
+               #STDERR.puts "SOURCE BUFFER = #{source.buffer}, #{source.buffer.size}"
+               raise REXML::ParseException.new("Malformed node", @source) unless md
+               if md[0][0] == ?-
+-                md = @source.match(/--(.*?)-->/um, true)
++                md = @source.match(/--(.*?)-->/um, true, term: Private::COMMENT_TERM)
+ 
+                 case md[1]
+                 when /--/, /-\z/
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index 6a381b2e40..f967cc6948 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -54,6 +54,18 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2025-27221-0001.patch \
            file://CVE-2025-27221-0002.patch \
            file://CVE-2024-35176.patch \
+           file://CVE-2024-39908-0001.patch \
+           file://CVE-2024-39908-0002.patch \
+           file://CVE-2024-39908-0003.patch \
+           file://CVE-2024-39908-0004.patch \
+           file://CVE-2024-39908-0005.patch \
+           file://CVE-2024-39908-0006.patch \
+           file://CVE-2024-39908-0007.patch \
+           file://CVE-2024-39908-0008.patch \
+           file://CVE-2024-39908-0009.patch \
+           file://CVE-2024-39908-0010.patch \
+           file://CVE-2024-39908-0011.patch \
+           file://CVE-2024-39908-0012.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.43.0


