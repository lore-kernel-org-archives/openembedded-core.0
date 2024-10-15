Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40E1D21690
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:25:35 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.12106.1728995132555242785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VjHih13S;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-717da7cb71fso1497572a34.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 05:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728995132; x=1729599932; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdxzlqtEEgkwB6TtoGb7f39Oq0vJyU+83/rz5+3fk7c=;
        b=VjHih13S7HJrykfyeV3NZtn81rhHpKn22AZ4S+1CrLRPg0ZX440P7Do0qEgSPBoUXM
         kD6xK7GoySezqLCiTAsJeEGv7gw77PdTNb/2Oz/FRKMf3JI8E5XeJtoaNYKO7ufGFz7u
         cjMLv3GeI+zVNT4pVbjaD5JkpKwCD7YXMlnDgU1Fy7RiWjSYMVYXLR5wSWY7hMx1btbC
         bvfEgskaa+Y8DLbea9CPqf73ffIqlJNBJv3BY3xDDQNTvcJRm90So3XgM2H0XZIIhS2G
         qLABaDvlx/fNM0dIkDe7pafdcnH/O7bNyJNKtzDSk6WSC2OqOkZORTvBGVTUNXoGUiiN
         dTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728995132; x=1729599932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdxzlqtEEgkwB6TtoGb7f39Oq0vJyU+83/rz5+3fk7c=;
        b=Rdu02D+z/m3Gi8mhZAnOK9ckfAA/3AyTT+gsfpe6YUJ2GuDD4xzKxzOJukczKkrPDP
         F42gZVVXy3m3Bw3OAPrFC1+E/j6wLUenA4xd/o6B0y8w9GrdcggQ5pzz+hs1Ls5lUjSt
         rbONidC8u7jarE2pjxbDNdX4pmgO+ZKZu5nDTlmtJmWYUocEVNyWObkM9PGXaINf6Xb2
         2wWvGRFrRzNG0R0C+WuTOq9QQa6MbfZCxZZ0jgaoyacnotJSl22+qK2j0klqnEPbd/io
         qtooqXmLgMUN2wK/gdl0o1YoTO0hUbnS8vKdk4bfyOU6o8ezT1gDDiqH6F28djagtftP
         OaIw==
X-Forwarded-Encrypted: i=1; AJvYcCXKmVgi+6nrT5TXou8P2JpkhuUEPr2FgTUz/toSBqvyWCjFFvMLoloDKq0bVi1RI/ZQm+M9AYKADs/c2kXIbZCDsQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YymksrcsIPAIsYTksTSvILetZ6vLkAY2E++4Ip3+Fbl03a6lOLw
	OmRJMAyBM8Zfi8RkTqHVDvLfx1GTDp0vI9SYwtNisLuVvf7BsukJTRTFbHihyPakjFDl+sjYqsa
	hlDTrepoPAsb65QlsT4+z0Oz9gUw=
X-Google-Smtp-Source: AGHT+IHj9IKCuSZfbrTuaS938vdbNivJ10Q+TbwKz1AUjy8Y2VWXtrhjCXwRAdjK0g0apgJqOv8Y0JOSIC1DWULjJqE=
X-Received: by 2002:a05:6870:471e:b0:27c:a414:c0a7 with SMTP id
 586e51a60fabf-2886dd55970mr9153369fac.9.1728995131742; Tue, 15 Oct 2024
 05:25:31 -0700 (PDT)
MIME-Version: 1.0
References: <20241002100900.2975523-1-paul@pbarker.dev> <17FAA66AC3C448F3.5426@lists.openembedded.org>
In-Reply-To: <17FAA66AC3C448F3.5426@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 15 Oct 2024 08:25:19 -0400
Message-ID: <CADkTA4M07Obkg_9+WLb19MBPKhB58tvw+UJAvabsWpaee=OLrw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] kernel-yocto: Support in-tree config fragments
To: bruce.ashfield@gmail.com
Cc: paul@pbarker.dev, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205911

On Wed, Oct 2, 2024 at 9:39=E2=80=AFAM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Wed, Oct 2, 2024 at 6:09=E2=80=AFAM Paul Barker via lists.openembedded=
.org
> <paul=3Dpbarker.dev@lists.openembedded.org> wrote:
> >
> > [This is currently an RFC as it depends on a separate patch to add
> >   support for config fragments with .config file extensions in
> >   yocto-kernel-tools:
> >   https://lists.yoctoproject.org/g/linux-yocto/message/14431]
> >
> > In Linux 6.8, the in-tree rv32_defconfig file for 32-bit RISC-V support
> > was dropped in favour of a Makefile target which combines the RISC-V
> > defconfig with a config fragment '32-bit.config'. So to build for 32-bi=
t
> > RISC-V using the in-tree configuration from an upstream kernel, we need
> > to be able to enable this 32-bit config fragment.
> >
> > We can support this via KERNEL_FEATURES if we add the in-tree arch
> > config directory (arch/${ARCH}/configs) to the search path.
>
> Agreed, that this is a more consistent way to bring in these types
> of fragments (versus being hidden under the build/make, etc).
>
> The only issue is that the audit won't react correctly to these
> fragments, so we'll potentially end up with silent failure of them
> to apply and/or options that are not valid, etc.
>
> Let me queue this patch locally, do some audit testing (and changes
> if necessary) and I'll send it along in my next pull request.
>
> (Same goes for the kern-tools patch).

I just saw your ping on another patch, so I thought I'd follow
up here!

I have the changes queued, but have been out on holiday the
past few days (Canadian Thanksgiving). My audit addition is
almost done (I just have to make it conditional now) and then
a bit of final testing.

I do expect to submit this as part of my next pull request,
hopefully by the end of this week.

Bruce

>
> Bruce
>
> >
> > While we're here, let's also add the generic config directory
> > (kernel/configs) to the search path so in-tree config fragments such as
> > 'hardening.config' can be used.
> >
> > Signed-off-by: Paul Barker <paul@pbarker.dev>
> > ---
> >  meta/classes-recipe/kernel-yocto.bbclass | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-re=
cipe/kernel-yocto.bbclass
> > index 6d5c3b6327b6..66602d359404 100644
> > --- a/meta/classes-recipe/kernel-yocto.bbclass
> > +++ b/meta/classes-recipe/kernel-yocto.bbclass
> > @@ -248,6 +248,9 @@ do_kernel_metadata() {
> >                  fi
> >         done
> >
> > +       # allow in-tree config fragments to be used in KERNEL_FEATURES
> > +       includes=3D"$includes -I${S}/arch/${ARCH}/configs -I${S}/kernel=
/configs"
> > +
> >         # expand kernel features into their full path equivalents
> >         bsp_definition=3D$(spp ${includes} --find -DKMACHINE=3D${KMACHI=
NE} -DKTYPE=3D${LINUX_KERNEL_TYPE})
> >         if [ -z "$bsp_definition" ]; then
> > --
> > 2.39.5
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205201): https://lists.openembedded.org/g/openembedde=
d-core/message/205201
> Mute This Topic: https://lists.openembedded.org/mt/108776739/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

