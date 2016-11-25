Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wj0-f181.google.com (mail-wj0-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id AAA3862134
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 12:28:39 +0000 (UTC)
Received: by mail-wj0-f181.google.com with SMTP id xy5so57741305wjc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 04:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wfEWffKxqxeqjvIKbXP8EVw+cx98OBS+Vko6IZc7FeU=;
	b=kHFbNccvqp8XHdHb/415kYkNBO8tMHxZ7K9yeIeZ4Dh9SL8Dbfk00oqYATgkC62AmU
	kJVEAygSFKGRYmH2xf07V7Y/9uhfSdMKPTSHtDzLWByG6aIyQ+PQmfoRRfzK6vDJcW4s
	2uQqYXXIBG6xSeT4aXEAxyEJOjPqYWF8rICdJCbX6vh+C8yUkg44tpH796hZJ/0+lv2v
	srF0uNjU2GvHJRw2VKB+56FlEE8fg7aFnDCdVlWUDbCH1H9OGEP8o9fO/S/UhfCIKI/O
	GLLqewP3vWmbumBlf+MU2XQTFKbvxZFzvq85LRq5uDkDvJic1GdnQyS8LxaQWFYnEgNr
	qdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wfEWffKxqxeqjvIKbXP8EVw+cx98OBS+Vko6IZc7FeU=;
	b=kfxrRlnPi+3arcfwSdAJTzAQbJyExGN+yxPhC/3OiBIRnWn3SLy7LqRHiFqUivGzUh
	1NPGUu/ji8fYSwOxC2jQV64U9hCzJBFapJ6iZjZZgzldNaaiWg3/nTLbBOBJjzB7DfpR
	gf97IPrFMjtuMdyBKh4bqJjr6b4JHWDR0w4tuZ4Wof5Wp3UROVkgocI+/DXrZ4DN0t3I
	E2uJKxv0bYOYBBdPrMp2vzKpnNStjIelJ8AqqqPvbhYKNJfeHp8A4ocvVnZI0a+hJ4Mx
	8Vuaqqow48MHIvnlEqUE8tT26HBuiFTnoVTW5XvCdLK4j5OczeN4MY0u/sF6KLvVUruN
	GFHQ==
X-Gm-Message-State: AKaTC01x//KFpcjlvRM1rDAV83sOZ5dMzknhFR62JzK4Xls9l1utcNmElvnPpu/SxnVowy67LauJ7E4OsMEGTw==
X-Received: by 10.194.148.4 with SMTP id to4mr7243202wjb.194.1480076920765;
	Fri, 25 Nov 2016 04:28:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.10.69 with HTTP; Fri, 25 Nov 2016 04:28:20 -0800 (PST)
In-Reply-To: <1480068955-17053-1-git-send-email-kristian.amlie@mender.io>
References: <1480068955-17053-1-git-send-email-kristian.amlie@mender.io>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Fri, 25 Nov 2016 13:28:20 +0100
Message-ID: <CAD4b0_KP1V77ny5yP+WVJMSVMojVKFQPa-Gq0-4-cne2e19dDQ@mail.gmail.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] wic: Add --exclude-path option to rootfs source plugin.
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
X-List-Received-Date: Fri, 25 Nov 2016 12:28:41 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 25, 2016 at 11:15 AM, Kristian Amlie
<kristian.amlie@mender.io> wrote:
> It will omit the given path from the resulting partition, and if the
> given path ends in a slash, it will only delete the content, and keep
> the directory.
>
> Since mkfs only accepts whole directories as input, we need to copy
> the rootfs directory to the workdir so that we can selectively delete
> files from it.
>
> Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
> ---
>  scripts/lib/wic/help.py                  |  6 ++++
>  scripts/lib/wic/ksparser.py              |  1 +
>  scripts/lib/wic/partition.py             |  1 +
>  scripts/lib/wic/plugins/source/rootfs.py | 51 +++++++++++++++++++++++++++++++-
>  4 files changed, 58 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> index e5347ec..9dab670 100644
> --- a/scripts/lib/wic/help.py
> +++ b/scripts/lib/wic/help.py
> @@ -715,6 +715,12 @@ DESCRIPTION
>                       partition table. It may be useful for
>                       bootloaders.
>
> +         --exclude-path: This option is specific to wic. It excludes the given
> +                         absolute path from the resulting image. If the path
> +                         ends with a slash, only the content of the directory
> +                         is omitted, not the directory itself. This option only
> +                         has an effect with the rootfs source plugin.
> +
>           --extra-space: This option is specific to wic. It adds extra
>                          space after the space filled by the content
>                          of the partition. The final size can go
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 0894e2b..17b97fd0 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -127,6 +127,7 @@ class KickStart():
>          part.add_argument('mountpoint', nargs='?')
>          part.add_argument('--active', action='store_true')
>          part.add_argument('--align', type=int)
> +        part.add_argument('--exclude-path', nargs='+')
>          part.add_argument("--extra-space", type=sizetype, default=10*1024)
>          part.add_argument('--fsoptions', dest='fsopts')
>          part.add_argument('--fstype')
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index ac4c836..cba78a5 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -45,6 +45,7 @@ class Partition():
>          self.align = args.align
>          self.disk = args.disk
>          self.extra_space = args.extra_space
> +        self.exclude_path = args.exclude_path
>          self.fsopts = args.fsopts
>          self.fstype = args.fstype
>          self.label = args.label
> diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
> index 425da8b..d97d99c 100644
> --- a/scripts/lib/wic/plugins/source/rootfs.py
> +++ b/scripts/lib/wic/plugins/source/rootfs.py
> @@ -26,10 +26,11 @@
>  #
>
>  import os
> +import shutil
>
>  from wic import msger
>  from wic.pluginbase import SourcePlugin
> -from wic.utils.oe.misc import get_bitbake_var
> +from wic.utils.oe.misc import get_bitbake_var, exec_cmd
>
>  class RootfsPlugin(SourcePlugin):
>      """
> @@ -78,6 +79,54 @@ class RootfsPlugin(SourcePlugin):
>
>          real_rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
>
> +        # Handle excluded paths.
> +        if part.exclude_path is not None:
> +            # We need a new rootfs directory we can delete files from. Copy to
> +            # workdir.
> +            new_rootfs = os.path.join(cr_workdir, "rootfs")
> +
> +            if os.path.lexists(new_rootfs):
> +                shutil.rmtree(os.path.join(new_rootfs))
> +
> +            if os.stat(real_rootfs_dir).st_dev == os.stat(cr_workdir).st_dev:
> +                # Optimization if both directories are on the same file system:
> +                # copy using hardlinks.
> +                cp_args = "-al"
> +            else:
> +                cp_args = "-a"
> +            exec_cmd("cp %s %s %s" % (cp_args, real_rootfs_dir, new_rootfs))
> +
> +            real_rootfs_dir = new_rootfs
> +
> +            for orig_path in part.exclude_path:
> +                path = orig_path
> +                if not os.path.isabs(path):
> +                    msger.error("Must be absolute: --exclude-path=%s" % orig_path)
> +
> +                while os.path.isabs(path):
> +                    path = path[1:]
> +
> +                # Disallow '..', because doing so could be quite disastrous
> +                # (we will delete the directory).
> +                remaining = path
> +                while True:
> +                    (head, tail) = os.path.split(remaining)
> +                    if tail == '..':
> +                        msger.error("'..' not allowed: --exclude-path=%s" % orig_path)
> +                    elif head == "":
> +                        break
> +                    remaining = head

Why not do this instead?

    if '..' in path:
        msger.error("'..' not allowed: --exclude-path=%s" % orig_path)

> +
> +                full_path = os.path.join(new_rootfs, path)
> +
> +                if path.endswith(os.sep):
> +                    # Delete content only.
> +                    for entry in os.listdir(full_path):
> +                        shutil.rmtree(os.path.join(full_path, entry))
> +                else:
> +                    # Delete whole directory.
> +                    shutil.rmtree(full_path)
> +
>          part.rootfs_dir = real_rootfs_dir
>          part.prepare_rootfs(cr_workdir, oe_builddir, real_rootfs_dir, native_sysroot)
>
> --
> 2.7.4
>



-- 
Maciej Borzecki
RnDity

