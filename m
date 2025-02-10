Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6FCC0219E
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 18:20:31 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.59412.1739211625225329944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 10:20:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=GtBGiE1s;
 spf=pass (domain: snapchat.com, ip: 209.85.218.47, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab7d7f0a2cfso49743366b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 10:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1739211623; x=1739816423; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F3vprqaGWlZnWPrc3uy++OGpmWeJ3tChyw8IzIOsezc=;
        b=GtBGiE1sbTiqcVf6Ou5sFOUrcmSY2NJGFBzNrB38TxEJiuXyxBjkdRmB/GyBxnw3ef
         Tc6BY9MLkhry7IvW641rVSUZChJAspHXFgN2+kSI8lx8bPF4B+J+V3I648eeBI87sqOf
         L+gzrHX3xHfxDTDdchfAaaNs8hAbXsLgbtRLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211623; x=1739816423;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F3vprqaGWlZnWPrc3uy++OGpmWeJ3tChyw8IzIOsezc=;
        b=jkNQXSxIUoD0jmBGbtmOxhQzR89DtyDHIc7wXOyAIzH0MsL4ohOzAX4L5zDjo8pIUI
         FtlTL7tOlPbZHla6C3NwpdUgU8vefo0ruogkosMJ1fNzMgD+6MBNCBXKOsBK8CwXdCez
         b2WeeoLZVukozbymXUXaHqHenmjAEnbm+w1eIh2VpgbIRpw2TB8smcZnMk4VTqLcVmZZ
         K/8RgjDdOkT1G8Uxf4tZS/MtPzTR7ct+P+I+d7rqmGcpw4b09FGKRaKYc+f9RZWtLgaa
         SbmRdLMNwEpJw3iMfjGwjqD7Pb09tl/EqI8IwbTrFGvwlxvw9FrNDf8gTPWcZjflQVXN
         D6Mg==
X-Forwarded-Encrypted: i=1; AJvYcCV31O9WdWZbhBxv20BwIfs21P+F1QPGeSoCFW10hKwZ1Gk0/FqantLWPVzK3VHsbHNJfWLsthTEd8g8OAXxKiz6DA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxP2VdKuxg17gTz7ZbFMFdim5/2+lgTrQdFA5Le+9XKvq0BFlSJ
	UPlVbPDSWMfrl6/zAyvsG7q6UqZhlv+HW16nCNh4QQdIyRmo08a/GMLcSEjxzZo2EJyL8mci1ks
	iZOPrachyAAoBK9ZTs8G+4r3ggRjIwCr1PivJqw==
X-Gm-Gg: ASbGncuv3PreB0quv03fgn188vSwPvc+HJC+0s2PxGX2Ij6yvkoxErNHai9KtLz/Pc3
	VJjHwLzl34lqvsqcBsfc4HZfjdKea+iyc8Fwq3aZ/JM56f5AdB0tYMo/WNpmQ5ALjc2Km29P/
X-Google-Smtp-Source: AGHT+IHHf5RjqAQTlg6IGDnWdushHDVZrPt64uBcio0hZYBOmuHuAZK2onXYbyX4uhr3C0GP27P/wKcJbRxg8Ekoq0A=
X-Received: by 2002:a17:907:3d9f:b0:ab7:9b86:598d with SMTP id
 a640c23a62f3a-ab79b865ac9mr996435566b.17.1739211623397; Mon, 10 Feb 2025
 10:20:23 -0800 (PST)
MIME-Version: 1.0
References: <20250210154958.1119250-1-ecordonnier@snap.com>
 <1745112bfecddf072b229f0c0b26fcb3d96fc053.camel@linuxfoundation.org> <CAMKF1sq0ooW+T2m72grkMRH5nOiuuASx=-t+oEfwkqjzv=NpwQ@mail.gmail.com>
In-Reply-To: <CAMKF1sq0ooW+T2m72grkMRH5nOiuuASx=-t+oEfwkqjzv=NpwQ@mail.gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 10 Feb 2025 19:20:12 +0100
X-Gm-Features: AWEUYZnWuH9v5IDMPfMnvsVVIUQ2rcf6SNRBAqim64PjKqgiiWIGZbaXvAJTMto
Message-ID: <CAHUKmYat9dcVK=aHmJ0mWMZSiQ6CdkZhOtRVfrgFbZWOF=RZHg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gdb-cross: remove duplicated PACKAGECONFIG
To: Khem Raj <raj.khem@gmail.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000000b2d7062dcdc368"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 18:20:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211115

--00000000000000b2d7062dcdc368
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> To be clear, this change adds:
>
> ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'xz', '', d)}
>
> to the default PACKAGECONFIG for gdb-cross. You can't tell that from
> the patch.

That's what I was referring to in the commit message with "This enables xz
for gdb-cross as side-effect.", but I've reworded it now so that it is
hopefully clearer.
I've sent a new version of the patch as "[PATCH v2] gdb: enable xz in
gdb-cross and gdb-cross-canadian"

=C3=89tienne

On Mon, Feb 10, 2025 at 6:31=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> On Mon, Feb 10, 2025 at 8:21=E2=80=AFAM Richard Purdie via
> lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> >
> > On Mon, 2025-02-10 at 16:49 +0100, Etienne Cordonnier via
> lists.openembedded.org wrote:
> > > From: Etienne Cordonnier <ecordonnier@snap.com>
> > >
> > > Duplicating the PACKAGECONFIG variable in gdb-cross and gdb-common
> makes
> > > it easy to forget updating one definition without updating the other.
> > > However at the moment there is no need for two different definitions.
> > >
> > > xz is also useful for gdb-cross when minidebuginfo is enabled, so it
> also needs
> > > to be in the definition of PACKAGECONFIG in gdb-cross.inc
> > >
> > > Let's remove the definition from gdb-cross.inc to make maintenance
> easier.
> > > This enables xz for gdb-cross as side-effect.
> > >
> > > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> > > ---
> > >  meta/recipes-devtools/gdb/gdb-cross.inc | 1 -
> > >  1 file changed, 1 deletion(-)
> >
> > At the very least this commit message needs to be a bit clearer as
> > there is a change of behaviour here.
> >
> > To be clear, this change adds:
> >
> > ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'xz', '', d)}
> >
> > to the default PACKAGECONFIG for gdb-cross. You can't tell that from
> > the patch.
> >
> > I'd also mention that there is still a different definition for gdb-
> > cross-canadian and if we do this, they should all probably match.
> >
> > Whether we should do this, I'm unsure. It might be worth just adding xz
> > unconditionally at this point by default to be honest, it isn't a huge
> > dependency. gdb is a debugging tool, not for a minimal system.
>
> target gdb where the size and dependencies might matter, for cross and
> cross-canadian
> IIRC it won't matter as much from size perspective. we can let the
> defaults be controlled from
> bb itself or from inc and then add/remove as needed in bb files.
> Status quo is a mix of both
> so we should do something. Perhaps this patch with updated commit log
> is a good one
>
> >
> > Cheers,
> >
> > Richard
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#211104):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_211104&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DB9ScRVJzxS9xTwss3tO6LOaEc25WeGEM_0kgqZqT1CxQ8-mnKsbdAMJWNa1exXOj&s=3D6q0=
oPee_RTrM7WSHcfvWsw3iIjGaAulZ0SKtycMXofQ&e=3D
> > Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_111104210_1997914&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DB9ScRVJzxS9xT=
wss3tO6LOaEc25WeGEM_0kgqZqT1CxQ8-mnKsbdAMJWNa1exXOj&s=3DyfjmYBaSzY87H0_XcTS=
-BwM3HH6O9x6XrowE4qs0AiE&e=3D
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DB9ScRV=
JzxS9xTwss3tO6LOaEc25WeGEM_0kgqZqT1CxQ8-mnKsbdAMJWNa1exXOj&s=3DLzjhLaGMsXHO=
9k8oG2EZBslP7bQuVNQresguoGJre7E&e=3D
> [raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000000b2d7062dcdc368
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; To be clear, this change adds:<br>&gt;<br>&gt; ${@bb.=
utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;minidebuginfo&#39;, &#39;xz&=
#39;, &#39;&#39;, d)}<br>&gt;<br>&gt; to the default PACKAGECONFIG for gdb-=
cross. You can&#39;t tell that from<br>&gt; the patch.<br><br>That&#39;s wh=
at I was referring to in the commit message with &quot;This enables xz for =
gdb-cross as side-effect.&quot;, but I&#39;ve reworded it now so that it is=
 hopefully clearer.<br>I&#39;ve sent a new version of the patch as &quot;[P=
ATCH v2] gdb: enable xz in gdb-cross and gdb-cross-canadian&quot;<br><br>=
=C3=89tienne</div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 10, 2025 at 6:31=E2=80=AFPM K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon,=
 Feb 10, 2025 at 8:21=E2=80=AFAM Richard Purdie via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;richard.purdie=3D<a href=3D"mailto:linuxfoundation.org@lists.openembedd=
ed.org" target=3D"_blank">linuxfoundation.org@lists.openembedded.org</a>&gt=
; wrote:<br>
&gt;<br>
&gt; On Mon, 2025-02-10 at 16:49 +0100, Etienne Cordonnier via <a href=3D"h=
ttp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.op=
enembedded.org</a> wrote:<br>
&gt; &gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.c=
om" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Duplicating the PACKAGECONFIG variable in gdb-cross and gdb-commo=
n makes<br>
&gt; &gt; it easy to forget updating one definition without updating the ot=
her.<br>
&gt; &gt; However at the moment there is no need for two different definiti=
ons.<br>
&gt; &gt;<br>
&gt; &gt; xz is also useful for gdb-cross when minidebuginfo is enabled, so=
 it also needs<br>
&gt; &gt; to be in the definition of PACKAGECONFIG in gdb-cross.inc<br>
&gt; &gt;<br>
&gt; &gt; Let&#39;s remove the definition from gdb-cross.inc to make mainte=
nance easier.<br>
&gt; &gt; This enables xz for gdb-cross as side-effect.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonni=
er@snap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/gdb/gdb-cross.inc | 1 -<br>
&gt; &gt;=C2=A0 1 file changed, 1 deletion(-)<br>
&gt;<br>
&gt; At the very least this commit message needs to be a bit clearer as<br>
&gt; there is a change of behaviour here.<br>
&gt;<br>
&gt; To be clear, this change adds:<br>
&gt;<br>
&gt; ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;minidebuginfo&#39=
;, &#39;xz&#39;, &#39;&#39;, d)}<br>
&gt;<br>
&gt; to the default PACKAGECONFIG for gdb-cross. You can&#39;t tell that fr=
om<br>
&gt; the patch.<br>
&gt;<br>
&gt; I&#39;d also mention that there is still a different definition for gd=
b-<br>
&gt; cross-canadian and if we do this, they should all probably match.<br>
&gt;<br>
&gt; Whether we should do this, I&#39;m unsure. It might be worth just addi=
ng xz<br>
&gt; unconditionally at this point by default to be honest, it isn&#39;t a =
huge<br>
&gt; dependency. gdb is a debugging tool, not for a minimal system.<br>
<br>
target gdb where the size and dependencies might matter, for cross and<br>
cross-canadian<br>
IIRC it won&#39;t matter as much from size perspective. we can let the<br>
defaults be controlled from<br>
bb itself or from inc and then add/remove as needed in bb files.<br>
Status quo is a mix of both<br>
so we should do something. Perhaps this patch with updated commit log<br>
is a good one<br>
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#211104): <a href=3D"https://urldefense.proofpoint.=
com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_messa=
ge_211104&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdi=
w&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DB9ScRVJzxS9xT=
wss3tO6LOaEc25WeGEM_0kgqZqT1CxQ8-mnKsbdAMJWNa1exXOj&amp;s=3D6q0oPee_RTrM7WS=
HcfvWsw3iIjGaAulZ0SKtycMXofQ&amp;e=3D" rel=3D"noreferrer" target=3D"_blank"=
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.=
org_g_openembedded-2Dcore_message_211104&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTv=
jIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUk=
SGa66m67E&amp;m=3DB9ScRVJzxS9xTwss3tO6LOaEc25WeGEM_0kgqZqT1CxQ8-mnKsbdAMJWN=
a1exXOj&amp;s=3D6q0oPee_RTrM7WSHcfvWsw3iIjGaAulZ0SKtycMXofQ&amp;e=3D</a> <b=
r>
&gt; Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__lists.openembedded.org_mt_111104210_1997914&amp;d=3DDwIFaQ&amp=
;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Q=
j9TsRih1DULJTKUkSGa66m67E&amp;m=3DB9ScRVJzxS9xTwss3tO6LOaEc25WeGEM_0kgqZqT1=
CxQ8-mnKsbdAMJWNa1exXOj&amp;s=3DyfjmYBaSzY87H0_XcTS-BwM3HH6O9x6XrowE4qs0AiE=
&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoi=
nt.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_111104210_1997914&amp=
;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhk=
bNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DB9ScRVJzxS9xTwss3tO6LOaEc2=
5WeGEM_0kgqZqT1CxQ8-mnKsbdAMJWNa1exXOj&amp;s=3DyfjmYBaSzY87H0_XcTS-BwM3HH6O=
9x6XrowE4qs0AiE&amp;e=3D</a> <br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dh=
ttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&=
amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfP=
x_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DB9ScRVJzxS9xTwss3tO6LOaEc25WeGEM_0kgqZ=
qT1CxQ8-mnKsbdAMJWNa1exXOj&amp;s=3DLzjhLaGMsXHO9k8oG2EZBslP7bQuVNQresguoGJr=
e7E&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proof=
point.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore=
_unsub&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&a=
mp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DB9ScRVJzxS9xTwss=
3tO6LOaEc25WeGEM_0kgqZqT1CxQ8-mnKsbdAMJWNa1exXOj&amp;s=3DLzjhLaGMsXHO9k8oG2=
EZBslP7bQuVNQresguoGJre7E&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000000b2d7062dcdc368--

