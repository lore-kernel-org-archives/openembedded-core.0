Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED36CD13CF
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 12:50:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.22337.1725367840847047382
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 05:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=99761bc802=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4834o3g9020689
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Sep 2024 05:50:40 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41c2pkjmd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 05:50:40 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 05:50:39 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 05:50:38 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/1] python3: Fix CVE-2024-7592
Date: Tue, 3 Sep 2024 12:50:34 +0000
Message-ID: <20240903125034.1362675-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=c+X5Qg9l c=1 sm=1 tr=0 ts=66d70620 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=8AHkEIZyAAAA:8
 a=1ZZcJApSMeBF3rBNJIoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: htE8psSvlp-P-cnhvzVu1Qmt8KbkU3YR
X-Proofpoint-GUID: htE8psSvlp-P-cnhvzVu1Qmt8KbkU3YR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2407110000
 definitions=main-2409030104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 12:50:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204159

From: Soumya Sambu <soumya.sambu@windriver.com>

There is a LOW severity vulnerability affecting CPython, specifically the
'http.cookies' standard library module. When parsing cookies that contained
backslashes for quoted characters in the cookie value, the parser would use
an algorithm with quadratic complexity, resulting in excess CPU resources
being used while parsing the value.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-7592

Upstream-Patch:
https://github.com/python/cpython/commit/dcc3eaef98cd94d6cb6cb0f44bd1c903d04f33b1

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python/python3/CVE-2024-7592.patch        | 143 ++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.4.bb |   1 +
 2 files changed, 144 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2024-7592.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2024-7592.patch b/meta/recipes-devtools/python/python3/CVE-2024-7592.patch
new file mode 100644
index 0000000000..7a6d63005c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2024-7592.patch
@@ -0,0 +1,143 @@
+From dcc3eaef98cd94d6cb6cb0f44bd1c903d04f33b1 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Sun, 25 Aug 2024 00:37:11 +0200
+Subject: [PATCH] gh-123067: Fix quadratic complexity in parsing  "-quoted
+ cookie values with backslashes (GH-123075) (#123104)
+
+gh-123067: Fix quadratic complexity in parsing "-quoted cookie values with backslashes (GH-123075)
+
+This fixes CVE-2024-7592.
+(cherry picked from commit 44e458357fca05ca0ae2658d62c8c595b048b5ef)
+
+Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
+
+CVE: CVE-2024-7592
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/dcc3eaef98cd94d6cb6cb0f44bd1c903d04f33b1]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ Lib/http/cookies.py                           | 34 ++++-------------
+ Lib/test/test_http_cookies.py                 | 38 +++++++++++++++++++
+ ...-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst |  1 +
+ 3 files changed, 47 insertions(+), 26 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst
+
+diff --git a/Lib/http/cookies.py b/Lib/http/cookies.py
+index 35ac2dc..2c1f021 100644
+--- a/Lib/http/cookies.py
++++ b/Lib/http/cookies.py
+@@ -184,8 +184,13 @@ def _quote(str):
+         return '"' + str.translate(_Translator) + '"'
+
+
+-_OctalPatt = re.compile(r"\\[0-3][0-7][0-7]")
+-_QuotePatt = re.compile(r"[\\].")
++_unquote_sub = re.compile(r'\\(?:([0-3][0-7][0-7])|(.))').sub
++
++def _unquote_replace(m):
++    if m[1]:
++        return chr(int(m[1], 8))
++    else:
++        return m[2]
+
+ def _unquote(str):
+     # If there aren't any doublequotes,
+@@ -205,30 +210,7 @@ def _unquote(str):
+     #    \012 --> \n
+     #    \"   --> "
+     #
+-    i = 0
+-    n = len(str)
+-    res = []
+-    while 0 <= i < n:
+-        o_match = _OctalPatt.search(str, i)
+-        q_match = _QuotePatt.search(str, i)
+-        if not o_match and not q_match:              # Neither matched
+-            res.append(str[i:])
+-            break
+-        # else:
+-        j = k = -1
+-        if o_match:
+-            j = o_match.start(0)
+-        if q_match:
+-            k = q_match.start(0)
+-        if q_match and (not o_match or k < j):     # QuotePatt matched
+-            res.append(str[i:k])
+-            res.append(str[k+1])
+-            i = k + 2
+-        else:                                      # OctalPatt matched
+-            res.append(str[i:j])
+-            res.append(chr(int(str[j+1:j+4], 8)))
+-            i = j + 4
+-    return _nulljoin(res)
++    return _unquote_sub(_unquote_replace, str)
+
+ # The _getdate() routine is used to set the expiration time in the cookie's HTTP
+ # header.  By default, _getdate() returns the current time in the appropriate
+diff --git a/Lib/test/test_http_cookies.py b/Lib/test/test_http_cookies.py
+index 925c869..8879902 100644
+--- a/Lib/test/test_http_cookies.py
++++ b/Lib/test/test_http_cookies.py
+@@ -5,6 +5,7 @@ import unittest
+ import doctest
+ from http import cookies
+ import pickle
++from test import support
+
+
+ class CookieTests(unittest.TestCase):
+@@ -58,6 +59,43 @@ class CookieTests(unittest.TestCase):
+             for k, v in sorted(case['dict'].items()):
+                 self.assertEqual(C[k].value, v)
+
++    def test_unquote(self):
++        cases = [
++            (r'a="b=\""', 'b="'),
++            (r'a="b=\\"', 'b=\\'),
++            (r'a="b=\="', 'b=='),
++            (r'a="b=\n"', 'b=n'),
++            (r'a="b=\042"', 'b="'),
++            (r'a="b=\134"', 'b=\\'),
++            (r'a="b=\377"', 'b=\xff'),
++            (r'a="b=\400"', 'b=400'),
++            (r'a="b=\42"', 'b=42'),
++            (r'a="b=\\042"', 'b=\\042'),
++            (r'a="b=\\134"', 'b=\\134'),
++            (r'a="b=\\\""', 'b=\\"'),
++            (r'a="b=\\\042"', 'b=\\"'),
++            (r'a="b=\134\""', 'b=\\"'),
++            (r'a="b=\134\042"', 'b=\\"'),
++        ]
++        for encoded, decoded in cases:
++            with self.subTest(encoded):
++                C = cookies.SimpleCookie()
++                C.load(encoded)
++                self.assertEqual(C['a'].value, decoded)
++
++    @support.requires_resource('cpu')
++    def test_unquote_large(self):
++        n = 10**6
++        for encoded in r'\\', r'\134':
++            with self.subTest(encoded):
++                data = 'a="b=' + encoded*n + ';"'
++                C = cookies.SimpleCookie()
++                C.load(data)
++                value = C['a'].value
++                self.assertEqual(value[:3], 'b=\\')
++                self.assertEqual(value[-2:], '\\;')
++                self.assertEqual(len(value), n + 3)
++
+     def test_load(self):
+         C = cookies.SimpleCookie()
+         C.load('Customer="WILE_E_COYOTE"; Version=1; Path=/acme')
+diff --git a/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst b/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst
+new file mode 100644
+index 0000000..6a23456
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst
+@@ -0,0 +1 @@
++Fix quadratic complexity in parsing ``"``-quoted cookie values with backslashes by :mod:`http.cookies`.
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-devtools/python/python3_3.12.4.bb
index e4c3fbb673..9199edce3d 100644
--- a/meta/recipes-devtools/python/python3_3.12.4.bb
+++ b/meta/recipes-devtools/python/python3_3.12.4.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
+           file://CVE-2024-7592.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.40.0


