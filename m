Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id E62A477AB5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 19:20:20 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id o77so14359053qke.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 12:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+kpjQWTldHTrnJmSbdC0FNgUQDtCjAt7d0qBbEmlbuM=;
	b=Kr19PtzL0sT7sNUP15gDAsP3uHGTRFQ1xAY40COfxGxaDGAC9q1JMYBOEuIo7643Sa
	eyzTfJwuT8bRQW3vs8PPq2EuFa9fOkbUpD4mVEBsuajveGFBCPayE1s0udpo3hdoFLTw
	I149eQHYRhwt8fi4f6tugVPJBMKtMMK1GZc58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+kpjQWTldHTrnJmSbdC0FNgUQDtCjAt7d0qBbEmlbuM=;
	b=es/4e2wl1aD/Of0hN4UbNRlmbxlUH4DGeTQ5exgz/8fQTdS8vqSOKS7jrRQ7eRJXFZ
	zZEPAHzvz5rCfs2Izk84S/ctciR8SWeqlJ1ZRCjHSN3ne0b8jx9Fz7YG3t8HYF5mE75n
	bzFf8Ada/Q0wcg+Q7HiCv7p/nH/XBdCXbCLrae2LOrzA99mtYLhFkjloiNGwSvpaSuFL
	R285RBh/2y01q1bugVc6SbthMigKPuck+QOK8bIRFuoi27NBe7z9CPXJmWQ1bA/PCHrM
	e91MY4lI1oLPbBu2wBNvaTdBdoSP6ph2okvTGmZkrV7+es9QFcSU2Kw3g0jpBC1pgI9c
	l5yg==
X-Gm-Message-State: AHPjjUiWWQOJWYqZJASSSZ/5dsL8UvnjFv5IG70A+z8SQsvGnEACyLfS
	fmTHRi2F9c1FQ8hcIEJ4oCiSgkp7eMZIwRN98wQ7vQ==
X-Google-Smtp-Source: AOwi7QCBiTu0CJxZGTWAf7yx76HKjrwYhTsOTzgOlrkOhUi92YTAyPCTpbMVSv+coPwe9qoOupf+oQ27sUKi/XzXFUY=
X-Received: by 10.55.134.68 with SMTP id i65mr3866770qkd.192.1506540022010;
	Wed, 27 Sep 2017 12:20:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.42.182 with HTTP; Wed, 27 Sep 2017 12:20:01 -0700 (PDT)
In-Reply-To: <20170913193820.11923-1-nicolas.dechesne@linaro.org>
References: <20170913193820.11923-1-nicolas.dechesne@linaro.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 27 Sep 2017 12:20:01 -0700
Message-ID: <CAP71WjzHT4Y5S6CRD9LNvkDfpCzPDuFwFtaD0Bqr3HQVKA8MOg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [morty][PATCH] kernel.bbclass: fix KERNEL_IMAGETYPE(S) for Image.gz
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
X-List-Received-Date: Wed, 27 Sep 2017 19:20:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 13, 2017 at 12:38 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> KERNEL_IMAGETYPES lists all the kernel images that we want to build. in
> cb17b6c2a7 (kernel.bbclass: support kernel image type of vmlinux.gz), some logic
> was added to support vmlinux.gz which is not a target built by kernel
> makefiles (only vmlinux). It is clear that the goal of this logic is only to
> support vmlinux.gz and not others compressed format (such as Image.gz) which are
> valid target for kernel makefiles.
>
> For Image.gz we should rely on the kernel makefiles and not do the compression
> in kernel class.
>
> This patch updates the logic used to filter out non supported kernel target from
> KERNEL_IMAGETYPES, and make vmlinux.gz a 'special case', instead of *.gz. If
> more special cases are needed in the future, we could add them in a similar way.
>
> This patch should be a no-op for anyone using vmlinux or vmlinux.gz, and on top
> of that it is fixing the build for Image.gz which was not working until now.
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit cfc0c897656fe67e81a6a5dcd936dff785529f41)
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---

I noticed that morty was updated very recently, and this patch wasn't
merged. Is there any issue with this patch? We would really need this
fix in morty.


>  meta/classes/kernel.bbclass | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index eefe574a60..f8318b83a1 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -28,7 +28,6 @@ KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION',
>  KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
>
>  python __anonymous () {
> -    import re
>
>      # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
>      type = d.getVar('KERNEL_IMAGETYPE', True) or ""
> @@ -40,7 +39,10 @@ python __anonymous () {
>          types = (alttype + ' ' + types).strip()
>      d.setVar('KERNEL_IMAGETYPES', types)
>
> -    typeformake = re.sub(r'\.gz', '', types)
> +    # some commonly used kernel images aren't generated by the kernel build system, such as vmlinux.gz
> +    # typeformake lists only valid kernel make targets, and post processing can be done after the kernel
> +    # is built (such as using gzip to compress vmlinux)
> +    typeformake = types.replace('vmlinux.gz', 'vmlinux')
>      d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
>
>      for type in types.split():
> @@ -262,14 +264,12 @@ kernel_do_compile() {
>         fi
>         for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
>                 oe_runmake ${typeformake} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
> -               for type in ${KERNEL_IMAGETYPES} ; do
> -                       if test "${typeformake}.gz" = "${type}"; then
> -                               mkdir -p "${KERNEL_OUTPUT_DIR}"
> -                               gzip -9c < "${typeformake}" > "${KERNEL_OUTPUT_DIR}/${type}"
> -                               break;
> -                       fi
> -               done
>         done
> +       # vmlinux.gz is not built by kernel
> +       if (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux\.gz"); then
> +               mkdir -p "${KERNEL_OUTPUT_DIR}"
> +               gzip -9c < ${B}/vmlinux > "${KERNEL_OUTPUT_DIR}/vmlinux.gz"
> +       fi
>  }
>
>  do_compile_kernelmodules() {
> --
> 2.11.0
>

