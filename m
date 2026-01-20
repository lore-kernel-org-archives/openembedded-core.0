Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E59ED2ED16
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:38:16 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6474.1768916294017131628
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:38:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=phthxzav;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee0291921so36471615e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 05:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768916292; x=1769521092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FasFGe1CH0bN58XN/2TOKNzMT14WmaWgC5QxW4PkkEQ=;
        b=phthxzaven4+j9NdeAMhfTUZ3WfTyGesAGZNCbzxzquI9UkPNbElKRMFp/luVv9pPZ
         OQZnOQYYRciVFz3tqA/1zEBUU7Y25RhOQ2RwPJERV+840KnNLeQyuNagjOqFyw/Pzl0M
         xRYOFbFbTIQaE0mPhBz4OLf4HnhbVPCenZV2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916292; x=1769521092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FasFGe1CH0bN58XN/2TOKNzMT14WmaWgC5QxW4PkkEQ=;
        b=CbxcfVn02rjmVE8Jor85NcmlTd0c+JX6B6FzEzhT/JIo8dDt6uNgDNEfKscFL6StUv
         74u8KcohGD5DB2KpKOLEAvSLV1i5sIQl6A8lc+Z3Q20nrjXVPxkuWWvIFVSIXmaFtAPW
         sJ2wpGXLSAh6DUyssAzkKoYrDoIPUiawuTWFegwZgsBvHmWKgun+HA+uh8Zs85UKUjYw
         0RfiojgDBHH2e8AzMCSrtGJ+0SUrfRUh+UD0tuOW+ZYm4oYZZZd43RATw6788G8A3IEA
         OjwHyVjz6mDZwV93G+kU/dhiq/1/9THl5WV3ZgJJbq8fXGp1z7MoMTb/eOIkdjpIVBZ5
         DNuQ==
X-Gm-Message-State: AOJu0YwCfSFOxOBnM5VYqG8TP0CqemKfWAfg93tEpl6yfIWs/cWt5Oul
	ON9+kRW5MPYJxb7/xf+KILzQH+J1sJ7WspnaVxXcugw830qaiip9ziK0BAYyb4tXm2U8z0MiVTa
	B50cf
X-Gm-Gg: AY/fxX4L0uiTXwTKSv1dv/M38sdFrPPS7JncVhVvJPT+mjSCusj6i17sl7CjtRgdyiT
	75mlGE19cqTk15q/J0BpofIHQJizeuqki0H9QzuxrOIQ++8P0r7qMZtjk44524P0eg1sBFNp77f
	+LGXIzApQnjws0jHcegxlCpPwSQGimwFgtaO5x1MuY327qC6N/ka/W8fMkACDXzbhJP/mDmds6d
	yEach3zMVLaL/11jIW/EEsn3gylmKnSZgS/HX0gG1O8iFyITO6ip7Z6jcDV+Ne5c1v7mDdgDtpz
	fIODYVHEZb4cyz5oiKQyS1Zn7rlxVXULQnJdA78fy0LdHDX0O4PbBAU1oN1EgOxlVVEPlMyB8mE
	h3yzAOXisJdJObVEymEbv0Fv9NrFKUrF11O/hHt3KMRSVEsuWv1AGamJ2qQIH3hfqrqanWrHwev
	wTJA72xYUDw8aDqovQToia5X90Y0POqtfWcVN9wNvOettksBztfiCaGRVYEXc7G4lI9h4Nfcc+/
	lO+q7duB9oJIPeGS6XcxQ==
X-Received: by 2002:a05:600c:46cf:b0:479:3a88:de5e with SMTP id 5b1f17b1804b1-4801eb15549mr147769785e9.37.1768916292030;
        Tue, 20 Jan 2026 05:38:12 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm303400035e9.12.2026.01.20.05.38.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:38:11 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/26] python3: fix CVE-2025-13836
Date: Tue, 20 Jan 2026 14:37:35 +0100
Message-ID: <ae5ccda58ed62e93ededaa81cc3af973244caff3.1768914702.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768914702.git.yoann.congal@smile.fr>
References: <cover.1768914702.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229719

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/python/cpython/commit/289f29b0fe38baf2d7cb5854f4bb573cc34a6a15

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3/CVE-2025-13836.patch       | 163 ++++++++++++++++++
 .../python/python3_3.10.19.bb                 |   1 +
 2 files changed, 164 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13836.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-13836.patch b/meta/recipes-devtools/python/python3/CVE-2025-13836.patch
new file mode 100644
index 0000000000..c4387b6019
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2025-13836.patch
@@ -0,0 +1,163 @@
+From 289f29b0fe38baf2d7cb5854f4bb573cc34a6a15 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Fri, 5 Dec 2025 16:21:57 +0100
+Subject: [PATCH] [3.13] gh-119451: Fix a potential denial of service in
+ http.client (GH-119454) (#142139)
+
+gh-119451: Fix a potential denial of service in http.client (GH-119454)
+
+Reading the whole body of the HTTP response could cause OOM if
+the Content-Length value is too large even if the server does not send
+a large amount of data. Now the HTTP client reads large data by chunks,
+therefore the amount of consumed memory is proportional to the amount
+of sent data.
+(cherry picked from commit 5a4c4a033a4a54481be6870aa1896fad732555b5)
+
+CVE: CVE-2025-13836
+Upstream-Status: Backport [https://github.com/python/cpython/commit/289f29b0fe38baf2d7cb5854f4bb573cc34a6a15]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ Lib/http/client.py                            | 28 ++++++--
+ Lib/test/test_httplib.py                      | 66 +++++++++++++++++++
+ ...-05-23-11-47-48.gh-issue-119451.qkJe9-.rst |  5 ++
+ 3 files changed, 95 insertions(+), 4 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue-119451.qkJe9-.rst
+
+diff --git a/Lib/http/client.py b/Lib/http/client.py
+index d1b7b10..c8ab5b7 100644
+--- a/Lib/http/client.py
++++ b/Lib/http/client.py
+@@ -111,6 +111,11 @@ responses = {v: v.phrase for v in http.HTTPStatus.__members__.values()}
+ _MAXLINE = 65536
+ _MAXHEADERS = 100
+ 
++# Data larger than this will be read in chunks, to prevent extreme
++# overallocation.
++_MIN_READ_BUF_SIZE = 1 << 20
++
++
+ # Header name/value ABNF (http://tools.ietf.org/html/rfc7230#section-3.2)
+ #
+ # VCHAR          = %x21-7E
+@@ -628,10 +633,25 @@ class HTTPResponse(io.BufferedIOBase):
+         reading. If the bytes are truly not available (due to EOF), then the
+         IncompleteRead exception can be used to detect the problem.
+         """
+-        data = self.fp.read(amt)
+-        if len(data) < amt:
+-            raise IncompleteRead(data, amt-len(data))
+-        return data
++        cursize = min(amt, _MIN_READ_BUF_SIZE)
++        data = self.fp.read(cursize)
++        if len(data) >= amt:
++            return data
++        if len(data) < cursize:
++            raise IncompleteRead(data, amt - len(data))
++
++        data = io.BytesIO(data)
++        data.seek(0, 2)
++        while True:
++            # This is a geometric increase in read size (never more than
++            # doubling out the current length of data per loop iteration).
++            delta = min(cursize, amt - cursize)
++            data.write(self.fp.read(delta))
++            if data.tell() >= amt:
++                return data.getvalue()
++            cursize += delta
++            if data.tell() < cursize:
++                raise IncompleteRead(data.getvalue(), amt - data.tell())
+ 
+     def _safe_readinto(self, b):
+         """Same as _safe_read, but for reading into a buffer."""
+diff --git a/Lib/test/test_httplib.py b/Lib/test/test_httplib.py
+index 77152cf..89ec5f6 100644
+--- a/Lib/test/test_httplib.py
++++ b/Lib/test/test_httplib.py
+@@ -1226,6 +1226,72 @@ class BasicTest(TestCase):
+         thread.join()
+         self.assertEqual(result, b"proxied data\n")
+ 
++    def test_large_content_length(self):
++        serv = socket.create_server((HOST, 0))
++        self.addCleanup(serv.close)
++
++        def run_server():
++            [conn, address] = serv.accept()
++            with conn:
++                while conn.recv(1024):
++                    conn.sendall(
++                        b"HTTP/1.1 200 Ok\r\n"
++                        b"Content-Length: %d\r\n"
++                        b"\r\n" % size)
++                    conn.sendall(b'A' * (size//3))
++                    conn.sendall(b'B' * (size - size//3))
++
++        thread = threading.Thread(target=run_server)
++        thread.start()
++        self.addCleanup(thread.join, 1.0)
++
++        conn = client.HTTPConnection(*serv.getsockname())
++        try:
++            for w in range(15, 27):
++                size = 1 << w
++                conn.request("GET", "/")
++                with conn.getresponse() as response:
++                    self.assertEqual(len(response.read()), size)
++        finally:
++            conn.close()
++            thread.join(1.0)
++
++    def test_large_content_length_truncated(self):
++        serv = socket.create_server((HOST, 0))
++        self.addCleanup(serv.close)
++
++        def run_server():
++            while True:
++                [conn, address] = serv.accept()
++                with conn:
++                    conn.recv(1024)
++                    if not size:
++                        break
++                    conn.sendall(
++                        b"HTTP/1.1 200 Ok\r\n"
++                        b"Content-Length: %d\r\n"
++                        b"\r\n"
++                        b"Text" % size)
++
++        thread = threading.Thread(target=run_server)
++        thread.start()
++        self.addCleanup(thread.join, 1.0)
++
++        conn = client.HTTPConnection(*serv.getsockname())
++        try:
++            for w in range(18, 65):
++                size = 1 << w
++                conn.request("GET", "/")
++                with conn.getresponse() as response:
++                    self.assertRaises(client.IncompleteRead, response.read)
++                conn.close()
++        finally:
++            conn.close()
++            size = 0
++            conn.request("GET", "/")
++            conn.close()
++            thread.join(1.0)
++
+     def test_putrequest_override_domain_validation(self):
+         """
+         It should be possible to override the default validation
+diff --git a/Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue-119451.qkJe9-.rst b/Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue-119451.qkJe9-.rst
+new file mode 100644
+index 0000000..6d6f25c
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue-119451.qkJe9-.rst
+@@ -0,0 +1,5 @@
++Fix a potential memory denial of service in the :mod:`http.client` module.
++When connecting to a malicious server, it could cause
++an arbitrary amount of memory to be allocated.
++This could have led to symptoms including a :exc:`MemoryError`, swapping, out
++of memory (OOM) killed processes or containers, or even system crashes.
+-- 
+2.50.1
+
diff --git a/meta/recipes-devtools/python/python3_3.10.19.bb b/meta/recipes-devtools/python/python3_3.10.19.bb
index 6f23d258c1..5140445ad8 100644
--- a/meta/recipes-devtools/python/python3_3.10.19.bb
+++ b/meta/recipes-devtools/python/python3_3.10.19.bb
@@ -38,6 +38,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
            file://CVE-2025-6075.patch \
+           file://CVE-2025-13836.patch \
            "
 
 SRC_URI:append:class-native = " \

