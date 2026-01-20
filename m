Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D045AD2ED16
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:24 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5018.1768910954976542443
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:09:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mKMTlaGK;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-435903c4040so303596f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 04:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768910953; x=1769515753; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tV7x4k7cEXVW4G988bUhCoPX+/hsrKpIjJ+Ew5ybgI=;
        b=mKMTlaGK3kiCt28DJAPwiur1EfW214LG9iMls3Dpe1Kh0urcoL7NK+i0iz1XASiepe
         1xYpPvMTNAKJ+UMY1uyVMeT2kyCSHU0eWVa1nK0RCeCKJsccwFUEcBH5LhwUJxwQYJjE
         G4c338PTh+DHnE6UQPoHXS42G2a3999Iu7kQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910953; x=1769515753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+tV7x4k7cEXVW4G988bUhCoPX+/hsrKpIjJ+Ew5ybgI=;
        b=PACKfN7enEBpTI5bIgQQU2tzFtkkkcKPvIWusRkGL2HrgTvYWB2pLvgQrp1/Img4g3
         r1Vnwl7ryhcsq5L5GRaCIny/e9/8V9Wbj0ppP+ADqI4rTpbjUq/oEyljlTEHGsKi6m2Q
         SpEnOBN0QvR+hqmxsxArZ0qAXJPOQIWVDHxBD4qJXLr/S0vC/F6GRCLQcXjTIB4VlC0y
         +kSMoFSbM5fdy/2I0egdj5aWdWVQattYg93s6gsC2ArRGUd3hgySQD47LhnqsCNx6S4n
         eA3ty9tMmph0f2vbeHgJc61ddru01l3pbeVMduUw/xW2hviHhGrjMfnCD9Mxt0mWCnVj
         5jhw==
X-Gm-Message-State: AOJu0Yweyg/P2ZUStMjSBk5Al2eUsxbVmOi7XcT98Hgmktn/EAXVkLYE
	FGFFivXu68VYjZyB7TnMEg3CHvU9pszqNOYM7OaomhZ3ziZ/+TtrBMu29Emr72/YB4D+4nwrlBp
	zbpwF
X-Gm-Gg: AZuq6aI4kbclBglSQai4fvOtqboKwzfrsa78lje8bgx4bbRsIKtkZS6qJJyNMxEa6fs
	K+WNMmx4u7S8SHNDMKbIEcnI03ijgbC6WqqFjLQ8sBdoTki1do1bh9b81P79hb+1jaF/RULKTEj
	pJlo4dUuy3EYzWwnaNX8qROdNgJ679FGjZ/MBJvqUwbmTAPTkGiXm3NTggQBq0tLc7AcoTBu4gg
	V0GsUrfsrU5R4g7WAdu9gmwYRGhS1+Y6uS6Q+i7x2fP4AV10M122BQ7w5pEi0e1pI/zSr/qC9K5
	3Ozor5FTNK1R1WJUPQgPQwPFCd085p7cU/B1GcZV926pFuY3ds8ZAFwsJrSWvmbS6VoSHcyTBIZ
	GKzOMqGCPIKADjxxrPe/yKhlgCz/SXRQt5bXzXiaW67sRvUVfWMVIj/TPmxuXooIpmdCQqTZ4um
	NOCn4ukZYdzlXewDcVRtSgF6v55bvpPfUewGJXCPhCdspU+1RjF52A1uHjUqn458fOAyetf/mBC
	+acsF4eWfikNBkO7tHCzg==
X-Received: by 2002:a05:6000:22c4:b0:42f:b65c:1e4f with SMTP id ffacd0b85a97d-4356a02c2b2mr17644150f8f.17.1768910952984;
        Tue, 20 Jan 2026 04:09:12 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm28916097f8f.16.2026.01.20.04.09.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:09:12 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/22] python3: patch CVE-2025-13836
Date: Tue, 20 Jan 2026 13:08:16 +0100
Message-ID: <cdad34eef142f6fdc214177ca0342a415d0dc058.1768910519.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768910519.git.yoann.congal@smile.fr>
References: <cover.1768910519.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229680

From: Peter Marko <peter.marko@siemens.com>

Pick commit from branch 3.12 mentioned in [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-13836

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3/CVE-2025-13836.patch       | 162 ++++++++++++++++++
 .../python/python3_3.12.12.bb                 |   1 +
 2 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13836.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-13836.patch b/meta/recipes-devtools/python/python3/CVE-2025-13836.patch
new file mode 100644
index 0000000000..b90fc5f0ec
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2025-13836.patch
@@ -0,0 +1,162 @@
+From 14b1fdb0a94b96f86fc7b86671ea9582b8676628 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 22 Dec 2025 14:50:18 +0100
+Subject: [PATCH] [3.12] gh-119451: Fix a potential denial of service in
+ http.client (GH-119454) (#142140)
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
+Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
+
+CVE: CVE-2025-13836
+Upstream-Status: Backport [https://github.com/python/cpython/commit/14b1fdb0a94b96f86fc7b86671ea9582b8676628]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ Lib/http/client.py                            | 28 ++++++--
+ Lib/test/test_httplib.py                      | 66 +++++++++++++++++++
+ ...-05-23-11-47-48.gh-issue-119451.qkJe9-.rst |  5 ++
+ 3 files changed, 95 insertions(+), 4 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue-119451.qkJe9-.rst
+
+diff --git a/Lib/http/client.py b/Lib/http/client.py
+index fb29923d942..70451d67d4c 100644
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
+@@ -639,10 +644,25 @@ class HTTPResponse(io.BufferedIOBase):
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
+index 01f5a101901..e46dac00779 100644
+--- a/Lib/test/test_httplib.py
++++ b/Lib/test/test_httplib.py
+@@ -1452,6 +1452,72 @@ class BasicTest(TestCase):
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
+index 00000000000..6d6f25cd2f8
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue-119451.qkJe9-.rst
+@@ -0,0 +1,5 @@
++Fix a potential memory denial of service in the :mod:`http.client` module.
++When connecting to a malicious server, it could cause
++an arbitrary amount of memory to be allocated.
++This could have led to symptoms including a :exc:`MemoryError`, swapping, out
++of memory (OOM) killed processes or containers, or even system crashes.
diff --git a/meta/recipes-devtools/python/python3_3.12.12.bb b/meta/recipes-devtools/python/python3_3.12.12.bb
index 786f52875a..280d98424a 100644
--- a/meta/recipes-devtools/python/python3_3.12.12.bb
+++ b/meta/recipes-devtools/python/python3_3.12.12.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_readline-skip-limited-history-test.patch \
            file://CVE-2025-6075.patch \
            file://CVE-2025-12084.patch \
+           file://CVE-2025-13836.patch \
            "
 
 SRC_URI:append:class-native = " \

