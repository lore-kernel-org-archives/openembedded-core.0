Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6573FC04A95
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:54:59 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web12.566.1663955691679659884
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Sep 2022 10:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wp+K5nPb;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id
 r34-20020a05683044a200b0065a12392fd7so512294otv.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Sep 2022 10:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=pflBtKa95ZJRzpz90RACo2vh0+/6UCnPuosWzky/4Vo=;
        b=Wp+K5nPbCSM81FIPmPnXukKxDSSEb9ZxOgR3DyMk66q5PvtoKBfwZ/7ZxUwgK/CySy
         PXAKnWwMjtmRreo2jkcEP8L9LHSKmwoGY/y3jIqS/pUnbZ/0z1EX8rg9fUp/nu2+hrDP
         gk9n7BoidwIchtPc9lNVGcVxIzEpon9XPPgLnKR4moK3qlmvg9X2JOP/oJgHPnEVDgOL
         AGVW3V64vRyyw4kehBKCqdoLcjuolphhrb7I5ODNRa672kYFjEHT9S1CRqqXRtpocYHE
         nvAawFCg3YaLeHH7Wa82v5CeCLoPqvLFtGH1kFCx8eHf909i7M22OffoLbBdBQ9DqBjm
         NvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=pflBtKa95ZJRzpz90RACo2vh0+/6UCnPuosWzky/4Vo=;
        b=hunlnEZXV42Qdljwo++Vf6kGM3OU0MA2IgtK3/uCp6sMBcs1j58HT81DWLAkAmiT8X
         Y/aG+0xj+1a7WrChyiwbUIq0C1tv51s3un4wT7Wd54be/2CKpFMfioBLut6Awpi86uh0
         bAULzI28nquTkCpeOQaDrmaVmLyLP8N1nhPKG4htILg3zyaFtt5FYbK0f+f/S8jtafhU
         TVoYcdnIypkFpPr0IQJ87AV9SeZ1nahD6AWiin2Xct0n/gfnfvPd3R/z3v7imMetx/0w
         pPCuOR8Qes8ehgJUx8L1kHm+OlX8aAtKFvuKskfluWyUCavClZURr8UiEHa4W6df/Pst
         kZcw==
X-Gm-Message-State: ACrzQf3BTME08gh9hmM7nZm6aqDPUg7EGnQ3vlDeZVLInAriJhDy4xPl
	ryDQAwoUk5f2Lw0c4lmDiGgc/Ya/m4QiWVHIBIc=
X-Google-Smtp-Source: 
 AMsMyM4whGIGPjsb7reNPrgGfjgW9qF4umRjlXFZXq6sMIDV0gP1iObYqw6VTP5gpbTPolKvogOK67+Hz1yviIoMJ84=
X-Received: by 2002:a05:6830:3901:b0:658:fff4:51b8 with SMTP id
 br1-20020a056830390100b00658fff451b8mr4542395otb.55.1663955690737; Fri, 23
 Sep 2022 10:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1662077634.git.wltu@google.com>
 <32c56887301c5fc58e5c9877c858295de66fc482.1662077634.git.wltu@google.com>
 <CAHwn2Xn80+=miR0ZvM1mLhMLUyMdg3Ja4yt6r5xLikh2uRE87Q@mail.gmail.com>
 <CAMKF1soAvqmReWbkrpPpM-NGmzyCbQkpLRtqvR_pmfL5a9MYdw@mail.gmail.com>
 <CAHwn2XmN4nAADq4YSsdacfE=7ESNbUgAXdC3Fy23o=RV9_L9Nw@mail.gmail.com>
In-Reply-To: 
 <CAHwn2XmN4nAADq4YSsdacfE=7ESNbUgAXdC3Fy23o=RV9_L9Nw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Sep 2022 13:54:40 -0400
Message-ID: 
 <CAMKF1sqD7qX=sDLc7JprCYZULkM0ZoWXfcELEa-OZMuCSm=E4Q@mail.gmail.com>
Subject: Re: [PULL] [PATCH 1/1] openssh: Install header + lib files
To: Willy Tu <wltu@google.com>
Cc: Tristan Lelong <tlelong@google.com>,
 openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000de557705e95bdf5c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Sep 2022 17:54:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171003

--000000000000de557705e95bdf5c
Content-Type: text/plain; charset="UTF-8"

Yes it is and I think you
Might need to subscribe to it

On Fri, Sep 23, 2022 at 1:51 PM Willy Tu <wltu@google.com> wrote:

> ok, sounds good. Thanks.
>
> I'll take a closer look at it to update it.
>
> On a related note, is `openembedded-core@lists.openembedded.org` the
> right email? It is giving me errors when trying to send to that
> address.
>
> Willy Tu
>
> On Fri, Sep 23, 2022 at 10:48 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On Fri, Sep 23, 2022 at 12:56 PM Willy Tu <wltu@google.com> wrote:
> >>
> >> friendly ping (again), but this time with plain text only.
> >
> >
> > I think it should be done with packageconfig which is at recipe scope
> and then in your own distro you could enable it via bbappend or via other
> global knob if you wish so
> >
> > Secondly lot of these seems to be something that devel package should
> have already can you check that and ensure we are not double installing the
> files
> >
> >>
> >> Willy Tu
> >>
> >>
> >> On Thu, Sep 1, 2022 at 5:16 PM Willy Tu <wltu@google.com> wrote:
> >> >
> >> > Instal API only if opensshinternals is in DISTRO_FEATURES.
> >> >
> >> > Install the OpenSSH header + lib files for other repo to build using
> it.
> >> > For example, https://github.com/google/hiba is dependent on those
> files
> >> > to build and this change is needed to meet that requirement.
> >> >
> >> > https://github.com/openembedded/meta-openembedded/pull/597
> >> >
> >> > Signed-off-by: Willy Tu <wltu@google.com>
> >> > ---
> >> >  meta/recipes-connectivity/openssh/openssh_9.0p1.bb | 11 +++++++++++
> >> >  1 file changed, 11 insertions(+)
> >> >
> >> > diff --git a/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
> b/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
> >> > index b63ea2b137..84da118ca6 100644
> >> > --- a/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
> >> > +++ b/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
> >> > @@ -137,6 +137,17 @@ do_install:append () {
> >> >                 ${D}${sysconfdir}/init.d/sshd
> >> >
> >> >         install -D -m 0755 ${WORKDIR}/sshd_check_keys
> ${D}${libexecdir}/${BPN}/sshd_check_keys
> >> > +
> >> > +       if ${@bb.utils.contains('DISTRO_FEATURES',
> 'opensshinternals', 'true', 'false', d)}; then
> >> > +               install -d ${D}${includedir}/ssh
> >> > +               install -d ${D}${includedir}/ssh/openbsd-compat
> >> > +               install -m0644 ${S}/*.h ${D}${includedir}/ssh
> >> > +               install -m0644 ${S}/openbsd-compat/*.h
> ${D}${includedir}/ssh/openbsd-compat
> >> > +
> >> > +               install -d ${D}${libdir}
> >> > +               install -m0644 ${S}/libssh.a ${D}${libdir}
> >> > +               install -m0644
> ${S}/openbsd-compat/libopenbsd-compat.a ${D}${libdir}
> >> > +       fi
> >> >  }
> >> >
> >> >  do_install_ptest () {
> >> > --
> >> > 2.37.2.789.g6183377224-goog
> >> >
>

--000000000000de557705e95bdf5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes it is and I think you</div><div dir=3D"auto">Might ne=
ed to subscribe to it=C2=A0</div><div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 23, 2022 at 1:51 PM Willy Tu &l=
t;<a href=3D"mailto:wltu@google.com">wltu@google.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">ok, sounds good. Thanks.<br>
<br>
I&#39;ll take a closer look at it to update it.<br>
<br>
On a related note, is `<a href=3D"mailto:openembedded-core@lists.openembedd=
ed.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>` the=
<br>
right email? It is giving me errors when trying to send to that<br>
address.<br>
<br>
Willy Tu<br>
<br>
On Fri, Sep 23, 2022 at 10:48 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Sep 23, 2022 at 12:56 PM Willy Tu &lt;<a href=3D"mailto:wltu@g=
oogle.com" target=3D"_blank">wltu@google.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; friendly ping (again), but this time with plain text only.<br>
&gt;<br>
&gt;<br>
&gt; I think it should be done with packageconfig which is at recipe scope =
and then in your own distro you could enable it via bbappend or via other g=
lobal knob if you wish so<br>
&gt;<br>
&gt; Secondly lot of these seems to be something that devel package should =
have already can you check that and ensure we are not double installing the=
 files<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Willy Tu<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Sep 1, 2022 at 5:16 PM Willy Tu &lt;<a href=3D"mailto:wltu=
@google.com" target=3D"_blank">wltu@google.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Instal API only if opensshinternals is in DISTRO_FEATURES.<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Install the OpenSSH header + lib files for other repo to buil=
d using it.<br>
&gt;&gt; &gt; For example, <a href=3D"https://github.com/google/hiba" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/google/hiba</a> is dep=
endent on those files<br>
&gt;&gt; &gt; to build and this change is needed to meet that requirement.<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <a href=3D"https://github.com/openembedded/meta-openembedded/=
pull/597" rel=3D"noreferrer" target=3D"_blank">https://github.com/openembed=
ded/meta-openembedded/pull/597</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Willy Tu &lt;<a href=3D"mailto:wltu@google.com=
" target=3D"_blank">wltu@google.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 meta/recipes-connectivity/openssh/<a href=3D"http://ope=
nssh_9.0p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.0p1.bb</a> | =
11 +++++++++++<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 11 insertions(+)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-connectivity/openssh/<a href=3D"htt=
p://openssh_9.0p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.0p1.bb=
</a> b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.0p1.bb=
" rel=3D"noreferrer" target=3D"_blank">openssh_9.0p1.bb</a><br>
&gt;&gt; &gt; index b63ea2b137..84da118ca6 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-connectivity/openssh/<a href=3D"http://ope=
nssh_9.0p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.0p1.bb</a><br=
>
&gt;&gt; &gt; +++ b/meta/recipes-connectivity/openssh/<a href=3D"http://ope=
nssh_9.0p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.0p1.bb</a><br=
>
&gt;&gt; &gt; @@ -137,6 +137,17 @@ do_install:append () {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
${D}${sysconfdir}/init.d/sshd<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -D -m 0755 ${WORKDIR=
}/sshd_check_keys ${D}${libexecdir}/${BPN}/sshd_check_keys<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;DIST=
RO_FEATURES&#39;, &#39;opensshinternals&#39;, &#39;true&#39;, &#39;false&#3=
9;, d)}; then<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0insta=
ll -d ${D}${includedir}/ssh<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0insta=
ll -d ${D}${includedir}/ssh/openbsd-compat<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0insta=
ll -m0644 ${S}/*.h ${D}${includedir}/ssh<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0insta=
ll -m0644 ${S}/openbsd-compat/*.h ${D}${includedir}/ssh/openbsd-compat<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0insta=
ll -d ${D}${libdir}<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0insta=
ll -m0644 ${S}/libssh.a ${D}${libdir}<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0insta=
ll -m0644 ${S}/openbsd-compat/libopenbsd-compat.a ${D}${libdir}<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 do_install_ptest () {<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.37.2.789.g6183377224-goog<br>
&gt;&gt; &gt;<br>
</blockquote></div></div>

--000000000000de557705e95bdf5c--

