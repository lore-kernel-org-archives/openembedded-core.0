Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947AAD3569B
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 10:06:21 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9753.1769594776921677477
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 02:06:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DhxGhNHi;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4807068eacbso2663635e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 02:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769594775; x=1770199575; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N/tz+ecb5Iuw+jtkIJYpra02q3ZRBLaVKJLh6su3XEA=;
        b=DhxGhNHiHW520xcw4iSKZ1GK4/6l5Ox1D2iVTQdj1HwqheOZKoQGm6IkYb/GWSy7Cs
         IMSd3VyTipINqjnrH/OwM1Ah1gqTNyKeDP/8ZwjzRwERJ3Vp2Jy15JW1w+jyrXyqGiWK
         OqeqM2aKIpsmx1DLH3wetP96V6hMF323ofviY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594775; x=1770199575;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/tz+ecb5Iuw+jtkIJYpra02q3ZRBLaVKJLh6su3XEA=;
        b=dDIJk/e9RroayV7fVL2N43z5uz5RTYc5/yYfN/AXHiC9wcjTJ4CSqLTRkEw61W2K6C
         wf/WV5Dxrkwr6i7IVMABKwXhOL39/i6yZ76IaVmodOwAhm9m94pQpLTnpha3TloCJg2h
         J5ZDHW15/UDDvPajZ5Xd2yOdkXHD+QRv0+bUOXFMue8rIdMCkreXEqmQX5RFKuuRM3r7
         xBbJxj31vrJr85nBkzmKlj5zY79ZwYq+aTS3qGxVMDzJoIK4PKHhjI9wesXwbYZJr38e
         q0dybJDqgfneOs/limvAtQKtufmrusaXmbAinlGxyCppFYJrTev4+DDYDNXGbP+XXxLt
         eHyA==
X-Forwarded-Encrypted: i=1; AJvYcCWhA7ayzRznrSRROSy1yRRjOMLNpkc06uJSCf8in7kMMPjC/bH84aFgul79VoeHyt/eL/wmmMb/dSmsa9PtSmZDjg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxin26zsmaJSYqLnv9o70IP6Yniv16RKz0PWxiAnLJcB9ajjO89
	7QRBAx9TQBaAvX+t9JR4avJsrNAZDfZHLijXvx0cusA9kSEK4zNOeVJL6MTTjIrtF5U=
X-Gm-Gg: AZuq6aKZFvrYAKBXf2Zvn41uYEu2/kwLUMK7IxD56/woLKRSeDsnGg2frkeMwnXt8RF
	7MKsGxY+pZHvvHxXvciKsYKiFxDtUxGYu/1Ul5fwfrgn1T6BPMTWbbeIkxyWgQnHxbMyrcYdFpe
	JqqnEOsS6LZD1GyUI+1M/aY2UBuLupLNZ/ETeV+CxhXYsCEEFdY1VvbcQXBWtSXOJCZqwHCs32/
	/tBUlkXxaAfZujLIZQ5W8YeKhFPXWXccWZvFk0rwbx+n8BJ7c2FpckK6i8lfpSodlpUxV3wGy/T
	2L98kB6sw/Vn1kQ78Pjqm1rM/zldCAaaSptNu8woFPMWAVvF/irSaPY1NiXYe33DKH2azo7HCTN
	YQFlMCRBrB9vJ5+YT4ss3q1yfTNtN9y+mw8iVBwH6pxTyf3igIBdj2ukNlcqmR7IVdTEp9XoSOE
	/2Bkw7uqNMzpDq5As9wxt/7E7L+O1NWuwRVsifpyqFLigX70piC+tAKAaiyQ741fRFpl+5+Sy8i
	BM=
X-Received: by 2002:a05:600c:820c:b0:47e:e970:b4e4 with SMTP id 5b1f17b1804b1-48069c7de80mr53008185e9.29.1769594775142;
        Wed, 28 Jan 2026 02:06:15 -0800 (PST)
Received: from [10.1.10.24] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cddffc0sm63147165e9.5.2026.01.28.02.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 02:06:14 -0800 (PST)
Message-ID: <91584b1f-4740-439c-b27e-4e773f0656c9@smile.fr>
Date: Wed, 28 Jan 2026 11:06:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] Backport fix for CVE-2026-21441 Python3
 urllib3
To: adarsh.jagadish.kamini@est.tech, openembedded-core@lists.openembedded.org
References: <20260127154003.96816-1-adarsh.jagadish.kamini@est.tech>
From: Yoann Congal <yoann.congal@smile.fr>
Content-Language: en-US, fr
Organization: Smile ECS
In-Reply-To: <20260127154003.96816-1-adarsh.jagadish.kamini@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 10:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230086



Le 27/01/2026 à 16:39, adarsh.jagadish.kamini via lists.openembedded.org
a écrit :
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> 
> Include the patch linked in the NVD report : https://nvd.nist.gov/vuln/detail/CVE-2026-21441
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Hello,

This patch lacks the "tag:" at the start of the title.
Can you send a v3 with a "python-urllib3: Backport fix CVE-2026-21441"
title?

Thanks!

> ---
>  .../python3-urllib3/CVE-2026-21441.patch      | 105 ++++++++++++++++++
>  .../python/python3-urllib3_2.2.2.bb           |   1 +
>  2 files changed, 106 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
> 
> diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
> new file mode 100644
> index 0000000000..16af67af31
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
> @@ -0,0 +1,105 @@
> +From 686d2bdd4affd3c86e605f54a72afe53c920f72f Mon Sep 17 00:00:00 2001
> +From: Illia Volochii <illia.volochii@gmail.com>
> +Date: Wed, 7 Jan 2026 18:07:30 +0200
> +Subject: [PATCH] Backport fix CVE-2026-21441 python urllib3
> +
> +Original commit: 8864ac407bba8607950025e0979c4c69bc7abc7b
> +Original-author: Illia Volochii <illia.volochii@gmail.com>
> +
> +Bugfixes
> +--------
> +
> +- Fixed a high-severity security issue where decompression-bomb safeguards of
> +  the streaming API were bypassed when HTTP redirects were followed.
> +  (`GHSA-38jv-5279-wg99 <https://github.com/urllib3/urllib3/security/advisories/GHSA-38jv-5279-wg99>`__)
> +
> +* Stop decoding response content during redirects needlessly
> +
> +* Rename the new query parameter
> +
> +* Add a changelog entry
> +
> +Fixes CVE-2026-21441
> +CVE: CVE-2026-21441
> +
> +Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/8864ac407bba8607950025e0979c4c69bc7abc7b]
> +
> +Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> +---
> + dummyserver/app.py                           |  8 +++++++-
> + src/urllib3/response.py                      |  6 +++++-
> + test/with_dummyserver/test_connectionpool.py | 19 +++++++++++++++++++
> + 3 files changed, 31 insertions(+), 2 deletions(-)
> +
> +diff --git a/dummyserver/app.py b/dummyserver/app.py
> +index 9fc9d1b7..c4978152 100644
> +--- a/dummyserver/app.py
> ++++ b/dummyserver/app.py
> +@@ -233,10 +233,16 @@ async def redirect() -> ResponseReturnValue:
> +     values = await request.values
> +     target = values.get("target", "/")
> +     status = values.get("status", "303 See Other")
> ++    compressed = values.get("compressed") == "true"
> +     status_code = status.split(" ")[0]
> + 
> +     headers = [("Location", target)]
> +-    return await make_response("", status_code, headers)
> ++    if compressed:
> ++        headers.append(("Content-Encoding", "gzip"))
> ++        data = gzip.compress(b"foo")
> ++    else:
> ++        data = b""
> ++    return await make_response(data, status_code, headers)
> + 
> + 
> + @hypercorn_app.route("/redirect_after")
> +diff --git a/src/urllib3/response.py b/src/urllib3/response.py
> +index a0273d65..909da62b 100644
> +--- a/src/urllib3/response.py
> ++++ b/src/urllib3/response.py
> +@@ -646,7 +646,11 @@ class HTTPResponse(BaseHTTPResponse):
> +         Unread data in the HTTPResponse connection blocks the connection from being released back to the pool.
> +         """
> +         try:
> +-            self.read()
> ++            self.read(
> ++                # Do not spend resources decoding the content unless
> ++                # decoding has already been initiated.
> ++                decode_content=self._has_decoded_content,
> ++            )
> +         except (HTTPError, OSError, BaseSSLError, HTTPException):
> +             pass
> + 
> +diff --git a/test/with_dummyserver/test_connectionpool.py b/test/with_dummyserver/test_connectionpool.py
> +index 4fbe6a4f..ebcdf9bf 100644
> +--- a/test/with_dummyserver/test_connectionpool.py
> ++++ b/test/with_dummyserver/test_connectionpool.py
> +@@ -480,6 +480,25 @@ class TestConnectionPool(HypercornDummyServerTestCase):
> +             assert r.status == 200
> +             assert r.data == b"Dummy server!"
> + 
> ++    @mock.patch("urllib3.response.GzipDecoder.decompress")
> ++    def test_no_decoding_with_redirect_when_preload_disabled(
> ++        self, gzip_decompress: mock.MagicMock
> ++    ) -> None:
> ++        """
> ++        Test that urllib3 does not attempt to decode a gzipped redirect
> ++        response when `preload_content` is set to `False`.
> ++        """
> ++        with HTTPConnectionPool(self.host, self.port) as pool:
> ++            # Three requests are expected: two redirects and one final / 200 OK.
> ++            response = pool.request(
> ++                "GET",
> ++                "/redirect",
> ++                fields={"target": "/redirect?compressed=true", "compressed": "true"},
> ++                preload_content=False,
> ++            )
> ++        assert response.status == 200
> ++        gzip_decompress.assert_not_called()
> ++
> +     def test_303_redirect_makes_request_lose_body(self) -> None:
> +         with HTTPConnectionPool(self.host, self.port) as pool:
> +             response = pool.request(
> +-- 
> +2.44.0
> +
> diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
> index 620927322a..f6ac8f89ca 100644
> --- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
> +++ b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
> @@ -11,6 +11,7 @@ SRC_URI += " \
>      file://CVE-2025-50181.patch \
>      file://CVE-2025-66418.patch \
>      file://CVE-2025-66471.patch \
> +    file://CVE-2026-21441.patch \
>  "
>  
>  RDEPENDS:${PN} += "\
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230083): https://lists.openembedded.org/g/openembedded-core/message/230083
> Mute This Topic: https://lists.openembedded.org/mt/117504610/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yoann.congal@smile.fr]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Yoann Congal
Smile ECS


