Return-Path: <pbarker@konsulko.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id F3D776002A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 09:37:07 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 6so5413706wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2020 01:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=iMcKa2rlHU5urKe8cdM1b9n9Q6kcyfxzKDwArb6oyf8=;
	b=sPzzLlyRtBJt2RWW93OG3fK4rX+dy8AdsjNIXS+OwisxDFWBdpNgs6agN2t6/q3AIn
	9xo38MNptH7XLUGgWj+b2BYxcrI9cY6ilNBHZWeEm3mpLNqd4ld5RK0jLt6EnyAKnFb4
	iFYPKrerQq6niLdEsUfGXq+FeJVPdjqfqvruU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=iMcKa2rlHU5urKe8cdM1b9n9Q6kcyfxzKDwArb6oyf8=;
	b=QYRewcONhSqo5f5DgxI4EkCGd25rfFHp1AzKbCdaDTV8AJ37CXYDdCcZbEIcNUPtg9
	vYlj7UK+5JC07CPvn5NZF6PnFhPVPOYGVeSo1Y9of5wTE3pXPnKKY43gcgcRiWn/htVs
	6QbyQ7iYBE6blwXRcnnSPiAWf5ig7h+sqkKChyk4J/59HS/cQ6RHEhWPyPOtZva9o14x
	gVWSxUkXaXX29fdqByGGu0ovFy/b/LBBUOBThXK0C2HC9bJulVDsxiDrIDZuu9yjNGHe
	P1Nd27QLDFdXUpivkG3sK6cV1zbUJHOd89WtfMTj/Ajuu4XB4O+2SOn98zZ3SN1YhcNx
	Hegw==
X-Gm-Message-State: ANhLgQ0ckNWLBsOe0u1DdcCyYsGLNqC8DH63pAUt8LQ2BQF7o67D6q2V
	MCd1VmSH2PKNeX4CGgV4/be5Hg==
X-Google-Smtp-Source: ADFU+vuFEfZJC3Fw9ZZzUKWonvP4DzXa3RSvZUQanNvuWpz/OZCgKXSpGta70a58Ebbr5WM5QRaVZA==
X-Received: by 2002:a05:600c:2255:: with SMTP id
	a21mr4322927wmm.91.1583401028588; 
	Thu, 05 Mar 2020 01:37:08 -0800 (PST)
Received: from ub1910 ([213.48.11.149])
	by smtp.gmail.com with ESMTPSA id b13sm8837081wme.2.2020.03.05.01.37.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Mar 2020 01:37:08 -0800 (PST)
Date: Thu, 5 Mar 2020 09:33:29 +0000
From: Paul Barker <pbarker@konsulko.com>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Message-ID: <20200305093329.1eed6cdd@ub1910>
In-Reply-To: <20200304144936.2559106-2-ricardo@ribalda.com>
References: <20200304144936.2559106-1-ricardo@ribalda.com>
	<20200304144936.2559106-2-ricardo@ribalda.com>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 05 Mar 2020 09:37:08 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  4 Mar 2020 15:49:36 +0100
Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:

> This option adds the content of a rootfs on a specific location on the
> rootfs.
> 
> It is very useful for making a partition that contains the rootfs for a
> host and a target Eg:
> 
> / -> Roofs for the host
> /export/ -> Rootfs for the target (which will netboot)
> 
> Although today we support making a partition for "/export" this might
> not be compatible with some upgrade systems, or we might be limited by
> the number of partitions.
> 
> With this patch we can use something like:
> 
> part / --source rootfs --embed-rootfs target-image /export --embed-rootfs target-image2 /export2

I like this but it still leaves confusion between `--include-path` and
--embed-rootfs` as they're similar but slightly different. Can we just modify
`--include-path` to have this syntax?

> 
> on the .wks file.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> ---
>  scripts/lib/wic/help.py                  |  8 ++++++++
>  scripts/lib/wic/ksparser.py              |  1 +
>  scripts/lib/wic/partition.py             |  1 +
>  scripts/lib/wic/plugins/source/rootfs.py | 22 +++++++++++++++++++++-
>  4 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> index 4d342fcf05..140dc504cd 100644
> --- a/scripts/lib/wic/help.py
> +++ b/scripts/lib/wic/help.py
> @@ -979,6 +979,14 @@ DESCRIPTION
>                           copies. This option only has an effect with the rootfs
>                           source plugin.
>  
> +         --embed-rootfs: This option is specific to wic. It embeds a rootfs into
> +                         the given path to the resulting image. The option
> +                         contains two fields, the roofs and the path, separated
> +                         by a space. The rootfs follows the same logic as the
> +                         rootfs-dir argument. Multiple options can be provided
> +                         in order to embed multiple rootfs. This option only has
> +                         an effect with the rootfs source plugin.
> +
>           --extra-space: This option is specific to wic. It adds extra
>                          space after the space filled by the content
>                          of the partition. The final size can go
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 650b976223..64c8c1175e 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -138,6 +138,7 @@ class KickStart():
>          part.add_argument('--align', type=int)
>          part.add_argument('--exclude-path', nargs='+')
>          part.add_argument('--include-path', nargs='+')
> +        part.add_argument('--embed-rootfs', nargs=2, action='append')
>          part.add_argument("--extra-space", type=sizetype)
>          part.add_argument('--fsoptions', dest='fsopts')
>          part.add_argument('--fstype', default='vfat',
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index 2d95f78439..13857df82f 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -31,6 +31,7 @@ class Partition():
>          self.extra_space = args.extra_space
>          self.exclude_path = args.exclude_path
>          self.include_path = args.include_path
> +        self.embed_rootfs = args.embed_rootfs
>          self.fsopts = args.fsopts
>          self.fstype = args.fstype
>          self.label = args.label
> diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
> index 40419a64b3..089aaea477 100644
> --- a/scripts/lib/wic/plugins/source/rootfs.py
> +++ b/scripts/lib/wic/plugins/source/rootfs.py
> @@ -17,6 +17,7 @@ import shutil
>  import sys
>  
>  from oe.path import copyhardlinktree, copytree
> +from pathlib import Path
>  
>  from wic import WicError
>  from wic.pluginbase import SourcePlugin
> @@ -80,7 +81,7 @@ class RootfsPlugin(SourcePlugin):
>  
>          new_rootfs = None
>          # Handle excluded paths.
> -        if part.exclude_path or part.include_path:
> +        if part.exclude_path or part.include_path or part.embed_rootfs:
>              # We need a new rootfs directory we can delete files from. Copy to
>              # workdir.
>              new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
> @@ -100,6 +101,25 @@ class RootfsPlugin(SourcePlugin):
>              for path in part.include_path or []:
>                  copyhardlinktree(path, new_rootfs)
>  
> +            for embed in part.embed_rootfs or []:
> +                [embed_rootfs, path] = embed
> +                #we need to remove the initial / for os.path.join to work
> +                if os.path.isabs(path):
> +                    path = path[1:]
> +                if embed_rootfs in krootfs_dir:
> +                    embed_rootfs = krootfs_dir[embed_rootfs]
> +                embed_rootfs = cls.__get_rootfs_dir(embed_rootfs)
> +                tar_file = os.path.realpath(os.path.join(cr_workdir, "aux.tar"))
> +                tar_cmd = "%s tar cpf %s -C %s ." % (cls.__get_pseudo(native_sysroot,
> +                                                     embed_rootfs), tar_file, embed_rootfs)
> +                exec_native_cmd(tar_cmd, native_sysroot)
> +                untar_cmd = "%s tar xf %s -C %s ." % (cls.__get_pseudo(native_sysroot, new_rootfs),
> +                                                      tar_file, os.path.join(new_rootfs, path))
> +                Path(os.path.join(new_rootfs, path)).mkdir(parents=True, exist_ok=True)
> +                exec_native_cmd(untar_cmd, native_sysroot,
> +                                cls.__get_pseudo(native_sysroot, new_rootfs))
> +                os.remove(tar_file)
> +
>              for orig_path in part.exclude_path or []:
>                  path = orig_path
>                  if os.path.isabs(path):

As said in my other email, if you're running wic outside bitbake I'm not sure
you can guarantee pseudo is available. And now I think about it, if you're
running wic inside bitbake (as part of do_image_wic), you'd be running pseudo
under pseudo and I have no idea how that would work out.

-- 
Paul Barker
Konsulko Group

