Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DA7C2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 09:21:54 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.15418.1719825713120752326
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 02:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NFcu/9dT;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52e7d2278d8so3620015e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 02:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719825711; x=1720430511; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeFnBpOUzInB/mTnRGuv0FQkV4N1ROQ1TvrcLkeuICo=;
        b=NFcu/9dTo0azCUb0APnVCie8v9JxTAq7KpVP1iTReZSOHsxfkZg8Lq4zMCBDHvFHsq
         f0+Pkv8jPlXgVvZ+1j2U0a3K0Sjrp+pwQIA/n46tAKdKOs/G1ryIibhdnh3k6bEYSgEw
         22LI9krJbzWq/RNBiOE/lx26cs1yQk0Sn6rr8MRIlObSqma9IJ0L1fRZR0pT9oCGHMV+
         g1012ipoI3pQ6N9Msvm2nJ9sMWU0F/M2hql54IRfq+FRqY9CgQkhnsGWovxFrkBW3/R3
         a/Zqkh4VdiEXwqjDgF2313i6Ai/5Rne131hUloEVExTqYtLTWyQ+VTTzR1nHJSv3YbI7
         efmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719825711; x=1720430511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AeFnBpOUzInB/mTnRGuv0FQkV4N1ROQ1TvrcLkeuICo=;
        b=X9dKHIpFddqh6q4sGSlUzO6pcbu/o4IpMMorbFRcGYxrokL8FjoiK3dNcY73mNbT+v
         Cw+CM8St0QXPgzOu/O3L/kg+NrfBgl/5k+ZIGf4smYoLwVWhBl6Pr2sq0IJ/Vmn15AYF
         JUbTqqKRvpNtkx2i+g4cZRe6Us8f45wV+BJ3RTK/Vfr3NoCeYz27WEZ7PuQHCOJ9FVmY
         6tHJnvzs8lZ0e70/dBvBcRvsEGEaypWgBy8J5NP2vduaOWunsTbjjee0LPKvQziW6GaF
         ZGitMwO6y5/UXNo1nIdtHAwYa7TzymQ98qVhkWbQAord/WkGRcBct3L3fan+tEwDkbw1
         rSzQ==
X-Gm-Message-State: AOJu0YzTkQuGgZQZN4eTu36tFgA/m+vVK6fdO8iHrHmOPktsYZDdDgew
	l8oNKmnXNrVT8xOVaOdqA3vlExde+dr/nUVfb+kbBtnLXhy20vW00vrz0dL6E+Me2/DP2BDxPb2
	ogHbMsFtFVoPWStvKjhvtygvWTXw=
X-Google-Smtp-Source: AGHT+IHLk+Ot+nipku61iaRV4zEFJeVdUV0QyK/YYc3wlDE6+kaOhsJqh7fpwTrXrmNHVrIySlAQvQ5j9Sv6UD9Ib+0=
X-Received: by 2002:a05:6512:1150:b0:52c:df83:a740 with SMTP id
 2adb3069b0e04-52e82686a8cmr4094657e87.30.1719825710924; Mon, 01 Jul 2024
 02:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <32067.1719679370283451699@lists.openembedded.org> <16360.1719747500371511009@lists.openembedded.org>
In-Reply-To: <16360.1719747500371511009@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Jul 2024 11:21:39 +0200
Message-ID: <CANNYZj8Cn3KqC3DDgxNhFPVBjv=BOCkYauZGTQ+3pPf8JWfyhw@mail.gmail.com>
Subject: Re: [OE-core] [AUH] bluez5: upgrading to 5.76 FAILED
To: gudnimar@noxmedical.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 09:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201284

I'd say just drop the problematic patch. If someone still needs it,
they should come up with a correct, rebased version after the fact.

Alex

On Sun, 30 Jun 2024 at 13:38, Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org
<gudnimar=3Dnoxmedical.com@lists.openembedded.org> wrote:
>
> I found a Github issue which is related to the problematic obexd patch: h=
ttps://github.com/bluez/bluez/issues/806
>
> I think the only relevant part of that patch today is to enable the D-bus=
 service when systemd is not in DISTRO_FEATURES.
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201234): https://lists.openembedded.org/g/openembedde=
d-core/message/201234
> Mute This Topic: https://lists.openembedded.org/mt/106692130/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

