Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0B3736F5E1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 18:40:57 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id p9so2035260lbv.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Mar 2014 10:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=g/3NXXvp83oKuJTugORSemWRBfD6DbbmASPDg5nrAgg=;
	b=ZgC7NUCA7qsMTFi227SOOEnP9Xox/Tzf4MJVWg+teUhYgj3g7D2EIP3mpNknzebylX
	yE05Z3XCkG2g20oN5Hs4Sk9Jlr8oKe2ufOjAbOx+ODysR0xaFe03Ml89S2NJKOth6dGY
	RP0mvXAmJsTS1mSEEc/jHzS8CILbwdwVZX+4n+yrQLIkC247df8sYVGwgVjduLOIsEha
	RclHRmHtR8f4zs2V8vW838133024/pmH+cZI8mvPEBzmlP3rWlKrNkn24uLEh7JaNmb4
	BJcyf8UapWOTyQdS4GXK+qHP+Gjp9MT712x+6uliP7cpPMmK8WhprFRuFYpo/f48LH3O
	DfeA==
MIME-Version: 1.0
X-Received: by 10.112.72.40 with SMTP id a8mr778647lbv.68.1394131257163; Thu,
	06 Mar 2014 10:40:57 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Thu, 6 Mar 2014 10:40:57 -0800 (PST)
In-Reply-To: <1394129443-1427-1-git-send-email-kergoth@gmail.com>
References: <1394129443-1427-1-git-send-email-kergoth@gmail.com>
Date: Thu, 6 Mar 2014 13:40:57 -0500
Message-ID: <CADkTA4M96iZh48Hieup38Gwf9DB24PgvKw7Uw0WVtaGLBwByFA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: fix diffconfig/kernel_configme breakage
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
X-List-Received-Date: Thu, 06 Mar 2014 18:40:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 6, 2014 at 1:10 PM, Christopher Larson <kergoth@gmail.com> wrote:
> The bbclass did the following:
>
>     do_diffconfig[depends] += "virtual/kernel:do_kernel_configme"
>
> This clearly introduces a cross-kernel task dependency if the recipe
> inheriting this class isn't the preferred provider of virtual/kernel, which is
> obviously wrong, but further, will break the build if a kernel-yocto based
> kernel is parsed and not skipped, but virtual/kernel refers to
> a non-kernel-yocto recipe, which would not have the do_kernel_configme task.
>
> Work around this by adding the in-recipe task dep programmatically with
> bb.build.addtask when do_diffconfig exists.
>
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index fb8e04e..ef9b9d1 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -263,6 +263,8 @@ do_kernel_configme() {
>         echo "CONFIG_LOCALVERSION="\"${LINUX_VERSION_EXTENSION}\" >> ${B}/.config
>  }
>
> +addtask kernel_configme after do_patch
> +

linux-yocto.inc already has:

addtask kernel_configme before do_configure after do_patch

So we should be able to avoid adding the task to the class, right ? I
suppose the task could move into the class, but it was always a per
recipe include in the past, I just don't want any unintended issues to
happen from the double task add.

>  python do_kernel_configcheck() {
>      import re, string, sys
>
> @@ -407,4 +409,8 @@ OE_TERMINAL_EXPORTS += "GUILT_BASE KBUILD_OUTPUT"
>  GUILT_BASE = "meta"
>  KBUILD_OUTPUT = "${B}"
>
> -do_diffconfig[depends] += "virtual/kernel:do_kernel_configme"
> +python () {
> +    # If diffconfig is available, ensure it runs after kernel_configme
> +    if 'do_diffconfig' in d:
> +        bb.build.addtask('do_diffconfig', None, 'do_kernel_configme', d)
> +}

Thanks for the fixup!

Bruce

> --
> 1.8.3.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

