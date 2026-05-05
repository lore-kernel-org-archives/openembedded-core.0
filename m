Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2ECCD342F
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 07:35:40 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33852.1777966533381880597
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 00:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VGz7RCeL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d77f6092eso2981394f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 00:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777966532; x=1778571332; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DYO9I5udZ4ZM2oVMx5vmLS/BIkAkmQwnScBAf6ydVow=;
        b=VGz7RCeL5WQunJ4JH/cA2cWn2zo8sK+NEcvYWjNaFgMmr0NIkiixYYipI68bF+F0sy
         EFQzm6svfQqJfgl36IRI6DZHSgZ6e7Ntd3V3d+ZgSc+v5+jtkYHnKjCy2gW6byHZ12r8
         dNUfiPqkwornixePgCrIt+BmnZdq+VTWMuqSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777966532; x=1778571332;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DYO9I5udZ4ZM2oVMx5vmLS/BIkAkmQwnScBAf6ydVow=;
        b=n3IEFzVaxUooPItFd2g+CziN5LD0fILS7LhWpYTk8txVmUwepoMhYIpqq1sMi/qnTO
         IO4fAetrSuMVmlz2nykD8NEqgPxMk/Qd7yN9lw2Fhj7g3k1KiZ2pUx4y2KJg/lNuzdkp
         1iGxAA3DjWtMv8TSed0ABgQsjHQ8nTG9ZswfyJFEwB5T8jBrNCVsrElCTBLp9sCDZLJx
         U8YMqyFi715T228rK5QLhbPCKJnsm41h43LDP8o7FJKBOz9Sb6ZdX9QmBi194AdEFZj5
         sG1ZdAElLOirL3z3DGmbVuwt0YPZ2mnWZsXkRAeVQ+37FHVGqj2V/BVf5Pwu4NYP7NZ6
         uI2w==
X-Gm-Message-State: AOJu0YwWUCLzhRbolzdXgxXsogniFW0hUycJ2tUuH0pL4S0e4Tfjqy75
	58wl2NzKA06EcFbZOrP9gIZNmCduNj4KZcKeeV6kpv4kVGdwgCgu4gMAdpBF+hq7NBI=
X-Gm-Gg: AeBDievy/ahPwsitP94KfuPJvES1oPNJC4MQlqlK94IQo4QhFJdJDfmItXnMiPOlPRL
	OHnzgz9XOhbbWEnnjJwx2pAzQV+4FySsve0nSWqpHMty3uXUk+eDkLXBy2SJmcrSw6PWH/vRfBN
	nrgZdMdXK5pAxpcHFYdnTAe2QTMlPt5Ex7Tv9ciQpuEQ5LoK1akpQb4myHmnB3g7YRrJhtQc8ym
	BujzZKdyLwZbZ/1Tnv1Eh1NiCZaefxjpPiQ7Hr7IWf6NQNNDSJmGSjfaEALDVd2UAyVz625gqCc
	yq9E/1OOrQ1s18NAv2io8ZGAybfYq1lvOpwzE620LeHXaOwr1xlJvc0hAypKshZvSpJsIisXxLo
	N7V4JK+8IZmDypzaW/TL0j/sDiLJbCZmfqBN90Q3zL9kpDteZymzGN+baEQ5W7Hqfw2Jwq/DyT8
	QAVFFoKVXEBq/Kx/yR2+R2lwxeAjESphNO2me5p81r3H44TSG9mQvFF/r+tSPW21C7+ihr6wauu
	LOSUCrdnZ0neI0RQXZBDBpHNndpdiPl6M1v/A==
X-Received: by 2002:a5d:5d0b:0:b0:441:2381:b630 with SMTP id ffacd0b85a97d-45005c8121dmr3529972f8f.24.1777966531577;
        Tue, 05 May 2026 00:35:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8349:ba09:9e5a:e125? ([2001:8b0:aba:5f3c:8349:ba09:9e5a:e125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960811sm2397263f8f.27.2026.05.05.00.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:35:30 -0700 (PDT)
Message-ID: <45197306bdcc0184f75433e69da7f8c29c32ef52.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] license.bbclass: only create hardlinks
 within $TMPDIR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <ravi@prevas.dk>
Cc: openembedded-core@lists.openembedded.org, chbs@prevas.dk, emkan@prevas.dk
Date: Tue, 05 May 2026 08:35:28 +0100
In-Reply-To: <878q9zsdhn.fsf@prevas.dk>
References: <20260501183615.2728124-1-ravi@prevas.dk>
		<2130c0c232f6f4e0bebe64c4b3838d2de5ce022b.camel@linuxfoundation.org>
		<87cxzbshkn.fsf@prevas.dk>
		<0a68ea544451d546991ca5b532204af6fe3b6e69.camel@linuxfoundation.org>
	 <878q9zsdhn.fsf@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 07:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236463

On Mon, 2026-05-04 at 11:58 +0200, Rasmus Villemoes wrote:
> On Mon, May 04 2026, Richard Purdie <richard.purdie@linuxfoundation.org> =
wrote:
>=20
> > On Mon, 2026-05-04 at 10:30 +0200, Rasmus Villemoes wrote:
> > > On Sat, May 02 2026, Richard Purdie <richard.purdie@linuxfoundation.o=
rg> wrote:
> > >=20
> > > > On Fri, 2026-05-01 at 20:36 +0200, Rasmus Villemoes via lists.opene=
mbedded.org wrote:
> > > > From: Rasmus Villemoes <ravi@prevas.dk>
> > > >=20
> > > > This is _not_ meant to be applied, but merely acts as a place to st=
art
> > > > a discussion.
> > > >=20
> > > > > In our CI setup (which is gitlab-based, but I'm not sure that's t=
oo
> > > > > relevant), we sometimes see spurious errors like
> > > > >=20
> > > > > =C2=A0 touch: setting times of '[...]/rootfs/usr/share/common-
> > > > > licenses/go2rtc/COPYING.MIT': Operation not permitted
> > > > >=20
> > > > >=20
> > > > > I do understand that using hard links is quite valuable for savin=
g
> > > > > time and space (I see GPL-2.0-only having 135 links, so that alon=
e is
> > > > > a few MB), which is why I don't think this should be applied as-i=
s.
> > > > >=20
> > > > > Could we do something like create a $TMPDIR/license-pool/, and
> > > > > whenever encountering a src not inside TMPDIR, copy that file to
> > > > > $TMPDIR/license-pool/<basename>-<sha256 of source> [if it doesn't
> > > > > already exist], and then use the latter as src in the subsequent =
"can
> > > > > we hardlink" logic? That would then also improve the case where t=
he
> > > > > meta-layers are (bind)mounted R/O, and we thus always end up copy=
ing.
> > > >=20
> > > > I agree it does look like there is a potential issue here.
> > > >=20
> > > > I'm not sure we have ever claimed isolation between the build metad=
ata
> > > > and the builds, I know that for example patch files are linked in, =
so
> > > > that when you update patches, it updates the metadata more easily. =
I
> > > > can see why you might want that, equally, the ability to update pat=
ches
> > > > that way is a nice usability feature.
> > > >=20
> > > > Did you track down where the utime of the files was being changed? =
From
> > > > the link, it looks like:
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0 find=C2=A0 ${IMAGE_ROOTFS} -print0 | xargs -0 to=
uch -h=C2=A0 --date=3D@$REPRODUCIBLE_TIMESTAMP_ROOTFS
> > > >=20
> > > > in reproducible_final_image_task in image.bbclass
> > >=20
> > > Yes, it it precisely that command/function where it triggers.
> > >=20
> > > > I think that function could be changed to clamp to anything newer t=
han
> > > > REPRODUCIBLE_TIMESTAMP_ROOTFS rather than changing all files, and t=
hat
> > > > might actually avoid the issue.
> > >=20
> > > I don't see how. First, how would that then serve the purpose of
> > > producing something reproducible? It seems that the timestamps would =
or
> > > could then depend on when the meta-data repo was cloned. Second, if t=
he
> > > mtime is still going to be changed sometimes under some conditions, t=
he
> > > problem is not really gone. And third, I think it would make the
> > > implementation much more complicated, if one would need to make a
> > > decision for each file for whether to touch it or not (i.e. the simpl=
e
> > > find|xargs would no longer suffice).
> >=20
> > Pretty much all the rest of the system works like this for
> > reproducibility. Whether you make everything
> > REPRODUCIBLE_TIMESTAMP_ROOTFS or just clamp to a max value of
> > REPRODUCIBLE_TIMESTAMP_ROOTFS doesn't really matter since you're using
> > that value regardless.
> >=20
> > Basically anything touched as part of the build process (newer than the
> > timestamp) would be reset, everything else (older than that) should be
> > deterministic.
> >=20
> > The value of the actual timestamp used is a different discussion but
> > we're not changing that.
> >=20
> > Having thought about this a bit, I do think that is the right solution,
> > and it does match how we handle timestamps elsewhere like the packages.
>=20
> OK, but then that still wouldn't solve the problem we see, where the
> build has decided that it can create a hard link, but then later it
> fails to perform the futimensat syscall because the user running bitbake
> is not (apparently) the user owning the inode.
>=20
> As I said, I don't really understand how that actually sometimes happens
> and most of the time doesn't, perhaps it is some weird interaction
> between how gitlab starts docker containers and perhaps with some pseudo
> in the mix.

I'm forgetting that git doesn't give consistent timestamps upon
checkout. If it did, my suggestion would work however it does not.

I still don't think we should be changing every timestamp in an image
as most timestamps should already be consistent. Where we copy data
from source control into the image, we are going to need to do
something though.

To hit the error, you're probably using license_image.bbclass and
hitting the:

          oe.path.copyhardlink(pkg_license, rootfs_license)

codepath by having COPY_LIC_MANIFEST set?

Perhaps the answer is just not to hardlink the files into the image in
license_image.bbclass? I think the other usages are safe...

Cheers,

Richard



