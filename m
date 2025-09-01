Return-Path: <logan.grosz@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAB9CA0FFF
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 15:11:00 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.54392.1756739456552201728
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 08:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ULHOVkXm;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: logan.grosz@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f646b1db8so4082840e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 08:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756739455; x=1757344255; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qh7FjvvhDx8Vx9EXVbIaeo4f5DYrj6X8j3nXzd6IlvE=;
        b=ULHOVkXmolAdAOmJUh3Qq/XVEwzTifRDR0aie4/NkvwET18pdknkncVEjOameoeGbV
         khbGoYjsSdirpXZ4zvJH+zk29Ee3FkCF1DtAVIM2EMN4i525vllrgMhMzYav9wAz+ayr
         I8y/tscmpK2PqdgbDEauTxv1/AqnfkxTKk98eqQ8lEWPw1LNOoeISAKvZ9rYLIb8xzh+
         loOV2e2v0pvuzMrUu5FP/OU8wWb319jcbCW9phF/vgjNG5+Jspru50xG71HJ3rsYVt+5
         3ApEjKzVvWldFG+y8vNpB5pt6frxXGQJdeCh5j0Z7SxsPcCZhCS2LI1HWHnslq1jfTm8
         yuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756739455; x=1757344255;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qh7FjvvhDx8Vx9EXVbIaeo4f5DYrj6X8j3nXzd6IlvE=;
        b=PU4E8w94fL7wEHjYF1xWLZX3EBHPomxndjRZWgEFb09F+Ytiz+yjFawINKoe0n6JCa
         3bCr0gwk/gt97gLCoy3QPUmTf4CuTpIYeEtuLj3zzRuCXd1G3z+YLD6XwF721Upn7a/R
         8X1dAJ5Ebz5nir5gm2E9CVjbPyBXrGUWUKB92Zqm+UckyebqI0+W6+FyWu6RWTFNqhjF
         FVpM0RGi3f/+R00/o/5gFjfCDtgerDQGW49uLYm3Pp7wro1Bt2g8ZE4G0RB/kFrApzbn
         WlfxNo69/ZjzHiPXrD9qUqKLNM6EfIVPkg2HDFuahBBgox+cBFN4neNyflXDRbOqvrbe
         6uYA==
X-Gm-Message-State: AOJu0Yx4aSNU+RipPRMUUSVL2okTRerw889B7zHSacZspfBmqs3ZPood
	lUq8pWv5+N61lXBX2FwvjpisWawQ47KsssMv6UYYNmPgmUEygDR8GBvPgf0EQGDvY6IEQZnV3F7
	k48T0Kx37TQ5jeBklw5OXmalDkx8Z4pc=
X-Gm-Gg: ASbGnctnsIjoqwZkq1cgQl172XJ/2/YZm/58Wx/yEVJC61gWromDgmI6BgRqbyE6Vse
	ggk+JUEk433QUy58w42/sTXDj56do22iW+eSqrbnz/BJCFp8dvNpG+3Qyz6TKZToYtTVwd7IOve
	TZxWJUUiHDrS7bYLtldA6wtuBSSAqPXd1onTAI+TdX7g9gzfNKHJpoEK2lOOmuMEJAy/aco6RV/
	qwXD/Db
X-Google-Smtp-Source: AGHT+IGiIy3rC2Q1Wbs2EPOE0NyQWuRYe2f9pEEQrG19/vbPdhH2O2qw88tzr4hubIixqggK6gmmMowZgXGw1yMpcXA=
X-Received: by 2002:ac2:4c50:0:b0:55f:394e:36 with SMTP id 2adb3069b0e04-55f70954e40mr2447558e87.47.1756739454046;
 Mon, 01 Sep 2025 08:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <Q8cx.1756482238242443264.LmeF@lists.openembedded.org> <CANNYZj9vDDxkC9KSfuY6G4mmY46GNTKcDs3cPnz6pR4E+-FuMQ@mail.gmail.com>
In-Reply-To: <CANNYZj9vDDxkC9KSfuY6G4mmY46GNTKcDs3cPnz6pR4E+-FuMQ@mail.gmail.com>
From: Logan Grosz <logan.grosz@gmail.com>
Date: Mon, 1 Sep 2025 09:10:42 -0600
X-Gm-Features: Ac12FXwvubnWgeW0fSvIEDilgD5Lmud3jxA-1VgEIHu50m5DYlSJHE-fh4n_rMs
Message-ID: <CANn=KGisAA8v9zEKGqs_A-bXVRHaVkq9iHhJGq_kzoQMvWb3TQ@mail.gmail.com>
Subject: Re: [OE-core] Port package-group-meta-filesystems fix to Kirkstone #kirkstone
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001f176d063dbec775"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 15:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222662

--0000000000001f176d063dbec775
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Done. Appreciate the pointer. Didn't realize this list was OE-Core only.

On Mon, Sep 1, 2025 at 3:55=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com>
wrote:

> You can propose a patch on openembedded-devel list. Prefix with [kirkston=
e]
>
> Alex
>
> On Fri, 29 Aug 2025 at 17:44, Logan Grosz via lists.openembedded.org
> <logan.grosz=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Hi, I was wondering if this patch ported to Kirkstone? I believe there
> is no workaround for this issue since `PACKAGE_ARCH` needs to be set
> _before_ inheriting `packagegroup.bbclass`.
> >
> >
> > From c67eab376bc4f5277f0f30356c11411b2f1272dc Mon Sep 17 00:00:00 2001
> > From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> > Date: Sun, 22 May 2022 20:23:18 +0200
> > Subject: [PATCH] packagegroup-meta-filesystems: fix build issue
> > The packagegroup has to be arch dependent to address build failure:
> > ERROR: packagegroup-meta-filesystems-1.0-r0 do_package_write_rpm: An
> allarch packagegroup shouldn't depend on packages which are dynamically
> renamed (fuse to libfuse2)
> > ERROR: packagegroup-meta-filesystems-1.0-r0 do_package_write_rpm: An
> allarch packagegroup shouldn't depend on packages which are dynamically
> renamed (fuse-dev to libfuse-dev)
> > Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../packageconfigs/packagegroup-meta-filesystems.bb              | 1 +
> >  1 file changed, 1 insertion(+)
> > diff --git a/meta-filesystems/recipes-filesystems/packageconfigs/
> packagegroup-meta-filesystems.bb
> b/meta-filesystems/recipes-filesystems/packageconfigs/
> packagegroup-meta-filesystems.bb
> > index 75591c31fa..1954b5979c 100644
> > --- a/meta-filesystems/recipes-filesystems/packageconfigs/
> packagegroup-meta-filesystems.bb
> > +++ b/meta-filesystems/recipes-filesystems/packageconfigs/
> packagegroup-meta-filesystems.bb
> > @@ -1,5 +1,6 @@
> >  SUMMARY =3D "Meta-filesystem packagegroups"
> >
> > +PACKAGE_ARCH =3D "${TUNE_PKGARCH}"
> >  inherit packagegroup
> >
> >  PROVIDES =3D "${PACKAGES}"
> > --
> > 2.48.1
> >
> >
> > Thanks!
> > Logan
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#222618):
> https://lists.openembedded.org/g/openembedded-core/message/222618
> > Mute This Topic: https://lists.openembedded.org/mt/114954434/1686489
> > Mute #kirkstone:
> https://lists.openembedded.org/g/openembedded-core/mutehashtag/kirkstone
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000001f176d063dbec775
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Done. Appreciate the pointer. Didn&#39;t realize this list=
 was OE-Core only.</div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 1, 2025 at 3:55=E2=80=
=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.=
kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;border-left-color:rgb(204,204,204);padding-left:1ex">You can propose =
a patch on openembedded-devel list. Prefix with [kirkstone]<br>
<br>
Alex<br>
<br>
On Fri, 29 Aug 2025 at 17:44, Logan Grosz via <a href=3D"http://lists.opene=
mbedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a=
><br>
&lt;logan.grosz=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" targe=
t=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi, I was wondering if this patch ported to Kirkstone? I believe there=
 is no workaround for this issue since `PACKAGE_ARCH` needs to be set _befo=
re_ inheriting `packagegroup.bbclass`.<br>
&gt;<br>
&gt;<br>
&gt; From c67eab376bc4f5277f0f30356c11411b2f1272dc Mon Sep 17 00:00:00 2001=
<br>
&gt; From: Vyacheslav Yurkov &lt;<a href=3D"mailto:Vyacheslav.Yurkov@bruker=
.com" target=3D"_blank">Vyacheslav.Yurkov@bruker.com</a>&gt;<br>
&gt; Date: Sun, 22 May 2022 20:23:18 +0200<br>
&gt; Subject: [PATCH] packagegroup-meta-filesystems: fix build issue<br>
&gt; The packagegroup has to be arch dependent to address build failure:<br=
>
&gt; ERROR: packagegroup-meta-filesystems-1.0-r0 do_package_write_rpm: An a=
llarch packagegroup shouldn&#39;t depend on packages which are dynamically =
renamed (fuse to libfuse2)<br>
&gt; ERROR: packagegroup-meta-filesystems-1.0-r0 do_package_write_rpm: An a=
llarch packagegroup shouldn&#39;t depend on packages which are dynamically =
renamed (fuse-dev to libfuse-dev)<br>
&gt; Signed-off-by: Vyacheslav Yurkov &lt;<a href=3D"mailto:Vyacheslav.Yurk=
ov@bruker.com" target=3D"_blank">Vyacheslav.Yurkov@bruker.com</a>&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../packageconfigs/<a href=3D"http://packagegroup-meta-filesyste=
ms.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-filesystems.b=
b</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; diff --git a/meta-filesystems/recipes-filesystems/packageconfigs/<a hr=
ef=3D"http://packagegroup-meta-filesystems.bb" rel=3D"noreferrer" target=3D=
"_blank">packagegroup-meta-filesystems.bb</a> b/meta-filesystems/recipes-fi=
lesystems/packageconfigs/<a href=3D"http://packagegroup-meta-filesystems.bb=
" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-filesystems.bb</a>=
<br>
&gt; index 75591c31fa..1954b5979c 100644<br>
&gt; --- a/meta-filesystems/recipes-filesystems/packageconfigs/<a href=3D"h=
ttp://packagegroup-meta-filesystems.bb" rel=3D"noreferrer" target=3D"_blank=
">packagegroup-meta-filesystems.bb</a><br>
&gt; +++ b/meta-filesystems/recipes-filesystems/packageconfigs/<a href=3D"h=
ttp://packagegroup-meta-filesystems.bb" rel=3D"noreferrer" target=3D"_blank=
">packagegroup-meta-filesystems.bb</a><br>
&gt; @@ -1,5 +1,6 @@<br>
&gt;=C2=A0 SUMMARY =3D &quot;Meta-filesystem packagegroups&quot;<br>
&gt;<br>
&gt; +PACKAGE_ARCH =3D &quot;${TUNE_PKGARCH}&quot;<br>
&gt;=C2=A0 inherit packagegroup<br>
&gt;<br>
&gt;=C2=A0 PROVIDES =3D &quot;${PACKAGES}&quot;<br>
&gt; --<br>
&gt; 2.48.1<br>
&gt;<br>
&gt;<br>
&gt; Thanks!<br>
&gt; Logan<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#222618): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/222618" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/222618</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11495443=
4/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/114954434/1686489</a><br>
&gt; Mute #kirkstone:<a href=3D"https://lists.openembedded.org/g/openembedd=
ed-core/mutehashtag/kirkstone" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-core/mutehashtag/kirkstone</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000001f176d063dbec775--

