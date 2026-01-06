Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67360C47BE1
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 23:01:38 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2914.1767740492400858185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 15:01:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NfGIdJ8O;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477632b0621so9069125e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 15:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767740491; x=1768345291; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EvTNMHs05T4Ovz5ZY3EXJXmi+hDWZwPyYovaGscShls=;
        b=NfGIdJ8O9xyJyvZlUdAERwPIHXBM0vglFlLUh0Iyev10cHrjz7Zo6JiJsKf75mHfhY
         4mdgs+lHc5YPN17Z1nApPEGCRbHHR9AfLXvppGWFqBjKE4xRXu5EbAusDSms/tMy682p
         tE0dqKGCRMVZzJtCP3hNYVVuValO9AXTsWEu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767740491; x=1768345291;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EvTNMHs05T4Ovz5ZY3EXJXmi+hDWZwPyYovaGscShls=;
        b=wGaWxbgT63WobKtSlgzghXvdVMxyOap21jpIEVaSYFmq1NLY9SpDRLJxe4Ct9Ww+3p
         AxyBZIgPg/4ba4MiJwD51rXUfifCzGUyvG/oC4G/yfd0PyznIr3zhcfGq4IQ+Oambwic
         6HKIKNy3oyWix/TNm5VgXCpgk5BeOaKHwCXBxeeG/uaRTLUIsDvqRBZ9JE/s8cGo7/TN
         Zz3V8tUbM3yo75b6EoQhRuTrBY1urIfOXdzszMKjgwZ+a0YJ++ZgWUcN21Mf3mt5z/Fa
         DubMlwzf18rVsVZjbaOxzNJRx0aPV7zfKAB0WDSf13e/PttRO2C3M2kB+mfna6tSFMgy
         Fmgw==
X-Forwarded-Encrypted: i=1; AJvYcCV/oUeXdX5oj8iJw3EfuvQ/rEZFEXzPbFeLoOl67G7re2vREhHulr+qCSF9VuH+QrHc/FjgYEGYn0zkQWgZXGhwzg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwJVWJTIs8reLw9Wx/ZAwEv8pH+jWSFaCfs1MldzkxNtf4mtSzj
	h1eYwBJtlfYMYOmL2SeJkiSLWmrPckF41B3KpU/YpnZX0Rt7To0huhFiabk6EX+vufewifwlATR
	T98aK2Ggaq4Wy++gmY7i6lHy9uc+3Ywm3MwaDARDnJHiPWmhoNT2L
X-Gm-Gg: AY/fxX4ZRyVrFi8LlPe6hNSRaiwthIaRWZ8MxRpQ505diG1KgWUP63UGyqp1tvkkzPA
	MF1uXKYL8pK083Fb0R+8w3MbjVCeIc4lPdoXgMwhg1J9S5v1xM+YOoFZVmdKEttXHc3n6Mg8qb/
	iw6rYmAc0xVxhyZcUDQ0WQvsJ48XKScYhOTtipb7BleFbwArNeMBTzPcC+qfFd/jqOEQul3nZ1Y
	h+Pcr7FRTB8DJz6fvQTXS4jdes3kS/Fg9HtN7ki1wMMGdKsoQ4pVmGXdM1tAA6+6uLha1t5cu54
	msMaaZyaDDEnSvSpa8rXcTk69u1x
X-Google-Smtp-Source: AGHT+IFwLPWnOYJuvK1XrLE1me3ApyI0sPqtdIq0pzychACrL3thSz7tYEl/O7jUqehTMJVQfozT2iB5y88O0/zf+Mc=
X-Received: by 2002:a05:600c:820f:b0:475:dde5:d91b with SMTP id
 5b1f17b1804b1-47d84b349e9mr4852955e9.17.1767740490780; Tue, 06 Jan 2026
 15:01:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1766352840.git.steve@sakoman.com> <9964fa3da2fa1e7243fba1a826e59f7bb1813706.1766352840.git.steve@sakoman.com>
 <b7923b2d-98df-4a16-b8a0-8d99035cedc5@windriver.com> <CAOSpxdZCjccVF+D-s0m29N1+XwzApY1DMVw=Uyd+Ynd=pXm7xg@mail.gmail.com>
In-Reply-To: <CAOSpxdZCjccVF+D-s0m29N1+XwzApY1DMVw=Uyd+Ynd=pXm7xg@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 7 Jan 2026 00:01:05 +0100
X-Gm-Features: AQt7F2pQzhcFxK8g4oFNCXgVy_dJoCMbajVvOpk0rLF50jTgSvok3eshqXv1qCs
Message-ID: <CAMSfU+6YhbEtChRGwbNY3RcjFUYrWepTUj_G71N=sNqwo94EmA@mail.gmail.com>
Subject: Re: [OE-core][whinlatter 18/18] populate_sdk_ext: keep SDK_TARGETS so
 SPDX/SBOM tasks remain in locked sigs
To: Steve Sakoman <steve@sakoman.com>
Cc: randy.macleod@windriver.com, openembedded-core@lists.openembedded.org, 
	"Jayasurya, Maganuru" <maganuru.jayasurya@windriver.com>, paul@pbarker.dev, 
	Joshua Watt <JPEW.hacker@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000021c700647c028f0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 23:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228940

--000000000000021c700647c028f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 6 janv. 2026 =C3=A0 23:37, Steve Sakoman <steve@sakoman.com> a =C3=
=A9crit :

> Sigh, this was my mistake.
>
> I saw they were in master-next and moved them into whinlatter-nut for
> testing and then forgot to check to see if they merged before I sent
> them out for review.
>
> We should revert them before the whinlatter release build.
>

I'll handle this. There will be one last patch review series before
the 5.3.1 release build.
I will add the reverts to the list.


> Time to retire, I'm making mistakes :-(
>

That's fine, we got this :)


> Steve
>
> On Tue, Jan 6, 2026 at 1:30=E2=80=AFPM Randy MacLeod via
> lists.openembedded.org
> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > On 2025-12-21 4:37 p.m., Steve Sakoman via lists.openembedded.org wrote=
:
> >
> > From: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>
> >
> > Fixes [YOCTO #15853]
> >
> > Steve, Yoann, and others,
> >
> > This commit as well as 17/18 made it into whinlatter before master.
>

Nice catch, Randy!


> > Was that intentional ?
> >
> > =E2=9D=AF git log   --oneline origin/whinlatter  ^master
> meta/classes-recipe/populate_sdk_ext.bbclass
> > 9964fa3da2 (origin/whinlatter) populate_sdk_ext: keep SDK_TARGETS so
> SPDX/SBOM tasks remain in locked sigs
> >
> > =E2=9D=AF git log   --oneline origin/whinlatter  ^master
> > 9964fa3da2 (origin/whinlatter) populate_sdk_ext: keep SDK_TARGETS so
> SPDX/SBOM tasks remain in locked sigs
> > 3f57280caa create-spdx-image-3.0: Image SPDX/SBOM tasks are retained fo=
r
> eSDK installation
> > 7f02b3f811 cve-update: Avoid NFS caching issues
> >
> > The patches has been sitting in master-next for a while since people
> > have some concerns about them, IIRC.
> >
> > What do we do now, revert ?
> >
> >
> > Apologies for missing the review deadline.
> > Maybe next year, there should be a longer merge freeze around Xmas time
> > so that there's sufficient review.
> >
> > ../Randy
> >
> >
> >
> > The filtering in populate_sdk_ext.bbclass was removing all image target=
s
> from
> > the locked signatures, including the main SDK images (SDK_TARGETS). As =
a
> > result, their tasks including the image SPDX/SBOM tasks were not added =
to
> > locked-sigs.inc.
> >
> > Without these entries, the eSDK lacked the necessary sstate, and the
> installer
> > attempted to run the missing tasks during installation, leading to
> unexpected
> > task execution errors.
> >
> > This patch keeps SDK_TARGETS (and their multilib variants) in the locke=
d
> > signatures so their SPDX/SBOM tasks are included. With those tasks in t=
he
> > sstate cache, the eSDK installs cleanly without needing to re-run
> anything.
> >
> > Signed-off-by: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>
> > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com=
>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 920c5de570ec575a9eaccb105461394d9fa0f1db)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/classes-recipe/populate_sdk_ext.bbclass | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass
> b/meta/classes-recipe/populate_sdk_ext.bbclass
> > index 2859320ddf..2838ca1a03 100644
> > --- a/meta/classes-recipe/populate_sdk_ext.bbclass
> > +++ b/meta/classes-recipe/populate_sdk_ext.bbclass
> > @@ -460,6 +460,15 @@ def prepare_locked_cache(d, baseoutpath,
> derivative, conf_initpath):
> >
> >      # Filter the locked signatures file to just the sstate tasks we ar=
e
> interested in
> >      excluded_targets =3D get_sdk_install_targets(d, images_only=3DTrue=
)
> > +    sdk_targets =3D d.getVar('SDK_TARGETS')
> > +    ext_sdk_target_set =3D set(multilib_pkg_extend(d,
> sdk_targets).split())
> > +    excluded_set =3D set(excluded_targets.split())
> > +
> > +    # Ensure SDK_TARGETS and their image SPDX/SBOM tasks are included
> in the locked signatures,
> > +    # as they are required during eSDK installation.
> > +    filtered_excluded_set =3D excluded_set - ext_sdk_target_set
> > +    excluded_targets =3D ' '.join(filtered_excluded_set)
> > +
> >      sigfile =3D d.getVar('WORKDIR') + '/locked-sigs.inc'
> >      lockedsigs_pruned =3D baseoutpath + '/conf/locked-sigs.inc'
> >      #nativesdk-only sigfile to merge into locked-sigs.inc
> >
> >
> >
> >
> > --
> > # Randy MacLeod
> > # Wind River Linux
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#228933):
> https://lists.openembedded.org/g/openembedded-core/message/228933
> > Mute This Topic: https://lists.openembedded.org/mt/116893601/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Yoann Congal
Smile ECS

--000000000000021c700647c028f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0mar. 6 janv. 202=
6 =C3=A0=C2=A023:37, Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com"=
 target=3D"_blank">steve@sakoman.com</a>&gt; a =C3=A9crit=C2=A0:</div><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sig=
h, this was my mistake.<br>
<br>
I saw they were in master-next and moved them into whinlatter-nut for<br>
testing and then forgot to check to see if they merged before I sent<br>
them out for review.<br>
<br>
We should revert them before the whinlatter release build.<br></blockquote>=
<div><br></div><div>I&#39;ll handle this. There will be one last patch revi=
ew series before the=C2=A05.3.1 release build.</div><div>I will add the rev=
erts to the list.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
Time to retire, I&#39;m making mistakes :-(<br></blockquote><div><br></div>=
<div>That&#39;s fine, we got this :)</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
Steve<br>
<br>
On Tue, Jan 6, 2026 at 1:30=E2=80=AFPM Randy MacLeod via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;randy.macleod=3D<a href=3D"mailto:windriver.com@lists.openembedded.org"=
 target=3D"_blank">windriver.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On 2025-12-21 4:37 p.m., Steve Sakoman via <a href=3D"http://lists.ope=
nembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org<=
/a> wrote:<br>
&gt;<br>
&gt; From: Jayasurya Maganuru &lt;<a href=3D"mailto:Maganuru.Jayasurya@wind=
river.com" target=3D"_blank">Maganuru.Jayasurya@windriver.com</a>&gt;<br>
&gt;<br>
&gt; Fixes [YOCTO #15853]<br>
&gt;<br>
&gt; Steve, Yoann, and others,<br>
&gt;<br>
&gt; This commit as well as 17/18 made it into whinlatter before master.<br=
></blockquote><div><br></div><div>Nice catch, Randy!</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Was that intentional ?<br>
&gt;<br>
&gt; =E2=9D=AF git log=C2=A0 =C2=A0--oneline origin/whinlatter=C2=A0 ^maste=
r meta/classes-recipe/populate_sdk_ext.bbclass<br>
&gt; 9964fa3da2 (origin/whinlatter) populate_sdk_ext: keep SDK_TARGETS so S=
PDX/SBOM tasks remain in locked sigs<br>
&gt;<br>
&gt; =E2=9D=AF git log=C2=A0 =C2=A0--oneline origin/whinlatter=C2=A0 ^maste=
r<br>
&gt; 9964fa3da2 (origin/whinlatter) populate_sdk_ext: keep SDK_TARGETS so S=
PDX/SBOM tasks remain in locked sigs<br>
&gt; 3f57280caa create-spdx-image-3.0: Image SPDX/SBOM tasks are retained f=
or eSDK installation<br>
&gt; 7f02b3f811 cve-update: Avoid NFS caching issues<br>
&gt;<br>
&gt; The patches has been sitting in master-next for a while since people<b=
r>
&gt; have some concerns about them, IIRC.<br>
&gt;<br>
&gt; What do we do now, revert ?<br>
&gt;<br>
&gt;<br>
&gt; Apologies for missing the review deadline.<br>
&gt; Maybe next year, there should be a longer merge freeze around Xmas tim=
e<br>
&gt; so that there&#39;s sufficient review.<br>
&gt;<br>
&gt; ../Randy<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; The filtering in populate_sdk_ext.bbclass was removing all image targe=
ts from<br>
&gt; the locked signatures, including the main SDK images (SDK_TARGETS). As=
 a<br>
&gt; result, their tasks including the image SPDX/SBOM tasks were not added=
 to<br>
&gt; locked-sigs.inc.<br>
&gt;<br>
&gt; Without these entries, the eSDK lacked the necessary sstate, and the i=
nstaller<br>
&gt; attempted to run the missing tasks during installation, leading to une=
xpected<br>
&gt; task execution errors.<br>
&gt;<br>
&gt; This patch keeps SDK_TARGETS (and their multilib variants) in the lock=
ed<br>
&gt; signatures so their SPDX/SBOM tasks are included. With those tasks in =
the<br>
&gt; sstate cache, the eSDK installs cleanly without needing to re-run anyt=
hing.<br>
&gt;<br>
&gt; Signed-off-by: Jayasurya Maganuru &lt;<a href=3D"mailto:Maganuru.Jayas=
urya@windriver.com" target=3D"_blank">Maganuru.Jayasurya@windriver.com</a>&=
gt;<br>
&gt; Signed-off-by: Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dub=
ois-briand@bootlin.com" target=3D"_blank">mathieu.dubois-briand@bootlin.com=
</a>&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt; (cherry picked from commit 920c5de570ec575a9eaccb105461394d9fa0f1db)<b=
r>
&gt; Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" =
target=3D"_blank">steve@sakoman.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/populate_sdk_ext.bbclass | 9 +++++++++<br>
&gt;=C2=A0 1 file changed, 9 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/class=
es-recipe/populate_sdk_ext.bbclass<br>
&gt; index 2859320ddf..2838ca1a03 100644<br>
&gt; --- a/meta/classes-recipe/populate_sdk_ext.bbclass<br>
&gt; +++ b/meta/classes-recipe/populate_sdk_ext.bbclass<br>
&gt; @@ -460,6 +460,15 @@ def prepare_locked_cache(d, baseoutpath, derivati=
ve, conf_initpath):<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Filter the locked signatures file to just the ss=
tate tasks we are interested in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 excluded_targets =3D get_sdk_install_targets(d, im=
ages_only=3DTrue)<br>
&gt; +=C2=A0 =C2=A0 sdk_targets =3D d.getVar(&#39;SDK_TARGETS&#39;)<br>
&gt; +=C2=A0 =C2=A0 ext_sdk_target_set =3D set(multilib_pkg_extend(d, sdk_t=
argets).split())<br>
&gt; +=C2=A0 =C2=A0 excluded_set =3D set(excluded_targets.split())<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Ensure SDK_TARGETS and their image SPDX/SBOM tasks ar=
e included in the locked signatures,<br>
&gt; +=C2=A0 =C2=A0 # as they are required during eSDK installation.<br>
&gt; +=C2=A0 =C2=A0 filtered_excluded_set =3D excluded_set - ext_sdk_target=
_set<br>
&gt; +=C2=A0 =C2=A0 excluded_targets =3D &#39; &#39;.join(filtered_excluded=
_set)<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sigfile =3D d.getVar(&#39;WORKDIR&#39;) + &#39;/lo=
cked-sigs.inc&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 lockedsigs_pruned =3D baseoutpath + &#39;/conf/loc=
ked-sigs.inc&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 #nativesdk-only sigfile to merge into locked-sigs.=
inc<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; # Randy MacLeod<br>
&gt; # Wind River Linux<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#228933): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/228933" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/228933</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11689360=
1/3620601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/116893601/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.com" ta=
rget=3D"_blank">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>
</div>

--000000000000021c700647c028f0--

