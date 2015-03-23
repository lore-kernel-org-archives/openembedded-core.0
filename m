Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 21A506AC33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 20:51:59 +0000 (UTC)
Received: by labto5 with SMTP id to5so36524506lab.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 13:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=qM0BlMtRbZO/ZmYiridtAvu+fFR3jLl8UK7OOtwbBys=;
	b=agUgyOJFT9uUDNEAUetJa9VMi2gitKyvbq8+mlhPHClYf3BFo8uDyH78bXRLY8Cz8O
	MFX/o3dc3ZiTaddyd6+BIHu1nx8xwrMdm67+Jp4IjDdXdCZ4YCd39hz939JAkyxDr1tG
	yu/AzEXM4ivXt3xpnvzXuFYYVkmNs6CDRYhb2RBaG2MRy8nhSdwgnXaanvoWxdxWPg7c
	fhR0i8UTv1iMvXEExlgdHV6ZZiLFF3wZ8yYu41G1QqjaeTlPamZ6mk2n3Vfew68dsnn/
	Ctd8dVsBSIaPiqbQ4fuGLeT0JyKqMzjBkjeNAKkC9ROVFR1bclY0IDnBHy+vj4kn0LVg
	sx8A==
MIME-Version: 1.0
X-Received: by 10.152.179.42 with SMTP id dd10mr854378lac.122.1427143919080;
	Mon, 23 Mar 2015 13:51:59 -0700 (PDT)
Received: by 10.112.170.70 with HTTP; Mon, 23 Mar 2015 13:51:58 -0700 (PDT)
In-Reply-To: <1427125146-4871-1-git-send-email-obi@opendreambox.org>
References: <1427125146-4871-1-git-send-email-obi@opendreambox.org>
Date: Mon, 23 Mar 2015 16:51:58 -0400
Message-ID: <CADkTA4MS10SSdxRibMSmUJbrBRGWwgmnk0COEwj_yUkjN8Howw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-module-split.bbclass: fix autoloading from postinst script
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
X-List-Received-Date: Mon, 23 Mar 2015 20:52:00 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 23, 2015 at 11:39 AM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> When using KERNEL_MODULE_AUTOLOAD, autoload was empty, causing
> "modprobe None" to get appended to the postinst script.

I stared at this a bit and it looks right to me, but let me ask a
question. Are you saying
that KERNEL_MODULE_AUTOLOAD isn't working for anyone ? Or just in a specific
configuration ?

I don't have a build to check this at the moment, but I swear my
autoloads were working!

Bruce

>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta/classes/kernel-module-split.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
> index 68a23f8..e1a70e6 100644
> --- a/meta/classes/kernel-module-split.bbclass
> +++ b/meta/classes/kernel-module-split.bbclass
> @@ -148,7 +148,7 @@ python split_kernel_module_packages () {
>              postinst = d.getVar('pkg_postinst_%s' % pkg, True)
>              if not postinst:
>                  bb.fatal("pkg_postinst_%s not defined" % pkg)
> -            postinst += d.getVar('autoload_postinst_fragment', True) % autoload
> +            postinst += d.getVar('autoload_postinst_fragment', True) % (autoload or basename)
>              d.setVar('pkg_postinst_%s' % pkg, postinst)
>
>          # Write out any modconf fragment
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

