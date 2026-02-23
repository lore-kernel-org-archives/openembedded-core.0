Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5C5EEC2AC
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 23:02:35 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8041.1771887747251078389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 15:02:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=b2thawzg;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-483703e4b08so38853975e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 15:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771887745; x=1772492545; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHhJBKVo7l3IAs/PKLnyfDM7QElckq3b5GOQ5SKTCLg=;
        b=b2thawzg5xPwKkfge23o5X1m9fUHttzHsXgnMJutY6o4fbZJWVh5dZZGgIRfoI7js9
         s4DeWABSG3zZgsoVxxTuMIxcsf0erzoukO0OB77NqF/6swB2DerF1KPIotU6JGpB7iOb
         OHyxTUS7ZyQx2mYi/08WBW17Ahh7D8bUmNZmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771887745; x=1772492545;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PHhJBKVo7l3IAs/PKLnyfDM7QElckq3b5GOQ5SKTCLg=;
        b=QcsBu77Coa2q0SR4dBzjuJNtRVJ02Ogbe9Zj+KF6N7jZj9d7zSLH1+8iBnoIID+dhR
         dLHKorU1Se9OW8ugzOiTqjTzsp+PPgIK49sFNKeCnuIPDcAe/eKWPut8vWtjDqPE0GPi
         4YlU1UoFIzHcyPAkQn80s+j2stliLJZLQjm8cbO8/xXvx4ais0ZNFSdm41K1KTQ1iyu+
         c4v9wkFwk2KrrmWilvf/+hjuYHj+T0nIlQJ7ZHRgxfz6xYbSe/B2FjZLyNGtdeyVmaKs
         N4Sh28npFtlzJvJQo2tEbxd+GxEr/t5cPJeT+1P/TE2IOSVoRP21eiQty+mFvINYcVwT
         ZedA==
X-Forwarded-Encrypted: i=1; AJvYcCUZPD2AsX+N14bEoGzIQ41fblrWBjORZKh8V1jV0pYsohvq3MNmMuCW1pNW0jgD/bIUfYse9m6ShWUfZ0gz4Zmc2w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwWgZScOFCX84wbAWuBLdydNr1G5xon3tED4C510is8d2KpOtDB
	VffjmUyfQAU239EGU0ztWFu1rRAQUZg5/tFsT0h+Pcj5KPaOLWGFHrSknOqXDyx/du0=
X-Gm-Gg: AZuq6aIPqdyeAjzGt4ITgbs6DeAx4Sdij6rpE6g+ZU4QjzGuakDNQa4sOqnprPvzWQL
	ks/+2sbiLZuFar0jJwv3QGjyZqPTtAU9IbghLji1IYtAo8KD0fDL9luC0RGR89PFK54T1vHWjUd
	oKtNaGSCzc3xVRFqKJwKA+hqqeLPgHht06awxtz65iwurwOPM6XO2sZjb4RWv/Kb9BKm3gWkMHh
	uu9RQYMJqNPEOKV29QPki8i+dD5qPuAKs/5JAyQK24TNE81G0Y1FbNhNz2w8e4iAREx3Y5HhhQ+
	rzU1Sy3wi8mSLR20TIi53Ie4qtB0NRWnLaMdffRZNCenYj5DbHE8x/2GJ369e7eNgtUDPixRQDW
	cYwissR32pFkSHxviz0olVsj2/aTr1sLmHeeSEswtZoF1AYAW5Ia+qjYbi8ofylN4bOE5cfrm8N
	fboruoRfqj5XNfpWkh8ieDceltEittvxE/wWgZuWWDfEaAerlHi1HG3pv0blNwVrs=
X-Received: by 2002:a05:600c:1d1c:b0:480:4a90:1afd with SMTP id 5b1f17b1804b1-483a94a99e4mr159153385e9.0.1771887745215;
        Mon, 23 Feb 2026 15:02:25 -0800 (PST)
Received: from localhost (adijon-653-1-227-9.w90-26.abo.wanadoo.fr. [90.26.90.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31f9475sm268355725e9.14.2026.02.23.15.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 15:02:24 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 00:02:24 +0100
Message-Id: <DGMPS8E8ZMBA.R3VK2ICLSFLS@smile.fr>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "colin.mcallister@garmin.com"
 <colin.mcallister@garmin.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [kirkstone][PATCH] ffmpeg: ignore CVE-2025-25469
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260223165403.799551-1-colin.mcallister@garmin.com>
 <DGMI6FDG7CU2.1A5CLEIO7VN88@smile.fr>
 <AS1PR10MB5697CEEA094ACB0543A1F3ADFD77A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697CEEA094ACB0543A1F3ADFD77A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 23:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231717

On Mon Feb 23, 2026 at 6:49 PM CET, Peter Marko wrote:
>
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Yoann Congal via
>> lists.openembedded.org
>> Sent: Monday, February 23, 2026 18:05
>> To: colin.mcallister@garmin.com; openembedded-core@lists.openembedded.or=
g
>> Subject: Re: [OE-core] [kirkstone][PATCH] ffmpeg: ignore CVE-2025-25469
>>=20
>> On Mon Feb 23, 2026 at 5:54 PM CET, Colin McAllister via
>> lists.openembedded.org wrote:
>> > Missing free introduced by commit d38fc25 and fixed by commit d5873be.
>> > The first version tag that contains both commits is in n8.0, so no
>> > ffmpeg release is vulnerable.
>> >
>> > Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
>> > Change-Id: I91f0aaad8ddcfaa2acac541470aebc9abe88b0d4
>> Hello,
>>=20
>> This was already sent: https://lore.kernel.org/openembedded-
>> core/20260220183454.16315-1-peter.marko@siemens.com/
>>=20
>> I'm reviewing the kirkstone patches now, I will send this soon.
>
> Hello Yoann,
>
> Thanks for updating the branch.
>
> I'm missing following patches from me in stable/kirkstone-nut
> * https://lists.openembedded.org/g/openembedded-core/message/229377
> * https://lists.openembedded.org/g/openembedded-core/message/229378
As said in the other thread, I've taken those.

> * https://lists.openembedded.org/g/openembedded-core/message/229938
> Also following patch for CVE currently open in metrics is missing:
> * https://lists.openembedded.org/g/openembedded-core/message/229875
... I also taken those two

> The two libpng patches I'll rebase and resend later today.
> It's a bit hard to send patches without conflicts when the nut branch is =
being updated so infrequently...

Yeah I noticed, sorry about that. I'll try to merge more frequently from no=
w on.

Thanks Peter!

> Thanks,
>   Peter
>
>>=20
>> And, by the way, please remove the "Change-Id:" line. I guess it's a
>> by-product of you internal review tool?
>>=20
>> Thanks!
>> > ---
>> >  meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb | 5 +++++
>> >  1 file changed, 5 insertions(+)
>> >
>> > diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/rec=
ipes-
>> multimedia/ffmpeg/ffmpeg_5.0.3.bb
>> > index d64b97e787..eb21cde89a 100644
>> > --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
>> > +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
>> > @@ -105,6 +105,11 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-3341"
>> >  # bugfix:
>> https://github.com/FFmpeg/FFmpeg/commit/28c83584e8f3cd747c1476a74cc2841
>> d3d1fa7f3
>> >  CVE_CHECK_IGNORE +=3D "CVE-2023-6603"
>> >
>> > +# Vulnerable code not present in any release
>> > +# introduced:
>> https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/d38fc25519cf12a9212dadcb=
a1258f
>> c176ffbade
>> > +# bugfix:
>> https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/d5873be583ada9e1fb887e2f=
e8dcfd
>> 4b12e0efcd
>> > +CVE_CHECK_IGNORE +=3D "CVE-2025-25469"
>> > +
>> >  # Build fails when thumb is enabled:
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7717
>> >  ARM_INSTRUCTION_SET:armv4 =3D "arm"
>> >  ARM_INSTRUCTION_SET:armv5 =3D "arm"
>>=20
>>=20
>> --
>> Yoann Congal
>> Smile ECS


--=20
Yoann Congal
Smile ECS


