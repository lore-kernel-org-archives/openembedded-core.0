Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CAB2D2F036
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 14:07:20 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11902.1769522830942352099
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 06:07:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YAbRWTRk;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-432d2c7a8b9so5556113f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 06:07:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769522829; cv=none;
        d=google.com; s=arc-20240605;
        b=k8G1lao6fMKACxHQ5Xu0K2RqC51CrXhY0xLOSuTPKPAfs4+V7noeuv07vrh9m6rxJW
         IB+dUuAghd3uEWbunWWUtV9Yl+eDMWErMoxKSHVUfz8NVr4bwE3qLcpPmxJxs8ZXNImE
         eVGdt/kdmYUD8OwZO9tOPCSCgjsLz3Az4kErrNn3v3rxl3GVYNPScVFJ3HBGEwJm+pye
         wJMacCLBhdvJ73zPgZp+T6GgXBn+LfgWLhVFKI5DLz3cK76IZXAU42FYorOuCamngM5t
         oXvQxunay70gQSVVQSRyBkebyHk4r/IrN5DxzgbcMwEHMhJNX5OUYFxhwRtyqUyfrJ8B
         P0rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BQ4BRwG/bIjNd8CGKoixcG8B0C7J6qONpG+JqDBLmj0=;
        fh=f8qhyk60bn1QrhWK5icWcISvI/hI/SSufb2KE0XpGZo=;
        b=hwzwfO+nrxSY6e/RFQaowsDtwAFEv6s1ev41nz55Ip4MxdYQjy895XP5aVe/E4Xm65
         lu76ZoFX6lFKXbe9ufQNPZOo2r4UfbBrTbk+C+MbhMyHXPgcOqDwlwpCJn5t4wH6jAQM
         f/D9xqP+k7AiwlBLhbajdqpt7k/9s0dXhkyKYXo/lcA03ZvGQ/YZDCXDOE/LfzydFml7
         wwctrktn7qJwCWYGH5evBJ9WPJrCrzGz+u0ASjNmbLRYN803QY4Wsg7GL+9UBO3C9Fz3
         y2M81YCd1/BcogZIqY6TLybtulaoU5YxRFOHlBt4UD2rhFTWY29I1JeQy1wbVOMeSjaL
         sYPg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769522829; x=1770127629; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BQ4BRwG/bIjNd8CGKoixcG8B0C7J6qONpG+JqDBLmj0=;
        b=YAbRWTRkTl5KTN7wL6nrY1i8cbdIc9CEP7yH3+MMvkcclyj8dAg0ateHGByXOQKK4M
         HeXR5pMt++NFBiL3tfW8EvaMSPlY5kGvtN/juAuemeDAMZns8oaup0WAjT6selfNiclM
         GW6BgGOeMGw0nz8x8wgkp19UqBF3hYz28FZoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769522829; x=1770127629;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQ4BRwG/bIjNd8CGKoixcG8B0C7J6qONpG+JqDBLmj0=;
        b=w8BgLphN0fgzGnUw2z22fQO2d5eC3wYr/MZ9W/YkUk+hrJJVBwVoqwQ1yqRAJMwdes
         UpLfLQG9yGuGCRtkS2Rjmyoo6A2aXx4Ew/StxM3snd81LjPATAdR1xm5YzsvqlHTkK6m
         KTWxpwZRlXQsjy2SsFvS9r1sbGfMyifJ+hUsVJFePHxWP/Yb90XFw+8E71Y+Hb3VMRQ9
         sFYz3CKoMa8VK/pC/dy34hvXUVrcwb5myPZYO/NI1/BrTbYmVMRjrjmEtvYie5CLZgXk
         YKtHs5eWMpdryqb+Wym8uR/jpQ8otbeEJl4PxXQTbsVo2Qs/WWSY2IOH3lp9I0p2PqBS
         yUjA==
X-Gm-Message-State: AOJu0YzKIeT2MsbBlq1uC7X3Z2Vrr5x3J/wFOARa6Ya5QtUgsTRCkYU8
	/WTmiA+ObvvymPtBtRGV+xBSy2UH+lEmsy5Fm+05kBX7oBqjIskFgsp0gcgS9p3ODlbJb+w5Qga
	6UBJNEB+irKN3LN7jbJkW+WUgC2jOYhYZnGn4RGgu+Q==
X-Gm-Gg: AZuq6aIFrkPInPsHWydZRDzUfRfV2H8qiwovTyL1GpIQTMXp7ebsiKinlgg7Iw8qFBG
	wveu9owEtIpKdYXCXwfO9pS438wyXFS/Ee4gzqXOkJn7A9StM4nDOkgtxJBSoZkfmjF+prURJuE
	ZJ/s9wYjc3BhKlOsBrz25/eQikxoMO6Ym0LyVTpAzDkJLfcg69VCoZYvmzcd5FkoUpRVNySgqb/
	7nFTESFuWw9cNtU0sRMA9+JwbOHVKHoJXVz45uyKlbe+ytsF8nEamPVxEOROdfX24vjEnsO5nIk
	NOn59kNIvvDyAy+KxHMYDvYgoNz7sqa02oQEr3E=
X-Received: by 2002:a05:6000:2210:b0:431:a43:ee88 with SMTP id
 ffacd0b85a97d-435dd1bcd87mr2927824f8f.42.1769522829034; Tue, 27 Jan 2026
 06:07:09 -0800 (PST)
MIME-Version: 1.0
References: <20260127134721.76918-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260127134721.76918-1-adarsh.jagadish.kamini@est.tech>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 27 Jan 2026 15:06:42 +0100
X-Gm-Features: AZwV_Qh7H6su_TdbkuIrnxIgI1seUVTodJ8vISw9rYkEMuKTU2tCIpyHXsLo9tc
Message-ID: <CAMSfU+5o4uwAUfK1FMzn-LAoyawSC7djBimiZ5THu48vCFjDHA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] python-urllib3: Backport fix CVE-2026-21441
To: adarsh.jagadish.kamini@est.tech
Cc: openembedded-core@lists.openembedded.org, david.nystrom@est.tech
Content-Type: multipart/alternative; boundary="000000000000a5f83706495f2328"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 14:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230046

--000000000000a5f83706495f2328
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 27 janv. 2026 =C3=A0 14:47, adarsh.jagadish.kamini via
lists.openembedded.org <adarsh.jagadish.kamini=3D
est.tech@lists.openembedded.org> a =C3=A9crit :

> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  .../python3-urllib3/CVE-2026-21441.patch      | 105 ++++++++++++++++++
>  .../python/python3-urllib3_2.2.2.bb           |   1 +
>  2 files changed, 106 insertions(+)
>

Hello,

Thank you for the patch.

Since this is the second version of a patch you sent previously, it should
have "[PATCH v2]" in the subject (the -v2 option of git-send-email works
well).

Also, for the next patches, please include a justification as to why you
think this patch does fix the CVE.
For example, in this case, "Include the patch linked in the NVD report :
https://nvd.nist.gov/vuln/detail/CVE-2026-21441" is enough.

I will take this patch into testing (with a commit message modification).

Regards,

 create mode 100644
> meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
>
> diff --git
> a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
> b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
> new file mode 100644
> index 0000000000..16af67af31
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
> @@ -0,0 +1,105 @@
> +From 686d2bdd4affd3c86e605f54a72afe53c920f72f Mon Sep 17 00:00:00 2001
> +From: Illia Volochii <illia.volochii@gmail.com>
> +Date: Wed, 7 Jan 2026 18:07:30 +0200
> +Subject: [OE-core][scarthgap][PATCH] python-urllib3: Backport fix
> CVE-2026-21441
> +
> +Bugfixes
> +--------
> +
> +- Fixed a high-severity security issue where decompression-bomb
> safeguards of
> +  the streaming API were bypassed when HTTP redirects were followed.
> +  (`GHSA-38jv-5279-wg99 <
> https://github.com/urllib3/urllib3/security/advisories/GHSA-38jv-5279-wg9=
9
> >`__)
> +
> +* Stop decoding response content during redirects needlessly
> +
> +* Rename the new query parameter
> +
> +* Add a changelog entry
> +
> +CVE: CVE-2026-21441
> +
> +Upstream-Status: Backport [
> https://github.com/urllib3/urllib3/commit/8864ac407bba8607950025e0979c4c6=
9bc7abc7b
> ]
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
n
> from being released back to the pool.
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
> +diff --git a/test/with_dummyserver/test_connectionpool.py
> b/test/with_dummyserver/test_connectionpool.py
> +index 4fbe6a4f..ebcdf9bf 100644
> +--- a/test/with_dummyserver/test_connectionpool.py
> ++++ b/test/with_dummyserver/test_connectionpool.py
> +@@ -480,6 +480,25 @@ class
> TestConnectionPool(HypercornDummyServerTestCase):
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
/
> 200 OK.
> ++            response =3D pool.request(
> ++                "GET",
> ++                "/redirect",
> ++                fields=3D{"target": "/redirect?compressed=3Dtrue",
> "compressed": "true"},
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
> diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
> b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
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
> View/Reply Online (#230043):
> https://lists.openembedded.org/g/openembedded-core/message/230043
> Mute This Topic: https://lists.openembedded.org/mt/117488019/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000a5f83706495f2328
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 27=
 janv. 2026 =C3=A0=C2=A014:47, adarsh.jagadish.kamini via <a href=3D"http:/=
/lists.openembedded.org">lists.openembedded.org</a> &lt;adarsh.jagadish.kam=
ini=3D<a href=3D"mailto:est.tech@lists.openembedded.org">est.tech@lists.ope=
nembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">From: Adarsh Jagadish Kamini &lt;adarsh.jagadish.=
kamini@est.tech&gt;<br>
<br>
Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&g=
t;<br>
---<br>
=C2=A0.../python3-urllib3/CVE-2026-21441.patch=C2=A0 =C2=A0 =C2=A0 | 105 ++=
++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python3-urllib3_2.2.2.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-urllib3_2.2.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 106 insertions(+)<br></blockquote><div><br></div><di=
v>Hello,</div><div><br></div><div>Thank you for the patch.</div><div><br></=
div><div>Since this is the second version of a patch you sent previously, i=
t should have &quot;[PATCH v2]&quot; in the subject (the -v2 option of git-=
send-email works well).</div><div><br></div><div>Also, for the next patches=
, please include a justification as to why you think this patch does fix th=
e CVE.</div><div>For example, in this case, &quot;Include the patch linked =
in the NVD report :=C2=A0<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-20=
26-21441">https://nvd.nist.gov/vuln/detail/CVE-2026-21441</a>&quot; is enou=
gh.</div><div><br></div><div>I will take this patch into testing (with a co=
mmit message modification).</div><div><br></div><div>Regards,</div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2=
026-21441.patch<br>
<br>
diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.pa=
tch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch<br>
new file mode 100644<br>
index 0000000000..16af67af31<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch<br>
@@ -0,0 +1,105 @@<br>
+From 686d2bdd4affd3c86e605f54a72afe53c920f72f Mon Sep 17 00:00:00 2001<br>
+From: Illia Volochii &lt;<a href=3D"mailto:illia.volochii@gmail.com" targe=
t=3D"_blank">illia.volochii@gmail.com</a>&gt;<br>
+Date: Wed, 7 Jan 2026 18:07:30 +0200<br>
+Subject: [OE-core][scarthgap][PATCH] python-urllib3: Backport fix CVE-2026=
-21441 <br>
+<br>
+Bugfixes<br>
+--------<br>
+<br>
+- Fixed a high-severity security issue where decompression-bomb safeguards=
 of<br>
+=C2=A0 the streaming API were bypassed when HTTP redirects were followed.<=
br>
+=C2=A0 (`GHSA-38jv-5279-wg99 &lt;<a href=3D"https://github.com/urllib3/url=
lib3/security/advisories/GHSA-38jv-5279-wg99" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/urllib3/urllib3/security/advisories/GHSA-38jv-52=
79-wg99</a>&gt;`__)<br>
+<br>
+* Stop decoding response content during redirects needlessly<br>
+<br>
+* Rename the new query parameter<br>
+<br>
+* Add a changelog entry<br>
+<br>
+CVE: CVE-2026-21441<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/urllib3/urllib3/c=
ommit/8864ac407bba8607950025e0979c4c69bc7abc7b" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/urllib3/urllib3/commit/8864ac407bba860795002=
5e0979c4c69bc7abc7b</a>]<br>
+<br>
+Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&=
gt;<br>
+---<br>
+ dummyserver/app.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 +++++++-<br>
+ src/urllib3/response.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++++-<br>
+ test/with_dummyserver/test_connectionpool.py | 19 +++++++++++++++++++<br>
+ 3 files changed, 31 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/dummyserver/app.py b/dummyserver/app.py<br>
+index 9fc9d1b7..c4978152 100644<br>
+--- a/dummyserver/app.py<br>
++++ b/dummyserver/app.py<br>
+@@ -233,10 +233,16 @@ async def redirect() -&gt; ResponseReturnValue:<br>
+=C2=A0 =C2=A0 =C2=A0values =3D await request.values<br>
+=C2=A0 =C2=A0 =C2=A0target =3D values.get(&quot;target&quot;, &quot;/&quot=
;)<br>
+=C2=A0 =C2=A0 =C2=A0status =3D values.get(&quot;status&quot;, &quot;303 Se=
e Other&quot;)<br>
++=C2=A0 =C2=A0 compressed =3D values.get(&quot;compressed&quot;) =3D=3D &q=
uot;true&quot;<br>
+=C2=A0 =C2=A0 =C2=A0status_code =3D status.split(&quot; &quot;)[0]<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0headers =3D [(&quot;Location&quot;, target)]<br>
+-=C2=A0 =C2=A0 return await make_response(&quot;&quot;, status_code, heade=
rs)<br>
++=C2=A0 =C2=A0 if compressed:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 headers.append((&quot;Content-Encoding&quot;,=
 &quot;gzip&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D gzip.compress(b&quot;foo&quot;)<br>
++=C2=A0 =C2=A0 else:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D b&quot;&quot;<br>
++=C2=A0 =C2=A0 return await make_response(data, status_code, headers)<br>
+ <br>
+ <br>
+ @hypercorn_app.route(&quot;/redirect_after&quot;)<br>
+diff --git a/src/urllib3/response.py b/src/urllib3/response.py<br>
+index a0273d65..909da62b 100644<br>
+--- a/src/urllib3/response.py<br>
++++ b/src/urllib3/response.py<br>
+@@ -646,7 +646,11 @@ class HTTPResponse(BaseHTTPResponse):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Unread data in the HTTPResponse connecti=
on blocks the connection from being released back to the pool.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.read()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.read(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Do not spend re=
sources decoding the content unless<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # decoding has al=
ready been initiated.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 decode_content=3D=
self._has_decoded_content,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except (HTTPError, OSError, BaseSSLError=
, HTTPException):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass<br>
+ <br>
+diff --git a/test/with_dummyserver/test_connectionpool.py b/test/with_dumm=
yserver/test_connectionpool.py<br>
+index 4fbe6a4f..ebcdf9bf 100644<br>
+--- a/test/with_dummyserver/test_connectionpool.py<br>
++++ b/test/with_dummyserver/test_connectionpool.py<br>
+@@ -480,6 +480,25 @@ class TestConnectionPool(HypercornDummyServerTestCase=
):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert r.status =3D=3D 200=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert r.data =3D=3D b&quo=
t;Dummy server!&quot;<br>
+ <br>
++=C2=A0 =C2=A0 @mock.patch(&quot;urllib3.response.GzipDecoder.decompress&q=
uot;)<br>
++=C2=A0 =C2=A0 def test_no_decoding_with_redirect_when_preload_disabled(<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self, gzip_decompress: mock.MagicMock<br>
++=C2=A0 =C2=A0 ) -&gt; None:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 Test that urllib3 does not attempt to decode =
a gzipped redirect<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 response when `preload_content` is set to `Fa=
lse`.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 with HTTPConnectionPool(self.host, self.port)=
 as pool:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Three requests are expected: =
two redirects and one final / 200 OK.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 response =3D pool.request(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;GET&quot;,<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/redirect&q=
uot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fields=3D{&quot;t=
arget&quot;: &quot;/redirect?compressed=3Dtrue&quot;, &quot;compressed&quot=
;: &quot;true&quot;},<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 preload_content=
=3DFalse,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert response.status =3D=3D 200<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 gzip_decompress.assert_not_called()<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0def test_303_redirect_makes_request_lose_body(self) -&=
gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with HTTPConnectionPool(self.host, self.=
port) as pool:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0response =3D pool.request(=
<br>
+-- <br>
+2.44.0<br>
+<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-urllib3=
_2.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-urllib3_2.2.2.bb</a=
> b/meta/recipes-devtools/python/<a href=3D"http://python3-urllib3_2.2.2.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-urllib3_2.2.2.bb</a><br>
index 620927322a..f6ac8f89ca 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-urllib3_2.2.2.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-urllib3_2.2.2.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-urllib3_2.2.2.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-urllib3_2.2.2.bb</a><br>
@@ -11,6 +11,7 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2025-50181.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2025-66418.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2025-66471.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2026-21441.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;\<br>
-- <br>
2.44.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#230043): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/230043" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/230043</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117488019/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117488019/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000a5f83706495f2328--

