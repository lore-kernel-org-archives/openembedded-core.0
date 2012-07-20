Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SsCZ0-0003dX-81
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 14:44:10 +0200
Received: by qaat11 with SMTP id t11so168539qaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 05:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VyTDg1u3fNQeQIY8XYyVz3UQr6wFe34BLoIE9ziZZnA=;
	b=aSitzywHSdWoDCtRi5YfE2K3/Ns2qGqk39Q5flVxW22vzdY111oQlvVg76qqeCHvXz
	R/Hr4TkRUHzovxen39tH4SM+0QUhuwYVS1aPxfRPwuT+ZQ/dJjpujwfWhlCRJNOFh8/P
	fJ2DoEyOGnLLtCr0mWrpbv4YYCVuOJGUF5vxyi9wScB2dSogSzre3ePT/NiSSjtlv+px
	Kmz0V+XmNtLkjM0DJHzs84xqNNMb5njfdf2A8X0/WQolsoVVwwVmX4hklJ0l5IIRU3H7
	x3JBET6Hwi7spZLRPcCEMwM6C+dNleCdtIvNpZiPFHpkMYd0Y+59F468XPd6zIxZk7CA
	3odA==
MIME-Version: 1.0
Received: by 10.229.105.140 with SMTP id t12mr2558453qco.18.1342787566503;
	Fri, 20 Jul 2012 05:32:46 -0700 (PDT)
Received: by 10.229.8.78 with HTTP; Fri, 20 Jul 2012 05:32:46 -0700 (PDT)
In-Reply-To: <1342763803-32218-1-git-send-email-raj.khem@gmail.com>
References: <1342763803-32218-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 20 Jul 2012 08:32:46 -0400
Message-ID: <CADkTA4PTYSPN-rJtoeroFrF93ZLz7dOcaeqL=iMq0rqfoHF+ew@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel bbclass: recreate uImage unless KEEPUIMAGE is set
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
X-List-Received-Date: Fri, 20 Jul 2012 12:44:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 20, 2012 at 1:56 AM, Khem Raj <raj.khem@gmail.com> wrote:
> From: Koen Kooi <koen@dominion.thruhere.net>
>
> The intent of the uImage code in this class includes the following
>
> 1) be able to specify custom load addresses without needing to patch the kernel
> 2) add better information to the uImage description field
>
> The current state is a NOP anyway, the kernel will always build a uImage when you tell it to 'make uImage'.
>
> weakly Set KEEPUIMAGE in default-distrovars.inc which preserve the
> current OE-Core behavior. Machines which are being ported from oe.dev and need to
> regenerate uImage can set this to be empty

Fine with me, either with the existing test or the "1" as suggested Koen.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/kernel.bbclass                     |    2 +-
>  meta/conf/distro/include/default-distrovars.inc |    1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ce4d7de..efe4a9f 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -507,7 +507,7 @@ KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
>
>  do_uboot_mkimage() {
>         if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then
> -               if test ! -e arch/${ARCH}/boot/uImage ; then
> +               if test "x${KEEPUIMAGE}" = "x" ; then
>                         ENTRYPOINT=${UBOOT_ENTRYPOINT}
>                         if test -n "${UBOOT_ENTRYSYMBOL}"; then
>                                 ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> index f770919..7448415 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -2,6 +2,7 @@ QA_LOGFILE = "${TMPDIR}/qa.log"
>
>  OEINCLUDELOGS ?= "yes"
>  KERNEL_CONSOLE ?= "ttyS0"
> +KEEPUIMAGE ?? = "1"
>
>  PCMCIA_MANAGER ?= "pcmciautils"
>
> --
> 1.7.9.5
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


