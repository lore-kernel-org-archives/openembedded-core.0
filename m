Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24033C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 11:38:41 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67076.1782992318621223093
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 04:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=K0/YhEtZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493b779003fso8485635e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 04:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782992317; x=1783597117; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BelFemo0bjgCAOaUbk/hH3xWs4p1LZu5dr4/NbVEwQg=;
        b=K0/YhEtZ+FvjPYaqL9WkWv7Sq6RW4Ly4sLROnusxQBtezZxn0l7GlBoIMF+tiblXm+
         8U1cvskXTLj9zuGoNAsH0mMt0KNXFVdgiJMceb/8BcRIGWqpQI484y7uY3rNCI+VN1na
         ul9WDMNDW29feDOsRWxHElKpB1mUXmIul+9+UPk59QRO/FvGd4OqRlBNSbRvwQWUpRzF
         3toATIhDUOHIurZWxDNSiktGQ6TiXkaYuhOiW31K2WXFGtZZ5aHhlZD7lIN5TcbW9brT
         1Ldo3/geXC06vUjoK1EucGlSbzTgGYtwKvQgVgV1EtqNCWtLzvyhO6+wEzcWgiDmLvnx
         htjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782992317; x=1783597117;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BelFemo0bjgCAOaUbk/hH3xWs4p1LZu5dr4/NbVEwQg=;
        b=BMAHVd/gWCSe9IdQFsA8IkBoynUbUaYnhxs1axTdS2+V7K4LXDrgtkENkhi6DA6M0L
         5hH2+Kex4VVQCbd9QRRFPnNv/TlBOIC5Agonh14ATb1tBiKzuzB4CbsoK6dZ/mzDIvJI
         Uw85hv5TY9QZcd4QzZ6U1lUemjUsvAygKbTGPGrA5wKYnEo7azE64a3QYPMaGXaux3qP
         PsY6d/BK02LEwRi1uR7urD0nZNMYaiPpVyasvz1nIdwmdCwUBuyHRKnuPrGpro3f8Tb+
         H9cu8lN2H8KIH8FkntfI/RbJ4YsQE8kF1d+VAvUzb7cIjpoJNhzpHUyFjbeFt77C1Hf6
         fbRg==
X-Forwarded-Encrypted: i=1; AFNElJ/D5bSeGhZBhDPWzsJaZcW4EPwLVM267ZZMR/RML4km7k9cyXbGGX1xl9ZhlNIjVmbDPyA/XhGyg1YJ3NS3rXsowQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YygXTypkLUlNqz/H5vvuJ7tHWrIuwQXkFwBzht4fTf78fz2Njdn
	jaPiwLyZNMkVViZVAj2LDYcqdSaJFqRuiUftrmMZN1Qswk0y8eklGhK1
X-Gm-Gg: AfdE7ck+w6uq7AVeycUy+PIXH3nnLCktVmOa37QSGx5YWYb4Z09yNZb4exoKLC8SJJ0
	0eKH/nyttZOoGe91bBa7In5m2MUMj2CS/BxAKd2nSFUC033Bf/5CweelqW8o76UpY0ZQYR08Dld
	bX8GQ6xsa0BmIU7iL1+TvKEel8dmnW1RtZhggb9iO8NF5dvAgFV4Y/gcPyjqIMJQekOOvDWf1I6
	UF1Cm09l9SLz1Lmwk7YwkYEoVBAIy091M1RBilkWbvTBx6EdDC7D8nr3LvtkN1h0pOFJ5iXt+W3
	KL3pn5AJVVPu8vb3W9NPwHEuowjHurUzAiS/6VG7LQJ6/ybNK7u4EgeXZ+dbCW+umJl18K9RK23
	QJBUv5ql6M7rwI9xXgP2wZWof71S3CeAO2tUrKjtdVj74/5KKI/k25Xe1FA1WL/MtMjCS0TIIXE
	H8/GHGt/R4O6RyTebCkJS1xNhoBRlX2pbiRgjWhIoOmdH9a3kMcb7TzOwZkNqLhQ==
X-Received: by 2002:a05:600c:5010:b0:493:72d3:4a81 with SMTP id 5b1f17b1804b1-493c2b5161emr79133655e9.16.1782992316617;
        Thu, 02 Jul 2026 04:38:36 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c636ea60sm39083815e9.3.2026.07.02.04.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 04:38:36 -0700 (PDT)
Message-ID: <84bd480810d947c860b95c3cc10f66fced3cdedf.camel@gmail.com>
Subject: Re: [OE-core] [wrynose][PATCH] kernel-fit-image.bbclass: Do not
 include kernel property in DTBO config subnodes
From: adrian.freihofer@gmail.com
To: yoann.congal@smile.fr, Marek Vasut <marek.vasut@mailbox.org>, 
 "Freihofer, Adrian" <adrian.freihofer@siemens.com>,
 "openembedded-core@lists.openembedded.org"	
 <openembedded-core@lists.openembedded.org>
Cc: Ryan Eatmon <reatmon@ti.com>
Date: Thu, 02 Jul 2026 13:38:35 +0200
In-Reply-To: <DJO1RET2JWA2.2H0HY5TPUI2T5@smile.fr>
References: <20260630074356.10265-1-marek.vasut@mailbox.org>
	 <6fb0c748f9cbdeb15dc583483486e12af1c7f397.camel@siemens.com>
	 <91b15fcf-715b-40cc-8f77-ff4571946725@mailbox.org>
	 <DJO1RET2JWA2.2H0HY5TPUI2T5@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 11:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240034

On Thu, 2026-07-02 at 13:26 +0200, Yoann Congal via
lists.openembedded.org wrote:
> On Tue Jun 30, 2026 at 2:58 PM CEST, Marek Vasut wrote:
> > On 6/30/26 12:51 PM, Freihofer, Adrian wrote:
> >=20
> > Hello Adrian,
> >=20
> > > I guess, before this patch can be applied, this one (or a back-
> > > port of
> > > it) is required:
> > > https://git.openembedded.org/openembedded-core/commit/?id=3D85e0408a8=
1bdca0411a8625061e5e343c05f92d9
> > > Otherwise, the oe-selftest fail.
> > Thank you for staying vigilant.
> >=20
> > Yoann, can you please pick the aforementioned commit too ?
> >=20
> > Thank you for your help !
>=20
> Hello,
>=20
> I missed that discussion, sorry. But was reminded by Ryan (thanks).
>=20
> If I understood correclty, the set of patches we need for wrynose is:
> * kernel-fit-image.bbclass: Do not include kernel property in DTBO
> config subnodes
> * kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDORED =3D
> "1"
> * oe-selftest: fitimage: Do not expect kernel property in DTBO config
> subnodes
> * kernel-fit-image: Add KERNEL_DTBVENDORED support for
> FIT_CONF_DEFAULT_DTB (this one is not merged on master yet)
>=20
> Marek, Adrian, Ryan: does that sound correct?
>=20

Yes, that's correct. One little detail is the order of the patches. If
you pick the oe-selftest commit first, all commits are compile and
test-able. That's my suggestion:

 * oe-selftest: fitimage: Do not expect kernel property in DTBO config
subnodes
 * kernel-fit-image.bbclass: Do not include kernel property in DTBO
config subnodes
 * kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDORED =3D
"1"
 * kernel-fit-image: Add KERNEL_DTBVENDORED support for
FIT_CONF_DEFAULT_DTB (this one is not merged on master yet)

same order as on master branch.

Regards,
Adrian


> If yes, Marek, when the 4th patch merge, can you send an updated
> series
> with all 4 backport patches?
>=20
> Thanks!
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#240033):
> https://lists.openembedded.org/g/openembedded-core/message/240033
> Mute This Topic: https://lists.openembedded.org/mt/120043543/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

