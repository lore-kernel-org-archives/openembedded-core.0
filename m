Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CF7CD4F37
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 21:33:10 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.62087.1725485588888050242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 14:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zO+O9oAL;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2da4e84c198so35072a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 14:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725485588; x=1726090388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Sf9dwCvtrwBOA7io+xMsSeMOlVDCcybKAYvH6teFnc=;
        b=zO+O9oALbCPvCPpLi6WyD0GiWS8EmTZdqU2K/X+RFH5BjtYTjytRF89yNYUhOyFnUH
         /f3N9pe9H/LCfwirAVZNY8SADabsBzFfWk2H3q4bdpMZAdm7lMLY8zKQiVOQEUndxEp2
         uFhMmtYxG/hmRXTdk4qecDZ3z9uQrzq5MueCYCWL4RJUUydc2I7X9692iCuTKWFb8mFE
         xWnYYi/7aRIRj3Nh6/BC1bJaGXSl16QeWg4mHfTYE7MVMk1ug0yZjBukvcUoo2SASrAG
         h2lPt0ZJkrFYJmyh6dS8PLO6Emkekm2SSrQEzp3CMZlQUmnDRrhdztOMTcRy39uQlVoK
         hfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725485588; x=1726090388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Sf9dwCvtrwBOA7io+xMsSeMOlVDCcybKAYvH6teFnc=;
        b=THOFK2WRgGBU9HVF1qdRY47Ig+O7abc7/47jrl5zVVu5CCfwqouf5x/ldiICqrtTuI
         +aOWe65xbzqnJYHrhSxNGwG3zYb/6DtESB7wETYB/O+bSdpmM4Qbhtow11/0ifsRgsX6
         d0DfgjSmiNyRNqO4AO2XrgSvv40ityDIq7AUQPZYQuVqzkSUCXartJw1WUhYGdnBOwUg
         TDjwqo3J0QypEf+dGngSJ/S4hvx3BoWi2anLjOiFPDJGgYNQu2Waeyw6xTZGStfGB/MK
         ZoyHdCVvt7zG7Tf6+wvv5UKqJwmPSwYDDb4IgwjcKlUwzfwGy8zChr2vu9jqpIyXTwU4
         miKg==
X-Gm-Message-State: AOJu0YzhjAjJX00sr5H1Syt8oCNMzAqut1r2c4OVY05cX24VvdNx42GF
	CmhZz71RH35dyVrx4D+7enzoMj8yoGCnrYNdBtvaEtYv0zkniK8sfxyn045tkO927S3z+NtLHwd
	9K4o=
X-Google-Smtp-Source: AGHT+IE4jyZFjhDaD66j1hVebs5zTubxH7+5qqSODwjBaF2IzB83F69L4i6Jn5qQNLqP/UuIeB7Lhw==
X-Received: by 2002:a17:90b:88b:b0:2d8:94d6:3499 with SMTP id 98e67ed59e1d1-2d894d6356bmr16823497a91.37.1725485588073;
        Wed, 04 Sep 2024 14:33:08 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8e3e8c580sm6693767a91.40.2024.09.04.14.33.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:33:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/14] python3: Fix CVE-2024-7592
Date: Wed,  4 Sep 2024 14:32:43 -0700
Message-Id: <3bb9684eef5227e7b1280ee9051884310b0d0b7f.1725456307.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725456307.git.steve@sakoman.com>
References: <cover.1725456307.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 21:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204214

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


