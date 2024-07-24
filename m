Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90EC3C3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 15:29:00 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.13644.1721834939767762731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 08:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S3IyoR1H;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2cd5d6b2581so2295909a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 08:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721834939; x=1722439739; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7cjsXj24uytvxi40OBa8QtTfNrCSocaWGLs1elzwhAY=;
        b=S3IyoR1Hs+n/yRcS9adqsAaJ4Ja1dfdFeqzoHfcAOpx5m4i5z7nd0vmeR4YNU/3Dme
         oxFcJrNMOGRh1J7crHXVPAA5oXFF2l0w8kBs4iZbePQLC9SFiR+imgIbiYU9P8MRSCf1
         Mb4mdfCShBGsn0zyObQCF5fs7rrvo4a6pT6ychoJNbUb8jEFMybvMiJK1TVisV0jR/iz
         JG6M3dpzcE4IdlI6/NzHN5YB/hFbHRspw/M4cL42nLMkhbOm7V9QnvlyR/EiIHCREScj
         099wSB9KGlN5GH8K/NZQJVzk6EzzWaZnCj3VLbvrOWgp0ewn3d8KX2ZXuDBLLoUdFyJL
         yGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721834939; x=1722439739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7cjsXj24uytvxi40OBa8QtTfNrCSocaWGLs1elzwhAY=;
        b=WJwmg6yvvsTJ56kgzvT7hBQ7Qqz1PRdPWJWA3aOMXRtvUekcG3vseLsL6a//O5eJF+
         nhAQ4J8hcklxt2hGOtrTOcgSvko5OfF1QiRdzW2F8aoN+9L93YwYe+whY8rbT8LX0y+I
         GzgG/5R/kEHSTlA9WgjL11MAw6qHjTdJ32Nxg4iWUdPVytIBBirEqPeuFRhCT+zFpK8S
         9hw20RqBtr+FrXYQz9kpp2HX3JFcK3fqE3lgWDLiFE0PAS93TWOZ3b9BiFh98iuofaxu
         DCNfzFRyLCrRSrB8sG3hE7ckmzNMjDX1Txb1trse62fFmRM+3y/BodWCptYvBedbvf0c
         504w==
X-Forwarded-Encrypted: i=1; AJvYcCVILDsCw2oyTD64xScajcjm9gSd5E/2NTKjx56zkp1lzobetZAHNFINUmU10Cq1IU/cuxzEsB+sBygGDbWrj1ljDEZuUFSmgaRYuQdgwgpX8gZeIhZdZ89/
X-Gm-Message-State: AOJu0Yxq+jmIb7GgzmGuGRkBvllXidCZ5eIcqIkh6Q+DpmGUE7tXi+Et
	Gica7+ja+5QS9iuXpEZA4FwGWprigvy4coDOQARc98hd3jdQvNZUGz3wVw2hWBVWglUB9Hd4IDR
	jgTUNEmAMyUOeROZstY+bmUg7iu563Q==
X-Google-Smtp-Source: AGHT+IE4+k9NzWLvRlS9P0Cc722DyKpHUqTwsubPNTgB1RxuSbvuDcQjsTWuy0NLE7dF2WcMsluiHOTjCZJleHD240c=
X-Received: by 2002:a17:90a:e501:b0:2cd:1e60:9c31 with SMTP id
 98e67ed59e1d1-2cd1e609c71mr10093182a91.30.1721834938978; Wed, 24 Jul 2024
 08:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=QMPfEF30cuTRoZmEsE0CTpRH8+0FOWheFSbyRHLWZ9Yg@mail.gmail.com>
In-Reply-To: <CAApg2=QMPfEF30cuTRoZmEsE0CTpRH8+0FOWheFSbyRHLWZ9Yg@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 24 Jul 2024 17:28:47 +0200
Message-ID: <CAApg2=Q26B5Pej1qG7LtxjfSK_Y8RMNq6yS3zh-CWaO993vgrw@mail.gmail.com>
Subject: Re: OE CVE improvements work status
To: yocto-security@lists.yoctoproject.org, 
	OE-core <openembedded-core@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="000000000000e659a8061dffef21"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 15:29:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202454

--000000000000e659a8061dffef21
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 3:30=E2=80=AFPM Marta Rybczynska <rybczynska@gmail.=
com>
wrote:

> Hello all,
> An update of the CVE checking improvement work:
> - v2 has been submitted today. It includes fixes for tests, updates in
> comment, removed unused code, added deprecation of
> cve-extra-exclusions.inc
>
> Now back to the tool update, we have the ADP support to be merged and
> used. During that time https://vulnogram.github.io/#editor now generates
> ADP, and it will make creation of valid entries easier.
>
> We also have automatic runs of the tool every night for world in oe-core,
> will forward the message of the next night (just rebased the database).
>
>
I've submitted v3 with two minor fixes:
- add my missing SoB to the patch no 2
- fix a typo in the commit message in the patch no 3

Kind regards,
Marta

--000000000000e659a8061dffef21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 23, 2024 at 3:30=E2=80=AF=
PM Marta Rybczynska &lt;<a href=3D"mailto:rybczynska@gmail.com">rybczynska@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div>Hello all,</div><div>An update of the CVE =
checking improvement work:</div><div>- v2 has been submitted today. It incl=
udes fixes for tests, updates in comment, removed unused code, added deprec=
ation of <span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0=
,0);background-color:rgb(255,255,255)">cve-extra-exclusions.inc</span></spa=
n></div><div><span style=3D"font-family:monospace"><span style=3D"color:rgb=
(0,0,0);background-color:rgb(255,255,255)"><br></span></span></div><div><fo=
nt face=3D"arial,sans-serif"><span style=3D"color:rgb(0,0,0);background-col=
or:rgb(255,255,255)">Now back to the tool update, we have the ADP support t=
o be merged and used. During that time </span></font><a href=3D"https://vul=
nogram.github.io/#editor" target=3D"_blank">https://vulnogram.github.io/#ed=
itor</a> now generates ADP, and it will make creation of valid entries easi=
er.</div><div><br></div><div>We also have automatic runs of the tool every =
night for world in oe-core, will forward the message of the next night (jus=
t rebased the database).</div><br></div></blockquote><div><br></div><div>I&=
#39;ve submitted v3 with two minor fixes:</div><div>- add my missing SoB to=
 the patch no 2</div><div>- fix a typo in the commit message in the patch n=
o 3</div><div><br></div><div>Kind regards,</div><div>Marta <br></div></div>=
</div>

--000000000000e659a8061dffef21--

