Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE31DCC6B0E
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 07:07:42 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1768.1791875255181311066
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 00:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=w5yN81Ps;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so15755495e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 00:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791875253; x=1792480053; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u4ouosuNY/BrkJUBrRFvyic4vOmnxbrBOmDd8Y3j10Y=;
        b=w5yN81Ps3iTdMWWYPkRbfOv6DEEuIf5GqcV1tOwJMTeT5T3LJYjoZ47weeRRxS3ffd
         nu2kQerPl9jKfKdd54KCokllhhRuBBozq1EotxpJuJaWlIGPShLaRZ0IGKYAYKel0ARp
         FxVZkAXUmf/7CeCjX70P7JZfNcVOYa1IgVMPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875253; x=1792480053;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u4ouosuNY/BrkJUBrRFvyic4vOmnxbrBOmDd8Y3j10Y=;
        b=AKUCP9jiPp5uHCux7oz/p4jddTbpdobh5VrGuw0JBCoj2HluTDGBrFBJygWkp2UOE3
         pDKnB0N0CEOjAPlk1jLiAIgE/TwB8OHimefxF/bDsW9QjeupHAepysQGydl2yDjz+Q2Z
         1tHRSBUWx0swUm/DP2XkKagRTG6TtNPX0H0t51YZvzn2YtDXz9tq0+gkGMOnBJc1O4jN
         H0aXi62PD6Vukr1FEKAZ5wk0KX7vbBpeDYw3RgfwoZBERApVeLBJ1FYsqwOgM6pGgjQJ
         FUYMyqUfth5q1+KARu52ITrP4LYqlnCgM407XvEbr6XRJsYl71ky1maX4YHT1Dz4GYAZ
         GsgA==
X-Forwarded-Encrypted: i=1; AKwUvBzV8E47zv3eBIUkkH8A6LqoYhp0g04AqlR42M0oFeN657daGBAl0fKAYNWpEO5fYtM79zlVQHvnOgeBwHt0v/zzWw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYIr5cBynZH0SzH2aiFa4GPbd+QVdYzQ7+de0lsDuzgYnrRYT6lK
	BMxFLwlGx30HQL35AqJNIrDIxmhp7lCoqT6AkI1TCziToI4MD5efoIuORz+mwkBMDAg=
X-Gm-Gg: AYBFou3r3nNkr3HSB9qarW5mk6fHMu625w8c2E89oTGS/4dYIy+wYL4EbunUrOfHcIq
	w5WZHNxbUKBFCE3Q0Iriid/ls6jbguPskU+YYRrgpEzGaS+bOmLZik5ZnK21+GhBIP4eaBegor4
	7+E2y3dSF5TCTfw3GxfJktZkI9Y7g/oQWt7AFb8RcpHkym+3vE3ZdpaVIRXXCCzFpimbzG1U6Vp
	v1fRtQyxoEof0n18F/5FQZXrvZhS7g5TG7XMxSnzU80u5dqY8ew+bHQPhiLNZpjm1Erpfb8OOMR
	m+KPsa9+UWLhMkgACm04cYJGF7Q6dJOmfzDXaw17ZAQjUXs6AWBDR4VYEmQjNTtByNZ/jgfGINB
	8/KchFUb1NJ3mLpBoz6yA+vc9Dc+8Jn9iqQQTQ9efE3rGLlUlo6iwlOe7ackcpNRYrxQ0ugrujL
	oGFPkhw+G9IjWoEx2C7Pd4nJmsAnS4X6Gn1mSXccZEHEsfEPNowMKn1ryFT76yQmSSZZZjdbcDV
	CSv/osSnKBKyQ+6Xw3eH6idDMb/vPZJL8K/vElWH5OMLrHb1xMDTYaPQqJs
X-Received: by 2002:a05:600c:3b29:b0:49f:ce78:3561 with SMTP id 5b1f17b1804b1-4a18e49c420mr216442705e9.18.1791875253229;
        Tue, 13 Oct 2026 00:07:33 -0700 (PDT)
Received: from localhost (2a02-8440-2605-485d-f30c-a3cf-2eac-16ad.rev.sfr.net. [2a02:8440:2605:485d:f30c:a3cf:2eac:16ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm3332773f8f.36.2026.10.13.00.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 00:07:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 09:07:31 +0200
Message-Id: <DM3IRINXDTGO.2NLDKY3Y0YD8T@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] connman: fix syslog identity with
 glibc
X-Mailer: aerc 0.20.0
References: <20260929093009.847328-1-gael.portay+rtone@gmail.com>
 <DLUGAJL0DW01.2UDQ8P6GXPBUN@smile.fr>
 <DM3GKQKJ8VE0.1XOVP37F28VC4@gmail.com>
In-Reply-To: <DM3GKQKJ8VE0.1XOVP37F28VC4@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 07:07:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247697

On Tue Oct 13, 2026 at 7:24 AM CEST, Ga=C3=ABl PORTAY wrote:
> Hello Yoann,

Hello,

> On Fri Oct 2, 2026 at 5:17 PM CEST, Yoann Congal wrote:
>> Hello,
>>
>> On Tue Sep 29, 2026 at 11:30 AM CEST, Ga=C3=ABl PORTAY via lists.openemb=
edded.org wrote:
>> > The connman syslog patch modifies the handling of the ident string to
>> > solve a build issue with musl.
>> What "connman syslog patch"?
>> I'm having a hard time understanding this patch...
>>
>
> I am sorry to hear that.
>
> By "connman syslog pach", I wanted to reference that downstream change:
>
> 	0001-src-log.c-Include-libgen.h-for-basename-API.patch
>
> I can reword the commit message if it is unclear; or I can remove some
> parts of it that bring some unnecessary noise.

Yes, please reword to make it clearer. No need to remove parts though.

>> > (...)
>> >
>> > This removes 0001-src-log.c-Include-libgen.h-for-basename-API.patch[4]
>> > from the SRC_URI if libc-glibc overrides so that it is not applied whe=
n
>> > using glibc.
>>
>> Hmm, this patch moves "0001-vpn-Adding-support-for-latest-pppd-2.5.0-rel=
ease.patch"
>> not 0001-src-log.c-Include-libgen.h-for-basename-API.patch"
>>
>
> Oops, I made a terrible mistake; let me respin a v2 to fix this.
>
> Note that I have that following change in a .bbappend; this would
> explain why I have not figured it out :facepalm:
>
> 	SRC_URI:remove:libc-glibc =3D "file://0001-src-log.c-Include-libgen.h-fo=
r-basename-API.patch"
>
> Again, I am sorry for that mistake; and I will retest it correctly later
> this day.
>
>> > (...)
>> >=20
>> > This fixes commit 992d59564b84333740e6465ec696238274b73938.
>> Where it this commit from? I can't find it in oe-core nor poky.
>>
>
> This is weird, it comes from poky tree: 992d59564b (connman: Fix build
> with musl). And you are right, it is not part of oe-core.
>
> Nevermind, I wanted to link this change in poky tree:
> https://git.yoctoproject.org/poky/commit/?id=3D992d59564b84333740e6465ec6=
96238274b73938
>
> Or that one in oe-core tree:
> https://git.openembedded.org/openembedded-core/commit/?id=3Dd0139bcbe0499=
e570f02f8f7b7e364763f7359ec


Huh, weird, I believed I checked poky.
Anyway, I'd rather have a oe-core sha1(+commit title) reference instead
of a poky one.

>
>> > (...)
>> > diff --git a/meta/recipes-connectivity/connman/connman_1.42.bb b/meta/=
recipes-connectivity/connman/connman_1.42.bb
>> > index 9b3abbe258..5c8bdd43f2 100644
>> > --- a/meta/recipes-connectivity/connman/connman_1.42.bb
>> > +++ b/meta/recipes-connectivity/connman/connman_1.42.bb
>> > @@ -5,13 +5,14 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/network/${BPN=
}/${BP}.tar.xz \
>> >             file://0001-connman.service-stop-systemd-resolved-when-we-=
use-co.patch \
>> >             file://connman \
>> >             file://no-version-scripts.patch \
>> > -           file://0001-vpn-Adding-support-for-latest-pppd-2.5.0-relea=
se.patch \
>> >             file://0001-src-log.c-Include-libgen.h-for-basename-API.pa=
tch \
>> >             file://CVE-2025-32743.patch \
>> >             file://CVE-2025-32366.patch \
>> >             "
>> > =20
>> > -SRC_URI:append:libc-musl =3D " file://0002-resolve-musl-does-not-impl=
ement-res_ninit.patch"
>> > +SRC_URI:append:libc-musl =3D " file://0001-vpn-Adding-support-for-lat=
est-pppd-2.5.0-release.patch \
>> > +                             file://0002-resolve-musl-does-not-implem=
ent-res_ninit.patch \
>> > +                           "
>> > =20
>> >  SRC_URI[sha256sum] =3D "a3e6bae46fc081ef2e9dae3caa4f7649de892c3de622c=
20283ac0ca81423c2aa"
>
> Here is what the change would look like:
>
> 	@@ -6,12 +6,13 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/network/${BPN}/=
${BP}.tar.xz \
> 	            file://connman \
> 	            file://no-version-scripts.patch \
> 	            file://0001-vpn-Adding-support-for-latest-pppd-2.5.0-release=
.patch \
> 	-           file://0001-src-log.c-Include-libgen.h-for-basename-API.patc=
h \
> 	            file://CVE-2025-32743.patch \
> 	            file://CVE-2025-32366.patch \
> 	            "
> =09
> 	-SRC_URI:append:libc-musl =3D " file://0002-resolve-musl-does-not-implem=
ent-res_ninit.patch"
> 	+SRC_URI:append:libc-musl =3D " file://0001-src-log.c-Include-libgen.h-f=
or-basename-API.patch \
> 	+                             file://0002-resolve-musl-does-not-implemen=
t-res_ninit.patch \
> 	+                           "
> =09
> 	 SRC_URI[sha256sum] =3D "a3e6bae46fc081ef2e9dae3caa4f7649de892c3de622c20=
283ac0ca81423c2aa"=20

This change does look better :)

Thanks!
--=20
Yoann Congal
Smile ECS


