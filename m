Return-Path: <wltu@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C96C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 20:20:44 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.2157.1667938835844520019
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 12:20:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=cvwxRjFd;
 spf=pass (domain: google.com, ip: 209.85.219.54, mailfrom: wltu@google.com)
Received: by mail-qv1-f54.google.com with SMTP id e15so10997441qvo.4
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 12:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eaWcJu5YVl98xZh+4TJgMcX9DP3ek3Cq19WZ/EzZWfY=;
        b=cvwxRjFdck6HcoT3T2Le/TEronerncqmYoZUYtV4ODkb36PREW7r7NC1DVDAWzsVRR
         9/b2ajh4T8fcrDiycYOFkzDo031Sp5rNc3ckr9HyItvsKh49VkCJpVxrLxJOiddsk60p
         6bcgfxgDKMtlvYrNSu1+gdrXF8X+3abvHHzt6pXMM78kJY7/coPtwuPZNa8jbJpu+mxm
         YVACfAO55BU6a7o4RCgNaHPfGtsZC1r1vb8117yK0CZ9YhnMH/3TZHYagFiMIGSA131b
         W2UUDlcgsbj+/9lS7QE2UEmJR8CH16I2e+x95rB0I4gbSMhQpbs4gpOZNZZY/QAwWK8N
         vaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaWcJu5YVl98xZh+4TJgMcX9DP3ek3Cq19WZ/EzZWfY=;
        b=LrlKDa3qGyV9T5cyTDs47AfCn7xoGHCGR2b7ggUtwV1n9vAB0/yb0wbKi/rUqqo1gp
         Fu523GbV11a9yGdT1ydlVzjJ2oSigv/UZM3ET9vzVUbXTFpYN/z5yDhesjaGnKGxkO7a
         1mH8JjEws/gyrSfO5lxEtOY9pZVXzgi9dkkIN/dPmnXEJq+L47nqWkGpKihKp/uPevLi
         R4xjMckqSJXcr6auSLWWmIgYdMBaWHpr0cdaFUBC3cJNBmabOcR5EitvfsmAFk9STkmH
         MJFf4mvj5k7bH2VzCVFSpnPLKdB1K/MW3fx5ffZs4q2gna061wFYez3UvTn5c8Y+XYVv
         6tKw==
X-Gm-Message-State: ACrzQf2aAIWw6ZUnsS3P90JrHlJ+cbJHMB2KZeojvsZ07dTjwsNS7y70
	YrHEIGLfR2LNZ82BT4K9KxBs7zpMfqlEtVBzXtC93Q==
X-Google-Smtp-Source: AMsMyM5jV3qUxdKmYUaAUdU/w2Gxz0uclzd5r6kmufQ5cfwMyDOvg/HHVcoPnnX8KP5h6rZqkzevYZI6WwGhPmzog7Y=
X-Received: by 2002:ad4:5bc1:0:b0:4ad:34b2:d29c with SMTP id
 t1-20020ad45bc1000000b004ad34b2d29cmr51521266qvt.21.1667938834649; Tue, 08
 Nov 2022 12:20:34 -0800 (PST)
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
 <CAHwn2X=ZCLSFAui=NV4e39FKk9azL4oqoNj85UHdgb9EdEaO2g@mail.gmail.com> <CANNYZj-nYbhYp8yfZYdDmS0TN8mRHmUB1Jh2zmLmcLH1FiyKpA@mail.gmail.com>
In-Reply-To: <CANNYZj-nYbhYp8yfZYdDmS0TN8mRHmUB1Jh2zmLmcLH1FiyKpA@mail.gmail.com>
From: Willy Tu <wltu@google.com>
Date: Tue, 8 Nov 2022 12:20:23 -0800
Message-ID: <CAHwn2Xm=7tbDM6e4xPm75KTQ2vVCNKeCp1mBGq-Ws_u=bAX5Ww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: Install internal header/lib files
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Tristan Lelong <tlelong@google.com>, Ross Burton <Ross.Burton@arm.com>, 
	openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 20:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172998

ok, sounds good. thanks. I think I had a version that does that. I'll
revert back to that version.

I'll let the maintainer there know so that we can proceed with that direction.

Willy Tu


On Tue, Nov 8, 2022 at 11:37 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Ah, I thought this was in a separate layer. I think you're best off
> getting a private copy of openssh sources then.
>
> Alex
>
> On Tue, 8 Nov 2022 at 20:30, Willy Tu <wltu@google.com> wrote:
> >
> > So do you suggest adding bbappend in meta-openembedded where https://github.com/openembedded/meta-openembedded/pull/597 will live?
> >
> > I'll check with the maintainer there. And Google/hiba users will maintain that.
> >
> > Best,
> >
> > Willy Tu
> >
> >
> > On Tue, Nov 8, 2022 at 11:25 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >>
> >> Actually, you don't need to do this in HIBA - a bbappend to openssh will do.
> >>
> >> Alex
> >>
> >> On Tue, 8 Nov 2022 at 20:21, Alexander Kanavin via
> >> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> >> wrote:
> >> >
> >> > I'd rather have this hidden in your recipes, yes. It's clearly a
> >> > special needs issue, and something you shouldn't ask us to maintain
> >> > for you (what I mean is that you're not going to rebase the patch when
> >> > a new openssh version is out, or adjust do_install - this falls on
> >> > usually me, and my time to do these ever-growing maintenance things is
> >> > not infinite).
> >> >
> >> > Alex
> >> >
> >> >
> >> > On Tue, 8 Nov 2022 at 20:12, Tristan Lelong <tlelong@google.com> wrote:
> >> > >
> >> > > To be clear: OpenSSH maintainer will not accept a patch that exposes these files in the upstream version, but we got confirmation that they were ok if we maintained such a patch in OE (or a custom do_install in the recipe).
> >> > >
> >> > > If this solution is not acceptable from the OE maintainers point of view, the next option is to update the HIBA recipe to fetch OpenSSH sources on top of HIBA sources directly in HIBA's workdir, and use these instead of the one from sysroot.
> >> > >
> >> > > Would this work better for you?
> >> > >
> >> > > On Tue, Nov 8, 2022, 18:16 Willy Tu <wltu@google.com> wrote:
> >> > >>
> >> > >> I think they are fine with the hack here. oops. Ok, I'll work with
> >> > >> them to get the fix without this change.
> >> > >>
> >> > >> Thanks for the feedback.
> >> > >>
> >> > >> Willy Tu
> >> > >>
> >> > >>
> >> > >> On Tue, Nov 8, 2022 at 9:12 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >> > >> >
> >> > >> > On Tue, 8 Nov 2022 at 18:08, Willy Tu <wltu@google.com> wrote:
> >> > >> > >
> >> > >> > > Thanks Alexander for the feedback,
> >> > >> > >
> >> > >> > > We had some discussion internally with one of the OpenSSH maintainers
> >> > >> > > and they are fine with it. I'll try to see if there is a public forum
> >> > >> > > where we can share the discussion.
> >> > >> >
> >> > >> > If they are fine with it, then you need to submit a patch to openssh
> >> > >> > that installs the needed pieces (perhaps subject to a configure
> >> > >> > switch), get it accepted, and then add a backport to oe-core, in that
> >> > >> > order. No do_install_append hacks please.
> >> > >> >
> >> > >> > Alex
> >> >
> >> > -=-=-=-=-=-=-=-=-=-=-=-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#172992): https://lists.openembedded.org/g/openembedded-core/message/172992
> >> > Mute This Topic: https://lists.openembedded.org/mt/94475279/1686489
> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> >> > -=-=-=-=-=-=-=-=-=-=-=-
> >> >

