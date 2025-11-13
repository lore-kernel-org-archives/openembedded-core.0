Return-Path: <andreas.stergiopoulos@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A27E5CD8CAC
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 17:00:37 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1013.1763053236485118922
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 09:00:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zMT4nDUu;
 spf=pass (domain: smile.fr, ip: 209.85.218.46, mailfrom: andreas.stergiopoulos@smile.fr)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b7346565d7cso146951666b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 09:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763053235; x=1763658035; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NOs7eNog1Jip0TPjuxMik/uAeqoIeDilsxSQNJU+N7A=;
        b=zMT4nDUuf7bXOWABkL370XjJNL6fnO2WT6fg8zfGs65d826EeqR4NLPNimy6OmFGyB
         qDWNXRmH0MSPz90hZh0yd1EiM68akWI+1k65oWZXNocljeBQICZsTTQU0a3KANvGlAXP
         rnC78CJ0nhfAuLOgdRm6wNH3eZsIGZKhlKHoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763053235; x=1763658035;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOs7eNog1Jip0TPjuxMik/uAeqoIeDilsxSQNJU+N7A=;
        b=jl4BuqAPxbTeLUc/kpZF39DYcGysO6jfyvgJlZ8M5kD1rzOXYZ/7ALHTwPIpD72MLR
         m//ZNXaXMxKWQr2uLjUa5bHCLn4CWpUXaEQ6BhyB7S2dzw4BPq03ZcxWu/lroadTHx0n
         lPGaZjBpiRiZ4YVPjZFlbpnpqWFWi3F+xZaUv4j9/O0M+yKr/qw6gWRCa6Mc57o4Kfku
         hBDpawkXLNbmHDRRwBOYe+r6xMRzTcaTMOWoVlK9+lLJhogjeXOR6s45459n8xpt7ywD
         HI1wiawm18kOlcZqp/RUesxQ+thd8Iq5YQPlg2RX4cQp2qcmlHVuueTYDD2g/kjZbwuC
         jHGw==
X-Gm-Message-State: AOJu0YybrNzZtbC0AehVMTPWXzJ4ope8GUcwjoiDOpuD2cISFK+Ac8QI
	XfUruAZqiHWLelkhhHbiYA1H2RmPvRhD3HVIjm3w7Dp9pfdvtSrOOqglr1UQYGyQfFOC/G3db9l
	yJj1NetdvKz8GFgpJrkUrW1uhsmCA4GiOGPSoxU/1Ig==
X-Gm-Gg: ASbGnctSIZdp7dj2GmIlgr6/cEmYzEKdiizGwUFI0d4L4t5wzc4zasiyiPUDYjI0M2m
	nN09dLUf6YHC/DtqMLDBrT71Kf/aMxjejVBJ+MH5/onEH+Xq5OsuxzcfyilXpCE1imjkYrhYDW2
	YmpU+gtVv08vYhWBMR1mLCT3dWl10ZI53JGTvT918AczXnb7Nsgbw6LRRfrgQT9GckHnr+I9g8i
	/WlBMKH33g5btwoiDbq9NM9vUHaWhGQApDKKa8yg/uW47wqeOuHUHSvU+cBrw4=
X-Google-Smtp-Source: AGHT+IFuLh85fGHVrwFZswazr1w8damSR30HTFxT4cFLIW0vmFmx7tTFl9THb8IM9Fc3Fw81FWFu1tVzlZte6SWbocY=
X-Received: by 2002:a17:907:9713:b0:b73:4bc3:dfc2 with SMTP id
 a640c23a62f3a-b734bc3e4e7mr281811366b.8.1763053234566; Thu, 13 Nov 2025
 09:00:34 -0800 (PST)
MIME-Version: 1.0
References: <20251112155730.646159-1-andreas.stergiopoulos@smile.fr>
 <20251112155730.646159-4-andreas.stergiopoulos@smile.fr> <DE7PKZ44N6OD.2PE268VIQ6BX6@bootlin.com>
In-Reply-To: <DE7PKZ44N6OD.2PE268VIQ6BX6@bootlin.com>
From: Andreas STERGIOPOULOS <andreas.stergiopoulos@smile.fr>
Date: Thu, 13 Nov 2025 18:00:23 +0100
X-Gm-Features: AWmQ_bkFAfExOkOOM5Px9xAjB6oStFgkMXXJIMvMj1HWlLXAzs7HToCBGTkbzCQ
Message-ID: <CAC7iNsJbsY6Xxp63Ume-16LjW_A3Fjf+-kRM4q0yYhsfBWVv+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] ptest-cargo.bbclass: Add support for
 CARGO_BIN_EXE_<name> environment variables
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, yoann.congal@smile.fr
Content-Type: multipart/alternative; boundary="000000000000c44fa506437cd11e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 17:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226254

--000000000000c44fa506437cd11e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Mathieu,

Thank you for reporting this. I'm looking into it.

Best regards,
Andreas

On Thu, Nov 13, 2025 at 5:31=E2=80=AFPM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Wed Nov 12, 2025 at 4:57 PM CET, Andreas Stergiopoulos via
> lists.openembedded.org wrote:
> > This commit takes the installation paths collected during package
> installation and
> > sets them up as environment variables in the run-ptest script. This is
> necessary as
> > the integration tests require the executable binary to run successfully=
.
> >
> > The paths collected are not those of the artifacts created during cargo
> test, but the
> > paths where the artifacts in the system. The intention for this choice
> was to ensure
> > that the tested binaries are those who are actually executed by the use=
r
> and vice
> > versa.
> >
> > Env has been used instead of export, as export explicitly does not
> support dashes "-"
> > when setting up environment variables. The execution environment is set
> up inside the
> > function exec_in_env. For every binary executable artifact collected,
> one environment
> > variable is added irregardles of whether it is needed or not.
> >
> > Signed-off-by: Andreas Stergiopoulos <andreas.stergiopoulos@smile.fr>
> > ---
>
> Hi Andreas,
>
> Thanks for your patch.
>
> It looks like this is breaking some ptests:
>
> AssertionError:
> Failed ptests:
> {'rpm-sequoia': ['/usr/lib/rpm-sequoia/ptest/symbols-4b3369365cdc8879']}
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2612
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/732
>
> Ptest logs can be found here:
>
>
> https://valkyrie.yocto.io/pub/non-release/20251113-72/testresults/qemux86=
-64-ptest/core-image-ptest-rpm-sequoia/
>
> https://valkyrie.yocto.io/pub/non-release/20251113-72/testresults/qemuris=
cv64-ptest/core-image-ptest-rpm-sequoia/
>
> Can you have a look at these?
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--=20
[image: SMILE] <http://www.smile.eu/>

163 Quai du Docteur Dervaux
CS 60059
92665 Asni=C3=A8res Sur Seine Cedex
*Andreas STERGIOPOULOS*
Ing=C3=A9nieur Etude et D=C3=A9veloppement 1

[image: email] andreas.stergiopoulos@smile.fr
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>


[image: eco] Pour la plan=C3=A8te, n'imprimez ce mail que si c'est n=C3=A9c=
essaire

--000000000000c44fa506437cd11e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Mathieu,</div><div><br></div><div>Thank you for=
 reporting this. I&#39;m looking into it.</div><div><br></div><div>Best reg=
ards,</div><div>Andreas</div></div><br><div class=3D"gmail_quote gmail_quot=
e_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 13, 2025 at =
5:31=E2=80=AFPM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-=
briand@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed Nov 12, 2025 at=
 4:57 PM CET, Andreas Stergiopoulos via <a href=3D"http://lists.openembedde=
d.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrot=
e:<br>
&gt; This commit takes the installation paths collected during package inst=
allation and<br>
&gt; sets them up as environment variables in the run-ptest script. This is=
 necessary as<br>
&gt; the integration tests require the executable binary to run successfull=
y.<br>
&gt;<br>
&gt; The paths collected are not those of the artifacts created during carg=
o test, but the<br>
&gt; paths where the artifacts in the system. The intention for this choice=
 was to ensure<br>
&gt; that the tested binaries are those who are actually executed by the us=
er and vice<br>
&gt; versa.<br>
&gt;<br>
&gt; Env has been used instead of export, as export explicitly does not sup=
port dashes &quot;-&quot;<br>
&gt; when setting up environment variables. The execution environment is se=
t up inside the<br>
&gt; function exec_in_env. For every binary executable artifact collected, =
one environment<br>
&gt; variable is added irregardles of whether it is needed or not.<br>
&gt;<br>
&gt; Signed-off-by: Andreas Stergiopoulos &lt;<a href=3D"mailto:andreas.ste=
rgiopoulos@smile.fr" target=3D"_blank">andreas.stergiopoulos@smile.fr</a>&g=
t;<br>
&gt; ---<br>
<br>
Hi Andreas,<br>
<br>
Thanks for your patch.<br>
<br>
It looks like this is breaking some ptests:<br>
<br>
AssertionError:<br>
Failed ptests:<br>
{&#39;rpm-sequoia&#39;: [&#39;/usr/lib/rpm-sequoia/ptest/symbols-4b3369365c=
dc8879&#39;]}<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/buil=
ds/2612" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/73/builds/2612</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/buil=
ds/732" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/56/builds/732</a><br>
<br>
Ptest logs can be found here:<br>
<br>
<a href=3D"https://valkyrie.yocto.io/pub/non-release/20251113-72/testresult=
s/qemux86-64-ptest/core-image-ptest-rpm-sequoia/" rel=3D"noreferrer" target=
=3D"_blank">https://valkyrie.yocto.io/pub/non-release/20251113-72/testresul=
ts/qemux86-64-ptest/core-image-ptest-rpm-sequoia/</a><br>
<a href=3D"https://valkyrie.yocto.io/pub/non-release/20251113-72/testresult=
s/qemuriscv64-ptest/core-image-ptest-rpm-sequoia/" rel=3D"noreferrer" targe=
t=3D"_blank">https://valkyrie.yocto.io/pub/non-release/20251113-72/testresu=
lts/qemuriscv64-ptest/core-image-ptest-rpm-sequoia/</a><br>
<br>
Can you have a look at these?<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular"><table style=3D"padding:20px=
" border=3D"0"><tbody><tr><td style=3D"font-size:13px;color:rgb(255,128,84)=
;text-align:center;padding-right:30px"><a href=3D"http://www.smile.eu/" tar=
get=3D"_blank">
                    <img style=3D"max-width: 100%; height: auto;" src=3D"ht=
tp://ftp.smile.fr/client/Communication/signature/img/Logo-new.png" alt=3D"S=
MILE">
                </a><br><br>
                    <p style=3D"line-height:15px">163 Quai du Docteur Derva=
ux<br>
CS 60059<br>
92665 Asni=C3=A8res Sur Seine Cedex</p>
            </td>
            <td style=3D"border-left:1px solid rgb(59,127,254);padding-left=
:20px;font-size:13px;color:rgb(255,128,84)">
                <div style=3D"color:rgb(255,128,84);font-size:14px">
                    <b>Andreas STERGIOPOULOS</b>
                </div>
                <div style=3D"color:rgb(59,127,254);font-size:13px">
                    Ing=C3=A9nieur Etude et D=C3=A9veloppement 1<br>
                   =20
                </div><br>
                <div style=3D"color:rgb(59,127,254);font-size:13px">
                    <span style=3D"white-space:nowrap"><img style=3D"margin=
-right: 5px;" src=3D"http://ftp.smile.fr/client/Communication/signature/img=
/mail.png" alt=3D"email" width=3D"12" height=3D"10">
                        <a href=3D"mailto:andreas.stergiopoulos@smile.fr" s=
tyle=3D"color:rgb(59,127,254);font-size:13px;text-decoration:none" target=
=3D"_blank">andreas.stergiopoulos@smile.fr</a>
                    </span>
                     <br>
                                                    <span style=3D"white-sp=
ace:nowrap"><img style=3D"margin-right: 5px;" src=3D"http://ftp.smile.fr/cl=
ient/Communication/signature/img/web.png" alt=3D"url" width=3D"12" height=
=3D"12">
<a href=3D"http://www.smile.eu" style=3D"color:rgb(59,127,254);font-size:13=
px;text-decoration:none" target=3D"_blank">http://www.smile.eu</a> =20
                  </span>
                                </div>

                <br>
                <div>
                    <span><a style=3D"margin-right:5px" href=3D"https://twi=
tter.com/GroupeSmile" target=3D"_blank"><img src=3D"http://ftp.smile.fr/cli=
ent/Communication/signature/img/rs-twitter.png" alt=3D"Twitter" style=3D"ma=
x-width: 100%; height: auto;"></a></span>
                    <span><a style=3D"margin-right:5px" href=3D"https://www=
.linkedin.com/company/smile" target=3D"_blank"><img src=3D"http://ftp.smile=
.fr/client/Communication/signature/img/rs-linkedin.png" alt=3D"LinkedIn" st=
yle=3D"max-width: 100%; height: auto;"></a></span>
                    <span><a style=3D"margin-right:5px" href=3D"https://git=
hub.com/Smile-SA" target=3D"_blank"><img src=3D"http://ftp.smile.fr/client/=
Communication/signature/img/rs-github.png" alt=3D"Github" style=3D"max-widt=
h: 100%; height: auto;"></a></span>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
    <br>
    <div></div>
    <br>
    <div style=3D"color:rgb(163,172,181);font-size:10px">
        <img src=3D"http://ftp.smile.fr/client/Communication/signature/img/=
eco.png" alt=3D"eco" width=3D"13" height=3D"11">
            Pour la plan=C3=A8te, n&#39;imprimez ce mail que si c&#39;est n=
=C3=A9cessaire
    </div></font><br></div></div>

--000000000000c44fa506437cd11e--

