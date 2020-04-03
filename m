Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web12.4808.1585943591100031174
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 12:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id k21so8261592ljh.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 12:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z9wu96HgGTWbjq47/snG6LvT6ciFGLoMZsj2FR531pc=;
        b=rXGmrD7BHEG2WbEOb7ukQQE39rZQciCfk/sQh0Id57m9zbpCGoqAkQuGyOm0fcVwfI
         Id9W1w8bOI6sKKL+ud3AyUJfdXWce5NCkSQRFpZu9/T2CYGN8IpcmeBIHgJtGzSk25sG
         h85qYIDqGzKMGp6MT+lQ8Zw6mwVhXevraSOk7n5A7TYqwgLR91Qlsgj3FAAmgV3s8ydk
         s8Ugqdh5OWjqgswsrJGmcs9Q8XgAQmdaAPpmZwErzAsJLJzf7jZFK/tmr/++iL7T/Cn2
         0c97bVqkHhtqPbDOr6bpBxhDaLIeROOST5hYyWbXmJs1JcVifKSorhIivGYGWB9H2FT7
         W4Mg==
X-Gm-Message-State: AGi0PuZN0VUP+hVi8Ks/DM0CYLgpDMAIv4R0mL/kFetTVSLSNZwHzCep
	eUy1moqd4kacnFJYfln7Asx73APV0zrfBbzh04I=
X-Google-Smtp-Source: APiQypIAfo0zXWx2juPYHoJkkvVCqrRS8p7yrR96kTfHqOMRXAxBYRwka/xlbzRORGt0snURa2Pgk1fcpxyTmI6YU0k=
X-Received: by 2002:a2e:b04d:: with SMTP id d13mr5884595ljl.278.1585943589140;
 Fri, 03 Apr 2020 12:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200304144936.2559106-1-ricardo@ribalda.com> <20200304144936.2559106-2-ricardo@ribalda.com>
 <20200305093329.1eed6cdd@ub1910> <CAPybu_0tE=pUhJjee7g=vPsmKxYiLSaFTbN25GRxw56DCkmULw@mail.gmail.com>
In-Reply-To: <CAPybu_0tE=pUhJjee7g=vPsmKxYiLSaFTbN25GRxw56DCkmULw@mail.gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Fri, 3 Apr 2020 21:52:52 +0200
Message-ID: <CAPybu_3n3T9BypXoZexhaWWHX0nTQBy=hNkppKiUnvEGuLP8NQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] wic: Add --embed-rootfs argument
To: Paul Barker <pbarker@konsulko.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, jpewhacker@gmail.com
Content-Type: text/plain; charset="UTF-8"

ping?

On Thu, Mar 5, 2020 at 1:26 PM Ricardo Ribalda Delgado
<ricardo@ribalda.com> wrote:
>
> Hi Paul,
>
> On Thu, Mar 5, 2020 at 10:37 AM Paul Barker <pbarker@konsulko.com> wrote:
> >
> > On Wed,  4 Mar 2020 15:49:36 +0100
> > Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:
> >
> > > This option adds the content of a rootfs on a specific location on the
> > > rootfs.
> > >
> > > It is very useful for making a partition that contains the rootfs for a
> > > host and a target Eg:
> > >
> > > / -> Roofs for the host
> > > /export/ -> Rootfs for the target (which will netboot)
> > >
> > > Although today we support making a partition for "/export" this might
> > > not be compatible with some upgrade systems, or we might be limited by
> > > the number of partitions.
> > >
> > > With this patch we can use something like:
> > >
> > > part / --source rootfs --embed-rootfs target-image /export --embed-rootfs target-image2 /export2
> >
> > I like this but it still leaves confusion between `--include-path` and
> > --embed-rootfs` as they're similar but slightly different. Can we just modify
> > `--include-path` to have this syntax?
>
> I think they are different enough.
>
> - include-path ads a file/folder
> - embed-rootfs adds a rootfs, which is either a folder or a image.bb file.
>
>
> >
> > >
> > > on the .wks file.
> > >
> > > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > > ---
> > >  scripts/lib/wic/help.py                  |  8 ++++++++
> > >  scripts/lib/wic/ksparser.py              |  1 +
> > >  scripts/lib/wic/partition.py             |  1 +
> > >  scripts/lib/wic/plugins/source/rootfs.py | 22 +++++++++++++++++++++-
> > >  4 files changed, 31 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> > > index 4d342fcf05..140dc504cd 100644
> > > --- a/scripts/lib/wic/help.py
> > > +++ b/scripts/lib/wic/help.py
> > > @@ -979,6 +979,14 @@ DESCRIPTION
> > >                           copies. This option only has an effect with the rootfs
> > >                           source plugin.
> > >
> > > +         --embed-rootfs: This option is specific to wic. It embeds a rootfs into
> > > +                         the given path to the resulting image. The option
> > > +                         contains two fields, the roofs and the path, separated
> > > +                         by a space. The rootfs follows the same logic as the
> > > +                         rootfs-dir argument. Multiple options can be provided
> > > +                         in order to embed multiple rootfs. This option only has
> > > +                         an effect with the rootfs source plugin.
> > > +
> > >           --extra-space: This option is specific to wic. It adds extra
> > >                          space after the space filled by the content
> > >                          of the partition. The final size can go
> > > diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> > > index 650b976223..64c8c1175e 100644
> > > --- a/scripts/lib/wic/ksparser.py
> > > +++ b/scripts/lib/wic/ksparser.py
> > > @@ -138,6 +138,7 @@ class KickStart():
> > >          part.add_argument('--align', type=int)
> > >          part.add_argument('--exclude-path', nargs='+')
> > >          part.add_argument('--include-path', nargs='+')
> > > +        part.add_argument('--embed-rootfs', nargs=2, action='append')
> > >          part.add_argument("--extra-space", type=sizetype)
> > >          part.add_argument('--fsoptions', dest='fsopts')
> > >          part.add_argument('--fstype', default='vfat',
> > > diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> > > index 2d95f78439..13857df82f 100644
> > > --- a/scripts/lib/wic/partition.py
> > > +++ b/scripts/lib/wic/partition.py
> > > @@ -31,6 +31,7 @@ class Partition():
> > >          self.extra_space = args.extra_space
> > >          self.exclude_path = args.exclude_path
> > >          self.include_path = args.include_path
> > > +        self.embed_rootfs = args.embed_rootfs
> > >          self.fsopts = args.fsopts
> > >          self.fstype = args.fstype
> > >          self.label = args.label
> > > diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
> > > index 40419a64b3..089aaea477 100644
> > > --- a/scripts/lib/wic/plugins/source/rootfs.py
> > > +++ b/scripts/lib/wic/plugins/source/rootfs.py
> > > @@ -17,6 +17,7 @@ import shutil
> > >  import sys
> > >
> > >  from oe.path import copyhardlinktree, copytree
> > > +from pathlib import Path
> > >
> > >  from wic import WicError
> > >  from wic.pluginbase import SourcePlugin
> > > @@ -80,7 +81,7 @@ class RootfsPlugin(SourcePlugin):
> > >
> > >          new_rootfs = None
> > >          # Handle excluded paths.
> > > -        if part.exclude_path or part.include_path:
> > > +        if part.exclude_path or part.include_path or part.embed_rootfs:
> > >              # We need a new rootfs directory we can delete files from. Copy to
> > >              # workdir.
> > >              new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
> > > @@ -100,6 +101,25 @@ class RootfsPlugin(SourcePlugin):
> > >              for path in part.include_path or []:
> > >                  copyhardlinktree(path, new_rootfs)
> > >
> > > +            for embed in part.embed_rootfs or []:
> > > +                [embed_rootfs, path] = embed
> > > +                #we need to remove the initial / for os.path.join to work
> > > +                if os.path.isabs(path):
> > > +                    path = path[1:]
> > > +                if embed_rootfs in krootfs_dir:
> > > +                    embed_rootfs = krootfs_dir[embed_rootfs]
> > > +                embed_rootfs = cls.__get_rootfs_dir(embed_rootfs)
> > > +                tar_file = os.path.realpath(os.path.join(cr_workdir, "aux.tar"))
> > > +                tar_cmd = "%s tar cpf %s -C %s ." % (cls.__get_pseudo(native_sysroot,
> > > +                                                     embed_rootfs), tar_file, embed_rootfs)
> > > +                exec_native_cmd(tar_cmd, native_sysroot)
> > > +                untar_cmd = "%s tar xf %s -C %s ." % (cls.__get_pseudo(native_sysroot, new_rootfs),
> > > +                                                      tar_file, os.path.join(new_rootfs, path))
> > > +                Path(os.path.join(new_rootfs, path)).mkdir(parents=True, exist_ok=True)
> > > +                exec_native_cmd(untar_cmd, native_sysroot,
> > > +                                cls.__get_pseudo(native_sysroot, new_rootfs))
> > > +                os.remove(tar_file)
> > > +
> > >              for orig_path in part.exclude_path or []:
> > >                  path = orig_path
> > >                  if os.path.isabs(path):
> >
> > As said in my other email, if you're running wic outside bitbake I'm not sure
> > you can guarantee pseudo is available. And now I think about it, if you're
> > running wic inside bitbake (as part of do_image_wic), you'd be running pseudo
> > under pseudo and I have no idea how that would work out.
> >
>
> pseudo is warranted because wic launches "bitbake wic-tools", which
> has as DEPENDS pseudo-native.
>
> scripts/wic:        subprocess.check_call(["bitbake", "wic-tools"])
>
>
> I have tried to run it inside bitbake with --exclude-path and
> everything seems to work fine.
>
>
>
> > --
> > Paul Barker
> > Konsulko Group
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
