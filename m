Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF1CC83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 11:02:07 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.10103.1751626920145368345
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 04:02:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i+id7EQ0;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae0b6532345so344760766b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 04:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751626918; x=1752231718; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B7Tt0V7+1i8paIuqkbNGWouMnOrs6f+91lI6LdYmxJs=;
        b=i+id7EQ0rE0YHrqhBED+jWUfq+OuY0G8Os+kFAXJsOYURy5Lo56gy281Z7ml/1QFC9
         cClwpeS2lW1LDYa6nWx6EruUsb4fEYdAtye1Xi0FbwFnUgpnu3sdiZT9MxWKFzuTX1NJ
         kkim9K7evTVdKeS3Qf4Vb9EnyNiyeMvq32eQehUiePf5qs56+oyex6sssl0NHA0eZuhD
         cN0jFOLd+a5Q0Y8ptXcDptHc4EbiTpgdF/OE8lxdGqcNCgONQjQmJyAa48N5+Bk+2fmV
         d5u+fHLqCpg51l5rjwR0ZSslgPAEFaPyaT1fCBICHVSdUhSwzfFUt7uXm0O4L27cZ3gq
         Sx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751626918; x=1752231718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B7Tt0V7+1i8paIuqkbNGWouMnOrs6f+91lI6LdYmxJs=;
        b=v/lswqBgIgSLXDYWkPjQyaeAiRJn5kD4zS13k+uD4E2oYKk6+ysYwtUhZFI/X6z3fw
         bti4jkrzJqIEFDsZjvJQuEFS2uBDWCfg0FqxM6gutwBSJfEUT5TzB/Pm4OFFt2S9vXrO
         IEdr1rHDXRk1h5I1Md2h0fS7yVVcsjuwr29+rjwjPYp8cD5vA2Dm9C/zFrpsuHngcLMU
         YeMEJR46OwGFnto3n5r4DdO4yItElO/dxCo9KWIpGmzOG+a/OEXIbWKaU0ch8FcutDyU
         KNQ/dMp1ATw5dHqXbWeWQ90L679ELQCvmILoCfvhE6ifnilypnRg81POHC1pPQCLvWeE
         criA==
X-Forwarded-Encrypted: i=1; AJvYcCXsjMtFuEuq7jkRwUh8evB0ZrV6SNlmlTYppiGiTajCbC6vZTKb5kw2U0zYStdjzpgYleqWGZxDkVfk6gW310hXOA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzUI5gTBA3CNTASk8C92wGbHcEJtXdmqSPCcy0HgCRHnl5ybqcJ
	tOiKAXCKo195xb25IVo6i2uNhmNiMqbfLsg8E69j46HLtqCI6Efmw671jRvtZw==
X-Gm-Gg: ASbGncv6cljOOePFHkcGb2SvcEYgZcBNWr6Qsk/NUPK8zD4q/vI/FPHHi3PhUYReDWx
	aPeLfkJAzgewX1y/m/9IgNJ8IbvvFc6vluTU1FBhxp6hBfQR6iM8btvlt2VzJaPCyyuzu3BiW8D
	AM6/q9w8bz4JpYlAYayYmwhFvwucaraBBAtS6M+wuapQMTjkpxxtxGUN5V9DKxA3BZ6W8B21arI
	3R6S73VPF70fqOWDOgD7iTDgpbf+ffYJ/7Efm6WCfsWmmJDnSMWezSPnSo6BdOmRoxpWG/ZSts8
	Uz+Ww5hVmFft+LNSjVUNKbWbnDKzzv2H8BKXE0RLlvVtdLFT4iinM4Xh0/kHZUDqBfteYQ==
X-Google-Smtp-Source: AGHT+IFUdeKS6IQ8D4PKcWoMIk+WRmnNM6rXIedpUuhU8yti0ZPm2FtxGMg1/10SJd2mh8xLAKzICQ==
X-Received: by 2002:a17:907:9404:b0:add:f68c:5200 with SMTP id a640c23a62f3a-ae3f9bb4b95mr275565066b.6.1751626917313;
        Fri, 04 Jul 2025 04:01:57 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac5d69sm152485466b.76.2025.07.04.04.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 04:01:56 -0700 (PDT)
Message-ID: <a1bc90f8-44f7-4343-a52a-b9bba9607da6@gmail.com>
Date: Fri, 4 Jul 2025 13:01:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap][PATCH 2/2] python3-urllib3: fix
 CVE-2025-50182
To: Yogita.Urade@windriver.com, openembedded-core@lists.openembedded.org
References: <20250704103539.265785-1-yogita.urade@windriver.com>
 <20250704103539.265785-2-yogita.urade@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250704103539.265785-2-yogita.urade@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 11:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219917

I think this patch isn't correct, and I believe there is a typo in the
CVE upstream description also.

1. Regarding the patch: The vulnerable method, send_jspi_request() does
not exist in the Scarthgap version. This patch basically introduces the
vulnerable new feature (which wasn't there initially) before fixing it.
2. Regarding the CVE: I think the first vulnerable version is actually
2.3.0, and the vulnerability was actually introduced with this[1] commit.

I am only ~80% sure about the 2nd comment, about 2.2.2 being not
vulnerable. In case this version is actually vulnerable, then I think
the fix should be somewhere in the middle of _StreamingFetcher.send()
method of the same file (which is only a guess after a bit of eyeballing).

[1]:
https://github.com/urllib3/urllib3/commit/8b2474d32b57f096a815ab52f9b54a843d68c140


On 7/4/25 12:35, Urade, Yogita via lists.openembedded.org wrote:
> From: Yogita Urade <yogita.urade@windriver.com>
>
> urllib3 is a user-friendly HTTP client library for Python. Prior to
> 2.5.0, urllib3 does not control redirects in browsers and Node.js.
> urllib3 supports being used in a Pyodide runtime utilizing the
> JavaScript Fetch API or falling back on XMLHttpRequest. This means
> Python libraries can be used to make HTTP requests from a browser or
> Node.js. Additionally, urllib3 provides a mechanism to control redirects,
> but the retries and redirect parameters are ignored with Pyodide; the
> runtime itself determines redirect behavior. This issue has been
> patched in version 2.5.0.
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2025-50182
>
> Upstream patch:
> https://github.com/urllib3/urllib3/commit/7eb4a2aafe49a279c29b6d1f0ed0f42e9736194f
>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>  .../python3-urllib3/CVE-2025-50182.patch      | 195 ++++++++++++++++++
>  .../python/python3-urllib3_2.2.2.bb           |   1 +
>  2 files changed, 196 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch
>
> diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch
> new file mode 100644
> index 0000000000..d99e83a619
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch
> @@ -0,0 +1,195 @@
> +From 7eb4a2aafe49a279c29b6d1f0ed0f42e9736194f Mon Sep 17 00:00:00 2001
> +From: Illia Volochii <illia.volochii@gmail.com>
> +Date: Wed, 18 Jun 2025 16:30:35 +0300
> +Subject: [PATCH] Merge commit from fork
> +
> +Changes:
> +- Take only send_jspi_request API from commit
> +https://github.com/urllib3/urllib3/commit/8b2474d32b57f096a815ab52f9b54a843d68c140
> +
> +CVE: CVE-2025-50182
> +Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/7eb4a2aafe49a279c29b6d1f0ed0f42e9736194f]
> +
> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +---
> + docs/reference/contrib/emscripten.rst      |  2 +-
> + src/urllib3/contrib/emscripten/fetch.py    | 93 ++++++++++++++++++++++
> + test/contrib/emscripten/test_emscripten.py | 46 +++++++++++
> + 3 files changed, 140 insertions(+), 1 deletion(-)
> +
> +diff --git a/docs/reference/contrib/emscripten.rst b/docs/reference/contrib/emscripten.rst
> +index c88e422..3ff9cdd 100644
> +--- a/docs/reference/contrib/emscripten.rst
> ++++ b/docs/reference/contrib/emscripten.rst
> +@@ -68,7 +68,7 @@ Features which are usable with Emscripten support are:
> + * Timeouts
> + * Retries
> + * Streaming (with Web Workers and Cross-Origin Isolation)
> +-* Redirects (determined by browser/runtime, not restrictable with urllib3)
> ++* Redirects (urllib3 controls redirects in Node.js but not in browsers where behavior is determined by runtime)
> + * Decompressing response bodies
> +
> + Features which don't work with Emscripten:
> +diff --git a/src/urllib3/contrib/emscripten/fetch.py b/src/urllib3/contrib/emscripten/fetch.py
> +index 8d197ea..539df99 100644
> +--- a/src/urllib3/contrib/emscripten/fetch.py
> ++++ b/src/urllib3/contrib/emscripten/fetch.py
> +@@ -403,6 +403,99 @@ def send_request(request: EmscriptenRequest) -> EmscriptenResponse:
> +             raise _RequestError(err.message, request=request)
> +
> +
> ++def send_jspi_request(
> ++    request: EmscriptenRequest, streaming: bool
> ++) -> EmscriptenResponse:
> ++    """
> ++    Send a request using WebAssembly JavaScript Promise Integration
> ++    to wrap the asynchronous JavaScript fetch api (experimental).
> ++
> ++    :param request:
> ++        Request to send
> ++
> ++    :param streaming:
> ++        Whether to stream the response
> ++
> ++    :return: The response object
> ++    :rtype: EmscriptenResponse
> ++    """
> ++    timeout = request.timeout
> ++    js_abort_controller = js.AbortController.new()
> ++    headers = {k: v for k, v in request.headers.items() if k not in HEADERS_TO_IGNORE}
> ++    req_body = request.body
> ++    fetch_data = {
> ++        "headers": headers,
> ++        "body": to_js(req_body),
> ++        "method": request.method,
> ++        "signal": js_abort_controller.signal,
> ++    }
> ++    # Node.js returns the whole response (unlike opaqueredirect in browsers),
> ++    # so urllib3 can set `redirect: manual` to control redirects itself.
> ++    # https://stackoverflow.com/a/78524615
> ++    if _is_node_js():
> ++        fetch_data["redirect"] = "manual"
> ++    # Call JavaScript fetch (async api, returns a promise)
> ++    fetcher_promise_js = js.fetch(request.url, _obj_from_dict(fetch_data))
> ++    # Now suspend WebAssembly until we resolve that promise
> ++    # or time out.
> ++    response_js = _run_sync_with_timeout(
> ++        fetcher_promise_js,
> ++        timeout,
> ++        js_abort_controller,
> ++        request=request,
> ++        response=None,
> ++    )
> ++    headers = {}
> ++    header_iter = response_js.headers.entries()
> ++    while True:
> ++        iter_value_js = header_iter.next()
> ++        if getattr(iter_value_js, "done", False):
> ++            break
> ++        else:
> ++            headers[str(iter_value_js.value[0])] = str(iter_value_js.value[1])
> ++    status_code = response_js.status
> ++    body: bytes | io.RawIOBase = b""
> ++
> ++    response = EmscriptenResponse(
> ++        status_code=status_code, headers=headers, body=b"", request=request
> ++    )
> ++    if streaming:
> ++        # get via inputstream
> ++        if response_js.body is not None:
> ++            # get a reader from the fetch response
> ++            body_stream_js = response_js.body.getReader()
> ++            body = _JSPIReadStream(
> ++                body_stream_js, timeout, request, response, js_abort_controller
> ++            )
> ++    else:
> ++        # get directly via arraybuffer
> ++        # n.b. this is another async JavaScript call.
> ++        body = _run_sync_with_timeout(
> ++            response_js.arrayBuffer(),
> ++            timeout,
> ++            js_abort_controller,
> ++            request=request,
> ++            response=response,
> ++        ).to_py()
> ++    response.body = body
> ++    return response
> ++
> ++
> ++def _is_node_js() -> bool:
> ++    """
> ++    Check if we are in Node.js.
> ++
> ++    :return: True if we are in Node.js.
> ++    :rtype: bool
> ++    """
> ++    return (
> ++        hasattr(js, "process")
> ++        and hasattr(js.process, "release")
> ++        # According to the Node.js documentation, the release name is always "node".
> ++        and js.process.release.name == "node"
> ++    )
> ++
> ++
> + def streaming_ready() -> bool | None:
> +     if _fetcher:
> +         return _fetcher.streaming_ready
> +diff --git a/test/contrib/emscripten/test_emscripten.py b/test/contrib/emscripten/test_emscripten.py
> +index 0e107fa..d94eda5 100644
> +--- a/test/contrib/emscripten/test_emscripten.py
> ++++ b/test/contrib/emscripten/test_emscripten.py
> +@@ -965,6 +965,52 @@ def test_redirects(
> +     )
> +
> +
> ++@pytest.mark.with_jspi
> ++def test_disabled_redirects(
> ++    selenium_coverage: typing.Any, testserver_http: PyodideServerInfo
> ++) -> None:
> ++    """
> ++    Test that urllib3 can control redirects in Node.js.
> ++    """
> ++
> ++    @run_in_pyodide  # type: ignore[misc]
> ++    def pyodide_test(selenium_coverage: typing.Any, host: str, port: int) -> None:
> ++        import pytest
> ++
> ++        from urllib3 import PoolManager, request
> ++        from urllib3.contrib.emscripten.fetch import _is_node_js
> ++        from urllib3.exceptions import MaxRetryError
> ++
> ++        if not _is_node_js():
> ++            pytest.skip("urllib3 does not control redirects in browsers.")
> ++
> ++        redirect_url = f"http://{host}:{port}/redirect"
> ++
> ++        with PoolManager(retries=0) as http:
> ++            with pytest.raises(MaxRetryError):
> ++                http.request("GET", redirect_url)
> ++
> ++            response = http.request("GET", redirect_url, redirect=False)
> ++            assert response.status == 303
> ++
> ++        with PoolManager(retries=False) as http:
> ++            response = http.request("GET", redirect_url)
> ++            assert response.status == 303
> ++
> ++        with pytest.raises(MaxRetryError):
> ++            request("GET", redirect_url, retries=0)
> ++
> ++        response = request("GET", redirect_url, redirect=False)
> ++        assert response.status == 303
> ++
> ++        response = request("GET", redirect_url, retries=0, redirect=False)
> ++        assert response.status == 303
> ++
> ++    pyodide_test(
> ++        selenium_coverage, testserver_http.http_host, testserver_http.http_port
> ++    )
> ++
> ++
> + @install_urllib3_wheel()
> + def test_insecure_requests_warning(
> +     selenium_coverage: typing.Any, testserver_http: PyodideServerInfo
> +--
> +2.40.0
> diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
> index bdb1c7ca8d..beb57010ac 100644
> --- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
> +++ b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
> @@ -9,6 +9,7 @@ inherit pypi python_hatchling
>  
>  SRC_URI += " \
>      file://CVE-2025-50181.patch \
> +    file://CVE-2025-50182.patch \
>  "
>  
>  RDEPENDS:${PN} += "\
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219915): https://lists.openembedded.org/g/openembedded-core/message/219915
> Mute This Topic: https://lists.openembedded.org/mt/113981495/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


