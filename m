Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 93D146D001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 17:41:39 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id ec20so6457541lab.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 09:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=lEVdmqZSFl7GGAqbOzBTKef9R/xeAe4eOvwC7LnlLW0=;
	b=TT3PVftUy+eIPsxiv5Rer9VIasIF3WWze9s4j356wp35eVR7gcoMuzahCiZ5iLttiB
	W8Jv31wJI+PrXTVZotb2I8qAmZpGLFMSGrLTD8rdglaQPWPiQWVZH0D65DLKt8wJO0NT
	NcExnSc45+HzAoO/YcCXcRD+Oc5+tZvKGbhabrgab2rKyF+8LjWIpd15oCZlVGWwVMA6
	+e4mcNMGFLLdg//kmzIbysP9PLhs+uiapnqpsAq0fceIUbnSQ2JFsj6IGUTCJXcJQWRZ
	dhIFcwcQGTMtJ1lz9CdCjLuvkEZZ0kFKd0eNjsWvqD7bCWkYSPZqZowjLAM1/FF9SgES
	m4PQ==
MIME-Version: 1.0
X-Received: by 10.112.168.170 with SMTP id zx10mr18558517lbb.0.1384882900480; 
	Tue, 19 Nov 2013 09:41:40 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Tue, 19 Nov 2013 09:41:40 -0800 (PST)
In-Reply-To: <1384882665-26840-2-git-send-email-mac@mcrowe.com>
References: <20131119173725.GA13018@mcrowe.com>
	<1384882665-26840-1-git-send-email-mac@mcrowe.com>
	<1384882665-26840-2-git-send-email-mac@mcrowe.com>
Date: Tue, 19 Nov 2013 12:41:40 -0500
Message-ID: <CADkTA4MQF4be4RO0vm=a2Rv404M9sjK6ZFE7V0hV_gDBX5hvMQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel.bbclass: Call make with correct variables in kernelscripts_sstate_postinst
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
X-List-Received-Date: Tue, 19 Nov 2013 17:41:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 19, 2013 at 12:37 PM, Mike Crowe <mac@mcrowe.com> wrote:
> Ensure that the environment variable and command line arguments that are
> used when calling make in kernel_do_compile are used in
> kernelscripts_sstate_postinst.

What issue was this causing for you ? The scripts are native, and hence
should just be using the build machines compiler, linker and don't need
the kernel args.

So I'm not convinced that we need this patch, without seeing a tangible
issue that was triggered.

Bruce

>
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  meta/classes/kernel.bbclass |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 2fad6e0..9d922d6 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -304,10 +304,11 @@ do_install[prefuncs] += "package_get_auto_pr"
>
>  SSTATEPOSTINSTFUNCS += "kernelscripts_sstate_postinst"
>  kernelscripts_sstate_postinst () {
> +       unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>         if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]; then
>                 (
>                   cd ${STAGING_KERNEL_DIR}
> -                 oe_runmake scripts
> +                 oe_runmake scripts CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>                 )
>         fi
>  }
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

