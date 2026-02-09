Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED899E7E0DA
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 19:18:18 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2811.1770664698185071763
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 11:18:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iGGYFRyP;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-45c733ccc32so11596b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 11:18:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770664697; cv=none;
        d=google.com; s=arc-20240605;
        b=J+ctRkwjMsBlEXkatpju/wflQ9RlrpC3J3bxNxlhUGFjtrLPzdI8dTKdDB7c+P/JRK
         EcZQQGDUlK4ad8bT3o40vYRWrADsc8icMRESKcl8wma46CAHfC8YO72j3E0122xUBQ3S
         8V5ro8GI1f1+Okg/pEXTb71aKmzJ9rSmZ7o8qqqJqiRilfSQT9HJ3Rk6gxV2TX/CMGvn
         LDhxBc/YDMY+D4JIGRxs8uL1EsCmXx27x02EUPwJd18+33O0bHrdH86cul9Q8Hxk81/c
         8vmLjRgJht458jdVWBpUeAHh6F2pR/VgG7jfu5z509JYY4MRjoE/MCTMZfWIwQW80r6N
         +sIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YrxSsuxS0W3gfW0FNtEFoqCLF+dgrckQXG50Ms5t5GU=;
        fh=B/692YpSOO3xEbWky1peUlsdgZGvadtf72KYioLRIOE=;
        b=cR9qn3aA/zgR+1e8wM4MyyRljin0NL8zzy3EedsJWYQ25umZjn5OMYwmiNX1Cji/Dg
         n6qnR3F4VN3Az4mxS+gCYe5eIYtxUxojGp0FjLPdk/6hlnSn178hvN0fFmoqY6z0DKQ0
         D0oWKuPu8N9tjoAgLva+IwO5BqUihZGujfaS85dIIH7spk1805BLpPNwdQmqIQI8VftE
         /lZNXw56+uAbJnz25l2w/mpkMBWxL+c2BPIEWwAElrnznPjKnRaEn5H8mgmhwebwoH75
         /qlSsz85QZyImlc3k9sUZ+bgUtUGrhie9FZPZONAqTVoSrJ8VNZtOwxL2UUj7BcKkTnG
         x/6w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770664697; x=1771269497; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrxSsuxS0W3gfW0FNtEFoqCLF+dgrckQXG50Ms5t5GU=;
        b=iGGYFRyPez+27Al/rsG3nq0DcIu3bN0o1vaqmftxPMjQhU8Oi+mtVPJFU2STGSgb2K
         aDe4NDKlV+rsFzPOajKlAY0pHaO5cY5c0zH7HRjUyWNcCbk4B0YWTCFcC2ycaO8degJ8
         lr+pww27hzBrrMq656HhRnbNg74q+iaRer6fVTx19KyT2EP8qtlnxL3UCRwT3K+FGkWV
         4XxVawMLFsW6AW5uUYLHoMn5vWNI4cIKbez+AokasHLp4Z1hBDMtt92jOPzIe2S0Drhc
         q6o/Ye9eHMLM9cyVgVp3SWky5B8AthmBHJ5+bxQm4So7EmF0C6gU7UiyT2RpJd0/gTZg
         wv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770664697; x=1771269497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YrxSsuxS0W3gfW0FNtEFoqCLF+dgrckQXG50Ms5t5GU=;
        b=ET7PERzehsbjpP5BN+YCwGpcLVG/HzoBt7SDqpCxmQ7QpHlucLckjgj91RRtZBaf2s
         uE+yLroku6f6KOR2UCeO29w0hC+K13gW9FUTE+FRW5GCs8LG/yDrf9Lzug0UBI2fe3O9
         GNdvbSpZjeM+g0/cb53fKnjM6CGzOKFiQ2iz4801m5GYzWs3Q4RHYKYXqsMS1eecp18k
         83Cu39G4XmMFwaNpXU7qQUi0roOgG7GHW/pE14x0GKjnUleYg6jn0du9jJ7STJ4KYBfU
         J5aEf0ot6Ch2fbg16fbBTULda5TsYjNIFyW+tOuQHyE2hHhiutv44dMQ/TLcP/FNTPSe
         aRmg==
X-Gm-Message-State: AOJu0YwhyOpcOqR+jyvUcLQNu5mAeuGiO1Pf8PRyGzbv3kl8BcidH2W8
	TsCiVmqZwoyCcLCIpCA0CTlJD4pmXqBc6BY7SIsG3ucg5WTNEq/LGuoN+m0uMhdxrtfh36jrT3s
	lAeYpguIlRgYQ4ibgoMstR8LYUziX0cA=
X-Gm-Gg: AZuq6aIydLwsdCI+fdkXAFHFwZ8iLACp3ewxeElttUUOMWNqAf1qHMLo7b1QiPX7AWD
	zEs55i5Wm4g1vD4irnuzAqy25fMWQhZpSsFK8L0pr4Efi+8AUoc5F19BPNsz+3trEE19q6NfOsd
	A9vJ4Qq55Un4GPe8r00QjbXGFD2dqmshQsqeBlxSw+W2EiqKH2R9tJBNMa8D0DJy42+18vRRPZP
	8kizv0frSFhuYn8rNtIbEAuh29Kjn9sffoX1AA27m2ZsaoD3B/S+fFfuNchbRYlzM5CFoNl
X-Received: by 2002:a05:6808:1598:b0:45c:8f03:1e19 with SMTP id
 5614622812f47-462fcb4cf3fmr7083644b6e.55.1770664697326; Mon, 09 Feb 2026
 11:18:17 -0800 (PST)
MIME-Version: 1.0
References: <20260202023457.133774-1-ankur.tyagi85@gmail.com>
 <CANNYZj90xJsK-COQF9XPbvT37gcdTuS7=M6QJu-KBf+3D6G=ig@mail.gmail.com>
 <CADySD0EYAL-tmTz1AKvm_sgfJyy+a=+GnFruyN6zT8V4jujuDQ@mail.gmail.com> <CANNYZj9LmZBBYzmkxdHqkuA=q-aE2HZrv39W4QMcXdESG_EdoQ@mail.gmail.com>
In-Reply-To: <CANNYZj9LmZBBYzmkxdHqkuA=q-aE2HZrv39W4QMcXdESG_EdoQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 10 Feb 2026 08:18:06 +1300
X-Gm-Features: AZwV_QhyKv5GlOzP79lZBnO9LMd64ugvs-LfUHrt6OqsdYg6Z7xfM4Yvb7n6gOk
Message-ID: <CADySD0FrXcBrDKGoom66USoO=ZC8+JGTU=M+7kU+XMd6SRLWQQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] mdadm: upgrade 4.4 -> 4.5
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Paul Barker <paul@pbarker.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 19:18:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230814

On Tue, Feb 10, 2026 at 7:25=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 9 Feb 2026 at 19:23, Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
> > > > - dropped mdcheck install patch to address reproducibility issue
> > >
> > > >  EXTRA_OEMAKE =3D 'CHECK_RUN_DIR=3D0 CWFLAGS=3D"" CXFLAGS=3D"${CFLA=
GS}" SYSTEMD_DIR=3D${systemd_system_unitdir} \
> > > >                  BINDIR=3D"${base_sbindir}" UDEVDIR=3D"${nonarch_ba=
se_libdir}/udev" LDFLAGS=3D"${LDFLAGS}" \
> > > > -                SYSROOT=3D"${STAGING_DIR_TARGET}" STRIP=3D'
> > > > +                SYSROOT=3D"${STAGING_DIR_TARGET}" MISCDIR=3D"${dat=
adir}/${BPN}" STRIP=3D'
> > > >
> > >
> > > This has merged, and unfortunately the same reproducibility issue
> > > appeared in nightly master:
> > >
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/33=
17
> > >
> > > The issue seems to be that sometimes the sed command to patch BINDIR
> > > in mdcheck works, and sometimes it does not. I am baffled as to why
> > > that would be, but we can't have such fails in master, so for now I'm
> > > afraid this should be reverted.
> > >
> >
> > yeah, that's odd.
> > Let's revert it and I will spend some time understanding what's going o=
n here.
>
> One idea is to try to catch the issue right when it happens, e.g. add
> a test patch that greps the offending file for BINDIR, and if that's a
> yes, then it loudly fails, stopping the build. We can take it into a
> staging branch and then once it fails someone can look into why sed
> didn't work.
>

Thanks Alex, I will try it out in the coming days and send a patch to
monitor the situation.

> Alex

