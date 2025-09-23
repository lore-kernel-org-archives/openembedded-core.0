Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78775CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 23:02:34 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.64.1758668553617220640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 16:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0iRjQ13C;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.174, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71d5fb5e34cso4447897b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 16:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758668553; x=1759273353; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DqKGc8BZRDqiM5oz6DZM0Ipx40+Ny2Mrd050w098BFE=;
        b=0iRjQ13CWszCLd4ycNqEGSzC+pzpstf5abalODc6cRF7ZpuYrLjUwfrV9/aPg/G8JC
         CQRfhi1E65WYC41oEV7Qsr3TXXij0aPOdXIoz93x0MYec2znNKq5PSf2MJrkbnPoRx8n
         heJhCmYP9IgD2fezu2lZHm5KbXUyx0ETOPVbsMK5xwrf2blCv6iKYwCgxmA/tW/RjV/2
         LyW2JiLRQ6F9l/tZWoGa1o862e0/Fj0Qf9aRLU/izk4tzcFxBVImTYMesPHx4XVZCpOi
         ynSh/uqU1l/u7WU0jBWdbn0mBbm8hm/xWixI0bizba7KZ7MnALj0OyeOn3w6OazT5/U5
         yOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758668553; x=1759273353;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DqKGc8BZRDqiM5oz6DZM0Ipx40+Ny2Mrd050w098BFE=;
        b=c69PaMliVlAAN4GJgfs8fllgFxCxCCSjskuifhW45pixdkBPAr0veBsRzRGEBAzB9J
         EkvksmIcVbh+ljHLN2502fZpHOeo21ioWLt/A2ZpcgC7VaRa/FJh3GAA3y0dJcoXGjD3
         IVFpCzpHPy1i8tM2s8phX/7Aqeaxmk4Kn4P3fLyVUSlpyhyUU/r5urqODHbUMHAmpIuF
         Hz2OZjMQuL9fup9llIcuK5vbJVZSRILkKPiRwfSRHa09PbbEbXryiSEmVeyebPG7LiJH
         M89P8MEnAnR3V5DwW+tlEsUlvm/TlkrkZMa5FgWS4zB2JTFuUzjV/5jRMyb1buNK/H2E
         pCxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAbdlltn+4G+is7nPWPSKGcNnxgbzXNnaGRRZZD1PQxMF7KOSuWcCGUTusOjaHUIEH9xR7Z1devJpTZTILlSz41A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzb2/u04yshnqG+7Fl+biRaXMs85lTTNDZpOD7hFHdQsLRoKcKW
	isg7ckLAI8L5AhCjxnYAguHbbyxu2FWN+S4L3ZnNxUY29CSjocZCPS/Z54X8KnxAfxVtyMewZ8G
	JtxXkUuEwoORCujNGE7shauuhuiXb+68GiBckxw5KBQ==
X-Gm-Gg: ASbGnctpWqF/1vrVyzY50ArqjZSooXW/2k++0Azi2NdbtHz5HOBIm+lhGHX5R4aqTCR
	CFtBl3dm0zq+iDc5uQ0KPF5EBeTkVJv2PVqKOrzRYyUdlaSMfPkZrg2SeZ7sPx2ghDSFTm6R5AH
	7Qk2RaAMtBV2ti4YkDBVqB8qqyIJcFoWotjBFG2e1QS6afHor5SMShpdovF3anfGEgbDHdcuqe1
	4lg8AmkEhk8ry5PsW/4NKlL08JDbBcGMtsJi9Y=
X-Google-Smtp-Source: AGHT+IGtQeVWok3j41WpXN0ZZG9ClZCZxCqwdgjwnmNUNWE8ODtwo5fZqJjVzejagSJgUrxnhTPdm7Cc4pMaDgKbCeM=
X-Received: by 2002:a05:690c:3681:b0:73c:7776:ce29 with SMTP id
 00721157ae682-75f5c2e379emr3422587b3.10.1758668552467; Tue, 23 Sep 2025
 16:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250804164100.9355-1-peter.marko@siemens.com>
 <DB5PR02MB102136F23FE32048C946C6102EF1DA@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CAApg2=SX2-2FoL6F-v9d0DFBq-2FVzkH=y9paKWw6xM0reBF5w@mail.gmail.com> <DB5PR02MB10213C152DDB8B8A2820E46C2EF1DA@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213C152DDB8B8A2820E46C2EF1DA@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 23 Sep 2025 16:02:21 -0700
X-Gm-Features: AS18NWBuy0PjJdgUl8L3mBPDoctJHx-u0QlKRqATRHe2w5tcGj-c6hXbJ_hL-RQ
Message-ID: <CAOSpxdby0MKfFaFhrqMc5+0VsvM5WAM2jP7tf1x6wHEd0TLGNQ@mail.gmail.com>
Subject: Re: [OE-core][walnascar][PATCH] sqlite3: patch CVE-2025-6965
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Marta Rybczynska <rybczynska@gmail.com>, "Marko, Peter" <peter.marko@siemens.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005909da063f7feec9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 23:02:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223940

--0000000000005909da063f7feec9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025, 4:01=E2=80=AFPM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> Sure, but the patches should have been added to the master branch before
> being considered for the older branches. Because as it currently is, mast=
er
> lacks CVE fixes for sqlite3 that the older branches have.
>
>
>
My fault, I should have noticed this :-(

Steve





//Peter
>
>
>
> *From:* Marta Rybczynska <rybczynska@gmail.com>
> *Sent:* den 23 september 2025 20:49
> *To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> *Cc:* peter.marko@siemens.com; Steve Sakoman <steve@sakoman.com>;
> openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core][walnascar][PATCH] sqlite3: patch CVE-2025-6965
>
>
>
> In my opinion master should go to 3.50.4, there are other commits that
> look like potential vulnerabilities.
>
>
>
> M.
>
>
>
> On Tue, Sep 23, 2025 at 8:34=E2=80=AFPM Peter Kjellerstedt via
> lists.openembedded.org <peter.kjellerstedt=3Daxis.com@lists.openembedded.=
org>
> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> On Behalf Of Peter Marko via
> lists.openembedded.org
> > Sent: den 4 augusti 2025 18:41
> > To: openembedded-core@lists.openembedded.org
> > Cc: Peter Marko <peter.marko@siemens.com>
> > Subject: [OE-core][walnascar][PATCH] sqlite3: patch CVE-2025-6965
> >
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > Pick patch [1] mentioned in NVD report [2] from github mirror [3].
> >
> > [1]
> https://www.sqlite.org/src/info/5508b56fd24016c13981ec280ecdd833007c9d8dd=
595edb295b984c2b487b5c8
> > [2] https://nvd.nist.gov/vuln/detail/CVE-2025-6965
> > [3]
> https://github.com/sqlite/sqlite/commit/c52e9d97d485a3eb168e3f8f3674a7bc4=
b419703
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >  .../sqlite/sqlite3/CVE-2025-6965.patch        | 112 ++++++++++++++++++
> >  meta/recipes-support/sqlite/sqlite3_3.48.0.bb |   1 +
> >  2 files changed, 113 insertions(+)
> >  create mode 100644
> meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch
> >
>
> [cut]
>
> > diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
> b/meta/recipes-
> > support/sqlite/sqlite3_3.48.0.bb
> > index 11f103dddc..6c9f1ed5d9 100644
> > --- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
> > +++ b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
> > @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D
> > "file://sqlite3.h;endline=3D11;md5=3D786d3dc581eff03f4fd9e4a77ed0
> >  SRC_URI =3D "
> http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz \
> >      file://CVE-2025-3277.patch \
> >      file://CVE-2025-29088.patch \
> > +    file://CVE-2025-6965.patch \
> >  "
> >  SRC_URI[sha256sum] =3D
> "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
> >
>
> Why aren't these three patches on master? It still uses the same version
> of sqlite3 as Walnascar so they should be needed on master as well.
>
> In my opinion master should go to 3.50.4, there are other commits that
> look like potential vulnerabilities.
>
>
>
> M.
>

--0000000000005909da063f7feec9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 23, 2025, 4:01=E2=80=
=AFPM Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com"=
>peter.kjellerstedt@axis.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">





<div lang=3D"SV" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:break-wo=
rd">
<div class=3D"m_-3632555381065366125WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#943634">Sure, but the patches =
should have been added to the master branch before being considered for the=
 older branches. Because
 as it currently is, master lacks CVE fixes for sqlite3 that the older bran=
ches have.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#943634"><u></u>=C2=A0</span></=
p></div></div></blockquote></div></div><div dir=3D"auto">My fault, I should=
 have noticed this :-(</div><div dir=3D"auto"><br></div><div dir=3D"auto">S=
teve</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div lang=3D"SV" link=3D"blue" vlink=3D"purple" sty=
le=3D"word-wrap:break-word"><div class=3D"m_-3632555381065366125WordSection=
1"><p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif;color:#943634"><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#943634">//Peter<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#943634"><u></u>=C2=A0<u></u></=
span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> =
Marta Rybczynska &lt;<a href=3D"mailto:rybczynska@gmail.com" target=3D"_bla=
nk" rel=3D"noreferrer">rybczynska@gmail.com</a>&gt;
<br>
<b>Sent:</b> den 23 september 2025 20:49<br>
<b>To:</b> Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis=
.com" target=3D"_blank" rel=3D"noreferrer">peter.kjellerstedt@axis.com</a>&=
gt;<br>
<b>Cc:</b> <a href=3D"mailto:peter.marko@siemens.com" target=3D"_blank" rel=
=3D"noreferrer">peter.marko@siemens.com</a>; Steve Sakoman &lt;<a href=3D"m=
ailto:steve@sakoman.com" target=3D"_blank" rel=3D"noreferrer">steve@sakoman=
.com</a>&gt;; <a href=3D"mailto:openembedded-core@lists.openembedded.org" t=
arget=3D"_blank" rel=3D"noreferrer">openembedded-core@lists.openembedded.or=
g</a><br>
<b>Subject:</b> Re: [OE-core][walnascar][PATCH] sqlite3: patch CVE-2025-696=
5<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">In my opinion master should go to 3.50.4, there are =
other commits that look like potential vulnerabilities.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">M.<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Tue, Sep 23, 2025 at 8:34<span style=3D"font-fami=
ly:&quot;Arial&quot;,sans-serif">=E2=80=AF</span>PM Peter Kjellerstedt via
<a href=3D"http://lists.openembedded.org" target=3D"_blank" rel=3D"noreferr=
er">lists.openembedded.org</a> &lt;peter.kjellerstedt=3D<a href=3D"mailto:a=
xis.com@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">axis.c=
om@lists.openembedded.org</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">&gt; -----Original Me=
ssage-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank" rel=3D"noreferrer">
openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"mailto:openembe=
dded-core@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">open=
embedded-core@lists.openembedded.org</a>&gt; On Behalf Of Peter Marko via
<a href=3D"http://lists.openembedded.org" target=3D"_blank" rel=3D"noreferr=
er">lists.openembedded.org</a><br>
&gt; Sent: den 4 augusti 2025 18:41<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank" rel=3D"noreferrer">openembedded-core@lists.openembedded.org</a>=
<br>
&gt; Cc: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" target=
=3D"_blank" rel=3D"noreferrer">peter.marko@siemens.com</a>&gt;<br>
&gt; Subject: [OE-core][walnascar][PATCH] sqlite3: patch CVE-2025-6965<br>
&gt; <br>
&gt; From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" targe=
t=3D"_blank" rel=3D"noreferrer">peter.marko@siemens.com</a>&gt;<br>
&gt; <br>
&gt; Pick patch [1] mentioned in NVD report [2] from github mirror [3].<br>
&gt; <br>
&gt; [1] <a href=3D"https://www.sqlite.org/src/info/5508b56fd24016c13981ec2=
80ecdd833007c9d8dd595edb295b984c2b487b5c8" target=3D"_blank" rel=3D"norefer=
rer">
https://www.sqlite.org/src/info/5508b56fd24016c13981ec280ecdd833007c9d8dd59=
5edb295b984c2b487b5c8</a><br>
&gt; [2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2025-6965" target=
=3D"_blank" rel=3D"noreferrer">https://nvd.nist.gov/vuln/detail/CVE-2025-69=
65</a><br>
&gt; [3] <a href=3D"https://github.com/sqlite/sqlite/commit/c52e9d97d485a3e=
b168e3f8f3674a7bc4b419703" target=3D"_blank" rel=3D"noreferrer">
https://github.com/sqlite/sqlite/commit/c52e9d97d485a3eb168e3f8f3674a7bc4b4=
19703</a><br>
&gt; <br>
&gt; Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.c=
om" target=3D"_blank" rel=3D"noreferrer">peter.marko@siemens.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 .../sqlite/sqlite3/CVE-2025-6965.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 112 ++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.48.0.bb"=
 target=3D"_blank" rel=3D"noreferrer">sqlite3_3.48.0.bb</a> |=C2=A0 =C2=A01=
 +<br>
&gt;=C2=A0 2 files changed, 113 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-=
6965.patch<br>
&gt; <br>
<br>
[cut]<br>
<br>
&gt; diff --git a/meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.4=
8.0.bb" target=3D"_blank" rel=3D"noreferrer">sqlite3_3.48.0.bb</a> b/meta/r=
ecipes-<br>
&gt; support/sqlite/<a href=3D"http://sqlite3_3.48.0.bb" target=3D"_blank" =
rel=3D"noreferrer">sqlite3_3.48.0.bb</a><br>
&gt; index 11f103dddc..6c9f1ed5d9 100644<br>
&gt; --- a/meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.48.0.bb"=
 target=3D"_blank" rel=3D"noreferrer">sqlite3_3.48.0.bb</a><br>
&gt; +++ b/meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.48.0.bb"=
 target=3D"_blank" rel=3D"noreferrer">sqlite3_3.48.0.bb</a><br>
&gt; @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://sqlite3.h;endline=3D11;md5=3D786d3dc581eff03f4fd9e4a77ed0=
<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://www.sqlite.org/2025/sqlite-a=
utoconf-$%7BSQLITE_PV%7D.tar.gz" target=3D"_blank" rel=3D"noreferrer">http:=
//www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2025-3277.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2025-29088.patch \<br>
&gt; +=C2=A0 =C2=A0 file://CVE-2025-6965.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;ac992f7fca3989de7ed1fe99c16363f8487=
94c8c32a158dafd4eb927a2e02fd5&quot;<br>
&gt; <br>
<br>
Why aren&#39;t these three patches on master? It still uses the same versio=
n <br>
of sqlite3 as Walnascar so they should be needed on master as well.<u></u><=
u></u></p>
</blockquote>
<div>
<div>
<p class=3D"MsoNormal">In my opinion master should go to 3.50.4, there are =
other commits that look like potential vulnerabilities.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">M.<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</blockquote></div></div></div>

--0000000000005909da063f7feec9--

