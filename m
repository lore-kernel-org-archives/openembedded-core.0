Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6724D611D6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 12:26:35 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id f10so5836350ljn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2020 04:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PxqkTSKjWmbVGt0QlnR6jz2foRrThK20pvha8W63ahM=;
	b=aaiJUDzmwn+JkkwUB8vRV5BQ1CqSAxXtKIEs+vauHnIfkKtgj/hiWD4IirF1ycGtgx
	X2LDWa0VGwrkE9vxeJFmwiXTUaH3C6CBFbxdFRWB5L8cQn12grCJf8G74imPdXCgEzQZ
	PaorxTnM3STJv1XF+Cug4e6a3SPzLgCAIHJ/vKXfoWRAF9xsSmblTytXvSSyoaVHMZd7
	d6/O6bvD9wDw191oCf4PZG6xVd2yvDzRxp84gQAtEm4xpUCyOQBTQLkXNL8ixWtZoIyh
	ppuSMm1BQcjyIzFDCkfbO9Kmvbq065+p/Eb+X8eGlT9vLeEEGTMrIb177u36c0ZIoBsU
	ZqnA==
X-Gm-Message-State: ANhLgQ3EFWKDq5fY0iNvbcPq4zumB5yThBbpwqYcaPY3nP7PtPm1iy8S
	wVQZtL6T8o1BcBPvq8drswammdGHytQzSPK6TW0=
X-Google-Smtp-Source: ADFU+vsEBJ3849kYTHcYJjwgL5D2RaFV9NdkhjCK51WxvGEMyXTGFFaT6HbUmriCxubdABbjGZPYELsmeDmlzcpNNqE=
X-Received: by 2002:a05:651c:236:: with SMTP id
	z22mr5131399ljn.239.1583411195683; 
	Thu, 05 Mar 2020 04:26:35 -0800 (PST)
MIME-Version: 1.0
References: <20200304144936.2559106-1-ricardo@ribalda.com>
	<20200304144936.2559106-2-ricardo@ribalda.com>
	<20200305093329.1eed6cdd@ub1910>
In-Reply-To: <20200305093329.1eed6cdd@ub1910>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Date: Thu, 5 Mar 2020 13:26:19 +0100
Message-ID: <CAPybu_0tE=pUhJjee7g=vPsmKxYiLSaFTbN25GRxw56DCkmULw@mail.gmail.com>
To: Paul Barker <pbarker@konsulko.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] wic: Add --embed-rootfs argument
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Mar 2020 12:26:35 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Thu, Mar 5, 2020 at 10:37 AM Paul Barker <pbarker@konsulko.com> wrote:
>
> On Wed,  4 Mar 2020 15:49:36 +0100
> Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:
>
> > This option adds the content of a rootfs on a specific location on the
> > rootfs.
> >
> > It is very useful for making a partition that contains the rootfs for a
> > host and a target Eg:
> >
> > / -> Roofs for the host
> > /export/ -> Rootfs for the target (which will netboot)
> >
> > Although today we support making a partition for "/export" this might
> > not be compatible with some upgrade systems, or we might be limited by
> > the number of partitions.
> >
> > With this patch we can use something like:
> >
> > part / --source rootfs --embed-rootfs target-image /export --embed-rootfs target-image2 /export2
>
> I like this but it still leaves confusion between `--include-path` and
> --embed-rootfs` as they're similar but slightly different. Can we just modify
> `--include-path` to have this syntax?

I think they are different enough.

- include-path ads a file/folder
- embed-rootfs adds a rootfs, which is either a folder or a image.bb file.


>
> >
> > on the .wks file.
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > ---
> >  scripts/lib/wic/help.py                  |  8 ++++++++
> >  scripts/lib/wic/ksparser.py              |  1 +
> >  scripts/lib/wic/partition.py             |  1 +
> >  scripts/lib/wic/plugins/source/rootfs.py | 22 +++++++++++++++++++++-
> >  4 files changed, 31 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> > index 4d342fcf05..140dc504cd 100644
> > --- a/scripts/lib/wic/help.py
> > +++ b/scripts/lib/wic/help.py
> > @@ -979,6 +979,14 @@ DESCRIPTION
> >                           copies. This option only has an effect with the rootfs
> >                           source plugin.
> >
> > +         --embed-rootfs: This option is specific to wic. It embeds a rootfs into
> > +                         the given path to the resulting image. The option
> > +                         contains two fields, the roofs and the path, separated
> > +                         by a space. The rootfs follows the same logic as the
> > +                         rootfs-dir argument. Multiple options can be provided
> > +                         in order to embed multiple rootfs. This option only has
> > +                         an effect with the rootfs source plugin.
> > +
> >           --extra-space: This option is specific to wic. It adds extra
> >                          space after the space filled by the content
> >                          of the partition. The final size can go
> > diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> > index 650b976223..64c8c1175e 100644
> > --- a/scripts/lib/wic/ksparser.py
> > +++ b/scripts/lib/wic/ksparser.py
> > @@ -138,6 +138,7 @@ class KickStart():
> >          part.add_argument('--align', type=int)
> >          part.add_argument('--exclude-path', nargs='+')
> >          part.add_argument('--include-path', nargs='+')
> > +        part.add_argument('--embed-rootfs', nargs=2, action='append')
> >          part.add_argument("--extra-space", type=sizetype)
> >          part.add_argument('--fsoptions', dest='fsopts')
> >          part.add_argument('--fstype', default='vfat',
> > diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> > index 2d95f78439..13857df82f 100644
> > --- a/scripts/lib/wic/partition.py
> > +++ b/scripts/lib/wic/partition.py
> > @@ -31,6 +31,7 @@ class Partition():
> >          self.extra_space = args.extra_space
> >          self.exclude_path = args.exclude_path
> >          self.include_path = args.include_path
> > +        self.embed_rootfs = args.embed_rootfs
> >          self.fsopts = args.fsopts
> >          self.fstype = args.fstype
> >          self.label = args.label
> > diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
> > index 40419a64b3..089aaea477 100644
> > --- a/scripts/lib/wic/plugins/source/rootfs.py
> > +++ b/scripts/lib/wic/plugins/source/rootfs.py
> > @@ -17,6 +17,7 @@ import shutil
> >  import sys
> >
> >  from oe.path import copyhardlinktree, copytree
> > +from pathlib import Path
> >
> >  from wic import WicError
> >  from wic.pluginbase import SourcePlugin
> > @@ -80,7 +81,7 @@ class RootfsPlugin(SourcePlugin):
> >
> >          new_rootfs = None
> >          # Handle excluded paths.
> > -        if part.exclude_path or part.include_path:
> > +        if part.exclude_path or part.include_path or part.embed_rootfs:
> >              # We need a new rootfs directory we can delete files from. Copy to
> >              # workdir.
> >              new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
> > @@ -100,6 +101,25 @@ class RootfsPlugin(SourcePlugin):
> >              for path in part.include_path or []:
> >                  copyhardlinktree(path, new_rootfs)
> >
> > +            for embed in part.embed_rootfs or []:
> > +                [embed_rootfs, path] = embed
> > +                #we need to remove the initial / for os.path.join to work
> > +                if os.path.isabs(path):
> > +                    path = path[1:]
> > +                if embed_rootfs in krootfs_dir:
> > +                    embed_rootfs = krootfs_dir[embed_rootfs]
> > +                embed_rootfs = cls.__get_rootfs_dir(embed_rootfs)
> > +                tar_file = os.path.realpath(os.path.join(cr_workdir, "aux.tar"))
> > +                tar_cmd = "%s tar cpf %s -C %s ." % (cls.__get_pseudo(native_sysroot,
> > +                                                     embed_rootfs), tar_file, embed_rootfs)
> > +                exec_native_cmd(tar_cmd, native_sysroot)
> > +                untar_cmd = "%s tar xf %s -C %s ." % (cls.__get_pseudo(native_sysroot, new_rootfs),
> > +                                                      tar_file, os.path.join(new_rootfs, path))
> > +                Path(os.path.join(new_rootfs, path)).mkdir(parents=True, exist_ok=True)
> > +                exec_native_cmd(untar_cmd, native_sysroot,
> > +                                cls.__get_pseudo(native_sysroot, new_rootfs))
> > +                os.remove(tar_file)
> > +
> >              for orig_path in part.exclude_path or []:
> >                  path = orig_path
> >                  if os.path.isabs(path):
>
> As said in my other email, if you're running wic outside bitbake I'm not sure
> you can guarantee pseudo is available. And now I think about it, if you're
> running wic inside bitbake (as part of do_image_wic), you'd be running pseudo
> under pseudo and I have no idea how that would work out.
>

pseudo is warranted because wic launches "bitbake wic-tools", which
has as DEPENDS pseudo-native.

scripts/wic:        subprocess.check_call(["bitbake", "wic-tools"])


I have tried to run it inside bitbake with --exclude-path and
everything seems to work fine.



> --
> Paul Barker
> Konsulko Group



-- 
Ricardo Ribalda

