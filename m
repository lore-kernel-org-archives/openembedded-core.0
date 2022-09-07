Return-Path: <rak3033@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33503C54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 16:27:57 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web09.770.1662568073460874770
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 09:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YhLei+8X;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: rak3033@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id v1so1770540plo.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 09:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=GiSMvnlU23I5Q8uzq0gDdGet7ns/ETbl1IvY7AhSQhw=;
        b=YhLei+8XNHjBjipWUqOYXapafTWUA0AvYZEi3lVMMagXs4bIPbaMH0qbuT+CiiguLY
         MY3Sv2rB+SvLjzDjqXZVmzKGtOPXQ/9P+1byOEt6niH/e03EkNGJL3J2qbqasamKp3WY
         9Regu0QWfxE52ol/eScogz+dk+cv9FpNNAxv5/Y1+UHeG661MXi0ZBm398+nJNnY9RUm
         mFRdRZ9OAOfxecrxAezlN4u8MkbdJCLxJ3il1n+XMhBFSGX9QTV9+Kmj806vK2uX6VoT
         8rO4Ybwi1HkTs44Aj2N0kKVlO4hBfWdc0qKEbxm/tpNfbOmOMHFy6X6jcDZRgFeQQl+E
         F2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=GiSMvnlU23I5Q8uzq0gDdGet7ns/ETbl1IvY7AhSQhw=;
        b=nHyaSzV/0Kk9WUvpslyM5YH+KcvMZH6muqsBrpi4rV+etMIo4FfJT7Ft/YgVBQVIew
         l4HEiwJ6O9AIZO7K2Sl5hATkb2jYpv9Vr9f80TFeQ0uANJkBZnyhFrBgreHINwTarvwT
         qJxGrilqK0T+c1Lu15TDwyRUROkZAtUMeJk4A6KSQMFTZc2K4hutjLeeJdGerR8tFVoD
         wqywizlyLbxvB8qW4cwWzPErmodKB2EEWdhn5PPFT/4cnbpgfMyy5b8U1+XbduK4zzHg
         5UwGw/H9pKwALrXdD2ONasd6hgeZ+7W9NpQAfZBQC38vF09iR/5KFKxLOpi5Q7WO8T+Z
         gLyQ==
X-Gm-Message-State: ACgBeo2X2Mc2aXk8GeSFqGn8WWADngeOC3TmgJKdLRx1oLyl4u5fXJJ4
	4nJ2OkYJyKb9hzfsCzMzF+R6CxvN2K6krA==
X-Google-Smtp-Source: 
 AA6agR5Tm8zHo1I5cYZNwoXDXD+rGY5p48NO3oueT6QQtZe88EXNd8PtsCqjHs4fZUdKhQcrhFZbiw==
X-Received: by 2002:a17:90a:428a:b0:1fb:87bf:89c with SMTP id
 p10-20020a17090a428a00b001fb87bf089cmr4774964pjg.20.1662568072509;
        Wed, 07 Sep 2022 09:27:52 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:33c3:2e02:b015:94b:575f:77d5])
        by smtp.gmail.com with ESMTPSA id
 67-20020a621646000000b0053e2be5605dsm4359198pfw.214.2022.09.07.09.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 09:27:51 -0700 (PDT)
From: Riyaz Khan <rak3033@gmail.com>
To: openembedded-core@lists.openembedded.org,
	rak3033@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	riyaz.khan@kpit.com,
	Riyaz Khan <RiyazKhan@kpit.com>
Subject: [meta][dunfell][PATCH] python3: Fix CVE-2021-28861 for python3
Date: Wed,  7 Sep 2022 21:57:38 +0530
Message-Id: <20220907162738.26073-1-rak3033@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 16:27:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170423

From: Riyaz Khan <Riyaz Khan@kpit.com>

Add patch to fix CVE-2021-28861

CVE-2021-28861.patch
Link: https://github.com/python/cpython/commit/4dc2cae3abd75f386374d0635d00443b897d0672

Signed-off-by: Riyaz Khan <rak3033@gmail.com>
---
 .../python/python3/CVE-2021-28861.patch       | 135 ++++++++++++++++++
 .../recipes-devtools/python/python3_3.8.13.bb |   1 +
 2 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2021-28861.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2021-28861.patch b/meta/recipes-devtools/python/python3/CVE-2021-28861.patch
new file mode 100644
index 0000000000..dc97c6b4eb
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2021-28861.patch
@@ -0,0 +1,135 @@
+From 4dc2cae3abd75f386374d0635d00443b897d0672 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Wed, 22 Jun 2022 01:42:52 -0700
+Subject: [PATCH] gh-87389: Fix an open redirection vulnerability in
+ http.server. (GH-93879) (GH-94094)
+
+Fix an open redirection vulnerability in the `http.server` module when
+an URI path starts with `//` that could produce a 301 Location header
+with a misleading target.  Vulnerability discovered, and logic fix
+proposed, by Hamza Avvan (@hamzaavvan).
+
+Test and comments authored by Gregory P. Smith [Google].
+(cherry picked from commit 4abab6b603dd38bec1168e9a37c40a48ec89508e)
+
+Co-authored-by: Gregory P. Smith <greg@krypto.org>
+
+Signed-off-by: Riyaz Khan <Riyaz.Khan@kpit.com>
+
+CVE: CVE-2021-28861
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/4dc2cae3abd75f386374d0635d00443b897d0672]
+
+---
+ Lib/http/server.py                            |  7 +++
+ Lib/test/test_httpservers.py                  | 53 ++++++++++++++++++-
+ ...2-06-15-20-09-23.gh-issue-87389.QVaC3f.rst |  3 ++
+ 3 files changed, 61 insertions(+), 2 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2022-06-15-20-09-23.gh-issue-87389.QVaC3f.rst
+
+diff --git a/Lib/http/server.py b/Lib/http/server.py
+index 38f7accad7a3..39de35458c38 100644
+--- a/Lib/http/server.py
++++ b/Lib/http/server.py
+@@ -332,6 +332,13 @@ def parse_request(self):
+                 return False
+         self.command, self.path = command, path
+ 
++        # gh-87389: The purpose of replacing '//' with '/' is to protect
++        # against open redirect attacks possibly triggered if the path starts
++        # with '//' because http clients treat //path as an absolute URI
++        # without scheme (similar to http://path) rather than a path.
++        if self.path.startswith('//'):
++            self.path = '/' + self.path.lstrip('/')  # Reduce to a single /
++
+         # Examine the headers and look for a Connection directive.
+         try:
+             self.headers = http.client.parse_headers(self.rfile,
+diff --git a/Lib/test/test_httpservers.py b/Lib/test/test_httpservers.py
+index 87d4924a34b3..fb026188f0b4 100644
+--- a/Lib/test/test_httpservers.py
++++ b/Lib/test/test_httpservers.py
+@@ -330,7 +330,7 @@ class request_handler(NoLogRequestHandler, SimpleHTTPRequestHandler):
+         pass
+ 
+     def setUp(self):
+-        BaseTestCase.setUp(self)
++        super().setUp()
+         self.cwd = os.getcwd()
+         basetempdir = tempfile.gettempdir()
+         os.chdir(basetempdir)
+@@ -358,7 +358,7 @@ def tearDown(self):
+             except:
+                 pass
+         finally:
+-            BaseTestCase.tearDown(self)
++            super().tearDown()
+ 
+     def check_status_and_reason(self, response, status, data=None):
+         def close_conn():
+@@ -414,6 +414,55 @@ def test_undecodable_filename(self):
+         self.check_status_and_reason(response, HTTPStatus.OK,
+                                      data=support.TESTFN_UNDECODABLE)
+ 
++    def test_get_dir_redirect_location_domain_injection_bug(self):
++        """Ensure //evil.co/..%2f../../X does not put //evil.co/ in Location.
++
++        //netloc/ in a Location header is a redirect to a new host.
++        https://github.com/python/cpython/issues/87389
++
++        This checks that a path resolving to a directory on our server cannot
++        resolve into a redirect to another server.
++        """
++        os.mkdir(os.path.join(self.tempdir, 'existing_directory'))
++        url = f'/python.org/..%2f..%2f..%2f..%2f..%2f../%0a%0d/../{self.tempdir_name}/existing_directory'
++        expected_location = f'{url}/'  # /python.org.../ single slash single prefix, trailing slash
++        # Canonicalizes to /tmp/tempdir_name/existing_directory which does
++        # exist and is a dir, triggering the 301 redirect logic.
++        response = self.request(url)
++        self.check_status_and_reason(response, HTTPStatus.MOVED_PERMANENTLY)
++        location = response.getheader('Location')
++        self.assertEqual(location, expected_location, msg='non-attack failed!')
++
++        # //python.org... multi-slash prefix, no trailing slash
++        attack_url = f'/{url}'
++        response = self.request(attack_url)
++        self.check_status_and_reason(response, HTTPStatus.MOVED_PERMANENTLY)
++        location = response.getheader('Location')
++        self.assertFalse(location.startswith('//'), msg=location)
++        self.assertEqual(location, expected_location,
++                msg='Expected Location header to start with a single / and '
++                'end with a / as this is a directory redirect.')
++
++        # ///python.org... triple-slash prefix, no trailing slash
++        attack3_url = f'//{url}'
++        response = self.request(attack3_url)
++        self.check_status_and_reason(response, HTTPStatus.MOVED_PERMANENTLY)
++        self.assertEqual(response.getheader('Location'), expected_location)
++
++        # If the second word in the http request (Request-URI for the http
++        # method) is a full URI, we don't worry about it, as that'll be parsed
++        # and reassembled as a full URI within BaseHTTPRequestHandler.send_head
++        # so no errant scheme-less //netloc//evil.co/ domain mixup can happen.
++        attack_scheme_netloc_2slash_url = f'https://pypi.org/{url}'
++        expected_scheme_netloc_location = f'{attack_scheme_netloc_2slash_url}/'
++        response = self.request(attack_scheme_netloc_2slash_url)
++        self.check_status_and_reason(response, HTTPStatus.MOVED_PERMANENTLY)
++        location = response.getheader('Location')
++        # We're just ensuring that the scheme and domain make it through, if
++        # there are or aren't multiple slashes at the start of the path that
++        # follows that isn't important in this Location: header.
++        self.assertTrue(location.startswith('https://pypi.org/'), msg=location)
++
+     def test_get(self):
+         #constructs the path relative to the root directory of the HTTPServer
+         response = self.request(self.base_url + '/test')
+diff --git a/Misc/NEWS.d/next/Security/2022-06-15-20-09-23.gh-issue-87389.QVaC3f.rst b/Misc/NEWS.d/next/Security/2022-06-15-20-09-23.gh-issue-87389.QVaC3f.rst
+new file mode 100644
+index 000000000000..029d437190de
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2022-06-15-20-09-23.gh-issue-87389.QVaC3f.rst
+@@ -0,0 +1,3 @@
++:mod:`http.server`: Fix an open redirection vulnerability in the HTTP server
++when an URI path starts with ``//``.  Vulnerability discovered, and initial
++fix proposed, by Hamza Avvan.
diff --git a/meta/recipes-devtools/python/python3_3.8.13.bb b/meta/recipes-devtools/python/python3_3.8.13.bb
index 040bacf97c..d87abe2351 100644
--- a/meta/recipes-devtools/python/python3_3.8.13.bb
+++ b/meta/recipes-devtools/python/python3_3.8.13.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://makerace.patch \
+           file://CVE-2021-28861.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.17.1


