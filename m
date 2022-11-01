Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0393AC4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 20:17:41 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web12.184.1667333853276918897
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 13:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jU0fp9+/;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id z24so22572945ljn.4
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 13:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srkdBoBgO3osKIrt8xNEdoPOFb1wc9bmhK8tsvruEH4=;
        b=jU0fp9+/38ofjLafJz0ydZHw44fuJupbla7gvQ4QdunYOqShhTS99HuNYf79wniw/B
         COzbgK0xOCb/ExOmrYj4Wn5lKRbEYP/wXRur5FrlXeC2iWqP6sxwRYVZeUi3pCXPHFB9
         JCl5rILlZ3dDVgPuOzs/+gUVmdXxVgiPVKhTuY+pRDP3PGhaFE5laJfTff63NhtIF5I1
         8wB31x9ZeBp1fL1/HngLy5FPsPEtTEPiYTG4HDvLJOKpyZTZHhVSP1yeFdSC9pzp9iD4
         0NkbN0UWajE0qgLJR7B/xJ03Tw3MVHm2AgWmtTETWpLicZ+fvMYbdfaM7DFYQ2Bisqf0
         ujWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=srkdBoBgO3osKIrt8xNEdoPOFb1wc9bmhK8tsvruEH4=;
        b=RtZu27rCIEjWWoIRTRi0dMNWn3UbnH0e6+s5r80XCQvT42QhQn0gUcoH/lcs5KV9vn
         A2RT01xqVAz9BkTm76IJZlXMcUwbmBS9OTRGl/YLRwPPLz6wmT4bnUv+9vCQB7TUY6c6
         BJCt0lye2FUlJBKIs/5Zfc0DJaUTYOQSSFEpdDDYSQ0/ypHpCFswHfOt4Io0C13+CftW
         eyvRhxdp29itrJQJd45muE2vHIqwNRc7wJGW760//PiibtSHmSCdQBqaMLI0pF0DpPVy
         bwKQQZOZtRCcfswH40CtZg0QnMEHjWtuKMIQ9CHYfy+X7PWW7OuLVAoR0mKwH3IZke9N
         N+Cg==
X-Gm-Message-State: ACrzQf0rgapAfnED8vFu2MxS2Epw+ziN+ze3gvdcMI/RRHhX2+jyHv4p
	bKJD8OY6/pmjL9v3p6X1+62z7UjGf8dagT3lTrA=
X-Google-Smtp-Source: AMsMyM7qG5Ek621a46PUIQ8hxTX35/5iac4wZHw6D9p1vi4vR9LdQFnB80BH1igYZgyWIIIWTxOMlznYv4fo7L0yzd0=
X-Received: by 2002:a2e:844e:0:b0:26b:f5ee:b2bb with SMTP id
 u14-20020a2e844e000000b0026bf5eeb2bbmr7978677ljh.403.1667333851551; Tue, 01
 Nov 2022 13:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <64cf9c1a-a3c7-42e3-d050-4f493c7fcebc@amd.com> <43cab497-3168-ea40-e13e-48d4e610533e@kernel.crashing.org>
In-Reply-To: <43cab497-3168-ea40-e13e-48d4e610533e@kernel.crashing.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Nov 2022 21:17:20 +0100
Message-ID: <CANNYZj-b+HLuBPN2qHVWRMgBDVoDmZwBOckb5CHCJGCMunDooA@mail.gmail.com>
Subject: Re: [OE-core] Running weston as non-weston user
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>, 
	openembedded-core@lists.openembedded.org, PEWhacker@gmail.com, 
	bruce.ashfield@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 20:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172386

The answer is basically 'patches welcome'. The original reason for
adding a weston user was to simply not run weston as root (which was
the case before). Further improving this to allow regular users use
core-image-weston for graphical things would be good, but figuring out
technical specifics is on you.

Alex


On Tue, 1 Nov 2022 at 21:13, Mark Hatle <mark.hatle@kernel.crashing.org> wr=
ote:
>
>
>
> On 11/1/22 3:03 PM, Gundlupet Raju, Sandeep wrote:
> > Hello,
> >
> > We wanted to know what the actual use case is for running weston as
> > weston user only in OE core
> > http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-graphi=
cs/wayland/weston-init/weston.service#n44
> >
> >
> > How is this expected to be used for another user.  Is this intended to
> > be run as the primary machine user or is there another approach? For a
> > system where weston starts itself, it=E2=80=99s expected to start with =
the
> > weston user only?
> >
> > Can we add a existing user to weston group and make it to work?
>
> An additional question:
>
> For a system w/o mouse and keyboard, can we ssh in and execute our waylan=
d tests
> from remote?  If so, what user should we be using (weston), can we define=
 our
> own user?
>
> --Mark
>
> > Thanks,
> > Sandeep
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172385): https://lists.openembedded.org/g/openembedde=
d-core/message/172385
> Mute This Topic: https://lists.openembedded.org/mt/94719795/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

