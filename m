Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SqbOm-0001HJ-Nt
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 04:51:00 +0200
Received: by qaat11 with SMTP id t11so1339870qaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2012 19:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WeD69tXSIWUqNvUMVNBLym771J8J3+qi8YauGsYk7O0=;
	b=uLRWVuHDViTT85KKT7iyWm/upbKmPLOPg2KoKcoj4jk2GihJ5C+Y6dcJapsQraPLh6
	+tYHwtTxyZ4z1wHsy903T4DTG2iPJU9eCrHYYPSVeUXCi+4Wgr+71D/ivanUFsujdph5
	OXDZRAAplE4zOIrvsfh4YlVuf21aEXDoI4+KbqvZmbgO5WyoQUACF8iQQRgV5b8h1DhH
	0tSvJpi/vZS2WPLKvNlX9ulPHe1qrFUkwhksy/00wutt4+zkH5U75rmN3n4146yryyqy
	wulPKzuJDFy+aUEPgb0Um4EXM+fXN5G/vHRaBXcvnQTS5IzbfSPwXWZXviR6oN2ChQrQ
	L2Hg==
MIME-Version: 1.0
Received: by 10.224.203.8 with SMTP id fg8mr18396518qab.38.1342406382493; Sun,
	15 Jul 2012 19:39:42 -0700 (PDT)
Received: by 10.229.8.78 with HTTP; Sun, 15 Jul 2012 19:39:42 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207151647040.1884@oneiric>
References: <alpine.DEB.2.02.1207151647040.1884@oneiric>
Date: Sun, 15 Jul 2012 22:39:42 -0400
Message-ID: <CADkTA4NfjZhS=VzsHF3qKxGc+x0LK85gdcf=meQ2JWLTyu5FbA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: kernel-yocto.bbclass: Delete superfluous creation of ${S}/.git directory
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
X-List-Received-Date: Mon, 16 Jul 2012 02:51:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jul 15, 2012 at 4:55 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> In do_kernel_checkout(), replace the creation of ${S}/.git with just
> the creation of ${S} since the .git subdirectory is created only a few
> lines later using a "mv".  Here's the original code:
>
>   rm -rf ${S}
>   mkdir -p ${S}/.git
>
>   echo "WARNING. ${WORKDIR}/git is not a bare clone."
>   echo "Ensure that the SRC_URI includes the 'bareclone=1' option."
>
>   # we can fix up the kernel repository, but at the least the meta
>   # branch must be present. The machine branch may be created later.
>   mv ${WORKDIR}/git/.git ${S}    <-- See?  There it is.
>
> There's no functional change here, it's just less confusing.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
>   yes, i realize this doesn't change anything, but it's potentially
> confusing for the code to explicitly create ${S}/.git, shortly before
> it whomps over top of that directory anyway.  i spent a couple minutes
> puzzling over the above trying to figure out if there was something
> subtle happening i didn't understand.

That block of code, and the one below it used to be the same .. so the extra
mv and create just happened to stay.

There is no need for it, so I've applied your patch.

Cheers,

Bruce

>
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 48c8974..8e010e0 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -106,7 +106,7 @@ do_kernel_checkout() {
>         if [ -d "${WORKDIR}/git/" ] && [ -d "${WORKDIR}/git/.git" ]; then
>                 # we build out of {S}, so ensure that ${S} is clean and present
>                 rm -rf ${S}
> -               mkdir -p ${S}/.git
> +               mkdir -p ${S}
>
>                 echo "WARNING. ${WORKDIR}/git is not a bare clone."
>                 echo "Ensure that the SRC_URI includes the 'bareclone=1' option."
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


