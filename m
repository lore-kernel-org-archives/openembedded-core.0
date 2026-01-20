Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06916D26291
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 19:08:49 +0000 (UTC)
Received: from mail-106109.protonmail.ch (mail-106109.protonmail.ch [79.135.106.109])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12433.1768931594791868030
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 09:53:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=mGRtMNtS;
 spf=pass (domain: protonmail.com, ip: 79.135.106.109, mailfrom: pobrn@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1768931230; x=1769190430;
	bh=cioEo6sq7zCsRAQgHUY9loCIa/eNJoBtI0vxnVSFoCc=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mGRtMNtSbWDg16nfDQQ4L2v+MWOtMZjv4uSoFZC25w0tUcyLk34A8yvZHTtGIz/HS
	 0sR713KV5K6gpe4OQoNa7Uw4fkRVpOMMDUTEkeH+lpuBjlZ758RNQZfA0ebk8ysTtN
	 mCEWQ+xHbrwMx0pejTe5LmSf+ga5D27S7zPXd+Ze2xFEJ8t85BxcT7Ct2RjzsOwnC5
	 Qp4+LUZsfj0c5haW06J83iNSNBYRdn8y0xG3C1n4ms4VXw4V7esbhqDJMF3eKRw206
	 HXvB5Mm1Tjb06b0wowmrLG+3zH2FeQZzgAm/PHNBGgBz5MyKJPKQIH4DVbrfEj82Z9
	 ScbeUbgyfnUUQ==
Date: Tue, 20 Jan 2026 17:47:05 +0000
To: uvv.mail@gmail.com, openembedded-core@lists.openembedded.org
From: =?utf-8?Q?P=C5=91cze_Barnab=C3=A1s?= <pobrn@protonmail.com>
Subject: Re: [PATCH] time64: Use consistent TIME defines
Message-ID: <fb54cd99-7219-4a35-abd6-5044a5f11631@protonmail.com>
In-Reply-To: <20260120103834.1780598-1-uvv.mail@gmail.com>
References: <20260120103834.1780598-1-uvv.mail@gmail.com>
Feedback-ID: 20568564:user:proton
X-Pm-Message-ID: 68468fbe89748a630d1c8d4cf03e7af5a4a33343
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 19:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229787

Hi

2026. 01. 20. 11:38 keltez=C3=A9ssel, uvv.mail@gmail.com =C3=ADrta:
> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>=20
> Pipewire crashes when other dependent libraries are built with the
> different TIME and FILE_OFFSET defines. pw-v4l2/libcamera will most

That is specifically about "libcameraify", which is a similar LD_PRELOAD
library. I wouldn't mention it since this change does not affect the
libcamera recipe.


> likely not work with 32-bits that have 64-bit time but that has to be
> fixed in the respective projects.

As the removed comment correctly points out, __ioctl_time64, etc. is not ha=
ndled
in pw-v4l2. But I'm still not sure why the change was made originally in yo=
cto since
it won't make pw-v4l2 somehow work if an application uses __ioctl_time64.

In any case, the current situation is less than ideal, if pipewire and its =
dependencies
(e.g. alsa-lib) disagree about the size of time_t, etc; as two people have =
already
reported issues caused by this.


Regards,
Barnab=C3=A1s P=C5=91cze

>=20
> Related bug report:
> https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/5055
>=20
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
> ---
>   meta/conf/distro/include/time64.inc | 4 ----
>   1 file changed, 4 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/inclu=
de/time64.inc
> index 24a81c83f1..3ed0a4253d 100644
> --- a/meta/conf/distro/include/time64.inc
> +++ b/meta/conf/distro/include/time64.inc
> @@ -21,10 +21,6 @@ TARGET_CC_ARCH:append:x86 =3D "${@bb.utils.contains('T=
UNE_FEATURES', 'm32', '${GLI
>=20
>   GLIBC_64BIT_TIME_FLAGS:pn-glibc =3D ""
>   GLIBC_64BIT_TIME_FLAGS:pn-glibc-testsuite =3D ""
> -# pipewire-v4l2 explicitly sets _FILE_OFFSET_BITS=3D32 to get access to
> -# both 32 and 64 bit file APIs.  But it does not handle the time side?
> -# Needs further investigation
> -GLIBC_64BIT_TIME_FLAGS:pn-pipewire =3D ""
>   # Undefines _FILE_OFFSET_BITS on purpose in
>   # libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
>   GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers =3D ""



