Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF02BC79FA0
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 09:22:31 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3210.1788859345132603208
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 02:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IkBdygkG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a5e329c0f2so4897641a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 02:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788859343; x=1789464143; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OWzgDAjrieLwhCU7PLAuHwxqsFVo7UQEIz4rl1miV74=;
        b=IkBdygkGFTTIkt9VYqbG9eqRURugVhIFRS8xTFAaPzGfuASWyiqINiW2I9y1X229lq
         PEsehkKA3LLb9rTJHlWAw7vUIEmI8SH0D39Q6/2PnJCW3udpgH5CnJcHs3AZdY5fUMT5
         GiUMH6RDenaBINWkh24KTKV2B5cW0tVLYU7rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859343; x=1789464143;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWzgDAjrieLwhCU7PLAuHwxqsFVo7UQEIz4rl1miV74=;
        b=fCHgv2wDA0gKEch4Sgd9ldDicoPUe4/qR3faZs7ZlzJVK9ivKlUahZ+hQtHl0ei0tO
         NiQ4Dk78y2CRi7biQoilQkTIYi60/uMgSHaj7/OB/nG8cunhTvwgsiMbMRLljlxCLo7l
         a8zxJtupdx0YUs5yDk1ezzB27wWNcGgfMdqhffwk8dnSdJ67R1ffPefy6Vv3wjzbLIX7
         6tvmbZOOWsG/9zcW7Y96bH0bSQR/TOq/F+6Ss5NY683nH+e6g8tyoKRvgLTubcv84Yb3
         D2VlFQGPw5r+/whyeCRlFWEqFYnHfLjUtygPEIc8lAaGTEY8JNJxANFQxp34Pgi6Oc/a
         a5ZA==
X-Gm-Message-State: AFuF++lA830CLkjzGnyt6hTovJv/B8o5v43GtiykDhOJtDuAH4la8zK0
	zBJiezihjv4P0h6jS2NAfPyy1dS6tn2ui9yCf7AnQYKq1laqH2kicuUATNyMf5SLWXo=
X-Gm-Gg: AYBFou0rESkF1mdxg/JcDflvoFQqBtZaAt+ljnMefwlXMOzrpSHCridJhJEuSwUuO21
	E7KNvGE+g5AgERb0/XGtFoF3z1LgPKGgHIcCvyBmezC0EMk4uMwvCHdHw7FReH19CBVMaiVlIuy
	JXsCZCC+WWHCbt0lbnkNZYBgct9KjAnDWEMGoXSVRspQDJbbWkARor+tjzAtGxNQzGn+E2/W8Tf
	5Qb7doR6QDcF/bTV5eIFIZA/fmJSGTaBXuUfwUoxMURAekBBZRXwJt0tMGMT3G0Nw9BLQhbo4By
	h/n9GM2UQ2kucn6sWo7pvWaa/hevjievre0GsHBlSTk/EW+dlrsNjbqdW0YWMKpYlwAfH7AHfSz
	WP4V2abK+1oyZgybSoza5bcqFb770x+dS8bIL4dtDCQwnwbTqFX3JyZPCADEhuAv/4vNRIHBX9w
	sV0BXZVv+W8yqf2ZW0tBpnAaMBhyHpE4d9qEAqAGE3EkWzMf8fOC0m5bem030EL/BKcMqAt03lw
	F+3388CI9fU
X-Received: by 2002:a05:6402:21cf:b0:6a6:32fa:cae with SMTP id 4fb4d7f45d1cf-6a7e8f936c0mr9157682a12.19.1788859342888;
        Tue, 08 Sep 2026 02:22:22 -0700 (PDT)
Received: from [192.168.1.129] ([217.169.23.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6bee8e8sm5726070a12.23.2026.09.08.02.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:22:21 -0700 (PDT)
Message-ID: <e342d25187e96ca6f70e4a8e04437fbf6e84ded5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/5] linux-yocto: -stable updates
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yoann Congal <yoann.congal@smile.fr>, bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 08 Sep 2026 10:22:20 +0100
In-Reply-To: <DL9SAQQDYUWN.DHAPJINZ988O@smile.fr>
References: <20260908011731.2895743-1-bruce.ashfield@gmail.com>
	 <DL9SAQQDYUWN.DHAPJINZ988O@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 09:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245337

On Tue, 2026-09-08 at 10:15 +0200, Yoann Congal wrote:
> On Tue Sep 8, 2026 at 3:17 AM CEST, Bruce Ashfield via lists.openembedded=
.org wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >=20
> > Hi all,
> >=20
> > Since we are working through 7.2 integration, I wanted to get these
> > stable updates out while the older (6.18 and less) are still under
> > test (those -stable updates will follow).
> >=20
> > I did sneak a 6.18-rt update in, but it was trivial and tested
> > independently.
> >=20
> > (yes, the yocto-bsps update is in this series, even though it
> > is for the yocto-bsp repo)
> >=20
> > Cheers,
> >=20
> > Bruce
> >=20
> >=20
> > openembedded-core (4):
> > =C2=A0 linux-yocto/7.2: menuconfig,mconf-cfg: Fix broken menuconfig
> > =C2=A0 linux-yocto/7.2: rt: update to v7.2-rt5
> > =C2=A0 linux-yocto/6.18: rt: update to v6.18.37-rt6
> > =C2=A0 linux-yocto/7.2: update to v7.2.4
> >=20
> > meta-yocto (1):
> > =C2=A0 yocto-bsps: update to v7.2.4
> >=20
> > =C2=A0openembedded-core:
> > =C2=A0meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb=C2=A0=C2=A0 |=C2=
=A0 4 ++--
> > =C2=A0meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb=C2=A0=C2=A0=C2=A0=
 |=C2=A0 6 +++---
> > =C2=A0meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |=C2=A0 4 ++--
> > =C2=A0meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb=C2=A0 |=C2=A0 6=
 +++---
> > =C2=A0meta/recipes-kernel/linux/linux-yocto_6.18.bb=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 20 ++++++++++----------
> > =C2=A0meta/recipes-kernel/linux/linux-yocto_7.2.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 24 ++++++++++++------------
> > =C2=A06 files changed, 32 insertions(+), 32 deletions(-)
> >=20
> > =C2=A0meta-yocto:
> > =C2=A0meta-yocto-bsp/recipes-kernel/linux/linux-yocto_7.2.bbappend | 2 =
+-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>
> Is there a chance that a fix for #16414 "AB-INT: testsdk:
> kernel-module-hello-world build fail"[0] hides somewhere in this
> upgrade?
>=20
> [0]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16414

That was in fact fixed here:

https://git.openembedded.org/openembedded-core/commit/?id=3D02890c1eff104de=
94ad22023232fd36baaf228dc

Cheers,

Richard

