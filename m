Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E13D1267A
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 22:19:52 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.937.1764713987761393959
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 14:19:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=He5iQDlV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29568d93e87so61988725ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 14:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764713987; x=1765318787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gR0AQeQ7JZ0GF2uUTdEqKNahqE56J9Kp5zUFk9jXDfw=;
        b=He5iQDlVRBIXu3dH80bjT0Xf4hf6IGAk3Phsq1d5H40by18CnPPblUdfXI2wj4/PnL
         OSa0TU1n6MNkOACkiqHdlOiPGJK1GXKHmQbUAPkOSZvi9vvdBykMwpnYAG5c7pLNlFAJ
         oktM6h9li8/fZLrxr9Jmb0mkXTKx71IvuGl7PWzz9lSfYyi3z+aeHNF9LPX6JxergQpx
         uTSWFBl63BZEpw7d+YNGp3vFHQt4bKqNu0rcBtn+CDhbckmsyWsBVtgM5KMy5R59mNSm
         BTTuLZet1Gezw1YcHEnjOsVmmlsu7SAOu1JKH6xnZ2kFXUItCpBwu6U55gxW2s9lf6dg
         dB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764713987; x=1765318787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gR0AQeQ7JZ0GF2uUTdEqKNahqE56J9Kp5zUFk9jXDfw=;
        b=DhEl8iVRZ8Tk7uRzs4wl/tIkPMBGsZDmB7km1nUXexFu04j9+xBqCWruyEHGCpjk+V
         1KQ/GJZIE41pnNhmBCkvA3eGADSCO7dqmFFx1MeyL2Q7oWMmqx/l1kG7cJtrKzltezcK
         4vHMmqno9ZQAcYM4A2bN5zxyDJEp7XVjcERGvNH1lfS2PlNXIjzxuip7FjX5S3hDwfd/
         kdhZSChHdm5HOG7pMucq70bKC0YHLPM7EAlN5RBegjAl9Y1NO97ULmSZO+hM1tV3snEr
         jAuUq/vocxS92GbYOj0c33kFpnboHEiU2D2UJl157KHclWotAZRXOMEMP59kzW/VOgeh
         GIxQ==
X-Gm-Message-State: AOJu0YwzLYJVd2Ay6ICWimi4Z9ejG0/SnoxHkNpUCMzAzsTjv56LpZ1T
	ApgGUAftWudwg3LB6V39AMNR2HJcofy5ZD06L1paYOPcQ1BhQdw6ix7B5Ou299vkZObNJBpmp1L
	ch9rH
X-Gm-Gg: ASbGncsdbQDq8YA34lQCjOZLQ0M+izvTzgezk8XHC6UYtYn/Vp1AUZjIR0DJjRnHRBp
	WciiyTRBm+Dgmgn+1VRq3W2ZnzcyAvJjMGr9PRPTL7H72aMFmE3yL4Lj33ghWRCwi+SbuNh0heB
	J8OvVZNzZnZR7UhYxDfIWPHafYGnLTtWOutAhsFz7s4iZIT+SJGDiWR0YLI6SWTLf2rtR+/A7PA
	xDDOC45thXyGeb5HMWtR5GJRrmmnSOYcXaRpIzQUMBo293gOZTHoewazssrrT3IaTaOGJF3Vw96
	XsQlXDpdPX71Q4klY4x/kZ05Y+7OhtKRxkfHC+BdN06LtHV+J2pxKFYmSV04FI9p1lL8XSqQOGz
	qCooeBGTXXQD99+SOXKeKiMwnqnH8Adnx/FkxMVeQ+opXv21Z/7w53+d+QV/RBVO9ApQHFIDYTU
	BndA==
X-Google-Smtp-Source: AGHT+IEfwwsbwtRjLXB++1i1JrDxz/RO/HE1XGuRawOF0FTrGjZoj4RevcBYvoSEm0zWq6RSn7o2Pg==
X-Received: by 2002:a17:902:e787:b0:295:6427:87d4 with SMTP id d9443c01a7336-29d68489191mr963935ad.50.1764713986855;
        Tue, 02 Dec 2025 14:19:46 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:b8d9:92cd:3fd4:9b7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40acc7sm163700565ad.2.2025.12.02.14.19.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 14:19:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/8] python3: fix CVE-2025-6075
Date: Tue,  2 Dec 2025 14:19:25 -0800
Message-ID: <82c0e311ba99e2575e8a8c5cd91896f001696e0d.1764713862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764713862.git.steve@sakoman.com>
References: <cover.1764713862.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 22:19:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227189

From: Praveen Kumar <praveen.kumar@windriver.com>

If the value passed to os.path.expandvars() is user-controlled a
performance degradation is possible when expanding environment variables.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-6075

Upstream-patch:
https://github.com/python/cpython/commit/9ab89c026aa9611c4b0b67c288b8303a480fe742

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/CVE-2025-6075.patch        | 355 ++++++++++++++++++
 .../python/python3_3.12.12.bb                 |   1 +
 2 files changed, 356 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-6075.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-6075.patch b/meta/recipes-devtools/python/python3/CVE-2025-6075.patch
new file mode 100644
index 0000000000..346af4df94
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2025-6075.patch
@@ -0,0 +1,355 @@
+From 9ab89c026aa9611c4b0b67c288b8303a480fe742 Mon Sep 17 00:00:00 2001
+From: Łukasz Langa <lukasz@langa.pl>
+Date: Fri, 31 Oct 2025 17:58:09 +0100
+Subject: [PATCH] gh-136065: Fix quadratic complexity in os.path.expandvars()
+ (GH-134952) (GH-140845)
+
+(cherry picked from commit f029e8db626ddc6e3a3beea4eff511a71aaceb5c)
+
+Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
+Co-authored-by: Łukasz Langa <lukasz@langa.pl>
+
+CVE: CVE-2025-6075
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/9ab89c026aa9611c4b0b67c288b8303a480fe742]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ Lib/ntpath.py                                 | 126 ++++++------------
+ Lib/posixpath.py                              |  43 +++---
+ Lib/test/test_genericpath.py                  |  14 ++
+ Lib/test/test_ntpath.py                       |  18 ++-
+ ...-05-30-22-33-27.gh-issue-136065.bu337o.rst |   1 +
+ 5 files changed, 92 insertions(+), 110 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-issue-136065.bu337o.rst
+
+diff --git a/Lib/ntpath.py b/Lib/ntpath.py
+index 1bef630..393d358 100644
+--- a/Lib/ntpath.py
++++ b/Lib/ntpath.py
+@@ -409,17 +409,23 @@ def expanduser(path):
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
+@@ -428,94 +434,44 @@ def expandvars(path):
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
+index 90a6f54..6306f14 100644
+--- a/Lib/posixpath.py
++++ b/Lib/posixpath.py
+@@ -314,42 +314,41 @@ def expanduser(path):
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
+@@ -357,13 +356,11 @@ def expandvars(path):
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
+     fn = fn.replace("\\", "\\\\")
+     gotResult = eval(fn)
+     if wantResult != gotResult and _norm(wantResult) != _norm(gotResult):
+-        raise TestFailed("%s should return: %s but returned: %s" \
++        raise support.TestFailed("%s should return: %s but returned: %s" \
+               %(str(fn), str(wantResult), str(gotResult)))
+
+     # then with bytes
+@@ -74,7 +75,7 @@ def tester(fn, wantResult):
+         warnings.simplefilter("ignore", DeprecationWarning)
+         gotResult = eval(fn)
+     if _norm(wantResult) != _norm(gotResult):
+-        raise TestFailed("%s should return: %s but returned: %s" \
++        raise support.TestFailed("%s should return: %s but returned: %s" \
+               %(str(fn), str(wantResult), repr(gotResult)))
+
+
+@@ -882,6 +883,19 @@ class TestNtpath(NtpathTestCase):
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
+diff --git a/Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-issue-136065.bu337o.rst b/Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-issue-136065.bu337o.rst
+new file mode 100644
+index 0000000..1d152bb
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-issue-136065.bu337o.rst
+@@ -0,0 +1 @@
++Fix quadratic complexity in :func:`os.path.expandvars`.
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3_3.12.12.bb b/meta/recipes-devtools/python/python3_3.12.12.bb
index 9a957c59bc..b70f434ca9 100644
--- a/meta/recipes-devtools/python/python3_3.12.12.bb
+++ b/meta/recipes-devtools/python/python3_3.12.12.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
+           file://CVE-2025-6075.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.43.0


