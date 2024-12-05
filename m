Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF328E7716E
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 23:51:16 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.26010.1733442669873856251
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 15:51:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QuO5XI8/;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4349fd77b33so14582815e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 15:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733442668; x=1734047468; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DvZmJsxYbmMAn3Nk1sgye/kOCCm9mL1n+yyCwLT2G6Q=;
        b=QuO5XI8/qBZqVeqvMWZQeqGCfdgZW7SuSsdYT/vsBfWofrfxdOlbeFHemUJ79BavXW
         aVhkzeBdyyaMHEZdoH+krKz3063J+N56MBbFkithlBiy6PPT2yThflNpF+940jHedwIn
         VyUYE18q3qNi2gt5cMBwp83Kh2NnHrdrX5CxR5ZU64838ejp5x3Mgr7dJrSup+asRqXB
         OVWnv5ZDYBwO2HGLfSd29FbjOybrhPgMw0CO1JTMRV63LT84ISBoZ/j+sLRQj9puEVya
         f+8G+sZ83rbRseTlaLs24gIbQhcArfm9pjgbTza25duCrD+QjoAm3Z7oq8NIQh8tY+AQ
         6Mmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733442668; x=1734047468;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DvZmJsxYbmMAn3Nk1sgye/kOCCm9mL1n+yyCwLT2G6Q=;
        b=jg+ix3oXz9vvpKTNeVm8IidhS/XcWiO7pK1WraWUjr43JaCHzVHpPTSrr7veiVI3SR
         k3g+/ZodhgUAB5QVBI6BcINasSdVuPYRFDjtaHbwnLQb8ox0SIITM71tciJzxOREBcVJ
         1jV4cySRtsFdNRoM3lgV7SoY/SuLScbJjNzdRee5rMPmPeVj2FjaIDC0qQ+4lKugqWGZ
         G7gw+Pj/bM9Kc01ukkNnItIrPnOOG1MjoLPEhk9kQwunS8GQ5tyjxOK530Xk1Mtv1+9g
         5o5e1EXX6vClAdrKJvgzjqLcUo4xuu1xtDGK+GbH8Tq5eLT2Ge4X27LSvDA1PNzBSqdz
         yV5w==
X-Gm-Message-State: AOJu0Yy7KhX5MBGtHvDZztviYNpLN3wPseNIzpju8PMrt3nVxaJTaIsk
	3wMOm4vYCWaz0MAKIYfGJaDNY4In+IrOw0ZcA/8Q/6zN8FalA4GR
X-Gm-Gg: ASbGncv5MNrMOXa86Nzb1A34DWgsLSEOIfYR4xPO0sFeuBohvnbZffzXmUcXgdawLNh
	dQQY48Sy8LHCyUD8T1/B/LXu3NcjVP2ykJ7cwWrzVAE51FXbA2uk7Mul+ZhYx7R62+qxBUJUjBO
	dC30cylrN1rl6SFnI6GkvUcMM+GminxTGORYLzWoW79y8iC5I320KEgJNHDQN3xtKP3O8X9Bjzs
	ggLG/j5/9XpA8jj1FTTN1OyaIM4fhoW1RolbTWQJuR/jXOYpaTvN+ktSzawi4WGNATNPIzIuhn2
	02K7N0oVA3EGFJ7BU5QQ0cQ=
X-Google-Smtp-Source: AGHT+IHHGiIgD+DwFdU0Bfq+rStGYH6JQoioShpdt9JUZsKrmkFjApYH6VFD15Esa6b/LsV97k8daQ==
X-Received: by 2002:a05:600c:4710:b0:431:93dd:8e77 with SMTP id 5b1f17b1804b1-434ddeddbe5mr9454085e9.31.1733442667609;
        Thu, 05 Dec 2024 15:51:07 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0da461sm39533605e9.20.2024.12.05.15.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 15:51:07 -0800 (PST)
Message-ID: <2cf9f5fe20b351481ef08b9e13eca31c5ee02a85.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v4 0/3] uboot-sign: support ATF and TFE ITS
 generation
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: ross.burton@arm.com, "jamin_lin@aspeedtech.com"
 <jamin_lin@aspeedtech.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "troy_lee@aspeedtech.com"
	 <troy_lee@aspeedtech.com>
Date: Fri, 06 Dec 2024 00:51:05 +0100
In-Reply-To: <1762D5D7-817A-4852-920F-C6B57DAFD599@arm.com>
References: <20241118063233.698679-1-jamin_lin@aspeedtech.com>
	 <1762D5D7-817A-4852-920F-C6B57DAFD599@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 23:51:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208401

Hi Jamin, hi Ross

On Thu, 2024-11-28 at 13:51 +0000, Ross Burton via
lists.openembedded.org wrote:
> Hi Jamin,
>=20
> Thanks for the patches.
>=20
> However, I=E2=80=99m getting more convinced that as our FIT generation is
> spread between uboot-sign and kernel-fitimage, maybe we should just
> create a new class that is dedicated to creating a FIT image from
> arbitrary inputs, so in this case you=E2=80=99d have dependencies on tf-
> a/uboot/kernel and write a dts that describes the layout.=C2=A0 I=E2=80=
=99m
> unconvinced that the complexity of these classes is sustainable and a
> truly generic class might be a more maintainable alternative.

I apologize for digressing a bit now. But the complexity which requires
a redesign of the ftiImage generation code only becomes clear when you
look at the kernel and u-boot fitImage handling together.

I think that the generation of its files, as done by kernel-
fitimage.bbclass and uboot-sign.bbclass, is not generally wrong.
Writing an its file is not something that a user can do quickly. It
requires quite a lot of know-how, which is taken away from the user by
the existing code. The code is also relatively well tested, which I
can't imagine it can be achieved with handwritten its files.
Standardizing how its files should be written looks helpful to me in
general.

Handling the task dependencies is not easy either. Many artifacts and
keys must be provided by different recipes before the assembly of=20
fitImages can take place. Simply leaving it up to the user certainly
doesn't make it any easier.

But I agree, it ended up at an unmaintainable state. The main issue is
that the generator code in the kernel-fitimage.bbclass currently gets
executed from the kernel build folder and from the u-boot build folder
and that the u-boot and the kernel recipes have many inter task
dependencies. It does not properly work with the sstate-cache. For
example building with empty temp means rebuilding from scratch at least
when also an initramfs is involved. I tried to solve this with this
series here
https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D27108.
It is also possible to end up with circular task dependencies by
setting the UBOOT_* variables to SIGNED images, for example, and
packing a boot.txt file into the fitImage.

The idea that seems most promising to me to solve these problems (
sstate, maintainability, complexity, task dependencies) is to
completely remove the fitimage code from the kernel and the u-boot
recipes and create a linux-fitimage and an uboot-fitimage recipe that
take the artifacts from the linux and the u-boot recipes and simply put
them into a fit container. The fitimage_assemble and
uboot_fitimage_assemble functions would be reusable. All the rest would
probably be rewritten from scratch.
Some use cases in which, for example, the kernel Makefile (which can
run from the kernel build tree only not from a setscene folder
structure) generates the fitImage should simply be omitted in favor of
simplification.

Having for example a linux-yocto recipe which does not support building
fitImages at all and a second recipe linux-yocto-fitimage which depends
on the linux-yocto recipe would allow several improvements:
- The kernel artifacts can be forwarded via sysroots from linux-yocto
to the linux-yocto-fitimage. Currently it goes via deploy.
- The kernel-yocto-fitImage class could also provide a kernel package.
Currently this kernel artifact is only available from the deploy
folder.
- Standard sstate tasks (sysroot and deploy) can be used for building
the kernel and for building the fitImage. Doing all these steps in the
contecxt of one recipe leads to unusual sstated tasks which causes some
issues.
- I hope the code would be much simpler. But I'm not set sure. I want
to try this but did not find the time so far.

>=20
> What=E2=80=99s your opinion on this?=C2=A0 The fact that you had to add c=
ustom
> hooks in 2/3 seems to indicate that a more inherently flexible class
> would be the right approach.

I think the two new functions uboot_fitimage_atf and uboot_fitimage_tee
look reasonable and are in line with the existing code.

But the uboot_fitimage_user_image hook looks a little unusual. What's
the use case for that? Would it be possible to pass the its snippet as
a variable? Or even support the use case with a standard snippet?

All in all, I think these patches do not make it worse than it already
is. Solving the issues with the fitImage is a different topic.

Regards,
Adrian




>=20
> Cheers,
> Ross
>=20
>=20
> > On 18 Nov 2024, at 06:32, Jamin Lin via lists.openembedded.org
> > <jamin_lin=3Daspeedtech.com@lists.openembedded.org> wrote:
> >=20
> > v0:
> > =C2=A01. add variable to set load address and entrypoint.
> > =C2=A02. Fix to install nonexistent dtb file.
> > =C2=A03. support to verify signed FIT
> > =C2=A04. support to load optee-os and TFA images
> > v1:
> > =C2=A0Fix patch for code review
> > v2:
> > =C2=A0created a series patch
> > v3:
> > =C2=A0add cover letter
> > v4:
> > =C2=A0Add oe-self testcases for reviewer suggestion
> > =C2=A0Add documentation for reviewer suggestion.
> > =C2=A0Link:
> > https://patchwork.yoctoproject.org/project/docs/patch/20241118062113.26=
9253-1-jamin_lin@aspeedtech.com/
> >=20
> > =C2=A0The following patches had been applied from v0 changes.
> > =C2=A0a. Fix to install nonexistent dtb file
> > =C2=A0b. support to verify signed FIT
> > =C2=A0c. add variable to set load address and entrypoint.
> >=20
> > Jamin Lin (3):
> > =C2=A0uboot-sign: support to create TEE and ATF image tree source
> > =C2=A0uboot-sign: support to create users specific image tree source
> > =C2=A0oe-selftest: fitimage: add testcases to test ATF and TEE
> >=20
> > meta/classes-recipe/uboot-sign.bbclass=C2=A0=C2=A0 | 100 +++++++-
> > meta/lib/oeqa/selftest/cases/fitimage.py | 288
> > +++++++++++++++++++++++
> > 2 files changed, 387 insertions(+), 1 deletion(-)
> >=20
> > --=20
> > 2.25.1
> >=20
> >=20
> >=20
> >=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207991):
> https://lists.openembedded.org/g/openembedded-core/message/207991
> Mute This Topic: https://lists.openembedded.org/mt/109640118/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


