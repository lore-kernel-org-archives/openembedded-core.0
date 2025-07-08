Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71953C8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 14:34:34 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.20613.1751985266605756783
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 07:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hnrsirEQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae0ccfd5ca5so702934666b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 07:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751985265; x=1752590065; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VYZrLZiKG/6xNc/VjqdsIwpWshfVxyIOiEjX8WapgK4=;
        b=hnrsirEQniz7HN0zMMkD+fbSyZP9iLtAQrinJQblTL8uG2+u7ZZefOwCnt1Feg6xe/
         CBOwGPDdyeGpXEfdfvws1DGa7w0A/QFxQt4HxMNlDFjQIkEKNl5oKapn4Q8rWXny/uLa
         J5ZFADYkby706UjomBX/VTgDbxlBzoJDE9OinkodB27ayWPgOACjZRoGeHc0X9Rl9vvL
         c5SItVKWHCkmo/O9ayUj5bYW90S7rhPQsK1eZa/trtcGOaca4c6l+k5vqeVDBvmiXxoP
         +EfQHnB9PrmG+X/lNQu1PThNvKBMd6Wni3QW1YJqHaxZ/SIoqeJNamAXitGESAghUMMz
         cVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751985265; x=1752590065;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VYZrLZiKG/6xNc/VjqdsIwpWshfVxyIOiEjX8WapgK4=;
        b=Aj88TCjN0ZvWCsLlAQvM2EcO1549uF2TXxw8xGlWHkClLSPzjKfRfM4gmm9IcoaC0R
         219458Guof+qM0pXCZ++3aUzFScpSjR2FFmi5gjF0n1+xtPQ5PY1cbdJbdzNNSJjYKv1
         z31mFDVkZ2jQ8OoHNNOunPhUTtfgbKd00z5lL/P886/2k0vobCfRkKHdtSk3OgWbG5q/
         BRIlgHg1gKFJqOKK7x6C/Px6ZXB1uiodIqJup1gWzi2+CjTXq+hZx+kwaz+Yksdu1keL
         5WzXajQfs0sRO/PFs2sro4viF6RGZ2MjWmpmivrESLM21yromXRgikjJv6ywcNq+C/St
         K6Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXLDFCEchBMkZmJTV3Pe0U5FwgWSMDRE6Qt4LQCXCYOXjs5JUeZwdAzlGrHFUSQrZfBBQj7aHMrCJFNALNKRTPUCQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz7zN/BSXjREMDE/kndp/jXDj0FLVk9YywNr+s1ZmhCWH+OBFw3
	KOfc/+QZ9rQ7OlHACPJ88aa+V+iMRYlYLhwfWVLTBB61ClxPJJKFlw446W+g9g==
X-Gm-Gg: ASbGnctv5UWkp+ztsqjQAcrs6goUJiLUocjkldV2XzH82bMX08VGoXBTyYKn+o28JEL
	pItdFm6ihjega8qILrjxIY8VswHfVpjmoeJ9AZ+O0jTL2BHsnyT/W+5/AoXSja94WqaNRI0FM1t
	deI/y6RWmp5drz4A0lLOmRCPvjiqL3ceDPOaezM+w0JFgh86weWa9tzYfXBz0iW542aVzh+SVQR
	I7c88NCWnb5AkJ2tTutjGFyOhzjCiTAEXBxaeNIvrA/Tu9zmocYZEZgDXhrQ9vdUACU0FxH1mTO
	BAD9439xY7jcD639YD3Q+4JKbBa39WigDOZlvaIBEzZJwf4+UO2/NfrUdLS2es9a9/w18g==
X-Google-Smtp-Source: AGHT+IHUMnU38PM8TxuYrr+261Hj0irRu6zMct28+o2IQwdxVl0ZQysuwz5bVu5EY/Jo+3IdCAjnAg==
X-Received: by 2002:a17:906:6a0f:b0:adb:9e8:8f17 with SMTP id a640c23a62f3a-ae3fe82b351mr1632909866b.52.1751985264198;
        Tue, 08 Jul 2025 07:34:24 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b02a2esm899796266b.119.2025.07.08.07.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 07:34:23 -0700 (PDT)
Message-ID: <fa78837a-ec6a-479a-8f7b-a5e776bf7b59@gmail.com>
Date: Tue, 8 Jul 2025 16:34:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap][PATCH 2/2] python3-urllib3: fix
 CVE-2025-50182
To: Yogita.Urade@windriver.com, openembedded-core@lists.openembedded.org
References: <20250704103539.265785-1-yogita.urade@windriver.com>
 <20250704103539.265785-2-yogita.urade@windriver.com>
 <184F076759EA63BF.31782@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <184F076759EA63BF.31782@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 14:34:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220031

On 7/4/25 13:01, Gyorgy Sarvari via lists.openembedded.org wrote:
> I think this patch isn't correct, and I believe there is a typo in the
> CVE upstream description also.
>
> 1. Regarding the patch: The vulnerable method, send_jspi_request() does
> not exist in the Scarthgap version. This patch basically introduces the
> vulnerable new feature (which wasn't there initially) before fixing it.
> 2. Regarding the CVE: I think the first vulnerable version is actually
> 2.3.0, and the vulnerability was actually introduced with this[1] commit.
>
> I am only ~80% sure about the 2nd comment, about 2.2.2 being not
> vulnerable. In case this version is actually vulnerable, then I think
> the fix should be somewhere in the middle of _StreamingFetcher.send()
> method of the same file (which is only a guess after a bit of eyeballing).
>
> [1]:
> https://github.com/urllib3/urllib3/commit/8b2474d32b57f096a815ab52f9b54a843d68c140

FTR: I have asked the urllib3 devs also about this[1]: The Scarthgap
version is vulnerable, but it is unpatchable, as the vulnerability lies
in the fact that you can't control (from the library) how browsers
handle redirections. This limitation seems to be inherent to the
feature. The fix itself is applicable for 2.3.0+.

[1]: https://github.com/urllib3/urllib3/issues/3640

>
> On 7/4/25 12:35, Urade, Yogita via lists.openembedded.org wrote:
>> From: Yogita Urade <yogita.urade@windriver.com>
>>
>> urllib3 is a user-friendly HTTP client library for Python. Prior to
>> 2.5.0, urllib3 does not control redirects in browsers and Node.js.
>> urllib3 supports being used in a Pyodide runtime utilizing the
>> JavaScript Fetch API or falling back on XMLHttpRequest. This means
>> Python libraries can be used to make HTTP requests from a browser or
>> Node.js. Additionally, urllib3 provides a mechanism to control redirects,
>> but the retries and redirect parameters are ignored with Pyodide; the
>> runtime itself determines redirect behavior. This issue has been
>> patched in version 2.5.0.
>>
>> Reference:
>> https://nvd.nist.gov/vuln/detail/CVE-2025-50182
>>
>> Upstream patch:
>> https://github.com/urllib3/urllib3/commit/7eb4a2aafe49a279c29b6d1f0ed0f42e9736194f
>>
>> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
>> ---
>>  .../python3-urllib3/CVE-2025-50182.patch      | 195 ++++++++++++++++++
>>  .../python/python3-urllib3_2.2.2.bb           |   1 +
>>  2 files changed, 196 insertions(+)
>>  create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch
>>
>> diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch
>> new file mode 100644
>> index 0000000000..d99e83a619
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch
>> @@ -0,0 +1,195 @@
>> +From 7eb4a2aafe49a279c29b6d1f0ed0f42e9736194f Mon Sep 17 00:00:00 2001
>> +From: Illia Volochii <illia.volochii@gmail.com>
>> +Date: Wed, 18 Jun 2025 16:30:35 +0300
>> +Subject: [PATCH] Merge commit from fork
>> +
>> +Changes:
>> +- Take only send_jspi_request API from commit
>> +https://github.com/urllib3/urllib3/commit/8b2474d32b57f096a815ab52f9b54a843d68c140
>> +
>> +CVE: CVE-2025-50182
>> +Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/7eb4a2aafe49a279c29b6d1f0ed0f42e9736194f]
>> +
>> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
>> +---
>> + docs/reference/contrib/emscripten.rst      |  2 +-
>> + src/urllib3/contrib/emscripten/fetch.py    | 93 ++++++++++++++++++++++
>> + test/contrib/emscripten/test_emscripten.py | 46 +++++++++++
>> + 3 files changed, 140 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/docs/reference/contrib/emscripten.rst b/docs/reference/contrib/emscripten.rst
>> +index c88e422..3ff9cdd 100644
>> +--- a/docs/reference/contrib/emscripten.rst
>> ++++ b/docs/reference/contrib/emscripten.rst
>> +@@ -68,7 +68,7 @@ Features which are usable with Emscripten support are:
>> + * Timeouts
>> + * Retries
>> + * Streaming (with Web Workers and Cross-Origin Isolation)
>> +-* Redirects (determined by browser/runtime, not restrictable with urllib3)
>> ++* Redirects (urllib3 controls redirects in Node.js but not in browsers where behavior is determined by runtime)
>> + * Decompressing response bodies
>> +
>> + Features which don't work with Emscripten:
>> +diff --git a/src/urllib3/contrib/emscripten/fetch.py b/src/urllib3/contrib/emscripten/fetch.py
>> +index 8d197ea..539df99 100644
>> +--- a/src/urllib3/contrib/emscripten/fetch.py
>> ++++ b/src/urllib3/contrib/emscripten/fetch.py
>> +@@ -403,6 +403,99 @@ def send_request(request: EmscriptenRequest) -> EmscriptenResponse:
>> +             raise _RequestError(err.message, request=request)
>> +
>> +
>> ++def send_jspi_request(
>> ++    request: EmscriptenRequest, streaming: bool
>> ++) -> EmscriptenResponse:
>> ++    """
>> ++    Send a request using WebAssembly JavaScript Promise Integration
>> ++    to wrap the asynchronous JavaScript fetch api (experimental).
>> ++
>> ++    :param request:
>> ++        Request to send
>> ++
>> ++    :param streaming:
>> ++        Whether to stream the response
>> ++
>> ++    :return: The response object
>> ++    :rtype: EmscriptenResponse
>> ++    """
>> ++    timeout = request.timeout
>> ++    js_abort_controller = js.AbortController.new()
>> ++    headers = {k: v for k, v in request.headers.items() if k not in HEADERS_TO_IGNORE}
>> ++    req_body = request.body
>> ++    fetch_data = {
>> ++        "headers": headers,
>> ++        "body": to_js(req_body),
>> ++        "method": request.method,
>> ++        "signal": js_abort_controller.signal,
>> ++    }
>> ++    # Node.js returns the whole response (unlike opaqueredirect in browsers),
>> ++    # so urllib3 can set `redirect: manual` to control redirects itself.
>> ++    # https://stackoverflow.com/a/78524615
>> ++    if _is_node_js():
>> ++        fetch_data["redirect"] = "manual"
>> ++    # Call JavaScript fetch (async api, returns a promise)
>> ++    fetcher_promise_js = js.fetch(request.url, _obj_from_dict(fetch_data))
>> ++    # Now suspend WebAssembly until we resolve that promise
>> ++    # or time out.
>> ++    response_js = _run_sync_with_timeout(
>> ++        fetcher_promise_js,
>> ++        timeout,
>> ++        js_abort_controller,
>> ++        request=request,
>> ++        response=None,
>> ++    )
>> ++    headers = {}
>> ++    header_iter = response_js.headers.entries()
>> ++    while True:
>> ++        iter_value_js = header_iter.next()
>> ++        if getattr(iter_value_js, "done", False):
>> ++            break
>> ++        else:
>> ++            headers[str(iter_value_js.value[0])] = str(iter_value_js.value[1])
>> ++    status_code = response_js.status
>> ++    body: bytes | io.RawIOBase = b""
>> ++
>> ++    response = EmscriptenResponse(
>> ++        status_code=status_code, headers=headers, body=b"", request=request
>> ++    )
>> ++    if streaming:
>> ++        # get via inputstream
>> ++        if response_js.body is not None:
>> ++            # get a reader from the fetch response
>> ++            body_stream_js = response_js.body.getReader()
>> ++            body = _JSPIReadStream(
>> ++                body_stream_js, timeout, request, response, js_abort_controller
>> ++            )
>> ++    else:
>> ++        # get directly via arraybuffer
>> ++        # n.b. this is another async JavaScript call.
>> ++        body = _run_sync_with_timeout(
>> ++            response_js.arrayBuffer(),
>> ++            timeout,
>> ++            js_abort_controller,
>> ++            request=request,
>> ++            response=response,
>> ++        ).to_py()
>> ++    response.body = body
>> ++    return response
>> ++
>> ++
>> ++def _is_node_js() -> bool:
>> ++    """
>> ++    Check if we are in Node.js.
>> ++
>> ++    :return: True if we are in Node.js.
>> ++    :rtype: bool
>> ++    """
>> ++    return (
>> ++        hasattr(js, "process")
>> ++        and hasattr(js.process, "release")
>> ++        # According to the Node.js documentation, the release name is always "node".
>> ++        and js.process.release.name == "node"
>> ++    )
>> ++
>> ++
>> + def streaming_ready() -> bool | None:
>> +     if _fetcher:
>> +         return _fetcher.streaming_ready
>> +diff --git a/test/contrib/emscripten/test_emscripten.py b/test/contrib/emscripten/test_emscripten.py
>> +index 0e107fa..d94eda5 100644
>> +--- a/test/contrib/emscripten/test_emscripten.py
>> ++++ b/test/contrib/emscripten/test_emscripten.py
>> +@@ -965,6 +965,52 @@ def test_redirects(
>> +     )
>> +
>> +
>> ++@pytest.mark.with_jspi
>> ++def test_disabled_redirects(
>> ++    selenium_coverage: typing.Any, testserver_http: PyodideServerInfo
>> ++) -> None:
>> ++    """
>> ++    Test that urllib3 can control redirects in Node.js.
>> ++    """
>> ++
>> ++    @run_in_pyodide  # type: ignore[misc]
>> ++    def pyodide_test(selenium_coverage: typing.Any, host: str, port: int) -> None:
>> ++        import pytest
>> ++
>> ++        from urllib3 import PoolManager, request
>> ++        from urllib3.contrib.emscripten.fetch import _is_node_js
>> ++        from urllib3.exceptions import MaxRetryError
>> ++
>> ++        if not _is_node_js():
>> ++            pytest.skip("urllib3 does not control redirects in browsers.")
>> ++
>> ++        redirect_url = f"http://{host}:{port}/redirect"
>> ++
>> ++        with PoolManager(retries=0) as http:
>> ++            with pytest.raises(MaxRetryError):
>> ++                http.request("GET", redirect_url)
>> ++
>> ++            response = http.request("GET", redirect_url, redirect=False)
>> ++            assert response.status == 303
>> ++
>> ++        with PoolManager(retries=False) as http:
>> ++            response = http.request("GET", redirect_url)
>> ++            assert response.status == 303
>> ++
>> ++        with pytest.raises(MaxRetryError):
>> ++            request("GET", redirect_url, retries=0)
>> ++
>> ++        response = request("GET", redirect_url, redirect=False)
>> ++        assert response.status == 303
>> ++
>> ++        response = request("GET", redirect_url, retries=0, redirect=False)
>> ++        assert response.status == 303
>> ++
>> ++    pyodide_test(
>> ++        selenium_coverage, testserver_http.http_host, testserver_http.http_port
>> ++    )
>> ++
>> ++
>> + @install_urllib3_wheel()
>> + def test_insecure_requests_warning(
>> +     selenium_coverage: typing.Any, testserver_http: PyodideServerInfo
>> +--
>> +2.40.0
>> diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
>> index bdb1c7ca8d..beb57010ac 100644
>> --- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
>> +++ b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
>> @@ -9,6 +9,7 @@ inherit pypi python_hatchling
>>  
>>  SRC_URI += " \
>>      file://CVE-2025-50181.patch \
>> +    file://CVE-2025-50182.patch \
>>  "
>>  
>>  RDEPENDS:${PN} += "\
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219917): https://lists.openembedded.org/g/openembedded-core/message/219917
> Mute This Topic: https://lists.openembedded.org/mt/113981495/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


