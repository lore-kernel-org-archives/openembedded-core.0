Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D372C4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 10:55:34 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.17441.1669200926630942445
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Nov 2022 02:55:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LwSB8bi+;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id bp15so27565184lfb.13
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 02:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aWPF3rM/Tz2J8Eog2fVTrBXAL5vVrHK5SaEf35PQng=;
        b=LwSB8bi+qwwyqiWhXx2EDgcjSMFe6Hw5gdDPqULa/YTqIB3jFH12hY7SYyiF/M6VmR
         OXjU7UOX2EQP6VmDf5tHRElV+fhh8CEPNv1uk/pVxfiS190TyL9btClws8yVvzF6GNJs
         fcSCqOTy94KOltXUgwx01+BRhaJGNVM8gAjYpiN2HlCMSOgzOThmOk9GYZ+noVhB41do
         YjYSscFfKm5bIidYpRpTJ6VX3WAANRLflevYsZr4e5Ye9768xXhajDyRWNY+ZwyzBBUI
         7XdY07c1dDmL4xVAlP+iFjTXJGc739QFGviU1517fC9/eGO1oik7K557/WGuQSnb76QA
         eFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8aWPF3rM/Tz2J8Eog2fVTrBXAL5vVrHK5SaEf35PQng=;
        b=QgTzffIXc/lKCzFLJhdQ7IsvvX779EGF5KOyN5thJGfe3tBcggp/enPwQXDpm0DwNw
         5LldPiKyP6OtB1xXVVHNsAPuXyVHuQQtSL6ZCbJ/shM7VsefOWDIauWbUnzDEMIb0F89
         FZnGPIMBtAGsHsBpz5rpSkYREglyZlkHYoTtA2urjD5Ulo/RbcWm16EVgHRu0OgamNdq
         jK/2rm3GhFj2c6kHT0b0VHzdO2FygcR8p6guAip/UkxXGLQi2xPbRc2JKiadgVm+zXf+
         QizOY7bSDcg7qFEKSbZKOg3D1WUwwDoDGG7D6BCI2OeiEaCHtHBz3L13EVf3YGlj2jA+
         MQCw==
X-Gm-Message-State: ANoB5pmmn0OI5/SZqqPDei05gTGTegh+CdDOvJ/zN92rT3YCYVsoC63N
	N6M9nvKzILVnq0K7G54+PPMJ5FuMbMBvYoHzgJ4=
X-Google-Smtp-Source: AA0mqf5+G09ivahVnsUchcEjOXEVuUeWwvwim6iTIHmrpUxaxp0WsOdYEN5D0lUjotVA70sqvifBTWAbbH1bbPNVOgw=
X-Received: by 2002:ac2:4c47:0:b0:4a2:4d53:8294 with SMTP id
 o7-20020ac24c47000000b004a24d538294mr8483574lfk.263.1669200924250; Wed, 23
 Nov 2022 02:55:24 -0800 (PST)
MIME-Version: 1.0
References: <20221120175237.194899-1-f_l_k@t-online.de> <CAMKF1spErHg3JX+DFRLcW4EthTGBMm4A24XsyAVOO3RNr6Wgfw@mail.gmail.com>
 <CANNYZj-UTuxW0-Rr7FhgjwE007Gr28Pc5ZCo=cnrDcaNsuZStw@mail.gmail.com>
 <CAMKF1srs_tmRRNqWQAmBKOkJkfysJt=OZjefq_mPd4htPGi6VA@mail.gmail.com>
 <1729A925BA1D06C8.25787@lists.openembedded.org> <CANNYZj-mhM6FzQY4Lv2BckodcLtPSUV29GG4TCUb_Tp003SAbw@mail.gmail.com>
 <HRFQLR.NFABK2KMZ9XR2@t-online.de> <4BF25A91-3F02-49A2-A546-A9CF7881E0ED@arm.com>
 <CANNYZj9uxKov0vrox7N3kv-HdQJ9VDbLu7Jsn_SuVUTz_Nbrzw@mail.gmail.com> <534355DF-2B59-4B88-84F1-18251DF2FCC9@arm.com>
In-Reply-To: <534355DF-2B59-4B88-84F1-18251DF2FCC9@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Nov 2022 11:55:12 +0100
Message-ID: <CANNYZj--M74EQyWbLeYa6L=iH01QSqUcKnn2WpxMvyz_zpXS5w@mail.gmail.com>
Subject: Re: [oe-core][PATCH] python3: add ${bindir}/python symlink
To: Ross Burton <Ross.Burton@arm.com>
Cc: Khem Raj <raj.khem@gmail.com>, Markus Volk <f_l_k@t-online.de>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 10:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173712

On Wed, 23 Nov 2022 at 10:59, Ross Burton <Ross.Burton@arm.com> wrote:
> > The serious need is that we need to patch all the scripts that ask for =
python to add a 3 to it. And there will be more of these going forward, not=
 less. I=E2=80=99d rather just always have python available. Not a problem =
worth deliberating over to be honest.
>
> But as per PEP 0384, /usr/bin/python could be python2, or not there at al=
l.  Software should use python3.

But would anyone pay attention to the PEP when writing new scripts? If
/usr/bin/python is available by default, as it is already on Fedora,
and probably will be on Debian (in testing/sid there is no choice
between 2 and 3 anymore - 2 is gone, and that clears the road to have
python->python3 installed by default), then it's not unreasonable to
have the script use that. I wouldn't want to know or care about
python's historical baggage. That's why I'm saying we're going to see
more upstreams that are just having #!/usr/bin/python and don't give a
damn, even when you point it out to them.

Alex

