Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFB5D29C46
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 16:33:22 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39036.1768840396689347795
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 08:33:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=XnFRb8XO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260119163313ea58b76bde0002079f-wjxz8k@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260119163313ea58b76bde0002079f
        for <openembedded-core@lists.openembedded.org>;
        Mon, 19 Jan 2026 17:33:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=JB9B4qtXylaDmyCJCcnEzQ/Kspw9eP4kwBDiBUBnMnA=;
 b=XnFRb8XOisu9ByM3EOmFuk8h0xJZEjshATLBCIdQBip0ZrDzjht3wFBTYW/iZD4MRCAhDP
 t/oAGteA/uS5ipC7a9Eflr4eMYTMnYcTAUbDlQ47G27HU/zufXjDwaH5Ycn1cjz8h2WoqP6w
 J7rLtcp29Yvc+LmtIp+IfQB09kec8uSwvhyXvhavI1CDyLzRofjLN84VKtyChyIx/X96PcaE
 CM2OynyFr8kXfjxX1+GsQnXmjZY3MTctuiAnz+Wt1noNcjcacexgMBVrWOycc/O9PB3OuRPF
 FR6Vc2cOQhsKjQcZT+qAJ0oo/gxnOY0qQPUVx7MMdThXl6q2R2D73d9Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH v2] python3: patch CVE-2025-13836
Date: Mon, 19 Jan 2026 17:33:11 +0100
Message-Id: <20260119163311.8759-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 16:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229627

From: Peter Marko <peter.marko@siemens.com>

Pick commit from branch 3.12 mentioned in [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-13836

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python/python3/CVE-2025-13836.patch       | 162 ++++++++++++++++++
 .../python/python3_3.12.12.bb                 |   1 +
 2 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13836.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-13836.patch b/meta/recipes-devtools/python/python3/CVE-2025-13836.patch
new file mode 100644
index 00000000000..b90fc5f0ec3
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
index 786f52875a9..280d98424a5 100644
--- a/meta/recipes-devtools/python/python3_3.12.12.bb
+++ b/meta/recipes-devtools/python/python3_3.12.12.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_readline-skip-limited-history-test.patch \
            file://CVE-2025-6075.patch \
            file://CVE-2025-12084.patch \
+           file://CVE-2025-13836.patch \
            "
 
 SRC_URI:append:class-native = " \

