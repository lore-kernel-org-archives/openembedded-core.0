Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <d42e5eb6544c62527590b3301d8c40c7298c5862.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] wic: bootimg-partition: Add directory copy support to bootimage creation
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 25 Jan 2022 21:30:19 +0000
In-Reply-To: <faaefedf-1ffa-c403-0abe-ab0e00bf27d6@mcbachmann.de>
References: <faaefedf-1ffa-c403-0abe-ab0e00bf27d6@mcbachmann.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Sven Bachmann <dev@mcbachmann.de>, openembedded-core@lists.openembedded.org

On Tue, 2022-01-25 at 21:11 +0100, Sven Bachmann wrote:
> Hi,
> 
> this patch allows to create directories inside the boot partition when using WIC. Without the patch
> the build process will abort with an error when a recipe tries to not only copy files but to also
> create a directory inside the boot partition.
> 
> Recipe content:
> 
>     inherit deploy
>    
>     do_deploy() {
>         install -d ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/mydirectory
>         touch ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/mydirectory/${PN}-${PV}.stamp
>     }
>    
>     addtask deploy before do_build after do_install
>     do_deploy[dirs] += "${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/mydirectory"
> 
> 
> The task do_image_wic will then complain (paths reduced and anonymized):
> 
>     | ERROR: _exec_cmd: install -m 0644 -D
> /my/home/dir/yocto/rpi-build/tmp/deploy/images/raspberrypi4/bootfiles/mydirectory
> /my/home/dir/yocot/rpi-build/tmp/work/raspberrypi4-poky-linux-gnueabi/my-image/1.0-r0/tmp-wic/boot.1/mydirectory
> returned '1' instead of 0
>     | output: install: omitting directory
> '/my/home/dir/yocto/rpi-build/tmp/deploy/images/raspberrypi4/bootfiles/mydirectory'
> 
> 
> As can be seen it uses "install -D" instead of creating the directory with "install -d". This patch
> fixes this.
> 
> Best regards
>   Sven
> 
> 
> 
> From 360775581a573a62032155fc6968175125e9c1db Mon Sep 17 00:00:00 2001
> From: Sven Bachmann <dev@mcbachmann.de>
> Date: Tue, 25 Jan 2022 20:47:17 +0100
> Subject: [PATCH 1/1] wic: bootimg-partition: add directory copy support to bootimage creation
> 
> Signed-off-by: Sven Bachmann <dev@mcbachmann.de>
> ---
>  .../lib/wic/plugins/source/bootimg-partition.py    | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py
> b/scripts/lib/wic/plugins/source/bootimg-partition.py
> index 5dbe2558d2..6348050bd5 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-partition.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
> @@ -184,9 +184,17 @@ class BootimgPartitionPlugin(SourcePlugin):
>          for task in cls.install_task:
>              src_path, dst_path = task
>              logger.debug('Install %s as %s', src_path, dst_path)
> -            install_cmd = "install -m 0644 -D %s %s" \
> -                          % (os.path.join(kernel_dir, src_path),
> -                             os.path.join(hdddir, dst_path))
> +            if os.path.isfile(src_path):
> +                install_cmd = "install -m 0644 -D %s %s" \
> +                              % (os.path.join(kernel_dir, src_path),
> +                                 os.path.join(hdddir, dst_path))
> +            elif os.path.isdir:
> +                install_cmd = "install -m 0755 -d %s" \
> +                              % (os.path.join(hdddir, dst_path))
> +            else:
> +                logger.error("Path is neither file nor directory: %s", src_path)
> +                raise WicError("Type of path unknown, exiting")
> +
>              exec_cmd(install_cmd)
>  
>          logger.debug('Prepare boot partition using rootfs in %s', hdddir)

I'm afraid the patch within the email has been line wrapped and even with that
fixed, the whitespace is corrupted making it hard to apply. I do also wonder if
there are extra tests we should be adding to the test suite to cover this issue
(see "oe-selftest -r wic")?

Cheers,

Richard


