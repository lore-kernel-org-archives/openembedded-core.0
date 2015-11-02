Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8D80760125
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Nov 2015 21:31:27 +0000 (UTC)
Received: by iodd200 with SMTP id d200so253429iod.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Nov 2015 13:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jcGcl8AukZeckxI/kxcK4g2Iqvex0tKdLKqGmsSga/k=;
	b=jNJzLhqVZX3sOzLjArPpH84w6qt8546Eksvw/0I9DkAs6NsVz2OtTiOYPdrJOVJeWd
	qAWtNaxNV+bfPU6mvxNxKEHNPs2zynQdjKosSs1JPwT+7q01tIg9PCqFFkqwPPkTVR0c
	bG+Tmc45Tu965VvdFv2axdTk37YAcVQpf+LSkIoNDutJ1WFjs8arwRDckKTH2e26FPDr
	r7pKA9CIbysZqYcmCcyqvmgVoygnrFGu43VmXUxlBDySp4iiGhGX5d1FvcgTp9nu4KuF
	kWvX0dW+qYPZz0q32AIHbI8NYwOpXfqY2bG0ishSvNAeQ2W+tMq5Y0RQYntvFddlNPNu
	vsYQ==
X-Received: by 10.107.4.3 with SMTP id 3mr6136000ioe.195.1446499887533; Mon,
	02 Nov 2015 13:31:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Mon, 2 Nov 2015 13:30:58 -0800 (PST)
In-Reply-To: <1446445418-31492-1-git-send-email-jian.liu@windriver.com>
References: <1446445418-31492-1-git-send-email-jian.liu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Nov 2015 13:30:58 -0800
Message-ID: <CAMKF1sqBfdSMphfZJ_O3nEd3cMA7A=5tKa2Xu0wGUsSr-HtuNg@mail.gmail.com>
To: Jian Liu <jian.liu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] archiver.bbclass: do checkout for kernel
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
X-List-Received-Date: Mon, 02 Nov 2015 21:31:27 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Nov 1, 2015 at 10:23 PM, Jian Liu <jian.liu@windriver.com> wrote:
> The repo of kernel is bare git repository and we need to checkout to get
> the source code.

it should be linux-yocto I think, or do we have all kernels as bare git repos ?

>
> Signed-off-by: Jian Liu <jian.liu@windriver.com>
>
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index 41a552c..7387fbf 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -66,6 +66,11 @@ python () {
>      ar_recipe = d.getVarFlag('ARCHIVER_MODE', 'recipe', True)
>
>      if ar_src == "original":
> +        # For kernel, it is bare repo, we need to checkout
> +        if bb.data.inherits_class('kernel-yocto', d):
> +            bb.build.addtask('do_ar_original', 'do_kernel_metadata', 'do_validate_branches', d)
> +        else:
> +            bb.build.addtask('do_ar_original', None, 'do_unpack', d)
>          d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_original' % pn)
>      elif ar_src == "patched":
>          d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_patched' % pn)
> @@ -113,6 +118,12 @@ python do_ar_original() {
>
>      ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
>      bb.note('Archiving the original source...')
> +    # For kernel, the source code is shared
> +    if bb.data.inherits_class('kernel-yocto', d):

is this linux-yocto specific

> +        srcdir = d.getVar('S', True)
> +        create_tarball(d, srcdir, 'original', ar_outdir)
> +        return
> +
>      fetch = bb.fetch2.Fetch([], d)
>      for url in fetch.urls:
>          local = fetch.localpath(url).rstrip("/");
> @@ -346,7 +357,6 @@ python do_deploy_archives_setscene () {
>  do_deploy_archives[sstate-inputdirs] = "${ARCHIVER_TOPDIR}"
>  do_deploy_archives[sstate-outputdirs] = "${DEPLOY_DIR_SRC}"
>
> -addtask do_ar_original after do_unpack
>  addtask do_ar_patched after do_unpack_and_patch
>  addtask do_ar_configured after do_unpack_and_patch
>  addtask do_dumpdata
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

