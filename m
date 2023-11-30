Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BC8C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 17:33:24 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.78641.1701365599168488858
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 09:33:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H8CPaYi1;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1fae0e518a4so38177fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 09:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701365598; x=1701970398; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9Y+FeXCNXiPHlk729hit8krNukdScewRi8H7tMBFpg=;
        b=H8CPaYi1/BjxHXlDrdsl7TSWQWK0ulbkmA9cy00JThHrJ++qcZFmndfvfaToXBxxhT
         hywTs/JzKDgkNyALA/LIRXyXvPEPpvbWTwk8vPHQtxJmybdChVxghv9a/oXuSDbqTrgz
         11gVNJyUPhGgiunlsqJsX3qOt6J+OZE69amZ5+0QUx0fkn9qdRvS4SqUHCkYc3uYag+O
         bPFP7W7LISzDmo6kyuofHFWV4JJlJjbq0cqCpXWX1a+hFdqLozvywZHIIaaQaMpIQxOI
         fduBOszVDvzD3950GSZ4VHTLnTPHkIJAgQ6jPWftIsNhTmkfIuwtG53acorMhZhpOSS1
         8E0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701365598; x=1701970398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9Y+FeXCNXiPHlk729hit8krNukdScewRi8H7tMBFpg=;
        b=tyYg2/tUgs4yDjpWkC4S2A4eQe05R6hojtUuRR3UTTWASPmRyE8AoEzsCx2hF6PGZm
         x45k/HuHUvSdS5imf6rXdSDmZgfe8/Qh3h8in0ytgqHogWcHUaueo/71DuasevRMxCj8
         /SGgDOFBZnye4QO3xEguMvisd5fZbjSG8eC4kFmvC8W74vFIzbXzNzuhjhSgANlOd3HX
         /ZRZqgyGJdc6dO5i/ZM34+e7EWThDm5d66kpjcHyEfyt8/RaeZnV95oYcW1nVk9BFAyr
         R4WbJqvBMBe58Nm5UU5/GsBoOzuzaS1A4qcz1QE86pNJrpTZP39U+lcQj6KIkcQkMX18
         wIZg==
X-Gm-Message-State: AOJu0Yy/MlwNIwMyPzE+Qtn5CxIVPKS5QeoTtYRmnxLN8vq1tJ6K3Rkj
	z1PwqU2PsgVppoL3csW4rlFQh21jm+4tm3zcISs=
X-Google-Smtp-Source: AGHT+IG2g2gEjdgtW8x0S4LRzS0eNok+lQJvNlv7Z5ie5xT6tQCk7cHpb3gB60ca3FH39k6V9D3QpVMIbi8SPHLhEU8=
X-Received: by 2002:a05:6870:148e:b0:1f9:e180:d23e with SMTP id
 k14-20020a056870148e00b001f9e180d23emr11086407oab.27.1701365598361; Thu, 30
 Nov 2023 09:33:18 -0800 (PST)
MIME-Version: 1.0
References: <179C617DA6240870.31732@lists.openembedded.org>
 <CAHUKmYZEOc+xkE2xCbMhUea2QDVZQ4u08sDoQPigD_pJYcFKDg@mail.gmail.com> <aebacb803aa1f3addc1c425a465ab75d3a415dc9.camel@linuxfoundation.org>
In-Reply-To: <aebacb803aa1f3addc1c425a465ab75d3a415dc9.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Nov 2023 09:32:52 -0800
Message-ID: <CAMKF1soGVJED8A7HO8Fdvwn4sMjF2ACORONqNPQxxvuSLg5KYQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gdb/systemd: enable minidebuginfo support conditionally
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: ecordonnier@snap.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 17:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191515

On Thu, Nov 30, 2023 at 3:21=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi,
>
> I saw some of this discussion on the systemd-devel list so I'm happy to
> see patches to sort out the configuration on our side, thanks!
>
> On Thu, 2023-11-30 at 12:15 +0100, Etienne Cordonnier via lists.openembed=
ded.org wrote:
> > Hi all, I sent this patch to start the conversation, but I guess
> > PACKAGE_MINIDEBUGINFO may have to be turned into a DISTRO_FEATURES
> > before this can be merged.
> > I tested this with core-image-sato after enabling systemd in
> > local.conf. I then started:
> > $ vi
> > In other terminal:
> > $ kill -SEGV $(pidof vi)
> > $ coredumpctl info
> >
> > Before the patch, I didn't get a call-stack with symbols. After the
> > patch, I get a call-stack including function names inside
> > busybox.nosuid ("read_key()").
> >
> > This is a very useful feature for debugging and/or bug reporting, so
> > I think it would make sense to make it easy to enable via a
> > DISTRO_FEATURES. I was just not sure why MINIDEBUGINFO was not a
> > DISTRO_FEATURES in the first place, and whether you would be willing
> > to enable systemd-coredump via the MINIDEBUGINFO DISTRO_FEATURES.
>
> I think we should make minidebuginfo a DISTRO_FEATURE and then key all
> the tweaks off that.
>
> I was looking at your patches and thinking we might want to enable
> minidebuginfo in poky or perhaps OE-Core by default too.

is it dependent on systemd for coredumpctl or can be use some other tool as=
 well
for inspection.

>
> A test to ensure this backtracing works and stays working would be
> really nice too! (whilst we have the context in our heads)
>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191498): https://lists.openembedded.org/g/openembedde=
d-core/message/191498
> Mute This Topic: https://lists.openembedded.org/mt/102891486/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

