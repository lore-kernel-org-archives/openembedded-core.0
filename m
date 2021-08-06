Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.4707.1628256472662322439
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 06:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=SlVVucqm;
 spf=pass (domain: qtec.com, ip: 209.85.167.51, mailfrom: daniel@qtec.com)
Received: by mail-lf1-f51.google.com with SMTP id n17so15248460lft.13
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 06:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qdSp2e0eYWgdbq6FIv+q+uWxN6oiCeshROFnEkaLi4s=;
        b=SlVVucqm5pKmOn73oD9vZa6AZZ3CB0O639Wj79/01yZCK0MW/f1V+l+RT63Mozk1PJ
         Oqi1FzEUOZotS8M5Ax5JE3fOsHkzlz6z/oW7TvkRRMmVWUwvuwqtB4go91bXOZ6IeP4n
         TvEy566kGDraUBHVWASZQL9+kzmGLfFWOlubP9BWeO1B8mVnIZVmGk8BpqQMkgT2alQy
         48vwjOeDcd+84INXr0AsOJ+MDHkCBtblyEYWzdvJXcyV0+pSBEJSKxYLPP3rm6PdKcTm
         iHwiBaXcoYuy6C9KV0yD8V1ayF79H1RIzTNNyAsnhudp1v4tyLCHIKrAN0E+yOA/zb4+
         aA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qdSp2e0eYWgdbq6FIv+q+uWxN6oiCeshROFnEkaLi4s=;
        b=PfxvExjCCFrSmFGc7PSx/gtNYiA88/K0u7G1tANxY21qQ4lT5Si50j02UUTZrPAvrf
         LvcpTKK927JDbXixxra9BFEetr7z4UNhxUftgE+9i3gpdlgQ3gScuBjBNf+qWoNObZO3
         kDtEtbWT0eObmfpfGbMHTo7Zduabgt9c/Xz0L05B22uyjP7oUkokM9OfOBubHzaUlic6
         ftK8R5oEPXj95A5GZvV5uooGW+0EASZjLfstUEXZ4UlDQYTFtt4DpIWRGl0vHoJ4WI7C
         3tStldX2UmpuWXK+Xs+rwIlOqESNa2/CtXNYA0CcG6wLgJ0jCrCXLffYkQxoyaVU5I4B
         W0rQ==
X-Gm-Message-State: AOAM532o1eWjF/biZBcbJHoaqx0RD5qBunOiUpkURl3MUKsMDXeFkBr3
	q9YwwrQOwOCc5iiZukytIGafsRNHRbNO9340A7EA0A==
X-Google-Smtp-Source: ABdhPJykRv9EZM8AgeP716dnWiSMAclsadDavStW17zZcQ/Wh6+YmnKe97RlKEiaHl65bZ6rRQxk8Ta4b0CHxoHkiY4=
X-Received: by 2002:a05:6512:3f99:: with SMTP id x25mr7340619lfa.225.1628256470363;
 Fri, 06 Aug 2021 06:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <f5204c03e3394a38e6663e56b0072d9d65bcc34d.camel@linuxfoundation.org>
 <20210806092337.81924-1-daniel@qtec.com> <20210806112924.61ba4c80.paul@pbarker.dev>
In-Reply-To: <20210806112924.61ba4c80.paul@pbarker.dev>
From: "Daniel Gomez" <daniel@qtec.com>
Date: Fri, 6 Aug 2021 15:27:39 +0200
Message-ID: <CAH1Ww+SYZiduJgV9WuXG_soGu13rf5nCTR6k1-xj0xokDXOiqg@mail.gmail.com>
Subject: Re: [OE-core][RFC][PATCH][dunfell] wic: Add --use-stock-fstab option
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org, Daniel Gomez <dagmcr@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Aug 2021 at 12:29, Paul Barker <paul@pbarker.dev> wrote:
>
> On Fri,  6 Aug 2021 11:23:37 +0200
> Daniel Gomez <daniel@qtec.com> wrote:
>
> > When embeddding rootfs image (e.g. 'rootfs-dir') as a partition we
> > might want to keep the stock fstab for that image. In such case, use
> > this option to not update the fstab and use the stock one instead.
> >
> > This option allows to specify which partitions get the updated fstab
> > and which get the stock fstab.
> >
> > Example:
> >     part /export --source rootfs --rootfs-dir=hockeycam-image
> >     --fstype=ext4 --label export --align 1024 --use-stock-fstab
> >
> >     part / --source rootfs --fstype=ext4 --label rootfs --align 1024
> >
> > Signed-off-by: Daniel Gomez <daniel@qtec.com>
> > ---
> >
> > The commit-id ce682a73b7447652f898ce1d1d0416a456df5416 reverted the
> > functionality to restore the stock/original fstab file in a rootfs
> > partition image (wic plugin).
> >
> > Add back such functionality with an option to the user to select which
> > fstab will be used for each partition by adding the --use-stock-fstab.
> > In this case, the user will select whether or not the stock fstab will
> > be updated or kept.
> >
> > If you agree with the patch I'll adapt it to the master branch.
> >
> > Daniel
> >
> >  scripts/lib/wic/ksparser.py  | 1 +
> >  scripts/lib/wic/partition.py | 3 ++-
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> > index 452a160232..64933e0a5b 100644
> > --- a/scripts/lib/wic/ksparser.py
> > +++ b/scripts/lib/wic/ksparser.py
> > @@ -184,6 +184,7 @@ class KickStart():
> >          part.add_argument('--use-uuid', action='store_true')
> >          part.add_argument('--uuid')
> >          part.add_argument('--fsuuid')
> > +        part.add_argument('--use-stock-fstab', action='store_true')
> >
> >          bootloader = subparsers.add_parser('bootloader')
> >          bootloader.add_argument('--append')
> > diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> > index 85f9847047..c9e45773de 100644
> > --- a/scripts/lib/wic/partition.py
> > +++ b/scripts/lib/wic/partition.py
> > @@ -54,6 +54,7 @@ class Partition():
> >          self.uuid = args.uuid
> >          self.fsuuid = args.fsuuid
> >          self.type = args.type
> > +        self.use_stock_fstab = args.use_stock_fstab
> >          self.updated_fstab_path = None
> >          self.has_fstab = False
> >          self.update_fstab_in_rootfs = False
> > @@ -286,7 +287,7 @@ class Partition():
> >              (self.fstype, extraopts, rootfs, label_str, self.fsuuid, rootfs_dir)
> >          exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
> >
> > -        if self.updated_fstab_path and self.has_fstab:
> > +        if self.updated_fstab_path and self.has_fstab and not self.use_stock_fstab:
> >              debugfs_script_path = os.path.join(cr_workdir, "debugfs_script")
> >              with open(debugfs_script_path, "w") as f:
> >                  f.write("cd etc\n")
> > --
> > 2.30.2
> >
>
> You're only addressing ext2/3/4 partitions here. The patch needs to be
> extended to cover the msdos partition case and the
> update_fstab_in_rootfs case in the rootfs source plugin.
>
> I also recommend changing the option in ksparser to '--no-fstab-update'
> to match the argument you can pass to wic itself. That way you can pass
> '--no-fstab-update' to wic to set the option for all partitions, or
> include it in the wks file to set the option per-partition.

Thanks Richard and Paul for the suggestions and the missing tasks.
I'll send a patch as soon as I have all prepared.

Daniel
>
> Thanks,
>
> --
> Paul Barker
> https://pbarker.dev/
