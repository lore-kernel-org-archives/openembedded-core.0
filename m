Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA16C83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 14:18:03 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.14021.1753193881556295257
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 07:18:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iSIwAQtp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a54690d369so4590908f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 07:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1753193880; x=1753798680; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qd8Rj0ulw384K7IVeiN3Px3Kbh+luOkswdSiqwLiYlc=;
        b=iSIwAQtpxVdNZXn9BEPIB3cwruXVcCKg0AQ6uwOD4E58D9WUFbmYBHy8yniKzi3xOI
         JhQ/KwehChWxusULis1QBxe6oJz8gosBrezNDnFmvN/tspexUaC//LFki+eFKkB68dX2
         u1uVfOc3wZnwcNsfmZnzr+2mZBNXQjtsHgpRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753193880; x=1753798680;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qd8Rj0ulw384K7IVeiN3Px3Kbh+luOkswdSiqwLiYlc=;
        b=otTb1ONnB3XLkC0mUPlvzdUv1k12M/BoxDiOcKmeAcN2YpwZ1n8Kq8nFX1hi+OtXAq
         F4qdt19yNvtGV3bnXM4Tz7bOYJ+zZCKpOWXm6ZKUN3D5XHqMDg1rxy39iVRU+o+H6GDK
         LEmhyhi6NXC17C1YU0U35sOpqBk9zxcgTXAZpfKzHsi+IsWkLYbR4Iu+wIF2/J6kxALR
         6ud84edxKJX4p0yG5rbxIeiA8tkndNX75tIYpjrMGS7xDYVY9itrbu+5yMDet6NzbALW
         wYyAfCTpkW7prQEyelSWCpw19IEtJdACViRrfQwaP5dqcEMUmi3qNhMD0546NE0VLAoZ
         6VZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfYvSJJpzPb0v5jvxb12GG56TgORQR8FGPiLWlnJoGWOCMHgZ23tNYengDAs7iJPbsSHZXI1ctGlfcCKIkcMvMYw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwN+o9nT3RmZL2A/j9x1MwcX0Njf5ri/OPi+4NH/ZrH7BQQvjhj
	9NhK5ysPkdNv6/1MsPq+NF3f3kCHPBBPy54kQTIMH2yRtLM/i2zjyvWFdd6vUYcM+nE=
X-Gm-Gg: ASbGncvm2v+UlzMcbpdqvUQop+tZy1bfGIUz8uYIJbnIUwRPmHJC4ci5/PUixz/pAOh
	OSxznO01opSUf8up3WwDXmdYaM4N+C9y5X3SJ4SjZu6KX8Kfu5yFuGFm3ahfyMH3PisvB4kCZDi
	mskO485Z3XpBTwRHmXsyZg6uANFt1LdX75kdr5lDSiGaweDRXBZjtjOTJZbsalg4FqPAjE5oTts
	azzTUBxZX84U7UVRLzfhWyQlbUl4m55eYSERnEH/pwhHcqXSmrc6FX0yniAL+LFp3GFkTDMdNw8
	sAwD+um0wCYjpSxFfHJzYcD27VI+K5f3MjT2peee6cRxywbqXLcuD0b1dvMwBE2Ob1atslM3/SX
	jf6N4LkTbFH/OnGdPGK5MG/70bMXm3oeqoYu5wE+V1Kbws81GSAWQb4NUyVfuo6XRM8lcQ17rki
	pb3uGnfNEPWkq94Aqjps8=
X-Google-Smtp-Source: AGHT+IGbHF4DjJOgM2XBhzyn8wDNIi/9CvXSRS+ZM1HKgxvA44fhEaLt8/ZoEwFSjsT+tTlxJMl93A==
X-Received: by 2002:a05:6000:26c7:b0:3b3:a6c2:1d1b with SMTP id ffacd0b85a97d-3b60e4f2e53mr19017289f8f.28.1753193879815;
        Tue, 22 Jul 2025 07:17:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7d90:ed57:78f:a937? ([2001:8b0:aba:5f3c:7d90:ed57:78f:a937])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca2b81asm13622237f8f.20.2025.07.22.07.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 07:17:59 -0700 (PDT)
Message-ID: <9c8d7ee715e01a7f7aa977bc30f1d8d7bc4d5fd0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] libxml2: upgrade 2.14.3 -> 2.14.5
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2025 15:17:58 +0100
In-Reply-To: <DBIMOAQO71QQ.13YNCOGP9XB30@bootlin.com>
References: <20250721082103.2262095-1-hongxu.jia@windriver.com>
	 <20250721082103.2262095-4-hongxu.jia@windriver.com>
	 <65edbfaaa12089b5483042867d663fb46e488b82.camel@linuxfoundation.org>
	 <DBIMOAQO71QQ.13YNCOGP9XB30@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 14:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220749

On Tue, 2025-07-22 at 15:45 +0200, Mathieu Dubois-Briand wrote:
> On Tue Jul 22, 2025 at 3:18 PM CEST, Richard Purdie via lists.openembedde=
d.org wrote:
> > On Mon, 2025-07-21 at 16:21 +0800, hongxu via lists.openembedded.org wr=
ote:
> > > diff --git a/meta/recipes-core/libxml/libxml2_2.14.3.bb b/meta/recipe=
s-core/libxml/libxml2_2.14.5.bb
> > > similarity index 97%
> > > rename from meta/recipes-core/libxml/libxml2_2.14.3.bb
> > > rename to meta/recipes-core/libxml/libxml2_2.14.5.bb
> > > index 4baab59186e..52b2040122b 100644
> > > --- a/meta/recipes-core/libxml/libxml2_2.14.3.bb
> > > +++ b/meta/recipes-core/libxml/libxml2_2.14.5.bb
> > > @@ -21,7 +21,7 @@ SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts20130=
923.tar;subdir=3D${BP};name=3Dtestt
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi=
le://CVE-2025-6021.patch=C2=A0\
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> > > =C2=A0
> > > -SRC_URI[archive.sha256sum] =3D "6de55cacc8c2bc758f2ef6f93c313cb30e4d=
d5d84ac5d3c7ccbd9344d8cc6833"
> > > +SRC_URI[archive.sha256sum] =3D "24175ec30a97cfa86bdf9befb7ccf4613f8f=
4b2713c5103e0dd0bc9c711a2773"
> > > =C2=A0SRC_URI[testtar.sha256sum] =3D "c6b2d42ee50b8b236e711a97d68e6c4=
b5c8d83e69a2be4722379f08702ea7273"
> > > =C2=A0
> > > =C2=A0# Disputed as a security issue, but fixed in d39f780
> > >=20
> >=20
> > $ wget https://download.gnome.org/sources//libxml2/2.14/libxml2-2.14.5.=
tar.xz
> > $ sha256sum libxml2-2.14.5.tar.xz=20
> > 03d006f3537616833c16c53addcdc32a0eb20e55443cba4038307e3fa7d8d44b=C2=A0 =
libxml2-2.14.5.tar.xz
> >=20
> > which would match the failure on:
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2060
> >=20
> > Any idea what happened here?
> >=20
> > Cheers,
> >=20
> > Richard
>=20
> It looks like the file changed on the remote, my build this morning did
> succeed but not the next ones.

https://download.gnome.org/sources/libxml2/2.14/libxml2-2.14.4.sha256sum

suggests that checksum is for 2.14.4. Whether the wrong file was in
place on the server or quite what happened, I'm not sure...

Cheers,

Richard



