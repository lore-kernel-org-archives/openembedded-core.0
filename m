Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43FAC54FC6
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 13:37:04 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.7114.1748093816850941352
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 May 2025 06:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FS012yhN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-310efa0c4c1so694793a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 06:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748093816; x=1748698616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9w13KleNaGKqsG8vFEXD+Cus3tp1vfges6ND1VhhtXo=;
        b=FS012yhNj8dnDh67B0ZuXk4TbetPa7F034tMqr82b/6uZXKSbZXVWmgOBwMqN5dVxO
         DatvcmVI2FnFHS7YpvUpTWFOn3nuN1wPXCsIRT5HKB2Z73QT5GEb+PL+Dg+lJvTlv/je
         gorskxARfEz0emOfgKE6z6S0a9n+yFQz9+Acw5avRkvqvg/gEkX68nr//WtQFdhALDcC
         Ta8sVNzyWlTn+cIi/zETscuACWFFNA9boCiRyEAN42I+4IMXF9AN6nYHwcweh4TkT52+
         4O7TGj/rqB8UfXIQCvc589HZ0JtAXlmwVS+KRiBquz/OYObXUQiRzndncJE2A5VJ4L4g
         2Wtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748093816; x=1748698616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9w13KleNaGKqsG8vFEXD+Cus3tp1vfges6ND1VhhtXo=;
        b=hn2oJ3OKvFnCNdQ69LKL5R2SZtCHsOMRgfGnExl+QdSjxAECXNgOu/dOkhhp7ncIHa
         +sRP/xfSoEwPFb6jqKQwN4ipOoN1Rpoa/uqV6jP98fMx6B/Z+C6G/4qbIqAC+lTyEGdw
         C0JuSp3pFzR9NfAZ9MQm/lYAuiTqghhQB7ch4vzQmqfyEdW5xC60HHu2R/9hcsSAxBqF
         x2P5ktg95NPtH/BjgvieXd7FcZNy5aUe3dpTqRxWUpjjyQqqyr9EfZ+jkAQ24WXamBU5
         pUcadg8/pFUbmS45B0MqomE7QQBr96sMUdM3YPsJZpMvnsEmjZwGIn2MoTfGBtLkhRfw
         7t3w==
X-Gm-Message-State: AOJu0Yx+btl7C6l4gpiMeCd2OKIJeWXheu7s1WDd5jT1US0G6/VylmSP
	TCpkPadlYGSNpelEdK1CKiA6rg7MZ/6OtlCw3YFbLcIilraYU93SSQp3wLWT7uUqr2vaKYe3x0z
	0dkT+
X-Gm-Gg: ASbGncvb8NPSoc9iDpaq/GTfpImL9dbF9nDhC+/+gq8D+XREoG0hn2af9hTPm05EeNc
	dM92tx7KvXE9YOHolu65caoigqT+3NtXH1W8Pg9ZDdUv4g+3lm7B11acTbqIwGEt4RQ2W1LQAU9
	/QG03XfJhCx7FH3gnICpsBrjuC2i2oeBBYBcI+hbmpiNSEUPk7k/0qFA72Gf40Zni0I6hF14EM7
	wUajX5SkNgiXL3g6jCTCF9adweJgciL26gywVXEvbaWiEfn3/UGx9CunDmJ3w7AIvHf/xXOm2OX
	QPIuTn95PpZjE3gwltB5phEWLfQS2KGDUJWvUOkGNbQ=
X-Google-Smtp-Source: AGHT+IHkmsQZeN8wVH/JiZB7UBKH8ubt4W6S/wI/wOxNGBOAbcZLuT9dqqgFLG7ADmxiPjOD82cU3A==
X-Received: by 2002:a17:90b:5111:b0:30e:9aa2:6d35 with SMTP id 98e67ed59e1d1-3110f0858a5mr5807714a91.0.1748093815972;
        Sat, 24 May 2025 06:36:55 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3157:44bf:9f62:fea8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4f9csm9058913a91.20.2025.05.24.06.36.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 06:36:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/12] ruby: fix CVE-2025-27221
Date: Sat, 24 May 2025 06:36:26 -0700
Message-ID: <c77ff1288719d90ef257dfe28cb33b3768fc124a.1748093626.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748093626.git.steve@sakoman.com>
References: <cover.1748093626.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 13:37:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217235

From: Divya Chellam <divya.chellam@windriver.com>

In the URI gem before 1.0.3 for Ruby, the URI handling methods
(URI.join, URI#merge, URI#+) have an inadvertent leakage of
authentication credentials because userinfo is retained even
after changing the host.

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-27221

Upstream-patches:
https://github.com/ruby/uri/commit/3675494839112b64d5f082a9068237b277ed1495
https://github.com/ruby/uri/commit/2789182478f42ccbb62197f952eb730e4f02bfc5

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ruby/ruby/CVE-2025-27221-0001.patch       | 57 +++++++++++++++
 .../ruby/ruby/CVE-2025-27221-0002.patch       | 73 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |  2 +
 3 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0001.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0002.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0001.patch b/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0001.patch
new file mode 100644
index 0000000000..4dd2e55b1c
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0001.patch
@@ -0,0 +1,57 @@
+From 3675494839112b64d5f082a9068237b277ed1495 Mon Sep 17 00:00:00 2001
+From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
+Date: Fri, 21 Feb 2025 16:29:36 +0900
+Subject: [PATCH] Truncate userinfo with URI#join, URI#merge and URI#+
+
+CVE: CVE-2025-27221
+
+Upstream-Status: Backport [https://github.com/ruby/uri/commit/3675494839112b64d5f082a9068237b277ed1495]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ lib/uri/generic.rb       |  6 +++++-
+ test/uri/test_generic.rb | 11 +++++++++++
+ 2 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/lib/uri/generic.rb b/lib/uri/generic.rb
+index cfa0de6..23d2398 100644
+--- a/lib/uri/generic.rb
++++ b/lib/uri/generic.rb
+@@ -1131,7 +1131,11 @@ module URI
+       end
+ 
+       # RFC2396, Section 5.2, 7)
+-      base.set_userinfo(rel.userinfo) if rel.userinfo
++      if rel.userinfo
++        base.set_userinfo(rel.userinfo)
++      else
++        base.set_userinfo(nil)
++      end
+       base.set_host(rel.host)         if rel.host
+       base.set_port(rel.port)         if rel.port
+       base.query = rel.query       if rel.query
+diff --git a/test/uri/test_generic.rb b/test/uri/test_generic.rb
+index fdb405e..b74f8e6 100644
+--- a/test/uri/test_generic.rb
++++ b/test/uri/test_generic.rb
+@@ -157,6 +157,17 @@ class URI::TestGeneric < Test::Unit::TestCase
+     assert_equal(nil, url.user)
+     assert_equal(nil, url.password)
+     assert_equal(nil, url.userinfo)
++
++    # sec-2957667
++    url = URI.parse('http://user:pass@example.com').merge('//example.net')
++    assert_equal('http://example.net', url.to_s)
++    assert_nil(url.userinfo)
++    url = URI.join('http://user:pass@example.com', '//example.net')
++    assert_equal('http://example.net', url.to_s)
++    assert_nil(url.userinfo)
++    url = URI.parse('http://user:pass@example.com') + '//example.net'
++    assert_equal('http://example.net', url.to_s)
++    assert_nil(url.userinfo)
+   end
+ 
+   def test_parse_scheme_with_symbols
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0002.patch b/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0002.patch
new file mode 100644
index 0000000000..370b1aa66d
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0002.patch
@@ -0,0 +1,73 @@
+From 2789182478f42ccbb62197f952eb730e4f02bfc5 Mon Sep 17 00:00:00 2001
+From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
+Date: Fri, 21 Feb 2025 18:16:28 +0900
+Subject: [PATCH] Fix merger of URI with authority component
+
+https://hackerone.com/reports/2957667
+
+Co-authored-by: Nobuyoshi Nakada <nobu@ruby-lang.org>
+
+CVE: CVE-2025-27221
+
+Upstream-Status: Backport [https://github.com/ruby/uri/commit/2789182478f42ccbb62197f952eb730e4f02bfc5]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ lib/uri/generic.rb       | 19 +++++++------------
+ test/uri/test_generic.rb |  7 +++++++
+ 2 files changed, 14 insertions(+), 12 deletions(-)
+
+diff --git a/lib/uri/generic.rb b/lib/uri/generic.rb
+index 23d2398..2420882 100644
+--- a/lib/uri/generic.rb
++++ b/lib/uri/generic.rb
+@@ -1123,21 +1123,16 @@ module URI
+       base.fragment=(nil)
+ 
+       # RFC2396, Section 5.2, 4)
+-      if !authority
+-        base.set_path(merge_path(base.path, rel.path)) if base.path && rel.path
+-      else
+-        # RFC2396, Section 5.2, 4)
+-        base.set_path(rel.path) if rel.path
++      if authority
++        base.set_userinfo(rel.userinfo)
++        base.set_host(rel.host)
++        base.set_port(rel.port || base.default_port)
++        base.set_path(rel.path)
++      elsif base.path && rel.path
++        base.set_path(merge_path(base.path, rel.path))
+       end
+ 
+       # RFC2396, Section 5.2, 7)
+-      if rel.userinfo
+-        base.set_userinfo(rel.userinfo)
+-      else
+-        base.set_userinfo(nil)
+-      end
+-      base.set_host(rel.host)         if rel.host
+-      base.set_port(rel.port)         if rel.port
+       base.query = rel.query       if rel.query
+       base.fragment=(rel.fragment) if rel.fragment
+ 
+diff --git a/test/uri/test_generic.rb b/test/uri/test_generic.rb
+index b74f8e6..ade0294 100644
+--- a/test/uri/test_generic.rb
++++ b/test/uri/test_generic.rb
+@@ -260,6 +260,13 @@ class URI::TestGeneric < Test::Unit::TestCase
+     assert_equal(u0, u1)
+   end
+ 
++  def test_merge_authority
++    u = URI.parse('http://user:pass@example.com:8080')
++    u0 = URI.parse('http://new.example.org/path')
++    u1 = u.merge('//new.example.org/path')
++    assert_equal(u0, u1)
++  end
++
+   def test_route
+     url = URI.parse('http://hoge/a.html').route_to('http://hoge/b.html')
+     assert_equal('b.html', url.to_s)
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index ca061e7f70..65d62002ec 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -49,6 +49,8 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2025-27220.patch \
            file://CVE-2025-27219.patch \
            file://CVE-2024-43398.patch \
+           file://CVE-2025-27221-0001.patch \
+           file://CVE-2025-27221-0002.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.43.0


