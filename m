Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B184FCD98F0
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:39 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10389.1781682332704239236
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cu9gebDX;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso46905495e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682331; x=1782287131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3nahQx1uiEurVhRO2yoJG4QucWiYrPiB5d19YSvgn0=;
        b=cu9gebDX5S4AjQ0mFwHBYxJe/3GJ9NcDKeKJfZ6ZvRnBJwzuH3VQeKWsVvRX8Gaur1
         BwK7zXUQFna8PXm2YDVoQz/MORQJXqvF7wCEusvnTurm6/5Xjt7VIH4rT2dj4vPYWvIS
         EpR+/x/bbUV7YDfrQaf+SZ+wy68Uv9QMJHJk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682331; x=1782287131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j3nahQx1uiEurVhRO2yoJG4QucWiYrPiB5d19YSvgn0=;
        b=iykvYCRFS/sLswTDOPWidxTlwhVbUVGXaMWKZuji4I0Um1FI5dX3pZfVdXsbXznPER
         ST8WpJw/kFphn48+RCrSJtESYKJze/BuV21cDLAiiOn4yobQ+vAiIoNPuTAOtKze2j8K
         69TArmA2iDpGo+Yi8glkDSNKle8Ehl5kiJHu9D91q44wN3+Fu0/AyeSBrIZB5ftpn+lZ
         /TY6qgDPBysFLpcOyhpvJqWxZ3tKGBuqE1EFAYxY7/R7pXoivGUzUPTUAe9UliIh9V/b
         h/55qbEubuB3DpI2NUg58ELrLWPZ2ro9TQiiccT2O9tmnEuwrqlZ9HnHxH79gFsr661b
         OiSg==
X-Gm-Message-State: AOJu0Yx2cK5XN0nqHJl6q1ATZ2QM1LRoRaDjLqKdZdGXvtBv3Wz/oboC
	1FNTkVATdgY0rntZYLje6SlJoT58mml8y1t5D5alzkgjG5eTxjUenRAUNDC7lHR4NXBPCN6vutn
	IJHkA
X-Gm-Gg: Acq92OFO58cfmM0neDfnkhrBUT+DYCwsA6KYm85OYhoCQ0qBoFJEsAj6G8DupCtVq9I
	Zo7GkKZDIEqd3dCA9onIc+qAEs6xhxsocgMMjMcpjC2JhMBx1sl09C07ZF+gLXXmFv+c4AZfmk3
	XYGC0rHDf2nmwu/BfSNy8okIdOyt3zr0blDnEkfw4i10iz1uAtYuE1BO6hDvX+JLtVZCjZuWK24
	p1AW+XFtSIt58cdkkUXGZVPedTVI5e+1dtIRf7Fz0DW2SbbzwGSY4Jf3SBL+EV/Efb0voRciOoA
	1YI1b/syBvnrNVgf8hlO4rVrTeAqU+3Wpi+L26Y8bYZg4UOD/D2k7v/QmLK27XFfBKvYR4XhmD4
	ITt2vhQMkEVthIB9kQ8MFRyt+ukjTgRS4GRVtntqrSeJqCtLrLlkZYHA1CqQr+Q7JKF4zQcIo+L
	yTqxxPxxjcfWiuc3tDkus/5ENP20iwfwsG5e2QBHfYiC2tqn7WbIfi7ouiI3mTtJ28uQHuOeIGg
	LcewPmIXzTJSfqg+Q==
X-Received: by 2002:a05:600c:634e:b0:490:e170:b7ee with SMTP id 5b1f17b1804b1-492333e2ed6mr35863315e9.17.1781682330933;
        Wed, 17 Jun 2026 00:45:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/30] python3: fix for CVE-2026-1502
Date: Wed, 17 Jun 2026 09:44:43 +0200
Message-ID: <fe96d5bee9c45344e98cda9bac85c9bd853d5a7e.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238990

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] also mentioned at NVD report in [2]

[1] https://github.com/python/cpython/commit/05ed7ce7ae9e17c23a04085b2539fe6d6d3cef69
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-1502
[3] https://security-tracker.debian.org/tracker/CVE-2026-1502

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3/CVE-2026-1502.patch        | 113 ++++++++++++++++++
 .../python/python3_3.12.13.bb                 |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-1502.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-1502.patch b/meta/recipes-devtools/python/python3/CVE-2026-1502.patch
new file mode 100644
index 00000000000..be6a8379a85
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
index 5fa25235fe8..da7e3c604e0 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
+           file://CVE-2026-1502.patch \
            "
 
 SRC_URI:append:class-native = " \

