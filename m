Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3432CEB64DC
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 06:19:04 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web11.7071.1689833939108714617
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 23:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=F5rRs6Yw;
 spf=pass (domain: mvista.com, ip: 209.85.166.174, mailfrom: hprajapati@mvista.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3457a3ada84so2598005ab.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 23:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1689833938; x=1692425938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3xVGYyUuKS1gHr8fpAwaYyNloxR6ORe3nn5Obwr8O8E=;
        b=F5rRs6Ywh4YmlcuTueCiSBa5KGhcxSS2oHVf8tGZRf2xosGibklDw5XrgT/pZHrn/w
         CCD59x668//3SRC4h0rmUcnL7gdZnWm3cFkoo7uws32rvRJWavkX7avsEKZW6Zd5jTCc
         DQdL4cLgymHPGJmPQxWrHu15KZ+dROcfFyFtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689833938; x=1692425938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xVGYyUuKS1gHr8fpAwaYyNloxR6ORe3nn5Obwr8O8E=;
        b=e/HG2+PbEmemRVeWYO5nT3ehsvk3CXXu//Bgt49y4aAiRqJT8lg5/TCsKj/aWpPBkb
         mfhHEbGJDcaM3MaFZ9V161j+0zAWEsLRYSPEVXRMEkR4A+ewo5Bg6Qo00Qxspy7LouZr
         zIfIg9O4WdY6dHH5NG3eZrZpX6qPuq9EVmLQJAXGYooP80ElBxy0eTle/tU9niiQ0KYx
         YFnSgWSGU2wCVUuka6yO/STHWLpYEb82zXX03WE+xm+85j5WYE+E08/WsITU72gzYJhX
         QC70rUbTmQEJ8gI78Dt697j2OTGcM7uPWS9QA1cvEsuV4Sil0d892Eiz2QnFeDEcYc2Q
         /bBQ==
X-Gm-Message-State: ABy/qLb/vMIWU5nDkQp/6M8N7UGhydfeadmIYujtyc/AkZPZTA9+/p1b
	nymDoCk5q49VhB/MBQz0f3jnaNdh7lPhDW2o+Xsewg==
X-Google-Smtp-Source: APBJJlG85/eeXZK691bRgaPRX1kIBrf2WKixCWWdhpuh+HcyrNAljql/mUnWvAisLqmuU+pvkgFidw==
X-Received: by 2002:a92:4a12:0:b0:348:8163:b6be with SMTP id m18-20020a924a12000000b003488163b6bemr6506251ilf.30.1689833937709;
        Wed, 19 Jul 2023 23:18:57 -0700 (PDT)
Received: from MVIN00024 ([27.121.101.120])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a7f8400b00265c742a262sm354582pjl.4.2023.07.19.23.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 23:18:57 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Thu, 20 Jul 2023 11:48:51 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] ruby/cgi-gem: CVE-2021-33621 HTTP response splitting in CGI
Date: Thu, 20 Jul 2023 11:48:50 +0530
Message-Id: <20230720061850.14599-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 06:19:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184621

Upstream-Status: Backport from https://github.com/ruby/cgi/commit/64c5045c0a6b84fdb938a8465a0890e5f7162708

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../ruby/ruby/CVE-2021-33621.patch            | 139 ++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_2.7.6.bb      |   1 +
 2 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2021-33621.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2021-33621.patch b/meta/recipes-devtools/ruby/ruby/CVE-2021-33621.patch
new file mode 100644
index 0000000000..cc2f9853db
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2021-33621.patch
@@ -0,0 +1,139 @@
+From 64c5045c0a6b84fdb938a8465a0890e5f7162708 Mon Sep 17 00:00:00 2001
+From: Yusuke Endoh <mame@ruby-lang.org>
+Date: Tue, 22 Nov 2022 10:49:27 +0900
+Subject: [PATCH] Prevent CRLF injection
+
+Throw a RuntimeError if the HTTP response header contains CR or LF to
+prevent HTTP response splitting.
+
+https://hackerone.com/reports/1204695
+
+Upstream-Status: Backport [https://github.com/ruby/cgi/commit/64c5045c0a6b84fdb938a8465a0890e5f7162708]
+CVE: CVE-2021-33621
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/cgi/core.rb             | 45 +++++++++++++++++++++++--------------
+ test/cgi/test_cgi_header.rb |  8 +++++++
+ 2 files changed, 36 insertions(+), 17 deletions(-)
+
+diff --git a/lib/cgi/core.rb b/lib/cgi/core.rb
+index bec76e0..62e6068 100644
+--- a/lib/cgi/core.rb
++++ b/lib/cgi/core.rb
+@@ -188,17 +188,28 @@ class CGI
+   # Using #header with the HTML5 tag maker will create a <header> element.
+   alias :header :http_header
+ 
++  def _no_crlf_check(str)
++    if str
++      str = str.to_s
++      raise "A HTTP status or header field must not include CR and LF" if str =~ /[\r\n]/
++      str
++    else
++      nil
++    end
++  end
++  private :_no_crlf_check
++
+   def _header_for_string(content_type) #:nodoc:
+     buf = ''.dup
+     if nph?()
+-      buf << "#{$CGI_ENV['SERVER_PROTOCOL'] || 'HTTP/1.0'} 200 OK#{EOL}"
++      buf << "#{_no_crlf_check($CGI_ENV['SERVER_PROTOCOL']) || 'HTTP/1.0'} 200 OK#{EOL}"
+       buf << "Date: #{CGI.rfc1123_date(Time.now)}#{EOL}"
+-      buf << "Server: #{$CGI_ENV['SERVER_SOFTWARE']}#{EOL}"
++      buf << "Server: #{_no_crlf_check($CGI_ENV['SERVER_SOFTWARE'])}#{EOL}"
+       buf << "Connection: close#{EOL}"
+     end
+-    buf << "Content-Type: #{content_type}#{EOL}"
++    buf << "Content-Type: #{_no_crlf_check(content_type)}#{EOL}"
+     if @output_cookies
+-      @output_cookies.each {|cookie| buf << "Set-Cookie: #{cookie}#{EOL}" }
++      @output_cookies.each {|cookie| buf << "Set-Cookie: #{_no_crlf_check(cookie)}#{EOL}" }
+     end
+     return buf
+   end # _header_for_string
+@@ -213,9 +224,9 @@ class CGI
+     ## NPH
+     options.delete('nph') if defined?(MOD_RUBY)
+     if options.delete('nph') || nph?()
+-      protocol = $CGI_ENV['SERVER_PROTOCOL'] || 'HTTP/1.0'
++      protocol = _no_crlf_check($CGI_ENV['SERVER_PROTOCOL']) || 'HTTP/1.0'
+       status = options.delete('status')
+-      status = HTTP_STATUS[status] || status || '200 OK'
++      status = HTTP_STATUS[status] || _no_crlf_check(status) || '200 OK'
+       buf << "#{protocol} #{status}#{EOL}"
+       buf << "Date: #{CGI.rfc1123_date(Time.now)}#{EOL}"
+       options['server'] ||= $CGI_ENV['SERVER_SOFTWARE'] || ''
+@@ -223,38 +234,38 @@ class CGI
+     end
+     ## common headers
+     status = options.delete('status')
+-    buf << "Status: #{HTTP_STATUS[status] || status}#{EOL}" if status
++    buf << "Status: #{HTTP_STATUS[status] || _no_crlf_check(status)}#{EOL}" if status
+     server = options.delete('server')
+-    buf << "Server: #{server}#{EOL}" if server
++    buf << "Server: #{_no_crlf_check(server)}#{EOL}" if server
+     connection = options.delete('connection')
+-    buf << "Connection: #{connection}#{EOL}" if connection
++    buf << "Connection: #{_no_crlf_check(connection)}#{EOL}" if connection
+     type = options.delete('type')
+-    buf << "Content-Type: #{type}#{EOL}" #if type
++    buf << "Content-Type: #{_no_crlf_check(type)}#{EOL}" #if type
+     length = options.delete('length')
+-    buf << "Content-Length: #{length}#{EOL}" if length
++    buf << "Content-Length: #{_no_crlf_check(length)}#{EOL}" if length
+     language = options.delete('language')
+-    buf << "Content-Language: #{language}#{EOL}" if language
++    buf << "Content-Language: #{_no_crlf_check(language)}#{EOL}" if language
+     expires = options.delete('expires')
+     buf << "Expires: #{CGI.rfc1123_date(expires)}#{EOL}" if expires
+     ## cookie
+     if cookie = options.delete('cookie')
+       case cookie
+       when String, Cookie
+-        buf << "Set-Cookie: #{cookie}#{EOL}"
++        buf << "Set-Cookie: #{_no_crlf_check(cookie)}#{EOL}"
+       when Array
+         arr = cookie
+-        arr.each {|c| buf << "Set-Cookie: #{c}#{EOL}" }
++        arr.each {|c| buf << "Set-Cookie: #{_no_crlf_check(c)}#{EOL}" }
+       when Hash
+         hash = cookie
+-        hash.each_value {|c| buf << "Set-Cookie: #{c}#{EOL}" }
++        hash.each_value {|c| buf << "Set-Cookie: #{_no_crlf_check(c)}#{EOL}" }
+       end
+     end
+     if @output_cookies
+-      @output_cookies.each {|c| buf << "Set-Cookie: #{c}#{EOL}" }
++      @output_cookies.each {|c| buf << "Set-Cookie: #{_no_crlf_check(c)}#{EOL}" }
+     end
+     ## other headers
+     options.each do |key, value|
+-      buf << "#{key}: #{value}#{EOL}"
++      buf << "#{_no_crlf_check(key)}: #{_no_crlf_check(value)}#{EOL}"
+     end
+     return buf
+   end # _header_for_hash
+diff --git a/test/cgi/test_cgi_header.rb b/test/cgi/test_cgi_header.rb
+index bab2d03..ec2f4de 100644
+--- a/test/cgi/test_cgi_header.rb
++++ b/test/cgi/test_cgi_header.rb
+@@ -176,6 +176,14 @@ class CGIHeaderTest < Test::Unit::TestCase
+   end
+ 
+ 
++  def test_cgi_http_header_crlf_injection
++    cgi = CGI.new
++    assert_raise(RuntimeError) { cgi.http_header("text/xhtml\r\nBOO") }
++    assert_raise(RuntimeError) { cgi.http_header("type" => "text/xhtml\r\nBOO") }
++    assert_raise(RuntimeError) { cgi.http_header("status" => "200 OK\r\nBOO") }
++    assert_raise(RuntimeError) { cgi.http_header("location" => "text/xhtml\r\nBOO") }
++  end
++
+ 
+   instance_methods.each do |method|
+     private method if method =~ /^test_(.*)/ && $1 != ENV['TEST']
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/ruby/ruby_2.7.6.bb b/meta/recipes-devtools/ruby/ruby_2.7.6.bb
index 91ffde5fa3..7e6373bd24 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.6.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.6.bb
@@ -8,6 +8,7 @@ SRC_URI += " \
            file://0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch \
            file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
            file://CVE-2023-28756.patch \
+           file://CVE-2021-33621.patch \
            "
 
 SRC_URI[md5sum] = "f972fb0cce662966bec10d5c5f32d042"
-- 
2.25.1


