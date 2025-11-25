Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043B5D0EE30
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 20:55:10 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4189.1764104107203371457
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 12:55:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mg8HuFmb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b86e0d9615so7144269b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 12:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764104106; x=1764708906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VNBr/xRHhdUTWxaWtf9rqRKYKyFn1ZspDaF6qsBy398=;
        b=mg8HuFmbgv29NKqOztAFBa8jkbtzFlAJEykgzU1CstaarXy3bU2GHWPfsPlapWz7N9
         bOllnxlNgp4OZ3JIJHAHuUlUzQz82TEtZagvhw2+8Y0Zd3NhbmjMEeIy5ElYugZiNvAh
         3i+dV+zsouaMyFyo2aX/HjkDxEu6JoElIGCdGpDILk4IY5cQfl4+kgpiMGTqVsb5yDA+
         yfqseBXU0ZU/DgrLSLkSxBz8Dj1X/14PMD/YvinzTJ2txFajNQXcIQ/LUqaQe1tQaxUX
         l64j9t79jlQudRvgsiwWFA0Xf59dt2ZGWlGykqRrXlY/xl6pjR+qD573c50KtIDK9xlZ
         TN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764104106; x=1764708906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VNBr/xRHhdUTWxaWtf9rqRKYKyFn1ZspDaF6qsBy398=;
        b=vcKfrnWpR8k+aIZq3AbtCzLeY4n9Yz0TRvRQeRRzjEMBibDnKqXKNzsqZ1c7HTT8sa
         uH7dSkXHHzkWiOuFrvoWUOik4J2ZZeqBfC/V2Bcozzt2x9BOrZ7z+i0PS/jHcpUBaICj
         1NKQdlYmkMplhmevOchtgh7u8EJqtlK3KAEuPmaghJBo82qEj1tUUqt+u4tKzA5i4ppf
         OH/Zb5iJCBbzkefnjUSS0cVlgM8y/mQQ/PpD3k0g4gmO8Y7p8sg45GWMZXA6Xw3bg3ZF
         gNiL/5uy/tcPUyhEEJXh8Gm6gT3pOCVQTkPLP4THHZUH7It66sKKTuS0datPKkcGlqIq
         Pxmw==
X-Gm-Message-State: AOJu0Yz7jnQlCQPHB468slG/rK3iqb0b3aa3BzfFZZ6JTnL7GQVDszD6
	Col6bjYYQ2TouaXPWFsAqy8B61+1fXAy/uHLxDVyoaKs3f2Ht/I1pul4VAYN9zlJvwRGKVTJeWN
	Xwiz1
X-Gm-Gg: ASbGnctVd575yldVCHMaTPsW4k/7cbHOstmqQMwGMglksdlgdNNgv3OCmdmGR/RjH3v
	ya5EG1dg2WEwgRM+ze9ADEAF7kCml+gxmXZ8BEZDDr4boL2MScDnJa2KDN0baNVZ99uF5IoBjR8
	4n99MHvqzz0aTb13+5W8Pol83akwkPj6HKFvc9tH7XLYV1mKKcwqv0t8WTpePG7+iWxLKaG4+k5
	rL9jr2jdLvbJuMU4NODGcxwhesCR07tJqg+Td6K6aG0c+hCn3ZQtUl2byu1vhWdHF7ooTIwP6uf
	RYk6ofWj3khnHIEp7rj/jk8kYo3xsJ5rJo6n0L6br/Ck9ULRlODxqxZf1g1xamGnlahxSVZBtmY
	qQbAdCT5pLUhAPd4+vDhE1yWoe13fEmRQD9DVkt0DccvYt80EfR7XD3goTSFV7Re+4CphNCONdn
	MQMg==
X-Google-Smtp-Source: AGHT+IGPICY8vCniGWiYtBaul6f6KL3QLdD6RvPgHrAcuQ7aoqPnqGGPmCNF0ObPFrSIW6w6B+vQ2w==
X-Received: by 2002:a05:6a20:2586:b0:35d:bb66:5ce3 with SMTP id adf61e73a8af0-3614eaf59b5mr18894868637.12.1764104106155;
        Tue, 25 Nov 2025 12:55:06 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a5a3099sm322602a91.11.2025.11.25.12.55.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:55:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/9] ruby: fix CVE-2024-41123
Date: Tue, 25 Nov 2025 12:54:47 -0800
Message-ID: <6b2a2e689a69deef6098f6c266542234e46fb24b.1764103986.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764103986.git.steve@sakoman.com>
References: <cover.1764103986.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 20:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226779

From: Divya Chellam <divya.chellam@windriver.com>

REXML is an XML toolkit for Ruby. The REXML gem before 3.3.2 has some DoS
vulnerabilities when it parses an XML that has many specific characters
such as whitespace character, `>]` and `]>`. The REXML gem 3.3.3 or later
include the patches to fix these vulnerabilities.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-41123

Upstream-patches:
https://github.com/ruby/rexml/commit/2c39c91a65d69357cfbc35dd8079b3606d86bb70
https://github.com/ruby/rexml/commit/4444a04ece4c02a7bd51e8c75623f22dc12d882b
https://github.com/ruby/rexml/commit/ebc3e85bfa2796fb4922c1932760bec8390ff87c
https://github.com/ruby/rexml/commit/6cac15d45864c8d70904baa5cbfcc97181000960
https://github.com/ruby/rexml/commit/e2546e6ecade16b04c9ee528e5be8509fe16c2d6

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ruby/ruby/CVE-2024-41123-0001.patch       |  44 +++++
 .../ruby/ruby/CVE-2024-41123-0002.patch       |  37 ++++
 .../ruby/ruby/CVE-2024-41123-0003.patch       |  55 ++++++
 .../ruby/ruby/CVE-2024-41123-0004.patch       | 163 ++++++++++++++++++
 .../ruby/ruby/CVE-2024-41123-0005.patch       | 111 ++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |   5 +
 6 files changed, 415 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0001.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0002.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0003.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0004.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0005.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0001.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0001.patch
new file mode 100644
index 0000000000..c9d7ed2626
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0001.patch
@@ -0,0 +1,44 @@
+From 2c39c91a65d69357cfbc35dd8079b3606d86bb70 Mon Sep 17 00:00:00 2001
+From: Watson <watson1978@gmail.com>
+Date: Fri, 19 Jul 2024 17:15:15 +0900
+Subject: [PATCH] Fix method scope in test in order to invoke the tests
+ properly and fix exception message (#182)
+
+This PR includes following two fixes.
+
+1. The `test_empty` and `test_linear_performance_gt` were defined as
+private method. Seems that test-unit runner does not invoke private
+methods even if the methods have `test_` prefix.
+2. When parse malformed entity declaration, the exception might have the
+message about `NoMethodError`. The proper exception message will be
+contained by this fix.
+
+CVE: CVE-2024-41123
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/2c39c91a65d69357cfbc35dd8079b3606d86bb70]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 4864ba1..451fbf8 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -308,7 +308,11 @@ module REXML
+               raise REXML::ParseException.new( "Bad ELEMENT declaration!", @source ) if md.nil?
+               return [ :elementdecl, "<!ELEMENT" + md[1] ]
+             elsif @source.match("ENTITY", true)
+-              match = [:entitydecl, *@source.match(Private::ENTITYDECL_PATTERN, true, term: Private::ENTITY_TERM).captures.compact]
++              match_data = @source.match(Private::ENTITYDECL_PATTERN, true, term: Private::ENTITY_TERM)
++              unless match_data
++                raise REXML::ParseException.new("Malformed entity declaration", @source)
++              end
++              match = [:entitydecl, *match_data.captures.compact]
+               ref = false
+               if match[1] == '%'
+                 ref = true
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0002.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0002.patch
new file mode 100644
index 0000000000..6c6c81d7f1
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0002.patch
@@ -0,0 +1,37 @@
+From 4444a04ece4c02a7bd51e8c75623f22dc12d882b Mon Sep 17 00:00:00 2001
+From: Sutou Kouhei <kou@clear-code.com>
+Date: Sun, 2 Jun 2024 16:59:16 +0900
+Subject: [PATCH] Add missing encode for custom term
+
+CVE: CVE-2024-41123
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/4444a04ece4c02a7bd51e8c75623f22dc12d882b]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/source.rb | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
+index 08a035c..7be430a 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
+@@ -160,6 +160,7 @@ module REXML
+     end
+ 
+     def read(term = nil)
++      term = encode(term) if term
+       begin
+         @scanner << readline(term)
+         true
+@@ -171,6 +172,7 @@ module REXML
+ 
+     def read_until(term)
+       pattern = Regexp.union(term)
++      term = encode(term)
+       data = []
+       begin
+         until str = @scanner.scan_until(pattern)
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0003.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0003.patch
new file mode 100644
index 0000000000..d31b77efbf
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0003.patch
@@ -0,0 +1,55 @@
+From ebc3e85bfa2796fb4922c1932760bec8390ff87c Mon Sep 17 00:00:00 2001
+From: NAITOH Jun <naitoh@gmail.com>
+Date: Mon, 8 Jul 2024 05:54:06 +0900
+Subject: [PATCH] Add position check for XML declaration (#162)
+
+XML declaration must be the first item.
+
+https://www.w3.org/TR/2006/REC-xml11-20060816/#document
+
+```
+[1]   document   ::=   ( prolog element Misc* ) - ( Char* RestrictedChar Char* )
+```
+
+https://www.w3.org/TR/2006/REC-xml11-20060816/#NT-prolog
+
+```
+[22]   prolog   ::=     XMLDecl Misc* (doctypedecl Misc*)?
+```
+
+https://www.w3.org/TR/2006/REC-xml11-20060816/#NT-XMLDecl
+
+```
+[23]   XMLDecl  ::=   '<?xml' VersionInfo EncodingDecl? SDDecl? S? '?>'
+```
+
+See: https://github.com/ruby/rexml/pull/161#discussion_r1666118193
+
+CVE: CVE-2024-41123
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/ebc3e85bfa2796fb4922c1932760bec8390ff87c]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 451fbf8..71fce99 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -670,7 +670,10 @@ module REXML
+           @source.position = start_position
+           raise REXML::ParseException.new(message, @source)
+         end
+-        if @document_status.nil? and match_data[1] == "xml"
++        if match_data[1] == "xml"
++          if @document_status
++            raise ParseException.new("Malformed XML: XML declaration is not at the start", @source)
++          end
+           content = match_data[2]
+           version = VERSION.match(content)
+           version = version[1] unless version.nil?
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0004.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0004.patch
new file mode 100644
index 0000000000..4d7603a5b9
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0004.patch
@@ -0,0 +1,163 @@
+From 6cac15d45864c8d70904baa5cbfcc97181000960 Mon Sep 17 00:00:00 2001
+From: tomoya ishida <tomoyapenguin@gmail.com>
+Date: Thu, 1 Aug 2024 09:21:19 +0900
+Subject: [PATCH] Fix source.match performance without specifying term string
+ (#186)
+
+Performance problem of `source.match(regexp)` was recently fixed by
+specifying terminator string. However, I think maintaining appropriate
+terminator string for a regexp is hard.
+I propose solving this performance issue by increasing bytes to read in
+each iteration.
+
+CVE: CVE-2024-41123
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/6cac15d45864c8d70904baa5cbfcc97181000960]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .../lib/rexml/parsers/baseparser.rb           | 22 ++++++------------
+ .bundle/gems/rexml-3.2.5/lib/rexml/source.rb  | 23 +++++++++++++++----
+ 2 files changed, 25 insertions(+), 20 deletions(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 71fce99..c1a22b8 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -124,14 +124,6 @@ module REXML
+       }
+ 
+       module Private
+-        # Terminal requires two or more letters.
+-        INSTRUCTION_TERM = "?>"
+-        COMMENT_TERM = "-->"
+-        CDATA_TERM = "]]>"
+-        DOCTYPE_TERM = "]>"
+-        # Read to the end of DOCTYPE because there is no proper ENTITY termination
+-        ENTITY_TERM = DOCTYPE_TERM
+-
+         INSTRUCTION_END = /#{NAME}(\s+.*?)?\?>/um
+         TAG_PATTERN = /((?>#{QNAME_STR}))\s*/um
+         CLOSE_PATTERN = /(#{QNAME_STR})\s*>/um
+@@ -244,7 +236,7 @@ module REXML
+             return process_instruction(start_position)
+           elsif @source.match("<!", true)
+             if @source.match("--", true)
+-              md = @source.match(/(.*?)-->/um, true, term: Private::COMMENT_TERM)
++              md = @source.match(/(.*?)-->/um, true)
+               if md.nil?
+                 raise REXML::ParseException.new("Unclosed comment", @source)
+               end
+@@ -308,7 +300,7 @@ module REXML
+               raise REXML::ParseException.new( "Bad ELEMENT declaration!", @source ) if md.nil?
+               return [ :elementdecl, "<!ELEMENT" + md[1] ]
+             elsif @source.match("ENTITY", true)
+-              match_data = @source.match(Private::ENTITYDECL_PATTERN, true, term: Private::ENTITY_TERM)
++              match_data = @source.match(Private::ENTITYDECL_PATTERN, true)
+               unless match_data
+                 raise REXML::ParseException.new("Malformed entity declaration", @source)
+               end
+@@ -377,14 +369,14 @@ module REXML
+                 raise REXML::ParseException.new(message, @source)
+               end
+               return [:notationdecl, name, *id]
+-            elsif md = @source.match(/--(.*?)-->/um, true, term: Private::COMMENT_TERM)
++            elsif md = @source.match(/--(.*?)-->/um, true)
+               case md[1]
+               when /--/, /-\z/
+                 raise REXML::ParseException.new("Malformed comment", @source)
+               end
+               return [ :comment, md[1] ] if md
+             end
+-          elsif match = @source.match(/(%.*?;)\s*/um, true, term: Private::DOCTYPE_TERM)
++          elsif match = @source.match(/(%.*?;)\s*/um, true)
+             return [ :externalentity, match[1] ]
+           elsif @source.match(/\]\s*>/um, true)
+             @document_status = :after_doctype
+@@ -417,7 +409,7 @@ module REXML
+               #STDERR.puts "SOURCE BUFFER = #{source.buffer}, #{source.buffer.size}"
+               raise REXML::ParseException.new("Malformed node", @source) unless md
+               if md[0][0] == ?-
+-                md = @source.match(/--(.*?)-->/um, true, term: Private::COMMENT_TERM)
++                md = @source.match(/--(.*?)-->/um, true)
+ 
+                 case md[1]
+                 when /--/, /-\z/
+@@ -426,7 +418,7 @@ module REXML
+ 
+                 return [ :comment, md[1] ] if md
+               else
+-                md = @source.match(/\[CDATA\[(.*?)\]\]>/um, true, term: Private::CDATA_TERM)
++                md = @source.match(/\[CDATA\[(.*?)\]\]>/um, true)
+                 return [ :cdata, md[1] ] if md
+               end
+               raise REXML::ParseException.new( "Declarations can only occur "+
+@@ -664,7 +656,7 @@ module REXML
+       end
+ 
+       def process_instruction(start_position)
+-        match_data = @source.match(Private::INSTRUCTION_END, true, term: Private::INSTRUCTION_TERM)
++        match_data = @source.match(Private::INSTRUCTION_END, true)
+         unless match_data
+           message = "Invalid processing instruction node"
+           @source.position = start_position
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
+index 7be430a..7c05cb5 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
+@@ -72,7 +72,7 @@ module REXML
+       @scanner.scan_until(Regexp.union(term)) or @scanner.rest
+     end
+ 
+-    def match(pattern, cons=false, term: nil)
++    def match(pattern, cons=false)
+       if cons
+         @scanner.scan(pattern).nil? ? nil : @scanner
+       else
+@@ -159,10 +159,20 @@ module REXML
+       end
+     end
+ 
+-    def read(term = nil)
++    def read(term = nil, min_bytes = 1)
+       term = encode(term) if term
+       begin
+-        @scanner << readline(term)
++        str = readline(term)
++        @scanner << str
++        read_bytes = str.bytesize
++        begin
++          while read_bytes < min_bytes
++            str = readline(term)
++            @scanner << str
++            read_bytes += str.bytesize
++          end
++        rescue IOError
++        end
+         true
+       rescue Exception, NameError
+         @source = nil
+@@ -186,7 +196,9 @@ module REXML
+       end
+     end
+ 
+-    def match( pattern, cons=false, term: nil )
++    def match( pattern, cons=false )
++      # To avoid performance issue, we need to increase bytes to read per scan
++      min_bytes = 1
+       read if @scanner.eos? && @source
+       while true
+         if cons
+@@ -197,7 +209,8 @@ module REXML
+         break if md
+         return nil if pattern.is_a?(String) && pattern.bytesize <= @scanner.rest_size
+         return nil if @source.nil?
+-        return nil unless read(term)
++        return nil unless read(nil, min_bytes)
++        min_bytes *= 2
+       end
+ 
+       md.nil? ? nil : @scanner
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0005.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0005.patch
new file mode 100644
index 0000000000..3d79d07327
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0005.patch
@@ -0,0 +1,111 @@
+From e2546e6ecade16b04c9ee528e5be8509fe16c2d6 Mon Sep 17 00:00:00 2001
+From: Sutou Kouhei <kou@clear-code.com>
+Date: Thu, 1 Aug 2024 11:23:43 +0900
+Subject: [PATCH] parse pi: improve invalid case detection
+
+CVE: CVE-2024-41123
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/e2546e6ecade16b04c9ee528e5be8509fe16c2d6]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .../lib/rexml/parsers/baseparser.rb           | 35 +++++++++++--------
+ 1 file changed, 20 insertions(+), 15 deletions(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index c1a22b8..0ece9b5 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -124,11 +124,10 @@ module REXML
+       }
+ 
+       module Private
+-        INSTRUCTION_END = /#{NAME}(\s+.*?)?\?>/um
+         TAG_PATTERN = /((?>#{QNAME_STR}))\s*/um
+         CLOSE_PATTERN = /(#{QNAME_STR})\s*>/um
+         ATTLISTDECL_END = /\s+#{NAME}(?:#{ATTDEF})*\s*>/um
+-        NAME_PATTERN = /\s*#{NAME}/um
++        NAME_PATTERN = /#{NAME}/um
+         GEDECL_PATTERN = "\\s+#{NAME}\\s+#{ENTITYDEF}\\s*>"
+         PEDECL_PATTERN = "\\s+(%)\\s+#{NAME}\\s+#{PEDEF}\\s*>"
+         ENTITYDECL_PATTERN = /(?:#{GEDECL_PATTERN})|(?:#{PEDECL_PATTERN})/um
+@@ -233,7 +232,7 @@ module REXML
+         if @document_status == nil
+           start_position = @source.position
+           if @source.match("<?", true)
+-            return process_instruction(start_position)
++            return process_instruction
+           elsif @source.match("<!", true)
+             if @source.match("--", true)
+               md = @source.match(/(.*?)-->/um, true)
+@@ -424,7 +423,7 @@ module REXML
+               raise REXML::ParseException.new( "Declarations can only occur "+
+                 "in the doctype declaration.", @source)
+             elsif @source.match("?", true)
+-              return process_instruction(start_position)
++              return process_instruction
+             else
+               # Get the next tag
+               md = @source.match(TAG_PATTERN, true)
+@@ -579,14 +578,14 @@ module REXML
+       def parse_name(base_error_message)
+         md = @source.match(NAME_PATTERN, true)
+         unless md
+-          if @source.match(/\s*\S/um)
++          if @source.match(/\S/um)
+             message = "#{base_error_message}: invalid name"
+           else
+             message = "#{base_error_message}: name is missing"
+           end
+           raise REXML::ParseException.new(message, @source)
+         end
+-        md[1]
++        md[0]
+       end
+ 
+       def parse_id(base_error_message,
+@@ -655,18 +654,24 @@ module REXML
+         end
+       end
+ 
+-      def process_instruction(start_position)
+-        match_data = @source.match(Private::INSTRUCTION_END, true)
+-        unless match_data
+-          message = "Invalid processing instruction node"
+-          @source.position = start_position
+-          raise REXML::ParseException.new(message, @source)
++      def process_instruction
++        name = parse_name("Malformed XML: Invalid processing instruction node")
++        if @source.match(/\s+/um, true)
++          match_data = @source.match(/(.*?)\?>/um, true)
++          unless match_data
++            raise ParseException.new("Malformed XML: Unclosed processing instruction", @source)
++          end
++          content = match_data[1]
++        else
++          content = nil
++          unless @source.match("?>", true)
++            raise ParseException.new("Malformed XML: Unclosed processing instruction", @source)
++          end
+         end
+-        if match_data[1] == "xml"
++        if name == "xml"
+           if @document_status
+             raise ParseException.new("Malformed XML: XML declaration is not at the start", @source)
+           end
+-          content = match_data[2]
+           version = VERSION.match(content)
+           version = version[1] unless version.nil?
+           encoding = ENCODING.match(content)
+@@ -681,7 +686,7 @@ module REXML
+           standalone = standalone[1] unless standalone.nil?
+           return [ :xmldecl, version, encoding, standalone ]
+         end
+-        [:processing_instruction, match_data[1], match_data[2]]
++        [:processing_instruction, name, content]
+       end
+ 
+       def parse_attributes(prefixes)
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index f967cc6948..f2f9c848f0 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -66,6 +66,11 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2024-39908-0010.patch \
            file://CVE-2024-39908-0011.patch \
            file://CVE-2024-39908-0012.patch \
+           file://CVE-2024-41123-0001.patch \
+           file://CVE-2024-41123-0002.patch \
+           file://CVE-2024-41123-0003.patch \
+           file://CVE-2024-41123-0004.patch \
+           file://CVE-2024-41123-0005.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.43.0


