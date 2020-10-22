Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.782.1603381991311776261
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 08:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TSD8wIpS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id t22so1170709plr.9
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 08:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=RP0s560xsrkdKKUa3gFuq0xxIarM/J9XWSwkgOWbA14=;
        b=TSD8wIpSuGFAMgSlmfp4/HC9AjfHpcLRiBuG5JtqBB+Dda5l2Sdvh953EVcQR5JzeS
         8CCycoux9mtNWoons85Ep6R1UvEjpTEL/TQIFhunvVu+fDRMyKf6NPPreiNSudCoJtzF
         bkiOoGS+XMHGZXSjlO3xQIO7uwcI4KKfExxhaEhHjpjSFiEqxcjRdX1vXabPAzO4jnFE
         Qj/dPmamtEe7MiSmcqUv2AHJ9wsH6Mt5TB5FYl9rZ+KjABwynLFmK0N1FaMIk3f6ZTTp
         jqFNevLVSIblTbi5ak6JpBykoJW4IzM0vlQhygsDX/AWlYfHC7SfPLk5b+YFrWR4ZsEA
         0Tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=RP0s560xsrkdKKUa3gFuq0xxIarM/J9XWSwkgOWbA14=;
        b=XtpXRvskKScGylnD/SI8Ww4CQ8TyHRz+6e4W7IuxGZ+yGDe2iMseSms6hnODenCKEC
         2IVURsEcl2baEvByL/0mfu6HIG5HHhKlLRPIpYhgLGRQdE8Deq0VH+Rvf+J0aejwq+qJ
         GPi3l2IfyhCO7VXLO8PQvLWWO5GOD+FBkEgmbJ/S/rZxNhHk3SBqbCE6f9S8XB2mekzC
         gOSafdO/ByUzhM4FzYj4MD+LWbQY/1IEhZXEgCkQQo/ts3Uh91JhUvqx3C4fGhvMrGHT
         P/9qDhVDTu5Gw9f82OZXEdDBdM9JynHBzO3OrOvi7YQyWNCrA2EZQoplem5xpw27SnPK
         U/1A==
X-Gm-Message-State: AOAM530LRremIgSo9NpBaip+jrsbnTHixb9NLlxab6j+aA2HhYdGJ/fB
	J0hO10zDP+IdZNQXFRTXhi72YUfn1OrFQf0U
X-Google-Smtp-Source: ABdhPJwTvWlWsu8uNO5lDwh7NMxSKwEOIYmxXOZUYKw4YN/7JkFqKgIwGQxuCVCZPCcC+4zma0+71Q==
X-Received: by 2002:a17:90b:4b08:: with SMTP id lx8mr2941568pjb.204.1603381990178;
        Thu, 22 Oct 2020 08:53:10 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id kc21sm2423558pjb.36.2020.10.22.08.53.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 08:53:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/14] python3: fix CVE-2020-26116
Date: Thu, 22 Oct 2020 05:51:43 -1000
Message-Id: <2f607a61a820bfbc369f779c3161a339f088d04f.1603381705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603381704.git.steve@sakoman.com>
References: <cover.1603381704.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/CVE-2020-26116.patch       | 104 ++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.2.bb |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2020-26116.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2020-26116.patch b/meta/recipes-devtools/python/python3/CVE-2020-26116.patch
new file mode 100644
index 0000000000..c019db2a76
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2020-26116.patch
@@ -0,0 +1,104 @@
+From 668d321476d974c4f51476b33aaca870272523bf Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Sat, 18 Jul 2020 13:39:12 -0700
+Subject: [PATCH] bpo-39603: Prevent header injection in http methods
+ (GH-18485)
+
+reject control chars in http method in http.client.putrequest to prevent http header injection
+(cherry picked from commit 8ca8a2e8fb068863c1138f07e3098478ef8be12e)
+
+Co-authored-by: AMIR <31338382+amiremohamadi@users.noreply.github.com>
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/668d321476d974c4f51476b33aaca870272523bf]
+CVE: CVE-2020-26116
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ Lib/http/client.py                            | 15 +++++++++++++
+ Lib/test/test_httplib.py                      | 22 +++++++++++++++++++
+ .../2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst  |  2 ++
+ 3 files changed, 39 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Security/2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst
+
+diff --git a/Lib/http/client.py b/Lib/http/client.py
+index 019380a720318..c2ad0471bfee5 100644
+--- a/Lib/http/client.py
++++ b/Lib/http/client.py
+@@ -147,6 +147,10 @@
+ #  _is_allowed_url_pchars_re = re.compile(r"^[/!$&'()*+,;=:@%a-zA-Z0-9._~-]+$")
+ # We are more lenient for assumed real world compatibility purposes.
+ 
++# These characters are not allowed within HTTP method names
++# to prevent http header injection.
++_contains_disallowed_method_pchar_re = re.compile('[\x00-\x1f]')
++
+ # We always set the Content-Length header for these methods because some
+ # servers will otherwise respond with a 411
+ _METHODS_EXPECTING_BODY = {'PATCH', 'POST', 'PUT'}
+@@ -1087,6 +1091,8 @@ def putrequest(self, method, url, skip_host=False,
+         else:
+             raise CannotSendRequest(self.__state)
+ 
++        self._validate_method(method)
++
+         # Save the method for use later in the response phase
+         self._method = method
+ 
+@@ -1177,6 +1183,15 @@ def _encode_request(self, request):
+         # ASCII also helps prevent CVE-2019-9740.
+         return request.encode('ascii')
+ 
++    def _validate_method(self, method):
++        """Validate a method name for putrequest."""
++        # prevent http header injection
++        match = _contains_disallowed_method_pchar_re.search(method)
++        if match:
++            raise ValueError(
++                    f"method can't contain control characters. {method!r} "
++                    f"(found at least {match.group()!r})")
++
+     def _validate_path(self, url):
+         """Validate a url for putrequest."""
+         # Prevent CVE-2019-9740.
+diff --git a/Lib/test/test_httplib.py b/Lib/test/test_httplib.py
+index 8f0e27a1fb836..5a5fcecbc9c15 100644
+--- a/Lib/test/test_httplib.py
++++ b/Lib/test/test_httplib.py
+@@ -364,6 +364,28 @@ def test_headers_debuglevel(self):
+         self.assertEqual(lines[3], "header: Second: val2")
+ 
+ 
++class HttpMethodTests(TestCase):
++    def test_invalid_method_names(self):
++        methods = (
++            'GET\r',
++            'POST\n',
++            'PUT\n\r',
++            'POST\nValue',
++            'POST\nHOST:abc',
++            'GET\nrHost:abc\n',
++            'POST\rRemainder:\r',
++            'GET\rHOST:\n',
++            '\nPUT'
++        )
++
++        for method in methods:
++            with self.assertRaisesRegex(
++                    ValueError, "method can't contain control characters"):
++                conn = client.HTTPConnection('example.com')
++                conn.sock = FakeSocket(None)
++                conn.request(method=method, url="/")
++
++
+ class TransferEncodingTest(TestCase):
+     expected_body = b"It's just a flesh wound"
+ 
+diff --git a/Misc/NEWS.d/next/Security/2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst b/Misc/NEWS.d/next/Security/2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst
+new file mode 100644
+index 0000000000000..990affc3edd9d
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst
+@@ -0,0 +1,2 @@
++Prevent http header injection by rejecting control characters in
++http.client.putrequest(...).
diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
index 99d9f6748f..169bc87988 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.2.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch \
            file://CVE-2020-14422.patch \
+           file://CVE-2020-26116.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.17.1

