Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D11EC83005
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 16:03:07 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.39222.1686499384505909072
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 09:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=qbuSuCot;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1b3d0b33dc2so632265ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 09:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686499383; x=1689091383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SqHyeOnHhE9uq7xbu7Qvcc3UxydwvUrhXINC/r2jjEY=;
        b=qbuSuCotD9BT3VWr1O46w5CQJPzYE3I/O1e6XNgXXTCLWPLoMtJsqQR6pTwWAXu97/
         YE/js7fP/qj7yPb+yYwBpx4hOz+l6qJ6jzayxdqKF/f2cifIa04WSct0yHZ09H2f6fXO
         MFxYtkTSKTkKbpY6uhhEFDtn2teGwsIkMKoNUXRH73FyYqN5wddi5jJO33xqjtGzGcqX
         4s1cpe9osN4cUuKavqAsyWKzVFRCmYYTsJPQogZZW6PHh8jG33uTcRxsMJ70WIr6c0tj
         ST0s1Jh/cntdIRsSqFi9DZJ/NAFQJifWjtwukEYG6mkOWs8Ey2sXyhvEnuB1IHalOdc2
         UbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686499383; x=1689091383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqHyeOnHhE9uq7xbu7Qvcc3UxydwvUrhXINC/r2jjEY=;
        b=hL5bSHvF3m3tuNv91eTF2R0zO0iyqJneLQgwhxywVZtgOrrxS4JySYbM9Xj3WTgP0B
         rJzcEaV9OxPZH5xGOsaaIVfrIOFh9bvxP4g6ClX7ccIf4rhMT592oWGo/nXKSAbl/1zz
         gWi65B1qRzwaKEmHSIL5IrHh1/oiliRHepzwI51LWpoAwTtOBZ0SGBU2hPT0Z9pnDBns
         B70YBtOUmebQka7lkaUuHkFZdNkRoTJ/e78qDprxwizRW3QJgfcBRNvDAnS/If1ySaeh
         7Qh6q9x8jFTPLnu5iW27zSWWidABpd6tIZoZ1STwF0xnDzDUyfnQvKm6QCQpIe1EuL12
         tb2A==
X-Gm-Message-State: AC+VfDxaivJqkOLzabufZZTmvfhDn3DivR3BMOzzs6MesmDl8sEulyCH
	wzhgMrdlstqXlLvJcjNEYJqslXSUKM+9A6iZqfY=
X-Google-Smtp-Source: ACHHUZ4dlHa7BnBS63jKcVvrX6ssvP9mwA7zLibs4BAFsW2nKuvsehaQQ0yAErRDsLcADYSdL4HjuA==
X-Received: by 2002:a17:903:11c3:b0:1b0:45e:fb02 with SMTP id q3-20020a17090311c300b001b0045efb02mr4615330plh.35.1686499383448;
        Sun, 11 Jun 2023 09:03:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ix4-20020a170902f80400b001b3d20ef257sm113378plb.97.2023.06.11.09.03.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 09:03:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/11] python3-requests: fix for CVE-2023-32681
Date: Sun, 11 Jun 2023 06:02:39 -1000
Message-Id: <e806c625d9a7eb08079a3268d2d8b20b582d0b6c.1686499221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686499221.git.steve@sakoman.com>
References: <cover.1686499221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 16:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182628

From: Narpat Mali <narpat.mali@windriver.com>

Requests is a HTTP library. Since Requests 2.3.0, Requests has been leaking
Proxy-Authorization headers to destination servers when redirected to an HTTPS
endpoint. This is a product of how we use `rebuild_proxies` to reattach the
`Proxy-Authorization` header to requests. For HTTP connections sent through the
tunnel, the proxy will identify the header in the request itself and remove it
prior to forwarding to the destination server. However when sent over HTTPS,
the `Proxy-Authorization` header must be sent in the CONNECT request as the proxy
has no visibility into the tunneled request. This results in Requests forwarding
proxy credentials to the destination server unintentionally, allowing a malicious
actor to potentially exfiltrate sensitive information. This issue has been patched
in version 2.31.0.

Reference: https://github.com/advisories/GHSA-j8r2-6x86-q33q

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python3-requests/CVE-2023-32681.patch     | 63 +++++++++++++++++++
 .../python/python3-requests_2.27.1.bb         |  2 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-requests/CVE-2023-32681.patch

diff --git a/meta/recipes-devtools/python/python3-requests/CVE-2023-32681.patch b/meta/recipes-devtools/python/python3-requests/CVE-2023-32681.patch
new file mode 100644
index 0000000000..35b4241bde
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-requests/CVE-2023-32681.patch
@@ -0,0 +1,63 @@
+From cd0128c0becd8729d0f8733bf42fbd333d51f833 Mon Sep 17 00:00:00 2001
+From: Nate Prewitt <nate.prewitt@gmail.com>
+Date: Mon, 5 Jun 2023 09:31:36 +0000
+Subject: [PATCH] Merge pull request from GHSA-j8r2-6x86-q33q
+
+CVE: CVE-2023-32681
+
+Upstream-Status: Backport [https://github.com/psf/requests/commit/74ea7cf7a6a27a4eeb2ae24e162bcc942a6706d5]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ requests/sessions.py   |  4 +++-
+ tests/test_requests.py | 20 ++++++++++++++++++++
+ 2 files changed, 23 insertions(+), 1 deletion(-)
+
+diff --git a/requests/sessions.py b/requests/sessions.py
+index 3f59cab..648cffa 100644
+--- a/requests/sessions.py
++++ b/requests/sessions.py
+@@ -293,7 +293,9 @@ class SessionRedirectMixin(object):
+         except KeyError:
+             username, password = None, None
+
+-        if username and password:
++        # urllib3 handles proxy authorization for us in the standard adapter.
++        # Avoid appending this to TLS tunneled requests where it may be leaked.
++        if not scheme.startswith('https') and username and password:
+             headers['Proxy-Authorization'] = _basic_auth_str(username, password)
+
+         return new_proxies
+diff --git a/tests/test_requests.py b/tests/test_requests.py
+index 29b3aca..6a37777 100644
+--- a/tests/test_requests.py
++++ b/tests/test_requests.py
+@@ -601,6 +601,26 @@ class TestRequests:
+
+         assert sent_headers.get("Proxy-Authorization") == proxy_auth_value
+
++
++    @pytest.mark.parametrize(
++        "url,has_proxy_auth",
++        (
++            ('http://example.com', True),
++            ('https://example.com', False),
++        ),
++    )
++    def test_proxy_authorization_not_appended_to_https_request(self, url, has_proxy_auth):
++        session = requests.Session()
++        proxies = {
++            'http': 'http://test:pass@localhost:8080',
++            'https': 'http://test:pass@localhost:8090',
++        }
++        req = requests.Request('GET', url)
++        prep = req.prepare()
++        session.rebuild_proxies(prep, proxies)
++
++        assert ('Proxy-Authorization' in prep.headers) is has_proxy_auth
++
+     def test_basicauth_with_netrc(self, httpbin):
+         auth = ('user', 'pass')
+         wrong_auth = ('wronguser', 'wrongpass')
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3-requests_2.27.1.bb b/meta/recipes-devtools/python/python3-requests_2.27.1.bb
index af52b7caf5..635a6af31f 100644
--- a/meta/recipes-devtools/python/python3-requests_2.27.1.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.27.1.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
+SRC_URI += "file://CVE-2023-32681.patch"
+
 SRC_URI[sha256sum] = "68d7c56fd5a8999887728ef304a6d12edc7be74f1cfa47714fc8b414525c9a61"
 
 inherit pypi setuptools3
-- 
2.34.1


