Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D59C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 13:36:37 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.37885.1741613796725478466
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 06:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DR0wObr4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2234e4b079cso73232605ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 06:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741613796; x=1742218596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3IJ8JoHiZ/xiGzhAY6rMSjFkecEhCFM3KrW1daa2IY=;
        b=DR0wObr4n6x6MRd8wGHAAoR/QXNpEu98flajvGFrMI+9N+bCg4tOUM0EvejofEWH3c
         0ojT6dhgb3H27ODWXFaqk7rQ/EEijL0TdCr0WcOXPDLGmQGrJqi3e1GsP4BpldcrEitv
         rQTaDHLX0VzcS2Nx+ceYfmDSOxY9jtv4qrqTqGvZQKwJxyBj22CrEG4R1t4/1IP68agL
         zUyngJijSUdVvXmkrXZhHsBk8WbXFFJ1hpkA+GzlSyY8wDqG85QR+tgxAlbRIIJvwiv+
         y7OFbb6/VKRFihHDwUUQNAPU/51ym+U10Q/+gEnDxKG+hUIinU7QosZdePLZ2bm8gLpp
         AnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741613796; x=1742218596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3IJ8JoHiZ/xiGzhAY6rMSjFkecEhCFM3KrW1daa2IY=;
        b=F73o8Y9h0YaUyoMyX+/s+sUY3kg9kHSo7rR6a17eW+g2sa8v6AOnABy26xzltXRTCb
         WSiSnASQNXq0ODQT81N96y2U9ozBmmr4SDkmGyQeMRiVtOH8HE7DM5apgIFJeHDtDP0m
         meFBI7WuHp+3Bw5kLODtcjawa7wV+94Lhqct04F92sBUrfOQmY2NSnorwEmN/qrMQL7a
         qZaT+8XRptfTs64F1pwKVGHfyEKKJV8mT+STNh9IEdpo8EzVq2Q9iLvL5r9LSASR6vco
         MiKaGervGRYrbyf3J3/GSFsGhCNMAw0s87ctoRUhF/a2KxO/vYTgy4SQ3z6eem09qeda
         JMOg==
X-Gm-Message-State: AOJu0YxXdyhCAg1ond8daDVAjEVE/SNHafF+LFpwHdSF6qOPrpXVwJgB
	TBilX0op/kLF6GBu5b5liYfQRB+aQ35U+vvknK3U4VwJa0x/ranDXzAYLhtVMqqF0lg0ss+gUxD
	4
X-Gm-Gg: ASbGncsx8Gc8MXpZLczbdUUJYlq29UY8HTP1H7zqITmlFn8tO4gbp1agi01Ne6qgfSU
	FoSk2jY3LaPl8rCUSKERxOJsoOenqBFGF0wnALH6Z6pTpmJlcr3Q+g49FJRUJO29gugftBFbYF8
	FCjRq6EQE6KLYHfh6Z+KZnOTFqCxrTeoQXddloirbd5G2nDjh+0mq3cj/+d4HTY7EXImgeSiWmB
	fzVc7MCoPn/S9fu4Pk72A/w3Vqso5tx/qIOpfFf1VxNnpR6pOj+2nHRdXHhj+7SW66jIajw+FUj
	PjgOwJVwuYFo+EmfPZLYpkgZN6A4cNH4e5ZQ
X-Google-Smtp-Source: AGHT+IEYSR22HXQ2hkr6AroWExkYjFSVKWVMBTsPtOCCbgyfgr1ouHcCOvLyka9lxO3vuh8pQwYZEw==
X-Received: by 2002:a17:902:d549:b0:224:c46:d14b with SMTP id d9443c01a7336-22428c0d5b4mr186249885ad.52.1741613795952;
        Mon, 10 Mar 2025 06:36:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2ea8:96c2:9f70:5c1e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddfbcsm77820095ad.21.2025.03.10.06.36.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 06:36:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/6] ruby: Fix CVE-2025-27220
Date: Mon, 10 Mar 2025 06:36:21 -0700
Message-ID: <44665939783cb2b32f5ade1772e0ceef47f9a853.1741613667.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741613667.git.steve@sakoman.com>
References: <cover.1741613667.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 13:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212523

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/ruby/cgi/commit/cd1eb08076c8b8e310d4d553d427763f2577a1b6

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ruby/ruby/CVE-2025-27220.patch            | 76 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch b/meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch
new file mode 100644
index 0000000000..4fc71f7ff9
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch
@@ -0,0 +1,76 @@
+From cd1eb08076c8b8e310d4d553d427763f2577a1b6 Mon Sep 17 00:00:00 2001
+From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
+Date: Fri, 21 Feb 2025 15:53:31 +0900
+Subject: [PATCH] Escape/unescape unclosed tags as well
+
+Co-authored-by: Nobuyoshi Nakada <nobu@ruby-lang.org>
+
+Upstream-Status: Backport [https://github.com/ruby/cgi/commit/cd1eb08076c8b8e310d4d553d427763f2577a1b6]
+CVE: CVE-2025-27220
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/cgi/util.rb           |  4 ++--
+ test/cgi/test_cgi_util.rb | 18 ++++++++++++++++++
+ 2 files changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/lib/cgi/util.rb b/lib/cgi/util.rb
+index 5a5c77a..ce77a0c 100644
+--- a/lib/cgi/util.rb
++++ b/lib/cgi/util.rb
+@@ -178,7 +178,7 @@ module CGI::Util
+   def escapeElement(string, *elements)
+     elements = elements[0] if elements[0].kind_of?(Array)
+     unless elements.empty?
+-      string.gsub(/<\/?(?:#{elements.join("|")})(?!\w)(?:.|\n)*?>/i) do
++      string.gsub(/<\/?(?:#{elements.join("|")})\b[^<>]*+>?/im) do
+         CGI.escapeHTML($&)
+       end
+     else
+@@ -198,7 +198,7 @@ module CGI::Util
+   def unescapeElement(string, *elements)
+     elements = elements[0] if elements[0].kind_of?(Array)
+     unless elements.empty?
+-      string.gsub(/&lt;\/?(?:#{elements.join("|")})(?!\w)(?:.|\n)*?&gt;/i) do
++      string.gsub(/&lt;\/?(?:#{elements.join("|")})\b(?>[^&]+|&(?![gl]t;)\w+;)*(?:&gt;)?/im) do
+         unescapeHTML($&)
+       end
+     else
+diff --git a/test/cgi/test_cgi_util.rb b/test/cgi/test_cgi_util.rb
+index a3be193..d058ccc 100644
+--- a/test/cgi/test_cgi_util.rb
++++ b/test/cgi/test_cgi_util.rb
+@@ -244,6 +244,14 @@ class CGIUtilTest < Test::Unit::TestCase
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
+@@ -252,6 +260,16 @@ class CGIUtilTest < Test::Unit::TestCase
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
+2.25.1
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index 96873fd7fa..ac9dec3514 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -46,6 +46,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2024-49761-0008.patch \
            file://CVE-2024-49761-0009.patch \
            file://CVE-2024-41946.patch \
+           file://CVE-2025-27220.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.43.0


