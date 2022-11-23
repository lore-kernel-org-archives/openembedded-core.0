Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287A2C433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 16:34:44 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.1153.1669221274227799489
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Nov 2022 08:34:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M06obSo1;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-141ca09c2fbso21393223fac.6
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 08:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BYFOfWP3oa2oSjD1KIOqGqIaOAyzNJpxL5F8JtvaWY=;
        b=M06obSo1iTnvtqSKfSIBc/pa3VmxX61qMyXWhD/hNvlokglMNWDiuG9MH70vd40mO4
         Sl8gKzMTrLtF7jjUdaxHRL9hA5tBECOgmFMpuok3X5nOwy7frrb6rAf+DIpTIoaJJuwi
         5JSBqmnz7Ob1ADYXUKXK/pronu3xAuaYOTAIZvTdd86flIHL9xt451CTnuxhg5tnuiO9
         +iMqpEB10vrttpnWryjKa9Ndyvp0brmNgCAVcHezef0ub7TiD6R9dw9mXu0wvgv0X2Ce
         L4vEoxLSlXfXf4pwBrnM9BNNIrZk7f/Ot+LFa5J/Kfo5Vdw1HeS/9OW4MoZCqkX3/eeH
         WcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9BYFOfWP3oa2oSjD1KIOqGqIaOAyzNJpxL5F8JtvaWY=;
        b=ffVeg5k5rrShONdx+fh+Sz3KjKox2EL2pVb4PtPviBYRY7oUL2/6QSqSuoDT2Xz57v
         uOxqkR3uu9bpxBcTUL3FPdN4qDh7aPsl3Jn5z6LOKJ4Qb0RlPtwirQdn4XWbaZSKlbPo
         drsHmQsdx2X46vb6b99F0A/HZjbs8zwnckzUyTv6XP+8Wlm1ZfOfR/7sYLyy1OpXDu/g
         lkuSUv2W5l3sP2zn2OcPxUFzJ/jQjH6pOhYlKvmUkWHZN/kFpiKIIOcTles8ppgf0uvk
         KvABXfsxb/xl2E0HQdXkm9mGo6qXXV+rcnIfs4PbF7wQ3iHqMJAtyq9zS0apowzoos0m
         zz1w==
X-Gm-Message-State: ANoB5pkV1uUcbEgwmpkwDEwz9+kyutFAnDIWTJ+cFImCgEd3rKt5GK/k
	W4TT1/jsxQi9I0PA0GrLKLVednnMSFjAXqPrvx0=
X-Google-Smtp-Source: AA0mqf6Ql7fKUFptwl+HcPZtQG1sz8uao9/2+O6BTSZ5nWmX0yqHqORJESUoLHMcfcZPkvFVEW42Omwz+7s25xcgvjc=
X-Received: by 2002:a05:6871:4199:b0:142:d126:dc55 with SMTP id
 lc25-20020a056871419900b00142d126dc55mr6646428oab.262.1669221273419; Wed, 23
 Nov 2022 08:34:33 -0800 (PST)
MIME-Version: 1.0
References: <20221120175237.194899-1-f_l_k@t-online.de> <CAMKF1spErHg3JX+DFRLcW4EthTGBMm4A24XsyAVOO3RNr6Wgfw@mail.gmail.com>
 <CANNYZj-UTuxW0-Rr7FhgjwE007Gr28Pc5ZCo=cnrDcaNsuZStw@mail.gmail.com>
 <CAMKF1srs_tmRRNqWQAmBKOkJkfysJt=OZjefq_mPd4htPGi6VA@mail.gmail.com>
 <1729A925BA1D06C8.25787@lists.openembedded.org> <CANNYZj-mhM6FzQY4Lv2BckodcLtPSUV29GG4TCUb_Tp003SAbw@mail.gmail.com>
 <HRFQLR.NFABK2KMZ9XR2@t-online.de> <4BF25A91-3F02-49A2-A546-A9CF7881E0ED@arm.com>
 <CANNYZj9uxKov0vrox7N3kv-HdQJ9VDbLu7Jsn_SuVUTz_Nbrzw@mail.gmail.com>
 <534355DF-2B59-4B88-84F1-18251DF2FCC9@arm.com> <CANNYZj--M74EQyWbLeYa6L=iH01QSqUcKnn2WpxMvyz_zpXS5w@mail.gmail.com>
In-Reply-To: <CANNYZj--M74EQyWbLeYa6L=iH01QSqUcKnn2WpxMvyz_zpXS5w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Nov 2022 08:34:07 -0800
Message-ID: <CAMKF1sr7ZxbQPkAydEq6psBZSS=oumi0yogEWXLt23+YyhobCA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] python3: add ${bindir}/python symlink
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, Markus Volk <f_l_k@t-online.de>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 16:34:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173724

On Wed, Nov 23, 2022 at 2:55 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Wed, 23 Nov 2022 at 10:59, Ross Burton <Ross.Burton@arm.com> wrote:
> > > The serious need is that we need to patch all the scripts that ask fo=
r python to add a 3 to it. And there will be more of these going forward, n=
ot less. I=E2=80=99d rather just always have python available. Not a proble=
m worth deliberating over to be honest.
> >
> > But as per PEP 0384, /usr/bin/python could be python2, or not there at =
all.  Software should use python3.
>
> But would anyone pay attention to the PEP when writing new scripts?

they should be pointed to PEP and I hope python tutors teach it from day 1.

If
> /usr/bin/python is available by default, as it is already on Fedora,

There perhaps is a reason for that in Fedora, but it is in conflict
with what PEP0384 is saying

> and probably will be on Debian (in testing/sid there is no choice
> between 2 and 3 anymore - 2 is gone, and that clears the road to have
> python->python3 installed by default), then it's not unreasonable to
> have the script use that. I wouldn't want to know or care about
> python's historical baggage. That's why I'm saying we're going to see
> more upstreams that are just having #!/usr/bin/python and don't give a
> damn, even when you point it out to them.
>

If you want to ignore the baggage then know that there is no
/usr/bin/python anymore.

> Alex

