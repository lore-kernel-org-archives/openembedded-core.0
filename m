Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC99C87FD2
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 20:05:02 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.66854.1753646700653610313
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 13:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NY1qD5BU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23ffdea3575so4095065ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 13:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753646700; x=1754251500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/SR+fVUL5i+MYHMYPSpCamPGTufRv6UaPqwzMT5a4xI=;
        b=NY1qD5BUGi08rqu+VaSVLJGMR71XqlsAQkuDVW1qMd4z43sQcodf0jzWgurLECewQW
         2WK+2Srnh9YsdjMHjRL7mhn1duOaUZqh8GmT87If+cT3joivZSHNn99ZFoZ5BAIO9Bup
         ugKk7TEycTt2jWAne/0Xf/HZthFVUJo2NVQFW6XGmN5AotAq1k9x9CNstvyXNRZ4c013
         UCi+hpOOAjkvJFmC4HSSyWL6hbnfkEjoFKTAfJBzTHfu0qz1EzaAjeZtdLj9ZZLLcTxR
         aCNS1r0woV1pKP/Mr/KzRqiinjYni3EpwfbcGIMKVVZd3f3OJlFpKP9X8gkZaF56uTBp
         uTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753646700; x=1754251500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SR+fVUL5i+MYHMYPSpCamPGTufRv6UaPqwzMT5a4xI=;
        b=JCMgR1yWyDQG2klxRrYE1YGBTHgjFR8LZdHaeuwI1911ol+U6o6KtVWRYyh8rHzrOP
         00pApfusXObNl5LLVe2e6yKFrPZcfbVeoonS3GDtTjHg+zNx7hlJdcJtMtTucQcdY7OI
         6tkGkMGL6iptFr0MbNqeoRgH92HaFkRRHdDPcuMbWoyocvxxC42DRgjQExZl4a8b1eNi
         w80GGMMC/4WEyW2H9c4gplFbuhVeSmMS5I93GDPqKv+u7/8bjwcMjw5dlQjwrUulAE+r
         iCNSFU4JT3tMdLUru6cNZcOahEtiMwUqQhzS9LSHiwhf6Y9P6goso1NOEbmxM7ODAWfg
         l82A==
X-Gm-Message-State: AOJu0YzUK+mwn4efwmlI2tvmz+wQawL5iNWtQHcZFU0vroQNKJL5MAce
	drXVAoeTtNbFD+qLVOsNwgbTe7Z1R3DEXcxEwnaFDRepGh8I3gQQ4G+CxsgPUGBm68upzMkjNpr
	ks01DyKY=
X-Gm-Gg: ASbGncsR5kqprTkHKGtzXHELW6sV5wsOtGTywjtj1YvyNeCyykv7IHUQwU0NmANvp5r
	DSRhiekXlwmzEcFtUC6yksOro3WYwq+2y3qX1hHbWOUxAL9fYRZXP5SOxiZ2C8cI+T1LmORVMjs
	NGU6Rb+U3BeVgb06g8uLU6unQlAcr3dPYTHbL0u/Aw2rQup6xymr3uerjBSASFGfhOowHqupxac
	5q0rZ9cAHn/6ezlTgSm4/EPSezWlqvwIT3XpTqGWJgDQ49SY1ZmBOub7SfFO0uesErSCl384qQx
	EacQThFI/RPpTgQl2RM8dzRWLfj92129yvS6W3mFrOOewhiqD7ndgz78RW2x3/8Fk3Rkno+DSDL
	Vy22Vvpq+AkjbqNkGvu020pkl
X-Google-Smtp-Source: AGHT+IFCRNTuNRbFHosd11pGKtXnFb2fFh/DdsZO0+CdQHHPv2Rag6MrFBhDWVWT34Xtj6FZOgUx8g==
X-Received: by 2002:a17:902:ccc4:b0:23d:dd04:28d4 with SMTP id d9443c01a7336-23fb3165099mr147933515ad.43.1753646699480;
        Sun, 27 Jul 2025 13:04:59 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:22e3:7abf:ace0:e5ff])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe512ef7sm38905665ad.131.2025.07.27.13.04.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 13:04:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/10] ruby: correct fix for CVE-2024-43398
Date: Sun, 27 Jul 2025 13:04:38 -0700
Message-ID: <6bf00fde2d4043c6b558733a33041ce5694342d3.1753646578.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753646578.git.steve@sakoman.com>
References: <cover.1753646578.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 20:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220977

From: Rob Woolley <rob.woolley@windriver.com>

The previous fix for CVE-2024-43398 did not include patches
to provide context for the changes it made.

This caused an exception at run-time when ruby parsed
rexml/parsers/baseparser.rb. This was first observed when using
ruby-native to build the sdformat recipe.

With these additional backports, the sdformat build proceeds
successfully. The REXML library was also tested manually on-target
with a script that used REXML::Document.new file to parse an
XML file.

Signed-off-by: Rob Woolley <rob.woolley@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ruby/ruby/CVE-2024-43398-0001.patch       | 212 ++++++++++++++++++
 .../ruby/ruby/CVE-2024-43398-0002.patch       | 130 +++++++++++
 ...-43398.patch => CVE-2024-43398-0003.patch} |  23 +-
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |   4 +-
 4 files changed, 355 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0001.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0002.patch
 rename meta/recipes-devtools/ruby/ruby/{CVE-2024-43398.patch => CVE-2024-43398-0003.patch} (87%)

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0001.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0001.patch
new file mode 100644
index 0000000000..6c4869bc8c
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0001.patch
@@ -0,0 +1,212 @@
+From 0496940d5998ccbc50d16fb734993ab50fc60c2d Mon Sep 17 00:00:00 2001
+From: NAITOH Jun <naitoh@gmail.com>
+Date: Mon, 18 Mar 2024 23:30:47 +0900
+Subject: [PATCH]  Optimize the parse_attributes method to use `Source#match`
+ to parse XML.  (#119)
+
+## Why?
+
+Improve maintainability by consolidating processing into `Source#match`.
+
+## Benchmark
+```
+RUBYLIB= BUNDLER_ORIG_RUBYLIB= /Users/naitoh/.rbenv/versions/3.3.0/bin/ruby -v -S benchmark-driver /Users/naitoh/ghq/github.com/naitoh/rexml/benchmark/parse.yaml
+ruby 3.3.0 (2023-12-25 revision 5124f9ac75) [arm64-darwin22]
+Calculating -------------------------------------
+                         before       after  before(YJIT)  after(YJIT)
+                 dom     10.891      10.622        16.356       17.403 i/s -     100.000 times in 9.182130s 9.414177s 6.113806s 5.746133s
+                 sax     30.335      29.845        49.749       54.877 i/s -     100.000 times in 3.296483s 3.350595s 2.010071s 1.822259s
+                pull     35.514      34.801        61.123       66.908 i/s -     100.000 times in 2.815793s 2.873484s 1.636041s 1.494591s
+              stream     35.141      34.475        52.110       56.836 i/s -     100.000 times in 2.845646s 2.900638s 1.919017s 1.759456s
+
+Comparison:
+                              dom
+         after(YJIT):        17.4 i/s
+        before(YJIT):        16.4 i/s - 1.06x  slower
+              before:        10.9 i/s - 1.60x  slower
+               after:        10.6 i/s - 1.64x  slower
+
+                              sax
+         after(YJIT):        54.9 i/s
+        before(YJIT):        49.7 i/s - 1.10x  slower
+              before:        30.3 i/s - 1.81x  slower
+               after:        29.8 i/s - 1.84x  slower
+
+                             pull
+         after(YJIT):        66.9 i/s
+        before(YJIT):        61.1 i/s - 1.09x  slower
+              before:        35.5 i/s - 1.88x  slower
+               after:        34.8 i/s - 1.92x  slower
+
+                           stream
+         after(YJIT):        56.8 i/s
+        before(YJIT):        52.1 i/s - 1.09x  slower
+              before:        35.1 i/s - 1.62x  slower
+               after:        34.5 i/s - 1.65x  slower
+
+```
+
+- YJIT=ON : 1.06x - 1.10x faster
+- YJIT=OFF : 0.97x - 0.98x faster
+
+CVE: CVE-2024-43398
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/0496940d5998ccbc50d16fb734993ab50fc60c2d]
+
+Signed-off-by: Rob Woolley <rob.woolley@windriver.com>
+---
+ lib/rexml/parsers/baseparser.rb | 116 ++++++++++++--------------------
+ test/parse/test_element.rb      |   4 +-
+ test/test_core.rb               |  20 +++++-
+ 3 files changed, 64 insertions(+), 76 deletions(-)
+
+Index: ruby-3.1.3/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+===================================================================
+--- ruby-3.1.3.orig/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ ruby-3.1.3/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -114,7 +114,7 @@ module REXML
+
+       module Private
+         INSTRUCTION_END = /#{NAME}(\s+.*?)?\?>/um
+-        TAG_PATTERN = /((?>#{QNAME_STR}))/um
++        TAG_PATTERN = /((?>#{QNAME_STR}))\s*/um
+         CLOSE_PATTERN = /(#{QNAME_STR})\s*>/um
+         ATTLISTDECL_END = /\s+#{NAME}(?:#{ATTDEF})*\s*>/um
+         NAME_PATTERN = /\s*#{NAME}/um
+@@ -136,7 +136,6 @@ module REXML
+         self.stream = source
+         @listeners = []
+         @entity_expansion_count = 0
+-        @attributes_scanner = StringScanner.new('')
+       end
+
+       def add_listener( listener )
+@@ -635,86 +634,60 @@ module REXML
+       def parse_attributes(prefixes, curr_ns)
+         attributes = {}
+         closed = false
+-        match_data = @source.match(/^(.*?)(\/)?>/um, true)
+-        if match_data.nil?
+-          message = "Start tag isn't ended"
+-          raise REXML::ParseException.new(message, @source)
+-        end
++        while true
++          if @source.match(">", true)
++            return attributes, closed
++          elsif @source.match("/>", true)
++            closed = true
++            return attributes, closed
++          elsif match = @source.match(QNAME, true)
++            name = match[1]
++            prefix = match[2]
++            local_part = match[3]
+
+-        raw_attributes = match_data[1]
+-        closed = !match_data[2].nil?
+-        return attributes, closed if raw_attributes.nil?
+-        return attributes, closed if raw_attributes.empty?
+-
+-        @attributes_scanner.string = raw_attributes
+-        scanner = @attributes_scanner
+-        until scanner.eos?
+-          if scanner.scan(/\s+/)
+-            break if scanner.eos?
+-          end
+-
+-          pos = scanner.pos
+-          while true
+-            break if scanner.scan(ATTRIBUTE_PATTERN)
+-            unless scanner.scan(QNAME)
+-              message = "Invalid attribute name: <#{scanner.rest}>"
+-              raise REXML::ParseException.new(message, @source)
+-            end
+-            name = scanner[0]
+-            unless scanner.scan(/\s*=\s*/um)
++            unless @source.match(/\s*=\s*/um, true)
+               message = "Missing attribute equal: <#{name}>"
+               raise REXML::ParseException.new(message, @source)
+             end
+-            quote = scanner.scan(/['"]/)
+-            unless quote
+-              message = "Missing attribute value start quote: <#{name}>"
+-              raise REXML::ParseException.new(message, @source)
+-            end
+-            unless scanner.scan(/.*#{Regexp.escape(quote)}/um)
+-              match_data = @source.match(/^(.*?)(\/)?>/um, true)
+-              if match_data
+-                scanner << "/" if closed
+-                scanner << ">"
+-                scanner << match_data[1]
+-                scanner.pos = pos
+-                closed = !match_data[2].nil?
+-                next
++            unless match = @source.match(/(['"])(.*?)\1\s*/um, true)
++              if match = @source.match(/(['"])/, true)
++                message =
++                  "Missing attribute value end quote: <#{name}>: <#{match[1]}>"
++                raise REXML::ParseException.new(message, @source)
++              else
++                message = "Missing attribute value start quote: <#{name}>"
++                raise REXML::ParseException.new(message, @source)
+               end
+-              message =
+-                "Missing attribute value end quote: <#{name}>: <#{quote}>"
+-              raise REXML::ParseException.new(message, @source)
+             end
+-          end
+-          name = scanner[1]
+-          prefix = scanner[2]
+-          local_part = scanner[3]
+-          # quote = scanner[4]
+-          value = scanner[5]
+-          if prefix == "xmlns"
+-            if local_part == "xml"
+-              if value != "http://www.w3.org/XML/1998/namespace"
+-                msg = "The 'xml' prefix must not be bound to any other namespace "+
++            value = match[2]
++            if prefix == "xmlns"
++              if local_part == "xml"
++                if value != "http://www.w3.org/XML/1998/namespace"
++                  msg = "The 'xml' prefix must not be bound to any other namespace "+
++                    "(http://www.w3.org/TR/REC-xml-names/#ns-decl)"
++                  raise REXML::ParseException.new( msg, @source, self )
++                end
++              elsif local_part == "xmlns"
++                msg = "The 'xmlns' prefix must not be declared "+
+                   "(http://www.w3.org/TR/REC-xml-names/#ns-decl)"
+-                raise REXML::ParseException.new( msg, @source, self )
++                raise REXML::ParseException.new( msg, @source, self)
+               end
+-            elsif local_part == "xmlns"
+-              msg = "The 'xmlns' prefix must not be declared "+
+-                "(http://www.w3.org/TR/REC-xml-names/#ns-decl)"
+-              raise REXML::ParseException.new( msg, @source, self)
++              curr_ns << local_part
++            elsif prefix
++              prefixes << prefix unless prefix == "xml"
+             end
+-            curr_ns << local_part
+-          elsif prefix
+-            prefixes << prefix unless prefix == "xml"
+-          end
+
+-          if attributes.has_key?(name)
+-            msg = "Duplicate attribute #{name.inspect}"
+-            raise REXML::ParseException.new(msg, @source, self)
+-          end
++            if attributes.has_key?(name)
++              msg = "Duplicate attribute #{name.inspect}"
++              raise REXML::ParseException.new(msg, @source, self)
++            end
+
+-          attributes[name] = value
++            attributes[name] = value
++          else
++            message = "Invalid attribute name: <#{@source.buffer.split(%r{[/>\s]}).first}>"
++            raise REXML::ParseException.new(message, @source)
++          end
+         end
+-        return attributes, closed
+       end
+     end
+   end
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0002.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0002.patch
new file mode 100644
index 0000000000..e091aa7e79
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0002.patch
@@ -0,0 +1,130 @@
+From cb158582f18cebb3bf7b3f21f230e2fb17d435aa Mon Sep 17 00:00:00 2001
+From: Sutou Kouhei <kou@clear-code.com>
+Date: Sat, 17 Aug 2024 17:39:14 +0900
+Subject: [PATCH] parser: keep the current namespaces instead of stack of Set
+
+It improves namespace resolution performance for deep element.
+
+CVE: CVE-2024-43398
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/cb158582f18cebb3bf7b3f21f230e2fb17d435aa]
+
+Signed-off-by: Rob Woolley <rob.woolley@windriver.com>
+
+---
+ lib/rexml/parsers/baseparser.rb | 45 +++++++++++++++++++++++++--------
+ 1 file changed, 35 insertions(+), 10 deletions(-)
+
+Index: ruby-3.1.3/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+===================================================================
+--- ruby-3.1.3.orig/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ ruby-3.1.3/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -152,7 +152,8 @@ module REXML
+         @tags = []
+         @stack = []
+         @entities = []
+-        @nsstack = []
++        @namespaces = {}
++        @namespaces_restore_stack = []
+       end
+
+       def position
+@@ -235,7 +236,6 @@ module REXML
+                 @source.string = "<!DOCTYPE" + @source.buffer
+                 raise REXML::ParseException.new(message, @source)
+               end
+-              @nsstack.unshift(curr_ns=Set.new)
+               name = parse_name(base_error_message)
+               if @source.match(/\s*\[/um, true)
+                 id = [nil, nil, nil]
+@@ -320,7 +320,7 @@ module REXML
+                   val = attdef[4] if val == "#FIXED "
+                   pairs[attdef[0]] = val
+                   if attdef[0] =~ /^xmlns:(.*)/
+-                    @nsstack[0] << $1
++                    @namespaces[$1] = val
+                   end
+                 end
+               end
+@@ -365,7 +365,7 @@ module REXML
+         begin
+           if @source.match("<", true)
+             if @source.match("/", true)
+-              @nsstack.shift
++              @namespaces_restore_stack.pop
+               last_tag = @tags.pop
+               md = @source.match(CLOSE_PATTERN, true)
+               if md and !last_tag
+@@ -411,18 +411,18 @@ module REXML
+               @document_status = :in_element
+               prefixes = Set.new
+               prefixes << md[2] if md[2]
+-              @nsstack.unshift(curr_ns=Set.new)
+-              attributes, closed = parse_attributes(prefixes, curr_ns)
++              push_namespaces_restore
++              attributes, closed = parse_attributes(@prefixes)
+               # Verify that all of the prefixes have been defined
+               for prefix in prefixes
+-                unless @nsstack.find{|k| k.member?(prefix)}
++                unless @namespaces.key?(prefix)
+                   raise UndefinedNamespaceException.new(prefix,@source,self)
+                 end
+               end
+
+               if closed
+                 @closed = tag
+-                @nsstack.shift
++                pop_namespaces_restore
+               else
+                 @tags.push( tag )
+               end
+@@ -512,6 +512,31 @@ module REXML
+       end
+
+       private
++      def add_namespace(prefix, uri)
++        @namespaces_restore_stack.last[prefix] = @namespaces[prefix]
++        if uri.nil?
++          @namespaces.delete(prefix)
++        else
++          @namespaces[prefix] = uri
++        end
++      end
++
++      def push_namespaces_restore
++        namespaces_restore = {}
++        @namespaces_restore_stack.push(namespaces_restore)
++        namespaces_restore
++      end
++
++      def pop_namespaces_restore
++        namespaces_restore = @namespaces_restore_stack.pop
++        namespaces_restore.each do |prefix, uri|
++          if uri.nil?
++            @namespaces.delete(prefix)
++          else
++            @namespaces[prefix] = uri
++          end
++        end
++      end
+
+       def record_entity_expansion
+         @entity_expansion_count += 1
+@@ -631,7 +656,7 @@ module REXML
+         [:processing_instruction, match_data[1], match_data[2]]
+       end
+
+-      def parse_attributes(prefixes, curr_ns)
++      def parse_attributes(prefixes)
+         attributes = {}
+         closed = false
+         while true
+@@ -672,7 +697,7 @@ module REXML
+                   "(http://www.w3.org/TR/REC-xml-names/#ns-decl)"
+                 raise REXML::ParseException.new( msg, @source, self)
+               end
+-              curr_ns << local_part
++              add_namespace(local_part, value)
+             elsif prefix
+               prefixes << prefix unless prefix == "xml"
+             end
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-43398.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0003.patch
similarity index 87%
rename from meta/recipes-devtools/ruby/ruby/CVE-2024-43398.patch
rename to meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0003.patch
index 02dc0a20be..2a48aabbc5 100644
--- a/meta/recipes-devtools/ruby/ruby/CVE-2024-43398.patch
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0003.patch
@@ -47,17 +47,17 @@ diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/
 index e32c7f4..154f2ac 100644
 --- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
 +++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
-@@ -634,6 +634,7 @@ module REXML
+@@ -658,6 +658,7 @@ module REXML
  
-       def parse_attributes(prefixes, curr_ns)
+       def parse_attributes(prefixes)
          attributes = {}
 +        expanded_names = {}
          closed = false
-         match_data = @source.match(/^(.*?)(\/)?>/um, true)
-         if match_data.nil?
-@@ -641,6 +642,20 @@ module REXML
-           raise REXML::ParseException.new(message, @source)
-         end
+         while true
+           if @source.match(">", true)
+@@ -707,6 +708,20 @@ module REXML
+               raise REXML::ParseException.new(msg, @source, self)
+             end
  
 +            unless prefix == "xmlns"
 +              uri = @namespaces[prefix]
@@ -73,9 +73,6 @@ index e32c7f4..154f2ac 100644
 +              expanded_names[expanded_name] = prefix
 +            end
 +
-         raw_attributes = match_data[1]
-         closed = !match_data[2].nil?
-         return attributes, closed if raw_attributes.nil?
--- 
-2.40.0
-
+             attributes[name] = value
+           else
+             message = "Invalid attribute name: <#{@source.buffer.split(%r{[/>\s]}).first}>"
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index 65d62002ec..19641e5a51 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -48,7 +48,9 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2024-41946.patch \
            file://CVE-2025-27220.patch \
            file://CVE-2025-27219.patch \
-           file://CVE-2024-43398.patch \
+           file://CVE-2024-43398-0001.patch \
+           file://CVE-2024-43398-0002.patch \
+           file://CVE-2024-43398-0003.patch \
            file://CVE-2025-27221-0001.patch \
            file://CVE-2025-27221-0002.patch \
            "
-- 
2.43.0


