Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A95DD0EE31
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 20:55:10 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4190.1764104108646535829
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 12:55:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xwh4Zais;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-343dd5aa6e7so6298613a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 12:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764104108; x=1764708908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xsMZjKeiNsCRXo3Hz/LPzZTKDN9y+cEfGW3mTYn3uIw=;
        b=xwh4ZaiseFR3A0vtF0vdOd7/ffQ/1uBZhCA0e4yLUxfIxA3SVAyCVgzAlLXGkzK/Di
         FfmICV6AbSht4KeVK4lnW9FEPfGYzIgenyl9TqJ46Cp0ZvwKKqhCyhdYO7s6LbHExX+9
         ob7O388POVz8AJitiFwYJFdHp56f3p4Sy8HiPyFLMSaxEUsdRpVIw5fpp8yPO47uwTxM
         RVJ1iQUdP/AAW4FhrrHcvpQ1hZXxCndu8sx/Rtg/O+Fr4S/qxRlefK9CZkT2ALIjbfcH
         wrakk5sFqBrwULljwdJtjC6lrb4IosUC4Gtn+I8tU7R0ySFgquBdqFZ7bkBoZfeqqeSt
         zlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764104108; x=1764708908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xsMZjKeiNsCRXo3Hz/LPzZTKDN9y+cEfGW3mTYn3uIw=;
        b=eYHgRhf87ugK6CySr25jj18OSJ7q6LiPnynXyoX0I+u6P93DM16arD6d5NSyGYcbXg
         69fFs5By46C745bimnVxIOtpDFKD/gM1uySy5mfuCqceDFoR6a7rOM4XKjoEQVTQ1r16
         Lak4R3T77+okrR3iUYFOpAty2TLNZb53ivjbzpoaA2HQ5jKG+RVYFdEY28pz+OUvUy0y
         vnfpkpSmnxCe9aCSN/WbPC8A/GjG0rE3osEiEhEjEWC6g5qt/RvNVwP1vAGj7Tu3jNBo
         r7S1IiSYBmcSxV6wqGXUqRNW0g37x80VJsiIGfsejGySdaMjYtr3pZgx6aP/c2Tiu2ym
         28SQ==
X-Gm-Message-State: AOJu0Yx9gp9LGrsMCWrpHUb0NK/uRI89MJ81u/7QHx65WHk+f1+KiuWQ
	yF/zrZ3b3+5xixGtNgDRTdATmJDdae109maaVhvSzmc7UbGmHK51i8fj8CHDVm6lCydJC+qfSHL
	u6fKz
X-Gm-Gg: ASbGncvPn6967bVRJQcKA5KLKoVfdseGkIQZxcfwA67m3R5W2sYo+O7VCAakrtvHDKd
	sEaD1kwO5rBsKq/4YZEg4Svj6ajcsSPLiCEK0dw04oWjBk43CuWcoGKIgNmZJvKybjzgnB33CFn
	bp1vdezbs7PQlYJsphpa+K5RB0JE2yaG0mfRrw0VaKPOg37m5gNnmLHhkQVRqaizXav69BLz3p0
	WuhtiY3NzUi+q1cQ8nO5UBwGcyugrsykBxLPY/XoDXW0ZQKB/o0wUBHhjA1w0rE8DFmimzAA+3t
	AzdFzRsGmgRFyJ7PtZLDfvanP3OCiNZZ8o48OnSTZPuGy67Nr2rTXOV5awveixko/5jJY/Qrvis
	/HhgunjiKMzPonXPIfduoVz7JcozX50RZ4USKFhdzaQutAAyfEAJB/zc9rtE0v4P/DqZHP/+OSa
	hU4Q==
X-Google-Smtp-Source: AGHT+IF8DlrUlzn5TC9Nnz1HEkrU5kj0PqBm6cxSToqOZbtO5RIhsJpWjwmyJiNfLuFGH217U6gZKg==
X-Received: by 2002:a17:90b:3890:b0:330:a228:d2c with SMTP id 98e67ed59e1d1-34733e6ce5bmr17578343a91.15.1764104107658;
        Tue, 25 Nov 2025 12:55:07 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a5a3099sm322602a91.11.2025.11.25.12.55.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:55:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/9] python3: fix CVE-2025-6075
Date: Tue, 25 Nov 2025 12:54:48 -0800
Message-ID: <9a7f33d85355ffbe382aa175c04c64541e77b441.1764103986.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764103986.git.steve@sakoman.com>
References: <cover.1764103986.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 20:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226780

From: Praveen Kumar <praveen.kumar@windriver.com>

If the value passed to os.path.expandvars() is user-controlled a
performance degradation is possible when expanding environment variables.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-6075

Upstream-patch:
https://github.com/python/cpython/commit/892747b4cf0f95ba8beb51c0d0658bfaa381ebca

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/CVE-2025-6075.patch        | 364 ++++++++++++++++++
 .../python/python3_3.10.19.bb                 |   1 +
 2 files changed, 365 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-6075.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-6075.patch b/meta/recipes-devtools/python/python3/CVE-2025-6075.patch
new file mode 100644
index 0000000000..eab5a882a0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2025-6075.patch
@@ -0,0 +1,364 @@
+From 892747b4cf0f95ba8beb51c0d0658bfaa381ebca Mon Sep 17 00:00:00 2001
+From: Łukasz Langa <lukasz@langa.pl>
+Date: Fri, 31 Oct 2025 17:51:32 +0100
+Subject: [PATCH] gh-136065: Fix quadratic complexity in os.path.expandvars()
+ (GH-134952) (GH-140851)
+
+(cherry picked from commit f029e8db626ddc6e3a3beea4eff511a71aaceb5c)
+
+Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
+
+CVE: CVE-2025-6075
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/892747b4cf0f95ba8beb51c0d0658bfaa381ebca]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ Lib/ntpath.py                                 | 126 ++++++------------
+ Lib/posixpath.py                              |  43 +++---
+ Lib/test/test_genericpath.py                  |  14 ++
+ Lib/test/test_ntpath.py                       |  20 ++-
+ ...-05-30-22-33-27.gh-issue-136065.bu337o.rst |   1 +
+ 5 files changed, 93 insertions(+), 111 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-issue-136065.bu337o.rst
+
+diff --git a/Lib/ntpath.py b/Lib/ntpath.py
+index 9b0cca4..bd2b4e2 100644
+--- a/Lib/ntpath.py
++++ b/Lib/ntpath.py
+@@ -374,17 +374,23 @@ def expanduser(path):
+ # XXX With COMMAND.COM you can use any characters in a variable name,
+ # XXX except '^|<>='.
+
++_varpattern = r"'[^']*'?|%(%|[^%]*%?)|\$(\$|[-\w]+|\{[^}]*\}?)"
++_varsub = None
++_varsubb = None
++
+ def expandvars(path):
+     """Expand shell variables of the forms $var, ${var} and %var%.
+
+     Unknown variables are left unchanged."""
+     path = os.fspath(path)
++    global _varsub, _varsubb
+     if isinstance(path, bytes):
+         if b'$' not in path and b'%' not in path:
+             return path
+-        import string
+-        varchars = bytes(string.ascii_letters + string.digits + '_-', 'ascii')
+-        quote = b'\''
++        if not _varsubb:
++            import re
++            _varsubb = re.compile(_varpattern.encode(), re.ASCII).sub
++        sub = _varsubb
+         percent = b'%'
+         brace = b'{'
+         rbrace = b'}'
+@@ -393,94 +399,44 @@ def expandvars(path):
+     else:
+         if '$' not in path and '%' not in path:
+             return path
+-        import string
+-        varchars = string.ascii_letters + string.digits + '_-'
+-        quote = '\''
++        if not _varsub:
++            import re
++            _varsub = re.compile(_varpattern, re.ASCII).sub
++        sub = _varsub
+         percent = '%'
+         brace = '{'
+         rbrace = '}'
+         dollar = '$'
+         environ = os.environ
+-    res = path[:0]
+-    index = 0
+-    pathlen = len(path)
+-    while index < pathlen:
+-        c = path[index:index+1]
+-        if c == quote:   # no expansion within single quotes
+-            path = path[index + 1:]
+-            pathlen = len(path)
+-            try:
+-                index = path.index(c)
+-                res += c + path[:index + 1]
+-            except ValueError:
+-                res += c + path
+-                index = pathlen - 1
+-        elif c == percent:  # variable or '%'
+-            if path[index + 1:index + 2] == percent:
+-                res += c
+-                index += 1
+-            else:
+-                path = path[index+1:]
+-                pathlen = len(path)
+-                try:
+-                    index = path.index(percent)
+-                except ValueError:
+-                    res += percent + path
+-                    index = pathlen - 1
+-                else:
+-                    var = path[:index]
+-                    try:
+-                        if environ is None:
+-                            value = os.fsencode(os.environ[os.fsdecode(var)])
+-                        else:
+-                            value = environ[var]
+-                    except KeyError:
+-                        value = percent + var + percent
+-                    res += value
+-        elif c == dollar:  # variable or '$$'
+-            if path[index + 1:index + 2] == dollar:
+-                res += c
+-                index += 1
+-            elif path[index + 1:index + 2] == brace:
+-                path = path[index+2:]
+-                pathlen = len(path)
+-                try:
+-                    index = path.index(rbrace)
+-                except ValueError:
+-                    res += dollar + brace + path
+-                    index = pathlen - 1
+-                else:
+-                    var = path[:index]
+-                    try:
+-                        if environ is None:
+-                            value = os.fsencode(os.environ[os.fsdecode(var)])
+-                        else:
+-                            value = environ[var]
+-                    except KeyError:
+-                        value = dollar + brace + var + rbrace
+-                    res += value
+-            else:
+-                var = path[:0]
+-                index += 1
+-                c = path[index:index + 1]
+-                while c and c in varchars:
+-                    var += c
+-                    index += 1
+-                    c = path[index:index + 1]
+-                try:
+-                    if environ is None:
+-                        value = os.fsencode(os.environ[os.fsdecode(var)])
+-                    else:
+-                        value = environ[var]
+-                except KeyError:
+-                    value = dollar + var
+-                res += value
+-                if c:
+-                    index -= 1
++
++    def repl(m):
++        lastindex = m.lastindex
++        if lastindex is None:
++            return m[0]
++        name = m[lastindex]
++        if lastindex == 1:
++            if name == percent:
++                return name
++            if not name.endswith(percent):
++                return m[0]
++            name = name[:-1]
+         else:
+-            res += c
+-        index += 1
+-    return res
++            if name == dollar:
++                return name
++            if name.startswith(brace):
++                if not name.endswith(rbrace):
++                    return m[0]
++                name = name[1:-1]
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
+index b8dd563..75020ee 100644
+--- a/Lib/posixpath.py
++++ b/Lib/posixpath.py
+@@ -279,42 +279,41 @@ def expanduser(path):
+ # This expands the forms $variable and ${variable} only.
+ # Non-existent variables are left unchanged.
+
+-_varprog = None
+-_varprogb = None
++_varpattern = r'\$(\w+|\{[^}]*\}?)'
++_varsub = None
++_varsubb = None
+
+ def expandvars(path):
+     """Expand shell variables of form $var and ${var}.  Unknown variables
+     are left unchanged."""
+     path = os.fspath(path)
+-    global _varprog, _varprogb
++    global _varsub, _varsubb
+     if isinstance(path, bytes):
+         if b'$' not in path:
+             return path
+-        if not _varprogb:
++        if not _varsubb:
+             import re
+-            _varprogb = re.compile(br'\$(\w+|\{[^}]*\})', re.ASCII)
+-        search = _varprogb.search
++            _varsubb = re.compile(_varpattern.encode(), re.ASCII).sub
++        sub = _varsubb
+         start = b'{'
+         end = b'}'
+         environ = getattr(os, 'environb', None)
+     else:
+         if '$' not in path:
+             return path
+-        if not _varprog:
++        if not _varsub:
+             import re
+-            _varprog = re.compile(r'\$(\w+|\{[^}]*\})', re.ASCII)
+-        search = _varprog.search
++            _varsub = re.compile(_varpattern, re.ASCII).sub
++        sub = _varsub
+         start = '{'
+         end = '}'
+         environ = os.environ
+-    i = 0
+-    while True:
+-        m = search(path, i)
+-        if not m:
+-            break
+-        i, j = m.span(0)
+-        name = m.group(1)
+-        if name.startswith(start) and name.endswith(end):
++
++    def repl(m):
++        name = m[1]
++        if name.startswith(start):
++            if not name.endswith(end):
++                return m[0]
+             name = name[1:-1]
+         try:
+             if environ is None:
+@@ -322,13 +321,11 @@ def expandvars(path):
+             else:
+                 value = environ[name]
+         except KeyError:
+-            i = j
++            return m[0]
+         else:
+-            tail = path[j:]
+-            path = path[:i] + value
+-            i = len(path)
+-            path += tail
+-    return path
++            return value
++
++    return sub(repl, path)
+
+
+ # Normalize a path, e.g. A//B, A/./B and A/foo/../B all become A/B.
+diff --git a/Lib/test/test_genericpath.py b/Lib/test/test_genericpath.py
+index 1ff7f75..b0a1326 100644
+--- a/Lib/test/test_genericpath.py
++++ b/Lib/test/test_genericpath.py
+@@ -7,6 +7,7 @@ import os
+ import sys
+ import unittest
+ import warnings
++from test import support
+ from test.support import os_helper
+ from test.support import warnings_helper
+ from test.support.script_helper import assert_python_ok
+@@ -430,6 +431,19 @@ class CommonTest(GenericTest):
+                   os.fsencode('$bar%s bar' % nonascii))
+             check(b'$spam}bar', os.fsencode('%s}bar' % nonascii))
+
++    @support.requires_resource('cpu')
++    def test_expandvars_large(self):
++        expandvars = self.pathmodule.expandvars
++        with os_helper.EnvironmentVarGuard() as env:
++            env.clear()
++            env["A"] = "B"
++            n = 100_000
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
+index f790f77..161e57d 100644
+--- a/Lib/test/test_ntpath.py
++++ b/Lib/test/test_ntpath.py
+@@ -5,8 +5,8 @@ import sys
+ import unittest
+ import warnings
+ from ntpath import ALLOW_MISSING
++from test import support
+ from test.support import os_helper
+-from test.support import TestFailed
+ from test.support.os_helper import FakePath
+ from test import test_genericpath
+ from tempfile import TemporaryFile
+@@ -56,7 +56,7 @@ def tester(fn, wantResult):
+     fn = fn.replace("\\", "\\\\")
+     gotResult = eval(fn)
+     if wantResult != gotResult and _norm(wantResult) != _norm(gotResult):
+-        raise TestFailed("%s should return: %s but returned: %s" \
++        raise support.TestFailed("%s should return: %s but returned: %s" \
+               %(str(fn), str(wantResult), str(gotResult)))
+
+     # then with bytes
+@@ -72,7 +72,7 @@ def tester(fn, wantResult):
+         warnings.simplefilter("ignore", DeprecationWarning)
+         gotResult = eval(fn)
+     if _norm(wantResult) != _norm(gotResult):
+-        raise TestFailed("%s should return: %s but returned: %s" \
++        raise support.TestFailed("%s should return: %s but returned: %s" \
+               %(str(fn), str(wantResult), repr(gotResult)))
+
+
+@@ -689,6 +689,19 @@ class TestNtpath(NtpathTestCase):
+             check('%spam%bar', '%sbar' % nonascii)
+             check('%{}%bar'.format(nonascii), 'ham%sbar' % nonascii)
+
++    @support.requires_resource('cpu')
++    def test_expandvars_large(self):
++        expandvars = ntpath.expandvars
++        with os_helper.EnvironmentVarGuard() as env:
++            env.clear()
++            env["A"] = "B"
++            n = 100_000
++            self.assertEqual(expandvars('%A%'*n), 'B'*n)
++            self.assertEqual(expandvars('%A%A'*n), 'BA'*n)
++            self.assertEqual(expandvars("''"*n + '%%'), "''"*n + '%')
++            self.assertEqual(expandvars("%%"*n), "%"*n)
++            self.assertEqual(expandvars("$$"*n), "$"*n)
++
+     def test_expanduser(self):
+         tester('ntpath.expanduser("test")', 'test')
+
+@@ -923,6 +936,7 @@ class TestNtpath(NtpathTestCase):
+             self.assertIsInstance(b_final_path, bytes)
+             self.assertGreater(len(b_final_path), 0)
+
++
+ class NtCommonTest(test_genericpath.CommonTest, unittest.TestCase):
+     pathmodule = ntpath
+     attributes = ['relpath']
+diff --git a/Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-issue-136065.bu337o.rst b/Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-issue-136065.bu337o.rst
+new file mode 100644
+index 0000000..1d152bb
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-issue-136065.bu337o.rst
+@@ -0,0 +1 @@
++Fix quadratic complexity in :func:`os.path.expandvars`.
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3_3.10.19.bb b/meta/recipes-devtools/python/python3_3.10.19.bb
index 8680c13893..6f23d258c1 100644
--- a/meta/recipes-devtools/python/python3_3.10.19.bb
+++ b/meta/recipes-devtools/python/python3_3.10.19.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
+           file://CVE-2025-6075.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.43.0


