Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF8DEE36BD
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 18:06:06 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51957.1770919564938888466
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 10:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T7S6OypZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8f992167dcso4915166b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 10:06:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770919563; cv=none;
        d=google.com; s=arc-20240605;
        b=NbKv7KqROUptMjz+/UM+VY7l9KM1ArLUjPJXodmAge0N7lbM1X+wbyW/RR0cEr7eH9
         oIpVbaErG4L3c16twN+uRz4leXz3PKeNYuNv/wDlk6+fdwJdtUj+pGrh+f8rM635alZK
         WKCdhp6ZLmZ2hgNot2MLNKMGjEGjWCBCEHTxIO3u7BO3BjETEZOt6LDearpBfUKW23OY
         6A+4T3p4bA031ousbd4+eqrySalNxcddlg7TM5VhdMY7F/anuRTZGbsioPA35dguw+Ay
         G/8aUoD40oYNnnWGjLG8gp0U/1lRdjnAqEgZde1vghZtQGpRM18JW0mt+zT8s5KRrpNS
         7AcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=chCErQ00Sr9113lDTVhN8Ad/wrz4WO+6FWIXa0k/1Nk=;
        fh=3dgrv7p2BhCezp8MNN+0x0yDLz6nNB6QdcmuvE5XUQk=;
        b=U7+R+SBFplSvR80WhtE42auymAnmTF9znDaT83f0wBsoNy9JPewSCIBqBeqOy2favE
         /hBAsmeoDqqusYitGB2vdw6HInsoAoAmc0+Kruh7lmb3thWMWYgXZx3rTNcioWE/+L2f
         IpxQvFmbHzCjVuyRwiUCKL8oDLfkkG7Y1P+IiwlSNF8GRKwP5P62X05RSDOv+O9OuWgV
         Z5aygqMDFa65Hi51lnqi6P6MM5rCInYG+/xAf7BiXSBkriM4VncKQqA/iB0HxPNEtydj
         oYc5BD80b2KUMDEUtenD6kUj8nXTMDYfKYCvJNx5EBa44pGnDUR2KOXpo107r8MlPzPn
         KZhw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770919563; x=1771524363; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=chCErQ00Sr9113lDTVhN8Ad/wrz4WO+6FWIXa0k/1Nk=;
        b=T7S6OypZC8msWnlJXgUVDocjtxLZ0jBnT0fWii1t+ENi1J6CYGzhnqIZZU+tyzk7gs
         CivpEKq6yRS5jtWROIFPpSAu4mbBI4RaRT18rXTGHoyCxxo2TaAMYV976CVczVAaG480
         UxoPTuRCmfJbJhVBV16lFYkcAMCo1U3O8hX9AYVow31fcsQRI4CMj1cDY5cVRSUMolw9
         lZj2+GZgdXgmAufv9KhQzbL+NjUqpeaiaptG/l9c912eFIu8gVkR9Btjkk6UYaOoNuaR
         o46jEYv5sf1AN7Sge1kP/VP4ugyqPBcv0ycTN/rNabR0Bll3kbFzUd+bcjrlKGAQ5eq8
         FEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770919563; x=1771524363;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chCErQ00Sr9113lDTVhN8Ad/wrz4WO+6FWIXa0k/1Nk=;
        b=es+V4pQP97EySCNnCxprr7DmWQKqrZZ3WRX4w0ML2WIdfGf8aDTna/QVsbXUslGHQO
         pSx450wOqyZpj67MqDcbid2EOgS3G8ZInBegNaGOVscdOBwa2gZCeSphCG2elzrO6TRd
         CTwXRbdS01BQ6reFrdWHuwnkPzABUO8GSO7iplSCwTalzOllOu2gDbE/ka9aAt9d1i+1
         DIGPpkkVeR3YKWFA2zn0fC4SVJObECeBIUm/6VlMOPFBiLvKn9YbJkktkhWMl9Du7jWl
         gbZ6BnIgsvRa+xvM/A1bl3YpDoEYIy6hVLLhfJdVyzjqG1xA4HhWIno87DRUifGUhtwb
         HXJA==
X-Forwarded-Encrypted: i=1; AJvYcCXEGMKsYXgGxis8VnvlZTXa9IYjqDtXLGFQwMaImz5IH0I3A51zCX6ejj6fQkq4/iJEg/kpQZvf2cEW/7Colno2/w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx8v5Wat1tLJRLlaH7FFviDCyk2Mt+1QOdRu4pD3Dox8sePB6Qy
	eKfm43T+faRJtwKSRQuxaQeRHTNsH0eH8hABEHt0qAuHd80irbIthUAEWCbUno13wmTyZTIlEm9
	Wh6HZsjVBDk4ykql3oaVNIUbL1nxr8Nc=
X-Gm-Gg: AZuq6aL3nXPusgU+Trz5Ne54BKZ+hnV7Xt5lowTbx9MB3QEKIes6/SHc87vFGu1F+Up
	j/55IXe0QtuQeJP33xhRmJtX1iSBa7P9DveuwZDY8Z8ikSVJkbL2I4dD8KuB8i262f6CsH9WroR
	cIHPVYvQ4ctUKtZoimMGNhdo9RDJ28SnEHgi/TNTHbLN7RvoG1bywaWibHxTw9ti2rSDcPJUWgk
	6Tx0xTwF560EI3eB2Rc1iLfGEqu5TfUZYKoY2d+PfFKc4xsauvALrbnzqLDoh+KUis0GM4V5nOg
	1oKOEe5JJw==
X-Received: by 2002:a17:907:96a3:b0:b83:1327:920d with SMTP id
 a640c23a62f3a-b8f9268fb15mr186846966b.0.1770919562894; Thu, 12 Feb 2026
 10:06:02 -0800 (PST)
MIME-Version: 1.0
References: <DM4PR11MB6189CC7075F52DA63D8CF527C463A@DM4PR11MB6189.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6189CC7075F52DA63D8CF527C463A@DM4PR11MB6189.namprd11.prod.outlook.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 12 Feb 2026 18:05:51 +0000
X-Gm-Features: AZwV_QhoAX1VcHSEZsmYusVpLY7Rjw8glW2soZYnoDNCFdgWGqJaJcLCXgM876c
Message-ID: <CANPvuR=7aa2kJM1VJLc-tx-VUfcss1DQ2zdDqXifFSeK-_mnVg@mail.gmail.com>
Subject: Re: [OE-core] Clarification on handling recent CVEs for
 go-binary-native package
To: deeratho@cisco.com
Cc: Khem Raj <raj.khem@gmail.com>, "Viral Chavda (vchavda)" <vchavda@cisco.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Peter Marko <peter.marko@siemens.com>
Content-Type: multipart/alternative; boundary="00000000000078e477064aa45706"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231060

--00000000000078e477064aa45706
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Deepak,

The go-binary-native was used to bootstrap the go toolchain, we take it
from the official go upstream https://go.dev/dl.
Perhaps this is the ideal place to report such problems, so that they can
create new binary packages with the referred CVE fixed.

Jose

Deepak Rathore via lists.openembedded.org <deeratho=3D
cisco.com@lists.openembedded.org> escreveu (quinta, 12/02/2026 =C3=A0(s) 11=
:15):

> Hello Khem Raj,
>
> Several new CVEs have been assigned to go-binary-native package (as liste=
d
> below). Based on the recipe, it=E2=80=99s been observed that it uses preb=
uilt
> instead of being built from source code. Can you please help to understan=
d
> the procedures and how we can address applicable CVEs for these packages?
> Do we have any identified plan to address it?
> CVEs affecting go-binary-native:
>
>    1. CVE-2025-4674 (CVSS 8.6) =E2=80=93
>    https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-4674
>    2. CVE-2025-47906 (CVSS 6.5) =E2=80=93
>    https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-47906
>    3. CVE-2025-47907 (CVSS 7.0) =E2=80=93
>    https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-47907
>    4. CVE-2025-47912 (CVSS 5.3) =E2=80=93
>    https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-47912
>    5. CVE-2025-58185 (CVSS 5.3) =E2=80=93
>    https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58185
>    6. CVE-2025-58187 (CVSS 7.5) =E2=80=93
>    https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58187
>    7. CVE-2025-58188 (CVSS 7.5) =E2=80=93
>    https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58188
>    8. CVE-2025-58189 (CVSS 5.3) =E2=80=93
>    https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58189
>    9. CVE-2025-61723 (CVSS 7.5) =E2=80=93
>    https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61723
>    10. CVE-2025-61724 (CVSS 5.3) =E2=80=93
>    https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61724
>    11. CVE-2025-61726 (CVSS 7.5) =E2=80=93
>    https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61726
>    12. CVE-2025-61727 (CVSS 6.5) =E2=80=93
>    https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61727
>    13. CVE-2025-61728 (CVSS 6.5) =E2=80=93
>    https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61728
>    14. CVE-2025-61729 (CVSS 7.5) =E2=80=93
>    https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61729
>    15. CVE-2025-61730 (CVSS 5.3) =E2=80=93
>    https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61730
>    16. CVE-2025-61731 (CVSS 7.8) =E2=80=93
>    https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61731
>    17. CVE-2025-68119 (CVSS 7.0) =E2=80=93
>    https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68119
>    18. CVE-2025-22873 (CVSS3: 3.8) -
>    https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22873
>    19. CVE-2025-61732 (CVSS3: 8.6) -
>    https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61732
>    20. CVE-2025-68121 (CVSS3: 10.0) -
>    https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68121
>
> Thanks for the guidance.
> Regards,
> Deepak Rathore
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#231022):
> https://lists.openembedded.org/g/openembedded-core/message/231022
> Mute This Topic: https://lists.openembedded.org/mt/117772424/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000078e477064aa45706
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Deepak,</div><div><span style=3D"color:rgb(0,0,0);=
font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,=
sans-serif;font-size:14.6667px"><br></span></div><div>The go-binary-native =
was used to bootstrap the go toolchain, we take it from the official go ups=
tream <a href=3D"https://go.dev/dl">https://go.dev/dl</a>.<br>Perhaps this =
is the ideal place to report such problems, so that they can create new bin=
ary packages with the referred CVE fixed.</div><div><br></div><div>Jose<br>=
<br></div><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr"=
 class=3D"gmail_attr">Deepak Rathore via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;deeratho=3D<a href=3D"mailto:cisco.c=
om@lists.openembedded.org">cisco.com@lists.openembedded.org</a>&gt; escreve=
u (quinta, 12/02/2026 =C3=A0(s) 11:15):<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div class=3D"msg5349306685256782562">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Hello Khem Raj,</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px 0px 16px;font-fami=
ly:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-seri=
f;font-size:11pt;color:rgb(0,0,0)">
Several new CVEs have been assigned to go-binary-native package (as listed =
below). Based on the recipe, it=E2=80=99s been observed that it uses prebui=
lt instead of being built from source code. Can you please help to understa=
nd the procedures and how we can address
 applicable CVEs for these packages? Do we have any identified plan to addr=
ess it?</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px 0px 16px;font-fami=
ly:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-seri=
f;font-size:11pt;color:rgb(0,0,0)">
CVEs affecting go-binary-native:</div>
<ol style=3D"text-align:left;list-style-type:decimal;display:flex" start=3D=
"1">
<li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calib=
ri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0);text-indent:0px;lin=
e-height:1.5em">
<div role=3D"presentation">CVE-2025-4674 (CVSS 8.6) =E2=80=93 <a id=3D"m_-8=
18348975960448073OWA1ca65b70-2398-03b0-72aa-f6b65488c9c6" href=3D"https://w=
eb.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-4674" target=3D"_blank">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-4674</a></div>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0);line-height:1.=
5em">
<div role=3D"presentation">CVE-2025-47906 (CVSS 6.5) =E2=80=93 <a id=3D"m_-=
818348975960448073OWA03eb7f5f-f911-91b1-39a2-4ec6d8a647c3" href=3D"https://=
web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-47906" target=3D"_blank=
">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-47906</a>=C2=A0=
</div>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0);line-height:1.=
5em">
<div role=3D"presentation">CVE-2025-47907 (CVSS 7.0) =E2=80=93=C2=A0 <a id=
=3D"m_-818348975960448073OWAd648b0f1-8296-0aca-a4f3-a32276fcd43c" href=3D"h=
ttps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-47907" target=3D=
"_blank">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-47907</a></div>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0);line-height:1.=
5em">
<div role=3D"presentation">CVE-2025-47912 (CVSS 5.3) =E2=80=93 <a id=3D"m_-=
818348975960448073OWAdd1864ae-ee5d-c2d3-c187-ffa55eed96ac" href=3D"https://=
web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-47912" target=3D"_blank=
">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-47912</a></div>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<div role=3D"presentation">CVE-2025-58185 (CVSS 5.3) =E2=80=93 <a id=3D"m_-=
818348975960448073OWA52e020ea-8789-fa5f-a93e-4de70d33d2f9" href=3D"https://=
web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58185" target=3D"_blank=
">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58185</a></div>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<div role=3D"presentation">CVE-2025-58187 (CVSS 7.5) =E2=80=93 <a id=3D"m_-=
818348975960448073OWA3b049d8b-dfbc-c545-b452-0db3658eed8f" href=3D"https://=
web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58187" target=3D"_blank=
">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58187</a></div>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<div role=3D"presentation">CVE-2025-58188 (CVSS 7.5) =E2=80=93 <a id=3D"m_-=
818348975960448073OWA1f4c4514-a4d2-872d-0423-97f2679ffad0" href=3D"https://=
web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58188" target=3D"_blank=
">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58188</a></div>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<div role=3D"presentation">CVE-2025-58189 (CVSS 5.3) =E2=80=93 <a id=3D"m_-=
818348975960448073OWAb1e0ec13-4e18-11a9-de6d-9f00af3ae02b" href=3D"https://=
web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58189" target=3D"_blank=
">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58189</a></div>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<div role=3D"presentation">CVE-2025-61723 (CVSS 7.5) =E2=80=93 <a id=3D"m_-=
818348975960448073OWAa19e3313-c643-b167-b907-28bfef219c30" href=3D"https://=
web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61723" target=3D"_blank=
">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61723</a></div>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<div role=3D"presentation">CVE-2025-61724 (CVSS 5.3) =E2=80=93 <a id=3D"m_-=
818348975960448073OWAedb52fb5-fd50-88a8-ab42-7c239a83375f" href=3D"https://=
web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61724" target=3D"_blank=
">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61724</a></div>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<div role=3D"presentation">CVE-2025-61726 (CVSS 7.5) =E2=80=93 <a id=3D"m_-=
818348975960448073OWA35b8ed61-7426-8373-2906-abce07c55d53" href=3D"https://=
web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61726" target=3D"_blank=
">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61726</a></div>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<div role=3D"presentation">CVE-2025-61727 (CVSS 6.5) =E2=80=93 <a id=3D"m_-=
818348975960448073OWA4954b624-f264-158b-b67a-5a225347140b" href=3D"https://=
web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61727" target=3D"_blank=
">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61727</a></div>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<div role=3D"presentation">CVE-2025-61728 (CVSS 6.5) =E2=80=93 <a id=3D"m_-=
818348975960448073OWAcf766b56-f631-f45a-12bd-9ce27067e6e1" href=3D"https://=
web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61728" target=3D"_blank=
">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61728</a></div>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<div role=3D"presentation">CVE-2025-61729 (CVSS 7.5) =E2=80=93 <a id=3D"m_-=
818348975960448073OWA21d344e7-b9f0-122a-6999-449a0e1536a0" href=3D"https://=
web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61729" target=3D"_blank=
">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61729</a></div>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<div role=3D"presentation">CVE-2025-61730 (CVSS 5.3) =E2=80=93 <a id=3D"m_-=
818348975960448073OWA401e0b88-fc2c-149e-852f-5f6d32f4d363" href=3D"https://=
web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61730" target=3D"_blank=
">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61730</a></div>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<div role=3D"presentation">CVE-2025-61731 (CVSS 7.8) =E2=80=93 <a id=3D"m_-=
818348975960448073OWAe34bb81d-6c1c-b9fb-45f2-c61688a285eb" href=3D"https://=
web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61731" target=3D"_blank=
">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61731</a></div>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<div role=3D"presentation">CVE-2025-68119 (CVSS 7.0) =E2=80=93 <a id=3D"m_-=
818348975960448073OWA952d0b72-9f9c-bd94-dce5-abacb4ad9cd3" href=3D"https://=
web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68119" target=3D"_blank=
">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68119</a></div>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<div role=3D"presentation">CVE-2025-22873 (CVSS3: 3.8) - <a href=3D"https:/=
/web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22873" target=3D"_blan=
k">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22873</a></div>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<div role=3D"presentation">CVE-2025-61732 (CVSS3: 8.6) - <a href=3D"https:/=
/web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61732" target=3D"_blan=
k">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61732</a></div>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<div role=3D"presentation">CVE-2025-68121 (CVSS3: 10.0) - <a href=3D"https:=
//web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68121" target=3D"_bla=
nk">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68121</a></div>
</li></ol>
<div style=3D"text-align:left;text-indent:0px;line-height:1.5em;margin:0px =
0px 16px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,H=
elvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Thanks for the guidance.</div>
<div style=3D"text-align:left;text-indent:0px;line-height:1.5em;margin:0px;=
font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,=
sans-serif;font-size:11pt;color:rgb(0,0,0)">
Regards,<br>
Deepak Rathore</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#231022): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/231022" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/231022</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117772424/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117772424/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</d=
iv></div></div></div>

--00000000000078e477064aa45706--

