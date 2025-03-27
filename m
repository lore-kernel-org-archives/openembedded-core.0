Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588EEC36010
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 14:43:50 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.51662.1743086623943678571
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 07:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YG67t9zM;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-225477548e1so22163735ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 07:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743086623; x=1743691423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qB11DrYWJEi09Ot+hMG0UT8u0G/eLePuoBJcjaUS/vQ=;
        b=YG67t9zMMsYETJp5qad2zfr7LfoXX6qP764QucKrusZ9Ewc4ROgUnz2DL8fqnASB5W
         L6r++Wyz29csopxgokUxkHJ1M1/VBgJ4VP2AUdYhPNiNAcSKahdTZDNaRGV5d5orduO1
         wzwvSqGwHTyDL7bt0OQd1pfR3L2ZSlJtNitkLGRDjxP2RrJIwD4dB+Mh0+4wRR2UTMEi
         oY8t5WqjHWLempk6tmp03hjcpS0spTOsNnO/+a3zdZkoux09x9MkzYAzs0khiSQhzDQ1
         v3OHA9dARG4feYcB00EK/RQTrb0LyBMuADA1x0TwW/TvF+SHS1VluujIfQrQYJV+ifW8
         VOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743086623; x=1743691423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qB11DrYWJEi09Ot+hMG0UT8u0G/eLePuoBJcjaUS/vQ=;
        b=Dvt6cFwbeNYVuOGpcGy11BQBZuogvNDhRCJ1Za5IZoohbUD8DtCPTO5x+mF/weskpg
         3KXSE+AVFZNtNfkDd4oQ/xP6aL1njEcvdZo8uuHv+MFrm/Mu4ZYKqsQoToqjU0VPobtW
         YdpIvuWF7YzSO6m7yUiogINFRHrrpQh+wGkpn0ixRRitaUz7MoScYgIKsMY5aUYfmyZP
         zq4FDwGE3cOgN3YfO8yInX4XYhI2sjvBeIp5uT1Ti7EmK4inKiaIZaRTYR06EZHDkSnJ
         IPFo3cfdAiavDBp7j4o09X3D7bo0Amu0OFokBkL/XdZRCHk2/HIDGHAr1/JykyQ/7hGS
         GPkQ==
X-Gm-Message-State: AOJu0Yxh83l/z+bOeUh6iwi1bO0Hj4Cvj6etHwoCZ7fqXH44m5ynvB5e
	fXIZPlaoUprOrROvLNsCeliz68/LTIo0ne3P6TDsntF2SNcYdDp6udtWyom3q9/zx5qhtqDH1Q5
	w
X-Gm-Gg: ASbGnctYa+n2BPkremdH2r45v5TS9hKf+SMaUwprOGEzAY2e4raLqk0ebLfhBwIpQRY
	xnXs9aIaRESFaWrIoopwodeLY0tawWixw/ERCPcKPjTS7DgNSh9QfzYFIZpVLfxt+RJUWy/Al57
	sFcRJO9viG2DgBPHHfoOqU7uVlo3ufMO+e+OxfN9e4foC6pMYxaoMGaySt8MRAkmyDgE1kkv5O9
	0+4NQ+8XH4YvXRITxMpEVxDdqKn9pYTbsP386JhpAueTYylQL/9+s0nUoMxE5MfSU+4Cro17KdV
	n/E/9Q9uSwUF5WHaONqcK2zYysjzoILhu8g=
X-Google-Smtp-Source: AGHT+IHvJNjbd4uVTO4Bdjcep9gaqLibbmBOtzisA9Oxj/B45J+NqPa2WIoQxDhv43ZTnyXBCw42Yg==
X-Received: by 2002:a05:6a00:3cd0:b0:736:362a:6fc8 with SMTP id d2e1a72fcca58-7396109ab5cmr4523854b3a.15.1743086622642;
        Thu, 27 Mar 2025 07:43:42 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:811c:968e:2c1:6363])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390618e5absm14819074b3a.175.2025.03.27.07.43.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:43:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/4] python3: patch CVE-2025-0938
Date: Thu, 27 Mar 2025 07:43:27 -0700
Message-ID: <70036b4ea0ab968adab82fc632bb967f95203de2.1743086467.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743086467.git.steve@sakoman.com>
References: <cover.1743086467.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213754

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned in NDV CVE report
https://github.com/python/cpython/commit/b8b4b713c5f8ec0958c7ef8d29d6711889bc94ab
which is on 3.10 branch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/CVE-2025-0938.patch        | 131 ++++++++++++++++++
 .../python/python3_3.10.16.bb                 |   1 +
 2 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-0938.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-0938.patch b/meta/recipes-devtools/python/python3/CVE-2025-0938.patch
new file mode 100644
index 0000000000..5730008f4b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2025-0938.patch
@@ -0,0 +1,131 @@
+From b8b4b713c5f8ec0958c7ef8d29d6711889bc94ab Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Wed, 19 Feb 2025 14:36:23 +0100
+Subject: [PATCH] [3.10] gh-105704: Disallow square brackets (`[` and `]`) in
+ domain names for parsed URLs (GH-129418) (#129529)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+(cherry picked from commit d89a5f6a6e65511a5f6e0618c4c30a7aa5aba56a)
+
+Co-authored-by: Seth Michael Larson <seth@python.org>
+Co-authored-by: Peter Bierma <zintensitydev@gmail.com>
+Co-authored-by: Łukasz Langa <lukasz@langa.pl>
+
+CVE: CVE-2025-0938
+Upstream-Status: Backport [https://github.com/python/cpython/commit/b8b4b713c5f8ec0958c7ef8d29d6711889bc94ab]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ Lib/test/test_urlparse.py                     | 37 ++++++++++++++++++-
+ Lib/urllib/parse.py                           | 20 +++++++++-
+ ...-01-28-14-08-03.gh-issue-105704.EnhHxu.rst |  4 ++
+ 3 files changed, 58 insertions(+), 3 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2025-01-28-14-08-03.gh-issue-105704.EnhHxu.rst
+
+diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
+index f2ffc452e5..280644ef0b 100644
+--- a/Lib/test/test_urlparse.py
++++ b/Lib/test/test_urlparse.py
+@@ -1149,16 +1149,51 @@ class UrlParseTestCase(unittest.TestCase):
+         self.assertRaises(ValueError, urllib.parse.urlsplit, 'Scheme://user@[0439:23af::2309::fae7:1234]/Path?Query')
+         self.assertRaises(ValueError, urllib.parse.urlsplit, 'Scheme://user@[0439:23af:2309::fae7:1234:2342:438e:192.0.2.146]/Path?Query')
+         self.assertRaises(ValueError, urllib.parse.urlsplit, 'Scheme://user@]v6a.ip[/Path')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[v6a.ip]')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[v6a.ip].suffix')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[v6a.ip]/')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[v6a.ip].suffix/')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[v6a.ip]?')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[v6a.ip].suffix?')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[::1].suffix')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]/')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[::1].suffix/')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]?')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[::1].suffix?')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]:a')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[::1].suffix:a')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]:a1')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[::1].suffix:a1')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]:1a')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[::1].suffix:1a')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]:')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[::1].suffix:/')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]:?')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://user@prefix.[v6a.ip]')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://user@[v6a.ip].suffix')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[v6a.ip')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://v6a.ip]')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://]v6a.ip[')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://]v6a.ip')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://v6a.ip[')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[v6a.ip')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://v6a.ip].suffix')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix]v6a.ip[suffix')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix]v6a.ip')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://v6a.ip[suffix')
+ 
+     def test_splitting_bracketed_hosts(self):
+-        p1 = urllib.parse.urlsplit('scheme://user@[v6a.ip]/path?query')
++        p1 = urllib.parse.urlsplit('scheme://user@[v6a.ip]:1234/path?query')
+         self.assertEqual(p1.hostname, 'v6a.ip')
+         self.assertEqual(p1.username, 'user')
+         self.assertEqual(p1.path, '/path')
++        self.assertEqual(p1.port, 1234)
+         p2 = urllib.parse.urlsplit('scheme://user@[0439:23af:2309::fae7%test]/path?query')
+         self.assertEqual(p2.hostname, '0439:23af:2309::fae7%test')
+         self.assertEqual(p2.username, 'user')
+         self.assertEqual(p2.path, '/path')
++        self.assertIs(p2.port, None)
+         p3 = urllib.parse.urlsplit('scheme://user@[0439:23af:2309::fae7:1234:192.0.2.146%test]/path?query')
+         self.assertEqual(p3.hostname, '0439:23af:2309::fae7:1234:192.0.2.146%test')
+         self.assertEqual(p3.username, 'user')
+diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py
+index 07e3248504..e1ee36d98e 100644
+--- a/Lib/urllib/parse.py
++++ b/Lib/urllib/parse.py
+@@ -442,6 +442,23 @@ def _checknetloc(netloc):
+             raise ValueError("netloc '" + netloc + "' contains invalid " +
+                              "characters under NFKC normalization")
+ 
++def _check_bracketed_netloc(netloc):
++    # Note that this function must mirror the splitting
++    # done in NetlocResultMixins._hostinfo().
++    hostname_and_port = netloc.rpartition('@')[2]
++    before_bracket, have_open_br, bracketed = hostname_and_port.partition('[')
++    if have_open_br:
++        # No data is allowed before a bracket.
++        if before_bracket:
++            raise ValueError("Invalid IPv6 URL")
++        hostname, _, port = bracketed.partition(']')
++        # No data is allowed after the bracket but before the port delimiter.
++        if port and not port.startswith(":"):
++            raise ValueError("Invalid IPv6 URL")
++    else:
++        hostname, _, port = hostname_and_port.partition(':')
++    _check_bracketed_host(hostname)
++
+ # Valid bracketed hosts are defined in
+ # https://www.rfc-editor.org/rfc/rfc3986#page-49 and https://url.spec.whatwg.org/
+ def _check_bracketed_host(hostname):
+@@ -505,8 +522,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
+                 (']' in netloc and '[' not in netloc)):
+             raise ValueError("Invalid IPv6 URL")
+         if '[' in netloc and ']' in netloc:
+-            bracketed_host = netloc.partition('[')[2].partition(']')[0]
+-            _check_bracketed_host(bracketed_host)
++            _check_bracketed_netloc(netloc)
+     if allow_fragments and '#' in url:
+         url, fragment = url.split('#', 1)
+     if '?' in url:
+diff --git a/Misc/NEWS.d/next/Security/2025-01-28-14-08-03.gh-issue-105704.EnhHxu.rst b/Misc/NEWS.d/next/Security/2025-01-28-14-08-03.gh-issue-105704.EnhHxu.rst
+new file mode 100644
+index 0000000000..bff1bc6b0d
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2025-01-28-14-08-03.gh-issue-105704.EnhHxu.rst
+@@ -0,0 +1,4 @@
++When using :func:`urllib.parse.urlsplit` and :func:`urllib.parse.urlparse` host
++parsing would not reject domain names containing square brackets (``[`` and
++``]``). Square brackets are only valid for IPv6 and IPvFuture hosts according to
++`RFC 3986 Section 3.2.2 <https://www.rfc-editor.org/rfc/rfc3986#section-3.2.2>`__.
diff --git a/meta/recipes-devtools/python/python3_3.10.16.bb b/meta/recipes-devtools/python/python3_3.10.16.bb
index 48f845b089..932791f38d 100644
--- a/meta/recipes-devtools/python/python3_3.10.16.bb
+++ b/meta/recipes-devtools/python/python3_3.10.16.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
+           file://CVE-2025-0938.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.43.0


