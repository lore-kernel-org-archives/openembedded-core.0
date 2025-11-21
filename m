Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4371CFC264
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 11:27:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9452.1763724451257737162
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 03:27:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=ET3K64zY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3420bbd990=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL987ve603379
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 11:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=r3aCwu38Q1GQn/7yl93o
	3IxjYHMCuVB/JB10vt6/uSw=; b=ET3K64zYS0u88DrlOSZ7FEhUT31zJA0Hyz3+
	Glio9US1j1WaUOiTmsXh7x+/WVysf1jAM704byB9fkHpZ1jC0DCjUdeZkqqXovuj
	b61SpH2QT/tyFr0l9dAcq7SlvPSP7ew2qXM2lGu2gt+Rd5EtwgzSvzTbE6b6IwlG
	/yhKZ6JhspUrIQHRdnM0G9EDq4ug6xAj5Hrnay3hS+pf6ePuNjeDWFZAs0cZTi84
	RU1NEXh8rkT1mEbCGp9OhFAEqdE2Of8S9hha2lsTMYYzRPWw39GkzeWMExIrT+um
	Ggb+G0uS+473C5pMgYtEuPPd9JzfzkyAOooHhsUk+VCUraxo6Q==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ajehqgeem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 11:27:30 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 21 Nov 2025 03:27:28 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 21 Nov 2025 03:27:27 -0800
From: <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 1/1] python3: fix CVE-2025-6075
Date: Fri, 21 Nov 2025 16:57:23 +0530
Message-ID: <20251121112723.3379751-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NiBTYWx0ZWRfXx7mmDwuYio8l
 UySfyYsPpbYuDxnPaINunOQ5nNOLLGyAxckwb0YzS8bLXE7E2+ZVTu32L1AVn0JXCG32iCSeZVW
 YTakmEY1PtYE1Xrq1gEUZv7w9I57BFOxmTmEn+ceqTC6Ock7t4PEXgSw2EsGqF1B+CUGZ07vZT9
 2rbQnDlTK9ZmfbSbLAjVcpb10Ou54zdaiMZMobtX33qugmBW+K5UwfCs1gduvyinUolfbqo559B
 GedGQit5AIaOj4zzTP2UOZuxsr5umXI+2HGCUmxH34A+PotDa4MqKjWFxpQbntPcHTxNvlJ1eox
 rUPlOfqQXCjUJpY9JFRdbDwyjGcZLIrGtyvgQOpq44cKtyBuNzNNxuwaR+SUNgF5LhXG5eS+jC/
 UYZrlRunIeJQI+QKExMKEyr+Jp6+sQ==
X-Authority-Analysis: v=2.4 cv=EKQLElZC c=1 sm=1 tr=0 ts=69204ca2 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=8AHkEIZyAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=asWo_369AAAA:8 a=t09dciPa6Lqb90NMwrMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=YnP8LtLWTqQO9u8dPMSg:22
X-Proofpoint-ORIG-GUID: NbAQpBbQz2K6O_nZfIHhZRedOCUXtrLE
X-Proofpoint-GUID: NbAQpBbQz2K6O_nZfIHhZRedOCUXtrLE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210086
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AL987ve603379
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 11:27:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226671

From: Praveen Kumar <praveen.kumar@windriver.com>

If the value passed to os.path.expandvars() is user-controlled a
performance degradation is possible when expanding environment variables.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-6075

Upstream-patch:
https://github.com/python/cpython/commit/9ab89c026aa9611c4b0b67c288b8303a=
480fe742

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../python/python3/CVE-2025-6075.patch        | 355 ++++++++++++++++++
 .../python/python3_3.12.12.bb                 |   1 +
 2 files changed, 356 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-6075.pa=
tch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-6075.patch b/m=
eta/recipes-devtools/python/python3/CVE-2025-6075.patch
new file mode 100644
index 0000000000..346af4df94
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2025-6075.patch
@@ -0,0 +1,355 @@
+From 9ab89c026aa9611c4b0b67c288b8303a480fe742 Mon Sep 17 00:00:00 2001
+From: =C5=81ukasz Langa <lukasz@langa.pl>
+Date: Fri, 31 Oct 2025 17:58:09 +0100
+Subject: [PATCH] gh-136065: Fix quadratic complexity in os.path.expandva=
rs()
+ (GH-134952) (GH-140845)
+
+(cherry picked from commit f029e8db626ddc6e3a3beea4eff511a71aaceb5c)
+
+Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
+Co-authored-by: =C5=81ukasz Langa <lukasz@langa.pl>
+
+CVE: CVE-2025-6075
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/9ab8=
9c026aa9611c4b0b67c288b8303a480fe742]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ Lib/ntpath.py                                 | 126 ++++++------------
+ Lib/posixpath.py                              |  43 +++---
+ Lib/test/test_genericpath.py                  |  14 ++
+ Lib/test/test_ntpath.py                       |  18 ++-
+ ...-05-30-22-33-27.gh-issue-136065.bu337o.rst |   1 +
+ 5 files changed, 92 insertions(+), 110 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-iss=
ue-136065.bu337o.rst
+
+diff --git a/Lib/ntpath.py b/Lib/ntpath.py
+index 1bef630..393d358 100644
+--- a/Lib/ntpath.py
++++ b/Lib/ntpath.py
+@@ -409,17 +409,23 @@ def expanduser(path):
+ # XXX With COMMAND.COM you can use any characters in a variable name,
+ # XXX except '^|<>=3D'.
+
++_varpattern =3D r"'[^']*'?|%(%|[^%]*%?)|\$(\$|[-\w]+|\{[^}]*\}?)"
++_varsub =3D None
++_varsubb =3D None
++
+ def expandvars(path):
+     """Expand shell variables of the forms $var, ${var} and %var%.
+
+     Unknown variables are left unchanged."""
+     path =3D os.fspath(path)
++    global _varsub, _varsubb
+     if isinstance(path, bytes):
+         if b'$' not in path and b'%' not in path:
+             return path
+-        import string
+-        varchars =3D bytes(string.ascii_letters + string.digits + '_-',=
 'ascii')
+-        quote =3D b'\''
++        if not _varsubb:
++            import re
++            _varsubb =3D re.compile(_varpattern.encode(), re.ASCII).sub
++        sub =3D _varsubb
+         percent =3D b'%'
+         brace =3D b'{'
+         rbrace =3D b'}'
+@@ -428,94 +434,44 @@ def expandvars(path):
+     else:
+         if '$' not in path and '%' not in path:
+             return path
+-        import string
+-        varchars =3D string.ascii_letters + string.digits + '_-'
+-        quote =3D '\''
++        if not _varsub:
++            import re
++            _varsub =3D re.compile(_varpattern, re.ASCII).sub
++        sub =3D _varsub
+         percent =3D '%'
+         brace =3D '{'
+         rbrace =3D '}'
+         dollar =3D '$'
+         environ =3D os.environ
+-    res =3D path[:0]
+-    index =3D 0
+-    pathlen =3D len(path)
+-    while index < pathlen:
+-        c =3D path[index:index+1]
+-        if c =3D=3D quote:   # no expansion within single quotes
+-            path =3D path[index + 1:]
+-            pathlen =3D len(path)
+-            try:
+-                index =3D path.index(c)
+-                res +=3D c + path[:index + 1]
+-            except ValueError:
+-                res +=3D c + path
+-                index =3D pathlen - 1
+-        elif c =3D=3D percent:  # variable or '%'
+-            if path[index + 1:index + 2] =3D=3D percent:
+-                res +=3D c
+-                index +=3D 1
+-            else:
+-                path =3D path[index+1:]
+-                pathlen =3D len(path)
+-                try:
+-                    index =3D path.index(percent)
+-                except ValueError:
+-                    res +=3D percent + path
+-                    index =3D pathlen - 1
+-                else:
+-                    var =3D path[:index]
+-                    try:
+-                        if environ is None:
+-                            value =3D os.fsencode(os.environ[os.fsdecod=
e(var)])
+-                        else:
+-                            value =3D environ[var]
+-                    except KeyError:
+-                        value =3D percent + var + percent
+-                    res +=3D value
+-        elif c =3D=3D dollar:  # variable or '$$'
+-            if path[index + 1:index + 2] =3D=3D dollar:
+-                res +=3D c
+-                index +=3D 1
+-            elif path[index + 1:index + 2] =3D=3D brace:
+-                path =3D path[index+2:]
+-                pathlen =3D len(path)
+-                try:
+-                    index =3D path.index(rbrace)
+-                except ValueError:
+-                    res +=3D dollar + brace + path
+-                    index =3D pathlen - 1
+-                else:
+-                    var =3D path[:index]
+-                    try:
+-                        if environ is None:
+-                            value =3D os.fsencode(os.environ[os.fsdecod=
e(var)])
+-                        else:
+-                            value =3D environ[var]
+-                    except KeyError:
+-                        value =3D dollar + brace + var + rbrace
+-                    res +=3D value
+-            else:
+-                var =3D path[:0]
+-                index +=3D 1
+-                c =3D path[index:index + 1]
+-                while c and c in varchars:
+-                    var +=3D c
+-                    index +=3D 1
+-                    c =3D path[index:index + 1]
+-                try:
+-                    if environ is None:
+-                        value =3D os.fsencode(os.environ[os.fsdecode(va=
r)])
+-                    else:
+-                        value =3D environ[var]
+-                except KeyError:
+-                    value =3D dollar + var
+-                res +=3D value
+-                if c:
+-                    index -=3D 1
++
++    def repl(m):
++        lastindex =3D m.lastindex
++        if lastindex is None:
++            return m[0]
++        name =3D m[lastindex]
++        if lastindex =3D=3D 1:
++            if name =3D=3D percent:
++                return name
++            if not name.endswith(percent):
++                return m[0]
++            name =3D name[:-1]
+         else:
+-            res +=3D c
+-        index +=3D 1
+-    return res
++            if name =3D=3D dollar:
++                return name
++            if name.startswith(brace):
++                if not name.endswith(rbrace):
++                    return m[0]
++                name =3D name[1:-1]
++
++        try:
++            if environ is None:
++                return os.fsencode(os.environ[os.fsdecode(name)])
++            else:
++                return environ[name]
++        except KeyError:
++            return m[0]
++
++    return sub(repl, path)
+
+
+ # Normalize a path, e.g. A//B, A/./B and A/foo/../B all become A\B.
+diff --git a/Lib/posixpath.py b/Lib/posixpath.py
+index 90a6f54..6306f14 100644
+--- a/Lib/posixpath.py
++++ b/Lib/posixpath.py
+@@ -314,42 +314,41 @@ def expanduser(path):
+ # This expands the forms $variable and ${variable} only.
+ # Non-existent variables are left unchanged.
+
+-_varprog =3D None
+-_varprogb =3D None
++_varpattern =3D r'\$(\w+|\{[^}]*\}?)'
++_varsub =3D None
++_varsubb =3D None
+
+ def expandvars(path):
+     """Expand shell variables of form $var and ${var}.  Unknown variabl=
es
+     are left unchanged."""
+     path =3D os.fspath(path)
+-    global _varprog, _varprogb
++    global _varsub, _varsubb
+     if isinstance(path, bytes):
+         if b'$' not in path:
+             return path
+-        if not _varprogb:
++        if not _varsubb:
+             import re
+-            _varprogb =3D re.compile(br'\$(\w+|\{[^}]*\})', re.ASCII)
+-        search =3D _varprogb.search
++            _varsubb =3D re.compile(_varpattern.encode(), re.ASCII).sub
++        sub =3D _varsubb
+         start =3D b'{'
+         end =3D b'}'
+         environ =3D getattr(os, 'environb', None)
+     else:
+         if '$' not in path:
+             return path
+-        if not _varprog:
++        if not _varsub:
+             import re
+-            _varprog =3D re.compile(r'\$(\w+|\{[^}]*\})', re.ASCII)
+-        search =3D _varprog.search
++            _varsub =3D re.compile(_varpattern, re.ASCII).sub
++        sub =3D _varsub
+         start =3D '{'
+         end =3D '}'
+         environ =3D os.environ
+-    i =3D 0
+-    while True:
+-        m =3D search(path, i)
+-        if not m:
+-            break
+-        i, j =3D m.span(0)
+-        name =3D m.group(1)
+-        if name.startswith(start) and name.endswith(end):
++
++    def repl(m):
++        name =3D m[1]
++        if name.startswith(start):
++            if not name.endswith(end):
++                return m[0]
+             name =3D name[1:-1]
+         try:
+             if environ is None:
+@@ -357,13 +356,11 @@ def expandvars(path):
+             else:
+                 value =3D environ[name]
+         except KeyError:
+-            i =3D j
++            return m[0]
+         else:
+-            tail =3D path[j:]
+-            path =3D path[:i] + value
+-            i =3D len(path)
+-            path +=3D tail
+-    return path
++            return value
++
++    return sub(repl, path)
+
+
+ # Normalize a path, e.g. A//B, A/./B and A/foo/../B all become A/B.
+diff --git a/Lib/test/test_genericpath.py b/Lib/test/test_genericpath.py
+index 3eefb72..1cec587 100644
+--- a/Lib/test/test_genericpath.py
++++ b/Lib/test/test_genericpath.py
+@@ -7,6 +7,7 @@ import os
+ import sys
+ import unittest
+ import warnings
++from test import support
+ from test.support import is_emscripten
+ from test.support import os_helper
+ from test.support import warnings_helper
+@@ -443,6 +444,19 @@ class CommonTest(GenericTest):
+                   os.fsencode('$bar%s bar' % nonascii))
+             check(b'$spam}bar', os.fsencode('%s}bar' % nonascii))
+
++    @support.requires_resource('cpu')
++    def test_expandvars_large(self):
++        expandvars =3D self.pathmodule.expandvars
++        with os_helper.EnvironmentVarGuard() as env:
++            env.clear()
++            env["A"] =3D "B"
++            n =3D 100_000
++            self.assertEqual(expandvars('$A'*n), 'B'*n)
++            self.assertEqual(expandvars('${A}'*n), 'B'*n)
++            self.assertEqual(expandvars('$A!'*n), 'B!'*n)
++            self.assertEqual(expandvars('${A}A'*n), 'BA'*n)
++            self.assertEqual(expandvars('${'*10*n), '${'*10*n)
++
+     def test_abspath(self):
+         self.assertIn("foo", self.pathmodule.abspath("foo"))
+         with warnings.catch_warnings():
+diff --git a/Lib/test/test_ntpath.py b/Lib/test/test_ntpath.py
+index ced9dc4..f4d5063 100644
+--- a/Lib/test/test_ntpath.py
++++ b/Lib/test/test_ntpath.py
+@@ -7,6 +7,7 @@ import sys
+ import unittest
+ import warnings
+ from ntpath import ALLOW_MISSING
++from test import support
+ from test.support import cpython_only, os_helper
+ from test.support import TestFailed, is_emscripten
+ from test.support.os_helper import FakePath
+@@ -58,7 +59,7 @@ def tester(fn, wantResult):
+     fn =3D fn.replace("\\", "\\\\")
+     gotResult =3D eval(fn)
+     if wantResult !=3D gotResult and _norm(wantResult) !=3D _norm(gotRe=
sult):
+-        raise TestFailed("%s should return: %s but returned: %s" \
++        raise support.TestFailed("%s should return: %s but returned: %s=
" \
+               %(str(fn), str(wantResult), str(gotResult)))
+
+     # then with bytes
+@@ -74,7 +75,7 @@ def tester(fn, wantResult):
+         warnings.simplefilter("ignore", DeprecationWarning)
+         gotResult =3D eval(fn)
+     if _norm(wantResult) !=3D _norm(gotResult):
+-        raise TestFailed("%s should return: %s but returned: %s" \
++        raise support.TestFailed("%s should return: %s but returned: %s=
" \
+               %(str(fn), str(wantResult), repr(gotResult)))
+
+
+@@ -882,6 +883,19 @@ class TestNtpath(NtpathTestCase):
+             check('%spam%bar', '%sbar' % nonascii)
+             check('%{}%bar'.format(nonascii), 'ham%sbar' % nonascii)
+
++    @support.requires_resource('cpu')
++    def test_expandvars_large(self):
++        expandvars =3D ntpath.expandvars
++        with os_helper.EnvironmentVarGuard() as env:
++            env.clear()
++            env["A"] =3D "B"
++            n =3D 100_000
++            self.assertEqual(expandvars('%A%'*n), 'B'*n)
++            self.assertEqual(expandvars('%A%A'*n), 'BA'*n)
++            self.assertEqual(expandvars("''"*n + '%%'), "''"*n + '%')
++            self.assertEqual(expandvars("%%"*n), "%"*n)
++            self.assertEqual(expandvars("$$"*n), "$"*n)
++
+     def test_expanduser(self):
+         tester('ntpath.expanduser("test")', 'test')
+
+diff --git a/Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-issue-1360=
65.bu337o.rst b/Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-issue-13=
6065.bu337o.rst
+new file mode 100644
+index 0000000..1d152bb
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-issue-136065.bu33=
7o.rst
+@@ -0,0 +1 @@
++Fix quadratic complexity in :func:`os.path.expandvars`.
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3_3.12.12.bb b/meta/recip=
es-devtools/python/python3_3.12.12.bb
index 9a957c59bc..b70f434ca9 100644
--- a/meta/recipes-devtools/python/python3_3.12.12.bb
+++ b/meta/recipes-devtools/python/python3_3.12.12.bb
@@ -34,6 +34,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
+           file://CVE-2025-6075.patch \
            "
=20
 SRC_URI:append:class-native =3D " \
--=20
2.40.0


