Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3544D1038D
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 22:02:45 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.8376.1729807357663209956
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 15:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RzoSdyR1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so14293675e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 15:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729807356; x=1730412156; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tx9w9MeBG4iet9OJ+29wWrHdLRb4eMDjlYtkiWDsYZM=;
        b=RzoSdyR1pzn++JqhqS5kANbHDZsqIw32UVb7CA2hDWabib8fTm/HjRTVmkYNmW4gfF
         To2eHuQ9iUK1Cxf6ZKu203v0bBYECHatrW65LVTdB84VwC42cTGbgwx4wb2WLmdW6wT8
         moKSNuEjlL3zGJNhIfn/4SvfAI2aOlwtx10qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729807356; x=1730412156;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tx9w9MeBG4iet9OJ+29wWrHdLRb4eMDjlYtkiWDsYZM=;
        b=rjgLgARDFbTZiHwRKVzeKKo90NIhs+TZ37kgIzxh70xKBOWz6kzW0d9oeE1NfPygia
         J5eDhQjUpnjTiXUf2pod6ia9WaL5kGZxxWBLNckyXsDlCGVWRvQ+n0g4oyagsJyxxF/l
         hb4CmBltYakpIYGaXO9SFdx+0GxnNrz2MkDFv9w+yTphneNoXK6tE69qUJiZrIpbbCAd
         ftOYzQf12ZExSQV6TPlO658jy6Alp3sVjMCJc4KK0Kl9vvN7ClaVIqviZ+R8PjtNPTJT
         Zj/L11ah/mvKg/PRRNUfIg+/RGE9xLppP6DECwLyYqiN4QM458/tJdc5/hAnxiuuLaR8
         QC5A==
X-Forwarded-Encrypted: i=1; AJvYcCWyjI1CoBF/XW+7PaWFU3kOcLUx/Rp6XM3yBqJ9FRUuTe4gT6MjJ1R+njrRwVjbQpSn+TSRdb3HZrdWUAQ6axtD3A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwdYGH7/jw7aZ6QAV7iBlcTmFhgp5vhYTo4bQnNKQ/+RD4f/XSQ
	Xbhowg8yKmwEqqofB6UArs4UE7NAFakexr4o52ikLjp+SxlUQWVj19qxGZhlLYg=
X-Google-Smtp-Source: AGHT+IFPlwAHgzvEoE2SpwJi5Uj3xLAzWhyou4FkoNyeyRvFWydzrWrRe2qaSEGafiseSfca8LWdGw==
X-Received: by 2002:a05:600c:5105:b0:431:4f5e:1f61 with SMTP id 5b1f17b1804b1-4318415ecb0mr68781275e9.14.1729807356035;
        Thu, 24 Oct 2024 15:02:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c3cc:29c5:4b3a:41ad? ([2001:8b0:aba:5f3c:c3cc:29c5:4b3a:41ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b93e76sm12264363f8f.82.2024.10.24.15.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 15:02:35 -0700 (PDT)
Message-ID: <b6f77a5f6712bc37c0517a45af1e45a3ee8a1931.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] systemd: fix journald persistency when
 VOLATILE_LOG_DIR is false
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Esben Haabendal <esben@geanix.com>
Cc: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org, Steve Sakoman <sakoman@gmail.com>
Date: Thu, 24 Oct 2024 23:02:34 +0100
In-Reply-To: <87seslpoax.fsf@geanix.com>
References: <20241024-systemd-create-log-dirs-v1-1-23cba4a734ab@geanix.com>
	 <58cf7a251cc55641f2d5da7dfedf204e367cc38b.camel@linuxfoundation.org>
	 <87seslpoax.fsf@geanix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 22:02:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206309

On Thu, 2024-10-24 at 16:29 +0200, Esben Haabendal wrote:
> "Richard Purdie" <richard.purdie@linuxfoundation.org> writes:
>=20
> > On Thu, 2024-10-24 at 13:41 +0200, Esben Haabendal via lists.openembedd=
ed.org wrote:
> > > Commit 18d46e11d85d ("systemd: fix dead link /var/log/README") broke =
the
> > > default systemd behavior when VOLATILE_LOG_DIR is set to false.
> > >=20
> > > By not creating the /var/log/journal directory, the default configure=
d
> > > systemd (Storage=3Dauto) will silently revert to just doing volatile
> > > logging (/run/journal).
> > >=20
> > > The problem fixed with the above mentioned commit was specifically re=
lated
> > > to configurations where VOLATILE_LOG_DIR is true, in which case it sh=
ould
> > > be perfectly fine to not create the /var/log/journal directory, so we
> > > should be able to keep the fix in place, while not breaking behavior =
for
> > > non VOLATILE_LOG_DIR configurations.
> > >=20
> > > Signed-off-by: Esben Haabendal <esben@geanix.com>
> > > ---
> > > =C2=A0meta/recipes-core/systemd/systemd_256.6.bb | 2 +-
> > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/recipes-core/systemd/systemd_256.6.bb b/meta/recipe=
s-core/systemd/systemd_256.6.bb
> > > index 68f15ab065dd5985e4e5cefc2cd005dba5ac9c7f..88ee0c8a7f89726fc9be4=
89f3fc419f9feb37251 100644
> > > --- a/meta/recipes-core/systemd/systemd_256.6.bb
> > > +++ b/meta/recipes-core/systemd/systemd_256.6.bb
> > > @@ -254,7 +254,7 @@ EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dsystem-uid-max=3D999 \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dsystem-alloc-gid-min=3D101 \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dsystem-gid-max=3D999 \
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dcreate-log-dirs=3Dfalse \
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@ '-Dcreate-log-dirs=3Dfalse' if oe.=
types.boolean(d.getVar('VOLATILE_LOG_DIR')) else '' } \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATUR=
ES', 'zeroconf', '-Ddefault-mdns=3Dno -Ddefault-llmnr=3Dno', '', d)} \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> > > =C2=A0
> > >=20
> >=20
> > There were recent changes in this area so that is not the correct way
> > to do this in master.
> >=20
> > meta/conf/bitbake.conf:BB_RENAMED_VARIABLES[VOLATILE_LOG_DIR] =3D "is o=
bsolete and no longer supported"
> >=20
> > This does make me wonder about testing :(.
>=20
> Guilty as charged. Testing was on scarthgap. I currently does not have a
> working test setup for master.
>=20
> I guess I will have to wait with this until I can do proper testing
> then.
>=20
> I will resend this patch against scarthgap though, as it is valid and
> tested there.

Our backport policy is such that it needs to be fixed in master first.

> For master and styhead, I need to change to check
> FILESYSTEM_PERMS_TABLES instead.

Correct, yes.

Cheers,

Richard



