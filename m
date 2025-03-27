Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E4DC3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 19:44:38 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.5272.1743104668826848397
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 12:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZKnAOgSb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-224171d6826so37117245ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743104668; x=1743709468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ts5h3HPjDVDK/HnS4sfYSruw0SSnbfIW/r8f81UqFI=;
        b=ZKnAOgSb8mHXFcNWVvGpzZTSgkHdfMfc7xnoATtcKRYem1FZv4HedLiLqNFJmrV7te
         IPwTK3vOkqlTSlfKLSku11i196UkWvtXkyK8S3RmXdSU1/w69uYRGE0RfztIA2UOKsir
         r6e5Y9ltOYlu3t59153QmVzsgDbWJI5NU9NXSqXw+P0FDyNG/j67Wk55/J9kCiPCnNJf
         aSSsRLk0KeeYI1IqDwXPecnzJJ4v1Cxwgv814Y2xGsjgeqXYVZzH/jiLMvGyR7sCjLI6
         heNVvTh9IlVqTof88//ac7dz+ApC3Ww/LiLJRYEgzrKxR8RWgvdxW/7RqWq6trLjqu62
         LrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104668; x=1743709468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ts5h3HPjDVDK/HnS4sfYSruw0SSnbfIW/r8f81UqFI=;
        b=ODoZw8O2OQIRo6NI004UwlVBH0xQDNe1KhuXDAxkzt1+4irdG6wYAQvohLqYFZf98G
         DihhOqe4WJKuWnpK0lobFrg9s3FLAcydldJ76Y14JFCjnlBz549WEtc83/BomvP0zkAc
         342Ik+QSUbyPvc4Xz2eTap4NIfVOabgf+6EuhQ4qYXhiky6zQA6w1jtsKFsTOKeHydOQ
         k6mI6fRoKRp8a/f6KovI0ol6akA2JuKUWSEIHMZDoAmR36k2vxMsiCJcIm9h+x5y0Xb1
         Hu8/V4Cs72lX8fR4+bjA5rbWDjp67bSXPhWGdERxt058a7VpZw4q06NZwlTfroaQFDbV
         Dong==
X-Gm-Message-State: AOJu0YwlJK7Db0LIlTvU+ihQgx3fa4dCU3y0/XPcNSqmZ1iUZ9s99+hY
	gw/oJlDvTCjmvt4RhbPs3CFBo0cueI6a783UQDUIwouJfyHvxIiT5y52RWFI6W4y7sSEsp/W0Qx
	r
X-Gm-Gg: ASbGncsQMvMi6SC08iBKN0cSarqT1hGWvGv93U226TRJTHAMeJy83mNiXx2JBA6PCLH
	GNp3MV1QRhWyj4jDLab/sCG6VvVzvBGEt/FrjxeDKduVWJP65nT0WbvpLC4UBBkk0tK4aoV2lpr
	2aWGAxVHc6hMAip4I22oINw8aBZn74fq/HpVHB013GImJwp6Ua/mCBCUNkZ+u1n5Qh1f6nscQlm
	wkvE+wrLRoD24GJX0RcRXycR9u6Hy9UJrKrpyL33YCDZIMSztBIUybDTplHyf3+uePF9+fBDq5H
	krBMi2UIl7wsqhC5wm4sMZGxT/Ful51+87o=
X-Google-Smtp-Source: AGHT+IFxR6pDvb48IrgVejGV1fPjoJ1ti8+98pjiiku8EPTAbXM072Fz1Vt2U8iEDPiDeeQBDzqnBw==
X-Received: by 2002:a17:903:32c2:b0:223:5c33:56a8 with SMTP id d9443c01a7336-22804931847mr79383405ad.35.1743104667869;
        Thu, 27 Mar 2025 12:44:27 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:811c:968e:2c1:6363])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee0882sm3865875ad.75.2025.03.27.12.44.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:44:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/10] ruby: fix CVE-2025-27220
Date: Thu, 27 Mar 2025 12:44:07 -0700
Message-ID: <8c31f8e142894f103409ee10deccc22fdeea897c.1743104524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743104524.git.steve@sakoman.com>
References: <cover.1743104524.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 19:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213778

From: Divya Chellam <divya.chellam@windriver.com>

In the CGI gem before 0.4.2 for Ruby, a Regular Expression Denial
of Service (ReDoS) vulnerability exists in the Util#escapeElement method.

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-27220

Upstream-patch:
https://github.com/ruby/cgi/commit/cd1eb08076c8b8e310d4d553d427763f2577a1b6

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ruby/ruby/CVE-2025-27220.patch            | 78 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.3.5.bb      |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch b/meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch
new file mode 100644
index 0000000000..f2f8bc7f76
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch
@@ -0,0 +1,78 @@
+From cd1eb08076c8b8e310d4d553d427763f2577a1b6 Mon Sep 17 00:00:00 2001
+From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
+Date: Fri, 21 Feb 2025 15:53:31 +0900
+Subject: [PATCH] Escape/unescape unclosed tags as well
+
+Co-authored-by: Nobuyoshi Nakada <nobu@ruby-lang.org>
+
+CVE: CVE-2025-27220
+
+Upstream-Status: Backport [https://github.com/ruby/cgi/commit/cd1eb08076c8b8e310d4d553d427763f2577a1b6]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ lib/cgi/util.rb           |  4 ++--
+ test/cgi/test_cgi_util.rb | 18 ++++++++++++++++++
+ 2 files changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/lib/cgi/util.rb b/lib/cgi/util.rb
+index 4986e54..5f12eae 100644
+--- a/lib/cgi/util.rb
++++ b/lib/cgi/util.rb
+@@ -184,7 +184,7 @@ module CGI::Util
+   def escapeElement(string, *elements)
+     elements = elements[0] if elements[0].kind_of?(Array)
+     unless elements.empty?
+-      string.gsub(/<\/?(?:#{elements.join("|")})(?!\w)(?:.|\n)*?>/i) do
++      string.gsub(/<\/?(?:#{elements.join("|")})\b[^<>]*+>?/im) do
+         CGI.escapeHTML($&)
+       end
+     else
+@@ -204,7 +204,7 @@ module CGI::Util
+   def unescapeElement(string, *elements)
+     elements = elements[0] if elements[0].kind_of?(Array)
+     unless elements.empty?
+-      string.gsub(/&lt;\/?(?:#{elements.join("|")})(?!\w)(?:.|\n)*?&gt;/i) do
++      string.gsub(/&lt;\/?(?:#{elements.join("|")})\b(?>[^&]+|&(?![gl]t;)\w+;)*(?:&gt;)?/im) do
+         unescapeHTML($&)
+       end
+     else
+diff --git a/test/cgi/test_cgi_util.rb b/test/cgi/test_cgi_util.rb
+index b0612fc..bff77f7 100644
+--- a/test/cgi/test_cgi_util.rb
++++ b/test/cgi/test_cgi_util.rb
+@@ -269,6 +269,14 @@ class CGIUtilTest < Test::Unit::TestCase
+     assert_equal("<BR>&lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escapeElement('<BR><A HREF="url"></A>', ["A", "IMG"]))
+     assert_equal("<BR>&lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escape_element('<BR><A HREF="url"></A>', "A", "IMG"))
+     assert_equal("<BR>&lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escape_element('<BR><A HREF="url"></A>', ["A", "IMG"]))
++
++    assert_equal("&lt;A &lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escapeElement('<A <A HREF="url"></A>', "A", "IMG"))
++    assert_equal("&lt;A &lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escapeElement('<A <A HREF="url"></A>', ["A", "IMG"]))
++    assert_equal("&lt;A &lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escape_element('<A <A HREF="url"></A>', "A", "IMG"))
++    assert_equal("&lt;A &lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escape_element('<A <A HREF="url"></A>', ["A", "IMG"]))
++
++    assert_equal("&lt;A &lt;A ", escapeElement('<A <A ', "A", "IMG"))
++    assert_equal("&lt;A &lt;A ", escapeElement('<A <A ', ["A", "IMG"]))
+   end
+ 
+ 
+@@ -277,6 +285,16 @@ class CGIUtilTest < Test::Unit::TestCase
+     assert_equal('&lt;BR&gt;<A HREF="url"></A>', unescapeElement(escapeHTML('<BR><A HREF="url"></A>'), ["A", "IMG"]))
+     assert_equal('&lt;BR&gt;<A HREF="url"></A>', unescape_element(escapeHTML('<BR><A HREF="url"></A>'), "A", "IMG"))
+     assert_equal('&lt;BR&gt;<A HREF="url"></A>', unescape_element(escapeHTML('<BR><A HREF="url"></A>'), ["A", "IMG"]))
++
++    assert_equal('<A <A HREF="url"></A>', unescapeElement(escapeHTML('<A <A HREF="url"></A>'), "A", "IMG"))
++    assert_equal('<A <A HREF="url"></A>', unescapeElement(escapeHTML('<A <A HREF="url"></A>'), ["A", "IMG"]))
++    assert_equal('<A <A HREF="url"></A>', unescape_element(escapeHTML('<A <A HREF="url"></A>'), "A", "IMG"))
++    assert_equal('<A <A HREF="url"></A>', unescape_element(escapeHTML('<A <A HREF="url"></A>'), ["A", "IMG"]))
++
++    assert_equal('<A <A ', unescapeElement(escapeHTML('<A <A '), "A", "IMG"))
++    assert_equal('<A <A ', unescapeElement(escapeHTML('<A <A '), ["A", "IMG"]))
++    assert_equal('<A <A ', unescape_element(escapeHTML('<A <A '), "A", "IMG"))
++    assert_equal('<A <A ', unescape_element(escapeHTML('<A <A '), ["A", "IMG"]))
+   end
+ end
+ 
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.3.5.bb b/meta/recipes-devtools/ruby/ruby_3.3.5.bb
index 4354107a85..c91c51657f 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.5.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
            file://CVE-2025-27219.patch \
+           file://CVE-2025-27220.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.43.0


