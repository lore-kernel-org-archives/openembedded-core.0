Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SwEMt-0003iO-TN
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 17:28:20 +0200
Received: by qaat11 with SMTP id t11so2181700qaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 08:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=xe+nR2FvVnt51Bd690o8d7BHtThfs5EzlVtW2TxdWMM=;
	b=tDCzB3qOi3FMCIOYIifz7tNX3c/L7/4wric/UO39xRL00Lkj7BIHOQ0V28Os22mPfM
	L+fepslX/N83lJOwtqkA2LBb/IvbomsiQa3DCdhkqnUDWL8s0zeaDS5U25cglRwoCE0Q
	3m1hGlap84LO26he8Md//L5Z0KH+81Vhs7NALaTotfDGtXQk5htOTLdEeuldIh99SDk6
	cbQiN9C6ff5ZywBrhSu/8ezfC/ncAuIiB3V97UCHeAQzTCYGrFJ3N0xfB9Gab5O7pO+9
	IqzRBbJRdTQK3Y8+Tm9j9RS3HR3fj9s5WeiffgC6xMWpxhhJD1fXogAF19KxV+HT+kfy
	z72g==
MIME-Version: 1.0
Received: by 10.224.188.12 with SMTP id cy12mr28516267qab.68.1343747802552;
	Tue, 31 Jul 2012 08:16:42 -0700 (PDT)
Received: by 10.229.247.198 with HTTP; Tue, 31 Jul 2012 08:16:42 -0700 (PDT)
In-Reply-To: <1343747440-31885-1-git-send-email-raj.khem@gmail.com>
References: <1343747440-31885-1-git-send-email-raj.khem@gmail.com>
Date: Tue, 31 Jul 2012 11:16:42 -0400
Message-ID: <CADkTA4MGir+Ag=PnP2hLE941vQMNnKQRs2NRvj1NUW4c9CaB4Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Preserve generated headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2012 15:28:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 31, 2012 at 11:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
> asm/unistd.h includes asm/unistd_64.h on x86_64
> and asm/unistd_32.h on i386 but these files are
> generated files in 3.4 and when we do 'make clean' they get
> deleted and it shows up as an error when building
> external modules. May be its a 3.4 kernel bug may be not
> but make clean should have left the tree in
> a shape to build modules but it does not.
>
> Probably we should run make modules_prepare after having
> run make clean.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/kernel.bbclass |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index b19ed4c..4ac3d48 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -197,6 +197,8 @@ kernel_do_install() {
>         if [ -f include/generated/bounds.h ]; then
>                 cp include/generated/bounds.h $kerneldir/include/generated/bounds.h
>         fi
> +       mkdir -p $kerneldir/arch/${ARCH}/include/generated/
> +       cp -fR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/

If we take the blanket protection, we should be able to drop the
bounds.h specific
case a the same time .. right ?

I'm ok with this, but I can run a test with 'make modules_prepare'
being run if you
already haven't.

Cheers,

Bruce

>
>         # Remove the following binaries which cause strip or arch QA errors
>         # during do_package for cross-compiled platforms
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


