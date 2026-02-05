Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC8AECD9A9
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 22:17:03 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33066.1770329816544166177
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 14:16:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UVtzJR3Q;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-662cab9d4c2so453260eaf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 14:16:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770329816; cv=none;
        d=google.com; s=arc-20240605;
        b=T8sbfi67V66olAetJ0ziGTMxyrJJLaXXKhBH7VfLce5FkaKK59+8JAIk34IKYN4S1Y
         gmYNRqjK71D9w6x+YwJ2dhLPS6RDdc+GKXRX3z2RPJ/k7NMM7Bw5piPCEcnZB+2brWD/
         GXLvqL33zROIKkC/SjlVxjmABhIMarX9l9v7Q9atbttlPHc+KRuK4TJAxUl9H14LkaKp
         FbX/lnusqm99LC/q2qJAZeAnFAmV/rShjjpYzCBvH+IjqTkwY29bMvLuzR2Y3Czv+3uY
         v8Cz5HUNOZrXTurwCTB02jPmT6oyLFmYakMmhFkjeLNaDZ0j06zaRoA9NfwbThQw1FUb
         gVAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=evbnE8bulzCOHa250nvMsJpPZ2GQXyUJq/sX4ysZlw8=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=g8A4NzV0ipMdkUjxaUiXZGEq/Rw+w12SYStLdc4enrAEDw5CwQNBHFwasTJdyT3vBJ
         C2GrdocHj4jGURajxmwzoaRsYKGtC6NTSiqdw134pau+N0vuMEMqHwc+pgM0+uoDgO+3
         o2UM7H/LDPjPTbXCbHJ0xdmqpthSpHqYJNb+nMfyEvHSMUDc3TmOq57/zinFqIFKSc9L
         tqH6VZLbBoJUAQfPgMNCYo7jf/dS9jHkANd6UcO+fuVou77cq/L0odbFVwyYn4DMQgtx
         wulEFjbrtGqqXVSQN01zMXnkZCDI0NXi735Rma2R+5AC5JVOftFmqX75jziWlGe1CSyv
         70lA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770329816; x=1770934616; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evbnE8bulzCOHa250nvMsJpPZ2GQXyUJq/sX4ysZlw8=;
        b=UVtzJR3QDR3YPRK6gk3KH5Eg4eHvBdGn4beZtcTNON/tSIS18tqpyVP1T6JND+yl8G
         3lpGzuSWCrdGSlw+t3I8gyVJgMBpLkh2G2+GrtjD6100mtpi240nPJGePmQbyMS5EZbu
         eKTbhF1l57/ruYR+I/5El+O1uQRYhQGjRhh7FXPsusBHeewt4nVLeGMkx+WA7yWlXHGy
         veUPfYA+eH6++OfXYECFDqs14KwCrMHBCtqdPneW5kNKExTjG+eMNEVHNl1230SJ2Sue
         zPwUrM/x0nbXa6R+xHFtrd3aojrtb8M7/ydeWdzaKCwXDqyOAawOLBmhyjLOdAStElI7
         2hxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770329816; x=1770934616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=evbnE8bulzCOHa250nvMsJpPZ2GQXyUJq/sX4ysZlw8=;
        b=K42ugWTGDERHdekSC02HpA0cBpTaYySPpL16YImK+Ti9U+0kVZjmfECRllh26L/rcj
         /SIWXzrv1vipbMnGEF6VTwCFZbiEwpMzd6vZ3hDmIfBN0iOQqTQOWinBHt2psNfgPJrv
         NKMp8UbCrr5pweV+cnL7lMytMTcg9ZaARAfMsa6t/KkT+giIn2UjcgjRHUAfKFVweyWO
         JfZh2/tPxGwxJPy3YmFGnPcGDMZaOx81MsbTVCT3+z5A0AOPnwMcFyGlEN7cDTElZA10
         7I8he5nQVNG+grFMgbKM0ZKiXJqmGhXpdXnMxoQgEGBQUQqvvS9kDEVPb7UOdvz5ubC7
         nR4Q==
X-Gm-Message-State: AOJu0Yw9LIkN/46U7r/wNsKbPLJIcrZIZs3tFnOHD9iq0hFyZT7gg6C5
	+IblXS2SL+oc9BpheM8zpqcNHAbXnSggtmTLEqFyXSQa/zlkGRlDfhIyKB7ZUaMTZWhS7DotjR/
	a0BmjCvbtNpZl/fAz6IlVByDBbb4DyU0=
X-Gm-Gg: AZuq6aJqAao2ZWxjtqN5FFpS9Z3FjV3gIo6FkjbyQhWD2sX4cz+YVEs4cwdrxG7DweO
	Ej64bSp/xAL55/x2wnWcm0rzv0QxIAehmCHaiEDCcGACQCEImUhEke8pmy5GyqTZJ8SQgZenrdH
	hi+3YGBrkSoO5AV3/n2cvlW/S90Kmw2fxzfNH6bPwRuX+sBhX7eGHIwK1z2G79Iqs8svPJXlMzC
	sLGYOYmzS+hI6FnJHIJBC9Jzfo8TfTrYx+7z9/28BLiW1LketLq779nQ94rNjETPzsUr+UdKZ/p
	cqnvlhM=
X-Received: by 2002:a05:6820:3088:b0:663:888:6093 with SMTP id
 006d021491bc7-66d0ce25452mr443145eaf.70.1770329815754; Thu, 05 Feb 2026
 14:16:55 -0800 (PST)
MIME-Version: 1.0
References: <20260202040805.596021-1-ankur.tyagi85@gmail.com>
 <20260202040805.596021-2-ankur.tyagi85@gmail.com> <DG74H88QW53S.32HY2RYC20ZF5@smile.fr>
 <DG74M83PX9AC.3S1J2YE0AX38T@smile.fr>
In-Reply-To: <DG74M83PX9AC.3S1J2YE0AX38T@smile.fr>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 6 Feb 2026 11:16:44 +1300
X-Gm-Features: AZwV_QhpIjikXg2iL-mfSpRihXifwiroeB1h_Xi5gaeIuyry1SRKhUIf9Xeut8o
Message-ID: <CADySD0HRRg=+imfsDk5uwMPeEuyHLpcsecNjYz649NbzXKyLNA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH 2/3] ffmpeg: ignore CVE-2025-25469
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 22:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230588

On Fri, Feb 6, 2026 at 4:17=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr>=
 wrote:
>
> On Thu Feb 5, 2026 at 4:10 PM CET, Yoann Congal wrote:
> > On Mon Feb 2, 2026 at 5:08 AM CET, Ankur Tyagi via lists.openembedded.o=
rg wrote:
> >> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >>
> >> Details https://nvd.nist.gov/vuln/detail/CVE-2025-25469
> >>
> >> This vulnerability exists in IAMF (Immersive Audio Model and Formats d=
emuxer)
> >> which was introduced in version 7.0 [1]
> >>
> >> $ git tag --contains 4ee05182b7cccfa6928dcb0a45c2b50b7d9ea39b
> >> n7.0
> >> n7.0.1
> >> n7.0.2
> >> n7.0.3
> >> n7.1
> >> n7.1-dev
> >> n7.1.1
> >> n7.1.2
> >> n7.1.3
> >> n7.2-dev
> >> n8.0
> >> n8.0.1
> >> n8.1-dev
> >>
> >> [1] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/4ee05182b7cccfa692=
8dcb0a45c2b50b7d9ea39b
> >>
> >> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >> ---
> >>  meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb | 2 ++
> >>  1 file changed, 2 insertions(+)
> >
> > Hello,
> >
> > Thank you for the patch, I reviewed it and I'm OK with it.
>
> A precision though, it matches master and whinlatter patches "ffmpeg: ign=
ore 10 CVEs".
> Your patch will have to wait that the master and whinlatter patches
> merge. And that will be too late for 5.0.16.
>

Sure, as long as it doesn't slip through the cracks :-)

> >
> > Can I ask you to contact NVD to try to get the CPE fixed?
> >

Good idea, I will reach out to NVD.

cheers
Ankur

> > Thanks in advance,
> >
> > Regards,
>
>
> --
> Yoann Congal
> Smile ECS
>

