Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40B1CF6BF1
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 05:48:02 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8933.1767764878519752622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 21:47:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VDWO1ls/;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a09d981507so4048595ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 21:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1767764878; x=1768369678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=666w/i7s1eRiONHB006OLPFA5YI766Ve7OSH/HrVri4=;
        b=VDWO1ls/Vpl+UbQd1SzO5eJpsDaan+DGMB+ol2AnJC1v56r9Mt35w6rOF/ci9NX6DD
         l7YoW6gDnQBTMD4cUaJQAdN98jjWUO3HY4JxqtccFkO5zwK3DfACuWdcyJDD9eFRI30+
         hS2+zW7vxQQ2cbwk2Zad55B+EuGGYLe0EanZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767764878; x=1768369678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=666w/i7s1eRiONHB006OLPFA5YI766Ve7OSH/HrVri4=;
        b=PK9158vBuxhLCdYNfdV4TM47+AH6CfkAok1goY/PmcEufFiSq/ayUfb6NG3Qz5wBEZ
         mY2vPNd23/dKKkNntXA4fuD7HqZAa2ie1FpVTvnEp5afvqSLZ0wQkLZvttCH+tcj4ktV
         E5XQXcjapOHS/cQClI+dkcyo8zwwXfmGu7FcLbhMDAalLxmgi5BOOOWvDQCryDVejDOL
         oZbpwxEDm92/+me720XFN81YyVJk8b+lK1IKs6PmCIrYo0TKmoINSFjZobBxU/32Uu19
         ZfikEbKwtsFQ86UYQZzsRQYyE+zxXdyq7EACpZ8ybtj4mJUGj4hndcM8+3j9Jnovtx7Y
         y3cQ==
X-Gm-Message-State: AOJu0YxUCuYeWa6pY0FJxv7mOqwr+bQOd/cB7d+JF7140VdqQsC8Gk6q
	uQMgnM3QfXDPIIeU9QiTUnB2lS8LhCyhlFD9GiMYagPCEF+510/RGSR4G90W41ItCKOXJJ4w5TA
	6poO2Bqc=
X-Gm-Gg: AY/fxX5tqPQf9+UhgsKa2Yk0vgcJVAuT6SdnfzGtMyZGo1Lf3UY/E2mTway8LnOuJ8X
	orngIlmKhbv7enuedbV0HBy/pEcbbKci0D5xM6arRBUA55tDhkPzYpaj2wOcdpC5AVw5DfWY69j
	Bpd/7cMOTMmdCC4qJ0dZE2Txykcr2Td3Jk/ikfryEuBH+bPmmchSaPtliQGXNJq/7ecbnR9sDC4
	VPCFZ1iGsNJ7GjcYeBXA81Hmxh1sWPR/b3bGAwW4UPxIzkvFWUqB9jJ/GTIW/GKdaxi4ITxn6ie
	ppBl99YZ02OPeQG2NEhZv/ws6E/nkfbrdSoCGiQSZ0N/SiGbCWZxZTVKkhHQE2IvPtv7I19P53m
	2uoJQOLQWztfMDLGwlrlRqiAVL4lvTUY22t/DQVmMo+6sV5vxULUTpiZTxUvu0Wf4nUcXasjkIm
	ymNzNwLsGUQmnpC/l0sSPuIvk=
X-Google-Smtp-Source: AGHT+IEvCzZUQrrMIUUqtxBnwfJzuTaPX/bK3+63igumS5kLD+nFdzsWb5zf5j+X7XDPZaNHcXvl9g==
X-Received: by 2002:a17:902:e5c1:b0:2a0:b467:a7d0 with SMTP id d9443c01a7336-2a3e39d8350mr48437635ad.16.1767764877650;
        Tue, 06 Jan 2026 21:47:57 -0800 (PST)
Received: from MVIN00013.mvista.com ([27.121.101.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3ba03f9sm37760555ad.0.2026.01.06.21.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 21:47:57 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] python3: fix CVE-2025-13836
Date: Wed,  7 Jan 2026 11:17:40 +0530
Message-ID: <20260107054740.316221-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 05:48:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228945

Upstream-Status: Backport from https://github.com/python/cpython/commit/289f29b0fe38baf2d7cb5854f4bb573cc34a6a15

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
-- 
2.50.1


