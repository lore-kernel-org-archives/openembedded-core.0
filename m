Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04AEC4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 16:42:54 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.23382.1671640973041376609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 08:42:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cKkdxzWV;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id i9so22814944edj.4
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 08:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P4L9Tx+Ax5R6miv9cO6JoMNzrsJZY/3ZARDtX4Nsd2w=;
        b=cKkdxzWVNrWb1OYaCa9gNwOnwyif887Z2TLpyKxTdYIuvj10jR1p5d87DV5REAvH+v
         feEKMHuZelrus31MwNF5ahKugm9pjo68hd/Lu4l7yu2r5B8C1+hKccB+/HrCaKhqiBsL
         xdMXJP1NRT2hTBPoRH0332rHpmm2E3A0ZZ4Why+bUeC9tH0ssvlx2mTSSxjiHaA5Kp7g
         d+sdLIMQYK1/dVtlf1gDC71NA/64LVQL/GsJgsOjMemCBVVQvIGS6uPIf5oG9TFq6jrD
         ShzprN2FeI97Emtru0qBhdVWhlPSmtz/Bmtwr446mfocfmYuM18s5daGbGWfXnmzY56m
         /LgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4L9Tx+Ax5R6miv9cO6JoMNzrsJZY/3ZARDtX4Nsd2w=;
        b=8GckhgvEAsj6OT3zrw2cv6YugY4C+M5vjXaIJAmeS/JCMeuqJbLkEwMQ73HBn9iN1c
         JF/0FRXLdAqR24UgrJTO5S+wPtRbKPNtMvsrj0EYVk9KI9l/Sfgff52a38ZkUhXzIBJZ
         ++5hGhlRmXCCB7LBx7LDs878QRmK+ewz0v10HgUMOYQQm66oJ4WZfTy1CmBsrqj2JQHN
         N1nKDX3SxI1KpR3Eee7F/7R1T9wzvedG0Q7TEQHAGV4LNRUPNt7r9YwUTcMiyweMmQ+V
         NOyHEqL8JGoblbboQkJyJYmKoiznjLjUyNdS8W2vjJAEqcOy5YcnTWb1GVUlwC0W1Ygx
         /14A==
X-Gm-Message-State: AFqh2krpgthZDjA6nj+4DWHyP7YHHsBiz3lda7YFo5rhAYbiR5AJY1A7
	T0qG/BJBeBYMUhiUg7eJ5Aps8IEeKDoo+f+FVtU=
X-Google-Smtp-Source: AMrXdXucxLndPPBC2Umw8a+OTO0tyuvphBvHlt4mvzppFQZ6a61xHmSdf/E1yJg8N+T0zH+m+0n1eibGm0Hv1YCGS7c=
X-Received: by 2002:a05:6402:c09:b0:475:5695:62b5 with SMTP id
 co9-20020a0564020c0900b00475569562b5mr187395edb.364.1671640971500; Wed, 21
 Dec 2022 08:42:51 -0800 (PST)
MIME-Version: 1.0
References: <20221221125306.13779-1-alex.kiernan@gmail.com>
 <20221221125306.13779-10-alex.kiernan@gmail.com> <abe8931d3e41dae57f13ab07a8e016c2ded2827f.camel@linuxfoundation.org>
In-Reply-To: <abe8931d3e41dae57f13ab07a8e016c2ded2827f.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 21 Dec 2022 16:42:39 +0000
Message-ID: <CAO5Uq5SKFN7T4VAQvZZni_rXNwfwWPd1rt7enb7wc0fGK3TNbw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2 09/10] packagegroup-core-sdk: Add SDK
 toolchain language selection support
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 16:42:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174923

On Wed, Dec 21, 2022 at 4:39 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2022-12-21 at 12:53 +0000, Alex Kiernan wrote:
> > Use SDK_TOOLCHAIN_LANGS to allow different language support to be
> > selected within SDKs. Initially supported options are rust and go.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> > (no changes since v1)
> >
> >  .../packagegroups/packagegroup-core-sdk.bb             | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> > index d70aff22c725..0e480e6ac756 100644
> > --- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> > +++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> > @@ -11,6 +11,11 @@ inherit packagegroup
> >
> >  #PACKAGEFUNCS =+ 'generate_sdk_pkgs'
> >
> > +SDK_TOOLCHAIN_LANGS ??= ""
> > +SDK_TOOLCHAIN_LANGS:remove:sdkmingw32 = "rust"
> > +# libstd-rs doesn't build for mips n32 with compiler constraint errors
> > +SDK_TOOLCHAIN_LANGS:remove:mipsarchn32 = "rust"
> > +
> >  RDEPENDS:packagegroup-core-sdk = "\
> >      packagegroup-core-buildessential \
> >      coreutils \
> > @@ -23,7 +28,10 @@ RDEPENDS:packagegroup-core-sdk = "\
> >      less \
> >      ldd \
> >      file \
> > -    tcl"
> > +    tcl \
> > +    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go', 'packagegroup-go-sdk-target', '', d)} \
> > +    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rust', 'packagegroup-rust-sdk-target', '', d)} \
> > +"
>
> I'm a little torn on this. I created SDK_TOOLCHAIN_LANGS as a control
> for the SDKs from populate_sdk. Whether the target SDK images should
> follow that as well, I'm less sure.
>
> It is probably fine and I nearly didn't send a comment but I just
> wanted to see what others think.
>
> We could perhaps do something like:
>
> TARGET_TOOLCHAIN_LANGS ??= "${SDK_TOOLCHAIN_LANGS}"
>
> in the recipe to cover the ability to separate the two if we wanted...
>

I ummed and ahhed about reusing it... so I think it's a good discussion point...

-- 
Alex Kiernan

