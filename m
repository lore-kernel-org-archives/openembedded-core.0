Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06631C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 19:25:34 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web08.1408.1667935532912368317
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 11:25:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FpPJx9wa;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id b3so22612486lfv.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 11:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/pckXBd8SAzu9Kr0DRthyFjq7huFNNLfoNdIZ4scZpo=;
        b=FpPJx9waEsm9o2KGNkThGCNxwpWAOqe+F8CrUSNU/CFz6L6PF4FyHz2N8VHHtEF8eJ
         u3KCZ/sLqdKHyhvXSzFppJivpn9C868dBHdtusEK/oyll2VN4NQKrDDxzMQgvKLrh1Bf
         C2z7bnAswj+XaeNqrftO7H1sKroqaml9W3MfSoNCDOD4osSRscvYdUB/xvKS57nY19sC
         1ED0qdLWYA2wdmwcFNonb70Nvln02ymr61jLfTJ1/7/fd6xdhrJNTDOrud2m/jcuzYJT
         DnWeNtsx6R1AxttyI90LPyawj5kQrPCwNyh81drTaujjlAJ0jT7khqhxehxSO1EFA9a5
         zDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/pckXBd8SAzu9Kr0DRthyFjq7huFNNLfoNdIZ4scZpo=;
        b=w8Qoxb4nYpHdlACBsVpahnFtNahXpb4HMkfjdl4JKSmJ0qwbpZVXjJzV64iV35dH5Q
         xWn1JQjfD0ISg+btHbkFrcCqcwfNrnAxu4kec0tdHWN8LsvWYGRH9fZx+Rxw1LA8GdCh
         MGOjcu8MtmNDKSKCIjYQzt/QonDp4RYwMlzQIxyrtdDcqblP313NE+QDS8eaKSXJSKaM
         n0hPxzkTCzX0tyaYCwouwDEsEkwWkxIjZRxSS6RelFLUstEZOI380NcucracDprjJ36z
         mItFx4UuTvtUO/qxJ0xfLVmG8vo/JA7zSE2HyiOw4Ji5E8z5O0Z02WDa9cZPxPCeRi7B
         MPQQ==
X-Gm-Message-State: ACrzQf1q9+/4jXlNCO+OTjLA7xwhS7pW3CsIJRAsobCYUY5m3KX+unL4
	CF1GVMCFMbzG1i6fqcalcHlwdFQRbBlU2AtWGOo=
X-Google-Smtp-Source: AMsMyM7zpPXSARAZHDRBKr8qi1ALNSe84TwZ5KX+Otpxg7YHSA1uau387pFdpk2RpgS/YkyeJnbVJpNZLQnLeCLg4L8=
X-Received: by 2002:a05:6512:1154:b0:4a2:4f74:f47c with SMTP id
 m20-20020a056512115400b004a24f74f47cmr486633lfg.367.1667935530980; Tue, 08
 Nov 2022 11:25:30 -0800 (PST)
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
 <CABC0sH0DjvXC4Hw7CxM__spomLbN1ntEsV03-CQ=3OgLLDakLg@mail.gmail.com> <1725B2503015CF3E.24882@lists.openembedded.org>
In-Reply-To: <1725B2503015CF3E.24882@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Nov 2022 20:25:19 +0100
Message-ID: <CANNYZj_mWfY2aoYOPxwxL32EN8h-HjmKCqZ1BB0XsC4Rd4Cg3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: Install internal header/lib files
To: alex.kanavin@gmail.com
Cc: Tristan Lelong <tlelong@google.com>, Willy Tu <wltu@google.com>, 
	Ross Burton <Ross.Burton@arm.com>, openembedded-core@lists.openembedded.org, 
	Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 19:25:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172993

Actually, you don't need to do this in HIBA - a bbappend to openssh will do.

Alex

On Tue, 8 Nov 2022 at 20:21, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> I'd rather have this hidden in your recipes, yes. It's clearly a
> special needs issue, and something you shouldn't ask us to maintain
> for you (what I mean is that you're not going to rebase the patch when
> a new openssh version is out, or adjust do_install - this falls on
> usually me, and my time to do these ever-growing maintenance things is
> not infinite).
>
> Alex
>
>
> On Tue, 8 Nov 2022 at 20:12, Tristan Lelong <tlelong@google.com> wrote:
> >
> > To be clear: OpenSSH maintainer will not accept a patch that exposes these files in the upstream version, but we got confirmation that they were ok if we maintained such a patch in OE (or a custom do_install in the recipe).
> >
> > If this solution is not acceptable from the OE maintainers point of view, the next option is to update the HIBA recipe to fetch OpenSSH sources on top of HIBA sources directly in HIBA's workdir, and use these instead of the one from sysroot.
> >
> > Would this work better for you?
> >
> > On Tue, Nov 8, 2022, 18:16 Willy Tu <wltu@google.com> wrote:
> >>
> >> I think they are fine with the hack here. oops. Ok, I'll work with
> >> them to get the fix without this change.
> >>
> >> Thanks for the feedback.
> >>
> >> Willy Tu
> >>
> >>
> >> On Tue, Nov 8, 2022 at 9:12 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >> >
> >> > On Tue, 8 Nov 2022 at 18:08, Willy Tu <wltu@google.com> wrote:
> >> > >
> >> > > Thanks Alexander for the feedback,
> >> > >
> >> > > We had some discussion internally with one of the OpenSSH maintainers
> >> > > and they are fine with it. I'll try to see if there is a public forum
> >> > > where we can share the discussion.
> >> >
> >> > If they are fine with it, then you need to submit a patch to openssh
> >> > that installs the needed pieces (perhaps subject to a configure
> >> > switch), get it accepted, and then add a backport to oe-core, in that
> >> > order. No do_install_append hacks please.
> >> >
> >> > Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172992): https://lists.openembedded.org/g/openembedded-core/message/172992
> Mute This Topic: https://lists.openembedded.org/mt/94475279/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

