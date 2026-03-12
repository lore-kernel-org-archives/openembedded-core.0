Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEAE106ACC9
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 16:14:54 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25754.1773332093701263532
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 09:14:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pw2BIKQh;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48534b59cf3so11179625e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 09:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773332092; x=1773936892; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0OS8M0+B2fnj/OT4T6pnrWlYvV7cy/UEGWjj+PZjOw=;
        b=pw2BIKQhWK7Y57kRQp++IpLCI53rrudS9VOkLLb4uwvkNxeKpbyLa2cFB0zk4u3wxC
         G32oDWhLvt1hcusDzMbFuPDvvI0jON/InSWm1IQalmPgi+jsYU/1CBZ1+oN01r9DgDve
         6AP9uDDBO9NAN2vPpOxOtZBaU+GjFKpxSSSBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773332092; x=1773936892;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d0OS8M0+B2fnj/OT4T6pnrWlYvV7cy/UEGWjj+PZjOw=;
        b=nykwoTxDOumIq1NwSVCIQsOj3g27fqn4FB27TgafO/11tQVMiKo9botgaMe1J92ZuL
         4DGE0lj+KmJHJ34SSm09KirMQqUOtZyHRyZO8plBL56jRBUY63BZK1SOh2/gTrDgiM8X
         05i5N+KjEBlineFp5cNE8xAg2FL4/bR+TJL47mQfVOBtOu/PA8C3kP/wkxyW+7aByH0+
         DmbOXFb6iBrunLpaPnYhInbW0EEAP2wkVZEj2rtCrC9kWDJySeEevL5RsmG6kkfz5erk
         YbwhC/tfjADg2StS9rP1smALArVZFp2iNZRdxdEXYsD19NhBxUETLqoOU68BraJ54fmh
         0rAA==
X-Forwarded-Encrypted: i=1; AJvYcCXRn2Uf2ZcxJv7mMKFhdEW2sGMdaGX/BBckJQu2xLljxBuSRIwC21Mu6wVdkHAjUyU1tcB550D1uOfwADcNzQ1eRg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxLVwpgo7Zm3v6t9n6Z1a+SDWVmjPA7I6Fz16H86B0Ctex0dwmH
	Qm2iWSlxSxOdHrRXDOBqYJacFsHaGlTFVFfsTL3JekarmRYcvp/UyOen1AvAupkSKvY=
X-Gm-Gg: ATEYQzyP4nT3eNmLIFa7moMW5TAXnFC2W82KIZux1yVUeY+HNPJb0MgC0suilrMW1Yt
	chZoQXoCVJA+RpcPd69HcgYs40UqbsKKE3E6iiXevbcBlqj1dtvsyHu2WclzkgGFpg4xVejCnjJ
	Ch3d4/tQ/lmKQXqh2V4p+U/LpaxINVINFsSZuAYZqh72TW7PSE56xQOoLvx0b4/DvDcHtvOgIWC
	b+Oc+NElqeAhge8EQHbPda6PQPLJN7IXUVdudcz4X6wIAZU5hkPGTS3cUc788QmLG7E0L95Yd86
	OdhB/pQYtmnJTqR9ao/LrC4ES7rB9Lna8dOrsDGej0jlfRa6g0dVY5XK8VFohZT/obt9muUgbfv
	YHqYOPOufOdHClvZ9AVBDJGA5q0x13Vxb9bsXEFm8S5UOcv4wUPdQwfZO1Z1kPn7D7CIY6hRyOG
	VUEL1gFHUpVwjsHem7+cW6SVECu42JtoGPL8oiZkro0qZNbOSZW0K5cSqgTp3o5RHrqUs9zc2qd
	xPl579vfbDzAmpMR8cLg8lZUA==
X-Received: by 2002:a05:600c:3114:b0:485:4526:ee06 with SMTP id 5b1f17b1804b1-4854b0bb7dbmr115555375e9.11.1773332091870;
        Thu, 12 Mar 2026 09:14:51 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e912fsm365224305e9.2.2026.03.12.09.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 09:14:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 17:14:51 +0100
Message-Id: <DH0XRG6JW24L.HWUFDCHSA433@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] go: Fix CVE-2025-61726.patch
 variable ordering
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <eduardo.barbosa@toradex.com>, "Eduardo Ferreira"
 <eduardo.f120@yahoo.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260309165351.311700-1-eduardo.f120.ref@yahoo.com>
 <20260309165351.311700-1-eduardo.f120@yahoo.com>
 <GV0P278MB0767EE53CCFA8EE22A5559A3E844A@GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM>
In-Reply-To: <GV0P278MB0767EE53CCFA8EE22A5559A3E844A@GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:14:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232996

On Thu Mar 12, 2026 at 2:54 PM CET, Eduardo Ferreira Barbosa via lists.open=
embedded.org wrote:
> Hi, is this patch submission OK for review, or did I miss something with =
this new version?

This submission is fine, I have it in my review branch[0].

You should see it it my patch review request or have an answer in the
next few days.

Thanks!

[0]: https://git.yoctoproject.org/poky-contrib/log/?h=3Dstable/scarthgap-nu=
t

>
> Thanks,
> Eduardo
> ________________________________
> From: Eduardo Ferreira <eduardo.f120@yahoo.com>
> Sent: Monday, March 9, 2026 1:53 PM
> To: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Cc: Eduardo Ferreira Barbosa <eduardo.barbosa@toradex.com>
> Subject: [OE-core][scarthgap][PATCH] go: Fix CVE-2025-61726.patch variabl=
e ordering
>
> This message originated from outside your organization
>
> From: Eduardo Ferreira <eduardo.barbosa@toradex.com>
>
> Commit 6a1ae4e792 (go 1.22.12: Fix CVE-2025-61726, 2026-02-11)
> introduced a patch backporting a fix for CVE-2025-61726, but
> this patch also introduced a bug.
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
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http/serve=
r.go:1903 +0xb0
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: panic({0x55743=
e8740?, 0x4000b526c0?})
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: runtime/panic.=
go:770 +0x124
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: go.opentelemet=
ry.io/otel/sdk/trace.(*recordingSpan).End.deferwrap1()<http://go.openteleme=
try.io/otel/sdk/trace.(*recordingSpan).End.deferwrap1()>
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: go.opentelemet=
ry.io/otel/sdk@v1.19.0/trace/span.go:383<http://go.opentelemetry.io/otel/sd=
k@v1.19.0/trace/span.go:383> +0x2c
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: go.opentelemet=
ry.io/otel/sdk/trace.(*recordingSpan).End<http://go.opentelemetry.io/otel/s=
dk/trace.(*recordingSpan).End>(0x40011b4a80, {0x0, 0x0, 0x40
> 006441c0?})
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: go.opentelemet=
ry.io/otel/sdk@v1.19.0/trace/span.go:421<http://go.opentelemetry.io/otel/sd=
k@v1.19.0/trace/span.go:421> +0x898
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: panic({0x55743=
e8740?, 0x4000b526c0?})
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: runtime/panic.=
go:770 +0x124
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godeb=
ug.(*Setting).Value.func1()
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godeb=
ug/godebug.go:141 +0xd8
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync.(*Once).d=
oSlow(0x22?, 0x55748a9b60?)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync/once.go:7=
4 +0x100
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync.(*Once).D=
o(...)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync/once.go:6=
5
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godeb=
ug.(*Setting).Value(0x5575b21be0)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godeb=
ug/godebug.go:138 +0x50
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.urlPar=
amsWithinMax(0x1)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url/url.go=
:968 +0x3c
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.parseQ=
uery(0x400069a630, {0x0, 0x0})
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url/url.go=
:985 +0xdc
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.ParseQ=
uery(...)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url/url.go=
:958
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http.(*Req=
uest).ParseForm(0x4000bdab40)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http/reque=
st.go:1317 +0x33c
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: github.com/doc=
ker/docker/api/server/httputils.ParseForm(0x0?)<http://github.com/docker/do=
cker/api/server/httputils.ParseForm(0x0?)>
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: github.com/doc=
ker/docker/api/server/httputils/httputils.go:104<http://github.com/docker/d=
ocker/api/server/httputils/httputils.go:104> +0x20
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
> [1] https://github.com/golang/go/blob/master/src/internal/godebugs/table.=
go#L20<https://github.com/golang/go/blob/master/src/internal/godebugs/table=
.go#L20>
> [2] https://github.com/golang/go/blob/master/src/internal/godebugs/table.=
go#L100<https://github.com/golang/go/blob/master/src/internal/godebugs/tabl=
e.go#L100>
>
> Signed-off-by: Eduardo Ferreira <eduardo.barbosa@toradex.com>
> ---
> .../go/go/CVE-2025-61726.patch | 21 ++++++++++---------
> 1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/meta/recipes-devtools/go/go/CVE-2025-61726.patch b/meta/reci=
pes-devtools/go/go/CVE-2025-61726.patch
> index ab053ff55c..bdd10bc933 100644
> --- a/meta/recipes-devtools/go/go/CVE-2025-61726.patch
> +++ b/meta/recipes-devtools/go/go/CVE-2025-61726.patch
> @@ -1,4 +1,4 @@
> -From 85050ca6146f3edb50ded0a352ab9edbd635effc Mon Sep 17 00:00:00 2001
> +From bf06767a9ac737387eee77c7eedd67c65e853ac2 Mon Sep 17 00:00:00 2001
> From: Damien Neil <dneil@google.com>
> Date: Mon, 3 Nov 2025 14:28:47 -0800
> Subject: [PATCH] [release-branch.go1.24] net/url: add urlmaxqueryparams
> @@ -36,6 +36,7 @@ Reviewed-by: Junyang Shao <shaojunyang@google.com>
> TryBot-Bypass: Michael Pratt <mpratt@google.com>
> (cherry picked from commit 85c794ddce26a092b0ea68d0fca79028b5069d5a)
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +Signed-off-by: Eduardo Ferreira <eduardo.barbosa@toradex.com>
> ---
> doc/godebug.md | 7 +++++
> src/internal/godebugs/table.go | 1 +
> @@ -45,7 +46,7 @@ Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> 5 files changed, 85 insertions(+)
>
> diff --git a/doc/godebug.md b/doc/godebug.md
> -index ae4f0576b4..635597ea42 100644
> +index ae4f057..635597e 100644
> --- a/doc/godebug.md
> +++ b/doc/godebug.md
> @@ -126,6 +126,13 @@ for example,
> @@ -63,19 +64,19 @@ index ae4f0576b4..635597ea42 100644
> to concerns around VCS injection attacks. This behavior can be renabled w=
ith the
> setting `allowmultiplevcs=3D1`.
> diff --git a/src/internal/godebugs/table.go b/src/internal/godebugs/table=
.go
> -index 33dcd81fc3..4ae043053c 100644
> +index 33dcd81..7178df6 100644
> --- a/src/internal/godebugs/table.go
> +++ b/src/internal/godebugs/table.go
> -@@ -52,6 +52,7 @@ var All =3D []Info{
> +@@ -51,6 +51,7 @@ var All =3D []Info{
> + {Name: "tlsmaxrsasize", Package: "crypto/tls"},
> {Name: "tlsrsakex", Package: "crypto/tls", Changed: 22, Old: "1"},
> {Name: "tlsunsafeekm", Package: "crypto/tls", Changed: 22, Old: "1"},
> - {Name: "x509sha1", Package: "crypto/x509"},
> + {Name: "urlmaxqueryparams", Package: "net/url", Changed: 24, Old: "0"},
> + {Name: "x509sha1", Package: "crypto/x509"},
> {Name: "x509usefallbackroots", Package: "crypto/x509"},
> {Name: "x509usepolicies", Package: "crypto/x509"},
> - {Name: "zipinsecurepath", Package: "archive/zip"},
> diff --git a/src/net/url/url.go b/src/net/url/url.go
> -index d2ae03232f..5219e3c130 100644
> +index d2ae032..cdca468 100644
> --- a/src/net/url/url.go
> +++ b/src/net/url/url.go
> @@ -13,6 +13,7 @@ package url
> @@ -118,7 +119,7 @@ index d2ae03232f..5219e3c130 100644
> var key string
> key, query, _ =3D strings.Cut(query, "&")
> diff --git a/src/net/url/url_test.go b/src/net/url/url_test.go
> -index fef236e40a..b2f8bd95fc 100644
> +index fef236e..b2f8bd9 100644
> --- a/src/net/url/url_test.go
> +++ b/src/net/url/url_test.go
> @@ -1488,6 +1488,54 @@ func TestParseQuery(t *testing.T) {
> @@ -177,7 +178,7 @@ index fef236e40a..b2f8bd95fc 100644
> url *URL
> out string
> diff --git a/src/runtime/metrics/doc.go b/src/runtime/metrics/doc.go
> -index 517ec0e0a4..335f7873b3 100644
> +index 517ec0e..88d6d8c 100644
> --- a/src/runtime/metrics/doc.go
> +++ b/src/runtime/metrics/doc.go
> @@ -328,6 +328,11 @@ Below is the full list of supported metrics, ordered=
 lexicographically.
> @@ -193,4 +194,4 @@ index 517ec0e0a4..335f7873b3 100644
> The number of non-default behaviors executed by the crypto/x509
> package due to a non-default GODEBUG=3Dx509sha1=3D... setting.
> --
> -2.35.6
> +2.34.1
> --
> 2.34.1


--=20
Yoann Congal
Smile ECS


