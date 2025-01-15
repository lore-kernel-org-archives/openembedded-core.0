Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3843EC02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 14:38:14 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.22649.1736951886469875038
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 06:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eHYAZZHx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21669fd5c7cso125856635ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 06:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736951886; x=1737556686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xqaeEaDpXTPL2Q8aakfqZzYRzVj0Rvtu4i09xHLfIyI=;
        b=eHYAZZHxyPoBiepngL10THnZI68aiDtvYjPyhpNRomA9BAi0Lz2NjfTI2lb80TNR0Q
         vi8T8RWrhCuUSDyEZ3o68i6JQODFxQh0l/rKcdtZ/Tdpxq9DG4uS4Jz9WqeMw55I0gkv
         Gss32OI5OfzCXRokSYdnUB+1E8pAvV9K63lnlSGopyoKt73rm1gmdlgvqJJ4c2CxzMsM
         2HWGm6z7SmZkexNXOAiCeWoE2CuNbolR1scqJgTeoVPuhYAd+zjyCb1yH9J7FGP+ohdK
         hoTetzAJiYwNZ4t6jowd3j47OwaUVLr03yPghKp5BCZrtUW2zwDwXIqdYD14nFLxnt49
         zLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736951886; x=1737556686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqaeEaDpXTPL2Q8aakfqZzYRzVj0Rvtu4i09xHLfIyI=;
        b=NjeMuba9DUliObSqmenjDOeQMwYorVAECS6C9vMNz94ukWIdZwiI1iYkOrCeWIo/kA
         MgKqikjsnSG1AHNe18CFF/w1SnsG7ulpmESvqtunu9RR/LPz3r64DFAQU74WRWwE0OFh
         aXTnDNp8cCVmtZphidfS6Lsiwk8+wF9dMgZxs8Zb+4ZlIrSrFB37RIzzb4mi/wKB11kQ
         v4rbZ0WCpb3SDNOKfqMoht3ZAbj32gLZ44ZrVYUCP6EJlNBgsVEAyu993grsY/YeyWmB
         zzQqCnSLsPEududIy2Z6pJ079cspS4j3wwaFRqXTOk4lHl0sUtDq1M9UjDVr1VqJpBhu
         62bQ==
X-Gm-Message-State: AOJu0YzWWCqT0GFwKcE8OTuJTStJwufEsrb1Mdxw9G0yXn3F0sm8gi/N
	iIyWIZE7wveH6WLp+AAsEDUyq8vuXLwVOo1OkyxH7Kbmx1w7INryIGFdLGVCC0zcOeel5wPUv7P
	TMpM=
X-Gm-Gg: ASbGnct9LX8jXH9vLUQPuLhtjEQn/X2QkndN//ke4hN/zHJeNhtyIYC/eCCldPypzr+
	NrCYcyZZeGnQkJxwLwDvLHn5D435dfXU0S11MTK6LtodBisQWi7EEjInmpxjg5B7/RiHsjrxI8e
	epeg14A6ZbIUf7qZBVFn3SA/Cikomq8TX10EKuu/NMs4a8v0M9rRn+v0Fkpsi1lBby0s88HC2ty
	HYPgqqZGSonz4qPfQDcKlFro/s7rOGyYdpj3iz+ScL9WQ==
X-Google-Smtp-Source: AGHT+IGNmvIG+8ch9gckxoviw3/v9uDYwWIpIqnZz/lKNMcVQoQk7kr/bKKmBLC9gz/uL75aiVcMxA==
X-Received: by 2002:a17:902:e5c2:b0:215:b33b:e26d with SMTP id d9443c01a7336-21a83f55103mr486656545ad.21.1736951884710;
        Wed, 15 Jan 2025 06:38:04 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f244cccsm82333295ad.210.2025.01.15.06.38.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 06:38:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/11] ruby: fix CVE-2024-49761
Date: Wed, 15 Jan 2025 06:37:42 -0800
Message-ID: <5b453400e9dd878b81b1447d14b3f518809de17e.1736951751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736951751.git.steve@sakoman.com>
References: <cover.1736951751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 14:38:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209909

From: Divya Chellam <divya.chellam@windriver.com>

REXML is an XML toolkit for Ruby. The REXML gem before 3.3.9 has a ReDoS
vulnerability when it parses an XML that has many digits between &# and x...;
in a hex numeric character reference (&#x.... This does not happen with
Ruby 3.2 or later. Ruby 3.1 is the only affected maintained Ruby.
The REXML gem 3.3.9 or later include the patch to fix the vulnerability.

CVE-2024-49761-0009.patch is the CVE fix and rest are dependent commits.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-49761

Upstream-patch:
https://github.com/ruby/rexml/commit/810d2285235d5501a0a124f300832e6e9515da3c
https://github.com/ruby/rexml/commit/83ca5c4b0f76cf7b307dd1be1dc934e1e8199863
https://github.com/ruby/rexml/commit/51217dbcc64ecc34aa70f126b103bedf07e153fc
https://github.com/ruby/rexml/commit/7e4049f6a68c99c4efec2df117057ee080680c9f
https://github.com/ruby/rexml/commit/fc6cad570b849692a28f26a963ceb58edc282bbc
https://github.com/ruby/rexml/commit/77128555476cb0db798e2912fb3a07d6411dc320
https://github.com/ruby/rexml/commit/370666e314816b57ecd5878e757224c3b6bc93f5
https://github.com/ruby/rexml/commit/a579730f25ec7443796495541ec57c071b91805d
https://github.com/ruby/rexml/commit/ce59f2eb1aeb371fe1643414f06618dbe031979f

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ruby/ruby/CVE-2024-49761-0001.patch       | 391 ++++++++++++
 .../ruby/ruby/CVE-2024-49761-0002.patch       | 104 ++++
 .../ruby/ruby/CVE-2024-49761-0003.patch       |  85 +++
 .../ruby/ruby/CVE-2024-49761-0004.patch       |  71 +++
 .../ruby/ruby/CVE-2024-49761-0005.patch       |  51 ++
 .../ruby/ruby/CVE-2024-49761-0006.patch       |  79 +++
 .../ruby/ruby/CVE-2024-49761-0007.patch       | 561 ++++++++++++++++++
 .../ruby/ruby/CVE-2024-49761-0008.patch       | 107 ++++
 .../ruby/ruby/CVE-2024-49761-0009.patch       |  46 ++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |   9 +
 10 files changed, 1504 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0001.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0002.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0003.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0004.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0005.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0006.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0007.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0008.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0009.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0001.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0001.patch
new file mode 100644
index 0000000000..3caf389923
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0001.patch
@@ -0,0 +1,391 @@
+From 810d2285235d5501a0a124f300832e6e9515da3c Mon Sep 17 00:00:00 2001
+From: NAITOH Jun <naitoh@gmail.com>
+Date: Wed, 17 Jan 2024 15:32:57 +0900
+Subject: [PATCH] Use string scanner with baseparser (#105)
+
+Using StringScanner reduces the string copying process and speeds up the
+process.
+
+And I removed unnecessary methods.
+
+https://github.com/ruby/rexml/actions/runs/7549990000/job/20554906140?pr=105
+
+```
+ruby 3.3.0 (2023-12-25 revision 5124f9ac75) [x86_64-linux]
+Calculating -------------------------------------
+                     rexml 3.2.6      master  3.2.6(YJIT)  master(YJIT)
+                 dom       4.868       5.077        8.137         8.303 i/s -     100.000 times in 20.540529s 19.696590s 12.288900s 12.043666s
+                 sax      13.597      13.953       19.206        20.948 i/s -     100.000 times in 7.354343s 7.167142s 5.206745s 4.773765s
+                pull      15.641      16.918       22.266        25.378 i/s -     100.000 times in 6.393424s 5.910955s 4.491201s 3.940471s
+              stream      14.339      15.844       19.810        22.206 i/s -     100.000 times in 6.973856s 6.311350s 5.047957s 4.503244s
+
+Comparison:
+                              dom
+        master(YJIT):         8.3 i/s
+         3.2.6(YJIT):         8.1 i/s - 1.02x  slower
+              master:         5.1 i/s - 1.64x  slower
+         rexml 3.2.6:         4.9 i/s - 1.71x  slower
+
+                              sax
+        master(YJIT):        20.9 i/s
+         3.2.6(YJIT):        19.2 i/s - 1.09x  slower
+              master:        14.0 i/s - 1.50x  slower
+         rexml 3.2.6:        13.6 i/s - 1.54x  slower
+
+                             pull
+        master(YJIT):        25.4 i/s
+         3.2.6(YJIT):        22.3 i/s - 1.14x  slower
+              master:        16.9 i/s - 1.50x  slower
+         rexml 3.2.6:        15.6 i/s - 1.62x  slower
+
+                           stream
+        master(YJIT):        22.2 i/s
+         3.2.6(YJIT):        19.8 i/s - 1.12x  slower
+              master:        15.8 i/s - 1.40x  slower
+         rexml 3.2.6:        14.3 i/s - 1.55x  slower
+```
+
+- YJIT=ON : 1.02x - 1.14x faster
+- YJIT=OFF : 1.02x - 1.10x faster
+
+---------
+
+Co-authored-by: Sutou Kouhei <kou@cozmixng.org>
+
+CVE: CVE-2024-49761
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/810d2285235d5501a0a124f300832e6e9515da3c]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .../lib/rexml/parsers/baseparser.rb           |  21 ++-
+ .bundle/gems/rexml-3.2.5/lib/rexml/source.rb  | 149 ++++++------------
+ 2 files changed, 56 insertions(+), 114 deletions(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 305b120..65bad26 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -96,7 +96,7 @@ module REXML
+       ENTITYDEF = "(?:#{ENTITYVALUE}|(?:#{EXTERNALID}(#{NDATADECL})?))"
+       PEDECL = "<!ENTITY\\s+(%)\\s+#{NAME}\\s+#{PEDEF}\\s*>"
+       GEDECL = "<!ENTITY\\s+#{NAME}\\s+#{ENTITYDEF}\\s*>"
+-      ENTITYDECL = /\s*(?:#{GEDECL})|(?:#{PEDECL})/um
++      ENTITYDECL = /\s*(?:#{GEDECL})|\s*(?:#{PEDECL})/um
+
+       NOTATIONDECL_START = /\A\s*<!NOTATION/um
+       EXTERNAL_ID_PUBLIC = /\A\s*PUBLIC\s+#{PUBIDLITERAL}\s+#{SYSTEMLITERAL}\s*/um
+@@ -259,7 +259,7 @@ module REXML
+           else
+             @document_status = :after_doctype
+             if @source.encoding == "UTF-8"
+-              @source.buffer.force_encoding(::Encoding::UTF_8)
++              @source.buffer_encoding = ::Encoding::UTF_8
+             end
+           end
+         end
+@@ -274,8 +274,7 @@ module REXML
+             return [ :elementdecl, @source.match( ELEMENTDECL_PATTERN, true )[1] ]
+
+           when ENTITY_START
+-            match = @source.match( ENTITYDECL, true ).to_a.compact
+-            match[0] = :entitydecl
++            match = [:entitydecl, *@source.match( ENTITYDECL, true ).captures.compact]
+             ref = false
+             if match[1] == '%'
+               ref = true
+@@ -392,6 +391,7 @@ module REXML
+               unless md
+                 raise REXML::ParseException.new("malformed XML: missing tag start", @source)
+               end
++              tag = md[1]
+               @document_status = :in_element
+               prefixes = Set.new
+               prefixes << md[2] if md[2]
+@@ -405,23 +405,20 @@ module REXML
+               end
+
+               if closed
+-                @closed = md[1]
++                @closed = tag
+                 @nsstack.shift
+               else
+-                @tags.push( md[1] )
++                @tags.push( tag )
+               end
+-              return [ :start_element, md[1], attributes ]
++              return [ :start_element, tag, attributes ]
+             end
+           else
+             md = @source.match( TEXT_PATTERN, true )
++            text = md[1]
+             if md[0].length == 0
+               @source.match( /(\s+)/, true )
+             end
+-            #STDERR.puts "GOT #{md[1].inspect}" unless md[0].length == 0
+-            #return [ :text, "" ] if md[0].length == 0
+-            # unnormalized = Text::unnormalize( md[1], self )
+-            # return PullEvent.new( :text, md[1], unnormalized )
+-            return [ :text, md[1] ]
++            return [ :text, text ]
+           end
+         rescue REXML::UndefinedNamespaceException
+           raise
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
+index 90b370b..71b08f9 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
+@@ -30,8 +30,6 @@ module REXML
+   # objects and provides consumption of text
+   class Source
+     include Encoding
+-    # The current buffer (what we're going to read next)
+-    attr_reader :buffer
+     # The line number of the last consumed text
+     attr_reader :line
+     attr_reader :encoding
+@@ -41,7 +39,8 @@ module REXML
+     # @param encoding if non-null, sets the encoding of the source to this
+     # value, overriding all encoding detection
+     def initialize(arg, encoding=nil)
+-      @orig = @buffer = arg
++      @orig = arg
++      @scanner = StringScanner.new(@orig)
+       if encoding
+         self.encoding = encoding
+       else
+@@ -50,6 +49,14 @@ module REXML
+       @line = 0
+     end
+
++    # The current buffer (what we're going to read next)
++    def buffer
++      @scanner.rest
++    end
++
++    def buffer_encoding=(encoding)
++      @scanner.string.force_encoding(encoding)
++    end
+
+     # Inherited from Encoding
+     # Overridden to support optimized en/decoding
+@@ -58,98 +65,57 @@ module REXML
+       encoding_updated
+     end
+
+-    # Scans the source for a given pattern.  Note, that this is not your
+-    # usual scan() method.  For one thing, the pattern argument has some
+-    # requirements; for another, the source can be consumed.  You can easily
+-    # confuse this method.  Originally, the patterns were easier
+-    # to construct and this method more robust, because this method
+-    # generated search regexps on the fly; however, this was
+-    # computationally expensive and slowed down the entire REXML package
+-    # considerably, since this is by far the most commonly called method.
+-    # @param pattern must be a Regexp, and must be in the form of
+-    # /^\s*(#{your pattern, with no groups})(.*)/.  The first group
+-    # will be returned; the second group is used if the consume flag is
+-    # set.
+-    # @param consume if true, the pattern returned will be consumed, leaving
+-    # everything after it in the Source.
+-    # @return the pattern, if found, or nil if the Source is empty or the
+-    # pattern is not found.
+-    def scan(pattern, cons=false)
+-      return nil if @buffer.nil?
+-      rv = @buffer.scan(pattern)
+-      @buffer = $' if cons and rv.size>0
+-      rv
+-    end
+-
+     def read
+     end
+
+-    def consume( pattern )
+-      @buffer = $' if pattern.match( @buffer )
+-    end
+-
+-    def match_to( char, pattern )
+-      return pattern.match(@buffer)
+-    end
+-
+-    def match_to_consume( char, pattern )
+-      md = pattern.match(@buffer)
+-      @buffer = $'
+-      return md
+-    end
+-
+     def match(pattern, cons=false)
+-      md = pattern.match(@buffer)
+-      @buffer = $' if cons and md
+-      return md
++      if cons
++        @scanner.scan(pattern).nil? ? nil : @scanner
++      else
++        @scanner.check(pattern).nil? ? nil : @scanner
++      end
+     end
+
+     # @return true if the Source is exhausted
+     def empty?
+-      @buffer == ""
+-    end
+-
+-    def position
+-      @orig.index( @buffer )
++      @scanner.eos?
+     end
+
+     # @return the current line in the source
+     def current_line
+       lines = @orig.split
+-      res = lines.grep @buffer[0..30]
++      res = lines.grep @scanner.rest[0..30]
+       res = res[-1] if res.kind_of? Array
+       lines.index( res ) if res
+     end
+
+     private
++
+     def detect_encoding
+-      buffer_encoding = @buffer.encoding
++      scanner_encoding = @scanner.rest.encoding
+       detected_encoding = "UTF-8"
+       begin
+-        @buffer.force_encoding("ASCII-8BIT")
+-        if @buffer[0, 2] == "\xfe\xff"
+-          @buffer[0, 2] = ""
++        @scanner.string.force_encoding("ASCII-8BIT")
++        if @scanner.scan(/\xfe\xff/n)
+           detected_encoding = "UTF-16BE"
+-        elsif @buffer[0, 2] == "\xff\xfe"
+-          @buffer[0, 2] = ""
++        elsif @scanner.scan(/\xff\xfe/n)
+           detected_encoding = "UTF-16LE"
+-        elsif @buffer[0, 3] == "\xef\xbb\xbf"
+-          @buffer[0, 3] = ""
++        elsif @scanner.scan(/\xef\xbb\xbf/n)
+           detected_encoding = "UTF-8"
+         end
+       ensure
+-        @buffer.force_encoding(buffer_encoding)
++        @scanner.string.force_encoding(scanner_encoding)
+       end
+       self.encoding = detected_encoding
+     end
+
+     def encoding_updated
+       if @encoding != 'UTF-8'
+-        @buffer = decode(@buffer)
++        @scanner.string = decode(@scanner.rest)
+         @to_utf = true
+       else
+         @to_utf = false
+-        @buffer.force_encoding ::Encoding::UTF_8
++        @scanner.string.force_encoding(::Encoding::UTF_8)
+       end
+     end
+   end
+@@ -172,7 +138,7 @@ module REXML
+       end
+
+       if !@to_utf and
+-          @buffer.respond_to?(:force_encoding) and
++          @orig.respond_to?(:force_encoding) and
+           @source.respond_to?(:external_encoding) and
+           @source.external_encoding != ::Encoding::UTF_8
+         @force_utf8 = true
+@@ -181,65 +147,44 @@ module REXML
+       end
+     end
+
+-    def scan(pattern, cons=false)
+-      rv = super
+-      # You'll notice that this next section is very similar to the same
+-      # section in match(), but just a liiittle different.  This is
+-      # because it is a touch faster to do it this way with scan()
+-      # than the way match() does it; enough faster to warrant duplicating
+-      # some code
+-      if rv.size == 0
+-        until @buffer =~ pattern or @source.nil?
+-          begin
+-            @buffer << readline
+-          rescue Iconv::IllegalSequence
+-            raise
+-          rescue
+-            @source = nil
+-          end
+-        end
+-        rv = super
+-      end
+-      rv.taint if RUBY_VERSION < '2.7'
+-      rv
+-    end
+-
+     def read
+       begin
+-        @buffer << readline
++        # NOTE: `@scanner << readline` does not free memory, so when parsing huge XML in JRuby's DOM,
++        # out-of-memory error `Java::JavaLang::OutOfMemoryError: Java heap space` occurs.
++        # `@scanner.string = @scanner.rest + readline` frees memory that is already consumed
++        # and avoids this problem.
++        @scanner.string = @scanner.rest + readline
+       rescue Exception, NameError
+         @source = nil
+       end
+     end
+
+-    def consume( pattern )
+-      match( pattern, true )
+-    end
+-
+     def match( pattern, cons=false )
+-      rv = pattern.match(@buffer)
+-      @buffer = $' if cons and rv
+-      while !rv and @source
++      if cons
++        md = @scanner.scan(pattern)
++      else
++        md = @scanner.check(pattern)
++      end
++      while md.nil? and @source
+         begin
+-          @buffer << readline
+-          rv = pattern.match(@buffer)
+-          @buffer = $' if cons and rv
++          @scanner << readline
++          if cons
++            md = @scanner.scan(pattern)
++          else
++            md = @scanner.check(pattern)
++          end
+         rescue
+           @source = nil
+         end
+       end
+-      rv.taint if RUBY_VERSION < '2.7'
+-      rv
++
++      md.nil? ? nil : @scanner
+     end
+
+     def empty?
+       super and ( @source.nil? || @source.eof? )
+     end
+
+-    def position
+-      @er_source.pos rescue 0
+-    end
+-
+     # @return the current line in the source
+     def current_line
+       begin
+@@ -290,7 +235,7 @@ module REXML
+         @source.set_encoding(@encoding, @encoding)
+       end
+       @line_break = encode(">")
+-      @pending_buffer, @buffer = @buffer, ""
++      @pending_buffer, @scanner.string = @scanner.rest, ""
+       @pending_buffer.force_encoding(@encoding)
+       super
+     end
+--
+2.40.0
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0002.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0002.patch
new file mode 100644
index 0000000000..35e90b632b
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0002.patch
@@ -0,0 +1,104 @@
+From 83ca5c4b0f76cf7b307dd1be1dc934e1e8199863 Mon Sep 17 00:00:00 2001
+From: NAITOH Jun <naitoh@gmail.com>
+Date: Sun, 21 Jan 2024 06:11:42 +0900
+Subject: [PATCH] Reduce calls to `Source#buffer`(`StringScanner#rest`) (#106)
+
+Reduce calls to `Source#buffer`(`StringScanner#rest`)
+
+## Why
+`Source#buffer` calling `StringScanner#rest`.
+`StringScanner#rest` is slow.
+Reduce calls to `Source#buffer`.
+
+## Benchmark
+
+```
+RUBYLIB= BUNDLER_ORIG_RUBYLIB= /Users/naitoh/.rbenv/versions/3.3.0/bin/ruby -v -S benchmark-driver /Users/naitoh/ghq/github.com/naitoh/rexml/benchmark/parse.yaml
+ruby 3.3.0 (2023-12-25 revision 5124f9ac75) [arm64-darwin22]
+Calculating -------------------------------------
+                         before       after  before(YJIT)  after(YJIT)
+                 dom     10.639      10.985        16.213       16.221 i/s -     100.000 times in 9.399033s 9.103461s 6.167962s 6.164794s
+                 sax     28.357      29.440        42.900       44.375 i/s -     100.000 times in 3.526479s 3.396688s 2.331024s 2.253511s
+                pull     32.852      34.210        48.976       51.273 i/s -     100.000 times in 3.043965s 2.923140s 2.041816s 1.950344s
+              stream     30.821      31.908        43.953       44.697 i/s -     100.000 times in 3.244539s 3.134020s 2.275172s 2.237310s
+
+Comparison:
+                              dom
+         after(YJIT):        16.2 i/s
+        before(YJIT):        16.2 i/s - 1.00x  slower
+               after:        11.0 i/s - 1.48x  slower
+              before:        10.6 i/s - 1.52x  slower
+
+                              sax
+         after(YJIT):        44.4 i/s
+        before(YJIT):        42.9 i/s - 1.03x  slower
+               after:        29.4 i/s - 1.51x  slower
+              before:        28.4 i/s - 1.56x  slower
+
+                             pull
+         after(YJIT):        51.3 i/s
+        before(YJIT):        49.0 i/s - 1.05x  slower
+               after:        34.2 i/s - 1.50x  slower
+              before:        32.9 i/s - 1.56x  slower
+
+                           stream
+         after(YJIT):        44.7 i/s
+        before(YJIT):        44.0 i/s - 1.02x  slower
+               after:        31.9 i/s - 1.40x  slower
+              before:        30.8 i/s - 1.45x  slower
+
+```
+
+- YJIT=ON : 1.00x - 1.05x faster
+- YJIT=OFF : 1.03x - 1.04x faster
+
+CVE: CVE-2024-49761
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/83ca5c4b0f76cf7b307dd1be1dc934e1e8199863]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .../rexml-3.2.5/lib/rexml/parsers/baseparser.rb    | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 65bad26..7126a12 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -348,9 +348,13 @@ module REXML
+           @source.match(/\A\s*/um, true)
+         end
+         begin
+-          @source.read if @source.buffer.size<2
+-          if @source.buffer[0] == ?<
+-            if @source.buffer[1] == ?/
++          next_data = @source.buffer
++          if next_data.size < 2
++            @source.read
++            next_data = @source.buffer
++          end
++          if next_data[0] == ?<
++            if next_data[1] == ?/
+               @nsstack.shift
+               last_tag = @tags.pop
+               md = @source.match( CLOSE_MATCH, true )
+@@ -364,7 +368,7 @@ module REXML
+                 raise REXML::ParseException.new(message, @source)
+               end
+               return [ :end_element, last_tag ]
+-            elsif @source.buffer[1] == ?!
++            elsif next_data[1] == ?!
+               md = @source.match(/\A(\s*[^>]*>)/um)
+               #STDERR.puts "SOURCE BUFFER = #{source.buffer}, #{source.buffer.size}"
+               raise REXML::ParseException.new("Malformed node", @source) unless md
+@@ -383,7 +387,7 @@ module REXML
+               end
+               raise REXML::ParseException.new( "Declarations can only occur "+
+                 "in the doctype declaration.", @source)
+-            elsif @source.buffer[1] == ??
++            elsif next_data[1] == ??
+               return process_instruction
+             else
+               # Get the next tag
+--
+2.40.0
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0003.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0003.patch
new file mode 100644
index 0000000000..9d3515e7a6
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0003.patch
@@ -0,0 +1,85 @@
+From 51217dbcc64ecc34aa70f126b103bedf07e153fc Mon Sep 17 00:00:00 2001
+From: NAITOH Jun <naitoh@gmail.com>
+Date: Wed, 31 Jan 2024 16:35:55 +0900
+Subject: [PATCH] Reduce calls to StringScanner.new() (#108)
+
+## Why
+
+`StringScanner.new()` instances can be reused within parse_attributes,
+reducing initialization costs.
+
+## Benchmark
+
+```
+RUBYLIB= BUNDLER_ORIG_RUBYLIB= /Users/naitoh/.rbenv/versions/3.3.0/bin/ruby -v -S benchmark-driver /Users/naitoh/ghq/github.com/naitoh/rexml/benchmark/parse.yaml
+ruby 3.3.0 (2023-12-25 revision 5124f9ac75) [arm64-darwin22]
+Calculating -------------------------------------
+                         before       after  before(YJIT)  after(YJIT)
+                 dom     11.018      11.207        17.059       16.660 i/s -     100.000 times in 9.075992s 8.923280s 5.861969s 6.002555s
+                 sax     29.843      30.821        45.518       47.505 i/s -     100.000 times in 3.350909s 3.244524s 2.196940s 2.105037s
+                pull     34.480      35.937        52.816       57.098 i/s -     100.000 times in 2.900205s 2.782632s 1.893370s 1.751378s
+              stream     32.430      33.516        46.247       48.412 i/s -     100.000 times in 3.083536s 2.983607s 2.162288s 2.065584s
+
+Comparison:
+                              dom
+        before(YJIT):        17.1 i/s
+         after(YJIT):        16.7 i/s - 1.02x  slower
+               after:        11.2 i/s - 1.52x  slower
+              before:        11.0 i/s - 1.55x  slower
+
+                              sax
+         after(YJIT):        47.5 i/s
+        before(YJIT):        45.5 i/s - 1.04x  slower
+               after:        30.8 i/s - 1.54x  slower
+              before:        29.8 i/s - 1.59x  slower
+
+                             pull
+         after(YJIT):        57.1 i/s
+        before(YJIT):        52.8 i/s - 1.08x  slower
+               after:        35.9 i/s - 1.59x  slower
+              before:        34.5 i/s - 1.66x  slower
+
+                           stream
+         after(YJIT):        48.4 i/s
+        before(YJIT):        46.2 i/s - 1.05x  slower
+               after:        33.5 i/s - 1.44x  slower
+              before:        32.4 i/s - 1.49x  slower
+
+```
+
+- YJIT=ON : 1.02x - 1.08x faster
+- YJIT=OFF : 1.01x - 1.04x faster
+
+CVE: CVE-2024-49761
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/51217dbcc64ecc34aa70f126b103bedf07e153fc]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 7126a12..b66b0ed 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -115,6 +115,7 @@ module REXML
+       def initialize( source )
+         self.stream = source
+         @listeners = []
++        @attributes_scanner = StringScanner.new('')
+       end
+
+       def add_listener( listener )
+@@ -601,7 +602,8 @@ module REXML
+         return attributes, closed if raw_attributes.nil?
+         return attributes, closed if raw_attributes.empty?
+
+-        scanner = StringScanner.new(raw_attributes)
++        @attributes_scanner.string = raw_attributes
++        scanner = @attributes_scanner
+         until scanner.eos?
+           if scanner.scan(/\s+/)
+             break if scanner.eos?
+--
+2.40.0
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0004.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0004.patch
new file mode 100644
index 0000000000..f2bbbd76f7
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0004.patch
@@ -0,0 +1,71 @@
+From 7e4049f6a68c99c4efec2df117057ee080680c9f Mon Sep 17 00:00:00 2001
+From: NAITOH Jun <naitoh@gmail.com>
+Date: Wed, 31 Jan 2024 17:17:51 +0900
+Subject: [PATCH] Change loop in parse_attributes to `while true`. (#109)
+
+loop is slower than `while true`.
+
+```
+RUBYLIB= BUNDLER_ORIG_RUBYLIB= /Users/naitoh/.rbenv/versions/3.3.0/bin/ruby -v -S benchmark-driver /Users/naitoh/ghq/github.com/naitoh/rexml/benchmark/parse.yaml
+ruby 3.3.0 (2023-12-25 revision 5124f9ac75) [arm64-darwin22]
+Calculating -------------------------------------
+                         before       after  before(YJIT)  after(YJIT)
+                 dom     11.186      11.304        17.395       17.450 i/s -     100.000 times in 8.940144s 8.846590s 5.748718s 5.730793s
+                 sax     30.811      31.629        47.352       48.040 i/s -     100.000 times in 3.245601s 3.161619s 2.111854s 2.081594s
+                pull     35.793      36.621        56.924       57.313 i/s -     100.000 times in 2.793829s 2.730693s 1.756732s 1.744812s
+              stream     33.157      34.757        46.792       50.536 i/s -     100.000 times in 3.015940s 2.877088s 2.137106s 1.978787s
+
+Comparison:
+                              dom
+         after(YJIT):        17.4 i/s
+        before(YJIT):        17.4 i/s - 1.00x  slower
+               after:        11.3 i/s - 1.54x  slower
+              before:        11.2 i/s - 1.56x  slower
+
+                              sax
+         after(YJIT):        48.0 i/s
+        before(YJIT):        47.4 i/s - 1.01x  slower
+               after:        31.6 i/s - 1.52x  slower
+              before:        30.8 i/s - 1.56x  slower
+
+                             pull
+         after(YJIT):        57.3 i/s
+        before(YJIT):        56.9 i/s - 1.01x  slower
+               after:        36.6 i/s - 1.57x  slower
+              before:        35.8 i/s - 1.60x  slower
+
+                           stream
+         after(YJIT):        50.5 i/s
+        before(YJIT):        46.8 i/s - 1.08x  slower
+               after:        34.8 i/s - 1.45x  slower
+              before:        33.2 i/s - 1.52x  slower
+
+```
+
+- YJIT=ON : 1.00x - 1.08x faster
+- YJIT=OFF : 1.01x - 1.04x faster
+
+CVE: CVE-2024-49761
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/7e4049f6a68c99c4efec2df117057ee080680c9f]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index b66b0ed..3fe5c29 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -610,7 +610,7 @@ module REXML
+           end
+
+           pos = scanner.pos
+-          loop do
++          while true
+             break if scanner.scan(ATTRIBUTE_PATTERN)
+             unless scanner.scan(QNAME)
+               message = "Invalid attribute name: <#{scanner.rest}>"
+--
+2.40.0
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0005.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0005.patch
new file mode 100644
index 0000000000..304270092e
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0005.patch
@@ -0,0 +1,51 @@
+From fc6cad570b849692a28f26a963ceb58edc282bbc Mon Sep 17 00:00:00 2001
+From: NAITOH Jun <naitoh@gmail.com>
+Date: Fri, 16 Feb 2024 04:51:16 +0900
+Subject: [PATCH] Remove unnecessary checks in baseparser (#112)
+
+https://github.com/ruby/rexml/blob/444c9ce7449d3c5a75ae50087555ec73ae1963a8/lib/rexml/parsers/baseparser.rb#L352-L425
+```
+          next_data = @source.buffer
+          if next_data.size < 2
+            @source.read
+            next_data = @source.buffer
+          end
+          if next_data[0] == ?<
+              :
+            (omit)
+              :
+          else # next_data is a string of one or more characters other than '<'.
+            md = @source.match( TEXT_PATTERN, true ) # TEXT_PATTERN = /\A([^<]*)/um
+            text = md[1]
+            if md[0].length == 0 # md[0].length is greater than or equal to 1.
+              @source.match( /(\s+)/, true )
+            end
+```
+This is an unnecessary check because md[0].length is greater than or
+equal to 1.
+
+CVE: CVE-2024-49761
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/fc6cad570b849692a28f26a963ceb58edc282bbc]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 3fe5c29..595669c 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -420,9 +420,6 @@ module REXML
+           else
+             md = @source.match( TEXT_PATTERN, true )
+             text = md[1]
+-            if md[0].length == 0
+-              @source.match( /(\s+)/, true )
+-            end
+             return [ :text, text ]
+           end
+         rescue REXML::UndefinedNamespaceException
+--
+2.40.0
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0006.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0006.patch
new file mode 100644
index 0000000000..7d3f547089
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0006.patch
@@ -0,0 +1,79 @@
+From 77128555476cb0db798e2912fb3a07d6411dc320 Mon Sep 17 00:00:00 2001
+From: NAITOH Jun <naitoh@gmail.com>
+Date: Sun, 21 Jan 2024 20:02:00 +0900
+Subject: [PATCH] Use `@scanner << readline` instead of `@scanner.string =
+ @scanner.rest + readline` (#107)
+
+JRuby's `StringScanner#<<` and `StringScanner#scan` OutOfMemoryError has
+been resolved in strscan gem 3.0.9.
+
+https://github.com/ruby/strscan/issues/83
+
+```
+RUBYLIB= BUNDLER_ORIG_RUBYLIB= /Users/naitoh/.rbenv/versions/3.3.0/bin/ruby -v -S benchmark-driver /Users/naitoh/ghq/github.com/naitoh/rexml/benchmark/parse.yaml
+ruby 3.3.0 (2023-12-25 revision 5124f9ac75) [arm64-darwin22]
+Calculating -------------------------------------
+                         before       after  before(YJIT)  after(YJIT)
+                 dom     10.958      11.044        16.615       16.783 i/s -     100.000 times in 9.126104s 9.055023s 6.018799s 5.958437s
+                 sax     29.624      29.609        44.390       45.370 i/s -     100.000 times in 3.375641s 3.377372s 2.252774s 2.204080s
+                pull     33.868      34.695        51.173       53.492 i/s -     100.000 times in 2.952679s 2.882229s 1.954138s 1.869422s
+              stream     31.719      32.351        43.604       45.403 i/s -     100.000 times in 3.152713s 3.091052s 2.293356s 2.202514s
+
+Comparison:
+                              dom
+         after(YJIT):        16.8 i/s
+        before(YJIT):        16.6 i/s - 1.01x  slower
+               after:        11.0 i/s - 1.52x  slower
+              before:        11.0 i/s - 1.53x  slower
+
+                              sax
+         after(YJIT):        45.4 i/s
+        before(YJIT):        44.4 i/s - 1.02x  slower
+              before:        29.6 i/s - 1.53x  slower
+               after:        29.6 i/s - 1.53x  slower
+
+                             pull
+         after(YJIT):        53.5 i/s
+        before(YJIT):        51.2 i/s - 1.05x  slower
+               after:        34.7 i/s - 1.54x  slower
+              before:        33.9 i/s - 1.58x  slower
+
+                           stream
+         after(YJIT):        45.4 i/s
+        before(YJIT):        43.6 i/s - 1.04x  slower
+               after:        32.4 i/s - 1.40x  slower
+              before:        31.7 i/s - 1.43x  slower
+
+```
+
+- YJIT=ON : 1.01x - 1.05x faster
+- YJIT=OFF : 1.00x - 1.02x faster
+
+CVE: CVE-2024-49761
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/77128555476cb0db798e2912fb3a07d6411dc320]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/source.rb | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
+index 71b08f9..db78a12 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
+@@ -149,11 +149,7 @@ module REXML
+
+     def read
+       begin
+-        # NOTE: `@scanner << readline` does not free memory, so when parsing huge XML in JRuby's DOM,
+-        # out-of-memory error `Java::JavaLang::OutOfMemoryError: Java heap space` occurs.
+-        # `@scanner.string = @scanner.rest + readline` frees memory that is already consumed
+-        # and avoids this problem.
+-        @scanner.string = @scanner.rest + readline
++        @scanner << readline
+       rescue Exception, NameError
+         @source = nil
+       end
+--
+2.40.0
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0007.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0007.patch
new file mode 100644
index 0000000000..4ba60823ab
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0007.patch
@@ -0,0 +1,561 @@
+From 370666e314816b57ecd5878e757224c3b6bc93f5 Mon Sep 17 00:00:00 2001
+From: NAITOH Jun <naitoh@gmail.com>
+Date: Tue, 27 Feb 2024 09:48:35 +0900
+Subject: [PATCH] Use more StringScanner based API to parse XML (#114)
+
+## Why?
+
+Improve maintainability by optimizing the process so that the parsing
+process proceeds using StringScanner#scan.
+
+## Changed
+- Change `REXML::Parsers::BaseParser` from `frozen_string_literal:
+false` to `frozen_string_literal: true`.
+- Added `Source#string=` method for error message output.
+- Added TestParseDocumentTypeDeclaration#test_no_name test case.
+- Of the `intSubset` of DOCTYPE, "<!" added consideration for processing
+`Comments` that begin with "<!".
+
+## [Benchmark]
+
+```
+RUBYLIB= BUNDLER_ORIG_RUBYLIB= /Users/naitoh/.rbenv/versions/3.3.0/bin/ruby -v -S benchmark-driver /Users/naitoh/ghq/github.com/naitoh/rexml/benchmark/parse.yaml
+ruby 3.3.0 (2023-12-25 revision 5124f9ac75) [arm64-darwin22]
+Calculating -------------------------------------
+                         before       after  before(YJIT)  after(YJIT)
+                 dom     11.240      10.569        17.173       18.219 i/s -     100.000 times in 8.896882s 9.461267s 5.823007s 5.488884s
+                 sax     31.812      30.716        48.383       52.532 i/s -     100.000 times in 3.143500s 3.255655s 2.066861s 1.903600s
+                pull     36.855      36.354        56.718       61.443 i/s -     100.000 times in 2.713300s 2.750693s 1.763099s 1.627523s
+              stream     34.176      34.758        49.801       54.622 i/s -     100.000 times in 2.925991s 2.877065s 2.008003s 1.830779s
+
+Comparison:
+                              dom
+         after(YJIT):        18.2 i/s
+        before(YJIT):        17.2 i/s - 1.06x  slower
+              before:        11.2 i/s - 1.62x  slower
+               after:        10.6 i/s - 1.72x  slower
+
+                              sax
+         after(YJIT):        52.5 i/s
+        before(YJIT):        48.4 i/s - 1.09x  slower
+              before:        31.8 i/s - 1.65x  slower
+               after:        30.7 i/s - 1.71x  slower
+
+                             pull
+         after(YJIT):        61.4 i/s
+        before(YJIT):        56.7 i/s - 1.08x  slower
+              before:        36.9 i/s - 1.67x  slower
+               after:        36.4 i/s - 1.69x  slower
+
+                           stream
+         after(YJIT):        54.6 i/s
+        before(YJIT):        49.8 i/s - 1.10x  slower
+               after:        34.8 i/s - 1.57x  slower
+              before:        34.2 i/s - 1.60x  slower
+
+```
+
+- YJIT=ON : 1.06x - 1.10x faster
+- YJIT=OFF : 0.94x - 1.01x faster
+
+---------
+
+Co-authored-by: Sutou Kouhei <kou@clear-code.com>
+
+CVE: CVE-2024-49761
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/370666e314816b57ecd5878e757224c3b6bc93f5]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .../lib/rexml/parsers/baseparser.rb           | 325 +++++++++---------
+ .bundle/gems/rexml-3.2.5/lib/rexml/source.rb  |  31 +-
+ 2 files changed, 188 insertions(+), 168 deletions(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 595669c..bc59bcd 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -1,4 +1,4 @@
+-# frozen_string_literal: false
++# frozen_string_literal: true
+ require_relative '../parseexception'
+ require_relative '../undefinednamespaceexception'
+ require_relative '../source'
+@@ -112,6 +112,19 @@ module REXML
+         "apos" => [/&apos;/, "&apos;", "'", /'/]
+       }
+
++      module Private
++        INSTRUCTION_END = /#{NAME}(\s+.*?)?\?>/um
++        TAG_PATTERN = /((?>#{QNAME_STR}))/um
++        CLOSE_PATTERN = /(#{QNAME_STR})\s*>/um
++        ATTLISTDECL_END = /\s+#{NAME}(?:#{ATTDEF})*\s*>/um
++        NAME_PATTERN = /\s*#{NAME}/um
++        GEDECL_PATTERN = "\\s+#{NAME}\\s+#{ENTITYDEF}\\s*>"
++        PEDECL_PATTERN = "\\s+(%)\\s+#{NAME}\\s+#{PEDEF}\\s*>"
++        ENTITYDECL_PATTERN = /(?:#{GEDECL_PATTERN})|(?:#{PEDECL_PATTERN})/um
++      end
++      private_constant :Private
++      include Private
++
+       def initialize( source )
+         self.stream = source
+         @listeners = []
+@@ -198,183 +211,172 @@ module REXML
+         #STDERR.puts @source.encoding
+         #STDERR.puts "BUFFER = #{@source.buffer.inspect}"
+         if @document_status == nil
+-          word = @source.match( /\A((?:\s+)|(?:<[^>]*>))/um )
+-          word = word[1] unless word.nil?
+-          #STDERR.puts "WORD = #{word.inspect}"
+-          case word
+-          when COMMENT_START
+-            return [ :comment, @source.match( COMMENT_PATTERN, true )[1] ]
+-          when XMLDECL_START
+-            #STDERR.puts "XMLDECL"
+-            results = @source.match( XMLDECL_PATTERN, true )[1]
+-            version = VERSION.match( results )
+-            version = version[1] unless version.nil?
+-            encoding = ENCODING.match(results)
+-            encoding = encoding[1] unless encoding.nil?
+-            if need_source_encoding_update?(encoding)
+-              @source.encoding = encoding
+-            end
+-            if encoding.nil? and /\AUTF-16(?:BE|LE)\z/i =~ @source.encoding
+-              encoding = "UTF-16"
+-            end
+-            standalone = STANDALONE.match(results)
+-            standalone = standalone[1] unless standalone.nil?
+-            return [ :xmldecl, version, encoding, standalone ]
+-          when INSTRUCTION_START
++          if @source.match("<?", true)
+             return process_instruction
+-          when DOCTYPE_START
+-            base_error_message = "Malformed DOCTYPE"
+-            @source.match(DOCTYPE_START, true)
+-            @nsstack.unshift(curr_ns=Set.new)
+-            name = parse_name(base_error_message)
+-            if @source.match(/\A\s*\[/um, true)
+-              id = [nil, nil, nil]
+-              @document_status = :in_doctype
+-            elsif @source.match(/\A\s*>/um, true)
+-              id = [nil, nil, nil]
+-              @document_status = :after_doctype
+-            else
+-              id = parse_id(base_error_message,
+-                            accept_external_id: true,
+-                            accept_public_id: false)
+-              if id[0] == "SYSTEM"
+-                # For backward compatibility
+-                id[1], id[2] = id[2], nil
++          elsif @source.match("<!", true)
++            if @source.match("--", true)
++              return [ :comment, @source.match(/(.*?)-->/um, true)[1] ]
++            elsif @source.match("DOCTYPE", true)
++              base_error_message = "Malformed DOCTYPE"
++              unless @source.match(/\s+/um, true)
++                if @source.match(">")
++                  message = "#{base_error_message}: name is missing"
++                else
++                  message = "#{base_error_message}: invalid name"
++                end
++                @source.string = "<!DOCTYPE" + @source.buffer
++                raise REXML::ParseException.new(message, @source)
+               end
+-              if @source.match(/\A\s*\[/um, true)
++              @nsstack.unshift(curr_ns=Set.new)
++              name = parse_name(base_error_message)
++              if @source.match(/\s*\[/um, true)
++                id = [nil, nil, nil]
+                 @document_status = :in_doctype
+-              elsif @source.match(/\A\s*>/um, true)
++              elsif @source.match(/\s*>/um, true)
++                id = [nil, nil, nil]
+                 @document_status = :after_doctype
+               else
+-                message = "#{base_error_message}: garbage after external ID"
+-                raise REXML::ParseException.new(message, @source)
++                id = parse_id(base_error_message,
++                              accept_external_id: true,
++                              accept_public_id: false)
++                if id[0] == "SYSTEM"
++                  # For backward compatibility
++                  id[1], id[2] = id[2], nil
++                end
++                if @source.match(/\s*\[/um, true)
++                  @document_status = :in_doctype
++                elsif @source.match(/\s*>/um, true)
++                  @document_status = :after_doctype
++                else
++                  message = "#{base_error_message}: garbage after external ID"
++                  raise REXML::ParseException.new(message, @source)
++                end
+               end
+-            end
+-            args = [:start_doctype, name, *id]
+-            if @document_status == :after_doctype
+-              @source.match(/\A\s*/um, true)
+-              @stack << [ :end_doctype ]
+-            end
+-            return args
+-          when /\A\s+/
+-          else
+-            @document_status = :after_doctype
+-            if @source.encoding == "UTF-8"
+-              @source.buffer_encoding = ::Encoding::UTF_8
++              args = [:start_doctype, name, *id]
++              if @document_status == :after_doctype
++                @source.match(/\s*/um, true)
++                @stack << [ :end_doctype ]
++              end
++              return args
++            else
++              message = "Invalid XML"
++              raise REXML::ParseException.new(message, @source)
+             end
+           end
+         end
+         if @document_status == :in_doctype
+-          md = @source.match(/\A\s*(.*?>)/um)
+-          case md[1]
+-          when SYSTEMENTITY
+-            match = @source.match( SYSTEMENTITY, true )[1]
+-            return [ :externalentity, match ]
+-
+-          when ELEMENTDECL_START
+-            return [ :elementdecl, @source.match( ELEMENTDECL_PATTERN, true )[1] ]
+-
+-          when ENTITY_START
+-            match = [:entitydecl, *@source.match( ENTITYDECL, true ).captures.compact]
+-            ref = false
+-            if match[1] == '%'
+-              ref = true
+-              match.delete_at 1
+-            end
+-            # Now we have to sort out what kind of entity reference this is
+-            if match[2] == 'SYSTEM'
+-              # External reference
+-              match[3] = match[3][1..-2] # PUBID
+-              match.delete_at(4) if match.size > 4 # Chop out NDATA decl
+-              # match is [ :entity, name, SYSTEM, pubid(, ndata)? ]
+-            elsif match[2] == 'PUBLIC'
+-              # External reference
+-              match[3] = match[3][1..-2] # PUBID
+-              match[4] = match[4][1..-2] # HREF
+-              match.delete_at(5) if match.size > 5 # Chop out NDATA decl
+-              # match is [ :entity, name, PUBLIC, pubid, href(, ndata)? ]
+-            else
+-              match[2] = match[2][1..-2]
+-              match.pop if match.size == 4
+-              # match is [ :entity, name, value ]
+-            end
+-            match << '%' if ref
+-            return match
+-          when ATTLISTDECL_START
+-            md = @source.match( ATTLISTDECL_PATTERN, true )
+-            raise REXML::ParseException.new( "Bad ATTLIST declaration!", @source ) if md.nil?
+-            element = md[1]
+-            contents = md[0]
+-
+-            pairs = {}
+-            values = md[0].scan( ATTDEF_RE )
+-            values.each do |attdef|
+-              unless attdef[3] == "#IMPLIED"
+-                attdef.compact!
+-                val = attdef[3]
+-                val = attdef[4] if val == "#FIXED "
+-                pairs[attdef[0]] = val
+-                if attdef[0] =~ /^xmlns:(.*)/
+-                  @nsstack[0] << $1
+-                end
++          @source.match(/\s*/um, true) # skip spaces
++          if @source.match("<!", true)
++            if @source.match("ELEMENT", true)
++              md = @source.match(/(.*?)>/um, true)
++              raise REXML::ParseException.new( "Bad ELEMENT declaration!", @source ) if md.nil?
++              return [ :elementdecl, "<!ELEMENT" + md[1] ]
++            elsif @source.match("ENTITY", true)
++              match = [:entitydecl, *@source.match(ENTITYDECL_PATTERN, true).captures.compact]
++              ref = false
++              if match[1] == '%'
++                ref = true
++                match.delete_at 1
+               end
+-            end
+-            return [ :attlistdecl, element, pairs, contents ]
+-          when NOTATIONDECL_START
+-            base_error_message = "Malformed notation declaration"
+-            unless @source.match(/\A\s*<!NOTATION\s+/um, true)
+-              if @source.match(/\A\s*<!NOTATION\s*>/um)
+-                message = "#{base_error_message}: name is missing"
++              # Now we have to sort out what kind of entity reference this is
++              if match[2] == 'SYSTEM'
++                # External reference
++                match[3] = match[3][1..-2] # PUBID
++                match.delete_at(4) if match.size > 4 # Chop out NDATA decl
++                # match is [ :entity, name, SYSTEM, pubid(, ndata)? ]
++              elsif match[2] == 'PUBLIC'
++                # External reference
++                match[3] = match[3][1..-2] # PUBID
++                match[4] = match[4][1..-2] # HREF
++                match.delete_at(5) if match.size > 5 # Chop out NDATA decl
++                # match is [ :entity, name, PUBLIC, pubid, href(, ndata)? ]
+               else
+-                message = "#{base_error_message}: invalid declaration name"
++                match[2] = match[2][1..-2]
++                match.pop if match.size == 4
++                # match is [ :entity, name, value ]
+               end
+-              raise REXML::ParseException.new(message, @source)
+-            end
+-            name = parse_name(base_error_message)
+-            id = parse_id(base_error_message,
+-                          accept_external_id: true,
+-                          accept_public_id: true)
+-            unless @source.match(/\A\s*>/um, true)
+-              message = "#{base_error_message}: garbage before end >"
+-              raise REXML::ParseException.new(message, @source)
++              match << '%' if ref
++              return match
++            elsif @source.match("ATTLIST", true)
++              md = @source.match(ATTLISTDECL_END, true)
++              raise REXML::ParseException.new( "Bad ATTLIST declaration!", @source ) if md.nil?
++              element = md[1]
++              contents = md[0]
++
++              pairs = {}
++              values = md[0].scan( ATTDEF_RE )
++              values.each do |attdef|
++                unless attdef[3] == "#IMPLIED"
++                  attdef.compact!
++                  val = attdef[3]
++                  val = attdef[4] if val == "#FIXED "
++                  pairs[attdef[0]] = val
++                  if attdef[0] =~ /^xmlns:(.*)/
++                    @nsstack[0] << $1
++                  end
++                end
++              end
++              return [ :attlistdecl, element, pairs, contents ]
++            elsif @source.match("NOTATION", true)
++              base_error_message = "Malformed notation declaration"
++              unless @source.match(/\s+/um, true)
++                if @source.match(">")
++                  message = "#{base_error_message}: name is missing"
++                else
++                  message = "#{base_error_message}: invalid name"
++                end
++                @source.string = " <!NOTATION" + @source.buffer
++                raise REXML::ParseException.new(message, @source)
++              end
++              name = parse_name(base_error_message)
++              id = parse_id(base_error_message,
++                            accept_external_id: true,
++                            accept_public_id: true)
++              unless @source.match(/\s*>/um, true)
++                message = "#{base_error_message}: garbage before end >"
++                raise REXML::ParseException.new(message, @source)
++              end
++              return [:notationdecl, name, *id]
++            elsif md = @source.match(/--(.*?)-->/um, true)
++              case md[1]
++              when /--/, /-\z/
++                raise REXML::ParseException.new("Malformed comment", @source)
++              end
++              return [ :comment, md[1] ] if md
+             end
+-            return [:notationdecl, name, *id]
+-          when DOCTYPE_END
++          elsif match = @source.match(/(%.*?;)\s*/um, true)
++            return [ :externalentity, match[1] ]
++          elsif @source.match(/\]\s*>/um, true)
+             @document_status = :after_doctype
+-            @source.match( DOCTYPE_END, true )
+             return [ :end_doctype ]
+           end
+         end
+         if @document_status == :after_doctype
+-          @source.match(/\A\s*/um, true)
++          @source.match(/\s*/um, true)
+         end
+         begin
+-          next_data = @source.buffer
+-          if next_data.size < 2
+-            @source.read
+-            next_data = @source.buffer
+-          end
+-          if next_data[0] == ?<
+-            if next_data[1] == ?/
++          if @source.match("<", true)
++            if @source.match("/", true)
+               @nsstack.shift
+               last_tag = @tags.pop
+-              md = @source.match( CLOSE_MATCH, true )
++              md = @source.match(CLOSE_PATTERN, true)
+               if md and !last_tag
+                 message = "Unexpected top-level end tag (got '#{md[1]}')"
+                 raise REXML::ParseException.new(message, @source)
+               end
+               if md.nil? or last_tag != md[1]
+                 message = "Missing end tag for '#{last_tag}'"
+-                message << " (got '#{md[1]}')" if md
++                message += " (got '#{md[1]}')" if md
++                @source.string = "</" + @source.buffer if md.nil?
+                 raise REXML::ParseException.new(message, @source)
+               end
+               return [ :end_element, last_tag ]
+-            elsif next_data[1] == ?!
+-              md = @source.match(/\A(\s*[^>]*>)/um)
++            elsif @source.match("!", true)
++              md = @source.match(/([^>]*>)/um)
+               #STDERR.puts "SOURCE BUFFER = #{source.buffer}, #{source.buffer.size}"
+               raise REXML::ParseException.new("Malformed node", @source) unless md
+-              if md[0][2] == ?-
+-                md = @source.match( COMMENT_PATTERN, true )
++              if md[0][0] == ?-
++                md = @source.match(/--(.*?)-->/um, true)
+
+                 case md[1]
+                 when /--/, /-\z/
+@@ -383,17 +385,18 @@ module REXML
+
+                 return [ :comment, md[1] ] if md
+               else
+-                md = @source.match( CDATA_PATTERN, true )
++                md = @source.match(/\[CDATA\[(.*?)\]\]>/um, true)
+                 return [ :cdata, md[1] ] if md
+               end
+               raise REXML::ParseException.new( "Declarations can only occur "+
+                 "in the doctype declaration.", @source)
+-            elsif next_data[1] == ??
++            elsif @source.match("?", true)
+               return process_instruction
+             else
+               # Get the next tag
+-              md = @source.match(TAG_MATCH, true)
++              md = @source.match(TAG_PATTERN, true)
+               unless md
++                @source.string = "<" + @source.buffer
+                 raise REXML::ParseException.new("malformed XML: missing tag start", @source)
+               end
+               tag = md[1]
+@@ -418,7 +421,7 @@ module REXML
+               return [ :start_element, tag, attributes ]
+             end
+           else
+-            md = @source.match( TEXT_PATTERN, true )
++            md = @source.match(/([^<]*)/um, true)
+             text = md[1]
+             return [ :text, text ]
+           end
+@@ -462,8 +465,7 @@ module REXML
+
+       # Unescapes all possible entities
+       def unnormalize( string, entities=nil, filter=nil )
+-        rv = string.clone
+-        rv.gsub!( /\r\n?/, "\n" )
++        rv = string.gsub( /\r\n?/, "\n" )
+         matches = rv.scan( REFERENCE_RE )
+         return rv if matches.size == 0
+         rv.gsub!( /&#0*((?:\d+)|(?:x[a-fA-F0-9]+));/ ) {
+@@ -498,9 +500,9 @@ module REXML
+       end
+
+       def parse_name(base_error_message)
+-        md = @source.match(/\A\s*#{NAME}/um, true)
++        md = @source.match(NAME_PATTERN, true)
+         unless md
+-          if @source.match(/\A\s*\S/um)
++          if @source.match(/\s*\S/um)
+             message = "#{base_error_message}: invalid name"
+           else
+             message = "#{base_error_message}: name is missing"
+@@ -577,11 +579,28 @@ module REXML
+       end
+
+       def process_instruction
+-        match_data = @source.match(INSTRUCTION_PATTERN, true)
++        match_data = @source.match(INSTRUCTION_END, true)
+         unless match_data
+           message = "Invalid processing instruction node"
++          @source.string = "<?" + @source.buffer
+           raise REXML::ParseException.new(message, @source)
+         end
++        if @document_status.nil? and match_data[1] == "xml"
++          content = match_data[2]
++          version = VERSION.match(content)
++          version = version[1] unless version.nil?
++          encoding = ENCODING.match(content)
++          encoding = encoding[1] unless encoding.nil?
++          if need_source_encoding_update?(encoding)
++            @source.encoding = encoding
++          end
++          if encoding.nil? and /\AUTF-16(?:BE|LE)\z/i =~ @source.encoding
++            encoding = "UTF-16"
++          end
++          standalone = STANDALONE.match(content)
++          standalone = standalone[1] unless standalone.nil?
++          return [ :xmldecl, version, encoding, standalone ]
++        end
+         [:processing_instruction, match_data[1], match_data[2]]
+       end
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
+index db78a12..4111d1d 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
+@@ -76,6 +76,10 @@ module REXML
+       end
+     end
+
++    def string=(string)
++      @scanner.string = string
++    end
++
+     # @return true if the Source is exhausted
+     def empty?
+       @scanner.eos?
+@@ -150,28 +154,25 @@ module REXML
+     def read
+       begin
+         @scanner << readline
++        true
+       rescue Exception, NameError
+         @source = nil
++        false
+       end
+     end
+
+     def match( pattern, cons=false )
+-      if cons
+-        md = @scanner.scan(pattern)
+-      else
+-        md = @scanner.check(pattern)
+-      end
+-      while md.nil? and @source
+-        begin
+-          @scanner << readline
+-          if cons
+-            md = @scanner.scan(pattern)
+-          else
+-            md = @scanner.check(pattern)
+-          end
+-        rescue
+-          @source = nil
++      read if @scanner.eos? && @source
++      while true
++        if cons
++          md = @scanner.scan(pattern)
++        else
++          md = @scanner.check(pattern)
+         end
++        break if md
++        return nil if pattern.is_a?(String) && pattern.bytesize <= @scanner.rest_size
++        return nil if @source.nil?
++        return nil unless read
+       end
+
+       md.nil? ? nil : @scanner
+--
+2.40.0
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0008.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0008.patch
new file mode 100644
index 0000000000..959f8a0794
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0008.patch
@@ -0,0 +1,107 @@
+From a579730f25ec7443796495541ec57c071b91805d Mon Sep 17 00:00:00 2001
+From: NAITOH Jun <naitoh@gmail.com>
+Date: Tue, 25 Jun 2024 09:07:11 +0900
+Subject: [PATCH] Optimize BaseParser#unnormalize method (#158)
+
+## Benchmark
+```
+RUBYLIB= BUNDLER_ORIG_RUBYLIB= /Users/naitoh/.rbenv/versions/3.3.3/bin/ruby -v -S benchmark-driver /Users/naitoh/ghq/github.com/naitoh/rexml/benchmark/parse.yaml
+ruby 3.3.3 (2024-06-12 revision f1c7b6f435) [arm64-darwin22]
+Calculating -------------------------------------
+                         before       after  before(YJIT)  after(YJIT)
+                 dom     17.704      18.106        34.215       33.806 i/s -     100.000 times in 5.648398s 5.523110s 2.922698s 2.958036s
+                 sax     25.664      25.302        48.429       48.602 i/s -     100.000 times in 3.896488s 3.952289s 2.064859s 2.057537s
+                pull     28.966      29.215        61.710       62.068 i/s -     100.000 times in 3.452275s 3.422901s 1.620480s 1.611129s
+              stream     28.291      28.426        53.860       55.548 i/s -     100.000 times in 3.534716s 3.517884s 1.856667s 1.800247s
+
+Comparison:
+                              dom
+        before(YJIT):        34.2 i/s
+         after(YJIT):        33.8 i/s - 1.01x  slower
+               after:        18.1 i/s - 1.89x  slower
+              before:        17.7 i/s - 1.93x  slower
+
+                              sax
+         after(YJIT):        48.6 i/s
+        before(YJIT):        48.4 i/s - 1.00x  slower
+              before:        25.7 i/s - 1.89x  slower
+               after:        25.3 i/s - 1.92x  slower
+
+                             pull
+         after(YJIT):        62.1 i/s
+        before(YJIT):        61.7 i/s - 1.01x  slower
+               after:        29.2 i/s - 2.12x  slower
+              before:        29.0 i/s - 2.14x  slower
+
+                           stream
+         after(YJIT):        55.5 i/s
+        before(YJIT):        53.9 i/s - 1.03x  slower
+               after:        28.4 i/s - 1.95x  slower
+              before:        28.3 i/s - 1.96x  slower
+
+```
+
+- YJIT=ON : 1.00x - 1.03x faster
+- YJIT=OFF : 0.98x - 1.02x faster
+
+CVE: CVE-2024-49761
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/a579730f25ec7443796495541ec57c071b91805d]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .../rexml-3.2.5/lib/rexml/parsers/baseparser.rb   | 15 +++++++++++----
+ 1 file changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index bc59bcd..9983d51 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -121,6 +121,13 @@ module REXML
+         GEDECL_PATTERN = "\\s+#{NAME}\\s+#{ENTITYDEF}\\s*>"
+         PEDECL_PATTERN = "\\s+(%)\\s+#{NAME}\\s+#{PEDEF}\\s*>"
+         ENTITYDECL_PATTERN = /(?:#{GEDECL_PATTERN})|(?:#{PEDECL_PATTERN})/um
++        CARRIAGE_RETURN_NEWLINE_PATTERN = /\r\n?/
++        CHARACTER_REFERENCES = /&#0*((?:\d+)|(?:x[a-fA-F0-9]+));/
++        DEFAULT_ENTITIES_PATTERNS = {}
++        default_entities = ['gt', 'lt', 'quot', 'apos', 'amp']
++        default_entities.each do |term|
++          DEFAULT_ENTITIES_PATTERNS[term] = /&#{term};/
++        end
+       end
+       private_constant :Private
+       include Private
+@@ -465,10 +472,10 @@ module REXML
+ 
+       # Unescapes all possible entities
+       def unnormalize( string, entities=nil, filter=nil )
+-        rv = string.gsub( /\r\n?/, "\n" )
++        rv = string.gsub( Private::CARRIAGE_RETURN_NEWLINE_PATTERN, "\n" )
+         matches = rv.scan( REFERENCE_RE )
+         return rv if matches.size == 0
+-        rv.gsub!( /&#0*((?:\d+)|(?:x[a-fA-F0-9]+));/ ) {
++        rv.gsub!( Private::CHARACTER_REFERENCES ) {
+           m=$1
+           m = "0#{m}" if m[0] == ?x
+           [Integer(m)].pack('U*')
+@@ -479,7 +486,7 @@ module REXML
+             unless filter and filter.include?(entity_reference)
+               entity_value = entity( entity_reference, entities )
+               if entity_value
+-                re = /&#{entity_reference};/
++                re = Private::DEFAULT_ENTITIES_PATTERNS[entity_reference] || /&#{entity_reference};/
+                 rv.gsub!( re, entity_value )
+               else
+                 er = DEFAULT_ENTITIES[entity_reference]
+@@ -487,7 +494,7 @@ module REXML
+               end
+             end
+           end
+-          rv.gsub!( /&amp;/, '&' )
++          rv.gsub!( Private::DEFAULT_ENTITIES_PATTERNS['amp'], '&' )
+         end
+         rv
+       end
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0009.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0009.patch
new file mode 100644
index 0000000000..58a0894b09
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0009.patch
@@ -0,0 +1,46 @@
+From ce59f2eb1aeb371fe1643414f06618dbe031979f Mon Sep 17 00:00:00 2001
+From: Sutou Kouhei <kou@clear-code.com>
+Date: Thu, 24 Oct 2024 14:45:31 +0900
+Subject: [PATCH] parser: fix a bug that &#0x...; is accepted as a character 
+ reference
+
+CVE: CVE-2024-49761
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/ce59f2eb1aeb371fe1643414f06618dbe031979f]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .../gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb   | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 9983d51..661f0e2 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -122,7 +122,7 @@ module REXML
+         PEDECL_PATTERN = "\\s+(%)\\s+#{NAME}\\s+#{PEDEF}\\s*>"
+         ENTITYDECL_PATTERN = /(?:#{GEDECL_PATTERN})|(?:#{PEDECL_PATTERN})/um
+         CARRIAGE_RETURN_NEWLINE_PATTERN = /\r\n?/
+-        CHARACTER_REFERENCES = /&#0*((?:\d+)|(?:x[a-fA-F0-9]+));/
++        CHARACTER_REFERENCES = /&#((?:\d+)|(?:x[a-fA-F0-9]+));/
+         DEFAULT_ENTITIES_PATTERNS = {}
+         default_entities = ['gt', 'lt', 'quot', 'apos', 'amp']
+         default_entities.each do |term|
+@@ -477,8 +477,12 @@ module REXML
+         return rv if matches.size == 0
+         rv.gsub!( Private::CHARACTER_REFERENCES ) {
+           m=$1
+-          m = "0#{m}" if m[0] == ?x
+-          [Integer(m)].pack('U*')
++          if m.start_with?("x")
++            code_point = Integer(m[1..-1], 16)
++          else
++            code_point = Integer(m, 10)
++          end
++          [code_point].pack('U*')
+         }
+         matches.collect!{|x|x[0]}.compact!
+         if matches.size > 0
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index a00df5d191..eec7e4684c 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -36,6 +36,15 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2024-27281.patch \
            file://CVE-2024-27280.patch \
            file://CVE-2024-27282.patch \
+           file://CVE-2024-49761-0001.patch \
+           file://CVE-2024-49761-0002.patch \
+           file://CVE-2024-49761-0003.patch \
+           file://CVE-2024-49761-0004.patch \
+           file://CVE-2024-49761-0005.patch \
+           file://CVE-2024-49761-0006.patch \
+           file://CVE-2024-49761-0007.patch \
+           file://CVE-2024-49761-0008.patch \
+           file://CVE-2024-49761-0009.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.43.0


