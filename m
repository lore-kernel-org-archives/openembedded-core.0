Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED005D4661B
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 19:20:07 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2891.1768504805828446749
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 11:20:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MqWCncSI;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-45c8e85deffso356418b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 11:20:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768504805; cv=none;
        d=google.com; s=arc-20240605;
        b=YcJxcHW8Kky2QlPmG/59zDs4NlBJiHak7QmFXUfbGF3HtIIqpzaiFZRO2HB6LjJdsP
         3x6+2Cn0V482jLGqO7NkditUQQQmaurWMxhEWUKOsBpaUgGQvPJGF/hqpgbg+I6blkBr
         UfuTUPCN+GXhPwUCkEfLUMJu3ixw7bl0iPXZm1tm8mz34gF5Euscgh09enaAvhx8fO0S
         2ESXcsFMSvzO60YTbjxuIu4EJUrs3WuhFxGUnp2V6PFxb3+7Gt1BOfjp5gZ5rUX2IoTh
         zK8zDj9PyYrnR8OAlmb2/O2wb9IxoQmBEITst8stAGgxgKkAnvHASvldRGZjGQ0Y02w4
         M++Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NdyR0eiMmovTtK7IEgTAqX2s68WAes2726CAQuSo9E8=;
        fh=f8qhyk60bn1QrhWK5icWcISvI/hI/SSufb2KE0XpGZo=;
        b=jLVgrDK2U7pWsPgqm7rRFdNOoNC9s8khc2HfaAx6L1jMJLeFZZM+NvQyQgsSvJW27G
         VMsqj/Svs4T8OaqI/CjcbsEcfjMVk+IDFOm+D8syALX92ZaljWZX0X0tYW4BdO8ETHBk
         6t6NBbHnBWYqB/eE70wjjtjkHqgdlxQa4qGw6pYElJ3SJ5ihxMNTbBndM9gm+XHobanv
         3cNnyVZVEQo65Ga5L5ShGNO4yJKOIRrLEClYANCR4BzVGuVT4vEbD1tAd2knuCeqViRS
         IVaQLJdq2L9B8s84mU06u1xnaXtHR3jrCFUT6t3AnhzPvAvJoxa/GATRX9xk7suhiFSt
         z2oQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504805; x=1769109605; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdyR0eiMmovTtK7IEgTAqX2s68WAes2726CAQuSo9E8=;
        b=MqWCncSIa/WwIGTzvP07AHqellJhoVhh8vAKh1QffT6A0eZuypKOkXMrWh+ea1E1Wr
         wRJHKIK56iaFD+l3YrV1Ad70WTVFNBBowBkXYiSZ2LnbxG5NGDCZGNkOwWymvgzRMQEv
         1hxE80Tls29RYs7e5LmMfHBpYxCn/dwhD4SfM72KEHJlHflmeJBz5waQ8HRdh+Yru47H
         PAMktnXiUe7YXJxRT2B1IWV/r4cOFZGtINBozdReqwAPZTp6LkqqkyMAfA3Ah/AT1krg
         ySrgLgnscy4Or+sm2bU9lEE0fxEdOQWTOxVLwXii/+XlZBvtuETxn7+a896r6ms5uUH0
         iH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504805; x=1769109605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NdyR0eiMmovTtK7IEgTAqX2s68WAes2726CAQuSo9E8=;
        b=L0vKuV1+yF3fI+gcsPI9NmK3OEQ7g4g5d6JJ+WjMNZkZ4B0R5iDZUv/nco1ViOCqrN
         O2xiSj5z9D8Y/2yqQyAvuTCHPMjayy3tBvMIg6aWCiPpCM8H7Mj5r2Gt8BKNZ2oj8EUy
         qFBA1yqVHtYDclQgQBYuP+eYHBjCr//jVmURtnw19aePU0nlcERoIghrK0+F3yyLQStf
         2UZ66DzZkn0tiqXEBMkuSZy9+PSPW7viU88NjsHmR4/TUYG4sLfyia9bhiXiQpi8HW58
         x+ba1BNs+lmQxqZ8T/wI3rFbto8EQFBUk5ZjXIOWX1VQl+UqxxNmKMgjld0oGxqWs21y
         UWQw==
X-Gm-Message-State: AOJu0YzHpIbga8hqdETXg8eHTJAPul0TYVf+J9o4UhdwsXs7DMzbA+US
	wuNJCT/4W6fcpreKgThpH+4oM4VQ1r3IjKNB4ITCCa9Zy5mBPvvsQDoWN45Q/YxXJ/BisKYk+jT
	rIP0FhiGl4FbRKSJASoUauqMka6lINWOqBRh+
X-Gm-Gg: AY/fxX6KTq3FqA8YzJFhhnszeg1dgn1NM0QzxLcnqQLuWB9xPG+9kpzDaBw9k+i62zG
	rg902bFJPfzOtD2rcMGcKMS723cThkaniJX4OeTJ7jDXtneKU5xcHD9LZrYzROP+EqMJINZspXv
	sWEx1gQ5fkdBL8ZC/NG8CIeZRNYPEQvwPqa3VAlC58ygbnuR/SpXbhesHmYvKftHjGWG6jnBagD
	eK5Lb3USO8WeSvmp9FQBJA3CVt8fgCzPy5Ybx8fC2+0Ow8wFHofkOdJf3ZnyIDi4w1P7SeF
X-Received: by 2002:a05:6808:221d:b0:45c:8045:89b2 with SMTP id
 5614622812f47-45c9d859191mr154144b6e.35.1768504804935; Thu, 15 Jan 2026
 11:20:04 -0800 (PST)
MIME-Version: 1.0
References: <20260115133246.405765-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260115133246.405765-1-adarsh.jagadish.kamini@est.tech>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 16 Jan 2026 08:19:53 +1300
X-Gm-Features: AZwV_QgwAqWwKfLar-abYOn8PnmuAxToev3jJQbTavnbuV4wQM9Jsl9qFrDbxaA
Message-ID: <CADySD0G7UL6t88YxJPG56X8kMEKwbSMtwT0-0jNVgaJR4oGH8g@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] Backport fix for CVE-2026-21441
 Python3 urllib3
To: adarsh.jagadish.kamini@est.tech
Cc: openembedded-core@lists.openembedded.org, david.nystrom@est.tech
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 19:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229436

thank you for the patch but commit message needs to be improved,
please prefix it with recipe name
"python3-urllib3: <>"

https://docs.yoctoproject.org/contributor-guide/submit-changes.html#impleme=
nt-and-commit-changes

On Fri, Jan 16, 2026 at 2:33=E2=80=AFAM adarsh.jagadish.kamini via
lists.openembedded.org
<adarsh.jagadish.kamini=3Dest.tech@lists.openembedded.org> wrote:
>
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  .../python3-urllib3/CVE-2026-21441.patch      | 105 ++++++++++++++++++
>  .../python/python3-urllib3_2.2.2.bb           |   1 +
>  2 files changed, 106 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026=
-21441.patch
>
> diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.=
patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
> new file mode 100644
> index 0000000000..16af67af31
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
> @@ -0,0 +1,105 @@
> +From 686d2bdd4affd3c86e605f54a72afe53c920f72f Mon Sep 17 00:00:00 2001
> +From: Illia Volochii <illia.volochii@gmail.com>
> +Date: Wed, 7 Jan 2026 18:07:30 +0200
> +Subject: [OE-core][scarthgap][PATCH] Backport fix CVE-2026-21441 python =
urllib3
> +
> +Original commit: 8864ac407bba8607950025e0979c4c69bc7abc7b
> +Original-author: Illia Volochii <illia.volochii@gmail.com>
> +
> +Bugfixes
> +--------
> +
> +- Fixed a high-severity security issue where decompression-bomb safeguar=
ds of
> +  the streaming API were bypassed when HTTP redirects were followed.
> +  (`GHSA-38jv-5279-wg99 <https://github.com/urllib3/urllib3/security/adv=
isories/GHSA-38jv-5279-wg99>`__)
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
> +Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/886=
4ac407bba8607950025e0979c4c69bc7abc7b]
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
> +     values =3D await request.values
> +     target =3D values.get("target", "/")
> +     status =3D values.get("status", "303 See Other")
> ++    compressed =3D values.get("compressed") =3D=3D "true"
> +     status_code =3D status.split(" ")[0]
> +
> +     headers =3D [("Location", target)]
> +-    return await make_response("", status_code, headers)
> ++    if compressed:
> ++        headers.append(("Content-Encoding", "gzip"))
> ++        data =3D gzip.compress(b"foo")
> ++    else:
> ++        data =3D b""
> ++    return await make_response(data, status_code, headers)
> +
> +
> + @hypercorn_app.route("/redirect_after")
> +diff --git a/src/urllib3/response.py b/src/urllib3/response.py
> +index a0273d65..909da62b 100644
> +--- a/src/urllib3/response.py
> ++++ b/src/urllib3/response.py
> +@@ -646,7 +646,11 @@ class HTTPResponse(BaseHTTPResponse):
> +         Unread data in the HTTPResponse connection blocks the connectio=
n from being released back to the pool.
> +         """
> +         try:
> +-            self.read()
> ++            self.read(
> ++                # Do not spend resources decoding the content unless
> ++                # decoding has already been initiated.
> ++                decode_content=3Dself._has_decoded_content,
> ++            )
> +         except (HTTPError, OSError, BaseSSLError, HTTPException):
> +             pass
> +
> +diff --git a/test/with_dummyserver/test_connectionpool.py b/test/with_du=
mmyserver/test_connectionpool.py
> +index 4fbe6a4f..ebcdf9bf 100644
> +--- a/test/with_dummyserver/test_connectionpool.py
> ++++ b/test/with_dummyserver/test_connectionpool.py
> +@@ -480,6 +480,25 @@ class TestConnectionPool(HypercornDummyServerTestCa=
se):
> +             assert r.status =3D=3D 200
> +             assert r.data =3D=3D b"Dummy server!"
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
> ++            # Three requests are expected: two redirects and one final =
/ 200 OK.
> ++            response =3D pool.request(
> ++                "GET",
> ++                "/redirect",
> ++                fields=3D{"target": "/redirect?compressed=3Dtrue", "com=
pressed": "true"},
> ++                preload_content=3DFalse,
> ++            )
> ++        assert response.status =3D=3D 200
> ++        gzip_decompress.assert_not_called()
> ++
> +     def test_303_redirect_makes_request_lose_body(self) -> None:
> +         with HTTPConnectionPool(self.host, self.port) as pool:
> +             response =3D pool.request(
> +--
> +2.44.0
> +
> diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb b/meta=
/recipes-devtools/python/python3-urllib3_2.2.2.bb
> index 620927322a..f6ac8f89ca 100644
> --- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
> +++ b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
> @@ -11,6 +11,7 @@ SRC_URI +=3D " \
>      file://CVE-2025-50181.patch \
>      file://CVE-2025-66418.patch \
>      file://CVE-2025-66471.patch \
> +    file://CVE-2026-21441.patch \
>  "
>
>  RDEPENDS:${PN} +=3D "\
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229410): https://lists.openembedded.org/g/openembedde=
d-core/message/229410
> Mute This Topic: https://lists.openembedded.org/mt/117278801/3619737
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
kur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

