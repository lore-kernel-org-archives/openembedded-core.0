Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F5AC02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 18:58:13 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.19155.1737658686107731456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 10:58:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q73Qe5P9;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e549b0f8d57so2153853276.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 10:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737658685; x=1738263485; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ow3b9EruZzWpeIK+mQyYctcE+eo/9bW/YTthfxUgWao=;
        b=Q73Qe5P9APTwnN90yyKI2iJ0eLc8Aog2RVl75NyA7bT4E4WlEnrne8zLHd2biDT8YI
         iGHFPKfAiZBuIZxJnLwp7Ecyz3OjRyr0YQV8oZWVnGmvNfrnj2+9RIh7YK5lDixbUuoc
         ny95KmZ61lU4VUb/E9yE/L1VWu48jOxTB2Y2ihqNeuZkw6j5BYnRvwcYWqCjpTEtyHES
         jwhdvsetQgv2rhqc14iYf+JMO2OhokXLB1HJVewN1I0eADZ+S/+VHvDWnyUbAIPtXnXt
         Dpzdfhyan9pQLxlP8W+YdY4ucHf5RzaO4lnGiDm/hQJGZj2cYO5D8kyM/PrVETG4r80B
         qfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737658685; x=1738263485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ow3b9EruZzWpeIK+mQyYctcE+eo/9bW/YTthfxUgWao=;
        b=QBCVVy0/D3d7izU+o/Yvdf9VSFcVEteyFUv6liMREFvLNWpSwuO6c2E+4bTPkP2tqZ
         JAxa5eyl68pnkKapj/k+UnAIiI0cUGFiacs2Jjp0tZuhJJB5sBRe9Dj1VS9Fe/Zxe/LD
         0Kqd7rkA9vSy/SaP+FvwzBHUkRLVjDqxeb35Vq8gQ2w/bUy/KxkCp9xoNJwEYPjJDABJ
         ObzoOMrgSdxv7SURlmt/fkF6/PUjeEDUPamKnVkZZ2mOJqNjm6PPjVcOa2KvN9XWZsxh
         QDPa4bYKqFNbtQzU//DBNUcCuPweC+3FkZ/6bnAprIRMZgIxO3oFVkBrw5u59oN8CJC2
         dxoA==
X-Gm-Message-State: AOJu0Yzx785cpnBTb1B2WQn5F2etWHtLc4GSZiLxTJ6ft+wf8OD00u7K
	8d0FpACbme6GYyTaWaq771KIh8jq6+JgJkvtr3W1aJk5DclOMa6lfgnlU4PL26IMEPkSOaWSfaw
	l1G+8eAsXFe0BEL3zmJGfPYFEl1M=
X-Gm-Gg: ASbGnct/CzuoKuqt9PnVFvqBwqZE2riA87kd6FBCtARXsKxr99n3AfRVmJ/GEN+rY5J
	ewDPf/dZ5w/LWbx+N1fJD3XBlwPu/4ipUOQmAY15p6I1i+s2elaTQYA1v4InAHi+MgtVA4s0YMr
	iiOlf++3tcjo6B
X-Google-Smtp-Source: AGHT+IF7qTuT+7jwD6KLTdbxhuS++Kw+YzHlxu+TXKYmTnD+hwZEJnHBFya/PQVPX4DvRnDme8IiUp/WU4i9kSg9FDc=
X-Received: by 2002:a05:6902:2683:b0:e4d:25c6:c3b2 with SMTP id
 3f1490d57ef6-e57b103cb9cmr20653775276.7.1737658685006; Thu, 23 Jan 2025
 10:58:05 -0800 (PST)
MIME-Version: 1.0
References: <20250123184440.2431629-1-peter.marko@siemens.com>
 <20250123184440.2431629-3-peter.marko@siemens.com> <CANNYZj9gvtf3pyJfWUnaPm=39zDbzpPrsN0g6Frhjb68D9368g@mail.gmail.com>
 <AS1PR10MB56979EC59BF404E17C056D2BFDE02@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56979EC59BF404E17C056D2BFDE02@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 Jan 2025 19:57:54 +0100
X-Gm-Features: AbW1kvZLgu4_0a3aJn8qgwXJDXRpmGPvO0e8xyLG1c8E7DhO6tIfEcZY4b6Xc_A
Message-ID: <CANNYZj8bLrMaPy3iq2qqOAkLbxNBzPZyXJmFimtt1PLxMiXREw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 3/3] go: upgrade 1.22.10 -> 1.22.11
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a928e8062c6430d6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 18:58:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210210

--000000000000a928e8062c6430d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The point is, if not you, then who? :) 1.22 won=E2=80=99t be supported for =
much
longer.

Alex

On Thu 23. Jan 2025 at 19.55, Marko, Peter <Peter.Marko@siemens.com> wrote:

> Unfortunately no, I already answered this in
> https://lists.openembedded.org/g/openembedded-core/message/206463
>
> Peter
>
>
>
> *From:* Alexander Kanavin <alex.kanavin@gmail.com>
> *Sent:* Thursday, January 23, 2025 19:47
> *To:* Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core][PATCH 3/3] go: upgrade 1.22.10 -> 1.22.11
>
>
>
> Can you update to 1.23 as well?
>
>
>
> Alex
>
>
>
> On Thu 23. Jan 2025 at 19.45, Peter Marko via lists.openembedded.org
> <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Upgrade to latest 1.22.x release [1]:
>
> $ git --no-pager log --oneline go1.22.10..go1.22.11
> f072884354 (tag: go1.22.11) [release-branch.go1.22] go1.22.11
> b72d56f98d [release-branch.go1.22] net/http: persist header stripping
> across repeated redirects
> 19d2103415 [release-branch.go1.22] crypto/x509: properly check for IPv6
> hosts in URIs
> ae9996f965 [release-branch.go1.22] runtime: hold traceAcquire across
> casgstatus in injectglist
> 223260bc63 [release-branch.go1.22] crypto/tls: fix Config.Time in tests
> using expired certificates
>
> Fixes CVE-2024-45336 and CVE-2024-45341
>
> [1] https://github.com/golang/go/compare/go1.22.10...go1.22.11
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-devtools/go/{go-1.22.10.inc =3D> go-1.22.11.inc} | 2 +-
>  ...binary-native_1.22.10.bb =3D> go-binary-native_1.22.11.bb} | 6 +++---
>  ...oss-canadian_1.22.10.bb =3D> go-cross-canadian_1.22.11.bb} | 0
>  .../go/{go-cross_1.22.10.bb =3D> go-cross_1.22.11.bb}         | 0
>  .../go/{go-crosssdk_1.22.10.bb =3D> go-crosssdk_1.22.11.bb}   | 0
>  .../go/{go-runtime_1.22.10.bb =3D> go-runtime_1.22.11.bb}     | 0
>  meta/recipes-devtools/go/{go_1.22.10.bb =3D> go_1.22.11.bb}   | 0
>  7 files changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-devtools/go/{go-1.22.10.inc =3D> go-1.22.11.inc} (89=
%)
>  rename meta/recipes-devtools/go/{go-binary-native_1.22.10.bb =3D>
> go-binary-native_1.22.11.bb} (78%)
>  rename meta/recipes-devtools/go/{go-cross-canadian_1.22.10.bb =3D>
> go-cross-canadian_1.22.11.bb} (100%)
>  rename meta/recipes-devtools/go/{go-cross_1.22.10.bb =3D>
> go-cross_1.22.11.bb} (100%)
>  rename meta/recipes-devtools/go/{go-crosssdk_1.22.10.bb =3D>
> go-crosssdk_1.22.11.bb} (100%)
>  rename meta/recipes-devtools/go/{go-runtime_1.22.10.bb =3D>
> go-runtime_1.22.11.bb} (100%)
>  rename meta/recipes-devtools/go/{go_1.22.10.bb =3D> go_1.22.11.bb} (100%=
)
>
> diff --git a/meta/recipes-devtools/go/go-1.22.10.inc
> b/meta/recipes-devtools/go/go-1.22.11.inc
> similarity index 89%
> rename from meta/recipes-devtools/go/go-1.22.10.inc
> rename to meta/recipes-devtools/go/go-1.22.11.inc
> index 2abe7d0f3e3..21222bea4ec 100644
> --- a/meta/recipes-devtools/go/go-1.22.10.inc
> +++ b/meta/recipes-devtools/go/go-1.22.11.inc
> @@ -15,4 +15,4 @@ SRC_URI +=3D "\
>
> file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
>      file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
>  "
> -SRC_URI[main.sha256sum] =3D
> "1e94fd48be750d1fafb4d9b3b6dd31a6e9d2735d339bf2462bc97b64ca4c1037"
> +SRC_URI[main.sha256sum] =3D
> "a60c23dec95d10a2576265ce580f57869d5ac2471c4f4aca805addc9ea0fc9fe"
> diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.10.bb
> b/meta/recipes-devtools/go/go-binary-native_1.22.11.bb
> similarity index 78%
> rename from meta/recipes-devtools/go/go-binary-native_1.22.10.bb
> rename to meta/recipes-devtools/go/go-binary-native_1.22.11.bb
> index 8c8fe5bff9f..a526cc88bc2 100644
> --- a/meta/recipes-devtools/go/go-binary-native_1.22.10.bb
> +++ b/meta/recipes-devtools/go/go-binary-native_1.22.11.bb
> @@ -9,9 +9,9 @@ PROVIDES =3D "go-native"
>
>  # Checksums available at https://go.dev/dl/
>  SRC_URI =3D "
> https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;nam=
e=3Dgo_${BUILD_GOTUPLE}
> "
> -SRC_URI[go_linux_amd64.sha256sum] =3D
> "736ce492a19d756a92719a6121226087ccd91b652ed5caec40ad6dbfb2252092"
> -SRC_URI[go_linux_arm64.sha256sum] =3D
> "5213c5e32fde3bd7da65516467b7ffbfe40d2bb5a5f58105e387eef450583eec"
> -SRC_URI[go_linux_ppc64le.sha256sum] =3D
> "db05b9838f69d741fb9a5301220b1a62014aee025b0baf341aba3d280087b981"
> +SRC_URI[go_linux_amd64.sha256sum] =3D
> "0fc88d966d33896384fbde56e9a8d80a305dc17a9f48f1832e061724b1719991"
> +SRC_URI[go_linux_arm64.sha256sum] =3D
> "9ebfcab26801fa4cf0627c6439db7a4da4d3c6766142a3dd83508240e4f21031"
> +SRC_URI[go_linux_ppc64le.sha256sum] =3D
> "963a0ec973640b23ee8bb7a462cc415276fd8436111a03df8c34eb3b1ae29f12"
>
>  UPSTREAM_CHECK_URI =3D "https://golang.org/dl/"
>  UPSTREAM_CHECK_REGEX =3D "go(?P<pver>\d+(\.\d+)+)\.linux"
> diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.10.bb
> b/meta/recipes-devtools/go/go-cross-canadian_1.22.11.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross-canadian_1.22.10.bb
> rename to meta/recipes-devtools/go/go-cross-canadian_1.22.11.bb
> diff --git a/meta/recipes-devtools/go/go-cross_1.22.10.bb
> b/meta/recipes-devtools/go/go-cross_1.22.11.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross_1.22.10.bb
> rename to meta/recipes-devtools/go/go-cross_1.22.11.bb
> diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.10.bb
> b/meta/recipes-devtools/go/go-crosssdk_1.22.11.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-crosssdk_1.22.10.bb
> rename to meta/recipes-devtools/go/go-crosssdk_1.22.11.bb
> diff --git a/meta/recipes-devtools/go/go-runtime_1.22.10.bb
> b/meta/recipes-devtools/go/go-runtime_1.22.11.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-runtime_1.22.10.bb
> rename to meta/recipes-devtools/go/go-runtime_1.22.11.bb
> diff --git a/meta/recipes-devtools/go/go_1.22.10.bb
> b/meta/recipes-devtools/go/go_1.22.11.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go_1.22.10.bb
> rename to meta/recipes-devtools/go/go_1.22.11.bb
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210207):
> https://lists.openembedded.org/g/openembedded-core/message/210207
> Mute This Topic: https://lists.openembedded.org/mt/110777118/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a928e8062c6430d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The point is, if not you, then who? :) 1.22 won=E2=80=99t=
 be supported for much longer.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Alex</div><div><br><div class=3D"gmail_quote gmail_quote_container">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu 23. Jan 2025 at 19.55, Marko, =
Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.com">Peter.Marko@siemens.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-le=
ft:1ex;border-left-color:rgb(204,204,204)">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"overflow-wrap: =
break-word;">
<div class=3D"m_5259311321569912241WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Unfortunately no, I a=
lready answered this in
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/20646=
3" target=3D"_blank">https://lists.openembedded.org/g/openembedded-core/mes=
sage/206463</a></span></p></div></div><div lang=3D"EN-US" link=3D"blue" vli=
nk=3D"purple" style=3D"overflow-wrap: break-word;"><div class=3D"m_52593113=
21569912241WordSection1"><p class=3D"MsoNormal"><span style=3D"font-size:11=
pt"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Peter<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<div style=3D"border-width:medium medium medium 1.5pt;border-style:none non=
e none solid;padding:0in 0in 0in 4pt;border-color:currentcolor currentcolor=
 currentcolor blue">
<div>
<div style=3D"border-width:1pt medium medium;border-style:solid none none;p=
adding:3pt 0in 0in;border-color:rgb(225,225,225) currentcolor currentcolor"=
>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:Calibri=
,sans-serif">From:</span></b><span style=3D"font-size:11pt;font-family:Cali=
bri,sans-serif"> Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank" style=3D"font-family:Calibri,sans-serif">alex.kanav=
in@gmail.com</a>&gt;
<br>
<b style=3D"font-family:Calibri,sans-serif">Sent:</b> Thursday, January 23,=
 2025 19:47<br>
<b style=3D"font-family:Calibri,sans-serif">To:</b> Marko, Peter (FT D EU S=
K BFS1) &lt;<a href=3D"mailto:Peter.Marko@siemens.com" target=3D"_blank" st=
yle=3D"font-family:Calibri,sans-serif">Peter.Marko@siemens.com</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Cc:</b> <a href=3D"mailto:opene=
mbedded-core@lists.openembedded.org" target=3D"_blank" style=3D"font-family=
:Calibri,sans-serif">openembedded-core@lists.openembedded.org</a><br>
<b style=3D"font-family:Calibri,sans-serif">Subject:</b> Re: [OE-core][PATC=
H 3/3] go: upgrade 1.22.10 -&gt; 1.22.11<u style=3D"font-family:Calibri,san=
s-serif"></u><u style=3D"font-family:Calibri,sans-serif"></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">Can you update to 1.23 as well?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Alex<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Thu 23. Jan 2025 at 19.45, Peter Marko via <a hre=
f=3D"http://lists.openembedded.org" target=3D"_blank">
lists.openembedded.org</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.com@=
lists.openembedded.org" target=3D"_blank">siemens.com@lists.openembedded.or=
g</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;padding:0in 0in 0in 6pt;margin-left:4.8pt;margin-right:0i=
n;border-color:currentcolor currentcolor currentcolor rgb(204,204,204)">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">From: Peter Marko &lt;<=
a href=3D"mailto:peter.marko@siemens.com" target=3D"_blank">peter.marko@sie=
mens.com</a>&gt;<br>
<br>
Upgrade to latest 1.22.x release [1]:<br>
<br>
$ git --no-pager log --oneline go1.22.10..go1.22.11<br>
f072884354 (tag: go1.22.11) [release-branch.go1.22] go1.22.11<br>
b72d56f98d [release-branch.go1.22] net/http: persist header stripping acros=
s repeated redirects<br>
19d2103415 [release-branch.go1.22] crypto/x509: properly check for IPv6 hos=
ts in URIs<br>
ae9996f965 [release-branch.go1.22] runtime: hold traceAcquire across casgst=
atus in injectglist<br>
223260bc63 [release-branch.go1.22] crypto/tls: fix Config.Time in tests usi=
ng expired certificates<br>
<br>
Fixes CVE-2024-45336 and CVE-2024-45341<br>
<br>
[1] <a href=3D"https://github.com/golang/go/compare/go1.22.10...go1.22.11" =
target=3D"_blank">
https://github.com/golang/go/compare/go1.22.10...go1.22.11</a><br>
<br>
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/go/{go-1.22.10.inc =3D&gt; go-1.22.11.inc} | 2 =
+-<br>
=C2=A0...<a href=3D"http://binary-native_1.22.10.bb" target=3D"_blank">bina=
ry-native_1.22.10.bb</a> =3D&gt;
<a href=3D"http://go-binary-native_1.22.11.bb" target=3D"_blank">go-binary-=
native_1.22.11.bb</a>} | 6 +++---<br>
=C2=A0...<a href=3D"http://oss-canadian_1.22.10.bb" target=3D"_blank">oss-c=
anadian_1.22.10.bb</a> =3D&gt;
<a href=3D"http://go-cross-canadian_1.22.11.bb" target=3D"_blank">go-cross-=
canadian_1.22.11.bb</a>} | 0<br>
=C2=A0.../go/{<a href=3D"http://go-cross_1.22.10.bb" target=3D"_blank">go-c=
ross_1.22.10.bb</a> =3D&gt;
<a href=3D"http://go-cross_1.22.11.bb" target=3D"_blank">go-cross_1.22.11.b=
b</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../go/{<a href=3D"http://go-crosssdk_1.22.10.bb" target=3D"_blank">g=
o-crosssdk_1.22.10.bb</a> =3D&gt;
<a href=3D"http://go-crosssdk_1.22.11.bb" target=3D"_blank">go-crosssdk_1.2=
2.11.bb</a>}=C2=A0 =C2=A0| 0<br>
=C2=A0.../go/{<a href=3D"http://go-runtime_1.22.10.bb" target=3D"_blank">go=
-runtime_1.22.10.bb</a> =3D&gt;
<a href=3D"http://go-runtime_1.22.11.bb" target=3D"_blank">go-runtime_1.22.=
11.bb</a>}=C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0meta/recipes-devtools/go/{<a href=3D"http://go_1.22.10.bb" target=3D"=
_blank">go_1.22.10.bb</a> =3D&gt;
<a href=3D"http://go_1.22.11.bb" target=3D"_blank">go_1.22.11.bb</a>}=C2=A0=
 =C2=A0| 0<br>
=C2=A07 files changed, 4 insertions(+), 4 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/go/{go-1.22.10.inc =3D&gt; go-1.22.11.in=
c} (89%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-binary-native_1=
.22.10.bb" target=3D"_blank">go-binary-native_1.22.10.bb</a> =3D&gt;
<a href=3D"http://go-binary-native_1.22.11.bb" target=3D"_blank">go-binary-=
native_1.22.11.bb</a>} (78%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-cross-canadian_=
1.22.10.bb" target=3D"_blank">go-cross-canadian_1.22.10.bb</a> =3D&gt;
<a href=3D"http://go-cross-canadian_1.22.11.bb" target=3D"_blank">go-cross-=
canadian_1.22.11.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-cross_1.22.10.b=
b" target=3D"_blank">go-cross_1.22.10.bb</a> =3D&gt;
<a href=3D"http://go-cross_1.22.11.bb" target=3D"_blank">go-cross_1.22.11.b=
b</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-crosssdk_1.22.1=
0.bb" target=3D"_blank">go-crosssdk_1.22.10.bb</a> =3D&gt;
<a href=3D"http://go-crosssdk_1.22.11.bb" target=3D"_blank">go-crosssdk_1.2=
2.11.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-runtime_1.22.10=
.bb" target=3D"_blank">go-runtime_1.22.10.bb</a> =3D&gt;
<a href=3D"http://go-runtime_1.22.11.bb" target=3D"_blank">go-runtime_1.22.=
11.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go_1.22.10.bb" tar=
get=3D"_blank">go_1.22.10.bb</a> =3D&gt;
<a href=3D"http://go_1.22.11.bb" target=3D"_blank">go_1.22.11.bb</a>} (100%=
)<br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.22.10.inc b/meta/recipes-devtool=
s/go/go-1.22.11.inc<br>
similarity index 89%<br>
rename from meta/recipes-devtools/go/go-1.22.10.inc<br>
rename to meta/recipes-devtools/go/go-1.22.11.inc<br>
index 2abe7d0f3e3..21222bea4ec 100644<br>
--- a/meta/recipes-devtools/go/go-1.22.10.inc<br>
+++ b/meta/recipes-devtools/go/go-1.22.11.inc<br>
@@ -15,4 +15,4 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0<a>file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-=
host-compile.patch</a> \<br>
=C2=A0 =C2=A0 =C2=A0<a>file://0009-go-Filter-build-paths-on-staticly-linked=
-arches.patch</a> \<br>
=C2=A0&quot;<br>
-SRC_URI[main.sha256sum] =3D &quot;1e94fd48be750d1fafb4d9b3b6dd31a6e9d2735d=
339bf2462bc97b64ca4c1037&quot;<br>
+SRC_URI[main.sha256sum] =3D &quot;a60c23dec95d10a2576265ce580f57869d5ac247=
1c4f4aca805addc9ea0fc9fe&quot;<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.=
22.10.bb" target=3D"_blank">go-binary-native_1.22.10.bb</a> b/meta/recipes-=
devtools/go/<a href=3D"http://go-binary-native_1.22.11.bb" target=3D"_blank=
">go-binary-native_1.22.11.bb</a><br>
similarity index 78%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.2=
2.10.bb" target=3D"_blank">go-binary-native_1.22.10.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.22.=
11.bb" target=3D"_blank">go-binary-native_1.22.11.bb</a><br>
index 8c8fe5bff9f..a526cc88bc2 100644<br>
--- a/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.22.10.b=
b" target=3D"_blank">go-binary-native_1.22.10.bb</a><br>
+++ b/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.22.11.b=
b" target=3D"_blank">go-binary-native_1.22.11.bb</a><br>
@@ -9,9 +9,9 @@ PROVIDES =3D &quot;go-native&quot;<br>
<br>
=C2=A0# Checksums available at <a href=3D"https://go.dev/dl/" target=3D"_bl=
ank">https://go.dev/dl/</a><br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://dl.google.com/go/go$%7BPV%7D.$%7=
BBUILD_GOOS%7D-$%7BBUILD_GOARCH%7D.tar.gz;name=3Dgo_$%7BBUILD_GOTUPLE%7D" t=
arget=3D"_blank">https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOA=
RCH}.tar.gz;name=3Dgo_${BUILD_GOTUPLE}</a>&quot;<br>
-SRC_URI[go_linux_amd64.sha256sum] =3D &quot;736ce492a19d756a92719a61212260=
87ccd91b652ed5caec40ad6dbfb2252092&quot;<br>
-SRC_URI[go_linux_arm64.sha256sum] =3D &quot;5213c5e32fde3bd7da65516467b7ff=
bfe40d2bb5a5f58105e387eef450583eec&quot;<br>
-SRC_URI[go_linux_ppc64le.sha256sum] =3D &quot;db05b9838f69d741fb9a5301220b=
1a62014aee025b0baf341aba3d280087b981&quot;<br>
+SRC_URI[go_linux_amd64.sha256sum] =3D &quot;0fc88d966d33896384fbde56e9a8d8=
0a305dc17a9f48f1832e061724b1719991&quot;<br>
+SRC_URI[go_linux_arm64.sha256sum] =3D &quot;9ebfcab26801fa4cf0627c6439db7a=
4da4d3c6766142a3dd83508240e4f21031&quot;<br>
+SRC_URI[go_linux_ppc64le.sha256sum] =3D &quot;963a0ec973640b23ee8bb7a462cc=
415276fd8436111a03df8c34eb3b1ae29f12&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://golang.org/dl/" targe=
t=3D"_blank">https://golang.org/dl/</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;go(?P&lt;pver&gt;\d+(\.\d+)+)\.linux&q=
uot;<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1=
.22.10.bb" target=3D"_blank">go-cross-canadian_1.22.10.bb</a> b/meta/recipe=
s-devtools/go/<a href=3D"http://go-cross-canadian_1.22.11.bb" target=3D"_bl=
ank">go-cross-canadian_1.22.11.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1.=
22.10.bb" target=3D"_blank">go-cross-canadian_1.22.10.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1.22=
.11.bb" target=3D"_blank">go-cross-canadian_1.22.11.bb</a><br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cross_1.22.10.bb=
" target=3D"_blank">go-cross_1.22.10.bb</a> b/meta/recipes-devtools/go/<a h=
ref=3D"http://go-cross_1.22.11.bb" target=3D"_blank">go-cross_1.22.11.bb</a=
><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-cross_1.22.10.bb"=
 target=3D"_blank">go-cross_1.22.10.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-cross_1.22.11.bb" t=
arget=3D"_blank">go-cross_1.22.11.bb</a><br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.22.10=
.bb" target=3D"_blank">go-crosssdk_1.22.10.bb</a> b/meta/recipes-devtools/g=
o/<a href=3D"http://go-crosssdk_1.22.11.bb" target=3D"_blank">go-crosssdk_1=
.22.11.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.22.10.=
bb" target=3D"_blank">go-crosssdk_1.22.10.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.22.11.bb=
" target=3D"_blank">go-crosssdk_1.22.11.bb</a><br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.22.10.=
bb" target=3D"_blank">go-runtime_1.22.10.bb</a> b/meta/recipes-devtools/go/=
<a href=3D"http://go-runtime_1.22.11.bb" target=3D"_blank">go-runtime_1.22.=
11.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.22.10.b=
b" target=3D"_blank">go-runtime_1.22.10.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.22.11.bb"=
 target=3D"_blank">go-runtime_1.22.11.bb</a><br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go_1.22.10.bb" targ=
et=3D"_blank">go_1.22.10.bb</a> b/meta/recipes-devtools/go/<a href=3D"http:=
//go_1.22.11.bb" target=3D"_blank">go_1.22.11.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go_1.22.10.bb" targe=
t=3D"_blank">go_1.22.10.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go_1.22.11.bb" target=
=3D"_blank">go_1.22.11.bb</a><br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#210207): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/210207" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/210207</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110777118/168=
6489" target=3D"_blank">
https://lists.openembedded.org/mt/110777118/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>]<=
br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>
</div>

</blockquote></div></div>

--000000000000a928e8062c6430d6--

