Return-Path: <gael.portay+rtone@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FA1CC6B03
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 05:24:51 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.743.1791869081936833802
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 22:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IIld+Qvd;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: gael.portay+rtone@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b09c273caso357859f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 22:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791869080; x=1792473880; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:sender:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fU9Njhq9GiJ6rRkmtvGkLKgKe8BSpOUMBPZnguyqWcc=;
        b=IIld+QvdK77+/+SOJNOyqc4sWZgORMVohsXvuAmm72QY/6TK7L4XETcx5iSsv00KMG
         4unZ9GD2oirzl8R9TJaeOhk+RZ8q6M6mq8O4WLluk71mt6KWBt36fToUiMf3XY1JCq8/
         IRF/wbsj7oZj7Tr6Ahl7gKZdo8JEfxzfFc3hfcQF7yaq/OeI5aYMHdLVfOkT9Gte7LzL
         OJMBMwqQckew5zfujHxNaxIc4fytzspmNk5sXVlEV014Md4z11US4IN2w31l9a1vqipp
         BFgDA4eY8ywLBSSjLxxBkJt1FQPi314VxPaMZr+kedSfqztdFBs5gmhgQS91Rda0vx4Z
         S/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791869080; x=1792473880;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fU9Njhq9GiJ6rRkmtvGkLKgKe8BSpOUMBPZnguyqWcc=;
        b=GVJRTJZaCk3IIYt0rIJF+w0nWFrJEyjmn65CJ9VrQUBWl4pBU8tbCJKT5C4G1mGtig
         ncTtq867UeIiU2VDWzOX2PbywrguLwLqLsws+HftLm7NGNgu5WtGdrWfHsbRaFMpMnOG
         fFdvn2+FEnC40DgfvUo+AyfjK0e2EBcnpY0Yn5wKdOCCQI4Fh91xXdLfji/JAaKMlhXh
         DPd9S3XR2XbdOfvnVAI5szHe+tp5Dj/6avmIFK3b/Xi/QCoKR57pYIkE0pfu7IYlcFQD
         5K4DhIC3Jd9Vhd0PupHcLbgb7OVKfi+Mw9z3ZKWDXNs0imtd6pVJj7xTJB78HyMHq62b
         0G4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzXFNg3fDnhkwadv3FZNrG21QizkpJ9mGJQYklBxxA45QG4qImT/g02BXuNBCoMs7e1haYhrNw6z4vmohhUTDZITw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLrQPP0AtUUjEjiw/n/tjY2WfEpRVb+NRXDn93oMX2DnMnLG/Uo
	+wEHkjyKjY6083W8tbhP92eEimU5eZ4U+I5H1+vJdiheHqIO7Uy1KdZl
X-Gm-Gg: AYBFou1vpgEMJBkfZIlVUMxEXlX/+3LixtNWrZXyHN/kXa4Jvw6Qit4nF5emwN8k+Gv
	m78JjiI4KE1ZWVa37a0Qk0XP51J9t/4GJQie4urTHCetJBMR9RYa2I5zcsMSDsVs9Qpaji407MF
	bv5rKrl9PSwhpuO38HeXvTWoq6r9YAamp43ftohR5NxqDgPsF8VMhi20Yut4u+8QZ7KVKHefYoO
	xB9JqeotiZwNHwfFDD7Zf3MOG0UNlxezOZyugcIMUaEyw/O673YIX7Tal7MUicuVPT/qSJ+dl3B
	+pl/+3DyzAU/2EG97SxQWFu0SBL7UCJVdhfCgwK2/aMA2wZHrjI4Ix7zdYBU/rq+z2rjSj9Bxut
	DlGTvWmRbMk0Tb/X+zbyjuYBIoZkqjNF22TRTRemZecNdyX4AofBE0mRZCi+Z/acAW7lXiNGJbj
	tVqxOqWiSJsuMZ61PZLhsiZg3vVaIRGd/Sgt4CyxOQO32aXS4mDNC35UBIR1+hthJlBskr9ig8Y
	xPzCGbo/vC+zyU94GDLy1zt9UhUjwqtTmlCF1/0
X-Received: by 2002:a05:600c:4ecc:b0:4a1:7dcf:be1f with SMTP id 5b1f17b1804b1-4a18e476022mr243882865e9.1.1791869079450;
        Mon, 12 Oct 2026 22:24:39 -0700 (PDT)
Received: from localhost ([2a01:e0a:1169:72f0:c42f:9430:647a:4c7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19ba624b3sm217308505e9.2.2026.10.12.22.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 22:24:38 -0700 (PDT)
Sender: =?UTF-8?B?R2HDq2wgUE9SVEFZ?= <gael.portay@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 07:24:38 +0200
Message-Id: <DM3GKQKJ8VE0.1XOVP37F28VC4@gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] connman: fix syslog identity with
 glibc
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.17.0
References: <20260929093009.847328-1-gael.portay+rtone@gmail.com>
 <DLUGAJL0DW01.2UDQ8P6GXPBUN@smile.fr>
In-Reply-To: <DLUGAJL0DW01.2UDQ8P6GXPBUN@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 05:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247695

Hello Yoann,

On Fri Oct 2, 2026 at 5:17 PM CEST, Yoann Congal wrote:
> Hello,
>
> On Tue Sep 29, 2026 at 11:30 AM CEST, Ga=C3=ABl PORTAY via lists.openembe=
dded.org wrote:
> > The connman syslog patch modifies the handling of the ident string to
> > solve a build issue with musl.
> What "connman syslog patch"?
> I'm having a hard time understanding this patch...
>

I am sorry to hear that.

By "connman syslog pach", I wanted to reference that downstream change:

	0001-src-log.c-Include-libgen.h-for-basename-API.patch

I can reword the commit message if it is unclear; or I can remove some
parts of it that bring some unnecessary noise.

> > (...)
> >
> > This removes 0001-src-log.c-Include-libgen.h-for-basename-API.patch[4]
> > from the SRC_URI if libc-glibc overrides so that it is not applied when
> > using glibc.
>
> Hmm, this patch moves "0001-vpn-Adding-support-for-latest-pppd-2.5.0-rele=
ase.patch"
> not 0001-src-log.c-Include-libgen.h-for-basename-API.patch"
>

Oops, I made a terrible mistake; let me respin a v2 to fix this.

Note that I have that following change in a .bbappend; this would
explain why I have not figured it out :facepalm:

	SRC_URI:remove:libc-glibc =3D "file://0001-src-log.c-Include-libgen.h-for-=
basename-API.patch"

Again, I am sorry for that mistake; and I will retest it correctly later
this day.

> > (...)
> >=20
> > This fixes commit 992d59564b84333740e6465ec696238274b73938.
> Where it this commit from? I can't find it in oe-core nor poky.
>

This is weird, it comes from poky tree: 992d59564b (connman: Fix build
with musl). And you are right, it is not part of oe-core.

Nevermind, I wanted to link this change in poky tree:
https://git.yoctoproject.org/poky/commit/?id=3D992d59564b84333740e6465ec696=
238274b73938

Or that one in oe-core tree:
https://git.openembedded.org/openembedded-core/commit/?id=3Dd0139bcbe0499e5=
70f02f8f7b7e364763f7359ec

> > (...)
> > diff --git a/meta/recipes-connectivity/connman/connman_1.42.bb b/meta/r=
ecipes-connectivity/connman/connman_1.42.bb
> > index 9b3abbe258..5c8bdd43f2 100644
> > --- a/meta/recipes-connectivity/connman/connman_1.42.bb
> > +++ b/meta/recipes-connectivity/connman/connman_1.42.bb
> > @@ -5,13 +5,14 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/network/${BPN}=
/${BP}.tar.xz \
> >             file://0001-connman.service-stop-systemd-resolved-when-we-u=
se-co.patch \
> >             file://connman \
> >             file://no-version-scripts.patch \
> > -           file://0001-vpn-Adding-support-for-latest-pppd-2.5.0-releas=
e.patch \
> >             file://0001-src-log.c-Include-libgen.h-for-basename-API.pat=
ch \
> >             file://CVE-2025-32743.patch \
> >             file://CVE-2025-32366.patch \
> >             "
> > =20
> > -SRC_URI:append:libc-musl =3D " file://0002-resolve-musl-does-not-imple=
ment-res_ninit.patch"
> > +SRC_URI:append:libc-musl =3D " file://0001-vpn-Adding-support-for-late=
st-pppd-2.5.0-release.patch \
> > +                             file://0002-resolve-musl-does-not-impleme=
nt-res_ninit.patch \
> > +                           "
> > =20
> >  SRC_URI[sha256sum] =3D "a3e6bae46fc081ef2e9dae3caa4f7649de892c3de622c2=
0283ac0ca81423c2aa"

Here is what the change would look like:

	@@ -6,12 +6,13 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/network/${BPN}/${=
BP}.tar.xz \
	            file://connman \
	            file://no-version-scripts.patch \
	            file://0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.p=
atch \
	-           file://0001-src-log.c-Include-libgen.h-for-basename-API.patch =
\
	            file://CVE-2025-32743.patch \
	            file://CVE-2025-32366.patch \
	            "
=09
	-SRC_URI:append:libc-musl =3D " file://0002-resolve-musl-does-not-implemen=
t-res_ninit.patch"
	+SRC_URI:append:libc-musl =3D " file://0001-src-log.c-Include-libgen.h-for=
-basename-API.patch \
	+                             file://0002-resolve-musl-does-not-implement-=
res_ninit.patch \
	+                           "
=09
	 SRC_URI[sha256sum] =3D "a3e6bae46fc081ef2e9dae3caa4f7649de892c3de622c2028=
3ac0ca81423c2aa"=20
=09
>
> Regards,

Regards,
Ga=C3=ABl

