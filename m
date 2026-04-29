Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF39FF8867
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 09:13:15 +0000 (UTC)
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7155.1777453987900603845
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 02:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YPG1v4y7;
 spf=pass (domain: mvista.com, ip: 74.125.82.42, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12db7bf1541so10000851c88.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 02:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1777453987; x=1778058787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZzZTwK/XzuU4f9Mw5GS9SWqMrOoJrNoV9Zb+TeZezOs=;
        b=YPG1v4y7KBDk90wh1sh/N4DJwlnhiv0Dhz2cxO0C9FlIwGu430Cq2bGTJS+BPJ/faC
         F0jImH9cMcEKSuipn2/oOtOPinhcicmDiDidiw8oN1QbaDxFCJ4FkCzp0H3xALOkDFTW
         NMuiEJWpQufY5Il4SITqolP2OnrSc00T6Pqe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453987; x=1778058787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzZTwK/XzuU4f9Mw5GS9SWqMrOoJrNoV9Zb+TeZezOs=;
        b=bi8wHC8fsWLph7BdwqudIlA4q/KRZ2al8mAV4fNLbdBr7Q5X0W2OTEkcQ5nb2jOoNx
         5/5l5/pJotjXqe1qOIsESG1d56tM3TXAxAqEld1SJDgxu7vVZTkvkmIpAE1C7D7v65fA
         ZjB5V0uxSaK7XImpHQN8fjo8vAARllFIiQ5VJyGiYCP8n9oo1UETjJ/CpI6YA3Qaja9K
         h7MM3QDxO2FlK7wtkmm+fPCRzIcI41ifFKtSBStM3rn6zysRDgSF3KZppGOIKclo6WsO
         wGIls1Phl61rc3VZlT0xuXMq/E+O37l6Qe8KxFVG9WjAzcSN1N62NJGNq4svh28KxiMT
         M+0g==
X-Gm-Message-State: AOJu0Yyl8Sth1QsqH3FizbbYaHm9tO2Sl2RXgC7Kbs1QuZvm3UY7piGf
	6iIOGwmnoTMEXRuxcNzFqlLP2vvOgggasyuXWQsS2WQ0ehtVBfhN9/1NGal/DPpo5u0ydgDQQLj
	BM96L
X-Gm-Gg: AeBDies+lBP/fcPNYhAynPk7e2qkIhBSOnl5lBZgSQgtI5w2iR4IXBZIDDQm+JGI6Wx
	iLAIT2duXOjNJeqAv5Y9B6nR+b3DkEjDH46NqFDYlYGb0qBsCTdgiPLOJVzY9KZgfvePB0F7tqc
	jatOM/UpiurWyCC4xEDYFkbfkmtRKXNz2LG2VLIHCfNAETA9R3/pvCv9vRpEH9b0jsxETaCa5va
	kX46CC/yDJqwkuFn7hlfQ1HvKOq1mvSpcQoswD5AVyL3cZ1cCJZ8HoQHRxrah+Vx/XkK1OB4KZK
	X6zJD60GaL46WNXQ85pYyf+DX0+/OYmO5RjyQN+LijFID4ZmKvaatqVESDqCmsIAeFUprdayS3w
	TtQRi6U16x9lOlfwkfZrc0XSGwfB17KV5v1xCZzQZLtyia8Hf+pLCZC1BeLKWdV2VbiPwgac8bt
	6P8KFqwf2c/dgkGebN4s2KRpOwfCFzem7XQSVGhUCFdgIiqd0=
X-Received: by 2002:a05:7022:ec4:b0:12a:713b:896a with SMTP id a92af1059eb24-12ddd9c76a1mr2990239c88.17.1777453986768;
        Wed, 29 Apr 2026 02:13:06 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de3261533sm1806197c88.9.2026.04.29.02.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 02:13:06 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] python3: fix for CVE-2026-1502
Date: Wed, 29 Apr 2026 14:42:55 +0530
Message-ID: <20260429091256.301317-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236090

Pick patch from [1] also mentioned at NVD report in [2]

[1] https://github.com/python/cpython/commit/05ed7ce7ae9e17c23a04085b2539fe6d6d3cef69
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-1502
[3] https://security-tracker.debian.org/tracker/CVE-2026-1502

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../python/python3/CVE-2026-1502.patch        | 113 ++++++++++++++++++
 .../python/python3_3.12.13.bb                 |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-1502.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-1502.patch b/meta/recipes-devtools/python/python3/CVE-2026-1502.patch
new file mode 100644
index 0000000000..be6a8379a8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-1502.patch
@@ -0,0 +1,113 @@
+From 05ed7ce7ae9e17c23a04085b2539fe6d6d3cef69 Mon Sep 17 00:00:00 2001
+From: Seth Larson <seth@python.org>
+Date: Fri, 10 Apr 2026 10:21:42 -0500
+Subject: [PATCH] gh-146211: Reject CR/LF in HTTP tunnel request headers
+ (#146212)
+
+Co-authored-by: Illia Volochii <illia.volochii@gmail.com>
+
+CVE: CVE-2026-1502
+Upstream-Status: Backport [https://github.com/python/cpython/commit/05ed7ce7ae9e17c23a04085b2539fe6d6d3cef69]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ Lib/http/client.py                            | 11 ++++-
+ Lib/test/test_httplib.py                      | 45 +++++++++++++++++++
+ ...-03-20-09-29-42.gh-issue-146211.PQVbs7.rst |  2 +
+ 3 files changed, 57 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-03-20-09-29-42.gh-issue-146211.PQVbs7.rst
+
+diff --git a/Lib/http/client.py b/Lib/http/client.py
+index 70451d6..7db4807 100644
+--- a/Lib/http/client.py
++++ b/Lib/http/client.py
+@@ -972,13 +972,22 @@ class HTTPConnection:
+         return ip
+ 
+     def _tunnel(self):
++        if _contains_disallowed_url_pchar_re.search(self._tunnel_host):
++            raise ValueError('Tunnel host can\'t contain control characters %r'
++                             % (self._tunnel_host,))
+         connect = b"CONNECT %s:%d %s\r\n" % (
+             self._wrap_ipv6(self._tunnel_host.encode("idna")),
+             self._tunnel_port,
+             self._http_vsn_str.encode("ascii"))
+         headers = [connect]
+         for header, value in self._tunnel_headers.items():
+-            headers.append(f"{header}: {value}\r\n".encode("latin-1"))
++            header_bytes = header.encode("latin-1")
++            value_bytes = value.encode("latin-1")
++            if not _is_legal_header_name(header_bytes):
++                raise ValueError('Invalid header name %r' % (header_bytes,))
++            if _is_illegal_header_value(value_bytes):
++                raise ValueError('Invalid header value %r' % (value_bytes,))
++            headers.append(b"%s: %s\r\n" % (header_bytes, value_bytes))
+         headers.append(b"\r\n")
+         # Making a single send() call instead of one per line encourages
+         # the host OS to use a more optimal packet size instead of
+diff --git a/Lib/test/test_httplib.py b/Lib/test/test_httplib.py
+index e46dac0..e027d93 100644
+--- a/Lib/test/test_httplib.py
++++ b/Lib/test/test_httplib.py
+@@ -369,6 +369,51 @@ class HeaderTests(TestCase):
+                 with self.assertRaisesRegex(ValueError, 'Invalid header'):
+                     conn.putheader(name, value)
+ 
++    def test_invalid_tunnel_headers(self):
++        cases = (
++            ('Invalid\r\nName', 'ValidValue'),
++            ('Invalid\rName', 'ValidValue'),
++            ('Invalid\nName', 'ValidValue'),
++            ('\r\nInvalidName', 'ValidValue'),
++            ('\rInvalidName', 'ValidValue'),
++            ('\nInvalidName', 'ValidValue'),
++            (' InvalidName', 'ValidValue'),
++            ('\tInvalidName', 'ValidValue'),
++            ('Invalid:Name', 'ValidValue'),
++            (':InvalidName', 'ValidValue'),
++            ('ValidName', 'Invalid\r\nValue'),
++            ('ValidName', 'Invalid\rValue'),
++            ('ValidName', 'Invalid\nValue'),
++            ('ValidName', 'InvalidValue\r\n'),
++            ('ValidName', 'InvalidValue\r'),
++            ('ValidName', 'InvalidValue\n'),
++        )
++        for name, value in cases:
++            with self.subTest((name, value)):
++                conn = client.HTTPConnection('example.com')
++                conn.set_tunnel('tunnel', headers={
++                    name: value
++                })
++                conn.sock = FakeSocket('')
++                with self.assertRaisesRegex(ValueError, 'Invalid header'):
++                    conn._tunnel()  # Called in .connect()
++
++    def test_invalid_tunnel_host(self):
++        cases = (
++            'invalid\r.host',
++            '\ninvalid.host',
++            'invalid.host\r\n',
++            'invalid.host\x00',
++            'invalid host',
++        )
++        for tunnel_host in cases:
++            with self.subTest(tunnel_host):
++                conn = client.HTTPConnection('example.com')
++                conn.set_tunnel(tunnel_host)
++                conn.sock = FakeSocket('')
++                with self.assertRaisesRegex(ValueError, 'Tunnel host can\'t contain control characters'):
++                    conn._tunnel()  # Called in .connect()
++
+     def test_headers_debuglevel(self):
+         body = (
+             b'HTTP/1.1 200 OK\r\n'
+diff --git a/Misc/NEWS.d/next/Security/2026-03-20-09-29-42.gh-issue-146211.PQVbs7.rst b/Misc/NEWS.d/next/Security/2026-03-20-09-29-42.gh-issue-146211.PQVbs7.rst
+new file mode 100644
+index 0000000..4993633
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-03-20-09-29-42.gh-issue-146211.PQVbs7.rst
+@@ -0,0 +1,2 @@
++Reject CR/LF characters in tunnel request headers for the
++HTTPConnection.set_tunnel() method.
+-- 
+2.50.1
+
diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes-devtools/python/python3_3.12.13.bb
index 5fa25235fe..da7e3c604e 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
+           file://CVE-2026-1502.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.50.1


