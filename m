Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E82DD2ED19
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:38:16 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6482.1768916292206974757
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:38:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=flRB8C1d;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so48761505e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 05:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768916290; x=1769521090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/LIY9qMZengcUOF7vPKUtS1lRqwWvEZyKRvchqTdNU=;
        b=flRB8C1drTDV7Gdkf/CmeWGuq4HCV3W06XjNEb5MF+0MfkXpiNDICnhDsBA7LfAvyr
         gc0dODZKNLpGA7HN6rW567hKkzkT9UgTmaBY4xCQCIi88tGpuMUhHrGa7+qSb49wkoqY
         YbscaC8cRz4kYgVPLtLVKgIAAxrAWZpoAvNZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916290; x=1769521090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f/LIY9qMZengcUOF7vPKUtS1lRqwWvEZyKRvchqTdNU=;
        b=soHFRq35Ve1ltwhHKDlyEvwlZ0YxvAOl04SdLHP1bQvBwHDB59NUH1banZEC98ItJO
         z6iLOzeGqduyfsOfW8wZEXBt+NIkPRCBah7YrTihz0BkzsZGkR42/ZO0PXnoUwFv3PKd
         QmnnKp3YEjeR5+sFIeOhuNZiUTLLqdR0f+O7hVr9RZaeRhSAYgUtQJZcY3zCuXhlWVOH
         FaDCwGOa+4mPu4CUhui1fIuS+VTWylNomtQsiJi8DVZ3FPXlvB3hHz+QPh4BWEiqhJyS
         P9wm2MPI+nKQYvg2qdSzR2DKbl0xJ/iFODc5AQkavhdPQX2tEEzsSG7jdCstxp8WUmx9
         JGpg==
X-Gm-Message-State: AOJu0YzZeeAdvWXh8QMuRfGovS/xl/+bqrhcabNfyDIRKHx84FI2Qx0l
	6wC2fuRSuHxQCb4hsgDPpgOowl276rrmX2/45L4Hs9sOWRWhdSrBzskoJBDQFFH/0tEnyCKjdG0
	LNA7I
X-Gm-Gg: AY/fxX4hBYH+catA5SFeRZk48ngPhrhjTp+HI3GHviGLZ/Lh66VNwLrBwX+GB9ko6ft
	hY+wCw4sfOKSQhy4gyFHNtROWanCj/b0+n77lXsv3A7kxp+4rXPbE34b7M65fHs94glRlhlzpkp
	GyCmqY2/XtfKaG6z7Hc6mmoZTiuJ6mWRnhB8zkB6g3wSzYgmLL9cEK8cYjY3PAuNMIkMQtKoHUX
	oTND9WuamnG5jAbgO8QB4xocvB/qnvNrFrAVgidjtIinRxgouwhnxlO2XUa/na9cTdMiH3srI79
	m6aYgIdL2CeWe+J+zqaT2+s2hQ3dCAPpTjjPkAuBtRf2MJp0D2hZvp2LASbctFrvi/gCNb6DI/0
	aTD8vZzGYam8oWsy8aLDDkzu5/HyhClRDk/g6r9Szz8GLJSGIBNh4ExWXvCFmNAAA4CDt+IuqRx
	SuyukaZ34G7wU8IylQIpta8R0xnClInFgjfMXVZs8QlNGh0CtjKCRrjYFI3S+Dnjn6MlynGcow3
	6Gn+rYdepUL4DX4pSMNIw==
X-Received: by 2002:a05:600c:8b81:b0:480:32da:f338 with SMTP id 5b1f17b1804b1-48032daf48bmr97506145e9.14.1768916290173;
        Tue, 20 Jan 2026 05:38:10 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm303400035e9.12.2026.01.20.05.38.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:38:09 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/26] python3-urllib3: patch CVE-2025-66418
Date: Tue, 20 Jan 2026 14:37:32 +0100
Message-ID: <49af1e1ee78adc165a2c1d6905d0de79015a942c.1768914702.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768914702.git.yoann.congal@smile.fr>
References: <cover.1768914702.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229716

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-66418

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-urllib3/CVE-2025-66418.patch      | 70 +++++++++++++++++++
 .../python/python3-urllib3_1.26.20.bb         |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch
new file mode 100644
index 0000000000..67479010e6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch
@@ -0,0 +1,70 @@
+From 24d7b67eac89f94e11003424bcf0d8f7b72222a8 Mon Sep 17 00:00:00 2001
+From: Illia Volochii <illia.volochii@gmail.com>
+Date: Fri, 5 Dec 2025 16:41:33 +0200
+Subject: [PATCH] Merge commit from fork
+
+* Add a hard-coded limit for the decompression chain
+
+* Reuse new list
+---
+ changelog/GHSA-gm62-xv2j-4w53.security.rst |  4 ++++
+ src/urllib3/response.py                    | 12 +++++++++++-
+ test/test_response.py                      | 10 ++++++++++
+ 3 files changed, 25 insertions(+), 1 deletion(-)
+ create mode 100644 changelog/GHSA-gm62-xv2j-4w53.security.rst
+
+diff --git a/changelog/GHSA-gm62-xv2j-4w53.security.rst b/changelog/GHSA-gm62-xv2j-4w53.security.rst
+new file mode 100644
+index 00000000..6646eaa3
+--- /dev/null
++++ b/changelog/GHSA-gm62-xv2j-4w53.security.rst
+@@ -0,0 +1,4 @@
++Fixed a security issue where an attacker could compose an HTTP response with
++virtually unlimited links in the ``Content-Encoding`` header, potentially
++leading to a denial of service (DoS) attack by exhausting system resources
++during decoding. The number of allowed chained encodings is now limited to 5.
+diff --git a/src/urllib3/response.py b/src/urllib3/response.py
+index 4ba42136..069f726c 100644
+--- a/src/urllib3/response.py
++++ b/src/urllib3/response.py
+@@ -135,8 +135,18 @@ class MultiDecoder(object):
+         they were applied.
+     """
+ 
++    # Maximum allowed number of chained HTTP encodings in the
++    # Content-Encoding header.
++    max_decode_links = 5
++
+     def __init__(self, modes):
+-        self._decoders = [_get_decoder(m.strip()) for m in modes.split(",")]
++        encodings = [m.strip() for m in modes.split(",")]
++        if len(encodings) > self.max_decode_links:
++            raise DecodeError(
++                "Too many content encodings in the chain: "
++                f"{len(encodings)} > {self.max_decode_links}"
++            )
++        self._decoders = [_get_decoder(e) for e in encodings]
+ 
+     def flush(self):
+         return self._decoders[0].flush()
+diff --git a/test/test_response.py b/test/test_response.py
+index 9592fdd9..d824ae70 100644
+--- a/test/test_response.py
++++ b/test/test_response.py
+@@ -295,6 +295,16 @@ class TestResponse(object):
+ 
+         assert r.data == b"foo"
+ 
++    def test_read_multi_decoding_too_many_links(self) -> None:
++        fp = BytesIO(b"foo")
++        with pytest.raises(
++            DecodeError, match="Too many content encodings in the chain: 6 > 5"
++        ):
++            HTTPResponse(
++                fp,
++                headers={"content-encoding": "gzip, deflate, br, zstd, gzip, deflate"},
++            )
++
+     def test_body_blob(self):
+         resp = HTTPResponse(b"foo")
+         assert resp.data == b"foo"
diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.20.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.20.bb
index 58988e4205..1f1132d5b5 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.20.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.20.bb
@@ -9,6 +9,7 @@ inherit pypi setuptools3
 
 SRC_URI += " \
     file://CVE-2025-50181.patch \
+    file://CVE-2025-66418.patch \
 "
 
 RDEPENDS:${PN} += "\

