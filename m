Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42FAC54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 12:13:48 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.10362.1709727225858977749
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 04:13:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=Gjr7ZuB4;
 spf=pass (domain: ossystems.com.br, ip: 209.85.128.173, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-60978479651so63875687b3.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 04:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1709727225; x=1710332025; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+/A4MmMbIG3pjj5qx+ijChCEMQnHxNhl2Uq8v9k3tK4=;
        b=Gjr7ZuB4tP2qaUaUY9MXxz6KlGNu3+KVN1uyOtfQ0rBDNsVChROWwYfOlrMbR6AYnv
         WNaHNtdVw6/EUHgRQpMGsf0S6yPmvMtvv7PrgyEdO/O1F1GAaE10xx+1uncgpOx5vJzg
         deiq5hCNIAtvc3kw9Bhbe2fAqAvlsHEQIxlboNpX34XL8iP8Qy+lyRDpuXFRUZxH53cO
         eeBa9HPgRjKhUgsy8gRDNTDkBV95NfKGUn9KcY5bjtZEKB4icQPYlOGW2qAd3TO9yVI2
         r5SIRrX0leZ248GQ+TtJ0aA/R7L+Ktdl8QgDMnYq2gP2Hh+6bSR3jSvPLORnfO9c0dUH
         d61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709727225; x=1710332025;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+/A4MmMbIG3pjj5qx+ijChCEMQnHxNhl2Uq8v9k3tK4=;
        b=P4Ag+krRO4aMwX2vfUYoLJuGMGOGGdRzwKvvk8R2wVThn6ZZVx/j4Zv1uBUzdayzJf
         NtNToxK4lFwRBS2wGD63nHx/REharvD0YSoyNXBrgDm6svnVxVyS4Udyp0MrApQ39OxO
         Y0nBmLOcBbtHgMQ63cm3cTrDSVsNgHfG7bw+QfbXqhtHq+C9aZk0bpbAljr8S87qdled
         qd7diNiJ8kkskHADOBzCymjnNrjEllTkpcxLOIvCBtGAghlfsBM70UJGYZwpW9+sIxHM
         2gEOsnw3lHZWULmPWhxI5J/mYYo8PnDQ1C4DsylrXlViye96VAJyqy4bnRuOY3/bWuv/
         IPSA==
X-Forwarded-Encrypted: i=1; AJvYcCX07fCTHbFfn7n32TSeec9V4FFyyzZqhSppePY6pHQklYbWoPUWsAkZt35+m/IR1qvF2ntBX1V07drFIqZoD1m6uNC0oZWrGU5+NRHEIzqlZyq2Tc3t7olC
X-Gm-Message-State: AOJu0YzaSbUXLvVcgtnHh2TfbYeoyQiYzjy39BBCI1i09JUIRzS8Ywa6
	iVz+E8R4a4fqtMFY9aEcqIA0V1uLlblWqVmOsTaL78pic3PoCbUBbknHuJdn9aEs3YPMO3+vkJ5
	EJoOgOA==
X-Google-Smtp-Source: AGHT+IE7pzgJRsXYBO+jo55rJlnd3hg6aDcM4WOEcIpsnVdbpfc22WA69xlYhccsNq7W+2+WOx3lbQ==
X-Received: by 2002:a81:98d2:0:b0:608:a004:13f4 with SMTP id p201-20020a8198d2000000b00608a00413f4mr14614269ywg.47.1709727224468;
        Wed, 06 Mar 2024 04:13:44 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id u125-20020a816083000000b006078f8caa68sm3696186ywb.71.2024.03.06.04.13.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 04:13:43 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-60978479651so63875387b3.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 04:13:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXSowMIoz4qkhvxhvuKWqrmev43+hY4HEBmFqBGzbeKQlxiPo9vAfFc4XPHrU4pEv+4Vc1CF/4tS9PceVqGgQi/7k5qy49z99AcGZo7Qg0jsS/1HR4X04wA
X-Received: by 2002:a81:98d2:0:b0:608:a004:13f4 with SMTP id
 p201-20020a8198d2000000b00608a00413f4mr14614228ywg.47.1709727223491; Wed, 06
 Mar 2024 04:13:43 -0800 (PST)
MIME-Version: 1.0
References: <20240305203608.3039688-1-tom.hochstein@nxp.com> <3b991e85a5ee7b24c728c3bf59906dc44c756385.camel@linuxfoundation.org>
In-Reply-To: <3b991e85a5ee7b24c728c3bf59906dc44c756385.camel@linuxfoundation.org>
Date: Wed, 6 Mar 2024 09:13:30 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrUcNXcEQFAzPy77jS7uYPJ0Lx56pQzfVzTMescPnsYvw@mail.gmail.com>
Message-ID: <CAP9ODKrUcNXcEQFAzPy77jS7uYPJ0Lx56pQzfVzTMescPnsYvw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bmaptool: Add bmap-tools alias for compatibility
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Tom Hochstein <tom.hochstein@nxp.com>, openembedded-core@lists.openembedded.org, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: multipart/alternative; boundary="000000000000d1bb120612fce357"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 12:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196669

--000000000000d1bb120612fce357
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 5 de mar. de 2024 =C3=A0s 21:06, Richard Purdie <
richard.purdie@linuxfoundation.org> escreveu:

> On Tue, 2024-03-05 at 14:36 -0600, Tom Hochstein wrote:
> > The rename of bmap-tools to bmaptool creates an incompatibility for
> > pre-scarthgap layers. Restore compatibility by adding bmap-tools as
> > an alias.
> >
> > Acked-by: Otavio Salvador <otavio@ossystems.com.br>
> > Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> > ---
> >  meta/recipes-support/bmaptool/bmaptool_git.bb | 8 ++++++++
> >  1 file changed, 8 insertions(+)
>
> Perhaps we should just drop nanbield from the layer series instead as
> we're about to do that anyway?
>
> I'm worried this will just mask things and stop people renaming :/.
>

I understand your point of view, but it is a must for package feeds, or it
will break them.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000d1bb120612fce357
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em ter., 5 de mar. de 2024 =C3=A0s 21=
:06, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.or=
g" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; escreveu:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2024-03-0=
5 at 14:36 -0600, Tom Hochstein wrote:<br>
&gt; The rename of bmap-tools to bmaptool creates an incompatibility for<br=
>
&gt; pre-scarthgap layers. Restore compatibility by adding bmap-tools as<br=
>
&gt; an alias.<br>
&gt; <br>
&gt; Acked-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r" target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
&gt; Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@nxp.c=
om" target=3D"_blank">tom.hochstein@nxp.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-support/bmaptool/<a href=3D"http://bmaptool_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">bmaptool_git.bb</a> | 8 ++++++++<br>
&gt; =C2=A01 file changed, 8 insertions(+)<br>
<br>
Perhaps we should just drop nanbield from the layer series instead as<br>
we&#39;re about to do that anyway?<br>
<br>
I&#39;m worried this will just mask things and stop people renaming :/.<br>=
</blockquote><div><br></div><div>I understand your point of view, but it is=
 a must for package feeds, or it will break them.=C2=A0</div></div><div><br=
></div><span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr=
" class=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Sys=
tems<br><a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://ww=
w.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.os=
systems.com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>Mobil=
e: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) =
903-9750</div></div>

--000000000000d1bb120612fce357--

