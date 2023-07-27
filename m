Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E23EB64DD
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:12 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.16708.1690487042661282363
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=UwmQsJh2;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-56345ab18b0so757076a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487042; x=1691091842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OT7RBzCxelSWL4Fo+gOMx+jqhO7ELbbMyJxPsBO/cec=;
        b=UwmQsJh2RJ98MolInryAyFRRM7XhGGrB5570P/t38vjUtKWhosJkLn4jnJz4cP4LaS
         /JcEkUFEornoT8H1+d59GkzNIqi6XnHZQr3o+t5BM7JD+QRbmjElyErnIf4KzAsCX7y8
         N2AmN1VMVzHcoaHTvOuFm1D3HO4u1YuQyYKXQp2dvI9g4+K4iOsRA2RZPs6R1n43JXbq
         i4qHSZiPldbQBo1NGUIzVQRTcVPkQHWLy5o/WjjZ3KweMectNmoAKM+EoDGBsTnfdtqq
         25vBpi0cXDKaGE3xBVeTZXDWICjlCRt1C7lfLuIYA39fHeXt2f9E1L+t7EllfFxu3R8P
         EkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487042; x=1691091842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OT7RBzCxelSWL4Fo+gOMx+jqhO7ELbbMyJxPsBO/cec=;
        b=QiWHRtx+a4T0fEpkJABJJlm3L+wRzmDl5TvStjY7KfYzfSxXs2ANVvbOe57pWjNQHL
         r775q0fUadeELJxmK/au1GnmcLXgjqwuxYKcOVyAfpRBUjT+4FI3mrxyp2VxOVicY4KZ
         BrS50ltyEbIUg8+AaPW9AM63q9dwVl989M79YMZDJyaMT0/kx3vlshxF+NZMt28ku1kK
         PqpT7pt6zdgRPY18d3VGUJmvMQwTXdAkqLCbmlP2bSQl+YtQ2KDJqbq3wvc7wrjZcei9
         XeKTu/WnLtJ2W4m3YoSJkFdD5NGCLOHW8mjQnaHL5/eLfLqYSUGkswihmMo02EOJrvzv
         4WOw==
X-Gm-Message-State: ABy/qLagqIT/OuWFpAqC/cvO+S07b855OdJ9JN4UgBmjQDQB3GAw8jQ5
	fXZtBvTvF4TDwyRcDSb+EubZUah0Oszwb/1SuE4=
X-Google-Smtp-Source: APBJJlGVQDGw6ALDmioDN7uhfA6Fm+svzQThOd31RGaeUxOsz4n1nIznv9iD2fmSAsd5Ln9NU+EbGg==
X-Received: by 2002:a17:90b:400c:b0:268:1e77:c6f4 with SMTP id ie12-20020a17090b400c00b002681e77c6f4mr244956pjb.40.1690487041675;
        Thu, 27 Jul 2023 12:44:01 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.44.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:44:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 04/27] ruby: Fix CVE-2023-36617
Date: Thu, 27 Jul 2023 09:43:22 -1000
Message-Id: <403a24f02600e2462e8ccfbb42651e15e002bd2e.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184979

From: Mingli Yu <mingli.yu@windriver.com>

Backport two patches [1] [2] to fix CVE-2023-36617 [3].

[1] https://github.com/ruby/uri/commit/9010ee2536adda10a0555ae1ed6fe2f5808e6bf1
[2] https://github.com/ruby/uri/commit/9d7bcef1e6ad23c9c6e4932f297fb737888144c8
[3] https://www.ruby-lang.org/en/news/2023/06/29/redos-in-uri-CVE-2023-36617/

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ruby/ruby/CVE-2023-36617_1.patch          | 56 +++++++++++++++++++
 .../ruby/ruby/CVE-2023-36617_2.patch          | 52 +++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.2.2.bb      |  2 +
 3 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
new file mode 100644
index 0000000000..17c7e30176
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
@@ -0,0 +1,56 @@
+From 2ebb50d2dc302917a6f57c1239dc9e700dfe0e34 Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <nobu@ruby-lang.org>
+Date: Thu, 27 Jul 2023 15:53:01 +0800
+Subject: [PATCH] Fix quadratic backtracking on invalid relative URI
+
+https://hackerone.com/reports/1958260
+
+CVE: CVE-2023-36617
+
+Upstream-Status: Backport [https://github.com/ruby/uri/commit/9010ee2536adda10a0555ae1ed6fe2f5808e6bf1]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/uri/rfc2396_parser.rb |  4 ++--
+ test/uri/test_parser.rb   | 12 ++++++++++++
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/lib/uri/rfc2396_parser.rb b/lib/uri/rfc2396_parser.rb
+index 76a8f99..00c66cf 100644
+--- a/lib/uri/rfc2396_parser.rb
++++ b/lib/uri/rfc2396_parser.rb
+@@ -497,8 +497,8 @@ module URI
+       ret = {}
+ 
+       # for URI::split
+-      ret[:ABS_URI] = Regexp.new('\A\s*' + pattern[:X_ABS_URI] + '\s*\z', Regexp::EXTENDED)
+-      ret[:REL_URI] = Regexp.new('\A\s*' + pattern[:X_REL_URI] + '\s*\z', Regexp::EXTENDED)
++      ret[:ABS_URI] = Regexp.new('\A\s*+' + pattern[:X_ABS_URI] + '\s*\z', Regexp::EXTENDED)
++      ret[:REL_URI] = Regexp.new('\A\s*+' + pattern[:X_REL_URI] + '\s*\z', Regexp::EXTENDED)
+ 
+       # for URI::extract
+       ret[:URI_REF]     = Regexp.new(pattern[:URI_REF])
+diff --git a/test/uri/test_parser.rb b/test/uri/test_parser.rb
+index 72fb590..721e05e 100644
+--- a/test/uri/test_parser.rb
++++ b/test/uri/test_parser.rb
+@@ -79,4 +79,16 @@ class URI::TestParser < Test::Unit::TestCase
+     assert_equal([nil, nil, "example.com", nil, nil, "", nil, nil, nil], URI.split("//example.com"))
+     assert_equal([nil, nil, "[0::0]", nil, nil, "", nil, nil, nil], URI.split("//[0::0]"))
+   end
++
++  def test_rfc2822_parse_relative_uri
++    pre = ->(length) {
++      " " * length + "\0"
++    }
++    parser = URI::RFC2396_Parser.new
++    assert_linear_performance((1..5).map {|i| 10**i}, pre: pre) do |uri|
++      assert_raise(URI::InvalidURIError) do
++        parser.split(uri)
++      end
++    end
++  end
+ end
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
new file mode 100644
index 0000000000..7c51deaa42
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
@@ -0,0 +1,52 @@
+From eea5868120509c245216c4b5c2d4b5db1c593d0e Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <nobu@ruby-lang.org>
+Date: Thu, 27 Jul 2023 16:16:30 +0800
+Subject: [PATCH] Fix quadratic backtracking on invalid port number
+
+https://hackerone.com/reports/1958260
+
+CVE: CVE-2023-36617
+
+Upstream-Status: Backport [https://github.com/ruby/uri/commit/9d7bcef1e6ad23c9c6e4932f297fb737888144c8]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/uri/rfc3986_parser.rb |  2 +-
+ test/uri/test_parser.rb   | 10 ++++++++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/lib/uri/rfc3986_parser.rb b/lib/uri/rfc3986_parser.rb
+index dd24a40..9b1663d 100644
+--- a/lib/uri/rfc3986_parser.rb
++++ b/lib/uri/rfc3986_parser.rb
+@@ -100,7 +100,7 @@ module URI
+         QUERY: /\A(?:%\h\h|[!$&-.0-;=@-Z_a-z~\/?])*\z/,
+         FRAGMENT: /\A(?:%\h\h|[!$&-.0-;=@-Z_a-z~\/?])*\z/,
+         OPAQUE: /\A(?:[^\/].*)?\z/,
+-        PORT: /\A[\x09\x0a\x0c\x0d ]*\d*[\x09\x0a\x0c\x0d ]*\z/,
++        PORT: /\A[\x09\x0a\x0c\x0d ]*+\d*[\x09\x0a\x0c\x0d ]*\z/,
+       }
+     end
+ 
+diff --git a/test/uri/test_parser.rb b/test/uri/test_parser.rb
+index 721e05e..cee0acb 100644
+--- a/test/uri/test_parser.rb
++++ b/test/uri/test_parser.rb
+@@ -91,4 +91,14 @@ class URI::TestParser < Test::Unit::TestCase
+       end
+     end
+   end
++
++  def test_rfc3986_port_check
++    pre = ->(length) {"\t" * length + "a"}
++    uri = URI.parse("http://my.example.com")
++    assert_linear_performance((1..5).map {|i| 10**i}, pre: pre) do |port|
++      assert_raise(URI::InvalidComponentError) do
++        uri.port = port
++      end
++    end
++  end
+ end
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.2.2.bb b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
index 481fe7c23d..d1359e388c 100644
--- a/meta/recipes-devtools/ruby/ruby_3.2.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
@@ -31,6 +31,8 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
            file://0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch \
+           file://CVE-2023-36617_1.patch \
+           file://CVE-2023-36617_2.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.34.1


