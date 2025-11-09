Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD73CCFA1A
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:16:07 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27614.1762704959024459367
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:15:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jsJV4OQE;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: liu.ming50@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-297e264528aso11098615ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Nov 2025 08:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704958; x=1763309758; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NbNfSa+weCB+SgPa4nBs+ZEX6UurnR/S3GgPgh5p6sU=;
        b=jsJV4OQErtFlMoioeRK5QnqD3p4/vvjnlhRqfTPgoYjwfPIHC493Mas9iUuESCxjfL
         TLvdmcZ8yI3dten6F+HttPwkUXNgqaYXq1g5MOXP0qikOKP6YY545fNg3AQV93TWpR7M
         KVYkCIMYVEmYLT9jdSVDl22To4Zxftw3UQeVYy5VZqcyVAqaKG+7P0BiOyhlBZgN1Vdv
         easoJxpYfh19wxLB3HmGQu3pI1pFnEtVL0yC2qGWnasi67i0VeZZGC/c6pLk/Jca2RhZ
         Ms0lq79hpiPHGrbtwe8YqrmxoMfpe3gMS8Kz8sslvbeWxxJU/urdd0pUNs/PkZyV5J9J
         Z5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704958; x=1763309758;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbNfSa+weCB+SgPa4nBs+ZEX6UurnR/S3GgPgh5p6sU=;
        b=ww7dLcfRCsp3QSAPyAmEqMNRMZqX8HUnjxlJjDJjhBUuhhjVqRmZgWt8QPiSRgr1w8
         PpjLH3D7lMtwSgtvAWLjauEh/pm441iOj2tl90nHGukx2MNGYWmdRB/Ld00yacd4RNGY
         R/HW9eOH3A7fO1ktaqiOzSU0NX3ReQKsEjFjC0JlUrTXYnqDtZ3m4+L1wGyPN9swvMDR
         5/8sn7aLdmNuxrkYProu5igEF5O1kIin1Mqp+GIrzizQckg2J3NZXYfPQf9pvyhFXVva
         ILfZ+zVr3G/Gl1XzDQJxT7ELjFJKuKDh6KHEix+/tyO3zMfUcOmgzu24jmm8Q4LqdPdd
         LEcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpB3g3K72BEF9uELnF4a32Qp5//ixagyQUguAbDN3qLQ863cgkF7KpnwEYNajhUwXSUcpbcEstnxF58BTmjHFHNQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxRO6cks0QmErxSL7viLdZA9pXHKaB/PAV3Lxr5wEi08A0Pron9
	tbKpqDGcU9AL4dxu9UBL7kYOnPN0snqCpRmjCHCsNPlu3n6QQucNuzYY8jaV3gfAc4fHQyrvdKZ
	nNFSbE7Ml5gGTYRlg6mVVb36DEJZGiVc=
X-Gm-Gg: ASbGnctvl44IksTco+Kg47E17wDPxn11e99RWt5yoD51t3vfR3D0Eg8wSogn+w6BKjK
	8sqvB8+ZKj6iRBbd87h72N0x9DcxwpKu64eVY+2bAdvIDqCAq5cmYMU8x/O9g8EHTO3qVO9QQ2l
	LO3a3yxomHYrYJFQXjJZ6YvuZX3Tml7/HKCvXhDpkZsJKehQ8SnWKxb8c4TGBvtJZUdWpJkQk6D
	/zdeMpk41rCRySe2u2Hu5WzsaUTroi+pfcy/Jsy7hkZXELe8IiiatCT08YdTy4szYnPTvctgKj4
	eKLgC1sLOC9VkI5xTmo=
X-Google-Smtp-Source: AGHT+IFSAitWWXybeqpdEE5kTQBWnTjYio5Np2oH9cOWcPJB2sCM8cLdZpCX6KuTp4bjPiytGMgs81lmV583z9pfbY4=
X-Received: by 2002:a17:902:e552:b0:295:7b85:2f5f with SMTP id
 d9443c01a7336-297e56d8abamr72416675ad.31.1762704958278; Sun, 09 Nov 2025
 08:15:58 -0800 (PST)
MIME-Version: 1.0
References: <20251108113710.23299-1-liu.ming50@gmail.com> <DE3D91UDJETW.1GCQINSH3TU1E@bootlin.com>
 <DB5PR02MB10213441EEB2CA76CF300E623EFC0A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213441EEB2CA76CF300E623EFC0A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Sun, 9 Nov 2025 17:15:47 +0100
X-Gm-Features: AWmQ_blJ4x5CQTVDITbeAYHCeXGGNC0eJ425gWvTYeTeb00WF1Y5TKB8fcSdt50
Message-ID: <CALatG=6ydgMjzjFfFmSewqKk0fHtBCsBbvn0mKtC8S3qHfttPw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bash-completion.bbclass: put bash-completion
 package to PACKAGE_BEFORE_PN
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e1cfe206432bbab9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Nov 2025 16:16:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226097

--000000000000e1cfe206432bbab9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Peter:

Thanks for the review, you are right, I will send a V2!

//Ming Liu

Peter Kjellerstedt <peter.kjellerstedt@axis.com> =E6=96=BC 2025=E5=B9=B411=
=E6=9C=888=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=885:32=E5=AF=AB=E9=
=81=93=EF=BC=9A

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> On Behalf Of Mathieu
> Dubois-Briand via lists.openembedded.org
> > Sent: den 8 november 2025 15:01
> > To: liu.ming50@gmail.com; openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] bash-completion.bbclass: put
> bash-completion package to PACKAGE_BEFORE_PN
> >
> > On Sat Nov 8, 2025 at 12:37 PM CET, Ming Liu via lists.openembedded.org
> wrote:
> > > It was observed when FILES:${PN} contains "${sysconfdir}" or
> > > "${datadir}", the bash-completion files wont be installed to
> > > bash-completion package.
> > >
> > > Fix it by putting bash-completion package to PACKAGE_BEFORE_PN, this
> > > ensures bash-completion package get the files packaged before PN.
> > >
> > > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > > ---
> >
> > Hi Ming,
> >
> > Thanks for your patch.
> >
> > It looks like this is breaking some builds:
> >
> > ERROR: iproute2-6.17.0-r0 do_package: QA Issue: iproute2:
> > Files/directories were installed but not shipped in any package:
> >   /usr/share
> >   /usr/share/bash-completion
> >   /usr/share/bash-completion/completions
> >   /usr/share/bash-completion/completions/tc
> >   /usr/share/bash-completion/completions/devlink
> > ...
> > ERROR: systemd-1_258.1-r0 do_package: QA Issue: systemd:
> Files/directories
> > were installed but not shipped in any package:
> >   /usr/share/bash-completion/completions/userdbctl
> >   /usr/share/bash-completion/completions/systemd-id128
> >   /usr/share/bash-completion/completions/bootctl
> >   /usr/share/bash-completion/completions/systemd-run
> >   /usr/share/bash-completion/completions/localectl
> >   /usr/share/bash-completion/completions/journalctl
> >   /usr/share/bash-completion/completions/systemd-cgtop
> >   /usr/share/bash-completion/completions/systemd-nspawn
> >   /usr/share/bash-completion/completions/systemd-creds
> >   /usr/share/bash-completion/completions/systemctl
> >   /usr/share/bash-completion/completions/systemd-dissect
> >   /usr/share/bash-completion/completions/resolvectl
> >   /usr/share/bash-completion/completions/machinectl
> >   /usr/share/bash-completion/completions/systemd-delta
> >   /usr/share/bash-completion/completions/systemd-path
> >   /usr/share/bash-completion/completions/systemd-analyze
> >   /usr/share/bash-completion/completions/loginctl
> >   /usr/share/bash-completion/completions/busctl
> >   /usr/share/bash-completion/completions/networkctl
> >   /usr/share/bash-completion/completions/hostnamectl
> >   /usr/share/bash-completion/completions/systemd-cgls
> >   /usr/share/bash-completion/completions/kernel-install
> >   /usr/share/bash-completion/completions/systemd-cat
> >   /usr/share/bash-completion/completions/systemd-vpick
> >   /usr/share/bash-completion/completions/timedatectl
> >   /usr/share/bash-completion/completions/systemd-resolve
> >   /usr/share/bash-completion/completions/systemd-detect-virt
> >   /usr/share/bash-completion/completions/run0
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2669
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/2667
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/65/builds/2687
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/2679
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/78/builds/2722
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/99/builds/2684
> >
> > Can you fix this issue?
> >
> > Thanks,
> > Mathieu
>
> It is common for recipes to assign to PACKAGE_BEFORE_PN using the =3D
> operator, and typically after having done the inherits. You will have
> to use PACKAGE_BEFORE_PN:append. Actually, you may as well use
> PACKAGES:prepend instead.
>
> //Peter
>
>

--000000000000e1cfe206432bbab9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Peter:<div><br></div><div>Thanks for the review, you a=
re right, I will send a V2!</div><div><br></div><div>//Ming Liu</div></div>=
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt=
@axis.com">peter.kjellerstedt@axis.com</a>&gt; =E6=96=BC 2025=E5=B9=B411=E6=
=9C=888=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=885:32=E5=AF=AB=E9=81=
=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt=
; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"m=
ailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembed=
ded-core@lists.openembedded.org</a>&gt; On Behalf Of Mathieu Dubois-Briand =
via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"=
_blank">lists.openembedded.org</a><br>
&gt; Sent: den 8 november 2025 15:01<br>
&gt; To: <a href=3D"mailto:liu.ming50@gmail.com" target=3D"_blank">liu.ming=
50@gmail.com</a>; <a href=3D"mailto:openembedded-core@lists.openembedded.or=
g" target=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: Re: [OE-core] [PATCH] bash-completion.bbclass: put bash-compl=
etion package to PACKAGE_BEFORE_PN<br>
&gt; <br>
&gt; On Sat Nov 8, 2025 at 12:37 PM CET, Ming Liu via <a href=3D"http://lis=
ts.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedde=
d.org</a> wrote:<br>
&gt; &gt; It was observed when FILES:${PN} contains &quot;${sysconfdir}&quo=
t; or<br>
&gt; &gt; &quot;${datadir}&quot;, the bash-completion files wont be install=
ed to<br>
&gt; &gt; bash-completion package.<br>
&gt; &gt;<br>
&gt; &gt; Fix it by putting bash-completion package to PACKAGE_BEFORE_PN, t=
his<br>
&gt; &gt; ensures bash-completion package get the files packaged before PN.=
<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.co=
m" target=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; <br>
&gt; Hi Ming,<br>
&gt; <br>
&gt; Thanks for your patch.<br>
&gt; <br>
&gt; It looks like this is breaking some builds:<br>
&gt; <br>
&gt; ERROR: iproute2-6.17.0-r0 do_package: QA Issue: iproute2:<br>
&gt; Files/directories were installed but not shipped in any package:<br>
&gt;=C2=A0 =C2=A0/usr/share<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/tc<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/devlink<br>
&gt; ...<br>
&gt; ERROR: systemd-1_258.1-r0 do_package: QA Issue: systemd: Files/directo=
ries<br>
&gt; were installed but not shipped in any package:<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/userdbctl<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/systemd-id128<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/bootctl<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/systemd-run<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/localectl<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/journalctl<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/systemd-cgtop<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/systemd-nspawn<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/systemd-creds<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/systemctl<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/systemd-dissect<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/resolvectl<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/machinectl<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/systemd-delta<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/systemd-path<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/systemd-analyze<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/loginctl<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/busctl<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/networkctl<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/hostnamectl<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/systemd-cgls<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/kernel-install<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/systemd-cat<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/systemd-vpick<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/timedatectl<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/systemd-resolve<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/systemd-detect-virt=
<br>
&gt;=C2=A0 =C2=A0/usr/share/bash-completion/completions/run0<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/20=
/builds/2669" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/20/builds/2669</a><br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/11=
/builds/2667" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/11/builds/2667</a><br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/65=
/builds/2687" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/65/builds/2687</a><br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/74=
/builds/2679" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/74/builds/2679</a><br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/78=
/builds/2722" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/78/builds/2722</a><br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/99=
/builds/2684" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/99/builds/2684</a><br>
&gt; <br>
&gt; Can you fix this issue?<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Mathieu<br>
<br>
It is common for recipes to assign to PACKAGE_BEFORE_PN using the =3D <br>
operator, and typically after having done the inherits. You will have <br>
to use PACKAGE_BEFORE_PN:append. Actually, you may as well use <br>
PACKAGES:prepend instead.<br>
<br>
//Peter<br>
<br>
</blockquote></div>

--000000000000e1cfe206432bbab9--

