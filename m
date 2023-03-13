Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76966C6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 09:20:43 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.15663.1678699239327365414
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 02:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=esHgdnL9;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id h3so11851768lja.12
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 02:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678699237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBzQuNJ+Wm3OqZ4t1w6ugjwEfJMvG12YWqP4kqih3I4=;
        b=esHgdnL9UVQhSe2FTVbZNSv51fGTFDACZzRM5TLXGeTj/yqtvRAmAyHT3gaL2Aq6Vr
         To0EO/fwshYHScxbN/ZlqSRKGL9SsKCToG7OFhhhYrH6wgFJdBDW/UuIY6k2N2p0+WZt
         Af0Y74zNvgD3Es4wtfPWB2A+lO5Xd1e8NAKsa2ksM/2zkadu1vFXnixWfWReGdV+UVtE
         sXVed8Pt3yvFD2YrvgXeeyeQSz5kMhuuhgDRk93cqf0cTSIJXO7R/TRCHoAiENl4cv5z
         UpdX+eAmMKRK9SnHGggOi3E6qRmyH9NUSBzozA9YQjegEjzdSPNuVBgihB21D0Eks+8p
         pROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678699237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBzQuNJ+Wm3OqZ4t1w6ugjwEfJMvG12YWqP4kqih3I4=;
        b=1os4vCKXy48sMIWgYkvZMmX57XMwm/X8cFrgSX+xYpqJVsyoaOZtxWIFBlqI3gX0VT
         szldz7IZ34Wq9U9vAYYx5YfdLsPSkxKVHaQdaffLZSwLur0lC0SEqOCAuaNE+1DmlTgF
         ae8JV7nH7mmv28+dxRHDEyh4ixnnN3AmSTowJ2QXd3eoPWpD7T2apqHYvfj0wwxmvtnu
         J0j+eE2X37uCDtM6FpGS/QoDSck+QOXm69jQ/LlgnV79sHF+cUUsGbYoWNB6Esp5akwd
         UGaVASXZPDuT95UJqmdaI6zO8szBWrvAtphc4xWEOzHjBrGThEVUpotSVpdtTn5AVlGV
         W5vw==
X-Gm-Message-State: AO0yUKVow1SUXrqAOqIQ2VwZo0rz9Lj7yb1UHK6vg4Hud9GNP/Y9NEp6
	Pj7AM1qvtfpbClOMUpTIWMO3cSkVu+CKbA5hITs=
X-Google-Smtp-Source: AK7set+CfWFJbcB9uO+GSn9zxwuYKCDcTpWfjYxpWJdUx8mocghlA/dlyQNGZL4PsU9aZryKIumKg7Q/wShI4SccKQw=
X-Received: by 2002:a05:651c:1722:b0:298:6d79:c6d7 with SMTP id
 be34-20020a05651c172200b002986d79c6d7mr5620465ljb.7.1678699237414; Mon, 13
 Mar 2023 02:20:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230312065517.61051-1-frederic.martinsons@gmail.com>
 <CANNYZj9ah1rO9FH3a_m2ftgrDik_NtcLa_15r6+sqD5iwBXsiw@mail.gmail.com>
 <CA+cAkeqZjC=L=_v-3K4VDtdWKxc3crDaqfwp_30B9KFAVrfJuw@mail.gmail.com>
 <CANNYZj9vyfkez+iL-EeeV0Yb3o1Fz9FDrbz+ZRjg5EjUHiAisA@mail.gmail.com> <CA+cAkepYqf_hJWe5HBpKcJrF37P7V81AWCZJJ_tUYtBH=BqHqg@mail.gmail.com>
In-Reply-To: <CA+cAkepYqf_hJWe5HBpKcJrF37P7V81AWCZJJ_tUYtBH=BqHqg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Mar 2023 10:20:25 +0100
Message-ID: <CANNYZj-srm78_c6abE2WX8L6gGqW=GM0uqUyHiMkVmO+t0ZWwA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 09:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178420

Note that we're all rust neophytes, and rust support in yocto is still
evolving towards maturity. If you can see better ways to do things,
patches would be most welcome - but 'no network access except in
bitbake fetchers' is a core rule.

Alex

On Mon, 13 Mar 2023 at 10:14, Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> I understand there should not be a fetch during build step , I'll try
> to find why .
> In the mean time, if this is a strong rule, shouldn't we invoke "cargo
> build" with  --offline option ?
>
> On Mon, 13 Mar 2023 at 09:38, Alexander Kanavin <alex.kanavin@gmail.com> =
wrote:
> >
> > On Mon, 13 Mar 2023 at 09:29, Fr=C3=A9d=C3=A9ric Martinsons
> > <frederic.martinsons@gmail.com> wrote:
> > > But the compile step tried to git clone anyway and so it failed like =
I
> > > showed in my first email.
> >
> > You need to figure out why this happens, because it should not. We
> > have plenty of recipes that list crates in SRC_URI in oe-core, so you
> > could start by studying how they work.
> >
> > Accessing network anywhere except do_fetch is not allowed for
> > reproducibility and license compliance reasons (both break if that
> > happens).
> >
> > 'cargo bitbake' is a 3rd party project with questionable maintenance
> > status that we do not support. The official way is to use
> > cargo-update-recipe-crates class.
> >
> > Alex

