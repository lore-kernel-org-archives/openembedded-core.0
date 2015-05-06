Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id C301B73F51
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 14:12:45 +0000 (UTC)
Received: by yhrr66 with SMTP id r66so2650831yhr.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 May 2015 07:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Dob68ZJORr1m5ZUCS8jdXKN0+9G5hM8W839l2KzlXiY=;
	b=RFt1A8wpdaeWhox/Vbg2FSOxvOzQkDm+IKQBZZ4IzoqRe8cYrDFKFF4BldL/87ceQd
	9vYuZjfO0PMZZYjz4PKlk7gHASI5esOcgkWLlTRwYpfWIwzLlPreFp9iIi4BFeMwCfwf
	HyXaanUzc1nf7UxEcVKK/OIQGSwXhOuvCL74DQjKyIij0p+gYl4DSaBwAxyFXBIRlAr0
	VTV8JwuzrJA8zpLXL5hNLyAgBcqqlZsep/cOigVVPUBCl+0kUONuk678O6SCbUuuic+F
	5FhKlveR0X13jHTK6iqEmX9neUHVv5bERrADcFbM7AnGigcjOtKV91bN60llBKqw1NyX
	wDhw==
MIME-Version: 1.0
X-Received: by 10.236.61.137 with SMTP id w9mr21653190yhc.31.1430921566566;
	Wed, 06 May 2015 07:12:46 -0700 (PDT)
Received: by 10.129.109.20 with HTTP; Wed, 6 May 2015 07:12:46 -0700 (PDT)
In-Reply-To: <1430921004-21983-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1430856401.8074.13.camel@linuxfoundation.org>
	<1430921004-21983-1-git-send-email-ed.bartosh@linux.intel.com>
Date: Wed, 6 May 2015 10:12:46 -0400
Message-ID: <CADkTA4PQY4vkB6X6Eu3DhD3e8neAKp0dHCO0BCuSzLJhK=yVPQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v.4] kernel.bbclass: Fix race condition
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
X-List-Received-Date: Wed, 06 May 2015 14:12:48 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 6, 2015 at 10:03 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> Race condition between do_compile_kernelmodules and do_shared_workdir
> tasks occurs when do_compile_kernelmodules changes files in
> include/generated/* while do_shared_workdir tries to copy them to
> shared working directory.
>
> Fixed race by moving do_shared_workdir after do_compile_kernelmodules.

I assume that this supersedes all the old versions.

I had a comment typed for the first, but got distracted and didn't send it
before this one came out!

I was concerned in the earlier revision that the race still existed, or
more precisely that we had things in a non-obvious place if a recipe
needed to depend on the artifacts in the shared directory.

Will this variant fix the issue that Richard pointed out with lttng-modules ?
(It should, since lttng-modules does depend on
'virtual/kernel:do_shared_workdir'
and that will now run after the kernel modules are installed.

We are forcing a bit of serialization of the module build for anything external
that depends on the artifacts, but I'd rather get this working .. and
worry about
any optimizations and further tweaks later.

Bruce


>
> [YOCTO #7321]
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 125ed88..9207ae4 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -234,7 +234,7 @@ kernel_do_install() {
>  }
>  do_install[prefuncs] += "package_get_auto_pr"
>
> -addtask shared_workdir after do_compile before do_install
> +addtask shared_workdir after do_compile_kernelmodules before do_install
>
>  emit_depmod_pkgdata() {
>         # Stash data for depmod
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

