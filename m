Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8726FC3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 14:43:38 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.17590.1748443412368331045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 07:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YLvCR0hb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23446bb8785so43813155ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 07:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748443412; x=1749048212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnJHojSTOYyn883xISPor3Ox9/nCxQBKkROgc63bpXk=;
        b=YLvCR0hbs3MkvkXDSpZS+B9ZQ0MIAsQovuXM7AjlRMWRTxWbs0fDKd7jsaWUgdsp7O
         xc9IxUa5bBK/wzLj/wlbO/HNHw15wM98bIR5cGrOWNl/qTD7sIu45EKuEE8HCBeeyaSA
         UT1OE8H4GSFP/EhDeFkeNtDYA9sPOAJ+Eu3tHEeQBx94LUeGk8/5Wz3uaJltI2tLko1F
         7Ss2EkfpujrcNr0v6G/ezQusQ/SYJv3EpkFr0ba0Sp5Z7ktcnOO/LU0sYHP6fZG1AyqG
         DmitbqeBJ2zdAvL1u6jdKUDfd07GH1HnpZVVj26nm7qHDyr7ZTQhSZVi8vckSmaDUG4R
         gYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748443412; x=1749048212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnJHojSTOYyn883xISPor3Ox9/nCxQBKkROgc63bpXk=;
        b=HdlHLpeNiHHzjcZCuLxN8CqlfM1wvdCpZlZ6gZhFgrlHOVkrUfVTLvbilYGBTAmMoZ
         t0Z6vtlIj2v8XZOFr60+JxAmN8826vaIQPSl5wAwsBJaCaEGDVJGnc+Cqpdy+KEv7yhH
         G0I0/+0/eP7Uy+OuoPFzVvEm9+rQX//0rCOHeDkONNC1RvGtIn5jwUYCwgRowyKEWfsY
         74UJ4ELlxidKB+DNkqU8jQGC5FQHjpEXMZ0biWmduHaIF3aAmqMSBSa6OgyrgLzbiM4M
         AgUedSXyLPsgrUdjaMn/ufBoetZOjg2Av2h4QUoGdYPOPaUEcnjI5CfCUkGSlzTt0vf/
         HEtA==
X-Gm-Message-State: AOJu0YyjZtCikGcWN/pN7M6QbQjjiXgKfLbruqNZHmxfnrbXbsN25Ci2
	23otWdRlWikiS9OPbTJNaXMRoP9z+VknyBKhlyviHlQYrIUmpqN9PeGpjXc+A8CZficcBRJSzKQ
	Jy0D5
X-Gm-Gg: ASbGncugs6Z2EK4nAxp03i+ql93/baFgKx2uTABHPElpgKEV234luKLyAi8LyYeB85e
	3BtRwLxnfDPdoHYea6IZEKrtcgjlYCf33BseuBgCFalLDR1LAXM+p6maF0bMTC6n87bgsMTlV44
	YCFvPpd2yfgP90k0j1yeLo+dhpBBldKwKfZV0HVfIRpC5BMzZT/1KqzmqQI0lqRPu9dL09AzvB+
	uFgVfCLdNxsHb+Y70r5OckoODFd+KikvlqZFW0jDIbpU315U4ERsFDZoJgIhlmWtJOg35QSl507
	m/cdK1Fww1P4NtSJumGfZsShcLBa7rpA6I0oqRvan5AAR2dezpSzpg==
X-Google-Smtp-Source: AGHT+IFQNgfnhY2sQhPg73YfmuewYNoq7LW3iqOYhwwGenTJRYleh5d+18px28PbH2TRyvISyK002Q==
X-Received: by 2002:a17:902:f68f:b0:231:b7e1:c978 with SMTP id d9443c01a7336-23414f6229fmr253225815ad.16.1748443411572;
        Wed, 28 May 2025 07:43:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d358f1e2sm12626285ad.140.2025.05.28.07.43.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:43:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/11] ruby: fix CVE-2025-27221
Date: Wed, 28 May 2025 07:43:09 -0700
Message-ID: <421d7011269f4750f5942b815d68f77fa4559d69.1748443238.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748443238.git.steve@sakoman.com>
References: <cover.1748443238.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 14:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217358

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
 meta/recipes-devtools/ruby/ruby_3.3.5.bb      |  2 +
 3 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0001.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0002.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0001.patch b/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0001.patch
new file mode 100644
index 0000000000..95802d04f9
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
+index f3540a2..ecc78c5 100644
+--- a/lib/uri/generic.rb
++++ b/lib/uri/generic.rb
+@@ -1141,7 +1141,11 @@ module URI
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
+index e661937..17ba2b6 100644
+--- a/test/uri/test_generic.rb
++++ b/test/uri/test_generic.rb
+@@ -164,6 +164,17 @@ class URI::TestGeneric < Test::Unit::TestCase
+     # must be empty string to identify as path-abempty, not path-absolute
+     assert_equal('', url.host)
+     assert_equal('http:////example.com', url.to_s)
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
index 0000000000..4435b87c34
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
+index ecc78c5..2c0a88d 100644
+--- a/lib/uri/generic.rb
++++ b/lib/uri/generic.rb
+@@ -1133,21 +1133,16 @@ module URI
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
+index 17ba2b6..1a70dd4 100644
+--- a/test/uri/test_generic.rb
++++ b/test/uri/test_generic.rb
+@@ -267,6 +267,13 @@ class URI::TestGeneric < Test::Unit::TestCase
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
diff --git a/meta/recipes-devtools/ruby/ruby_3.3.5.bb b/meta/recipes-devtools/ruby/ruby_3.3.5.bb
index c91c51657f..b37f0d03e7 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.5.bb
@@ -28,6 +28,8 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
            file://CVE-2025-27219.patch \
            file://CVE-2025-27220.patch \
+           file://CVE-2025-27221-0001.patch \
+           file://CVE-2025-27221-0002.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.43.0


