Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AA2EB64DD
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 21:18:39 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.93996.1691961518829896993
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 14:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=FkuLndzl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-26934bc3059so3263364a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 14:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691961518; x=1692566318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9TpSKyHIKB271Lc9+JiPqCdCBurjG3vixiJZtLO9WE=;
        b=FkuLndzlfh+l2AV36ajb7W6FCzEAR5nnp8QFAv8Pvww902cFuPGKRXDunujG16SccG
         oidlmEdOKk10bQLXnupxFl12Dyr3XZY/FrAkAk0oQ/9v7ZqxOMjBi9a2f9qedTqndxmH
         6XXApd1k0NwKgjSYN9AbcXaxL4AYOdN8UxaW49B6jZAPTccbExxgPYuZpDK3L21F6n6Z
         OrdlBGaIdJ4kBI5GeAV4wvTSP7Chp38VvXVdNtUUAB+/5CxceYGBoxzHczdvw0O3N1Y4
         SN5vPDTQMZye9u8V0Is7myUG2MzyhSK5a/hidWp5ZFCYCbkAhb4EMTGYqmFZzcWxQ+El
         eyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691961518; x=1692566318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9TpSKyHIKB271Lc9+JiPqCdCBurjG3vixiJZtLO9WE=;
        b=gmkHmz/mgrOV6ln3HSF1vcftN21CMJO/WRc9v7Bmp6RSVEU0LSghETl+iOAsvqE/dp
         pismle7RxFmsjRhR7eXjcg3hA+sE64CPLd3h1wEkRVMPjIc7LYnNxYpLsvdF76YZ9rH1
         oXP/LjuR99I0WrrpPxnlD0arpvHpF1Rz6HSoVXnUOvkKoNe9M8tLkWiCqjI3hLvB14JP
         I3rpZUxqYzbyQvHb9fmQYiTS1Uh8USsERtkIo5KblWRXTWSIsmao7ngGtyfKMZTPEJR+
         WLtRZ0rLruN6sT+vrfEZeikKOneDT4mH2F0YQAN5JXmofDLGtfPknpmldebujb4cD5AI
         AjKw==
X-Gm-Message-State: AOJu0Yx4mwqC/Q/o2u3fu2t8YDDGjf08Xm5M5UqFythUjcda2QC74c8h
	NR1yBCFWNZ62GUWjwuEqcvwwy7rkthOv2CzrFVlgcA==
X-Google-Smtp-Source: AGHT+IGVvkXflDFQa3m2r9+RBHSjyXBqNTbuPfLARJlQoH2anMmg5OG1UenTq9n/ditI8HFVvdNzUQ==
X-Received: by 2002:a17:90b:388a:b0:26b:455b:8d61 with SMTP id mu10-20020a17090b388a00b0026b455b8d61mr4311754pjb.22.1691961517817;
        Sun, 13 Aug 2023 14:18:37 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id qa2-20020a17090b4fc200b00263dfe9b972sm8690578pjb.0.2023.08.13.14.18.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 14:18:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/22] ruby/cgi-gem: CVE-2021-33621 HTTP response splitting in CGI
Date: Sun, 13 Aug 2023 11:18:07 -1000
Message-Id: <dfe4a2b601e094e2922b671f6cf73ff6a91f061f.1691961051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691961051.git.steve@sakoman.com>
References: <cover.1691961051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185892

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/ruby/cgi/commit/64c5045c0a6b84fdb938a8465a0890e5f7162708

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


