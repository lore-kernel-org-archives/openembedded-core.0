Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web08.364.1628602582910640879
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 06:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=XwVk5Axb;
 spf=pass (domain: qtec.com, ip: 209.85.208.178, mailfrom: daniel@qtec.com)
Received: by mail-lj1-f178.google.com with SMTP id a7so29065485ljq.11
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 06:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ph8qwqYeHJ5f6u8XPtztNZ9bm28G8KlfOGHQZNA5v6g=;
        b=XwVk5AxbmjfsMnKqVJip6D/inNSu2EXIiS3Tji4f+rssMK+75rFDq9w/VyYRtUM0l1
         O8QA3rmTtv1ul1Dgnh650h/hb9N3qMNOQu/b8P/bRb6yaoRpvHRxGFg64+/V98hRCcYd
         Bzg33pxXkpkvcI1+VtbpcqV4oB1Zb5e9hbb/sgcCwz3C9GEwjcyJcySV7a4NhXP60u0V
         GbFnlaeFPzit7NCN6lt7B4PExRst8bAbW44LSEFNmJGXnBiUa55ICvZHcv+zjtpg/N3A
         eGFSEmQpXLwB6vIQlUxUorH6g0bdGg6wJeyAbQsIKFypRdBMZlRnVsYshozTIZa6t+gz
         uk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ph8qwqYeHJ5f6u8XPtztNZ9bm28G8KlfOGHQZNA5v6g=;
        b=Yl8WB991jEuUXi4gnqxZglCS82lgAMSYEbD6suAff5eyVguitoQDwZEdnHkjHi8wMe
         ZWTm0LCTK6tZvUVpq2ha2C3m+HFx3CCTPWoI9FIa+ZyX2s5YsVYa51lKbU39/PaplpEk
         DjkVnCQcBdUM4dJd85PvpdiNOar3QB5Z3zdUaC+So9afOzFbSGjpErsE9vMYBGlOKJIb
         BfQ+4RJPUqEsxlRwz0L71al9mLAyJnWP3udXJ47FMZEUrQZxojFB+wB+d6E2l7HmkTK0
         5HZAqM3Br5OzwSMuR36p8S4FFSchi/4SE2+JPPuko6HvYn6C8g350JQqKPFiidFy/HDG
         tz+Q==
X-Gm-Message-State: AOAM532rqN9qjzyFIXoo8aAfM2rW1Ch3EQJ42T9cR8nqPbmZPqj1YnGX
	wNOpecPEpJUtkAQvCi8PbTm5yTSH450AHK0rnaiFVQ==
X-Google-Smtp-Source: ABdhPJwdEEyHRlqg+k16t/3yKYi7zjnwaG+GVz4e5zNtfZhcNt5ShJqoWxwvbQLCMpN5zODp/iIE5SjhtHmHMih0rf8=
X-Received: by 2002:a2e:8e86:: with SMTP id z6mr6771677ljk.222.1628602580760;
 Tue, 10 Aug 2021 06:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <1698BAA2EADEB7F4.20643@lists.openembedded.org>
 <20210810130603.245475-1-daniel@qtec.com> <20210810142514.69504dde.paul@pbarker.dev>
In-Reply-To: <20210810142514.69504dde.paul@pbarker.dev>
From: "Daniel Gomez" <daniel@qtec.com>
Date: Tue, 10 Aug 2021 15:36:09 +0200
Message-ID: <CAH1Ww+S5FMJObpzKTwvztWDtbhzjkV=iJ7U3OKhTJtc9coxb5A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] 1/2] wic: Add --no-fstab-update part option
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org, Daniel Gomez <dagmcr@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Tue, 10 Aug 2021 at 15:25, Paul Barker <paul@pbarker.dev> wrote:
>
> On Tue, 10 Aug 2021 15:06:02 +0200
> Daniel Gomez <daniel@qtec.com> wrote:
>
> > When embedding a rootfs image (e.g. 'rootfs-dir') as a partition we might
> > want to keep the stock fstab for that image. In such case, use
> > this option to not update the fstab and use the stock one instead.
> >
> > This option allows to specify which partitions get the fstab updated
> > and which get the stock fstab.
> >
> > The option matches the argument you can pass to wic itself where the
> > same action is performed but for all the partitions.
> >
> > Example:
> >     part /export --source rootfs --rootfs-dir=hockeycam-image --fstype=ext4
> > --label export --align 1024 --no-fstab-update
> >
> >     part / --source rootfs --fstype=ext4 --label rootfs --align 1024
> >
> > Signed-off-by: Daniel Gomez <daniel@qtec.com>
> > ---
> >  scripts/lib/wic/help.py      | 3 +++
> >  scripts/lib/wic/ksparser.py  | 1 +
> >  scripts/lib/wic/partition.py | 5 +++--
> >  3 files changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> > index 991e5094bb..5c3d278d4e 100644
> > --- a/scripts/lib/wic/help.py
> > +++ b/scripts/lib/wic/help.py
> > @@ -991,6 +991,9 @@ DESCRIPTION
> >                               multiple partitions and we want to keep the right
> >                               permissions and usernames in all the partitions.
> >
> > +         --no-fstab-update: This option is specific to wic. It does not update the
> > +                            '/etc/fstab' stock file for the given partition.
> > +
> >           --extra-space: This option is specific to wic. It adds extra
> >                          space after the space filled by the content
> >                          of the partition. The final size can go
> > diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> > index 7a4cc83af5..0df9eb0d05 100644
> > --- a/scripts/lib/wic/ksparser.py
> > +++ b/scripts/lib/wic/ksparser.py
> > @@ -185,6 +185,7 @@ class KickStart():
> >          part.add_argument('--use-uuid', action='store_true')
> >          part.add_argument('--uuid')
> >          part.add_argument('--fsuuid')
> > +        part.add_argument('--no-fstab-update', action='store_true')
> >
> >          bootloader = subparsers.add_parser('bootloader')
> >          bootloader.add_argument('--append')
> > diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> > index e0b2c5bdf2..ab304f1b2a 100644
> > --- a/scripts/lib/wic/partition.py
> > +++ b/scripts/lib/wic/partition.py
> > @@ -54,6 +54,7 @@ class Partition():
> >          self.uuid = args.uuid
> >          self.fsuuid = args.fsuuid
> >          self.type = args.type
> > +        self.no_fstab_update = args.no_fstab_update
> >          self.updated_fstab_path = None
> >          self.has_fstab = False
> >          self.update_fstab_in_rootfs = False
> > @@ -286,7 +287,7 @@ class Partition():
> >              (self.fstype, extraopts, rootfs, label_str, self.fsuuid, rootfs_dir)
> >          exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
> >
> > -        if self.updated_fstab_path and self.has_fstab:
> > +        if self.updated_fstab_path and self.has_fstab and not self.no_fstab_update:
> >              debugfs_script_path = os.path.join(cr_workdir, "debugfs_script")
> >              with open(debugfs_script_path, "w") as f:
> >                  f.write("cd etc\n")
> > @@ -350,7 +351,7 @@ class Partition():
> >          mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, rootfs_dir)
> >          exec_native_cmd(mcopy_cmd, native_sysroot)
> >
> > -        if self.updated_fstab_path and self.has_fstab:
> > +        if self.updated_fstab_path and self.has_fstab and not self.no_fstab_update:
> >              mcopy_cmd = "mcopy -i %s %s ::/etc/fstab" % (rootfs, self.updated_fstab_path)
> >              exec_native_cmd(mcopy_cmd, native_sysroot)
> >
>
> This looks like the right approach. However, you're still missing the
> handling for filesystems other than ext2/3/4 & msdos. See
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/scripts/lib/wic/plugins/source/rootfs.py#n218
> and grep to see if there are any other uses of updated_fstab_path.

Thanks for your quick reply. Sorry, I wasn't sure about that part of
the code so thanks for mentioning it again.
There is this line:

        install_cmd = "install -m 0644 %s %s" %
(part.updated_fstab_path, fstab_path)

Which is always replace/updated (for msdos/ext2/3/4) in partition.py with:

        if self.updated_fstab_path and self.has_fstab and not
self.no_fstab_update

I will then include the  'no_fstab_update' partition option inside
rootfs.py so we make sure the partition for the rest of the formats
won't get the fstab updated file.

I'll send a v2 patch.

>
> Thanks,
>
> --
> Paul Barker
> https://pbarker.dev/
