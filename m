Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038BFD0EE2C
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 20:55:10 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4184.1764104103647898316
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 12:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aPX6NzGz;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-343806688c5so5053702a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 12:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764104103; x=1764708903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7attq8GevIUBM9vDsRMY4IETD5RxAmqNfZhwQvShrXg=;
        b=aPX6NzGzRQHmdNueYKwusoI0cCIrhI78D6vLgUqPti6APgv7crwpKlgOVvablScLSi
         vVCpCb9AqpsVTrUacvI/LEtv9vCMlKVvfGnWii59ud6GLn6pCjnaM4Jx8QRsNveOLXrT
         PSZ1t/seqFQ79fcdIOf1ftbPcA945qK4Ix/rw8Sy5WcU0S/6dXIVXwpt0Qa78kwqu44s
         yEfRUt0Xzr13QCw8oIxTuh/5U7CECeQCvLLH/snCCwsLg1sLOgN/rtww2tiFbDrVhmql
         EXdA9ecnXT7FX6AdkCW+oYk4sa8ArhecCfY8+k4pa8B22CHp9aYDCIOzKQ/hmrGy0HWJ
         D07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764104103; x=1764708903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7attq8GevIUBM9vDsRMY4IETD5RxAmqNfZhwQvShrXg=;
        b=aTKIL+K/DcAtHpz9NAsmUZYEz/0cmXqyyFC/cRVCGfH+ZgFyvCkaxRMsIWfniGOGnB
         4OgzrKF4iEAuO1X9mBzv6MSU+fxLsswnfFQaGsZDb2lcmZjPQ+/BRyEHWZoNj8uTi/sl
         8U4AZV3/AmOUKlzeFPK+uIbaE/u8bU0cS6QcpXU/m755zSayMSU1n1rQq+8QL7ELyx7U
         W6B0SQFARhmfAkmd9Xtr1nkBHCTzYXewOodoBNJZyW4WJ0IuaQuGjzqIC51OSDAaBQOF
         7hhovwH2lfOjV5L7EW/poKsiSHupp4BsRMDjLXOZO982TawRcO/sjqQh+m2PZ3wf7zgc
         koMQ==
X-Gm-Message-State: AOJu0YxoKb8uxiGFH4GTWG33RdTyiUyob50IFnQhUw8A3qUAZMyRBJOH
	wltd77F/6Ue3NiPrYe/eAe4bng6eig5JhB6qh3NVv6xaxNvkD0SbTmaRT2gmdHnygzJL5Rwkg36
	yKe2n
X-Gm-Gg: ASbGncsF2tYtFvKwahXOtTilxLUJSG9LCbcs7i7YYZ5gr3wVlX8ngT8v6MuYC6vafGw
	lcX5nEFEN2M7d+HB/XdLzy7kiLWKZQhcPAIeQxWL5FTs8YWduTz0KumPtm7tP/Pz5R2GPeu6PST
	s6eCSVKJ+CY2yTLKUrUafSQ66C3WRIfhKN1oxYZFWhYC9Ro433TZQliw2V/UJQtW/nw2OkVADF0
	EnBp6MXHI2/xJ9foeyfu1xNkXcGh+EVLChbUe2dsmbo13x6sw0/EG07Bkp2GerUUDVMxMy1LenK
	1xPc5vdJhhdn6PuBrsudBpPrwcxMRBnOvvSes5GgrY7vgjeNy2WoKfwf6+rJ6MjS+niJhP1iAtt
	r69br27BHMdya+KClcf2zZsRwYxdlTyLnCn+C7gdLNsQ8VEgYiGqAs629U17Z0SwE8brvpCdhO1
	A7Vw==
X-Google-Smtp-Source: AGHT+IFCAuyKGJuhTyX6ZuooBD7q96xqjWnZFL4ha5ZXWfSztQb5xMn/u/NW8Lb3k3+ZsG4X/gTdaA==
X-Received: by 2002:a17:90b:1c04:b0:340:dd2c:a3da with SMTP id 98e67ed59e1d1-3475ebe6a55mr3680804a91.8.1764104102770;
        Tue, 25 Nov 2025 12:55:02 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a5a3099sm322602a91.11.2025.11.25.12.55.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:55:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/9] ruby: fix CVE-2024-35176
Date: Tue, 25 Nov 2025 12:54:45 -0800
Message-ID: <a89fcaf0c3ac2afd95e836bc1356832296135696.1764103986.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764103986.git.steve@sakoman.com>
References: <cover.1764103986.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 20:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226777

From: Divya Chellam <divya.chellam@windriver.com>

REXML is an XML toolkit for Ruby. The REXML gem before 3.2.6 has a
denial of service vulnerability when it parses an XML that has many
`<`s in an attribute value. Those who need to parse untrusted XMLs
may be impacted to this vulnerability. The REXML gem 3.2.7 or later
include the patch to fix this vulnerability. As a workaround, don't
parse untrusted XMLs.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-35176

Upstream-patch:
https://github.com/ruby/rexml/commit/4325835f92f3f142ebd91a3fdba4e1f1ab7f1cfb

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ruby/ruby/CVE-2024-35176.patch            | 112 ++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-35176.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-35176.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-35176.patch
new file mode 100644
index 0000000000..83fa3fa4e7
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-35176.patch
@@ -0,0 +1,112 @@
+From 4325835f92f3f142ebd91a3fdba4e1f1ab7f1cfb Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <nobu@ruby-lang.org>
+Date: Thu, 16 May 2024 11:26:51 +0900
+Subject: [PATCH] Read quoted attributes in chunks (#126)
+
+CVE: CVE-2024-35176
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/4325835f92f3f142ebd91a3fdba4e1f1ab7f1cfb]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .../lib/rexml/parsers/baseparser.rb           | 20 ++++++-------
+ .bundle/gems/rexml-3.2.5/lib/rexml/source.rb  | 29 +++++++++++++++----
+ 2 files changed, 34 insertions(+), 15 deletions(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index b97beb3..eab942d 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -675,17 +675,17 @@ module REXML
+               message = "Missing attribute equal: <#{name}>"
+               raise REXML::ParseException.new(message, @source)
+             end
+-            unless match = @source.match(/(['"])(.*?)\1\s*/um, true)
+-              if match = @source.match(/(['"])/, true)
+-                message =
+-                  "Missing attribute value end quote: <#{name}>: <#{match[1]}>"
+-                raise REXML::ParseException.new(message, @source)
+-              else
+-                message = "Missing attribute value start quote: <#{name}>"
+-                raise REXML::ParseException.new(message, @source)
+-              end
++            unless match = @source.match(/(['"])/, true)
++              message = "Missing attribute value start quote: <#{name}>"
++              raise REXML::ParseException.new(message, @source)
++            end
++            quote = match[1]
++            value = @source.read_until(quote)
++            unless value.chomp!(quote)
++              message = "Missing attribute value end quote: <#{name}>: <#{quote}>"
++              raise REXML::ParseException.new(message, @source)
+             end
+-            value = match[2]
++            @source.match(/\s*/um, true)
+             if prefix == "xmlns"
+               if local_part == "xml"
+                 if value != "http://www.w3.org/XML/1998/namespace"
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
+index 4111d1d..7132147 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
+@@ -65,7 +65,11 @@ module REXML
+       encoding_updated
+     end
+ 
+-    def read
++    def read(term = nil)
++    end
++
++    def read_until(term)
++      @scanner.scan_until(Regexp.union(term)) or @scanner.rest
+     end
+ 
+     def match(pattern, cons=false)
+@@ -151,9 +155,9 @@ module REXML
+       end
+     end
+ 
+-    def read
++    def read(term = nil)
+       begin
+-        @scanner << readline
++        @scanner << readline(term)
+         true
+       rescue Exception, NameError
+         @source = nil
+@@ -161,6 +165,21 @@ module REXML
+       end
+     end
+ 
++    def read_until(term)
++      pattern = Regexp.union(term)
++      data = []
++      begin
++        until str = @scanner.scan_until(pattern)
++          @scanner << readline(term)
++        end
++      rescue EOFError
++        @scanner.rest
++      else
++        read if @scanner.eos? and !@source.eof?
++        str
++      end
++    end
++
+     def match( pattern, cons=false )
+       read if @scanner.eos? && @source
+       while true
+@@ -205,8 +224,8 @@ module REXML
+     end
+ 
+     private
+-    def readline
+-      str = @source.readline(@line_break)
++    def readline(term = nil)
++      str = @source.readline(term || @line_break)
+       if @pending_buffer
+         if str.nil?
+           str = @pending_buffer
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index 19641e5a51..6a381b2e40 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -53,6 +53,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2024-43398-0003.patch \
            file://CVE-2025-27221-0001.patch \
            file://CVE-2025-27221-0002.patch \
+           file://CVE-2024-35176.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.43.0


