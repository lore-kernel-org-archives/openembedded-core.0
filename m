Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4A5CE7AEE
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 02:49:08 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.6176.1695869346711511466
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 19:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pk8WfXSH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-690d8fb3b7eso11206419b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 19:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695869346; x=1696474146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mPSS/4X0bymaEpJrBrPvf6fwNjxjBCChLPDzfRWlBUg=;
        b=pk8WfXSHWOSJaGwdgBmPBouBcl+pdsaqoIHlyzNqOSh+L3uwZki3cb1+0hsjiBZGMj
         xV4jeswKdNXodaBjyXaNh0Pj9oCWo/9vDNv541WiQ4J1c1St6DQ7lfVzQZHlnGyNXbCk
         YyIhC/gefYHXH5+97iiujw7SXDHvnVG9rJ+dc6ssp3/D95FFBmOexdf5iLfLb6YN5nhe
         J3wahbFeioUVFE/vSefWiDBpvpRIVo+jgZXfdq0ynXix2NMV7BsSZs2Qf2ikNGvKpoUr
         knLrgA0/hCqlEzlL2aNdESjl16oehbPdMdrCdafDFzQuHGc0tq+95XDA3aRf8n5dj6fl
         BbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695869346; x=1696474146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPSS/4X0bymaEpJrBrPvf6fwNjxjBCChLPDzfRWlBUg=;
        b=f1RaVeeK9NL0vEnBhM8q8COnfIIgXomhi85UK8zbPaACDx5LOUQJZB05EHmgc3/+81
         M5s7eT9anud6PVEgv7Oh34DtvLkQz6k+8OK6/Q5N98AeuDEUKrdgfWbFjGfj9aVw6WLG
         xK7KU4PU0ysyWlomHzOBNxZuTyhLbuV9W40gepup3h8zXswxqpbXpWno5gGOa7o4WnOr
         DPGMgEHqbBxhBaU+qI2c4slFK9gNlR1mdEF4oFXh5DdlpXWPWiHUBkkzCCGvQ5HiismD
         4LAn05/J72vbxKYrSktjlT5dPXlYZB7Soni2V9xgXl8QxulICMz1cX0fApmFINziBquj
         eJxg==
X-Gm-Message-State: AOJu0YwvJHNvbOBGexb9LPE4B8cHlcwDLIG9olJcWgpatcVvU+Tpnq5m
	Znvfh4QtMrannxGJHNpm74UthCm71vyUgZwUsSM=
X-Google-Smtp-Source: AGHT+IGZ1Gh8JAFqzXwSKs9QyMIH1SNoqV6sAJ3eaf0HHt4ZdBL2ljubFUNspx+fqUZXjG89iU0weQ==
X-Received: by 2002:a05:6a00:39aa:b0:68e:3bc7:3101 with SMTP id fi42-20020a056a0039aa00b0068e3bc73101mr4142796pfb.2.1695869345639;
        Wed, 27 Sep 2023 19:49:05 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n3-20020aa79043000000b0068e12e6954csm1850214pfo.36.2023.09.27.19.49.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 19:49:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/17] ruby: fix CVE-2023-36617
Date: Wed, 27 Sep 2023 16:48:37 -1000
Message-Id: <7a40082e4e080eaf5f88bd24f7169b7731028529.1695869144.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695869144.git.steve@sakoman.com>
References: <cover.1695869144.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 02:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188357

From: Meenali Gupta <meenali.gupta@windriver.com>

Backport two patches [1] [2] to fix CVE-2023-36617

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ruby/ruby/CVE-2023-36617_1.patch          | 52 +++++++++++++++++++
 .../ruby/ruby/CVE-2023-36617_2.patch          | 47 +++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |  2 +
 3 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
new file mode 100644
index 0000000000..57a15d302e
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
@@ -0,0 +1,52 @@
+From 9c2eb12776c1b5df2517a7e618e5fe818cc3395e Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <nobu@ruby-lang.org>
+Date: Thu, 27 Jul 2023 15:53:01 +0800
+Subject: [PATCH] ruby: Fix quadratic backtracking on invalid relative URI
+
+Upstream-Status: Backport [https://github.com/ruby/uri/commit/9010ee2536adda10a0555ae1ed6fe2f5808e6bf1]
+CVE: CVE-2023-36617
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
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
+index 03de137..01ed32a 100644
+--- a/test/uri/test_parser.rb
++++ b/test/uri/test_parser.rb
+@@ -63,4 +63,16 @@ class URI::TestParser < Test::Unit::TestCase
+     assert_equal("\u3042", p1.unescape('%e3%81%82'.force_encoding(Encoding::US_ASCII)))
+     assert_equal("\xe3\x83\x90\xe3\x83\x90", p1.unescape("\xe3\x83\x90%e3%83%90"))
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
+2.40.0
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
new file mode 100644
index 0000000000..ff558183b6
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
@@ -0,0 +1,47 @@
+From eea5868120509c245216c4b5c2d4b5db1c593d0e Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <nobu@ruby-lang.org>
+Date: Thu, 27 Jul 2023 16:16:30 +0800
+Subject: [PATCH] ruby: Fix quadratic backtracking on invalid port number
+
+Upstream-Status: Backport [https://github.com/ruby/uri/commit/9d7bcef1e6ad23c9c6e4932f297fb737888144c8]
+CVE: CVE-2023-36617
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ lib/uri/rfc3986_parser.rb |  2 +-
+ test/uri/test_parser.rb   | 10 ++++++++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/lib/uri/rfc3986_parser.rb b/lib/uri/rfc3986_parser.rb
+index 3c89311..cde3ea7 100644
+--- a/lib/uri/rfc3986_parser.rb
++++ b/lib/uri/rfc3986_parser.rb
+@@ -101,7 +101,7 @@ module URI
+         QUERY: /\A(?:%\h\h|[!$&-.0-;=@-Z_a-z~\/?])*\z/,
+         FRAGMENT: /\A(?:%\h\h|[!$&-.0-;=@-Z_a-z~\/?])*\z/,
+         OPAQUE: /\A(?:[^\/].*)?\z/,
+-        PORT: /\A[\x09\x0a\x0c\x0d ]*\d*[\x09\x0a\x0c\x0d ]*\z/,
++        PORT: /\A[\x09\x0a\x0c\x0d ]*+\d*[\x09\x0a\x0c\x0d ]*\z/,
+       }
+     end
+
+diff --git a/test/uri/test_parser.rb b/test/uri/test_parser.rb
+index 01ed32a..81c2210 100644
+--- a/test/uri/test_parser.rb
++++ b/test/uri/test_parser.rb
+@@ -75,4 +75,14 @@ class URI::TestParser < Test::Unit::TestCase
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
+2.40.0
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index 72030508dd..228a2204db 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -31,6 +31,8 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
            file://CVE-2023-28756.patch \
            file://CVE-2023-28755.patch \
+           file://CVE-2023-36617_1.patch \
+           file://CVE-2023-36617_2.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.34.1


