Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A99C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 06:14:37 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.5080.1741328073682577362
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 22:14:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ZLJ9VsZu;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22374f56453so36891175ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 22:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741328073; x=1741932873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jVv7I1DptJB156oPPi5l5x80nFViQ1D7SUFMz2YZxjs=;
        b=ZLJ9VsZubcYP0YjFMoVtAQbgmM655d3/nSMBXRtlWiiucuo9o6YrRQWkP2N+q+SFcD
         p5hXERUmSDdtzlk8Y3+y5NDmzOMmFvhogWB/vq7QUB68T66CnYHL/tXptZrmjSSPJxOT
         t1okxI7L8ZoKcwnmfeoS7nEAfJ2WIy+OC0Ldg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741328073; x=1741932873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVv7I1DptJB156oPPi5l5x80nFViQ1D7SUFMz2YZxjs=;
        b=PTF/1JzLxt1v8dhpicV2uGdAQnw7yVdjBS+GB3GaBlaSzJMdFThATAkFnTI8y9f7Py
         WUNRp0KWqMsVgrAukSmVD/6cED9wRBXDRxJbsN1cnXOFyTO7VuDRpAAXeBPa66rCKbI0
         gyqshYGFmFX9kkYDeNXQztp+SttlRig9UAl0qRBLp1ZIr4leqSzzt72N9V2DrdGONKtb
         oInjOO+vxRZJSX6dfxkBGvfKS8naqdiOzTtmELmF3r37sCDDUKIRTykT6LwbJUjHOBwt
         cZ0+NuWXGGLflzszfJL5ifJx9vwwckADTS4gRkBne5bRpXDC+KSz1gfm6Ib4S/WVKbmL
         YFxw==
X-Gm-Message-State: AOJu0YyXe6oVwYwhtoQOiKPTROd+/D5vblZ93tOKoOoBA6O0oWHC52ey
	qDw1s/WYZehJF9P1W3fZ/ZGVmhqU5ol8HAmpetm7RsP09H5xzZNnC7eeKs8/xkx+W/Ndlv9Q3nC
	b
X-Gm-Gg: ASbGncv1AIKEG6h/cio+QR/Cq6Nh0rgiPmPkef55iN8BN9UQgpnASpJ7xmkab/EebwI
	h+k3+cIRKL1ad0jFQVLfC2TQNyw4TlkNIm+G0upfd0fa8HsZcwn8nv3kRp5LfsbRIS42lhl2S4A
	7ROPRm1iJSOrHgBIPLQRYIaQ7DuW/j8E2JwoSaBXXid1s+fvfvhT7MibOmxEawdIW3aAbfT+25o
	QqfuaBQ2kgN3UkbenDfbihfjtaBQPnjWe6F/4jfFuaPyV7Z68qk26ay2pBGPQqjjclzygmWZBG/
	UPzKKS0Y2PtgeDjUP1sYm2VYrKRtMmqlpBNqulLWRhwvyq2Qk7+I6Hbv9A==
X-Google-Smtp-Source: AGHT+IGkvsXhHV7yivfcc4No7m8Zcl1I6TrgMdhjB3M71OIYmfP2jI4OA3urAuSCK7xSO41o2ooLUQ==
X-Received: by 2002:a17:902:d4cc:b0:220:c164:6ee1 with SMTP id d9443c01a7336-22428ab72fdmr27930415ad.32.1741328072912;
        Thu, 06 Mar 2025 22:14:32 -0800 (PST)
Received: from MVIN00016.mvista.com ([27.121.101.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e9fe2sm22440195ad.94.2025.03.06.22.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 22:14:32 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] ruby: Fix CVE-2025-27220
Date: Fri,  7 Mar 2025 11:44:19 +0530
Message-Id: <20250307061419.54446-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 06:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212411

Upstream-Status: Backport from https://github.com/ruby/cgi/commit/cd1eb08076c8b8e310d4d553d427763f2577a1b6

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
2.25.1


