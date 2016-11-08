Return-Path: <nathan@nathanrossi.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id A7CF76067D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 11:15:42 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id h201so13524199qke.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 03:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UrXPWKwsfx8lOQYuRucI5AB+iMljMDFOsbzBKfbWVsQ=;
	b=fJ7j+rPXxVnxSFehbRif2RYxB1Hoh/62l9LWjBiI/X13aP0RBEm/psbNtgybt7+brq
	TLpMhmAhJ3y1H+J+WGLI1l0cC9IKsoh5yfjTknx0coQ9ERPoKWmtCCeD8yXu67G79D7N
	ccXaFJOc2piaFn/Xf2H6JcXYAP/gtuZt56wqF8VY0Z4CxeoJtxbtMQMdCNP/2knN2ENt
	9MIx8Qaa++ptKAPESE5kmXFxm2ahlh7heY8uWNjDoXmAt10DTwk9PLo1lq9jCpVrxuJO
	dzXY6QQO+HEKF6F22Ry1V67Mk1JD+riY+z/vFPhU1WyzM8I+U5K60dhNpRBdSVc7k/q/
	5Phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UrXPWKwsfx8lOQYuRucI5AB+iMljMDFOsbzBKfbWVsQ=;
	b=h36qgVyd6eV9kcBWAcLzTknf648KIUNu7FTfnsna9webAJzn5fmTq0m75EQhnJj1c2
	5lvnXQ/KE6QuGUh/FcTPlSMfEfTNOAl3EBU7uqWc4o17XJjcG8IyLfdQJkL9UGSSdigU
	4kZ0AEnAqcUeQPbPfQdx9S6cro+7BIsUHVcCNhXlrnn/zdcFDAjsbdSVBUspmOrghsWM
	XDCFOuxs3t1cFcddhQyQnO7wuCY9Wg5Nbe1tB7ZvziHSYtY/Mk3b0+oWXLsIv4dv9D1K
	5Ohm0nhRBYoEdkt6O93liifqDpG6TQPKzDqvGuGOQIWk0TbZLN5IXdM0nCy3MU2Mv/rP
	9fHA==
X-Gm-Message-State: ABUngvdmXcfJ3aPnEDJQrLTWYo8c5SB/C0e51pL8Hohfcq0VPC5TFh6Wmn+ehzbzR449VzKP34cufIbRCXq0Kg==
X-Received: by 10.55.75.17 with SMTP id y17mr11755469qka.26.1478603744036;
	Tue, 08 Nov 2016 03:15:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.140.134 with HTTP; Tue, 8 Nov 2016 03:15:43 -0800 (PST)
In-Reply-To: <1478132237-28350-3-git-send-email-alistair.francis@xilinx.com>
References: <1478132237-28350-1-git-send-email-alistair.francis@xilinx.com>
	<1478132237-28350-3-git-send-email-alistair.francis@xilinx.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Tue, 8 Nov 2016 21:15:43 +1000
Message-ID: <CA+aJhH2_HGwTCuOy8ahGpygxXWBJLLOb6O6Cao9scvUAWYrFbw@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] runqemu: Allow the user to specity no kernel or rootFS
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
X-List-Received-Date: Tue, 08 Nov 2016 11:15:43 -0000
Content-Type: text/plain; charset=UTF-8

On 3 November 2016 at 10:17, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> In some cirsumstances the user doesn't want to supply a kernel, rootFS
> or DTB to QEMU. This will occur more now that QEMU supports loading
> images using a '-device loader' method.
>
> Allow users to specify 'none' for QB_DEFAULT_FSTYPE or QB_DEFAULT_KERNEL
> to avoid supplying these options to QEMU.

Just wondering if it would be worth adding a "QB_KERNEL_OPT" similar
to how QB_ROOTFS_OPT works. This way the "none" would not be needed
and it would allow for using the "-device loader" arg for machines
that boot that way.

e.g.

QB_KERNEL_OPT = "-kernel @KERNEL@"
or
QB_KERNEL_OPT = "-device loader,addr=0xdeadbeef,file=@KERNEL@"
or (if not able to load kernel, aka 'none')
QB_KERNEL_OPT = ""

Regards,
Nathan

>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>  scripts/runqemu | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 922ebaf..5f60312 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -453,7 +453,7 @@ class BaseConfig(object):
>      def check_rootfs(self):
>          """Check and set rootfs"""
>
> -        if self.fstype == 'nfs':
> +        if self.fstype == 'nfs' or self.fstype == "none":
>              return
>
>          if self.rootfs and not os.path.exists(self.rootfs):
> @@ -481,6 +481,10 @@ class BaseConfig(object):
>          # QB_DEFAULT_KERNEL is always a full file path
>          kernel_name = os.path.basename(self.get('QB_DEFAULT_KERNEL'))
>
> +        # The user didn't want a kernel to be loaded
> +        if kernel_name == "none":
> +            return
> +
>          deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
>          if not self.kernel:
>              kernel_match_name = "%s/%s" % (deploy_dir_image, kernel_name)
> @@ -857,6 +861,9 @@ class BaseConfig(object):
>              k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server, self.nfs_dir, self.unfs_opts)
>              self.kernel_cmdline = 'root=%s rw highres=off' % k_root
>
> +        if self.fstype == 'none':
> +            self.rootfs_options = ''
> +
>          self.set('ROOTFS_OPTIONS', self.rootfs_options)
>
>      def guess_qb_system(self):
> --
> 2.7.4
>

