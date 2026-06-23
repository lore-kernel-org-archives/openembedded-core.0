Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D358CD98F2
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:36 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20834.1782220473692656383
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=J/biFXcC;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4624a44e152so4752055f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220472; x=1782825272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4fOYFJwrmpqDxb+WZQvYPrsUeIZdJW+sW+HIn6iD0M=;
        b=J/biFXcCRgNi3JVbOk9zAEp7ab14pAtFmHdk/B1EakpWi1fQWW0J/6YjAmAoY0kDUg
         cJXaT/OUHRfTW1+36gAbF6cTzX02DdytPE0fKamknsOaPPJAHp26rqM9pbYkBqD4B2oY
         ri2H2UMhhTorZOzxlfvkvnOyzRdOZKlJpxRmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220472; x=1782825272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y4fOYFJwrmpqDxb+WZQvYPrsUeIZdJW+sW+HIn6iD0M=;
        b=FZHMLfUO/ww3AjsJRWrQZMUjIIJeqS/4prxcUnAwidWQbfH6z9+7sPMFJQbgst8TzC
         OAu/e7nv40L4uVHYtXSSz1KdkjEkTlDZS1SE2qey7xcQ4wdZehSy9qtyqnfPdxtagMV+
         r2lHOuiEQNnuKgKv9/4P7moj5CLsGwL2jXYnnwGsCb5qEOFy0W7Q08KqXEgQHdbqOr6f
         XOD6dB/iAg5bItQwsPTnmyzp7QOTC/mJIYBFq8ZVDQoL8BO2wizqKYazNMglAKlZ/eUN
         GFREE0egc8By7U0m4FMcE1UN2jCLY/L+OLREYLiuALrSMwr/SULVm2waAPjqWcCx6idE
         3UbA==
X-Gm-Message-State: AOJu0Yxlp0XVYdwfRp3iE2BpCA4WrnbEQiLdge2y7GLGkGA8aKWZBevi
	mrqP0BlAB/z8n/kYd8AYs811M28BZ6rcsPt/26GFBbFSF3RAI0GEal1nEF8iIocc6VAA9a4vMgd
	UCr2Y
X-Gm-Gg: AfdE7cm+2xQzvWyB8BlrWvHMa4SF0xA+L9bQtcrJR7SO9meGGM1Lh1yDadEV45qd23i
	7V9AVLSMwXd4wFOGYNY7XB66Q7eZI7EexKueTOluKhqk8QkhOlwcCe4ieLsQZ2j/0E4LxLEquvp
	cQJ29xcEqg7pD+2wmrLIoZuFL5TTuNnDo6qd8Ydpj45ld8nme75KRwTOGcDTlkDNzk3oQFyT/rT
	buuZVgyAzAiwtOqoTRpPmkmYschF4BoduCSNj8SYTrkjIUjkzNB76AxuJDetAjSSd/eEjcvCV/9
	9ZJMWZ2dG8htEYfVyIN/8pXQhHpmwANP/1ie9NLgdq3DXGr015pvc47H70KLmiae57D5Zusp6n2
	wat99+Bp/DbzHMmxKQH+ZrtBXGFu1BRKWgixMhiRJLf8w9fl4p6Ct0oy08RUBLL4Ry0vaHxwwpq
	ULS/KBrGV7Yst5LjaRXQew0zkfYuYocZ+UKcTNG0ewl91nwQAKf9Ki6QDfrE+mplR56zTgmMrj0
	4koNp8ls+mJWgCeUQ==
X-Received: by 2002:a05:600c:8114:b0:490:cb90:3e00 with SMTP id 5b1f17b1804b1-49240e1960amr292651195e9.14.1782220471574;
        Tue, 23 Jun 2026 06:14:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/26] python3: Fix CVE-2026-3644 and CVE-2026-0672
Date: Tue, 23 Jun 2026 15:13:49 +0200
Message-ID: <ac763f139ba7f836d0fa9377295ef7d3b10f2238.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782220259.git.yoann.congal@smile.fr>
References: <cover.1782220259.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239374

From: Sudhir Dumbhare <sudumbha@cisco.com>

Apply the upstream v3.13 fix [1], as referenced in [2], to address
CVE-2026-3644 by rejecting control characters in http.cookies.Morsel.update(),
the |= operator, and unpickling paths.

CVE-2026-3644 [2] revealed the CVE-2026-0672 fix was incomplete, as
Morsel.update(), |=, and unpickling could bypass input validation. The fix
also adds output validation to BaseCookie.js_output(), matching the
control-character safeguards already present in BaseCookie.output().

[1] https://github.com/python/cpython/commit/d16ecc6c3626f0e2cc8f08c309c83934e8a979dd
[2] https://security-tracker.debian.org/tracker/CVE-2026-3644

References:
https://security-tracker.debian.org/tracker/CVE-2026-3644
https://security-tracker.debian.org/tracker/CVE-2026-0672
https://nvd.nist.gov/vuln/detail/CVE-2026-3644
https://nvd.nist.gov/vuln/detail/CVE-2026-0672

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3/CVE-2026-3644_CVE-2026-0672.patch | 154 ++++++++++++++++++
 .../python/python3_3.12.13.bb                 |   1 +
 2 files changed, 155 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-3644_CVE-2026-0672.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-3644_CVE-2026-0672.patch b/meta/recipes-devtools/python/python3/CVE-2026-3644_CVE-2026-0672.patch
new file mode 100644
index 00000000000..42d8133a183
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-3644_CVE-2026-0672.patch
@@ -0,0 +1,154 @@
+From 6e291d2eba0b6820bc924e68f1db750328bf6c75 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 16 Mar 2026 15:05:13 +0100
+Subject: [PATCH] [3.13] gh-145599, CVE 2026-3644: Reject control
+ characters in `http.cookies.Morsel.update()` (GH-145600) (#146024)
+
+gh-145599, CVE 2026-3644: Reject control characters in `http.cookies.Morsel.update()` (GH-145600)
+
+Reject control characters in `http.cookies.Morsel.update()` and `http.cookies.BaseCookie.js_output`.
+
+CVE: CVE-2026-3644 CVE-2026-0672
+Upstream-Status: Backport [https://github.com/python/cpython/commit/d16ecc6c3626f0e2cc8f08c309c83934e8a979dd]
+
+Backport Changes:
+- This file is not present in the current version and is therefore omitted
+  Misc/NEWS.d/next/Security/2026-03-06-17-03-38.gh-issue-145599.kchwZV.rst
+
+(cherry picked from commit 57e88c1cf95e1481b94ae57abe1010469d47a6b4)
+
+Co-authored-by: Stan Ulbrych <89152624+StanFromIreland@users.noreply.github.com>
+Co-authored-by: Victor Stinner <vstinner@python.org>
+Co-authored-by: Victor Stinner <victor.stinner@gmail.com>
+(cherry picked from commit d16ecc6c3626f0e2cc8f08c309c83934e8a979dd)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ Lib/http/cookies.py           | 24 ++++++++++++++++++----
+ Lib/test/test_http_cookies.py | 38 +++++++++++++++++++++++++++++++++++
+ 2 files changed, 58 insertions(+), 4 deletions(-)
+
+diff --git a/Lib/http/cookies.py b/Lib/http/cookies.py
+index d0a69cbe191..63d119ad46c 100644
+--- a/Lib/http/cookies.py
++++ b/Lib/http/cookies.py
+@@ -335,9 +335,16 @@ class Morsel(dict):
+             key = key.lower()
+             if key not in self._reserved:
+                 raise CookieError("Invalid attribute %r" % (key,))
++            if _has_control_character(key, val):
++                raise CookieError("Control characters are not allowed in "
++                                  f"cookies {key!r} {val!r}")
+             data[key] = val
+         dict.update(self, data)
+ 
++    def __ior__(self, values):
++        self.update(values)
++        return self
++
+     def isReservedKey(self, K):
+         return K.lower() in self._reserved
+ 
+@@ -363,9 +370,15 @@ class Morsel(dict):
+         }
+ 
+     def __setstate__(self, state):
+-        self._key = state['key']
+-        self._value = state['value']
+-        self._coded_value = state['coded_value']
++        key = state['key']
++        value = state['value']
++        coded_value = state['coded_value']
++        if _has_control_character(key, value, coded_value):
++            raise CookieError("Control characters are not allowed in cookies "
++                              f"{key!r} {value!r} {coded_value!r}")
++        self._key = key
++        self._value = value
++        self._coded_value = coded_value
+ 
+     def output(self, attrs=None, header="Set-Cookie:"):
+         return "%s %s" % (header, self.OutputString(attrs))
+@@ -377,13 +390,16 @@ class Morsel(dict):
+ 
+     def js_output(self, attrs=None):
+         # Print javascript
++        output_string = self.OutputString(attrs)
++        if _has_control_character(output_string):
++            raise CookieError("Control characters are not allowed in cookies")
+         return """
+         <script type="text/javascript">
+         <!-- begin hiding
+         document.cookie = \"%s\";
+         // end hiding -->
+         </script>
+-        """ % (self.OutputString(attrs).replace('"', r'\"'))
++        """ % (output_string.replace('"', r'\"'))
+ 
+     def OutputString(self, attrs=None):
+         # Build up our result
+diff --git a/Lib/test/test_http_cookies.py b/Lib/test/test_http_cookies.py
+index f196bcc48e3..2478a6c630f 100644
+--- a/Lib/test/test_http_cookies.py
++++ b/Lib/test/test_http_cookies.py
+@@ -573,6 +573,14 @@ class MorselTests(unittest.TestCase):
+             with self.assertRaises(cookies.CookieError):
+                 morsel["path"] = c0
+ 
++            # .__setstate__()
++            with self.assertRaises(cookies.CookieError):
++                morsel.__setstate__({'key': c0, 'value': 'val', 'coded_value': 'coded'})
++            with self.assertRaises(cookies.CookieError):
++                morsel.__setstate__({'key': 'key', 'value': c0, 'coded_value': 'coded'})
++            with self.assertRaises(cookies.CookieError):
++                morsel.__setstate__({'key': 'key', 'value': 'val', 'coded_value': c0})
++
+             # .setdefault()
+             with self.assertRaises(cookies.CookieError):
+                 morsel.setdefault("path", c0)
+@@ -587,6 +595,18 @@ class MorselTests(unittest.TestCase):
+             with self.assertRaises(cookies.CookieError):
+                 morsel.set("path", "val", c0)
+ 
++            # .update()
++            with self.assertRaises(cookies.CookieError):
++                morsel.update({"path": c0})
++            with self.assertRaises(cookies.CookieError):
++                morsel.update({c0: "val"})
++
++            # .__ior__()
++            with self.assertRaises(cookies.CookieError):
++                morsel |= {"path": c0}
++            with self.assertRaises(cookies.CookieError):
++                morsel |= {c0: "val"}
++
+     def test_control_characters_output(self):
+         # Tests that even if the internals of Morsel are modified
+         # that a call to .output() has control character safeguards.
+@@ -607,6 +627,24 @@ class MorselTests(unittest.TestCase):
+             with self.assertRaises(cookies.CookieError):
+                 cookie.output()
+ 
++        # Tests that .js_output() also has control character safeguards.
++        for c0 in support.control_characters_c0():
++            morsel = cookies.Morsel()
++            morsel.set("key", "value", "coded-value")
++            morsel._key = c0  # Override private variable.
++            cookie = cookies.SimpleCookie()
++            cookie["cookie"] = morsel
++            with self.assertRaises(cookies.CookieError):
++                cookie.js_output()
++
++            morsel = cookies.Morsel()
++            morsel.set("key", "value", "coded-value")
++            morsel._coded_value = c0  # Override private variable.
++            cookie = cookies.SimpleCookie()
++            cookie["cookie"] = morsel
++            with self.assertRaises(cookies.CookieError):
++                cookie.js_output()
++
+ 
+ def load_tests(loader, tests, pattern):
+     tests.addTest(doctest.DocTestSuite(cookies))
+-- 
+2.35.6
+
diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes-devtools/python/python3_3.12.13.bb
index 4865178572c..c59d9fba80d 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_readline-skip-limited-history-test.patch \
            file://CVE-2026-1502.patch \
            file://CVE-2026-6100.patch \
+           file://CVE-2026-3644_CVE-2026-0672.patch \
            "
 
 SRC_URI:append:class-native = " \

