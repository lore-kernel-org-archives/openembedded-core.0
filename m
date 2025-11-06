Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C574BCCFA03
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 10:32:46 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11625.1762425156494196184
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 02:32:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EDRqWsEi;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso758533f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 02:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762425155; x=1763029955; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d5aF0VKaSw7tlKh3oevSvw3U0kbd1zS1uzAlbSKN0uE=;
        b=EDRqWsEiT6qWZnafZrhl5EeyD9gi9XCUf4QRdi4Z+lPDJJEEFz2PVNMnfKYfjnlUZF
         UFgYP/ThFSfPmozonXSgJDNyMHaF2cbhe9qkNuxNlcrYxkTo0XxtCkEBUQP9WgGHOWNV
         MehECT9Vpb7EwZLlnGuK6VRODOGXNlYe8qZck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762425155; x=1763029955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5aF0VKaSw7tlKh3oevSvw3U0kbd1zS1uzAlbSKN0uE=;
        b=Kkb7ETDLq7nqjH/G7mThGTwdWJFP2OqGhyISGus/H9IpIedr233/oywqQUl/a3eHem
         qGZVWVZMkTy7t5Ax2/1zQUtKdQe4LjM28Ws4U4oxPu/8Nn8pO5FrQO1v881yWtHbWhaw
         oETtHG5LC5fXYle6yDBJ2VmsOR8tURF4g5gWArF9aHa4KsjuCHJOjIdEtoY34e74SF3n
         pZ4DoT29ISfN/5SEPGqZTJjHAcl9OM0i4chpiq8Rs97oRQhbSuEzpexopEXFth0JrGH6
         EorsNKeqYop1wsQdsup4Z+1VX+GxtZyC7K+u+Ae6/dlBwMj+LU3O6YjY2n7mE1Ggj/I/
         hs3w==
X-Forwarded-Encrypted: i=1; AJvYcCXJgFsMGrxEVRMsnPtoUSz+7H5XwU94ktX2VaVQRyvEVQIg5DzRD+k6bJjH8X9eIzmzS6kUVNFVzUAqXXc7gkEY9A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyWDozPd4iZ0LK5EmL6zgLmh9hsN5Gn0t3OlJUS6iG1/Lo5B4Ga
	ATHFKw4uN8tvetZo/EcumhomYd0XEcn+ehx9IXwjFCCPKYyVBNc0Dw98VN9XjWJL8atZNN3cb8G
	0VELoftYKA7w11Y5/0LaaOKVYrXwk6ldLEseKO50vHQ==
X-Gm-Gg: ASbGncuKdq8egclxcht5uN6W1LWg40z88dVpREhASO/bNKb+K91T/S3SkJRrzFCJ6rp
	gZ3bkNsXo+1K7YpjepAzR2ApYRWVLD+BqvjTqzC4SoBgIdOoL9+nK7CwBE/hBqEx+XZp6Fn4k0B
	OiWHGTHOZotwOBJRdhE2D3zYuHNN9dIdebbNJUQi3VIcUzMQHnEmska4Atm51NLXRTK7TW/zWmR
	soUskdntAGk1HCUgPJm7q9Iwkxf9tLYl3crNdlRLz+3bLeq+AN95IlRoavsbR3XmbPz6Skh3v63
	IFRJkCnZbvQEq0DXtm4=
X-Google-Smtp-Source: AGHT+IFOciUg3/KcsGQsms7qlzUsspp8wxZPBc6j0Yo9YVM9F4ADwfH/qLmaBSw9S1dF9W+aL+GgA65dK2mqf6s0Uz0=
X-Received: by 2002:a05:6000:184f:b0:429:d2d2:5047 with SMTP id
 ffacd0b85a97d-429e32cc2abmr5482168f8f.10.1762425154796; Thu, 06 Nov 2025
 02:32:34 -0800 (PST)
MIME-Version: 1.0
References: <20251105232333.2800541-1-yoann.congal@smile.fr>
 <CAJdd5Ga4O9AWOCg=NrOnwdd_m_u24L4OS+cqB0ojmT39zFhj1A@mail.gmail.com>
 <CAMSfU+7tVyd36J5ssaKeyPK4cxCtTsrgkOVejvXbaUM+n9fRMg@mail.gmail.com>
 <18755DC80A8D9F8D.418361@lists.openembedded.org> <CANNYZj_tN8ZHDSuY+6cETOjGSFPW0=AYjEg+JVASyJoRde5rTQ@mail.gmail.com>
In-Reply-To: <CANNYZj_tN8ZHDSuY+6cETOjGSFPW0=AYjEg+JVASyJoRde5rTQ@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 6 Nov 2025 11:32:08 +0100
X-Gm-Features: AWmQ_bmv5dSw8JV8RAnzu5gMWo8pdMr4sXyZcv9gYDNeO6yOeL8L-hskMmzLSRs
Message-ID: <CAMSfU+6Xyn1-rTYY9j8iCsgUVhkg22i9K52-8doV4THERtk7ng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake-setup.schema.json: Add schema for
 "{THISDIR}" bb-layer
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Joshua Watt <jpewhacker@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004b96e90642ea9539"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 10:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225969

--0000000000004b96e90642ea9539
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 6 nov. 2025 =C3=A0 11:10, Alexander Kanavin <alex.kanavin@gmail.com=
> a
=C3=A9crit :

> On Thu, 6 Nov 2025 at 09:32, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> > Yep, the point is to formally document the meaning of {THISDIR} in the
> > schema. Maybe we should've added a separate key, e.g.
> > bb-layers-relative-to-config-file. Maybe we can still do that :)
>
> I'm going to make patches. I do dislike having magic tokens in values
> that need special processing.

Fine with me.
I haven't thought of creating a new key when implementing THISDIR.
--=20
Yoann Congal
Smile ECS

--0000000000004b96e90642ea9539
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 6 =
nov. 2025 =C3=A0=C2=A011:10, Alexander Kanavin &lt;<a href=3D"mailto:alex.k=
anavin@gmail.com">alex.kanavin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 6 Nov 2025 at =
09:32, Alexander Kanavin via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.o=
rg</a>&gt;<br>
wrote:<br>
&gt; Yep, the point is to formally document the meaning of {THISDIR} in the=
<br>
&gt; schema. Maybe we should&#39;ve added a separate key, e.g.<br>
&gt; bb-layers-relative-to-config-file. Maybe we can still do that :)<br>
<br>
I&#39;m going to make patches. I do dislike having magic tokens in values<b=
r>
that need special processing.</blockquote></div><div>Fine with me.</div><di=
v>I haven&#39;t thought of creating a new key when implementing THISDIR.</d=
iv><span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" cl=
ass=3D"gmail_signature"><div dir=3D"ltr"><font face=3D"Raleway, regular">Yo=
ann Congal</font><div><font face=3D"Raleway, regular">Smile ECS</font></div=
></div></div></div>

--0000000000004b96e90642ea9539--

