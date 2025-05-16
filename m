Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A811C3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 10:01:44 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.9671.1747389701574447088
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 03:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ko5/XV3t;
 spf=pass (domain: smile.fr, ip: 209.85.208.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60119cd50b6so889379a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 03:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1747389700; x=1747994500; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PKuU5TDa2umLyYID++ryf/1z0OcsHEZPbu9d/R8fAsA=;
        b=ko5/XV3t+pH2TFfVataN093XNMzlF/MuEk9xb0eBtzQzWLnJR+APhLriQBqk45tyfF
         DKHBr37QWFUph9eYgT6FKtL4cDEESMRrJQAC3aQkYnwd1uEm7lKonmFxuS3FxddTjv+D
         +5U8QLA3mGOqysYuuYbVPnPxaWnTNmshChLM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747389700; x=1747994500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PKuU5TDa2umLyYID++ryf/1z0OcsHEZPbu9d/R8fAsA=;
        b=pGRXQ3R4lLZfj9FLEU+gaB7EiRw9s3oU2/RtWZHqztoSn1yZO6dDfaAhlDLZXy+hDT
         MK0k56nmR/cnHpLz60VZsGNkRiP8KA8QRTDg4dwsI9+sLE3We/0vkVPU/R+xeGOI9otz
         qKzMFMhzbmDhwn1HmezrxpNzcKNgjuJTGHBLxd36DoyLGkWt2OgOscFLEaqagF/ZJ7tu
         cg1f5RQqVg/tCRyJhur6xHo0G79dQmsowtnzht4BX/6Wt5pL1OkYv4eEUl6CggiQDu3p
         MuKQqgvS+b160GPNggBGKFm70ICdnPDgPGsg/CzdY3dBreJ6LT1UWbdTpkpBc3EhW6CG
         4sHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVViF1NeVIXnw0wCzC7ueEYRug+pGb4k0HHPMxZ9zwAHDi6D0386QiekJv2jfRMhcf+b8EPLMu2jYJuYko7euzTJw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwxoP1mNMLBd0xTka/SXcB7QMo5wdjJV1LelHoEtokUIlyZ/KNN
	UxhDNH5EDzNtYKU3w0uxYSHv6vOCax69g13pm8QMD2JeW/+xeeewXWfdZTeI3qmhnmkp7cmCYRO
	UTNjHEnL4Hueq5yscGZs/ONzuKziNCKBKBMG9NpobhEzUSgQ3NdX7KhOrxg==
X-Gm-Gg: ASbGncu5a1UQk++ETpCAGPyWKRJBW/M9DGOTJbaf7Fj95aFORVm6Tn3MGs6FnwPlbrz
	K05LMKbG5m3PZyeX6TzctiFIe5eRuYMFhoiSkc522pKM7lXDHADMhLPFbCwY/++MZ80ypg5GeQH
	CNDAZHvjnL0QOVTPT6w7sgjwc1PEdHnqGdmCKv+vY4Z1KRs0nHTW6J2L2jnPg238iDczA=
X-Google-Smtp-Source: AGHT+IH3J/CaTjw8CJf1VzYfqzy2OtsTU8DJFAq8wqBlMyn+6WH13YOtdqtgwUlZ7ds6iQTNyFrn5gQ5TRe+MyStG8Y=
X-Received: by 2002:a05:6000:2012:b0:3a3:5a99:7e07 with SMTP id
 ffacd0b85a97d-3a35c8258fdmr2977511f8f.25.1747389680590; Fri, 16 May 2025
 03:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250516093127.506158-1-yi.zhao@windriver.com>
 <CAMSfU+5Ef=BO7AnY-gTeFb4+m6ZmNJMA=R1DkAFZ3vStd6KicQ@mail.gmail.com> <AS1PR10MB5697B8FE4755F74E78629793FD93A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697B8FE4755F74E78629793FD93A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 16 May 2025 12:00:54 +0200
X-Gm-Features: AX0GCFvMQGiAq5hVD44JYBm5i5O1OYhf_Izu13un813tOVVLJ0RQbTFvNB9UEG8
Message-ID: <CAMSfU+6m8PNg8hAnbf-3+B3c8rfG=qHEX2e_PzERD_cchjB=XQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] procps: fix runtime version when using git
 shallow tarball
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "yi.zhao@eng.windriver.com" <yi.zhao@eng.windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000032926806353ddd62"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 10:01:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216738

--00000000000032926806353ddd62
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 16 mai 2025 =C3=A0 11:44, Marko, Peter <Peter.Marko@siemens.com> a
=C3=A9crit :

>
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Yoann Congal via
> > lists.openembedded.org
> > Sent: Friday, May 16, 2025 11:36
> > To: yi.zhao@eng.windriver.com
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 1/2] procps: fix runtime version when
> using git
> > shallow tarball
> >
> >
> >
> > Le ven. 16 mai 2025 =C3=A0 11:31, Yi Zhao via lists.openembedded.org
> > <http://lists.openembedded.org>
> > <yi.zhao=3Deng.windriver.com@lists.openembedded.org
> > <mailto:eng.windriver.com@lists.openembedded.org> > a =C3=A9crit :
> >
> >
> >       The runtime version of procps is generated by 'git describe'
> command in
> >       local/git-version-gen. But when using git shallow tarball,
> >       git-version-gen can not get the correct version due to missing gi=
t
> >       tag/commit messages. This actually breaks reproducibility, since
> the
> >       generated binaries should be consistent regardless of the source
> code
> >       packaging format.
> >
> >       Add a .tarball-version file in source directory. Then
> get-version-gen
> >       can determine the version through this file instead of 'git
> describe'
> >       command.
> >
> >       Before the fix:
> >       root@intel-x86-64:~# ps -V
> >       ps from procps-ng UNKNOWN
> >       root@intel-x86-64:~# sysctl -V
> >       sysctl from procps-ng UNKNOWN
> >
> >       After the fix:
> >       root@intel-x86-64:~# ps -V
> >       ps from procps-ng 4.0.5
> >       root@intel-x86-64:~# sysctl -V
> >       sysctl from procps-ng 4.0.5
> >
> >
> >
> > Hello,
> > Did you try to add the tag parameter to SRC_URI?
> > Since
> >
> https://git.openembedded.org/bitbake/commit/?id=3D03945475886b8d31c7eccc8=
0fe
> > 594ab5306bcf5d, it looks like it should work.
>
> There is one problem with the tag in SRC_URI - it should be done only on
> upgrade.
> If you just add tag without bumping the version, you will still get the
> shallow tarball without the tag from already populated local download
> folder or download mirror.
>

Ok, I did not know.
Sounds like a bug in the git fetcher.
Maybe the clonedir_need_update function needs to be upgraded to handle this
case?
https://git.openembedded.org/bitbake/tree/lib/bb/fetch2/git.py#n317


> Peter
>
> >
> >
> >
> >
> >       Signed-off-by: Yi Zhao <yi.zhao@windriver.com
> > <mailto:yi.zhao@windriver.com> >
> >       ---
> >        meta/recipes-extended/procps/procps_4.0.5.bb <
> http://procps_4.0.5.bb>
> > | 4 ++++
> >        1 file changed, 4 insertions(+)
> >
> >       diff --git a/meta/recipes-extended/procps/procps_4.0.5.bb
> > <http://procps_4.0.5.bb>  b/meta/recipes-extended/procps/procps_4.0.5.b=
b
> > <http://procps_4.0.5.bb>
> >       index 3be40c38a4..e3f5bf6b65 100644
> >       --- a/meta/recipes-extended/procps/procps_4.0.5.bb
> > <http://procps_4.0.5.bb>
> >       +++ b/meta/recipes-extended/procps/procps_4.0.5.bb
> > <http://procps_4.0.5.bb>
> >       @@ -31,6 +31,10 @@ EXTRA_OECONF =3D "--enable-skill --disable-mod=
ern-
> > top"
> >        PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES',
> > 'systemd', d)}"
> >        PACKAGECONFIG[systemd] =3D "--with-systemd,--without-
> > systemd,systemd"
> >
> >       +do_configure:prepend () {
> >       +       [ ! -e ${S}/.tarball-version ] && echo ${PV} >
> ${S}/.tarball-version
> >       +}
> >       +
> >        do_install:append () {
> >               install -d ${D}${base_bindir}
> >               [ "${bindir}" !=3D "${base_bindir}" ] && for i in
> ${base_bindir_progs}; do
> > mv ${D}${bindir}/$i ${D}${base_bindir}/$i; done
> >       --
> >       2.34.1
> >
> >
> >
> >
> >
> >
> >
> >
> > --
> >
> > Yoann Congal
> > Smile ECS
>


--=20
Yoann Congal
Smile ECS

--00000000000032926806353ddd62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 16=
 mai 2025 =C3=A0=C2=A011:44, Marko, Peter &lt;<a href=3D"mailto:Peter.Marko=
@siemens.com">Peter.Marko@siemens.com</a>&gt; a =C3=A9crit=C2=A0:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Yoann Congal via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: Friday, May 16, 2025 11:36<br>
&gt; To: <a href=3D"mailto:yi.zhao@eng.windriver.com" target=3D"_blank">yi.=
zhao@eng.windriver.com</a><br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: Re: [OE-core] [PATCH 1/2] procps: fix runtime version when us=
ing git<br>
&gt; shallow tarball<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; Le ven. 16 mai 2025 =C3=A0 11:31, Yi Zhao via <a href=3D"http://lists.=
openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.o=
rg</a><br>
&gt; &lt;<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">http://lists.openembedded.org</a>&gt;<br>
&gt; &lt;yi.zhao=3D<a href=3D"mailto:eng.windriver.com@lists.openembedded.o=
rg" target=3D"_blank">eng.windriver.com@lists.openembedded.org</a><br>
&gt; &lt;mailto:<a href=3D"mailto:eng.windriver.com@lists.openembedded.org"=
 target=3D"_blank">eng.windriver.com@lists.openembedded.org</a>&gt; &gt; a =
=C3=A9crit :<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0The runtime version of procps is generated b=
y &#39;git describe&#39; command in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0local/git-version-gen. But when using git sh=
allow tarball,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0git-version-gen can not get the correct vers=
ion due to missing git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tag/commit messages. This actually breaks re=
producibility, since the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0generated binaries should be consistent rega=
rdless of the source code<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0packaging format.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Add a .tarball-version file in source direct=
ory. Then get-version-gen<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0can determine the version through this file =
instead of &#39;git describe&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0command.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Before the fix:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0root@intel-x86-64:~# ps -V<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ps from procps-ng UNKNOWN<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0root@intel-x86-64:~# sysctl -V<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sysctl from procps-ng UNKNOWN<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0After the fix:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0root@intel-x86-64:~# ps -V<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ps from procps-ng 4.0.5<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0root@intel-x86-64:~# sysctl -V<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sysctl from procps-ng 4.0.5<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; Hello,<br>
&gt; Did you try to add the tag parameter to SRC_URI?<br>
&gt; Since<br>
&gt; <a href=3D"https://git.openembedded.org/bitbake/commit/?id=3D039454758=
86b8d31c7eccc80fe" rel=3D"noreferrer" target=3D"_blank">https://git.openemb=
edded.org/bitbake/commit/?id=3D03945475886b8d31c7eccc80fe</a><br>
&gt; 594ab5306bcf5d, it looks like it should work.<br>
<br>
There is one problem with the tag in SRC_URI - it should be done only on up=
grade.<br>
If you just add tag without bumping the version, you will still get the sha=
llow tarball without the tag from already populated local download folder o=
r download mirror.<br></blockquote><div><br></div><div>Ok, I did not know.<=
/div><div>Sounds like a bug in the git fetcher.</div><div>Maybe the clonedi=
r_need_update function needs to be upgraded to handle this case?</div><div>=
<a href=3D"https://git.openembedded.org/bitbake/tree/lib/bb/fetch2/git.py#n=
317">https://git.openembedded.org/bitbake/tree/lib/bb/fetch2/git.py#n317</a=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Peter<br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Yi Zhao &lt;<a href=3D"mailto=
:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">=
yi.zhao@windriver.com</a>&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-extended/procps/<a href=3D"htt=
p://procps_4.0.5.bb" rel=3D"noreferrer" target=3D"_blank">procps_4.0.5.bb</=
a> &lt;<a href=3D"http://procps_4.0.5.bb" rel=3D"noreferrer" target=3D"_bla=
nk">http://procps_4.0.5.bb</a>&gt;<br>
&gt; | 4 ++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 1 file changed, 4 insertions(+)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/meta/recipes-extended/procps/<a=
 href=3D"http://procps_4.0.5.bb" rel=3D"noreferrer" target=3D"_blank">procp=
s_4.0.5.bb</a><br>
&gt; &lt;<a href=3D"http://procps_4.0.5.bb" rel=3D"noreferrer" target=3D"_b=
lank">http://procps_4.0.5.bb</a>&gt;=C2=A0 b/meta/recipes-extended/procps/<=
a href=3D"http://procps_4.0.5.bb" rel=3D"noreferrer" target=3D"_blank">proc=
ps_4.0.5.bb</a><br>
&gt; &lt;<a href=3D"http://procps_4.0.5.bb" rel=3D"noreferrer" target=3D"_b=
lank">http://procps_4.0.5.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0index 3be40c38a4..e3f5bf6b65 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--- a/meta/recipes-extended/procps/<a href=
=3D"http://procps_4.0.5.bb" rel=3D"noreferrer" target=3D"_blank">procps_4.0=
.5.bb</a><br>
&gt; &lt;<a href=3D"http://procps_4.0.5.bb" rel=3D"noreferrer" target=3D"_b=
lank">http://procps_4.0.5.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+++ b/meta/recipes-extended/procps/<a href=
=3D"http://procps_4.0.5.bb" rel=3D"noreferrer" target=3D"_blank">procps_4.0=
.5.bb</a><br>
&gt; &lt;<a href=3D"http://procps_4.0.5.bb" rel=3D"noreferrer" target=3D"_b=
lank">http://procps_4.0.5.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@@ -31,6 +31,10 @@ EXTRA_OECONF =3D &quot;--=
enable-skill --disable-modern-<br>
&gt; top&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 PACKAGECONFIG ??=3D &quot;${@bb.utils.filte=
r(&#39;DISTRO_FEATURES&#39;,<br>
&gt; &#39;systemd&#39;, d)}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 PACKAGECONFIG[systemd] =3D &quot;--with-sys=
temd,--without-<br>
&gt; systemd,systemd&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+do_configure:prepend () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ ! -e ${S}/.tar=
ball-version ] &amp;&amp; echo ${PV} &gt; ${S}/.tarball-version<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 do_install:append () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}$=
{base_bindir}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ &quot;${bindir=
}&quot; !=3D &quot;${base_bindir}&quot; ] &amp;&amp; for i in ${base_bindir=
_progs}; do<br>
&gt; mv ${D}${bindir}/$i ${D}${base_bindir}/$i; done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A02.34.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; --<br>
&gt; <br>
&gt; Yoann Congal<br>
&gt; Smile ECS<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--00000000000032926806353ddd62--

