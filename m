Received: from mail-lb0-f182.google.com ([209.85.217.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1UQkWD-0004fw-Nb
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 22:24:23 +0200
Received: by mail-lb0-f182.google.com with SMTP id z13so2937245lbh.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 13:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=EjA8wb6TyzuP7gReIQ0uq+FarRnnxdjCqW5KQe58eM0=;
	b=ZKzY7nvj38kKQpSnmrAD1X5kcztTxlnERQXk/KTfE050Qb3/Y8UvCvoVl0bxX9u6j6
	R6SN74brcjMO0OtomS8vCyBaLqAeQJSQVZPsamENrwOg558Sjz4ANUYRP5J64VIfyUfy
	iZ3ElllnuF9cl8ha9+cWbvtXDxPUWYmIv8n7AqRmXIQNMUk1fR6IxobmvYmlbKy7Elkh
	hY1S5BuDCkoEG4wf8gERD+7DaW/FxxfRjoI0TGDZ5FLcYxA5WSwerdrnxdBK5VSXcIeV
	s6mIiOZ2JLy/WJEfMXPRXECYyZu5KyUWlScLKTm3uNI9GZ7dP8y1v2w3fq/bGaO6jXn/
	sUzQ==
MIME-Version: 1.0
X-Received: by 10.112.128.231 with SMTP id nr7mr6011675lbb.26.1365797216709;
	Fri, 12 Apr 2013 13:06:56 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Fri, 12 Apr 2013 13:06:56 -0700 (PDT)
In-Reply-To: <1365795733-25014-1-git-send-email-mark.hatle@windriver.com>
References: <1365795733-25014-1-git-send-email-mark.hatle@windriver.com>
Date: Fri, 12 Apr 2013 16:06:56 -0400
Message-ID: <CADkTA4Nxoa2=q8++zuJyoa-eHCYa+Q1bf-r1Eu8z4h4Li7xzOw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] hello-mod: Ensure the produced package name begins with kernel-module-
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Apr 2013 20:24:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Apr 12, 2013 at 3:42 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> The special key kernel-module- is necessary for the system to avoid a package
> rename when installing a multilib image.  For example:
>
> local.conf: IMAGE_INSTALL_append = " hello-mod"
>
> bitbake lib32-core-image-minimal
>
> The system will translate names and prepend 'lib32-', unless the package
> begins with kernel-module-.

Mark and I were talking about this, and since this is something that is required
in a multlib system, and an external module has gone to the trouble of
inheriting
module.bbclass, and we have the kernel-module-split.bbclass, that this
is something
we should be able to programatically do and generate the package names that
meet the expectations of the system.

I suggested a bugzilla and we can tackle this at the front end of the upcoming
dev cycle.

I think that's reasonable, if anyone knows of a reason why this absolutely can't
be done automatically .. or I'm out to lunch, I'm happy to have my
redirect, NAK'd :)

Cheers,

Bruce


>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
> index 64a6dda..621f700 100644
> --- a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
> +++ b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
> @@ -13,3 +13,11 @@ SRC_URI = "file://Makefile \
>            "
>
>  S = "${WORKDIR}"
> +
> +# Kernel module packages MUST begin with 'kernel-module-', otherwise
> +# multilib image generation can fail.
> +#
> +# The following line is only necessary if the recipe name does not begin
> +# with kernel-module-.
> +#
> +PKG_${PN} = "kernel-module-${PN}"
> --
> 1.8.1.2.545.g2f19ada
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


