Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34380C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 12:48:49 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.10950.1709729325034786127
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 04:48:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=UUVkSRVw;
 spf=pass (domain: ossystems.com.br, ip: 209.85.128.171, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-607c5679842so69114337b3.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 04:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1709729324; x=1710334124; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5WoqSI2x5mDQcGO/1N2rkKVNEmLdQytSIfhKlUq+t8s=;
        b=UUVkSRVwHat1qiAEf4gzQDoqNmkCRKpWw3rYnEdhEc7HpeB1fmNtFrknzNvzAnH7T9
         OOLibjDrHyte3MMICVFxiZMz3hfARuVznDFh9rjpqI6Z4WdImFB/E0vtRdEhZgWnzg73
         ET/nCaoki+yAvnI5/5m3RvqupCeDJfvVPV+XuFKvpG4RULINfnqR5ZkX8DTb0dt4yOgP
         AP8V5nwU2URSDVhuRezzotni/HHDToOz0Uc8T+MFKwqbbwpSRjSM/H3Jy++T6TcWMY3o
         YLv5lIKDtvXUEoqSIOOXIWaSOauwFS2wYNZsFEQ3VEaqnotEpqhqM2hSYgg6BS60D7hT
         RFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709729324; x=1710334124;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WoqSI2x5mDQcGO/1N2rkKVNEmLdQytSIfhKlUq+t8s=;
        b=XhtT6hgBmiBJDDxOtG6ZZekbrgwWDP+rHe3+Z6UXc6yJByBkVBi2ig2e8hK/33iXml
         LUnvikcm8t7V37NiajOx2PD1bnA0UYM8LUuXxAmTEhwoZj06emUtBYdZSpZH3c7SvP1s
         Dm0BQZ07+WO2Mt5rp3nFMOqNEFY4nGiqXYb6O5iQKcnjFMStz7ocwdIzxYnsehJvhfln
         xUoPHtVO+7hCukPwhvuPsHVprvdPt/UgQpLTgm9H7tAtPY3jGpwZ1oePUrtayshyYN0M
         TBBvTEeIPXiedEHNNzEwW55sk/fKRjNsmGpLqJaqTIa024JoeDchQsRgr2GXgfmV3ne8
         ZX5g==
X-Forwarded-Encrypted: i=1; AJvYcCXBvw5S8/C32j5MuHwGJrBSJYqcKuFVNRL+VpQzKMje46COd4bfAVRftXbkp7fRzhtWLG9yYwh45MwTuYQbCAgt7O8XMcISLlmrR635ApcELSSr2G0Ic2di
X-Gm-Message-State: AOJu0Yymt1lVUW9v34nZWvsIOliO46XFxmfA1TybjRY2H1nPYqwAQ4vi
	+Hy9CLZBYL063d8NayRwQdGhI9oMR/uSK/6IvMmRqwzvxaPwXlgrp3jigaQOSBr1xxhrOfWSCpl
	B8Ng39g==
X-Google-Smtp-Source: AGHT+IF7zYcifVf8m1Lh5nE0uHVFgYIhC98yFdi7ELQ1Uk/dtiEBUL5vXNm1Z86zk0ZWzkbbbE98Aw==
X-Received: by 2002:a0d:fc83:0:b0:5fb:da77:af07 with SMTP id m125-20020a0dfc83000000b005fbda77af07mr15237209ywf.32.1709729323879;
        Wed, 06 Mar 2024 04:48:43 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id z131-20020a0dd789000000b0060983ceb487sm2969537ywd.28.2024.03.06.04.48.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 04:48:43 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso7081613276.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 04:48:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWeww4oWCauHOspsZSp2KkFzqol7Vx3tpWWdRQFaBTs/ifPr/kVWrtfMfmk4lBhIOYfzLAPftfM7oz6Vc7WnIOJJka2zFTk9XrWzDh0m7Q+WYciCamK5o7q
X-Received: by 2002:a25:b0a:0:b0:dcc:f3fe:19c with SMTP id 10-20020a250b0a000000b00dccf3fe019cmr12956375ybl.59.1709729322814;
 Wed, 06 Mar 2024 04:48:42 -0800 (PST)
MIME-Version: 1.0
References: <20240305203608.3039688-1-tom.hochstein@nxp.com>
 <3b991e85a5ee7b24c728c3bf59906dc44c756385.camel@linuxfoundation.org>
 <CAP9ODKrUcNXcEQFAzPy77jS7uYPJ0Lx56pQzfVzTMescPnsYvw@mail.gmail.com> <0331b56aadffd139fca065008a38e7784a3e06df.camel@linuxfoundation.org>
In-Reply-To: <0331b56aadffd139fca065008a38e7784a3e06df.camel@linuxfoundation.org>
Date: Wed, 6 Mar 2024 09:48:30 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp1sK65kaejiHMm5TS4=e0bbCC2Da9HrBoN=c88wF6dbQ@mail.gmail.com>
Message-ID: <CAP9ODKp1sK65kaejiHMm5TS4=e0bbCC2Da9HrBoN=c88wF6dbQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bmaptool: Add bmap-tools alias for compatibility
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Tom Hochstein <tom.hochstein@nxp.com>, openembedded-core@lists.openembedded.org, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: multipart/alternative; boundary="000000000000f2dde50612fd60d6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 12:48:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196674

--000000000000f2dde50612fd60d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 6 de mar. de 2024 =C3=A0s 09:36, Richard Purdie <
richard.purdie@linuxfoundation.org> escreveu:

> On Wed, 2024-03-06 at 09:13 -0300, Otavio Salvador wrote:
> > Em ter., 5 de mar. de 2024 =C3=A0s 21:06, Richard Purdie
> > <richard.purdie@linuxfoundation.org> escreveu:
> > > On Tue, 2024-03-05 at 14:36 -0600, Tom Hochstein wrote:
> > > > The rename of bmap-tools to bmaptool creates an incompatibility
> > > > for
> > > > pre-scarthgap layers. Restore compatibility by adding bmap-tools
> > > > as
> > > > an alias.
> > > >
> > > > Acked-by: Otavio Salvador <otavio@ossystems.com.br>
> > > > Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> > > > ---
> > > >  meta/recipes-support/bmaptool/bmaptool_git.bb | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > >
> > > Perhaps we should just drop nanbield from the layer series instead
> > > as
> > > we're about to do that anyway?
> > >
> > > I'm worried this will just mask things and stop people renaming :/.
> > >
> >
> > I understand your point of view, but it is a must for package feeds,
> > or it will break them.
>
> You need the R* changes for that which is fair enough but you do not
> the PROVIDES...
>

Sure, but since we're late on release, it would be helpful to maintain
compatibility.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000f2dde50612fd60d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em qua., 6 de mar. de 2024 =C3=A0s 09=
:36, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.or=
g">richard.purdie@linuxfoundation.org</a>&gt; escreveu:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Wed, 2024-03-06 at 09:13 -0300, =
Otavio Salvador wrote:<br>&gt; Em ter., 5 de mar. de 2024 =C3=A0s 21:06, Ri=
chard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; escreveu:<br>
&gt; &gt; On Tue, 2024-03-05 at 14:36 -0600, Tom Hochstein wrote:<br>
&gt; &gt; &gt; The rename of bmap-tools to bmaptool creates an incompatibil=
ity<br>
&gt; &gt; &gt; for<br>
&gt; &gt; &gt; pre-scarthgap layers. Restore compatibility by adding bmap-t=
ools<br>
&gt; &gt; &gt; as<br>
&gt; &gt; &gt; an alias.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Acked-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossys=
tems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.hochs=
tein@nxp.com" target=3D"_blank">tom.hochstein@nxp.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; =C2=A0meta/recipes-support/bmaptool/<a href=3D"http://bmapto=
ol_git.bb" rel=3D"noreferrer" target=3D"_blank">bmaptool_git.bb</a> | 8 +++=
+++++<br>
&gt; &gt; &gt; =C2=A01 file changed, 8 insertions(+)<br>
&gt; &gt; <br>
&gt; &gt; Perhaps we should just drop nanbield from the layer series instea=
d<br>
&gt; &gt; as<br>
&gt; &gt; we&#39;re about to do that anyway?<br>
&gt; &gt; <br>
&gt; &gt; I&#39;m worried this will just mask things and stop people renami=
ng :/.<br>
&gt; &gt; <br>
&gt; <br>&gt; I understand your point of view, but it is a must for package=
 feeds,<br>
&gt; or it will break them.=C2=A0<br>
<br>
You need the R* changes for that which is fair enough but you do not<br>
the PROVIDES...<br></blockquote><div><br></div><div>Sure, but since we&#39;=
re late on release, it would be helpful to maintain compatibility.</div><di=
v>=C2=A0=C2=A0</div></div><span class=3D"gmail_signature_prefix">-- </span>=
<br><div dir=3D"ltr" class=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" targe=
t=3D"_blank">http://www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a =
href=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.ossyste=
ms.com.br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Mobile: +1 (347) 903-9750</div></div>

--000000000000f2dde50612fd60d6--

