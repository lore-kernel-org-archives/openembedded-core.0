Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD6B8CF6C08
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 08:09:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1502.1767773365262663618
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 00:09:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DSv7USjp;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477563e28a3so3891525e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 00:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767773363; x=1768378163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6LAwawHyEfUaFztaVFVKhb6cWIXiDJfucWeGQke472M=;
        b=DSv7USjpPtEa7NbsMNWO1mq0miM/Zzdh9riuTmZFsEuWEhvzi52QjPM66HJFLj31Jd
         4CC+ebQKkXbIZR1dUm+MbFG9iaQxxytt/UknMVpqBx9x7pW/t/RC6wWBEZIdOk54kiLJ
         k9dc6YidiccMbjV1k+mOgZwcXB9k3BXWqwuok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773363; x=1768378163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6LAwawHyEfUaFztaVFVKhb6cWIXiDJfucWeGQke472M=;
        b=DY2DNzpN7VOxvR/TfPFEyNizJOAnUJMPp0tKA8Tv0n9XXfroPrsO0al+mIYDaCkGTA
         jZFPe0L1+5OrXbzOC/zBmdW4Rh12gFrGgoG+Px7vX3/ViNQTjve4jZFYXAXloqrFWF6I
         n2T0AUPwaicZDST5N3iE7XZei7R5PA6Wr5BptKbeDWBUPslYjXNdDXe2XWNy9xYO17Oa
         1neumkYQQPV3W9K00NgE5h1kuZMkLoL38YRomzWs85xuZ//s22GfMHIr00vpvIX0wcIG
         VGY2Nqfqts5Qezj8yWV8HqEo0VPkK8APflQBlteduqVE9/TRd9LzRm46D9XEC/UCKTvZ
         aHJQ==
X-Gm-Message-State: AOJu0YyZ8zwrpomY/bkxEKLKv8tE/TCuu2qUEU+ytEbqKA4T4L/Cnm/u
	vFXm9viow0UA9TmmJwpJ53R5ssRgkJoWxFhBRuyDpYvoFI1jVhIkddu3L7mZaKwOJjlnjXPXCfl
	BZr7G
X-Gm-Gg: AY/fxX4JniEPyBmPAHe+Drku89dUoClnwpur2dHr/qMWebm1T8j6ArUvl/H/jiDBpBa
	cwG9n5sN+niAsVMAXR8TcjbaobhuXrelAxC4zKl0j25y9FGbvpM2i0rpi1cJKV7fl3sV04UqyHJ
	8qdDa82Z78pTBGxu+/+eixnWEjsnWPtHYo1DcYu5nCi5FB6auT5rZ93yaAtc7xUtAkzQ78+CmOu
	1EsedLlIOxWHWIJwGFxHRdDwjQTQg/GbPTbFUYHoZCsz5mXTsCosCg7mwCt/rmncsl23EMdD1Z9
	4SsVI6M7IiydHHj4FwMTL4czQaDPIeaizSRjCQondVOc2yZXU9kNgZydQsvtAM3G1TFP8pXwFl3
	O5X2rHV81XxQuAZmAsP1kX5sQNqXAj8lKj87S86H+S5A0ZBUx1vrKtGZBWBKoMaEBHHY1D3Cgjb
	j/rYlThhSVcAaCypmi8niz5xcvApGtPBLWnE4ThAJOz1GSSgr9bRp3lWYNRgkXcuSDCjOVM7pOb
	UxcEq1aAG9B4sPR2mhRe8oqCg==
X-Google-Smtp-Source: AGHT+IFmxbAqgzGLOgUesBYgyRisF6aec3ieHkR8I1VusW0JI6cA6P1TGhZSBHEhLvkAGSErRD80lw==
X-Received: by 2002:a05:600c:5916:b0:475:d7fd:5c59 with SMTP id 5b1f17b1804b1-47d81810b1fmr39390845e9.16.1767773363381;
        Wed, 07 Jan 2026 00:09:23 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8715b5f7sm6093485e9.4.2026.01.07.00.09.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:09:22 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 03/11] python3-urllib3: patch CVE-2025-66418
Date: Wed,  7 Jan 2026 09:08:52 +0100
Message-ID: <7e26c0c838e4461885e851c1ac4115f7f39635b2.1767772757.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1767772757.git.yoann.congal@smile.fr>
References: <cover.1767772757.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 08:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228950

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-66418

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python3-urllib3/CVE-2025-66418.patch      | 74 +++++++++++++++++++
 .../python/python3-urllib3_2.5.0.bb           |  4 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch
new file mode 100644
index 0000000000..71fc44e4f9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch
@@ -0,0 +1,74 @@
+From 24d7b67eac89f94e11003424bcf0d8f7b72222a8 Mon Sep 17 00:00:00 2001
+From: Illia Volochii <illia.volochii@gmail.com>
+Date: Fri, 5 Dec 2025 16:41:33 +0200
+Subject: [PATCH] Merge commit from fork
+
+* Add a hard-coded limit for the decompression chain
+
+* Reuse new list
+
+CVE: CVE-2025-66418
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/24d7b67eac89f94e11003424bcf0d8f7b72222a8]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
+@@ -220,8 +220,18 @@ class MultiDecoder(ContentDecoder):
+         they were applied.
+     """
+ 
++    # Maximum allowed number of chained HTTP encodings in the
++    # Content-Encoding header.
++    max_decode_links = 5
++
+     def __init__(self, modes: str) -> None:
+-        self._decoders = [_get_decoder(m.strip()) for m in modes.split(",")]
++        encodings = [m.strip() for m in modes.split(",")]
++        if len(encodings) > self.max_decode_links:
++            raise DecodeError(
++                "Too many content encodings in the chain: "
++                f"{len(encodings)} > {self.max_decode_links}"
++            )
++        self._decoders = [_get_decoder(e) for e in encodings]
+ 
+     def flush(self) -> bytes:
+         return self._decoders[0].flush()
+diff --git a/test/test_response.py b/test/test_response.py
+index 9592fdd9..d824ae70 100644
+--- a/test/test_response.py
++++ b/test/test_response.py
+@@ -584,6 +584,16 @@ class TestResponse:
+         assert r.read(9 * 37) == b"foobarbaz" * 37
+         assert r.read() == b""
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
+     def test_body_blob(self) -> None:
+         resp = HTTPResponse(b"foo")
+         assert resp.data == b"foo"
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb b/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
index 62fdf8e345..c39e9676e8 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
@@ -7,6 +7,10 @@ SRC_URI[sha256sum] = "3fc47733c7e419d4bc3f6b3dc2b4f890bb743906a30d56ba4a5bfa4bbf
 
 inherit pypi python_hatchling
 
+SRC_URI += "\
+    file://CVE-2025-66418.patch \
+"
+
 DEPENDS += "python3-hatch-vcs-native"
 
 PACKAGECONFIG ??= ""

