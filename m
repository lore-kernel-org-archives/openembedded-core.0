Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A05C5320E
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 15:17:23 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.33244.1724599042410945286
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Aug 2024 08:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UiFUEZPx;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2705d31a35cso3215665fac.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 08:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724599041; x=1725203841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wRiOAxKOoZefTH57keBh4gnqKfuAmgHtDacAprbcP/k=;
        b=UiFUEZPxjhLoLDO+zr9qVkb1FzSKwB21ZUYUoKzoEynBpgGgw+J7ZZurGNCdBnpA/s
         Fy4qqEyHdjow94uOkX1LoFw+XXi930dMxBC5P7h7ST4BcTPjAvz7g+ft/ajJbHmU2gtt
         K+8qFn29cgFjHWg7U0Y024JxiA8DEHBE39dEk4onJf+Pm9sCHfXZWlTu0tESbH0DeYze
         5lQ8vFGL/q8IIn21hrTCpb7EgJURrq3YCUbJuKmXuS5JcFlB0UebpII3PX3YW335DXio
         Tb0DFp1jfuGMRcUpEHB58Nkr5MgjCQvV932wndYg+Ys+FnV6nRtnMAXafcdnVimXa1xw
         3EfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724599041; x=1725203841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRiOAxKOoZefTH57keBh4gnqKfuAmgHtDacAprbcP/k=;
        b=iCAoPJj5d25Ya3qRBMLTb4LFXyFFYRUBTcputY3bpzW3QTOfVNqtDKPP0JK62340lw
         sjKz5Add1hPT7kycuIc/li+0lfR/KvPSxabgg1WCiE0cWv+Qvczc6S0geOV6kLyKyn4h
         Uwm0V56lxIgk1Ol+3q97D3vEB7rSIuH57qdxqMcrYr9XV8EU1Ff27bzXgZWOlo8uCnuB
         rRepeIvuFrshJkRrbUpaqSbwLrsCUZ+3eoIiZpmGMfDBFEelf7fmpQ4vtzYnj58EuhZY
         k4EY7bIcbNCCcHjk+cuhEM69h83egM4vTYabyQPyUq2aENhcGKalxxYdXLfUGePPnrZg
         36Tw==
X-Gm-Message-State: AOJu0Yx92T2DbgwD4Djii/8C9jmC0izYXGu/uk+a/LNv28MM21dvj4TZ
	eght51AOfd58m/sMRm7u5ITl0iqC/8hTQPrrZ6C6CQxe74+TlIu0BcMiYw==
X-Google-Smtp-Source: AGHT+IGiGU10SbFRAI7Tu/kK1e4vExwnFiIzGpALbvFCeO/uqTEZj3x1Nk9S/41jD5uV+zi1iqbSzA==
X-Received: by 2002:a05:6870:5488:b0:261:2072:7b5d with SMTP id 586e51a60fabf-273e6545a88mr8884203fac.29.1724599041145;
        Sun, 25 Aug 2024 08:17:21 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::77e7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad6e2ccsm5397839a12.79.2024.08.25.08.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 08:17:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python: Backport fixes for CVE-2024-7592
Date: Sun, 25 Aug 2024 08:17:18 -0700
Message-ID: <20240825151718.2174240-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 15:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203721

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3/CVE-2024-7592.patch        | 231 ++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.5.bb |   1 +
 2 files changed, 232 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2024-7592.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2024-7592.patch b/meta/recipes-devtools/python/python3/CVE-2024-7592.patch
new file mode 100644
index 00000000000..7fd74abed37
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2024-7592.patch
@@ -0,0 +1,231 @@
+From 04ac47b343b10f2182c4b3730d4be241b2397a4d Mon Sep 17 00:00:00 2001
+From: Serhiy Storchaka <storchaka@gmail.com>
+Date: Fri, 16 Aug 2024 19:13:37 +0300
+Subject: [PATCH 1/4] gh-123067: Fix quadratic complexity in parsing cookies
+ with backslashes
+
+This fixes CVE-2024-7592.
+
+CVE: CVE-2024-7592
+Upstream-Status: Backport [https://github.com/python/cpython/pull/123075]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ Lib/http/cookies.py                           | 34 ++++-------------
+ Lib/test/test_http_cookies.py                 | 38 +++++++++++++++++++
+ ...-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst |  1 +
+ 3 files changed, 47 insertions(+), 26 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst
+
+diff --git a/Lib/http/cookies.py b/Lib/http/cookies.py
+index 351faf428a20cd..11a67e8a2e008b 100644
+--- a/Lib/http/cookies.py
++++ b/Lib/http/cookies.py
+@@ -184,8 +184,12 @@ def _quote(str):
+         return '"' + str.translate(_Translator) + '"'
+ 
+ 
+-_OctalPatt = re.compile(r"\\[0-3][0-7][0-7]")
+-_QuotePatt = re.compile(r"[\\].")
++_unquote_re = re.compile(r'\\(?:([0-3][0-7][0-7])|(["\\]))')
++def _unquote_replace(m):
++    if m[1]:
++        return chr(int(m[1], 8))
++    else:
++        return m[2]
+ 
+ def _unquote(str):
+     # If there aren't any doublequotes,
+@@ -205,30 +209,8 @@ def _unquote(str):
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
++
++    return _unquote_re.sub(_unquote_replace, str)
+ 
+ # The _getdate() routine is used to set the expiration time in the cookie's HTTP
+ # header.  By default, _getdate() returns the current time in the appropriate
+diff --git a/Lib/test/test_http_cookies.py b/Lib/test/test_http_cookies.py
+index 925c8697f60de6..13b526d49b0856 100644
+--- a/Lib/test/test_http_cookies.py
++++ b/Lib/test/test_http_cookies.py
+@@ -5,6 +5,7 @@
+ import doctest
+ from http import cookies
+ import pickle
++from test import support
+ 
+ 
+ class CookieTests(unittest.TestCase):
+@@ -58,6 +59,43 @@ def test_basic(self):
+             for k, v in sorted(case['dict'].items()):
+                 self.assertEqual(C[k].value, v)
+ 
++    def test_unquote(self):
++        cases = [
++            (r'a="b=\""', 'b="'),
++            (r'a="b=\\"', 'b=\\'),
++            (r'a="b=\="', 'b=\\='),
++            (r'a="b=\n"', 'b=\\n'),
++            (r'a="b=\042"', 'b="'),
++            (r'a="b=\134"', 'b=\\'),
++            (r'a="b=\377"', 'b=\xff'),
++            (r'a="b=\400"', 'b=\\400'),
++            (r'a="b=\42"', 'b=\\42'),
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
+index 00000000000000..158b938a65a2d4
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst
+@@ -0,0 +1 @@
++Fix quadratic complexity in parsing cookies with backslashes.
+
+From ab87c992c2d4cd28560178048915bc9636d6566e Mon Sep 17 00:00:00 2001
+From: Serhiy Storchaka <storchaka@gmail.com>
+Date: Fri, 16 Aug 2024 19:38:20 +0300
+Subject: [PATCH 2/4] Restore the current behavior for backslash-escaping.
+
+---
+ Lib/http/cookies.py           | 2 +-
+ Lib/test/test_http_cookies.py | 8 ++++----
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/Lib/http/cookies.py b/Lib/http/cookies.py
+index 11a67e8a2e008b..464abeb0fb253a 100644
+--- a/Lib/http/cookies.py
++++ b/Lib/http/cookies.py
+@@ -184,7 +184,7 @@ def _quote(str):
+         return '"' + str.translate(_Translator) + '"'
+ 
+ 
+-_unquote_re = re.compile(r'\\(?:([0-3][0-7][0-7])|(["\\]))')
++_unquote_re = re.compile(r'\\(?:([0-3][0-7][0-7])|(.))')
+ def _unquote_replace(m):
+     if m[1]:
+         return chr(int(m[1], 8))
+diff --git a/Lib/test/test_http_cookies.py b/Lib/test/test_http_cookies.py
+index 13b526d49b0856..8879902a6e2f41 100644
+--- a/Lib/test/test_http_cookies.py
++++ b/Lib/test/test_http_cookies.py
+@@ -63,13 +63,13 @@ def test_unquote(self):
+         cases = [
+             (r'a="b=\""', 'b="'),
+             (r'a="b=\\"', 'b=\\'),
+-            (r'a="b=\="', 'b=\\='),
+-            (r'a="b=\n"', 'b=\\n'),
++            (r'a="b=\="', 'b=='),
++            (r'a="b=\n"', 'b=n'),
+             (r'a="b=\042"', 'b="'),
+             (r'a="b=\134"', 'b=\\'),
+             (r'a="b=\377"', 'b=\xff'),
+-            (r'a="b=\400"', 'b=\\400'),
+-            (r'a="b=\42"', 'b=\\42'),
++            (r'a="b=\400"', 'b=400'),
++            (r'a="b=\42"', 'b=42'),
+             (r'a="b=\\042"', 'b=\\042'),
+             (r'a="b=\\134"', 'b=\\134'),
+             (r'a="b=\\\""', 'b=\\"'),
+
+From 1fe24921da4c6c547da82e11c9703f3588dc5fab Mon Sep 17 00:00:00 2001
+From: Serhiy Storchaka <storchaka@gmail.com>
+Date: Sat, 17 Aug 2024 12:40:11 +0300
+Subject: [PATCH 3/4] Cache the sub() method, not the compiled pattern object.
+
+---
+ Lib/http/cookies.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Lib/http/cookies.py b/Lib/http/cookies.py
+index 464abeb0fb253a..6b9ed24ad8ec78 100644
+--- a/Lib/http/cookies.py
++++ b/Lib/http/cookies.py
+@@ -184,7 +184,8 @@ def _quote(str):
+         return '"' + str.translate(_Translator) + '"'
+ 
+ 
+-_unquote_re = re.compile(r'\\(?:([0-3][0-7][0-7])|(.))')
++_unquote_sub = re.compile(r'\\(?:([0-3][0-7][0-7])|(.))').sub
++
+ def _unquote_replace(m):
+     if m[1]:
+         return chr(int(m[1], 8))
+@@ -209,8 +210,7 @@ def _unquote(str):
+     #    \012 --> \n
+     #    \"   --> "
+     #
+-
+-    return _unquote_re.sub(_unquote_replace, str)
++    return _unquote_sub(_unquote_replace, str)
+ 
+ # The _getdate() routine is used to set the expiration time in the cookie's HTTP
+ # header.  By default, _getdate() returns the current time in the appropriate
+
+From 8256ed2228137c87d4b20747db84a9cdf0fa1d34 Mon Sep 17 00:00:00 2001
+From: Serhiy Storchaka <storchaka@gmail.com>
+Date: Sat, 17 Aug 2024 13:08:20 +0300
+Subject: [PATCH 4/4] Add a reference to the module in NEWS.
+
+---
+ .../next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst b/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst
+index 158b938a65a2d4..6a234561fe31a3 100644
+--- a/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst
++++ b/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst
+@@ -1 +1 @@
+-Fix quadratic complexity in parsing cookies with backslashes.
++Fix quadratic complexity in parsing ``"``-quoted cookie values with backslashes by :mod:`http.cookies`.
diff --git a/meta/recipes-devtools/python/python3_3.12.5.bb b/meta/recipes-devtools/python/python3_3.12.5.bb
index cc2e14baf09..29b02ef510f 100644
--- a/meta/recipes-devtools/python/python3_3.12.5.bb
+++ b/meta/recipes-devtools/python/python3_3.12.5.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
+           file://CVE-2024-7592.patch \
            "
 
 SRC_URI:append:class-native = " \

