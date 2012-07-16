Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Sqkqw-0000m7-UG
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 14:56:43 +0200
Received: by qcad10 with SMTP id d10so2919655qca.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 05:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=7Hc9m6rwFpda4V2UqafyqI6FWdwao9n3L8Y00WhcQUo=;
	b=ZKMpSIH+Sg+HpWdnb5tQpELlkAkjdfcMbX7lZznuQxXH2ehAsg73q/qBPsyON/+pgy
	uH3BsTmPrSej6MRUkJteFWCoCn+IU4KMrzCPwebxtmMdBDmZBp3RH4oOAijf4Y6tBUAn
	IgX1CjRKs3P+eEtEh9zT48v2v3xYXcil2bL4UsN0nv8iHY2omiR1g0MOT69WbbFCqD7H
	9mwTKPhwB3ihM+AprAuF8CjzTgF7fv8wb2M+QeDEjI3CfGuyU5c2uzFqHqWL0SjErGMZ
	D9KKPQFSr+kPneWwF5irfFhldryFXZJ6uMmgnvW/HJhQlDbZFUJ785bnxkA6W12+djFS
	S5BA==
MIME-Version: 1.0
Received: by 10.224.45.8 with SMTP id c8mr21023556qaf.29.1342442724383; Mon,
	16 Jul 2012 05:45:24 -0700 (PDT)
Received: by 10.229.8.78 with HTTP; Mon, 16 Jul 2012 05:45:24 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207160700490.1036@oneiric>
References: <alpine.DEB.2.02.1207160700490.1036@oneiric>
Date: Mon, 16 Jul 2012 08:45:24 -0400
Message-ID: <CADkTA4NPRAT2ycyXciituZcUupcdcS-iKS_qFnxT3=NuMJ=jxA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: why are native kern tools both generated and on the meta branch?
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
X-List-Received-Date: Mon, 16 Jul 2012 12:56:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 16, 2012 at 7:15 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   side note: for the next little while, for pedagogical reasons, i'm
> stepping through each phase of the OE kernel build process and
> documenting what happens and what gets generated at each step, as in:
>
>   $ bitbake -c fetch linux-yocto
>   $ bitbake -c unpack linux-yocto
>   $ bitbake -c kernel_checkout linux-yocto
>   $ bitbake -c validate_branches linux-yocto
>   $ bitbake -c patch linux-yocto
>   ... etc etc ...
>
> so, yes, upcoming questions will almost certainly be as pedantic as
> ever.  you've been warned. :-P
>
>   at this point, i've done the validate_branches step and am about to
> do the patch, and i notice from linux-yocto.inc:
>
>   do_patch[depends] = "kern-tools-native:do_populate_sysroot"
>
> ok, i can accept that, and performing the patch should first build
> and install the native kern-tools in my x86_64 sysroots directory ,
> which i'm pretty sure is on my PATH so the new utilities like
> createme, updateme, configme and so on will be available for the
> subsequent do_patch() step.  so far, so good.
>
>   but in the do_patch() routine itself, we have:
>
> =====
>
> do_patch() {
>         cd ${S}
>
>         # if kernel tools are available in-tree, they are preferred
>         # and are placed on the path before any external tools. Unless
>         # the external tools flag is set, in that case we do nothing.
>         if [ -f "${S}/scripts/util/configme" ]; then
>                 if [ -z "${EXTERNAL_KERNEL_TOOLS}" ]; then
>                         PATH=${S}/scripts/util:${PATH}
>                 fi
>         fi
>
>         kbranch=${KBRANCH}
>
>         # if we have a defined/set meta branch we should not be generating
>         # any meta data. The passed branch has what we need.
>         if [ -n "${KMETA}" ]; then
>                 createme_flags="--disable-meta-gen"
>         fi
>         createme ${createme_flags} ${ARCH} ${kbranch}
>         ... snip ...
>
> =====
>
> in my case, i have a meta branch which just happens to include a
> scripts/ directory containing what appears to be all of those
> kern-tools.

Those are the tools that were captured at the time the tree was first
constructed .. they are a reference.

>
>   is there a reason for that duplication?  as i read it (and i could
> be confused), the do_patch() generates and installs the necessary
> native kern-tools, even as my meta branch (which is not checked out
> yet) already contains all of those tools.  should i care?

git history of that line will tell you the story .. it is there as a transition
from an out of tree set of tools, to a set of tools that are within
the tree itself.
That work is still on the schedule for 1.3, but it actually complicates the
tree maintenance (SRCREV updates for all branches for tools updates) and
it gets entangled with merge_config.pl updates .. all that an two repositories
need to stay in sync.

As such, it is always a bubble feature that gets shoved out, but the parts
that are present are just the beginning of that work.

Cheers,

Bruce


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
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


