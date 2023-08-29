Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BB6C83F14
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 14:58:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.19635.1693321099825269112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Aug 2023 07:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mOIYAG6K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7605b1b82d=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37TCU2Yc030009
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 14:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=TRhyo
	Mq4qihF/9eqgHByCdndC44recKxO+Eq2enEOrk=; b=mOIYAG6KjRuhAZ2DJNGJ9
	oVj0QgcIpZsA0hVEASTdambvzNNQphKXnZxFYl/tWYWnyehPq0uTWmqEY5o42vzm
	nFp6l3UJVKbmgrED5Vq/yr3K+QavPY2Av17u6ZBn6xeTxatTpmOq7H5LxIehl6EN
	mmUNywR12QhDZMHLwYI5EMumnWzDSSE5JUtxoLPF3S5v9DUFQ1ZkdaFjTcxdJi3Y
	Ww7e3s26ygocE9h7nToqH/mBtO2kvowBnbWpI6vQRboj7NwYWUpiQmnMhsVbTqcK
	ZAmKhw24Lx3uE2cCikwwXXLkGJlMGuRp/EHY/Hs64i1pO/qVB5XqIyqs/Iw8YQAm
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sq8c62qws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 14:58:18 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 07:58:15 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][mickledore][PATCH 1/1] python3-pygments: fix for CVE-2022-40896
Date: Tue, 29 Aug 2023 14:57:53 +0000
Message-ID: <20230829145753.3573789-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 4OwHRnHt4BXkiGDSJwDnSDQnyg0qT-NF
X-Proofpoint-GUID: 4OwHRnHt4BXkiGDSJwDnSDQnyg0qT-NF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_12,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308290128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 14:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186864

From: Narpat Mali <narpat.mali@windriver.com>

A ReDoS issue was discovered in pygments/lexers/smithy.py in pygments
through 2.15.0 via SmithyLexer.

The CVE issue is fixed by these 3 different commits in different version:
1. Improve the Smithy metadata matcher (These changes are already available as part
   of current python3-pygments_2.14.0 version):
https://github.com/pygments/pygments/commit/dd52102c38ebe78cd57748e09f38929fd283ad04 (2.14.0)
2. SQL+Jinja: use a simpler regex in analyse_text:
https://github.com/pygments/pygments/commit/97eb3d5ec7c1b3ea4fcf9dee30a2309cf92bd194 (2.15.0)
3. Improve Java properties lexer (#2404):
https://github.com/pygments/pygments/commit/fdf182a7af85b1deeeb637ca970d31935e7c9d52 (2.15.1)

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-40896
https://pyup.io/posts/pyup-discovers-redos-vulnerabilities-in-top-python-packages-part-2/

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../CVE-2022-40896-0001.patch                 |  49 +++
 .../CVE-2022-40896-0002.patch                 | 301 ++++++++++++++++++
 .../python/python3-pygments_2.14.0.bb         |   4 +
 3 files changed, 354 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pygments/CVE-2022-40896-0001.patch
 create mode 100644 meta/recipes-devtools/python/python3-pygments/CVE-2022-40896-0002.patch

diff --git a/meta/recipes-devtools/python/python3-pygments/CVE-2022-40896-0001.patch b/meta/recipes-devtools/python/python3-pygments/CVE-2022-40896-0001.patch
new file mode 100644
index 0000000000..d7fc87fec8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pygments/CVE-2022-40896-0001.patch
@@ -0,0 +1,49 @@
+From 9a73f2a80e5cf869d473ddcbfceaab229fb99b5e Mon Sep 17 00:00:00 2001
+From: Narpat Mali <narpat.mali@windriver.com>
+Date: Mon, 28 Aug 2023 15:04:14 +0000
+Subject: [PATCH] SQL+Jinja: use a simpler regex in analyse_text
+
+Fixes catastrophic backtracking
+
+Fixes #2355
+
+CVE: CVE-2022-40896
+
+Upstream-Status: Backport [https://github.com/pygments/pygments/commit/97eb3d5ec7c1b3ea4fcf9dee30a2309cf92bd194]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ CHANGES                      | 1 +
+ pygments/lexers/templates.py | 6 +-----
+ 2 files changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/CHANGES b/CHANGES
+index 2aa54fa..4c84fa6 100644
+--- a/CHANGES
++++ b/CHANGES
+@@ -61,6 +61,7 @@ Version 2.14.0
+   * Spice: Add ``enum`` keyword and fix a bug regarding binary,
+     hexadecimal and octal number tokens (#2227)
+   * YAML: Accept colons in key names (#2277)
++  * SQL+Jinja (``analyse_text`` method): fix catastrophic backtracking [Backported]
+
+ - Fix `make mapfiles` when Pygments is not installed in editable mode
+   (#2223)
+diff --git a/pygments/lexers/templates.py b/pygments/lexers/templates.py
+index 1fcf708..1066294 100644
+--- a/pygments/lexers/templates.py
++++ b/pygments/lexers/templates.py
+@@ -2291,10 +2291,6 @@ class SqlJinjaLexer(DelegatingLexer):
+         if re.search(r'\{\{\s*source\(.*\)\s*\}\}', text):
+             rv += 0.25
+         # Jinja macro
+-        if re.search(
+-            r'\{%-?\s*macro \w+\(.*\)\s*-?%\}\s+.*\s+\{%-?\s*endmacro\s*-?%\}',
+-            text,
+-            re.S,
+-        ):
++        if re.search(r'\{%-?\s*macro \w+\(.*\)\s*-?%\}', text):
+             rv += 0.15
+         return rv
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3-pygments/CVE-2022-40896-0002.patch b/meta/recipes-devtools/python/python3-pygments/CVE-2022-40896-0002.patch
new file mode 100644
index 0000000000..61ebe5dad5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pygments/CVE-2022-40896-0002.patch
@@ -0,0 +1,301 @@
+From 45ff8eabe0363f829c397372aefc3b23aeb135b3 Mon Sep 17 00:00:00 2001
+From: Narpat Mali <narpat.mali@windriver.com>
+Date: Tue, 29 Aug 2023 10:45:34 +0000
+Subject: [PATCH] Improve Java properties lexer (#2404)
+
+Use special lexer rules for escapes; fixes catastrophic backtracking,
+and highlights them too.
+
+Fixes #2356
+
+CVE: CVE-2022-40896
+
+Upstream-Status: Backport [https://github.com/pygments/pygments/commit/fdf182a7af85b1deeeb637ca970d31935e7c9d52]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ pygments/lexers/configs.py                    |  50 +++++---
+ tests/examplefiles/properties/java.properties |  11 ++
+ .../properties/java.properties.output         | 110 +++++++++++++++---
+ .../test_escaped_space_in_value.txt           |   4 +-
+ .../properties/test_just_key_with_space.txt   |   4 +-
+ 5 files changed, 143 insertions(+), 36 deletions(-)
+
+diff --git a/pygments/lexers/configs.py b/pygments/lexers/configs.py
+index e04c722..b28b56a 100644
+--- a/pygments/lexers/configs.py
++++ b/pygments/lexers/configs.py
+@@ -129,26 +129,42 @@ class PropertiesLexer(RegexLexer):
+
+     tokens = {
+         'root': [
+-            (r'\s+', Whitespace),
++            # comments
+             (r'[!#].*|/{2}.*', Comment.Single),
+-            # search for first separator
+-            (r'([^\\\n]|\\.)*?(?=[ \f\t=:])', Name.Attribute, "separator"),
+-            # empty key
+-            (r'.+?$', Name.Attribute),
++            # ending a comment or whitespace-only line
++            (r'\n', Whitespace),
++            # eat whitespace at the beginning of a line
++            (r'^[^\S\n]+', Whitespace),
++            # start lexing a key
++            default('key'),
+         ],
+-        'separator': [
+-            # search for line continuation escape
+-            (r'([ \f\t]*)([=:]*)([ \f\t]*)(.*(?<!\\)(?:\\{2})*)(\\)(?!\\)$',
+-             bygroups(Whitespace, Operator, Whitespace, String, Text), "value", "#pop"),
+-            (r'([ \f\t]*)([=:]*)([ \f\t]*)(.*)',
+-             bygroups(Whitespace, Operator, Whitespace, String), "#pop"),
++        'key': [
++            # non-escaped key characters
++            (r'[^\\:=\s]+', Name.Attribute),
++            # escapes
++            include('escapes'),
++            # separator is the first non-escaped whitespace or colon or '=' on the line;
++            # if it's whitespace, = and : are gobbled after it
++            (r'([^\S\n]*)([:=])([^\S\n]*)',
++             bygroups(Whitespace, Operator, Whitespace),
++             ('#pop', 'value')),
++            (r'[^\S\n]+', Whitespace, ('#pop', 'value')),
++            # maybe we got no value after all
++            (r'\n', Whitespace, '#pop'),
+         ],
+-        'value': [     # line continuation
+-            (r'\s+', Whitespace),
+-            # search for line continuation escape
+-            (r'(\s*)(.*(?<!\\)(?:\\{2})*)(\\)(?!\\)([ \t]*)',
+-             bygroups(Whitespace, String, Text, Whitespace)),
+-            (r'.*$', String, "#pop"),
++        'value': [
++            # non-escaped value characters
++            (r'[^\\\n]+', String),
++            # escapes
++            include('escapes'),
++            # end the value on an unescaped newline
++            (r'\n', Whitespace, '#pop'),
++        ],
++        'escapes': [
++            # line continuations; these gobble whitespace at the beginning of the next line
++            (r'(\\\n)([^\S\n]*)', bygroups(String.Escape, Whitespace)),
++            # other escapes
++            (r'\\(.|\n)', String.Escape),
+         ],
+     }
+
+diff --git a/tests/examplefiles/properties/java.properties b/tests/examplefiles/properties/java.properties
+index d5b594e..7fe915c 100644
+--- a/tests/examplefiles/properties/java.properties
++++ b/tests/examplefiles/properties/java.properties
+@@ -14,6 +14,8 @@ key = \
+     and value2\\
+ key\ 2 = value
+ key\\ 3 = value3
++key \
++  = value
+
+ ! empty keys and edge cases
+ key1 =
+@@ -22,3 +24,12 @@ key3 the value3
+ key4 the:value4
+ key5 the=value5
+ key6=the value6
++
++! escapes in keys
++key\ with\ spaces = value
++key\nwith\nnewlines = value\nwith\nnewlines
++
++   ! indented comment
++
++! line continuations do \
++not = work for comments
+diff --git a/tests/examplefiles/properties/java.properties.output b/tests/examplefiles/properties/java.properties.output
+index 0c1fdee..4822575 100644
+--- a/tests/examplefiles/properties/java.properties.output
++++ b/tests/examplefiles/properties/java.properties.output
+@@ -2,13 +2,17 @@
+ '\n'          Text.Whitespace
+
+ '# mixing spaces' Comment.Single
+-'\n\t'        Text.Whitespace
++'\n'          Text.Whitespace
++
++'\t'          Text.Whitespace
+ 'Truth'       Name.Attribute
+ ' '           Text.Whitespace
+ '='           Operator
+ ' '           Text.Whitespace
+ 'Beauty'      Literal.String
+-'\n  '        Text.Whitespace
++'\n'          Text.Whitespace
++
++'  '          Text.Whitespace
+ 'Truth'       Name.Attribute
+ ':'           Operator
+ 'Beauty'      Literal.String
+@@ -23,18 +27,24 @@
+ '                    ' Text.Whitespace
+ ':'           Operator
+ 'Beauty'      Literal.String
+-'\n \n'       Text.Whitespace
++'\n'          Text.Whitespace
++
++'\n'          Text.Whitespace
+
+ '! line continuations and escapes' Comment.Single
+-'\n '         Text.Whitespace
++'\n'          Text.Whitespace
++
++' '           Text.Whitespace
+ 'fruits'      Name.Attribute
+ '                           ' Text.Whitespace
+ 'apple, banana, pear, ' Literal.String
+-'\\'          Text
+-'\n                                  ' Text.Whitespace
++'\\\n'        Literal.String.Escape
++
++'                                  ' Text.Whitespace
+ 'cantaloupe, watermelon, ' Literal.String
+-'\\'          Text
+-'\n                                  ' Text.Whitespace
++'\\\n'        Literal.String.Escape
++
++'                                  ' Text.Whitespace
+ 'kiwi, mango' Literal.String
+ '\n'          Text.Whitespace
+
+@@ -42,25 +52,42 @@
+ ' '           Text.Whitespace
+ '='           Operator
+ ' '           Text.Whitespace
+-'\\'          Text
+-'\n    '      Text.Whitespace
+-'value1 \\\\' Literal.String
+-'\\'          Text
+-'\n    '      Text.Whitespace
+-'and value2\\\\' Literal.String
++'\\\n'        Literal.String.Escape
++
++'    '        Text.Whitespace
++'value1 '     Literal.String
++'\\\\'        Literal.String.Escape
++'\\\n'        Literal.String.Escape
++
++'    '        Text.Whitespace
++'and value2'  Literal.String
++'\\\\'        Literal.String.Escape
+ '\n'          Text.Whitespace
+
+-'key\\ 2'     Name.Attribute
++'key'         Name.Attribute
++'\\ '         Literal.String.Escape
++'2'           Name.Attribute
+ ' '           Text.Whitespace
+ '='           Operator
+ ' '           Text.Whitespace
+ 'value'       Literal.String
+ '\n'          Text.Whitespace
+
+-'key\\\\'     Name.Attribute
++'key'         Name.Attribute
++'\\\\'        Literal.String.Escape
+ ' '           Text.Whitespace
+ '3 = value3'  Literal.String
+-'\n\n'        Text.Whitespace
++'\n'          Text.Whitespace
++
++'key'         Name.Attribute
++' '           Text.Whitespace
++'\\\n'        Literal.String.Escape
++
++'  '          Text.Whitespace
++'= value'     Literal.String
++'\n'          Text.Whitespace
++
++'\n'          Text.Whitespace
+
+ '! empty keys and edge cases' Comment.Single
+ '\n'          Text.Whitespace
+@@ -92,3 +119,52 @@
+ '='           Operator
+ 'the value6'  Literal.String
+ '\n'          Text.Whitespace
++
++'\n'          Text.Whitespace
++
++'! escapes in keys' Comment.Single
++'\n'          Text.Whitespace
++
++'key'         Name.Attribute
++'\\ '         Literal.String.Escape
++'with'        Name.Attribute
++'\\ '         Literal.String.Escape
++'spaces'      Name.Attribute
++' '           Text.Whitespace
++'='           Operator
++' '           Text.Whitespace
++'value'       Literal.String
++'\n'          Text.Whitespace
++
++'key'         Name.Attribute
++'\\n'         Literal.String.Escape
++'with'        Name.Attribute
++'\\n'         Literal.String.Escape
++'newlines'    Name.Attribute
++' '           Text.Whitespace
++'='           Operator
++' '           Text.Whitespace
++'value'       Literal.String
++'\\n'         Literal.String.Escape
++'with'        Literal.String
++'\\n'         Literal.String.Escape
++'newlines'    Literal.String
++'\n'          Text.Whitespace
++
++'\n'          Text.Whitespace
++
++'   '         Text.Whitespace
++'! indented comment' Comment.Single
++'\n'          Text.Whitespace
++
++'\n'          Text.Whitespace
++
++'! line continuations do \\' Comment.Single
++'\n'          Text.Whitespace
++
++'not'         Name.Attribute
++' '           Text.Whitespace
++'='           Operator
++' '           Text.Whitespace
++'work for comments' Literal.String
++'\n'          Text.Whitespace
+diff --git a/tests/snippets/properties/test_escaped_space_in_value.txt b/tests/snippets/properties/test_escaped_space_in_value.txt
+index f76507f..44772d8 100644
+--- a/tests/snippets/properties/test_escaped_space_in_value.txt
++++ b/tests/snippets/properties/test_escaped_space_in_value.txt
+@@ -6,5 +6,7 @@ key = doubleword\ value
+ ' '           Text.Whitespace
+ '='           Operator
+ ' '           Text.Whitespace
+-'doubleword\\ value' Literal.String
++'doubleword'  Literal.String
++'\\ '         Literal.String.Escape
++'value'       Literal.String
+ '\n'          Text.Whitespace
+diff --git a/tests/snippets/properties/test_just_key_with_space.txt b/tests/snippets/properties/test_just_key_with_space.txt
+index 660c37c..833fe40 100644
+--- a/tests/snippets/properties/test_just_key_with_space.txt
++++ b/tests/snippets/properties/test_just_key_with_space.txt
+@@ -2,5 +2,7 @@
+ just\ key
+
+ ---tokens---
+-'just\\ key'  Name.Attribute
++'just'        Name.Attribute
++'\\ '         Literal.String.Escape
++'key'         Name.Attribute
+ '\n'          Text.Whitespace
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3-pygments_2.14.0.bb b/meta/recipes-devtools/python/python3-pygments_2.14.0.bb
index 16769e9263..b5b8abc113 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.14.0.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.14.0.bb
@@ -7,6 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 inherit setuptools3
 SRC_URI[sha256sum] = "b3ed06a9e8ac9a9aae5a6f5dbe78a8a58655d17b43b93c078f094ddc476ae297"
 
+SRC_URI += "file://CVE-2022-40896-0001.patch \
+            file://CVE-2022-40896-0002.patch \
+           "
+
 DEPENDS += "\
             ${PYTHON_PN} \
             "
-- 
2.40.0


