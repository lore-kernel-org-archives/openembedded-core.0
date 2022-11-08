Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F183C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 19:37:44 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web09.1615.1667936261650214557
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 11:37:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pyMgJXW1;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id d3so22651191ljl.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 11:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IAwb8RdWxY3cyu2WFlxVTHGtu8dZ+xL0a5cl42Qbk4c=;
        b=pyMgJXW1/DTm3G4SNlT2Mxdq6j9VZRym+tuf42MSb6aFK/SeSI7xdYiOYUxCuSbPUx
         gffRRM4AQ3E4XsVuHe9srq+qPUv6oQEmjeMs3C1nkhG1IYkfZRmkY2YvdMA+KlSFxNfo
         gsGAX+rbHLizxhkwpmm3lDGDgqDi+0D6KiFsKUf2YWJDHYdjXJ0rkQO9Q/xLw8MwEtQc
         lfCUkSPLpccER7BlBs9tv9yAodSZroyOJ7cDXuCe/g4bDfBTYUTEFx4mNbTfYXHbsxBJ
         MW4MAUH17R557q8xqwFVGvjNB31VDPnX7VljTeDG/xOFu/7gqlO0TWdFnvEZnAlApUBM
         2LUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAwb8RdWxY3cyu2WFlxVTHGtu8dZ+xL0a5cl42Qbk4c=;
        b=gF4JP8SAV4L4kZEnOhWpLgD8ddh8LSHLdbYhICxX5UgksP5gjs7p6oHx0dtb2pNiLb
         wXzROuCdDqpKwpi0wiFc1cdLlz8sg6Jdn2wJssBmQLs4tC6eEcIK2UMtWJiNGDKePnU0
         u7jcr3TKQIvypDzVeIPEeP+uadBdldXY89YWtsBFfZh46mhgXCL2fvXDaGs7SRs6UyqC
         IcauI5EDY67/QK0/9Qvx4wK6FZ58BpC2QG78LNFeITPrTFNP4Z8z2b602PjD5KUwWy1U
         6F/J+FUYOGXR7maMFUchReaIhW5Lc+be99G2EHSWEilkGxfLrH73t6PjQ4LljNY8SJV5
         LQDQ==
X-Gm-Message-State: ACrzQf1ukqItWcZmQH7lJuegljV87lejcaiURuV+aI10wspvRyJFT/Vo
	guW7Y3vjbROD7AXCBMYeuBqEFV3Swi7ic+pViuE=
X-Google-Smtp-Source: AMsMyM7xdH4DOA/Z1k/GhUjg9SejkJV3N5oye3JURlLSiXobPe+wIg4uBAU/Glt+oIMrVlr2ACIfY/7V6LYVIzawPNA=
X-Received: by 2002:a2e:885a:0:b0:277:eba:852 with SMTP id z26-20020a2e885a000000b002770eba0852mr7638208ljj.31.1667936259675;
 Tue, 08 Nov 2022 11:37:39 -0800 (PST)
MIME-Version: 1.0
References: <IAS2.1666358226748943797.wkAx@lists.openembedded.org>
 <CAHwn2Xni=DChyNRGfrQ=qVgrEK3b=0AhRMx+MAONYcWW9-V_=A@mail.gmail.com>
 <C7082AE8-28B1-4277-BEC3-F7C6C14E7100@arm.com> <CAHwn2Xkgw-fAmy92oLWOUG8=K0-3dVwYXsLKEqR-WtGoHHdc1g@mail.gmail.com>
 <CABC0sH3LFm48+buev6gFFAAoDT2SLqR-r-rndSjx+eU54H5=1w@mail.gmail.com>
 <17210CE2C7C78501.808@lists.openembedded.org> <17211049B04D4148.10479@lists.openembedded.org>
 <172331B40D5EBCA0.9941@lists.openembedded.org> <CAHwn2XmaTHGGUZXn9bC=SBj51zL6eo6rhWPR4SPP_UN0js9-8g@mail.gmail.com>
 <CANNYZj8o_GjiqwADQQp5KM_mnQTi+mw6nVh2E1GWVsfi9o3ZKg@mail.gmail.com>
 <CAHwn2Xmaqn+OAPJ-PH2eYr+w8J1OWkDVMQLgkZ3V7ughLYY9oA@mail.gmail.com>
 <CANNYZj-AEZ0LheXd2ZLfC4Q=V+iq=T-Lvhutwe5_kt_SaHiHZg@mail.gmail.com>
 <CAHwn2Xn+n5ArRRH3u=x+wA+y+AaEyBOZd1JQB45FQH6rme02wg@mail.gmail.com>
 <CABC0sH0DjvXC4Hw7CxM__spomLbN1ntEsV03-CQ=3OgLLDakLg@mail.gmail.com>
 <1725B2503015CF3E.24882@lists.openembedded.org> <CANNYZj_mWfY2aoYOPxwxL32EN8h-HjmKCqZ1BB0XsC4Rd4Cg3g@mail.gmail.com>
 <CAHwn2X=ZCLSFAui=NV4e39FKk9azL4oqoNj85UHdgb9EdEaO2g@mail.gmail.com>
In-Reply-To: <CAHwn2X=ZCLSFAui=NV4e39FKk9azL4oqoNj85UHdgb9EdEaO2g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Nov 2022 20:37:28 +0100
Message-ID: <CANNYZj-nYbhYp8yfZYdDmS0TN8mRHmUB1Jh2zmLmcLH1FiyKpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: Install internal header/lib files
To: Willy Tu <wltu@google.com>
Cc: Tristan Lelong <tlelong@google.com>, Ross Burton <Ross.Burton@arm.com>, 
	openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 19:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172995

Ah, I thought this was in a separate layer. I think you're best off
getting a private copy of openssh sources then.

Alex

On Tue, 8 Nov 2022 at 20:30, Willy Tu <wltu@google.com> wrote:
>
> So do you suggest adding bbappend in meta-openembedded where https://github.com/openembedded/meta-openembedded/pull/597 will live?
>
> I'll check with the maintainer there. And Google/hiba users will maintain that.
>
> Best,
>
> Willy Tu
>
>
> On Tue, Nov 8, 2022 at 11:25 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>>
>> Actually, you don't need to do this in HIBA - a bbappend to openssh will do.
>>
>> Alex
>>
>> On Tue, 8 Nov 2022 at 20:21, Alexander Kanavin via
>> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
>> wrote:
>> >
>> > I'd rather have this hidden in your recipes, yes. It's clearly a
>> > special needs issue, and something you shouldn't ask us to maintain
>> > for you (what I mean is that you're not going to rebase the patch when
>> > a new openssh version is out, or adjust do_install - this falls on
>> > usually me, and my time to do these ever-growing maintenance things is
>> > not infinite).
>> >
>> > Alex
>> >
>> >
>> > On Tue, 8 Nov 2022 at 20:12, Tristan Lelong <tlelong@google.com> wrote:
>> > >
>> > > To be clear: OpenSSH maintainer will not accept a patch that exposes these files in the upstream version, but we got confirmation that they were ok if we maintained such a patch in OE (or a custom do_install in the recipe).
>> > >
>> > > If this solution is not acceptable from the OE maintainers point of view, the next option is to update the HIBA recipe to fetch OpenSSH sources on top of HIBA sources directly in HIBA's workdir, and use these instead of the one from sysroot.
>> > >
>> > > Would this work better for you?
>> > >
>> > > On Tue, Nov 8, 2022, 18:16 Willy Tu <wltu@google.com> wrote:
>> > >>
>> > >> I think they are fine with the hack here. oops. Ok, I'll work with
>> > >> them to get the fix without this change.
>> > >>
>> > >> Thanks for the feedback.
>> > >>
>> > >> Willy Tu
>> > >>
>> > >>
>> > >> On Tue, Nov 8, 2022 at 9:12 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>> > >> >
>> > >> > On Tue, 8 Nov 2022 at 18:08, Willy Tu <wltu@google.com> wrote:
>> > >> > >
>> > >> > > Thanks Alexander for the feedback,
>> > >> > >
>> > >> > > We had some discussion internally with one of the OpenSSH maintainers
>> > >> > > and they are fine with it. I'll try to see if there is a public forum
>> > >> > > where we can share the discussion.
>> > >> >
>> > >> > If they are fine with it, then you need to submit a patch to openssh
>> > >> > that installs the needed pieces (perhaps subject to a configure
>> > >> > switch), get it accepted, and then add a backport to oe-core, in that
>> > >> > order. No do_install_append hacks please.
>> > >> >
>> > >> > Alex
>> >
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#172992): https://lists.openembedded.org/g/openembedded-core/message/172992
>> > Mute This Topic: https://lists.openembedded.org/mt/94475279/1686489
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> >

