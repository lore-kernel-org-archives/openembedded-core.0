Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D189DCD5BB1
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 14:10:08 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38183.1779804603090151800
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 07:10:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IYQG9NF9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49056b9f04aso40010035e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 07:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779804601; x=1780409401; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k11pP3IY8yZXsiJsTBfh/hYJmxR35uDYApGCgS/nofg=;
        b=IYQG9NF9CLDTnwbZCdIKDAV/Xi77ICtaLIHrABI0Y+DmGxGlxQWwSHuTEXioxqu5to
         wWMZuJrP/gmN4+xnzF7vcCMLSGRYNmR4LOtChVGriNC6tSLfdNftfPj5MCyp5O5Iuse1
         dS6enc20VDggzbR8Uz0Px0D661ezshfvm0whk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779804601; x=1780409401;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k11pP3IY8yZXsiJsTBfh/hYJmxR35uDYApGCgS/nofg=;
        b=UlCUvyHsxD6leIAfXxq6+XZkJUUuKPHmxqx5U/KXa9oMkRgo5n9ZjXAqIlCkziOpMR
         nitEKciMw7yAm/4VtN/DxmppmZ2iZa7i4xXLueH/fhYvEpem+r9rGdYg0R+sPxQzmdlp
         Sc3gr9qmk+Jp7jh2rrB7kowB7/f0cemz3H/HATjiV49s4sGVoQPz0qMob8csKpwbKfWb
         1pXokVgUJBFyFblMCnYj+Bf85qK7Bqe5pPZxY7MR9dgoAd5cPCXm2Ejx/7M0BVWr9yaG
         i6D83tKU3g8WbRnZlU8Dn0DRvVhl0BHWb6klH8L6EwkpTPNG4bTkIPmAXzG9hALn/ID4
         SOoQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Ip42lTiwnttD3hN+P2ZSN/I32GFDTaDZLWrH8uJyo4GWJ6dwv7YqHFFSJbsy7D41ZOSKKWQAYs9nMHvXkChl6gA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwUt+ijvJ7cmRlu/vSe6x9ZC735zNqKcPrviprIn2ESffyh+jhq
	5shJAfhrD7YX/NN4qg8w5/n3YfME5MKjaJR0PBRt2m0qUd+lGb9c+x71JtqDoQH83ak=
X-Gm-Gg: Acq92OHir0KShor5hnPECcfZp5EDShF7CSs88UqDS5Jy1hqxfRCrig5S6HUy599AG3r
	q1GGm5cF7hiU/qeDcaw1vPDqfWByA0av9LEBcjfwbwT+Pzj9b3DyhDkoYpCyHGg1gCyXN2cFT2j
	XQaom7TAj1rpfSjIolicSZn/y7iiCEfDV5otPntgGQIVWPmRXMWLZdVFo58uqRd8VX8vvczUCJj
	rvoKv4ACH63RKGqiO5K1j+6l7r1KMS+8oVETa0I3iDXGPpuQaTfdij1ex9z9T4u3HTmReodP17c
	+fw2cLCx1KIeP1xvjJvD4uLsv6LaAc94UwOxN6BK2TVOgxmuOTavrmM1eVTUqz/8i2Y9rzEis7Y
	FoMWqvTmJ+I04QnA0eijzsffIFK0HZVVCEG1KmrjRsreuKefY6Q7RDiduiN9z1bL8cDj+pwve27
	t1sySzjJfxjYKQd/Xr1p2D57Jm0E50jM+4WwLufXQR+XTHkP2hJootIQwgL8IuXXOUn+eJzXSIF
	oDAnFEOMZ4q5RYY
X-Received: by 2002:a05:600c:1553:b0:490:53b0:9e53 with SMTP id 5b1f17b1804b1-49053b0a086mr247862265e9.1.1779804601251;
        Tue, 26 May 2026 07:10:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2e34:2d9a:782f:4147? ([2001:8b0:aba:5f3c:2e34:2d9a:782f:4147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490456274ebsm314170685e9.15.2026.05.26.07.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:09:59 -0700 (PDT)
Message-ID: <f3d7391676bd2518141fae1822c928d4013d5748.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] image_types_wic: make do_rootfs_wicenv
 hash-safe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: paul@pbarker.dev, Sam Kent <sam.john.kent@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 26 May 2026 15:09:59 +0100
In-Reply-To: <0ad1aa2e945023107fcfa0d5bb1f251394c00a4a.camel@pbarker.dev>
References: <20260430083905.2967342-1-sam.john.kent@gmail.com>
	 <0ad1aa2e945023107fcfa0d5bb1f251394c00a4a.camel@pbarker.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 14:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237612

On Mon, 2026-05-11 at 11:02 +0100, Paul Barker via lists.openembedded.org w=
rote:
> On Thu, 2026-04-30 at 09:39 +0100, Sam Kent wrote:
> > BBLAYERS and BBPATH contain host-specific paths which contaminate the
> > hash and result in unnecessary cache misses.
> >=20
> > Exclude BBLAYERS and BBPATH from vardeps and instead enumerate the wic
> > plugin .py files tracking them via file-checksums.
> >=20
> > The hash now only changes when a plugin file is actually added, removed=
,
> > or modified.
> >=20
> > Fixes [YOCTO #15662]
> >=20
> > Signed-off-by: Sam Kent <sam.john.kent@gmail.com>
> > ---
> > =C2=A0meta/classes-recipe/image_types_wic.bbclass | 21 ++++++++++++++++=
+++++
> > =C2=A01 file changed, 21 insertions(+)
> >=20
> > diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes=
-recipe/image_types_wic.bbclass
> > index ea8c1c9..e6f77e9 100644
> > --- a/meta/classes-recipe/image_types_wic.bbclass
> > +++ b/meta/classes-recipe/image_types_wic.bbclass
> > @@ -68,6 +68,22 @@ def wks_checksums(files, search_path):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ret =3D ret + " " + found + ":True"
> > =C2=A0=C2=A0=C2=A0=C2=A0 return ret
> > =C2=A0
> > +def wic_plugin_checksums(bblayers, bbpath):
> > +=C2=A0=C2=A0=C2=A0 entries =3D []
> > +=C2=A0=C2=A0=C2=A0 seen =3D set()
> > +=C2=A0=C2=A0=C2=A0 paths =3D (bblayers or "").split() + [p for p in (b=
bpath or "").split(":") if p]
> > +=C2=A0=C2=A0=C2=A0 for path in paths:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if path in seen:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
tinue
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 seen.add(path)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 plugin_dir =3D os.path.join=
(path, "lib", "wic", "plugins")
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if os.path.isdir(plugin_dir=
):
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for=
 root, dirs, files in os.walk(plugin_dir):
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 dirs.sort()
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 for f in sorted(files):
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if f.endswith(".py"):
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entri=
es.append(os.path.join(root, f) + ":True")
> > +=C2=A0=C2=A0=C2=A0 return " ".join(entries)
>=20
> Re-implementing the wic plugin search logic here is likely to lead to
> inconsistencies. For example, wic currently searches for plugins based
> on BBLAYERS but not BBPATH, and it looks in both scripts/lib/wic/plugins
> and lib/wic/plugins. Even if we align the two implementations now, it
> will be very easy for them to drift apart again in the future.
>=20
> Could we instead rely on wic to perform the plugin search? There is
> currently a `wic list source-plugins` command, we could add a `wic list
> imager-plugins` command or perhaps a `wic list plugins` command to list
> all plugins. We could then call that here to get the list.
>=20
> We should also move this to an event handler so that we don't
> unnecessarily re-run this search whenever the bitbake data store is
> updated. See image-postinst-intercepts.bbclass for an example of how to
> do this.

We need to run this at parse time and since wic is now an external
tool, calling it in these contexts is effectively not possible...

Cheers,

Richard

