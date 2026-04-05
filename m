Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA610F5512C
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 14:15:28 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35809.1775398519995741639
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 07:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YosluOfg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43ba1f3fa7eso3409703f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 07:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775398518; x=1776003318; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0qOXJ/i+OpVPrytdG1+wyy/hTuTgu3LxaX6oqwfzQ0=;
        b=YosluOfgqvdduL4pBuf+/OAu2sb55LR7Te4h338U94vYTx1xo3j/L33OOAe/JrVrxn
         nsOtxeMF2O8KKFLjsYQ8awhFwFHnIMlJk4RHHokqamAg47TGIKdfBfHEzpJ8pOJqNXJZ
         CjVk3CSb3SZl35cSszufc2WwRlexBsM4JHxG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775398518; x=1776003318;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0qOXJ/i+OpVPrytdG1+wyy/hTuTgu3LxaX6oqwfzQ0=;
        b=DIWQ4Sw7k0vRSEAt3GMNVZr6cD1jHQNOZaaYeWUopA3bFRe2eL/AVa7t5CzWrB3KZl
         cbpMaeiz6HUe2K0Pp5Xz3FaW69bCzwMiUk+0lCHWhUfa2khgsTrDHbWy62RG5EuS04Pn
         kl7HcpGWmHrLDDl9es2G9M6OMiU4hR6cNDnI0ou7xNEI2uynemEQUw/UumEsO/WDc2Ks
         kYSsNVRLIL6E1+Sk43BDdSgltvLh2p5LUK6ApeP1zZ798bOVdWm9MQ6jk4NutBnJjQlj
         /dQeBFRihJRfn8tIa6dxPrINSrQlq5gGCrGFd2nrX1yFasGUCr8XCbB/3P8fF7f6GClQ
         q3Hg==
X-Forwarded-Encrypted: i=1; AJvYcCV8DumcZUNCvH2zQw295uVmdQBpn7OAXsp9ebka7bmljzh1uSCftw/rsZ+biTzhnui9QSj96UlaXbg8q8WL/Bx1zw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyRBZJq5TvS2K10hchhUUK4XZx1zD+Q5xYI+AAMD61Bw+Sl1FFe
	lMUWxcKml8KYu6RvHQ+4izqUaqMSgfuWZgtbg7l4zVCU7hlOKI17yqceYjnSItyhaNY=
X-Gm-Gg: AeBDieuXth/kRgfyGyrcB/aUy+QY8jFwhToYcO2u5nn+WoVWxuwRGyxQbhu3o5mGmIh
	7YtE4i2PUyqYxVLItK4DDkPUEfFtvsBRvZaVyBZY721ik2wa3Q9BhwyjMA8M/ki2W7JHUUrgeqd
	rzVhVPkVIxcmbO17JykMWOSh088oym9bcqOwToIZGI/y11vaNpeMoAgdOWkbiZCS+Au3FLOrlHE
	qDSI/9uc2gGzsLd9AtLWwCxoAA2/uIkhu6u4zbi0DDS8uZdkRIPK0q7pegADv0ypjQOJxMjRm5m
	hbQCGJ6DGhq86xoN0AfOzwba6A/i+1hvzslzrDGNeAL7nux9Xnh0YhDwRK0a9WZCiuxAZJrMTCZ
	nSsW3S4WwADcRRaatOv2jeaNCCZtIXnD7jnMXf04vxOkPcQtMBWXchP7RxcF79d8smyYPZ24VTo
	AomsIDqSzs2W51OuvZRpKyqdYGGHZuD8dc7TYlf5VhTX+ipDXmWpfClX/RiN4dNaJIfYDfIVZ+f
	Onm6P3znUA1po6u
X-Received: by 2002:a05:6000:401f:b0:43d:2be:e4e with SMTP id ffacd0b85a97d-43d292ff520mr14484282f8f.46.1775398518283;
        Sun, 05 Apr 2026 07:15:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5e42:a555:17a8:9bbc? ([2001:8b0:aba:5f3c:5e42:a555:17a8:9bbc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c60a2sm31738394f8f.10.2026.04.05.07.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:15:17 -0700 (PDT)
Message-ID: <339980bedad128b61c91bc252d8d185dfd47ea22.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sanity: Require tar 1.35 or later on
 rhel9-alike distros
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mathieu.dubois-briand@bootlin.com, yoann.congal@smile.fr, Paul Barker
	 <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
Date: Sun, 05 Apr 2026 15:15:16 +0100
In-Reply-To: <DHK4ZL7W9BQT.3D1Y5HJNCKPCE@bootlin.com>
References: <20260403-rhel9-tar-v1-1-b9c7fb64bbd9@pbarker.dev>
	 <DHJO8L8EC2Z9.1N02J4E6QUEGC@bootlin.com>
	 <DHJOO3S7NQMS.D0NB9IPZPFV0@smile.fr>
	 <DHK4ZL7W9BQT.3D1Y5HJNCKPCE@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 14:15:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234629

On Sat, 2026-04-04 at 07:55 +0200, Mathieu Dubois-Briand via lists.openembe=
dded.org wrote:
> On Fri Apr 3, 2026 at 7:07 PM CEST, Yoann Congal via lists.openembedded.o=
rg wrote:
> > On Fri Apr 3, 2026 at 6:47 PM CEST, Mathieu Dubois-Briand via lists.ope=
nembedded.org wrote:
> > > On Fri Apr 3, 2026 at 1:54 PM CEST, Paul Barker wrote:
> > > > tar 1.34 (and possibly earlier versions) is unable to extract tarba=
lls
> > > > containing read-only files with xattrs. This was fixed upstream, bu=
t
> > > > it's unlikely at this point that the fix will be backported to RHEL=
9
> > > > related distros (CentOS Stream 9, AlmaLinux 9, Rocky Linux 9). The =
issue
> > > > affects these distros specifically because they have selinux enable=
d by
> > > > default and this uses xattrs.
> > > >=20
> > > > The specific failure we've seen is with the /usr/lib/udev/hwdb.bin =
file
> > > > installed by the systemd recipe - this file is chmod 0444. This lea=
ds to
> > > > the following error, typically during do_image_wic (shortened and s=
plit
> > > > to make it readable):
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0 subprocess.CalledProcessError: Command
> > > > =C2=A0=C2=A0=C2=A0 'tar --xattrs --xattrs-include=3D'*' -cf - -S -C=
 .../tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/rootfs -p . |
> > > > =C2=A0=C2=A0=C2=A0 tar --xattrs --xattrs-include=3D'*' -xf - -C ...=
/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/rootfs2'
> > > > =C2=A0=C2=A0=C2=A0 returned non-zero exit status 2.
> > > >=20
> > > > That error message is likely to confuse users, and the fix is not
> > > > obvious. So, error out if tar 1.34 or earlier is present on affecte=
d
> > > > distros and recommend upgrading or using the buildtools tarball.
> > > >=20
> > > > Signed-off-by: Paul Barker <paul@pbarker.dev>
> > >=20
> > > Hi Paul,
> > >=20
> > > So now, this is failing on several workers. Aren't we using buildtool=
s
> > > on rocky9 / stream9?
> > You're thinking of "[PATCH yocto-autobuilder-helper] config.json: Use b=
uildtools on RHEL9 derivatives"
> > https://lore.kernel.org/yocto-patches/20260331-rhel9-v1-1-e5c2cf815386@=
pbarker.dev/T/#u
> > ... not merged, yet.
> >=20
>=20
> Thanks! For some reason I thought it was merged.

Since we've now proven the sanity test works, I've merged the helper patch.

Cheers,

Richard

