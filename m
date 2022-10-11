Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA11DC433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 18:40:52 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web09.11427.1665513650714461500
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 11:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Cy9RYP2M;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id r18so13490021pgr.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 11:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noOs5ZhOvMUC4Rp0OlEh/Dnmx4Gxxq1FVdOTyJ8y2Ow=;
        b=Cy9RYP2MO1QELkgpBN/NAMfWjoTZMhqKFZSz/S6dC87eoVYRzmMH6GN61MLJMbgf6z
         6HYRcegwBl/urcRn2G3bYqDn+vuyBqBtX0K2LHgd+0CYkpzPy+PQh2e4eJz7ME0ehQx6
         YtiKHOQWDR9rlqil9tV9IxpSk4oLHvuFNHWbqcu62YUHeKPIAjXx6PCP0k2TpTjIc9fK
         aqcNQ/euaOEhSyx6j8+l3/rO8ejSKnTF8//zxM1brDX9ZeXGZ1xNUlHSIyAmc0KI8Qwn
         0zbZsba5Kk4gD/FH/4N5w3maJTTyf1iwXXfaxWdXuPeJq0WbRgswcay7N5WXgdsPeWD2
         R/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=noOs5ZhOvMUC4Rp0OlEh/Dnmx4Gxxq1FVdOTyJ8y2Ow=;
        b=cEeAS1dtl2MEEaKcXm3C4XqslaRwwlNgHslS5b/wYYR8W2348NPojzP4MmN4naWE7+
         hbXrfYgni4/0ibY6cT38geycP+i0ifJ5qOoRbzcJ3bO012qMEgNtoETyFhYP3DmaA1lL
         OPOacFVJfLhs3ul0R1ftyJX4VIkKfdRmOFEhwXJDyhTIRKNe/CUlw81Qb+nupcdSNZTo
         pSl5g/Q7CiB1P+pc9UT1+3cgRNtFmk3A79E3+fufEOrTvGB37j6exDetDwqGrS9sQv3q
         n8HLCEUit8l6TX5nN83KiQtzBqv2rSdut4KHzs45kxQf8MNYacNDWOozVsfPfSFZhE2k
         +aJA==
X-Gm-Message-State: ACrzQf0g/Uap1GyDk3/tIIRNxtFOylyOqZb7agSzkkrleD9O7icDEZ5a
	NUv5EjuKMllt1MJYDumCwwExmCk5uqV2zQ==
X-Google-Smtp-Source: 
 AMsMyM5FkWzhO2HszEPWG5d/LxT3BHjXBhPiFPp+LBtfnkCwtxdM3x+3qq8ACmi0bwKKkNSmIdrHtg==
X-Received: by 2002:a05:6a00:2392:b0:549:be0:cd3c with SMTP id
 f18-20020a056a00239200b005490be0cd3cmr26553585pfc.8.1665513649159;
        Tue, 11 Oct 2022 11:40:49 -0700 (PDT)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:ca00:cea0:5f4c:d51a:946f:edd4])
        by smtp.gmail.com with ESMTPSA id
 x3-20020a170902ec8300b00179c9219195sm9072712plg.16.2022.10.11.11.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 11:40:48 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [dunfell][PATCH v2] python3: upgrade 3.8.13 -> 3.8.14
Date: Tue, 11 Oct 2022 11:40:43 -0700
Message-Id: <20221011184043.798582-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221011144008.2808909-1-tim.orling@konsulko.com>
References: <20221011144008.2808909-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 18:40:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171635

Security and bug fixes.

* Drop CVE-2021-28861.patch as it was merged in 3.8.14 release.

Fixes:
  * CVE-2020-10735
    https://nvd.nist.gov/vuln/detail/CVE-2020-10735
  * CVE-2021-28861
    https://nvd.nist.gov/vuln/detail/CVE-2021-28861
  * CVE-2018-25032
    https://nvd.nist.gov/vuln/detail/CVE-2018-25032

Python 3.8.14
Release Date: Sept. 6, 2022

This is a security release of Python 3.8
Note: The release you're looking at is Python 3.8.14, a security bugfix
      release for the legacy 3.8 series. Python 3.10 is now the latest
      feature release series of Python 3.

Security content in this release
CVE-2020-10735: converting between int and str in bases other than
  2 (binary), 4, 8 (octal), 16 (hexadecimal), or 32 such as base
  10 (decimal) now raises a ValueError if the number of digits in string
  form is above a limit to avoid potential denial of service attacks due
  to the algorithmic complexity.
gh-87389: http.server: Fix an open redirection vulnerability in the HTTP
  server when an URI path starts with //.
gh-93065: Fix contextvars HAMT implementation to handle iteration over
  deep trees to avoid a potential crash of the interpreter.
gh-90355: Fix ensurepip environment isolation for the subprocess running
  pip.
gh-80254: Raise ProgrammingError instead of segfaulting on recursive usage
  of cursors in sqlite3 converters.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
  * drop CVE-2021-28861.patch which was somehow missed in v1 testing.

 .../python/python3/CVE-2021-28861.patch       | 135 ------------------
 .../{python3_3.8.13.bb => python3_3.8.14.bb}  |   5 +-
 2 files changed, 2 insertions(+), 138 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2021-28861.patch
 rename meta/recipes-devtools/python/{python3_3.8.13.bb => python3_3.8.14.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/CVE-2021-28861.patch b/meta/recipes-devtools/python/python3/CVE-2021-28861.patch
deleted file mode 100644
index dc97c6b4ebe..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2021-28861.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From 4dc2cae3abd75f386374d0635d00443b897d0672 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Wed, 22 Jun 2022 01:42:52 -0700
-Subject: [PATCH] gh-87389: Fix an open redirection vulnerability in
- http.server. (GH-93879) (GH-94094)
-
-Fix an open redirection vulnerability in the `http.server` module when
-an URI path starts with `//` that could produce a 301 Location header
-with a misleading target.  Vulnerability discovered, and logic fix
-proposed, by Hamza Avvan (@hamzaavvan).
-
-Test and comments authored by Gregory P. Smith [Google].
-(cherry picked from commit 4abab6b603dd38bec1168e9a37c40a48ec89508e)
-
-Co-authored-by: Gregory P. Smith <greg@krypto.org>
-
-Signed-off-by: Riyaz Khan <Riyaz.Khan@kpit.com>
-
-CVE: CVE-2021-28861
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/4dc2cae3abd75f386374d0635d00443b897d0672]
-
----
- Lib/http/server.py                            |  7 +++
- Lib/test/test_httpservers.py                  | 53 ++++++++++++++++++-
- ...2-06-15-20-09-23.gh-issue-87389.QVaC3f.rst |  3 ++
- 3 files changed, 61 insertions(+), 2 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2022-06-15-20-09-23.gh-issue-87389.QVaC3f.rst
-
-diff --git a/Lib/http/server.py b/Lib/http/server.py
-index 38f7accad7a3..39de35458c38 100644
---- a/Lib/http/server.py
-+++ b/Lib/http/server.py
-@@ -332,6 +332,13 @@ def parse_request(self):
-                 return False
-         self.command, self.path = command, path
- 
-+        # gh-87389: The purpose of replacing '//' with '/' is to protect
-+        # against open redirect attacks possibly triggered if the path starts
-+        # with '//' because http clients treat //path as an absolute URI
-+        # without scheme (similar to http://path) rather than a path.
-+        if self.path.startswith('//'):
-+            self.path = '/' + self.path.lstrip('/')  # Reduce to a single /
-+
-         # Examine the headers and look for a Connection directive.
-         try:
-             self.headers = http.client.parse_headers(self.rfile,
-diff --git a/Lib/test/test_httpservers.py b/Lib/test/test_httpservers.py
-index 87d4924a34b3..fb026188f0b4 100644
---- a/Lib/test/test_httpservers.py
-+++ b/Lib/test/test_httpservers.py
-@@ -330,7 +330,7 @@ class request_handler(NoLogRequestHandler, SimpleHTTPRequestHandler):
-         pass
- 
-     def setUp(self):
--        BaseTestCase.setUp(self)
-+        super().setUp()
-         self.cwd = os.getcwd()
-         basetempdir = tempfile.gettempdir()
-         os.chdir(basetempdir)
-@@ -358,7 +358,7 @@ def tearDown(self):
-             except:
-                 pass
-         finally:
--            BaseTestCase.tearDown(self)
-+            super().tearDown()
- 
-     def check_status_and_reason(self, response, status, data=None):
-         def close_conn():
-@@ -414,6 +414,55 @@ def test_undecodable_filename(self):
-         self.check_status_and_reason(response, HTTPStatus.OK,
-                                      data=support.TESTFN_UNDECODABLE)
- 
-+    def test_get_dir_redirect_location_domain_injection_bug(self):
-+        """Ensure //evil.co/..%2f../../X does not put //evil.co/ in Location.
-+
-+        //netloc/ in a Location header is a redirect to a new host.
-+        https://github.com/python/cpython/issues/87389
-+
-+        This checks that a path resolving to a directory on our server cannot
-+        resolve into a redirect to another server.
-+        """
-+        os.mkdir(os.path.join(self.tempdir, 'existing_directory'))
-+        url = f'/python.org/..%2f..%2f..%2f..%2f..%2f../%0a%0d/../{self.tempdir_name}/existing_directory'
-+        expected_location = f'{url}/'  # /python.org.../ single slash single prefix, trailing slash
-+        # Canonicalizes to /tmp/tempdir_name/existing_directory which does
-+        # exist and is a dir, triggering the 301 redirect logic.
-+        response = self.request(url)
-+        self.check_status_and_reason(response, HTTPStatus.MOVED_PERMANENTLY)
-+        location = response.getheader('Location')
-+        self.assertEqual(location, expected_location, msg='non-attack failed!')
-+
-+        # //python.org... multi-slash prefix, no trailing slash
-+        attack_url = f'/{url}'
-+        response = self.request(attack_url)
-+        self.check_status_and_reason(response, HTTPStatus.MOVED_PERMANENTLY)
-+        location = response.getheader('Location')
-+        self.assertFalse(location.startswith('//'), msg=location)
-+        self.assertEqual(location, expected_location,
-+                msg='Expected Location header to start with a single / and '
-+                'end with a / as this is a directory redirect.')
-+
-+        # ///python.org... triple-slash prefix, no trailing slash
-+        attack3_url = f'//{url}'
-+        response = self.request(attack3_url)
-+        self.check_status_and_reason(response, HTTPStatus.MOVED_PERMANENTLY)
-+        self.assertEqual(response.getheader('Location'), expected_location)
-+
-+        # If the second word in the http request (Request-URI for the http
-+        # method) is a full URI, we don't worry about it, as that'll be parsed
-+        # and reassembled as a full URI within BaseHTTPRequestHandler.send_head
-+        # so no errant scheme-less //netloc//evil.co/ domain mixup can happen.
-+        attack_scheme_netloc_2slash_url = f'https://pypi.org/{url}'
-+        expected_scheme_netloc_location = f'{attack_scheme_netloc_2slash_url}/'
-+        response = self.request(attack_scheme_netloc_2slash_url)
-+        self.check_status_and_reason(response, HTTPStatus.MOVED_PERMANENTLY)
-+        location = response.getheader('Location')
-+        # We're just ensuring that the scheme and domain make it through, if
-+        # there are or aren't multiple slashes at the start of the path that
-+        # follows that isn't important in this Location: header.
-+        self.assertTrue(location.startswith('https://pypi.org/'), msg=location)
-+
-     def test_get(self):
-         #constructs the path relative to the root directory of the HTTPServer
-         response = self.request(self.base_url + '/test')
-diff --git a/Misc/NEWS.d/next/Security/2022-06-15-20-09-23.gh-issue-87389.QVaC3f.rst b/Misc/NEWS.d/next/Security/2022-06-15-20-09-23.gh-issue-87389.QVaC3f.rst
-new file mode 100644
-index 000000000000..029d437190de
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2022-06-15-20-09-23.gh-issue-87389.QVaC3f.rst
-@@ -0,0 +1,3 @@
-+:mod:`http.server`: Fix an open redirection vulnerability in the HTTP server
-+when an URI path starts with ``//``.  Vulnerability discovered, and initial
-+fix proposed, by Hamza Avvan.
diff --git a/meta/recipes-devtools/python/python3_3.8.13.bb b/meta/recipes-devtools/python/python3_3.8.14.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.8.13.bb
rename to meta/recipes-devtools/python/python3_3.8.14.bb
index d87abe23513..035eda9ecde 100644
--- a/meta/recipes-devtools/python/python3_3.8.13.bb
+++ b/meta/recipes-devtools/python/python3_3.8.14.bb
@@ -34,7 +34,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://makerace.patch \
-           file://CVE-2021-28861.patch \
            "
 
 SRC_URI_append_class-native = " \
@@ -43,8 +42,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "c4b7100dcaace9d33ab1fda9a3a038d6"
-SRC_URI[sha256sum] = "6f309077012040aa39fe8f0c61db8c0fa1c45136763299d375c9e5756f09cf57"
+SRC_URI[md5sum] = "78710eed185b71f4198d354502ff62c9"
+SRC_URI[sha256sum] = "5d77e278271ba803e9909a41a4f3baca006181c93ada682a5e5fe8dc4a24c5f3"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.30.2


