Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA000C8303D
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 13:38:23 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.11119.1751377100361207329
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 06:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xtLgR+Oh;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-315f6b20cf9so3450877a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 06:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751377099; x=1751981899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6M8mkYde9xAcbPrPHiRDOjxMbbMFVmpLN0OmQ7utEE0=;
        b=xtLgR+OhFJtF7AEylidDAq1zMUmlc8P7I3ZxVo15ETfNLmLGjsl+oAddpizGR9l4b8
         BYhP1UjNeyPSRTu01MK+rpP0q6OqEELyZDEwVXqFh6WB69GaZlGVUBUaQwS4IfOlpC7E
         054HWWM0B+aMENXd5cNEYExaEzAAXudwhQufmZO7PxP5HrXs4aQFkM3ncoVY9QrFTGF7
         Yhloe1yRDiL4ObB/erU1d+CD+OtkhtA0G+pID+uBb1KrFrb5GDdBTujfyC6fqfwtbHSQ
         JVEtqHXjHReyK6meTiCJgZBQVLy8YMNVDbRe6RJfyTv1W9Ze0T3mMsuvc3iH72+bq1eK
         u8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751377099; x=1751981899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6M8mkYde9xAcbPrPHiRDOjxMbbMFVmpLN0OmQ7utEE0=;
        b=STmAoGNPvWLthlzBXLTOrxASbCSRS+ewwtnITYlDfhQIlbNkAy40nJE/yd/pqHSwgE
         5Bf+lrDprsWWNn9RJE//+eRzgYHa865L7/Mn5zJkfh+B7LHifXkSOTqUGd8axGZ1j49l
         3Ndl7T5txxGEeNcrrTzYHGa+uaVjYhLAfKBUEGS2Tomb733ls6vmNdD91it9zmNPFhb6
         8gpYCK+HY7Hk/yJoZWyQD1xChbCr/RaPfbtzlVouqNKqKpgxrBWKDEpgXqktNSbY/goi
         hm9Wqw1iFxgVoytIm7yoDSMwwW5p9BTq5eTvrmYUWYodIl9pxgGIvuX2Orgdd62l77SI
         +Y/g==
X-Gm-Message-State: AOJu0YwDJ81IwLhZ/ZojkT+OgL+PBQZ/2qLijTLW6ffhAI/4JHZjEkU6
	PQTI8xOf+nMBl08cod7zXe13lbxbIAPds5eZCefsLc/JxE8IB2YDj/0e3LgQM5Eh/TipXICnch+
	J6Odr
X-Gm-Gg: ASbGncs5TSbr12oU7NbtQteMZDe704+Z5uHFjAmUW8VnH+/LC3yuLqKk6q0t46OwHo2
	+Mqs8uRj8rgPOslcRBkniWSDmhXABrnzQPru9bJbk9tdUN4zyNOwovP7B74Aticja9+Ki1kfzZP
	gmVL1EWC5WXhScHTsQ0croY1JN2uSoaAYpdTqzdUdaJxxFATy+aMPbTCyrHgKDSfVRzUaPF2H3+
	EnB8SLmpD3oVEFuibW9MgSvT84Y/TcztkhcdWajCDB4tzhitxY8/sQee78Y38bIfV94SFO2NcIO
	jPvDkNsR2HBBp8L9cvcv1UvhSf13nF38q9Fd6ZQUQjsTgRW9hA1cwPsjZIOFrI8A
X-Google-Smtp-Source: AGHT+IHmbmRmk0TqESR7i+in8Eh/xnedTr3W+Sq0+RFZNzI0Fhm7xQNYVkRJoTK/fUkL+F1jLyIe8g==
X-Received: by 2002:a17:90a:ec86:b0:311:a314:c2ca with SMTP id 98e67ed59e1d1-318c8ff301cmr21786332a91.6.1751377099445;
        Tue, 01 Jul 2025 06:38:19 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c152331fsm11466117a91.44.2025.07.01.06.38.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 06:38:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 02/11] python3-urllib3: fix CVE-2025-50182
Date: Tue,  1 Jul 2025 06:38:00 -0700
Message-ID: <082b865d9814e7e7aca4466551a035199aa8b563.1751376952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751376952.git.steve@sakoman.com>
References: <cover.1751376952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 13:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219573

From: Yogita Urade <yogita.urade@windriver.com>

urllib3 is a user-friendly HTTP client library for Python. Prior
to 2.5.0, urllib3 does not control redirects in browsers and
Node.js. urllib3 supports being used in a Pyodide runtime utilizing
the JavaScript Fetch API or falling back on XMLHttpRequest. This
means Python libraries can be used to make HTTP requests from a
browser or Node.js. Additionally, urllib3 provides a mechanism to
control redirects, but the retries and redirect parameters are
ignored with Pyodide; the runtime itself determines redirect
behavior. This issue has been patched in version 2.5.0.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-50182

Upstream patch:
https://github.com/urllib3/urllib3/commit/7eb4a2aafe49a279c29b6d1f0ed0f42e9736194f

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python3-urllib3/CVE-2025-50182.patch      | 125 ++++++++++++++++++
 .../python/python3-urllib3_2.3.0.bb           |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch
new file mode 100644
index 0000000000..2f6ba478d5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch
@@ -0,0 +1,125 @@
+From 7eb4a2aafe49a279c29b6d1f0ed0f42e9736194f Mon Sep 17 00:00:00 2001
+From: Illia Volochii <illia.volochii@gmail.com>
+Date: Wed, 18 Jun 2025 16:30:35 +0300
+Subject: [PATCH] Merge commit from fork
+
+CVE: CVE-2025-50182
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/7eb4a2aafe49a279c29b6d1f0ed0f42e9736194f]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ docs/reference/contrib/emscripten.rst      |  2 +-
+ src/urllib3/contrib/emscripten/fetch.py    | 20 ++++++++++
+ test/contrib/emscripten/test_emscripten.py | 46 ++++++++++++++++++++++
+ 3 files changed, 67 insertions(+), 1 deletion(-)
+
+diff --git a/docs/reference/contrib/emscripten.rst b/docs/reference/contrib/emscripten.rst
+index a8f1cda..4670757 100644
+--- a/docs/reference/contrib/emscripten.rst
++++ b/docs/reference/contrib/emscripten.rst
+@@ -65,7 +65,7 @@ Features which are usable with Emscripten support are:
+ * Timeouts
+ * Retries
+ * Streaming (with Web Workers and Cross-Origin Isolation)
+-* Redirects (determined by browser/runtime, not restrictable with urllib3)
++* Redirects (urllib3 controls redirects in Node.js but not in browsers where behavior is determined by runtime)
+ * Decompressing response bodies
+
+ Features which don't work with Emscripten:
+diff --git a/src/urllib3/contrib/emscripten/fetch.py b/src/urllib3/contrib/emscripten/fetch.py
+index a514306..6695821 100644
+--- a/src/urllib3/contrib/emscripten/fetch.py
++++ b/src/urllib3/contrib/emscripten/fetch.py
+@@ -573,6 +573,11 @@ def send_jspi_request(
+         "method": request.method,
+         "signal": js_abort_controller.signal,
+     }
++    # Node.js returns the whole response (unlike opaqueredirect in browsers),
++    # so urllib3 can set `redirect: manual` to control redirects itself.
++    # https://stackoverflow.com/a/78524615
++    if _is_node_js():
++        fetch_data["redirect"] = "manual"
+     # Call JavaScript fetch (async api, returns a promise)
+     fetcher_promise_js = js.fetch(request.url, _obj_from_dict(fetch_data))
+     # Now suspend WebAssembly until we resolve that promise
+@@ -693,6 +698,21 @@ def has_jspi() -> bool:
+         return False
+
+
++def _is_node_js() -> bool:
++    """
++    Check if we are in Node.js.
++
++    :return: True if we are in Node.js.
++    :rtype: bool
++    """
++    return (
++        hasattr(js, "process")
++        and hasattr(js.process, "release")
++        # According to the Node.js documentation, the release name is always "node".
++        and js.process.release.name == "node"
++    )
++
++
+ def streaming_ready() -> bool | None:
+     if _fetcher:
+         return _fetcher.streaming_ready
+diff --git a/test/contrib/emscripten/test_emscripten.py b/test/contrib/emscripten/test_emscripten.py
+index 5eaa674..fbf89fc 100644
+--- a/test/contrib/emscripten/test_emscripten.py
++++ b/test/contrib/emscripten/test_emscripten.py
+@@ -960,6 +960,52 @@ def test_redirects(
+     )
+
+
++@pytest.mark.with_jspi
++def test_disabled_redirects(
++    selenium_coverage: typing.Any, testserver_http: PyodideServerInfo
++) -> None:
++    """
++    Test that urllib3 can control redirects in Node.js.
++    """
++
++    @run_in_pyodide  # type: ignore[misc]
++    def pyodide_test(selenium_coverage: typing.Any, host: str, port: int) -> None:
++        import pytest
++
++        from urllib3 import PoolManager, request
++        from urllib3.contrib.emscripten.fetch import _is_node_js
++        from urllib3.exceptions import MaxRetryError
++
++        if not _is_node_js():
++            pytest.skip("urllib3 does not control redirects in browsers.")
++
++        redirect_url = f"http://{host}:{port}/redirect"
++
++        with PoolManager(retries=0) as http:
++            with pytest.raises(MaxRetryError):
++                http.request("GET", redirect_url)
++
++            response = http.request("GET", redirect_url, redirect=False)
++            assert response.status == 303
++
++        with PoolManager(retries=False) as http:
++            response = http.request("GET", redirect_url)
++            assert response.status == 303
++
++        with pytest.raises(MaxRetryError):
++            request("GET", redirect_url, retries=0)
++
++        response = request("GET", redirect_url, redirect=False)
++        assert response.status == 303
++
++        response = request("GET", redirect_url, retries=0, redirect=False)
++        assert response.status == 303
++
++    pyodide_test(
++        selenium_coverage, testserver_http.http_host, testserver_http.http_port
++    )
++
++
+ def test_insecure_requests_warning(
+     selenium_coverage: typing.Any, testserver_http: PyodideServerInfo
+ ) -> None:
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb b/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb
index 218a226431..c5e3751255 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb
@@ -9,6 +9,7 @@ inherit pypi python_hatchling
 
 SRC_URI += " \
     file://CVE-2025-50181.patch \
+    file://CVE-2025-50182.patch \
 "
 
 DEPENDS += " \
-- 
2.43.0


