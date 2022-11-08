Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03ED6C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 19:21:44 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web12.1410.1667935293866074229
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 11:21:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OxxnP4bh;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id a29so4030744lfj.9
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 11:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qK8KNZ4CjIDEZ/OccaDvYRoKVkxu+gn002DZ4Sss/cE=;
        b=OxxnP4bh6wu+mVkVSZDAGNIIsYReGteX7FcqMBYmfKYpfhr+ydq3zyqOtvpmdw5b6E
         2k7FTNbJ+0QbZxhh+rHXGKHIz83l3AEoSkH72XHMwowK/agDwpmJlELoAcuw2J9FL2Jc
         4qJfkCoKfR4jDpMXrIlDhBmpyD0iM/1q2DAKfu6MMM5Q2j7FoHdEkOPCHfF0ADKYeqI4
         SYygZ8+NEnbWhzlKejiriMxJSKK5JHQWan4ofGsmi22m8gF4l9nzCVzJhb48pQIeQDpO
         JHalb4YJgakaBrtv6WIFy59iAAABewUiBfnpJ63B0BTBx0YUHVRviped/redlv/6YqEy
         dlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qK8KNZ4CjIDEZ/OccaDvYRoKVkxu+gn002DZ4Sss/cE=;
        b=R5GIpdQkiI4VLFSXklLgDhnHlLHZwerJVxbdrO4q+9Gj9y226g5VM3lpCjeobi6WhA
         xSf1lvct19wDRZNxNiEjmj+GE+k0IiLm0JUq7zWCaGvfsfOZj/ELgrVi5s3hIx+FQTQs
         nGvWoGw0aIEHOURyQCXhZWe9mg12/LP1kelT6hsGxTEzZCOrSu4IkpEnR9XBgF3rJIed
         ZjtiqJZVGtdaiFbt7bFOxdtu4tXaOfHy17C0ITsmFYLubCpEdA3+61++WM/5lPnVfVlT
         sfVoxbqv6RIDVaszYv0itq4PxSSzQxeTBTbaAwkYa/qeM3eCSGYBTZ3j+ia5Wjc/PyrQ
         8E2g==
X-Gm-Message-State: ACrzQf2UUfYPxvNonoEWiTjqnF3v8gabzT17GNyrf6TzB8OK8FzdsjI2
	4a3debIUZf2L0i5kxz4/1czaoBftJ2V2mf4kjN4=
X-Google-Smtp-Source: AMsMyM7UJVVTG/qfTWCeUSTU1rmWw8SHg9dMbBG34OLm6zbLsy3cFwwsWDPcCYYMRxr+1XECUXe37NAGWqKrD+reun8=
X-Received: by 2002:ac2:4c8e:0:b0:4a2:7d0d:c7a5 with SMTP id
 d14-20020ac24c8e000000b004a27d0dc7a5mr19575021lfl.367.1667935292004; Tue, 08
 Nov 2022 11:21:32 -0800 (PST)
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
 <CAHwn2Xn+n5ArRRH3u=x+wA+y+AaEyBOZd1JQB45FQH6rme02wg@mail.gmail.com> <CABC0sH0DjvXC4Hw7CxM__spomLbN1ntEsV03-CQ=3OgLLDakLg@mail.gmail.com>
In-Reply-To: <CABC0sH0DjvXC4Hw7CxM__spomLbN1ntEsV03-CQ=3OgLLDakLg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Nov 2022 20:21:20 +0100
Message-ID: <CANNYZj9dtemWxzHJ8Ga6X6ctArg26D+msOCbk5GfQ4e45vy9PA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: Install internal header/lib files
To: Tristan Lelong <tlelong@google.com>
Cc: Willy Tu <wltu@google.com>, Ross Burton <Ross.Burton@arm.com>, 
	openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 19:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172992

I'd rather have this hidden in your recipes, yes. It's clearly a
special needs issue, and something you shouldn't ask us to maintain
for you (what I mean is that you're not going to rebase the patch when
a new openssh version is out, or adjust do_install - this falls on
usually me, and my time to do these ever-growing maintenance things is
not infinite).

Alex


On Tue, 8 Nov 2022 at 20:12, Tristan Lelong <tlelong@google.com> wrote:
>
> To be clear: OpenSSH maintainer will not accept a patch that exposes these files in the upstream version, but we got confirmation that they were ok if we maintained such a patch in OE (or a custom do_install in the recipe).
>
> If this solution is not acceptable from the OE maintainers point of view, the next option is to update the HIBA recipe to fetch OpenSSH sources on top of HIBA sources directly in HIBA's workdir, and use these instead of the one from sysroot.
>
> Would this work better for you?
>
> On Tue, Nov 8, 2022, 18:16 Willy Tu <wltu@google.com> wrote:
>>
>> I think they are fine with the hack here. oops. Ok, I'll work with
>> them to get the fix without this change.
>>
>> Thanks for the feedback.
>>
>> Willy Tu
>>
>>
>> On Tue, Nov 8, 2022 at 9:12 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>> >
>> > On Tue, 8 Nov 2022 at 18:08, Willy Tu <wltu@google.com> wrote:
>> > >
>> > > Thanks Alexander for the feedback,
>> > >
>> > > We had some discussion internally with one of the OpenSSH maintainers
>> > > and they are fine with it. I'll try to see if there is a public forum
>> > > where we can share the discussion.
>> >
>> > If they are fine with it, then you need to submit a patch to openssh
>> > that installs the needed pieces (perhaps subject to a configure
>> > switch), get it accepted, and then add a backport to oe-core, in that
>> > order. No do_install_append hacks please.
>> >
>> > Alex

