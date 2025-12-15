Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7D6D5B843
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 15:40:06 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51861.1765813197567942325
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 07:39:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZGDgTaly;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: adam.blank.g@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-3f5c9275b31so2201728fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 07:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765813197; x=1766417997; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IAyINLwh0wqMjddEak96KoyaoFUzl7Jwv37xjdm6mmk=;
        b=ZGDgTaly/diK9EYQ48bEMjpV+36WExcirbxEEZHQLTdt/QNnBVEcakArc45QSm4p87
         q+dydMRgEBeJ/aV3Zr0prlET1wOucTyy7CBNdEuUQt5nxd/2Rb/ZwOqGe4I/f5FO8LEd
         pO6dzIR7tN5B5ZKw1wxbrNQJNiDWTx3Jsb3n31d3j6XoiLS7swdI8bc/vpA7XPO1RA1O
         GPtMjACOW8UkcPXgGNxsrYQzAqbuki630nZ3YsWeuB3rH0yqigK55WWzbKcYXkZKk/m4
         qduMzrmaNxfHI3jJ/nnXKb4aDMlNgmHtU+Oi4DeiguemmRq61q+vIzvOLAJ+otHSV12C
         C9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765813197; x=1766417997;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAyINLwh0wqMjddEak96KoyaoFUzl7Jwv37xjdm6mmk=;
        b=Ev24MIhFgJTZUoL1btIInp810yFmNDLglK7q2YkUD4LdXblJ0qm6ePkXktMA11XBqn
         OymVAti2wPMFD6hW66V25PrG+ZiDxYbOwk8nWC5gs2BPgeRGkXObroYH0atG5scmeCnx
         3Camv/1S13DBbkO3bd8GzOuTReHewXiklAcaGREvDmo5Uet6ckyq1aOXXnP6Q5s98i/l
         d08aLaD5O+TYv10qoqrAEQoHepKXeFWwGWuCInCvEQo3FwgiaGqU9wZfAlhZT3o+bwos
         hmJZkAzMp0s4irOyljsr3aD98bgeaRTsqtyfjssCGZOifL70+ijUplWR+ayCCXiFU09T
         9A3g==
X-Gm-Message-State: AOJu0Yy2fZYhc3hX5Z+rYGSAaEkSAjKKHDHXI1bQSICv9BG3SIsm5yzL
	+uqRZriZWQ73llk2U/zpmeVzAvwCLb5W6XczsTO5/Cjm0xFy9Pdfc+494gkTp3Y3cGumw3Hye4r
	AOvqxYuGnJvkrCtLAD0NNfYa510XBnYwpQQ==
X-Gm-Gg: AY/fxX7Cz+Oqz1cPcfy1KOQf/PcIPh0e045w1d5CfhceaUH6ONpjmAH8zsj/x3/7YoL
	U1hhg337TTQ4qS1OXVN+x5OztVM+aV6WS9ARTSVrt+J1ak+GrcbHLbltyeFzqgwI/tbEmH5/rJw
	soh0EXViBBN3D02NZAVtLCs3oR0UDTUTaxlebT/+52EWlsWsfHidZO4bPNPBfbuPAQ32GT+ZJCq
	nipM8vN1ovxclo2zN7UliXdVF+jJWc20HS5ZvdZv7KiAOz4gh6e03ryaFEdKyjYKOjmoh2wfJ3z
	M30TjA2ypG9KLQW/uMEZQxKGs/qf
X-Google-Smtp-Source: AGHT+IFFEbJzFF7K0G1jzWYDFUEIwA1pkJ3Vx/TJ/Vfw25d6Rnd2u1i2dTp7/YrAczVOGbXYM/ByccjWxUhfm4GpUJE=
X-Received: by 2002:a05:6820:138e:b0:654:faee:1065 with SMTP id
 006d021491bc7-65b45168513mr5138319eaf.5.1765813196483; Mon, 15 Dec 2025
 07:39:56 -0800 (PST)
MIME-Version: 1.0
References: <CAFAffzy_4x6VYuFvjqavkhZ746xKaRC6Yf1fZ=Lkrv2bvQP=XA@mail.gmail.com>
 <f8bab7af-8c4a-449a-b53d-b35433010b15@kernel.crashing.org>
In-Reply-To: <f8bab7af-8c4a-449a-b53d-b35433010b15@kernel.crashing.org>
From: Adam Blank <adam.blank.g@gmail.com>
Date: Mon, 15 Dec 2025 16:39:45 +0100
X-Gm-Features: AQt7F2rbz8QrGsqnzs-KUBmDbScnedYy88swrdMdBMmPwqLWgjQ1Eca_EwzkkLQ
Message-ID: <CAFAffzwoRz_BC2mYvbqd8yzV2McjOjm9q_dmP0PK2fUWimD5fQ@mail.gmail.com>
Subject: Re: [Openembedded-architecture] [RFC] RPROVIDES and buildhistory
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000050f06c0645ff6cb9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 15:40:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227742

--00000000000050f06c0645ff6cb9
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Dec 2025, 15:57 Mark Hatle, <mark.hatle@kernel.crashing.org>
wrote:

>
>
> On 12/14/25 11:56 AM, Adam Blank via lists.openembedded.org wrote:
> > I've recently come across a problem, which has apparently been around
> for a long
> > time, and yet has somehow remained unnoticed.
> >
> > Facts:
> > - bash and busybox recipes conditionally (based on usrmerge in the
> > DISTRO_FEATURES) declare some RPROVIDES
> > - what they declare in RPROVIDES are actually file paths - e.g.
> '/bin/sh',
> > '/bin/ash' or '/bin/bash'
> > - resulting entries in their packagedata are "correct" - i.e. 'RPROVIDES
> =
> > /bin/sh /bin/bash'
> > - resulting entries in their buildhistory are mangled - i.e. 'RPROVIDES
> = bib
> > bin bash sh'
> >
> > Thesis:
> > - such entries in RPROVIDES (or any other package namespace related
> variable)
> > are an error (at least looking at what insane.bbclass deems an
> acceptable
> > package name)
> > - buildhistory should be consistent in its processing of package names
> with
> > packagedata
> >
> > I'd like to ask for your comments as to what would be the best way to
> approach
> > this. My view would be to fix the recipes, the buildhistory.bbclass but
> also
> > make sure that all package related variables are guarded in equal degree
> in all
> > relevant stages (e.g. in the insane.bbclass).
>
> I don't believe this is an error.  When packages are processed, any
> scripts are
> evaluated to determine what they require to be run.
>

Thanks. And what's your view on the difference in behaviour between
buildhistory and packagedata?


> A LARGE number of package have:
>
> #! /bin/bash
> #! /bin/sh
>
> and other values, which are inserted into the RDEPENDS for that
> file/package.
>
> Normally these values are resolved by the package manager to the list of
> files
> installed.  Something installs /bin/bash, so it must then provide
> /bin/bash.
>
> HOWEVER, there are two cases where this is not true.  The first is with
> "update
> alternatives", /bin/sh for instance isn't supplied directly, but bash (and
> other
> posix shells) can be listed as the 'alternative' for /bin/sh.  So
> something in
> the system says "I supply /bin/sh, even though I don't actually have the
> _file_
> /bin/sh."  (This is usually the ash package BTW.)
>
> The second case is the one you are asking about, usrmerge.  In the case of
> usrmerge, the files live in /usr/bin, not /bin.  So the package manager
> has no
> way to know that '/usr/bin/sh' satisfies '/bin/sh'.  So we require a
> manual
> RPROVIDE for this case.
>
> (/usr/bin/env is another common RDEPENDS.  So even if usrmerge were
> reversed,
> all of the file installed into /bin and /sbin, instead of /usr/bin and
> /usr/sbin
> the same issue would be occurring.)
>
> > Thanks,
> > Adam
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#2210):
> https://lists.openembedded.org/g/openembedded-architecture/message/2210
> > Mute This Topic: https://lists.openembedded.org/mt/116779688/3616948
> > Group Owner: openembedded-architecture+owner@lists.openembedded.org
> > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-architecture/unsub [
> mark.hatle@kernel.crashing.org]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--00000000000050f06c0645ff6cb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_quote gmail_quote_container"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 15 Dec 2025, 15:57 Mark Hatl=
e, &lt;<a href=3D"mailto:mark.hatle@kernel.crashing.org">mark.hatle@kernel.=
crashing.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 12/14/25 11:56 AM, Adam Blank via <a href=3D"http://lists.openembedded.o=
rg" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.openembedded.org<=
/a> wrote:<br>
&gt; I&#39;ve recently come across a problem, which has apparently been aro=
und for a long <br>
&gt; time, and yet has somehow remained unnoticed.<br>
&gt; <br>
&gt; Facts:<br>
&gt; - bash and busybox recipes conditionally (based on usrmerge in the <br=
>
&gt; DISTRO_FEATURES) declare some RPROVIDES<br>
&gt; - what they declare in RPROVIDES are actually file paths - e.g. &#39;/=
bin/sh&#39;, <br>
&gt; &#39;/bin/ash&#39; or &#39;/bin/bash&#39;<br>
&gt; - resulting entries in their packagedata are &quot;correct&quot; - i.e=
. &#39;RPROVIDES =3D <br>
&gt; /bin/sh /bin/bash&#39;<br>
&gt; - resulting entries in their buildhistory are mangled - i.e. &#39;RPRO=
VIDES =3D bib <br>
&gt; bin bash sh&#39;<br>
&gt; <br>
&gt; Thesis:<br>
&gt; - such entries in RPROVIDES (or any other package namespace related va=
riable) <br>
&gt; are an error (at least looking at what insane.bbclass deems an accepta=
ble <br>
&gt; package name)<br>
&gt; - buildhistory should be consistent in its processing of package names=
 with <br>
&gt; packagedata<br>
&gt; <br>
&gt; I&#39;d like to ask for your comments as to what would be the best way=
 to approach <br>
&gt; this. My view would be to fix the recipes, the buildhistory.bbclass bu=
t also <br>
&gt; make sure that all package related variables are guarded in equal degr=
ee in all <br>
&gt; relevant stages (e.g. in the insane.bbclass).<br>
<br>
I don&#39;t believe this is an error.=C2=A0 When packages are processed, an=
y scripts are <br>
evaluated to determine what they require to be run.<br></blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks. And what&#39;s y=
our view on the difference in behaviour between buildhistory and packagedat=
a?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_q=
uote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
A LARGE number of package have:<br>
<br>
#! /bin/bash<br>
#! /bin/sh<br>
<br>
and other values, which are inserted into the RDEPENDS for that file/packag=
e.<br>
<br>
Normally these values are resolved by the package manager to the list of fi=
les <br>
installed.=C2=A0 Something installs /bin/bash, so it must then provide /bin=
/bash.<br>
<br>
HOWEVER, there are two cases where this is not true.=C2=A0 The first is wit=
h &quot;update <br>
alternatives&quot;, /bin/sh for instance isn&#39;t supplied directly, but b=
ash (and other <br>
posix shells) can be listed as the &#39;alternative&#39; for /bin/sh.=C2=A0=
 So something in <br>
the system says &quot;I supply /bin/sh, even though I don&#39;t actually ha=
ve the _file_ <br>
/bin/sh.&quot;=C2=A0 (This is usually the ash package BTW.)<br>
<br>
The second case is the one you are asking about, usrmerge.=C2=A0 In the cas=
e of <br>
usrmerge, the files live in /usr/bin, not /bin.=C2=A0 So the package manage=
r has no <br>
way to know that &#39;/usr/bin/sh&#39; satisfies &#39;/bin/sh&#39;.=C2=A0 S=
o we require a manual <br>
RPROVIDE for this case.<br>
<br>
(/usr/bin/env is another common RDEPENDS.=C2=A0 So even if usrmerge were re=
versed, <br>
all of the file installed into /bin and /sbin, instead of /usr/bin and /usr=
/sbin <br>
the same issue would be occurring.)<br>
<br>
&gt; Thanks,<br>
&gt; Adam<br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#2210): <a href=3D"https://lists.openembedded.org/g=
/openembedded-architecture/message/2210" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">https://lists.openembedded.org/g/openembedded-architecture/me=
ssage/2210</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11677968=
8/3616948" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/116779688/3616948</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-architecture%2Bowner@lists=
.openembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-archit=
ecture+owner@lists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
architecture/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-architecture/unsub</a> [<a href=3D"m=
ailto:mark.hatle@kernel.crashing.org" target=3D"_blank" rel=3D"noreferrer">=
mark.hatle@kernel.crashing.org</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div></div>

--00000000000050f06c0645ff6cb9--

