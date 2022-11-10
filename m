Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714B7C4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 14:18:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8076.1668089907684363913
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 06:18:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=OsxnTvDk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8313773439=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AACe9Ok030250
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 14:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=fcr4t63hnI/WV91S5207/+WiWMAFQdnXz+MI5YnGen8=;
 b=OsxnTvDkR0gEGPEBW+b7mL4zhZ5kJx8LjjmEeWSwdZ6+vT0GnqYH68yZ4g282lHkgAS+
 WcWOP6qmhi9+064dmXeXr7o9ly2rFafO1psAiFNTzQKxoNrPqerVfxiSn6PKnm2YKRxx
 9ZsvoS+tsd3/sJDUEBMAFFDaXQxPPelagHUhU1/RrLF61nR/jcv65/IIVvoCh2ArY35u
 zgSHqKXvuhiBqBAg4iAL4A+RfCrfBir65gUjZ7swlhEsYGf28PQ8l4IALvFTWLXeBC28
 7c22RD9UOw/dA7exwiiPH5Smfj/30m4ay7XcjvPrefoefsGAxFwwCCjYCh251wxJUiPq vw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knet9mq8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 14:18:26 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AAEIQbK029425
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 14:18:26 GMT
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knet9mq8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 10 Nov 2022 14:18:26 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 10 Nov 2022 06:18:24 -0800
Received: from pek-hostel-deb01.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2308.27 via Frontend Transport; Thu, 10 Nov 2022 06:18:23 -0800
From: Narpat Mali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <archana.polampalli@windriver.com>, <hari.gpillai@windriver.com>,
        <joe.slater@windriver.com>, <ticotimo@gmail.com>,
        Narpat Mali
	<narpat.mali@windriver.com>
Subject: [OE-core][kirkstone][PATCH 1/1] python3-mako: backport fix for CVE-2022-40023
Date: Thu, 10 Nov 2022 22:18:06 +0800
Message-ID: <20221110141806.4193236-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: EcIGexWFC5UfxN7fxnyKhvM7sQZIDhL3
X-Proofpoint-ORIG-GUID: xZsPFNvlDa1FKIZoK9WvK6C2c29WWOAJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_08,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=968 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211100101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 14:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173075

Sqlalchemy mako before 1.2.2 is vulnerable to Regular expression Denial of Service
when using the Lexer class to parse. This also affects babelplugin and linguaplugin.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-40023

Reference to Upstream Patch:
https://github.com/sqlalchemy/mako/commit/925760291d6efec64fda6e9dd1fd9cfbd5be068c

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
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


