Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B16AC433FE
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 14:13:04 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.2797.1668348784024046338
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 06:13:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=N7YxbWhI;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id d59-20020a17090a6f4100b00213202d77e1so11581647pjk.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 06:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VE4x+/t9qsVAlL3KXRHXNQwts6Uo0rNFVGBWucWI3TM=;
        b=N7YxbWhIIZ2Ttw2yQDtdHANqXSXss+SW3sdXRxcMs8HsMlPV5AQwMyxqBFKSFfPPp+
         ddeUYEWMajHrvC6ICz84Rnznp67N+Zl4J07hzaaEwQPXAErFAYpla8AAWB+jHuBydY0E
         JaJ7X8w36ViOzGrLgs3Mt7HjJGB6pMvtF6CrQFXWFFk/lXFpDhjXIX6W0bBrLCUwrLVD
         SOYM/KjSD8dg7Pg27sg5hMUTp5bpDHi4gtV4X1eAxod8NwxoH3nmAs6yiHGm/yTpMxG6
         xmO3ikbQ3X48qAoNonKiTaETv+TpiPcYdgdims76IxjxwsXFxQGoE21h/APr2mO2oka4
         sYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VE4x+/t9qsVAlL3KXRHXNQwts6Uo0rNFVGBWucWI3TM=;
        b=AZO9a++1md1+lzMXASFc7FVyz/kjGFNsaIB3bLF/p7AXxh7K7m2aSTT9ohdStJTtB5
         MioKJiM1nOICWypgjccia9m+IFHMXKDcb6ebmmFFSXOGHYeuK82TWyGgkkzmAA57qdFP
         bjeIgSKCBvjuUO94juStL3uA/oJi1Ey+yXPDz+yCeKAGATpMD5t+gUtL5Y/z/o4sLm7L
         g7w7NFVDW/B9d8/adLFagbNFN+avChLghk3qaCFL/lGYkavZu9dUQXNh2VeJoM3yj5t7
         a0IvRhh0SEPbHsyvlN50sII7pbTWFCw8dp7A19gHkH8ZVP6e0W/ugTsLQMQwlggZUWUc
         oMlA==
X-Gm-Message-State: ANoB5pnOvdaEdWb3YtePcUtCP78ldNLkG+09w2RsQHz2qCnn+CQs+7/1
	qLFBwg7NTFnI8EMaJCEVlOKVzRlAl/+hAeGU
X-Google-Smtp-Source: AA0mqf4F1e4Mp592WiG3VLZp0jgPiVhYvkiB/GEh80J63SDaQPJ7ZzrexkQg9JrbLXF8SUAZFxkSZw==
X-Received: by 2002:a17:90a:898f:b0:210:6c69:6345 with SMTP id v15-20020a17090a898f00b002106c696345mr10185457pjn.50.1668348782875;
        Sun, 13 Nov 2022 06:13:02 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id w34-20020a634762000000b0046b2ebb0a52sm4198771pgk.17.2022.11.13.06.13.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 06:13:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/9] python3-mako: backport fix for CVE-2022-40023
Date: Sun, 13 Nov 2022 04:12:41 -1000
Message-Id: <34727812b54fd52f85806f4f95702286d551b5fd.1668348622.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668348622.git.steve@sakoman.com>
References: <cover.1668348622.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 14:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173197

From: Narpat Mali <narpat.mali@windriver.com>

Sqlalchemy mako before 1.2.2 is vulnerable to Regular expression Denial of Service
when using the Lexer class to parse. This also affects babelplugin and linguaplugin.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-40023

Reference to Upstream Patch:
https://github.com/sqlalchemy/mako/commit/925760291d6efec64fda6e9dd1fd9cfbd5be068c

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3-mako/CVE-2022-40023.patch  | 119 ++++++++++++++++++
 .../python/python3-mako_1.1.6.bb              |   2 +
 2 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-mako/CVE-2022-40023.patch

diff --git a/meta/recipes-devtools/python/python3-mako/CVE-2022-40023.patch b/meta/recipes-devtools/python/python3-mako/CVE-2022-40023.patch
new file mode 100644
index 0000000000..66690e74b4
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-mako/CVE-2022-40023.patch
@@ -0,0 +1,119 @@
+From 925760291d6efec64fda6e9dd1fd9cfbd5be068c Mon Sep 17 00:00:00 2001
+From: Mike Bayer <mike_mp@zzzcomputing.com>
+Date: Mon, 29 Aug 2022 12:28:52 -0400
+Subject: [PATCH] fix tag regexp to match quoted groups correctly
+
+Fixed issue in lexer where the regexp used to match tags would not
+correctly interpret quoted sections individually. While this parsing issue
+still produced the same expected tag structure later on, the mis-handling
+of quoted sections was also subject to a regexp crash if a tag had a large
+number of quotes within its quoted sections.
+
+Fixes: #366
+Change-Id: I74e0d71ff7f419970711a7cd51adcf1bb90a44c0
+
+Upstream-Status: Backport [https://github.com/sqlalchemy/mako/commit/925760291d6efec64fda6e9dd1fd9cfbd5be068c]
+
+Signed-off-by: <narpat.mali@windriver.com>
+
+---
+ doc/build/unreleased/366.rst |  9 +++++++++
+ mako/lexer.py                | 12 ++++++++----
+ test/test_lexer.py           | 21 +++++++++++++++++----
+ 3 files changed, 34 insertions(+), 8 deletions(-)
+ create mode 100644 doc/build/unreleased/366.rst
+
+--- /dev/null
++++ Mako-1.1.6/doc/build/unreleased/366.rst
+@@ -0,0 +1,9 @@
++.. change::
++    :tags: bug, lexer
++    :tickets: 366
++
++    Fixed issue in lexer where the regexp used to match tags would not
++    correctly interpret quoted sections individually. While this parsing issue
++    still produced the same expected tag structure later on, the mis-handling
++    of quoted sections was also subject to a regexp crash if a tag had a large
++    number of quotes within its quoted sections.
+\ No newline at end of file
+--- Mako-1.1.6.orig/mako/lexer.py
++++ Mako-1.1.6/mako/lexer.py
+@@ -295,20 +295,24 @@ class Lexer(object):
+         return self.template
+ 
+     def match_tag_start(self):
+-        match = self.match(
+-            r"""
++        reg = r"""
+             \<%     # opening tag
+ 
+             ([\w\.\:]+)   # keyword
+ 
+-            ((?:\s+\w+|\s*=\s*|".*?"|'.*?')*)  # attrname, = \
++            ((?:\s+\w+|\s*=\s*|"[^"]*?"|'[^']*?'|\s*,\s*)*)  # attrname, = \
+                                                #        sign, string expression
++                                               # comma is for backwards compat
++                                               # identified in #366
+ 
+             \s*     # more whitespace
+ 
+             (/)?>   # closing
+ 
+-            """,
++        """
++
++        match = self.match(
++            reg,
+             re.I | re.S | re.X,
+         )
+ 
+--- Mako-1.1.6.orig/test/test_lexer.py
++++ Mako-1.1.6/test/test_lexer.py
+@@ -1,5 +1,7 @@
+ import re
+ 
++import pytest
++
+ from mako import compat
+ from mako import exceptions
+ from mako import parsetree
+@@ -146,6 +148,10 @@ class LexerTest(TemplateTest):
+         """
+         self.assertRaises(exceptions.CompileException, Lexer(template).parse)
+ 
++    def test_tag_many_quotes(self):
++        template = "<%0" + '"' * 3000
++        assert_raises(exceptions.SyntaxException, Lexer(template).parse)
++
+     def test_unmatched_tag(self):
+         template = """
+         <%namespace name="bar">
+@@ -432,9 +438,16 @@ class LexerTest(TemplateTest):
+             ),
+         )
+ 
+-    def test_pagetag(self):
+-        template = """
+-            <%page cached="True", args="a, b"/>
++    @pytest.mark.parametrize("comma,numchars", [(",", 48), ("", 47)])
++    def test_pagetag(self, comma, numchars):
++        # note that the comma here looks like:
++        # <%page cached="True", args="a, b"/>
++        # that's what this test has looked like for decades, however, the
++        # comma there is not actually the right syntax.  When issue #366
++        # was fixed, the reg was altered to accommodate for this comma to allow
++        # backwards compat
++        template = f"""
++            <%page cached="True"{comma} args="a, b"/>
+ 
+             some template
+         """
+@@ -453,7 +466,7 @@ class LexerTest(TemplateTest):
+ 
+             some template
+         """,
+-                        (2, 48),
++                        (2, numchars),
+                     ),
+                 ],
+             ),
diff --git a/meta/recipes-devtools/python/python3-mako_1.1.6.bb b/meta/recipes-devtools/python/python3-mako_1.1.6.bb
index 71e5d96ba1..4e4f33f5dc 100644
--- a/meta/recipes-devtools/python/python3-mako_1.1.6.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.1.6.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=943eb67718222db21d44a4ef1836675f"
 
 PYPI_PACKAGE = "Mako"
 
+SRC_URI += "file://CVE-2022-40023.patch"
+
 inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "4e9e345a41924a954251b95b4b28e14a301145b544901332e658907a7464b6b2"
-- 
2.25.1


