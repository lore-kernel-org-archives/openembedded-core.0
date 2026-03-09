Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A38BF3C268
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 14:00:37 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14908.1773064833694280342
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 07:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rBf5V1c+;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852a8482fcso24197275e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 07:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773064832; x=1773669632; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvqpeF616PR8Su49aTBh6j6L8tM0MsQ5ykA9RO7yKi0=;
        b=rBf5V1c+O8So8UMSe7Quvv0Ll15HdZVGSROZpk5FzooKLOA+QiJHPy5p93ko77inI/
         iBG62NBY5gYWR3yVLdy/hORqYDgFuiH3GVlZJN58i8/ujzuuOFEA+tZzwQhBYAJJngIo
         W11i4j1tnjk56MSTWz2KPJ03MaNmbkT6N9Ebs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773064832; x=1773669632;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TvqpeF616PR8Su49aTBh6j6L8tM0MsQ5ykA9RO7yKi0=;
        b=Hnbe5m62UhER8D02xb2SHRQhIDveoe3+jH6her6cfyqwf6BLWfGNWDCC0WQu+5bmZb
         Iv74ExYYocLbPZAL0QJvPAt+IXDtOlaxg1p1cequpIiwPUTeCfPQEVZ4+YNAeWR0oQcz
         GJYzchp4EZoJhe9AyVPMU9WNQCwb2SQR0u848bZmgF/KWG/PXxrelPyg3PB20lTd3pOC
         APiJaPjRPafi3VvQy6q1VsdfKksCg0q+XemxuF6rEMM4dRXGhT0AigEk4wbUCxB4SEZN
         Pxna5UjY7X3rJ2t51il1ZqUFVNnisgsEmzfY3TX4GcvqCPV39Slmv5yuUVr91mf1emnR
         nBYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU65OFkOR0istvTbjxLQeeXn6EX2W5Stq17wIEHoXtK4yxAJuXIU/d46vPsSILGy1aNpXgghw3qa5HZ87mrVKL+Bw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxhsdyZbRqpjCZalCPHa2cc62DaW/J+10ewb9+mgLWOu0M/qX6/
	0Cw7XaA2VhVX3TEI1M6/3cLLi2AoDZ6j63tiJbm0Wy3UwMoAXqFAI0/1kbAXmS6OGm8=
X-Gm-Gg: ATEYQzwh8Uj/o/rW3/YE0Vo/XRZ33ue/ydhs856ZasDNfsAsGWFWHBtT/gk1T2WeFAV
	hPTou+I2rHl4UcbYfIZs1TlNooXyhaBOiT1Af7OTBLk585irkrToscKMIcfN0DysBM4kG4hx70e
	DXEota+2xtWQ+PaKXZK5mo6txqsq+GYHeb9RRqT3y9GduwmKnOdTUIKNjIkAfoeUffVYxo/S9Dm
	0qH4TTNw+77jjEsP+MBiCBxeaWhQ10lab4e+zmiQtbuDqTCw400Kzk6AUGcd60Xw/dCA9o2KeYK
	ejv5tpn/Fkg0ZqwjfsZG6ul8rbLuf1ngJbRtjDPT/8w8++iJtuYCqNBd5PSA1R8yoskHsRXfII9
	PjkNLgiNGpX9XdT7O9v2S+leqeg2ltUq//dNUP3SKVSSwIVyUagdj0aN2GLuJ0WapV3lrskjwXp
	UV19UOavfu3Ds/csNuFMvbgO0OzDkA5a5rgEJwS6IO3QSbz+hgq7pEwXau4IKheEPfpc2kStTAE
	iHF1Ob3/9M=
X-Received: by 2002:a05:600c:81ca:b0:480:1b65:b741 with SMTP id 5b1f17b1804b1-4852694638dmr198566395e9.15.1773064831550;
        Mon, 09 Mar 2026 07:00:31 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485246ed174sm133235925e9.5.2026.03.09.07.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 07:00:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 15:00:29 +0100
Message-Id: <DGYB0XNUQ64D.1A0JTYTK6YFW8@smile.fr>
Cc: "Eduardo Ferreira" <eduardo.barbosa@toradex.com>
To: <eduardo.f120@yahoo.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] go 1.22.12: Fix CVE-2025-61726.patch variable
 ordering
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260306180605.1047779-1-eduardo.f120@yahoo.com>
 <20260306180605.1047779-2-eduardo.f120@yahoo.com>
In-Reply-To: <20260306180605.1047779-2-eduardo.f120@yahoo.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 14:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232721

Hello,

Reviewing for scarthgap:

On Fri Mar 6, 2026 at 7:06 PM CET, eduardo.f120 via lists.openembedded.org =
wrote:
> From: Eduardo Ferreira <eduardo.barbosa@toradex.com>
> Subject: [PATCH] go 1.22.12: Fix CVE-2025-61726.patch variable ordering

The tag in the subject does not usualy contain the version (I missed
that in the last go patches :( ). Just "go: Fix CVE-2025-61726.patch
variable ordering" is fine.
>
> Commit 6a1ae4e79252f9a896faa702e4a8b3e27529a474 introduced a patch

When referencing a patch, I suggest to add the title for context. The
kernel has a nice rule about it and that look like:
commit 6a1ae4e79252 ("go 1.22.12: Fix CVE-2025-61726")

git also has a nice option built-in:
 $ git log -1 --format=3Dreference 6a1ae4e79252f9a896faa702e4a8b3e27529a474
6a1ae4e792 (go 1.22.12: Fix CVE-2025-61726, 2026-02-11)

> backporting a fix for CVE-2025-61726, but this patch also introduced
> a bug.
>
> From Go's source code[1], they say that the 'All' table from 'godebugs'
> should be populated alphabetically by Name. And 'Lookup'[2] function uses
> binary search to try and find the variable.
>
> Here's the trace:
> Mar 06 11:33:33 toradex-smarc-imx95-12594035 systemd[1]: Started Docker A=
pplication Container Engine.
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: 2026/03/06 11:=
34:53 http: panic serving @: godebug: Value of name not listed in godeb
> ugs.All: urlmaxqueryparams
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: goroutine 78 [=
running]:
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http.(*con=
n).serve.func1()
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         net/ht=
tp/server.go:1903 +0xb0
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: panic({0x55743=
e8740?, 0x4000b526c0?})
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         runtim=
e/panic.go:770 +0x124
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: go.opentelemet=
ry.io/otel/sdk/trace.(*recordingSpan).End.deferwrap1()
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         go.ope=
ntelemetry.io/otel/sdk@v1.19.0/trace/span.go:383 +0x2c
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: go.opentelemet=
ry.io/otel/sdk/trace.(*recordingSpan).End(0x40011b4a80, {0x0, 0x0, 0x40
> 006441c0?})
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         go.ope=
ntelemetry.io/otel/sdk@v1.19.0/trace/span.go:421 +0x898
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: panic({0x55743=
e8740?, 0x4000b526c0?})
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         runtim=
e/panic.go:770 +0x124
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godeb=
ug.(*Setting).Value.func1()
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         intern=
al/godebug/godebug.go:141 +0xd8
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync.(*Once).d=
oSlow(0x22?, 0x55748a9b60?)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         sync/o=
nce.go:74 +0x100
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync.(*Once).D=
o(...)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         sync/o=
nce.go:65
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godeb=
ug.(*Setting).Value(0x5575b21be0)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         intern=
al/godebug/godebug.go:138 +0x50
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.urlPar=
amsWithinMax(0x1)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         net/ur=
l/url.go:968 +0x3c
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.parseQ=
uery(0x400069a630, {0x0, 0x0})
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         net/ur=
l/url.go:985 +0xdc
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.ParseQ=
uery(...)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         net/ur=
l/url.go:958
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http.(*Req=
uest).ParseForm(0x4000bdab40)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         net/ht=
tp/request.go:1317 +0x33c
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: github.com/doc=
ker/docker/api/server/httputils.ParseForm(0x0?)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         github=
.com/docker/docker/api/server/httputils/httputils.go:104 +0x20
>
> The 'Lookup' function was failing due to the wrong ordering and returning=
 'nil',
> which was not being checked properly and caused this issue.
>
> The fix was to just reorder the line where 'urlmaxqueryparams' is being
> added to respect the alphabetical ordering. And for that the whole CVE
> patch was generated again.
>
> This change was validated with docker-moby (original issue), where a cont=
ainer
> run successfully and no traces in the logs.
>
> Fixes: 6a1ae4e792 ("go 1.22.12: Fix CVE-2025-61726.patch variable orderin=
g")
^ Is this commit fixing itself?
FYI, I don't know any Yocto Project tooling that uses this line. You
might just remove it...

>
> [1] https://github.com/golang/go/blob/master/src/internal/godebugs/table.=
go#L20
> [2] https://github.com/golang/go/blob/master/src/internal/godebugs/table.=
go#L100
>
> Signed-off-by: Eduardo Ferreira <eduardo.barbosa@toradex.com>
> ---
>  .../go/go/CVE-2025-61726.patch                | 25 ++++++++++---------
>  1 file changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/meta/recipes-devtools/go/go/CVE-2025-61726.patch b/meta/reci=
pes-devtools/go/go/CVE-2025-61726.patch
> index ab053ff55c..65fe62a4da 100644
> --- a/meta/recipes-devtools/go/go/CVE-2025-61726.patch
> +++ b/meta/recipes-devtools/go/go/CVE-2025-61726.patch
> @@ -1,6 +1,6 @@
> -From 85050ca6146f3edb50ded0a352ab9edbd635effc Mon Sep 17 00:00:00 2001
> -From: Damien Neil <dneil@google.com>
> -Date: Mon, 3 Nov 2025 14:28:47 -0800
> +From a41ff6cac6acdb8a55708d9f1e40efd8c4f87421 Mon Sep 17 00:00:00 2001
> +From: Eduardo Ferreira <eduardo.barbosa@toradex.com>
> +Date: Fri, 6 Mar 2026 13:38:46 +0000
^ You can't really take ownership of the patch like that. Please keep
the original author.

>  Subject: [PATCH] [release-branch.go1.24] net/url: add urlmaxqueryparams
>   GODEBUG to limit the number of query parameters
> =20
> @@ -36,6 +36,7 @@ Reviewed-by: Junyang Shao <shaojunyang@google.com>
>  TryBot-Bypass: Michael Pratt <mpratt@google.com>
>  (cherry picked from commit 85c794ddce26a092b0ea68d0fca79028b5069d5a)
>  Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +Signed-off-by: Eduardo Ferreira <eduardo.barbosa@toradex.com>
>  ---
>   doc/godebug.md                 |  7 +++++
>   src/internal/godebugs/table.go |  1 +
> @@ -45,7 +46,7 @@ Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>   5 files changed, 85 insertions(+)
> =20
>  diff --git a/doc/godebug.md b/doc/godebug.md
> -index ae4f0576b4..635597ea42 100644
> +index ae4f057..635597e 100644
>  --- a/doc/godebug.md
>  +++ b/doc/godebug.md
>  @@ -126,6 +126,13 @@ for example,
> @@ -63,19 +64,19 @@ index ae4f0576b4..635597ea42 100644
>   to concerns around VCS injection attacks. This behavior can be renabled=
 with the
>   setting `allowmultiplevcs=3D1`.
>  diff --git a/src/internal/godebugs/table.go b/src/internal/godebugs/tabl=
e.go
> -index 33dcd81fc3..4ae043053c 100644
> +index 33dcd81..7178df6 100644
>  --- a/src/internal/godebugs/table.go
>  +++ b/src/internal/godebugs/table.go
> -@@ -52,6 +52,7 @@ var All =3D []Info{
> +@@ -51,6 +51,7 @@ var All =3D []Info{
> +	{Name: "tlsmaxrsasize", Package: "crypto/tls"},
>  	{Name: "tlsrsakex", Package: "crypto/tls", Changed: 22, Old: "1"},
>  	{Name: "tlsunsafeekm", Package: "crypto/tls", Changed: 22, Old: "1"},
> -	{Name: "x509sha1", Package: "crypto/x509"},
>  +	{Name: "urlmaxqueryparams", Package: "net/url", Changed: 24, Old: "0"}=
,
> +	{Name: "x509sha1", Package: "crypto/x509"},
>  	{Name: "x509usefallbackroots", Package: "crypto/x509"},
>  	{Name: "x509usepolicies", Package: "crypto/x509"},
> -	{Name: "zipinsecurepath", Package: "archive/zip"},
>  diff --git a/src/net/url/url.go b/src/net/url/url.go
> -index d2ae03232f..5219e3c130 100644
> +index d2ae032..f796077 100644
>  --- a/src/net/url/url.go
>  +++ b/src/net/url/url.go
>  @@ -13,6 +13,7 @@ package url
> @@ -118,7 +119,7 @@ index d2ae03232f..5219e3c130 100644
>  		var key string
>  		key, query, _ =3D strings.Cut(query, "&")
>  diff --git a/src/net/url/url_test.go b/src/net/url/url_test.go
> -index fef236e40a..b2f8bd95fc 100644
> +index fef236e..b2f8bd9 100644
>  --- a/src/net/url/url_test.go
>  +++ b/src/net/url/url_test.go
>  @@ -1488,6 +1488,54 @@ func TestParseQuery(t *testing.T) {
> @@ -177,7 +178,7 @@ index fef236e40a..b2f8bd95fc 100644
>  	url *URL
>  	out string
>  diff --git a/src/runtime/metrics/doc.go b/src/runtime/metrics/doc.go
> -index 517ec0e0a4..335f7873b3 100644
> +index 517ec0e..2efb13a 100644
>  --- a/src/runtime/metrics/doc.go
>  +++ b/src/runtime/metrics/doc.go
>  @@ -328,6 +328,11 @@ Below is the full list of supported metrics, ordere=
d lexicographically.
> @@ -193,4 +194,4 @@ index 517ec0e0a4..335f7873b3 100644
>  		The number of non-default behaviors executed by the crypto/x509
>  		package due to a non-default GODEBUG=3Dx509sha1=3D... setting.
>  --
> -2.35.6
> +2.34.1

And, remember, when sending your next version to add the [scarthgap]
tag.

Thanks!
--=20
Yoann Congal
Smile ECS


