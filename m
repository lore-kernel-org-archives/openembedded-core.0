Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531D6C54EE9
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 02:26:10 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.1765.1663122366454012307
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=At6GNe/0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id w2so3221440pfb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=1yCa51akGKnVw5PS3ty5ceOLJsCWaIhv/ZcHwT0uwi8=;
        b=At6GNe/0uikfYcbRpU8sNZrw/SH1Fqv2LriXvIsv+lS0bLOXz1J69jLJkzu87RKZEO
         isbc1R8MwZcPR3o7/FWWzbCGD2LtQ9PW4Xhm0VHTHrnssaB92VoV+QJd0NLVDOKQ+Pyz
         xPoZ9YKxQwcoW+Ecpoo3HUJxuyQl/xxNmszj6hLA244nCLJHLugFykqIr1qSm9Zsr06j
         uMGcgGpPq9MgzmZj3qOzHVnoeeALlsC30idKKj98grBIskaxnC2f+9l6Y8v7PPOs0Wq7
         bIbbJPrU7jiPf53/UO2ucZT4PL3aiEsjKFqTCmqEz6x6Tln93c9hLRihr6isPorFy7bX
         mQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1yCa51akGKnVw5PS3ty5ceOLJsCWaIhv/ZcHwT0uwi8=;
        b=gEHzpHsJY1FdsKcwYcWkx/hiTlNN30W42pHDlq54O+Mt5EWJu6rIrybyRz86hidoAW
         wPhS/PfYBGqQrxE8P8eM2B/Cto0PACho3pluOtiaLa7IRvZRyQDO3EtFzLNDRRnq5NJK
         uRsgGB7rrxmgi5mRIBiT7spkwguZyLwRY8MPZIK7rlf1eK51qQKKQjsdhdM54mf+oYEO
         DkXVs8DLlPAf1du8WYSui9xhDFTAb0kzMxi+EAjyj2Asw6RF1xlCpjZQXMWR5X9+j2t6
         kDSq7cWKjLcJ1i1qaNiWQh4ycBjB9TDvaTrLg64lWcsa6tmqDZI/09RKfisHGO0yltvK
         aEiQ==
X-Gm-Message-State: ACgBeo2mZwopN8np+eWOH1FcQnLKKFzAxUPQRldjP3JoT6RZy77tvElf
	K5OWAHVrKllnCg/FmhwAdEL/JtQJ+6TfDu2q
X-Google-Smtp-Source: 
 AA6agR7RPdCvSIIGhCei4VllH31uiutbaIZ47+bXCOAhRQ2nSPhf1+jYzHTP8ykKhf3vzDTI+GqXdw==
X-Received: by 2002:a63:db07:0:b0:439:2e24:df01 with SMTP id
 e7-20020a63db07000000b004392e24df01mr7695853pgg.221.1663122365130;
        Tue, 13 Sep 2022 19:26:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s14-20020a65644e000000b00438fe64d61esm5259871pgv.0.2022.09.13.19.26.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 19:26:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/9] python3: Fix CVE-2021-28861 for python3
Date: Tue, 13 Sep 2022 16:25:11 -1000
Message-Id: 
 <cbf57b25c78ea9d56863d9546b51fc2c88adb8cf.1663122098.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663122098.git.steve@sakoman.com>
References: <cover.1663122098.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 02:26:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170619

From: "Khan@kpit.com" <Khan@kpit.com>

Add patch to fix CVE-2021-28861

CVE-2021-28861.patch
Link: https://github.com/python/cpython/commit/4dc2cae3abd75f386374d0635d00443b897d0672

Signed-off-by: Riyaz Khan <rak3033@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


