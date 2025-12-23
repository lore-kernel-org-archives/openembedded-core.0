Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1D1E6FE47
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:23:06 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.109349.1766524980055939619
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:23:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QXX3eLkX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0eaf55d58so37839475ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766524979; x=1767129779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ai8UIw4VnkrnLzJ2piao74n7e/OSjC5WbSyI9OvfXA0=;
        b=QXX3eLkXt0qKPzvv1PU3dhkDHi1RClMzV5k1+nL18Zci/Y7oeaouIvsrNTlrtsEQU7
         pIs5sOOzqlIh5ikVE4s8Pjk/Vgr60Bg8UKDioNIxVdpr9gI22FHHPgrmf6TZtXM3Q8ZE
         IsQL/5TEPUe83ucSigE3k8O9e2TFxPJC8PheEMFomun6ZsoZlJD28OQ2DRsbEZ+SEaCA
         taKJjxju1QjDH7hz6ckk76gLIEk5A8bzg+gNoiy6GU2gS9QODsP9xzFDskbY6sS+gmrZ
         /q2oNWmmc5OO7BgwNYUgD3z5nW0B3B4IPt2xb5Agy2nY445di7xfQA6beJsivtrkvCpX
         paKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766524979; x=1767129779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ai8UIw4VnkrnLzJ2piao74n7e/OSjC5WbSyI9OvfXA0=;
        b=TmgrEPHF95s9J2QsfZfIuZHWxpcvv+9z6LDK1prLl27oLEI/NX8ES/I8oVwOtu0b3l
         adqOAcUDUZsiEJeulioPJiHgvDaOS1cDYkjakmZ4vomktkTMBPhs2ufM80o7EMyYSfF0
         uApZ5o2bRCjc76HCXlAGo5K42+LQkl6QdCFP31GU/x5LUp7G0dksr1R62/wsUnjenC/x
         029qUdArW/9x55tOecIFC4DEyuu/FUffA4Osj1EhHUKqpDMZDfyPC5050f3ys2g9/XMu
         OEFLgzW8YCmej0BesiVFkfVLusKJTWNCFHvCx90vd0HCUNu/AEql3rHvMgkigBFaZEGA
         YrlQ==
X-Gm-Message-State: AOJu0Yzw6u9sVaZEgespzA/+Cru5mBQxaUe9jtD3IgVFtioRI/9BKBvq
	rVz5e+uQyDy89ZMOnd8+nG2VlNzAwl1Z7r0xSL73nMCMA/gbcjWjtAX2ftXCI6Tvx97duqFr9zH
	z78AU
X-Gm-Gg: AY/fxX6rE/fegHPcmHuG44tL45ff+P7iwbbj4rJMYrk+ulL9l8yqMikr3WsEsGgSd73
	wK/V9ay9+UFGsDcOmQB63x7X+Yms1BAS/+D2a6kreF0kDiGHs5qFi7FSTWIej9YDfcdC12u+n69
	NfGFll8raL3hFPtM2fL1cfQ2+TNuHdGPfpm4sd2Cd4jZy2V7JvG7eUjGt41WptZvIshKDLxdot0
	yiQF9fHPwTdvXbXKriXgGBv9xo0gyWGDMPNHK7Bm1+ogpW7Z5Hh75QabeueNX4XiEYt5ABKf0Bj
	/1BVdXmnc8nDAinHmnlkNOADjPbkD0EfzRGpPLSli0EImL3fCIiKj9hmuSaudSmVv6jYC6I5AbI
	pwoNNyc+Z2XOWf+vnuFTb2DDTkTFWZjyDV4XvbWA9YLcieeGUI2G10HBpw9hy3eRAifkDGiJqYF
	9CRA==
X-Google-Smtp-Source: AGHT+IGSSwbqci7MRuHFIzKNyrrAorHE+GuE65U71kxzF32E7G+0dSmPBVDudWe9qT1Gl/tvDZqzsA==
X-Received: by 2002:a17:903:2450:b0:2a0:e5c3:d149 with SMTP id d9443c01a7336-2a2f0d40410mr165418995ad.23.1766524979253;
        Tue, 23 Dec 2025 13:22:59 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbe5sm137258785ad.60.2025.12.23.13.22.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:22:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/18] ruby: Upgrade 3.3.5 -> 3.3.10
Date: Tue, 23 Dec 2025 13:22:17 -0800
Message-ID: <bad372ad8ec33334c6a74c077bf975851c1e59d2.1766524798.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766524798.git.steve@sakoman.com>
References: <cover.1766524798.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228485

From: Mingli Yu <mingli.yu@windriver.com>

Per ruby maintenance policy [1], the 3.3.x branch should be still in normal
maintenance, so upgrade to the latest version 3.3.10 to fix many security
issues and bugs.

Remove the fix for CVE-2025-27219, CVE-2025-27220 and CVE-2025-27221 as
these fixes have been included in the new version.

[1] https://www.ruby-lang.org/en/downloads/branches/

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ruby/ruby/CVE-2025-27219.patch            | 31 --------
 .../ruby/ruby/CVE-2025-27220.patch            | 78 -------------------
 .../ruby/ruby/CVE-2025-27221-0001.patch       | 57 --------------
 .../ruby/ruby/CVE-2025-27221-0002.patch       | 73 -----------------
 .../ruby/{ruby_3.3.5.bb => ruby_3.3.10.bb}    |  6 +-
 5 files changed, 1 insertion(+), 244 deletions(-)
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0001.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0002.patch
 rename meta/recipes-devtools/ruby/{ruby_3.3.5.bb => ruby_3.3.10.bb} (95%)

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch b/meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch
deleted file mode 100644
index 7813a6143c..0000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 9907b76dad0777ee300de236dad4b559e07596ab Mon Sep 17 00:00:00 2001
-From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
-Date: Fri, 21 Feb 2025 16:01:17 +0900
-Subject: [PATCH] Use String#concat instead of String#+ for reducing cpu usage
-
-Co-authored-by: "Yusuke Endoh" <mame@ruby-lang.org>
-
-Upstream-Status: Backport [https://github.com/ruby/cgi/commit/9907b76dad0777ee300de236dad4b559e07596ab]
-CVE: CVE-2025-27219
-Signed-off-by: Ashish Sharma <asharma@mvista.com>
-
- lib/cgi/cookie.rb | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/lib/cgi/cookie.rb b/lib/cgi/cookie.rb
-index 9498e2f..1c4ef6a 100644
---- a/lib/cgi/cookie.rb
-+++ b/lib/cgi/cookie.rb
-@@ -190,9 +190,10 @@ def self.parse(raw_cookie)
-         values ||= ""
-         values = values.split('&').collect{|v| CGI.unescape(v,@@accept_charset) }
-         if cookies.has_key?(name)
--          values = cookies[name].value + values
-+          cookies[name].concat(values)
-+        else
-+          cookies[name] = Cookie.new(name, *values)
-         end
--        cookies[name] = Cookie.new(name, *values)
-       end
- 
-       cookies
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch b/meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch
deleted file mode 100644
index f2f8bc7f76..0000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From cd1eb08076c8b8e310d4d553d427763f2577a1b6 Mon Sep 17 00:00:00 2001
-From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
-Date: Fri, 21 Feb 2025 15:53:31 +0900
-Subject: [PATCH] Escape/unescape unclosed tags as well
-
-Co-authored-by: Nobuyoshi Nakada <nobu@ruby-lang.org>
-
-CVE: CVE-2025-27220
-
-Upstream-Status: Backport [https://github.com/ruby/cgi/commit/cd1eb08076c8b8e310d4d553d427763f2577a1b6]
-
-Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
----
- lib/cgi/util.rb           |  4 ++--
- test/cgi/test_cgi_util.rb | 18 ++++++++++++++++++
- 2 files changed, 20 insertions(+), 2 deletions(-)
-
-diff --git a/lib/cgi/util.rb b/lib/cgi/util.rb
-index 4986e54..5f12eae 100644
---- a/lib/cgi/util.rb
-+++ b/lib/cgi/util.rb
-@@ -184,7 +184,7 @@ module CGI::Util
-   def escapeElement(string, *elements)
-     elements = elements[0] if elements[0].kind_of?(Array)
-     unless elements.empty?
--      string.gsub(/<\/?(?:#{elements.join("|")})(?!\w)(?:.|\n)*?>/i) do
-+      string.gsub(/<\/?(?:#{elements.join("|")})\b[^<>]*+>?/im) do
-         CGI.escapeHTML($&)
-       end
-     else
-@@ -204,7 +204,7 @@ module CGI::Util
-   def unescapeElement(string, *elements)
-     elements = elements[0] if elements[0].kind_of?(Array)
-     unless elements.empty?
--      string.gsub(/&lt;\/?(?:#{elements.join("|")})(?!\w)(?:.|\n)*?&gt;/i) do
-+      string.gsub(/&lt;\/?(?:#{elements.join("|")})\b(?>[^&]+|&(?![gl]t;)\w+;)*(?:&gt;)?/im) do
-         unescapeHTML($&)
-       end
-     else
-diff --git a/test/cgi/test_cgi_util.rb b/test/cgi/test_cgi_util.rb
-index b0612fc..bff77f7 100644
---- a/test/cgi/test_cgi_util.rb
-+++ b/test/cgi/test_cgi_util.rb
-@@ -269,6 +269,14 @@ class CGIUtilTest < Test::Unit::TestCase
-     assert_equal("<BR>&lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escapeElement('<BR><A HREF="url"></A>', ["A", "IMG"]))
-     assert_equal("<BR>&lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escape_element('<BR><A HREF="url"></A>', "A", "IMG"))
-     assert_equal("<BR>&lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escape_element('<BR><A HREF="url"></A>', ["A", "IMG"]))
-+
-+    assert_equal("&lt;A &lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escapeElement('<A <A HREF="url"></A>', "A", "IMG"))
-+    assert_equal("&lt;A &lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escapeElement('<A <A HREF="url"></A>', ["A", "IMG"]))
-+    assert_equal("&lt;A &lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escape_element('<A <A HREF="url"></A>', "A", "IMG"))
-+    assert_equal("&lt;A &lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escape_element('<A <A HREF="url"></A>', ["A", "IMG"]))
-+
-+    assert_equal("&lt;A &lt;A ", escapeElement('<A <A ', "A", "IMG"))
-+    assert_equal("&lt;A &lt;A ", escapeElement('<A <A ', ["A", "IMG"]))
-   end
- 
- 
-@@ -277,6 +285,16 @@ class CGIUtilTest < Test::Unit::TestCase
-     assert_equal('&lt;BR&gt;<A HREF="url"></A>', unescapeElement(escapeHTML('<BR><A HREF="url"></A>'), ["A", "IMG"]))
-     assert_equal('&lt;BR&gt;<A HREF="url"></A>', unescape_element(escapeHTML('<BR><A HREF="url"></A>'), "A", "IMG"))
-     assert_equal('&lt;BR&gt;<A HREF="url"></A>', unescape_element(escapeHTML('<BR><A HREF="url"></A>'), ["A", "IMG"]))
-+
-+    assert_equal('<A <A HREF="url"></A>', unescapeElement(escapeHTML('<A <A HREF="url"></A>'), "A", "IMG"))
-+    assert_equal('<A <A HREF="url"></A>', unescapeElement(escapeHTML('<A <A HREF="url"></A>'), ["A", "IMG"]))
-+    assert_equal('<A <A HREF="url"></A>', unescape_element(escapeHTML('<A <A HREF="url"></A>'), "A", "IMG"))
-+    assert_equal('<A <A HREF="url"></A>', unescape_element(escapeHTML('<A <A HREF="url"></A>'), ["A", "IMG"]))
-+
-+    assert_equal('<A <A ', unescapeElement(escapeHTML('<A <A '), "A", "IMG"))
-+    assert_equal('<A <A ', unescapeElement(escapeHTML('<A <A '), ["A", "IMG"]))
-+    assert_equal('<A <A ', unescape_element(escapeHTML('<A <A '), "A", "IMG"))
-+    assert_equal('<A <A ', unescape_element(escapeHTML('<A <A '), ["A", "IMG"]))
-   end
- end
- 
--- 
-2.40.0
-
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0001.patch b/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0001.patch
deleted file mode 100644
index 95802d04f9..0000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0001.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 3675494839112b64d5f082a9068237b277ed1495 Mon Sep 17 00:00:00 2001
-From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
-Date: Fri, 21 Feb 2025 16:29:36 +0900
-Subject: [PATCH] Truncate userinfo with URI#join, URI#merge and URI#+
-
-CVE: CVE-2025-27221
-
-Upstream-Status: Backport [https://github.com/ruby/uri/commit/3675494839112b64d5f082a9068237b277ed1495]
-
-Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
----
- lib/uri/generic.rb       |  6 +++++-
- test/uri/test_generic.rb | 11 +++++++++++
- 2 files changed, 16 insertions(+), 1 deletion(-)
-
-diff --git a/lib/uri/generic.rb b/lib/uri/generic.rb
-index f3540a2..ecc78c5 100644
---- a/lib/uri/generic.rb
-+++ b/lib/uri/generic.rb
-@@ -1141,7 +1141,11 @@ module URI
-       end
- 
-       # RFC2396, Section 5.2, 7)
--      base.set_userinfo(rel.userinfo) if rel.userinfo
-+      if rel.userinfo
-+        base.set_userinfo(rel.userinfo)
-+      else
-+        base.set_userinfo(nil)
-+      end
-       base.set_host(rel.host)         if rel.host
-       base.set_port(rel.port)         if rel.port
-       base.query = rel.query       if rel.query
-diff --git a/test/uri/test_generic.rb b/test/uri/test_generic.rb
-index e661937..17ba2b6 100644
---- a/test/uri/test_generic.rb
-+++ b/test/uri/test_generic.rb
-@@ -164,6 +164,17 @@ class URI::TestGeneric < Test::Unit::TestCase
-     # must be empty string to identify as path-abempty, not path-absolute
-     assert_equal('', url.host)
-     assert_equal('http:////example.com', url.to_s)
-+
-+    # sec-2957667
-+    url = URI.parse('http://user:pass@example.com').merge('//example.net')
-+    assert_equal('http://example.net', url.to_s)
-+    assert_nil(url.userinfo)
-+    url = URI.join('http://user:pass@example.com', '//example.net')
-+    assert_equal('http://example.net', url.to_s)
-+    assert_nil(url.userinfo)
-+    url = URI.parse('http://user:pass@example.com') + '//example.net'
-+    assert_equal('http://example.net', url.to_s)
-+    assert_nil(url.userinfo)
-   end
- 
-   def test_parse_scheme_with_symbols
--- 
-2.40.0
-
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0002.patch b/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0002.patch
deleted file mode 100644
index 4435b87c34..0000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2025-27221-0002.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 2789182478f42ccbb62197f952eb730e4f02bfc5 Mon Sep 17 00:00:00 2001
-From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
-Date: Fri, 21 Feb 2025 18:16:28 +0900
-Subject: [PATCH] Fix merger of URI with authority component
-
-https://hackerone.com/reports/2957667
-
-Co-authored-by: Nobuyoshi Nakada <nobu@ruby-lang.org>
-
-CVE: CVE-2025-27221
-
-Upstream-Status: Backport [https://github.com/ruby/uri/commit/2789182478f42ccbb62197f952eb730e4f02bfc5]
-
-Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
----
- lib/uri/generic.rb       | 19 +++++++------------
- test/uri/test_generic.rb |  7 +++++++
- 2 files changed, 14 insertions(+), 12 deletions(-)
-
-diff --git a/lib/uri/generic.rb b/lib/uri/generic.rb
-index ecc78c5..2c0a88d 100644
---- a/lib/uri/generic.rb
-+++ b/lib/uri/generic.rb
-@@ -1133,21 +1133,16 @@ module URI
-       base.fragment=(nil)
- 
-       # RFC2396, Section 5.2, 4)
--      if !authority
--        base.set_path(merge_path(base.path, rel.path)) if base.path && rel.path
--      else
--        # RFC2396, Section 5.2, 4)
--        base.set_path(rel.path) if rel.path
-+      if authority
-+        base.set_userinfo(rel.userinfo)
-+        base.set_host(rel.host)
-+        base.set_port(rel.port || base.default_port)
-+        base.set_path(rel.path)
-+      elsif base.path && rel.path
-+        base.set_path(merge_path(base.path, rel.path))
-       end
- 
-       # RFC2396, Section 5.2, 7)
--      if rel.userinfo
--        base.set_userinfo(rel.userinfo)
--      else
--        base.set_userinfo(nil)
--      end
--      base.set_host(rel.host)         if rel.host
--      base.set_port(rel.port)         if rel.port
-       base.query = rel.query       if rel.query
-       base.fragment=(rel.fragment) if rel.fragment
- 
-diff --git a/test/uri/test_generic.rb b/test/uri/test_generic.rb
-index 17ba2b6..1a70dd4 100644
---- a/test/uri/test_generic.rb
-+++ b/test/uri/test_generic.rb
-@@ -267,6 +267,13 @@ class URI::TestGeneric < Test::Unit::TestCase
-     assert_equal(u0, u1)
-   end
- 
-+  def test_merge_authority
-+    u = URI.parse('http://user:pass@example.com:8080')
-+    u0 = URI.parse('http://new.example.org/path')
-+    u1 = u.merge('//new.example.org/path')
-+    assert_equal(u0, u1)
-+  end
-+
-   def test_route
-     url = URI.parse('http://hoge/a.html').route_to('http://hoge/b.html')
-     assert_equal('b.html', url.to_s)
--- 
-2.40.0
-
diff --git a/meta/recipes-devtools/ruby/ruby_3.3.5.bb b/meta/recipes-devtools/ruby/ruby_3.3.10.bb
similarity index 95%
rename from meta/recipes-devtools/ruby/ruby_3.3.5.bb
rename to meta/recipes-devtools/ruby/ruby_3.3.10.bb
index 8b45946f6b..936bc73e32 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.10.bb
@@ -26,10 +26,6 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
-           file://CVE-2025-27219.patch \
-           file://CVE-2025-27220.patch \
-           file://CVE-2025-27221-0001.patch \
-           file://CVE-2025-27221-0002.patch \
            file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch \
           "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
@@ -51,7 +47,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "3781a3504222c2f26cb4b9eb9c1a12dbf4944d366ce24a9ff8cf99ecbce75196"
+SRC_URI[sha256sum] = "b555baa467a306cfc8e6c6ed24d0d27b27e9a1bed1d91d95509859eac6b0e928"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.43.0


