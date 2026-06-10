Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3F9CD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 05:39:15 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13546.1781069953558080116
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 22:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cwIA+bew;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: saisneha196@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bec4639953dso1146728866b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 22:39:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781069952; cv=none;
        d=google.com; s=arc-20240605;
        b=HwVgxJnq3LKReDb3V/wCCrFf0QFeAQXvlgFjqmVI5+S1jv9DXLWvLD5NNdHs+uTceV
         gaowe7O+hqpGhhVFKWptfpn3gRXUoOiQcPyDjxQBIgndPSnjC8NU7uFl7/acV0we4+nb
         iJeERiky6uQASytvDdbCE+Rp5pKI0Hz92XcNBwTxnzp99ZADnucexrkXvDxFEQv1K4Yl
         wbCCo0DXR1tJTX63tMLSKGAh66d4e9+8uAGbWG6H/WpIpbv7q7s7PEYi6QDOucrfodhD
         zFu8VeFgAzUdI4WNCynzgRWqwK352OQKU3MSuUMF5LmjBdL6S31AkasV5XsotmTxmAY1
         uHIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6wlIdeRTns/z9ZaJa5+MxHuIdQ+rm0ku4SkcgtE5K1k=;
        fh=hGkMgJGRbMrFFd3fdS0Eqe5auM4Ni3m+o+iJTp99bRY=;
        b=O08MR363Pvc8wMgkSmTibs9bhtBfzfsWXdCT8AAmr/Uzis3YkQcrFFK+akrHzG0uY9
         /ad/NKTAzgM7uquctT5ZbwGeHsxhRd1f6eo2fdsiWYYkqCxsbincoslN0aaam8WW/ZQW
         QORA/K0cm6VQa2Y/Nw6KytEez+ersukRTWQtTfZU2001NiKt/Vq1kZCeRm+JhEyaeneu
         Dl3sqoq5j70A+U8yETDcZXiVfAsig3uqIBl+iLI4It5DCDnJdqJbYSiyPUaC2XbI/U4f
         cUcx8L34iodcgc+oA6xEKoXnpEGJZv/1fnNTXz7QzdLeRsLb5KblQhM1whjOv/aFLUVt
         C1tA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781069952; x=1781674752; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6wlIdeRTns/z9ZaJa5+MxHuIdQ+rm0ku4SkcgtE5K1k=;
        b=cwIA+bewYR7kJShromeZdU4YfjjTJS4FeKkyx7QvZLQ77tDNAAHqtna8gxGI9hHqSZ
         204cIj5b0fuM5a4X/cMzRv6GSfybafMYWHJf6qu+O0pLYYnkGTzw3ZzLTP9EyyACI1KG
         mqHZ40BBLILT/GpdFnUIXIFkbflvySMOkifAu/XHwwr/Bgn87Q5QeP1P7JdUe36g2zz4
         op4VAwNgAhyUxmyYEdLKHvDaFfE5dbq8PiIj/y8u4meLrkcB2pdWsYqRzTQhd6EBCCOz
         vqciW4CtNXihSlchyOOVGsP+ty87g1KcHgJGluJ7GjH9BrvaMtd55s9PuHb2YNLSvK+j
         uHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781069952; x=1781674752;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wlIdeRTns/z9ZaJa5+MxHuIdQ+rm0ku4SkcgtE5K1k=;
        b=OOA338ac1FSyeoTyJeBTeqAYTihHqRdKtJKsdP2OJS95cF9D24zSwMHDisSOdRbAN9
         +qDU9s6RPwFTLJkNrn8lntTmDSIqTqrOjrJsxCYnl3U5bAtZXFKGPckRj3jPxu9wMayk
         RMkVVvmkUjNaG1LzfCSsk1gAOv0uFyHY8BVSjwetd9jO+lT7PlDBMXox2H09UvJG1bU0
         G7msKvxTIyLgwa2li5+rM17Y0DMuOXfKpriDX4Src6GYCqhw+qqojaH33IAmqpRZerWS
         3pg+yL68wapOTOLaSbe9a/xDLOuc7Ha4x0M2kfy1M6XqFCcpKPokm7O4fX4/TAsHijpI
         wvPg==
X-Forwarded-Encrypted: i=1; AFNElJ/8BfuzEbz+QY0qyDR2OPTkknbBI+IDc6JuKm3V4gVPF9Cz/Xrn/qsjWOXp90zfXpiVZLPCWrkb+qC4M964/827og==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzDlyp51qhVW6luwBcgle0At/TESgF4CYgv+jD4OhmtlIoX2HGg
	PlrlJiAVEWfvy2kfN4uDThFa7A1GhU6yLNAKNCfp2IDBNyVyKvSoLjqkJzszwESlMgok0MghrKh
	3Y5JLaVU1IJ7i4wWVnYyl01buOsesLMw=
X-Gm-Gg: Acq92OEdfKz1t5tjHTJfM9f5LZ6Gi7tFePBjc2QBHZ3KsDrGYbNDnO8aNLg+vqfdVRh
	NdOyEf7v0BevbXpi76Afo3OBLIzmsTRFh7VGoNuiSnsmdGSvwk954+nkspdDKi2n9ltPoqfaITR
	P6bIVv5mBUeQSq/nQCo8zuoqMHcnm1IMEimxscG9GphH3EyCmh/0V0sIV3xid6LNnUyJME1pFIC
	kkE9eoWpxAFayhBVQjj8unvq6hrdjRrUr/CuBXLfVdRwrLqNfOLMNAZhfelrn45WpKvITWNcy+x
	r7g+2CUh/TuOo49mQXCbHErLrYFCepRMRius3XM38GOe/fHFWQb/TvpcQzht
X-Received: by 2002:a17:906:ba8d:b0:bec:52f4:28f3 with SMTP id
 a640c23a62f3a-bf939b04be4mr331610666b.44.1781069951627; Tue, 09 Jun 2026
 22:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260602062940.3107241-1-saisneha196@gmail.com>
 <20260602062940.3107241-4-saisneha196@gmail.com> <DIYF5VYJ6KMJ.3EBC3FMJXOLPL@smile.fr>
 <18B61AC5A22983D6.29982@lists.openembedded.org> <CANcU11dYfjDYfDq152H-Yanv3gJ__b=dUewq+sKL=hHKrisQvw@mail.gmail.com>
 <80ef3660a609e1f080a6ec80872674cbcadb87c0.camel@linuxfoundation.org>
 <CANcU11fqh7bRUo=h9C3woRYnpmwnbUjBkGwpbhs1QV4rhnm4Cw@mail.gmail.com>
 <a5e0dca3e1eba8b86203fa63ba0c6bc7ce228a21.camel@linuxfoundation.org>
 <CANcU11cf4sH1racrRawKMQ8+622W_1qT33ou=Z06YG=38FJJcA@mail.gmail.com> <ad7d4fdddcf28b3e7daba91cb0e7d100e9bb5f4b.camel@linuxfoundation.org>
In-Reply-To: <ad7d4fdddcf28b3e7daba91cb0e7d100e9bb5f4b.camel@linuxfoundation.org>
From: Sai Sneha <saisneha196@gmail.com>
Date: Wed, 10 Jun 2026 11:09:00 +0530
X-Gm-Features: AVVi8Cfi9dagX3XEH-uEf1zV93aI9pVe5ynWVPte9NFV2UoCiBQdSLCZ7-Sap-k
Message-ID: <CANcU11eq5ffk9V0aXq-EdagYxLJ=o-kP+C5G3bV2cLzzuhnuCA@mail.gmail.com>
Subject: Re: [OE-core] insane.bbclass: add missing-srcrev QA check for SCM URIs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yoann Congal <yoann.congal@smile.fr>, openembedded-core@lists.openembedded.org, 
	corentin.guillevic@smile.fr, martin@geanix.com, paul@pbarker.dev, 
	mathieu.dubois-briand@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000c976440653dfa96b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 05:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238312

--000000000000c976440653dfa96b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

That makes sense if SRCREV is completely missing the recipe
is unbuildable anyway, so the parse failure is an acceptable
outcome for that case.

So the complete solution would be:
- BB_NO_NETWORK:layer-core =3D "1" in OE-core to prevent
floating branch/tag lookups
- A QA check in insane.bbclass to warn about missing SRCREV
for external layers
- yocto-check-layer catches parse failures during validation

Is this the right direction?

Best regards,
Sai Sneha


On Tue, 9 Jun 2026 at 5:11=E2=80=AFPM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2026-06-09 at 16:04 +0530, Sai Sneha wrote:
> > Hi Richard,
> >
> > Please correct me if am wrong.
> >   BB_NO_NETWORK:layer-core =3D "1"
> > would work for the case where SRCREV is set to a floating
> > branch or tag, since _lsremote() calls check_network_access()
> > which raises NetworkAccess when BB_NO_NETWORK is set.
> >
> > However for the case where SRCREV is completely missing the
> > crash happens earlier in srcrev_internal_helper() which raises
> > FetchError before latest_revision() is even called so
> > BB_NO_NETWORK wouldn=E2=80=99t catch that case.
>
> In that case the build fails to parse and is unbuildable? That is
> probably fine as check-layer tests whether it parses?
>
> Cheers,
>
> Richard
>

--000000000000c976440653dfa96b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div style=3D"font-size:inherit" dir=3D"auto">Hi Richard,<br style=3D"=
font-size:inherit"><br style=3D"font-size:inherit">That makes sense if SRCR=
EV is completely missing the recipe <br style=3D"font-size:inherit">is unbu=
ildable anyway, so the parse failure is an acceptable <br style=3D"font-siz=
e:inherit">outcome for that case.<br style=3D"font-size:inherit"><br style=
=3D"font-size:inherit">So the complete solution would be:<br style=3D"font-=
size:inherit">- BB_NO_NETWORK:layer-core =3D &quot;1&quot; in OE-core to pr=
event <br style=3D"font-size:inherit">  floating branch/tag lookups<br styl=
e=3D"font-size:inherit">- A QA check in insane.bbclass to warn about missin=
g SRCREV <br style=3D"font-size:inherit">  for external layers<br style=3D"=
font-size:inherit">- yocto-check-layer catches parse failures during valida=
tion<br style=3D"font-size:inherit"><br style=3D"font-size:inherit">Is this=
 the right direction?=C2=A0<br style=3D"font-size:inherit"><br style=3D"fon=
t-size:inherit">Best regards,<br style=3D"font-size:inherit">Sai Sneha<br s=
tyle=3D"font-size:inherit"></div><br></div><div><br><div class=3D"gmail_quo=
te gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 9 J=
un 2026 at 5:11=E2=80=AFPM, Richard Purdie &lt;<a href=3D"mailto:richard.pu=
rdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2026-06=
-09 at 16:04 +0530, Sai Sneha wrote:<br>
&gt; Hi Richard,<br>
&gt; <br>
&gt; Please correct me if am wrong.<br>
&gt; =C2=A0 BB_NO_NETWORK:layer-core =3D &quot;1&quot; <br>
&gt; would work for the case where SRCREV is set to a floating <br>
&gt; branch or tag, since _lsremote() calls check_network_access() <br>
&gt; which raises NetworkAccess when BB_NO_NETWORK is set.<br>
&gt; <br>
&gt; However for the case where SRCREV is completely missing the <br>
&gt; crash happens earlier in srcrev_internal_helper() which raises <br>
&gt; FetchError before latest_revision() is even called so=C2=A0<br>
&gt; BB_NO_NETWORK wouldn=E2=80=99t catch that case.<br>
<br>
In that case the build fails to parse and is unbuildable? That is<br>
probably fine as check-layer tests whether it parses?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--000000000000c976440653dfa96b--

