Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A36AC27C78
	for <webhook@archiver.kernel.org>; Sat, 22 Jun 2024 11:58:07 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.95901.1719057485914362883
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jun 2024 04:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TMpZxatx;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.49, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-25c9ef2701fso1689503fac.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 04:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719057485; x=1719662285; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zquHSGFLVaZZ1bfwZXi4gigPrpW2zKfmgXuzty8XSes=;
        b=TMpZxatxqM389PS9Xf9+PQsxe3PqRuYsjAvkWLDObolHRuGGcpBXsgnMsRq8pbFFrG
         eZLUXVOaZflVn8lbAFNYZ1fS8jzUYvy13oj/urqdHY29apAO667yl3k85XJTEFLLLyPI
         DeQmAigvDYU1Wf7Lu64VIUPuwNvHF3BHN7s8ZlKp6PFZ0lngn1FTavIQm+3kaMvPiyL4
         6v02AM+hQl1ovi/UOGzdFNAkjKRgkv8Kwh9ppCfwtVNCZ2RHX3vQKfOWwKV94DxdlOGV
         Ox3huA4vaqIjDHogY//TRFtEspjBQSJb1WqYmXoVOlo8oDUxAFaRLRCjfWi5WJbLY8pW
         d2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719057485; x=1719662285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zquHSGFLVaZZ1bfwZXi4gigPrpW2zKfmgXuzty8XSes=;
        b=sJODdCEbepCK6duv0xeTeAHuxWbbU/riAOMo8jzgAdbxBrFZCwdtT7OUQRIsvBdQFq
         WZlO4E/p3xo1X2fXXN/wSAPokFjFGnHOC4yjr62uXeQwkEUlpyV2RTTviSAhQIFqmdIt
         HQ9tBQFpbcdizk/i85akSFQSWT7AnN1mXGLfUHOzdBf4fARSD34ywTaMR0QmxgmvZg1T
         /0QM6syKOktWCcdbVznE6tDA690lp3LXAgczbH/IWkk6BM3CIIov3jXMUZO7SNVoUGu8
         XoKKwqPo6pDHAi0Wz2nGytPSf0eoS8cT2IP7wSqqyv4as0oHwZPBeor0RetGEuvLDPxe
         jz1w==
X-Gm-Message-State: AOJu0Yw0OWY3bscMfeswRaGGHoxgrhF2/d3Ekk3SkEEPEfykFF4htdrY
	8ilJN7WSRYvLcRAWvP7HRjgXvE4vhmSuQ4FiPq9P8fXZoTQezLC3Hu55IjQnr37ti2EWDRHB4oP
	i
X-Google-Smtp-Source: AGHT+IFRTdXTax8jBSghi/ljoJFmhZIre/FWNaJHpgmqgNT4z92rsQ7JNyZ7M0Bkl0ZktjY0OM1BLg==
X-Received: by 2002:a05:6870:b022:b0:254:b7d9:2dcb with SMTP id 586e51a60fabf-25c948e44b4mr11041747fac.8.1719057484869;
        Sat, 22 Jun 2024 04:58:04 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-716b364687bsm2101074a12.12.2024.06.22.04.58.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 04:58:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/9] ruby: fix CVE-2024-27280
Date: Sat, 22 Jun 2024 04:57:31 -0700
Message-Id: <729310d17310dff955c51811ff3339fdbc017b95.1719057291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719057291.git.steve@sakoman.com>
References: <cover.1719057291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 11:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201042

From: Yogita Urade <yogita.urade@windriver.com>

A buffer-overread issue was discovered in StringIO 3.0.1, as
distributed in Ruby 3.0.x through 3.0.6 and 3.1.x through
3.1.4. The ungetbyte and ungetc methods on a StringIO can
read past the end of a string, and a subsequent call to
StringIO.gets may return the memory value. 3.0.3 is the main
fixed version; however, for Ruby 3.0 users, a fixed version
is stringio 3.0.1.1, and for Ruby 3.1 users, a fixed version
is stringio 3.0.1.2.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-27280

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ruby/ruby/CVE-2024-27280.patch            | 87 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27280.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-27280.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-27280.patch
new file mode 100644
index 0000000000..2595feb6e9
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-27280.patch
@@ -0,0 +1,87 @@
+From a35268a3ac1b5f0058e5b7c1a041a7e86d9da067 Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <nobu@ruby-lang.org>
+Date: Mon, 10 Jun 2024 11:46:53 +0000
+Subject: [PATCH] Fix expanding size at ungetc/ungetbyte
+
+CVE: CVE-2024-27280
+Upstream-Status: Backport [https://github.com/ruby/stringio/commit/a35268a3ac1b5f0058e5b7c1a041a7e86d9da067]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ ext/stringio/stringio.c        |  2 +-
+ test/stringio/test_stringio.rb | 25 +++++++++++++++++++++----
+ 2 files changed, 22 insertions(+), 5 deletions(-)
+
+diff --git a/ext/stringio/stringio.c b/ext/stringio/stringio.c
+index 8df07e8..b2e8632 100644
+--- a/ext/stringio/stringio.c
++++ b/ext/stringio/stringio.c
+@@ -984,7 +984,7 @@ strio_unget_bytes(struct StringIO *ptr, const char *cp, long cl)
+     len = RSTRING_LEN(str);
+     rest = pos - len;
+     if (cl > pos) {
+-	long ex = (rest < 0 ? cl-pos : cl+rest);
++        long ex = cl - (rest < 0 ? pos : len);
+	rb_str_modify_expand(str, ex);
+	rb_str_set_len(str, len + ex);
+	s = RSTRING_PTR(str);
+diff --git a/test/stringio/test_stringio.rb b/test/stringio/test_stringio.rb
+index e0b4504..4853513 100644
+--- a/test/stringio/test_stringio.rb
++++ b/test/stringio/test_stringio.rb
+@@ -757,6 +757,15 @@ class TestStringIO < Test::Unit::TestCase
+     assert_equal("b""\0""a", s.string)
+   end
+
++  def test_ungetc_fill
++    count = 100
++    s = StringIO.new
++    s.print 'a' * count
++    s.ungetc('b' * (count * 5))
++    assert_equal((count * 5), s.string.size)
++    assert_match(/\Ab+\z/, s.string)
++  end
++
+   def test_ungetbyte_pos
+     b = '\\b00010001 \\B00010001 \\b1 \\B1 \\b000100011'
+     s = StringIO.new( b )
+@@ -782,6 +791,15 @@ class TestStringIO < Test::Unit::TestCase
+     assert_equal("b""\0""a", s.string)
+   end
+
++  def test_ungetbyte_fill
++    count = 100
++    s = StringIO.new
++    s.print 'a' * count
++    s.ungetbyte('b' * (count * 5))
++    assert_equal((count * 5), s.string.size)
++    assert_match(/\Ab+\z/, s.string)
++  end
++
+   def test_frozen
+     s = StringIO.new
+     s.freeze
+@@ -825,18 +843,17 @@ class TestStringIO < Test::Unit::TestCase
+   end
+
+   def test_overflow
+-    omit if RbConfig::SIZEOF["void*"] > RbConfig::SIZEOF["long"]
++    return if RbConfig::SIZEOF["void*"] > RbConfig::SIZEOF["long"]
+     limit = RbConfig::LIMITS["INTPTR_MAX"] - 0x10
+     assert_separately(%w[-rstringio], "#{<<-"begin;"}\n#{<<-"end;"}")
+     begin;
+       limit = #{limit}
+       ary = []
+-      while true
++      begin
+         x = "a"*0x100000
+         break if [x].pack("p").unpack("i!")[0] < 0
+         ary << x
+-        omit if ary.size > 100
+-      end
++      end while ary.size <= 100
+       s = StringIO.new(x)
+       s.gets("xxx", limit)
+       assert_equal(0x100000, s.pos)
+--
+2.40.0
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index 2ad3c9e207..d4b977cdfe 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2023-36617_1.patch \
            file://CVE-2023-36617_2.patch \
            file://CVE-2024-27281.patch \
+           file://CVE-2024-27280.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.34.1


