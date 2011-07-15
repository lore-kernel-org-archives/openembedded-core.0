Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QhirT-0007Ft-3H
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 15:55:23 +0200
Received: by gwb11 with SMTP id 11so547673gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 06:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=+VEkGHu4RSeDG3pq7maJ+gVGfeGyKm7i7C/1SrEbBCI=;
	b=p11qdLMOXbcg3E4Y0Rbla7wnTC0rd9/mgfj+sB0zB9OvM045YiJ9cHSKhVqrHzHIDj
	Bss+hpnhySyxX/TAQTC1tqzK4kbMv/jHGGYhqkhQUy6sY58eE1Os124ZdPecw0XWCzGz
	0hpVTU1BINuELa4zwrMiH3gYLiXxFDT8lhRRU=
MIME-Version: 1.0
Received: by 10.91.121.16 with SMTP id y16mr3587278agm.135.1310737881844; Fri,
	15 Jul 2011 06:51:21 -0700 (PDT)
Received: by 10.91.164.38 with HTTP; Fri, 15 Jul 2011 06:51:21 -0700 (PDT)
In-Reply-To: <1310736077.3805.37.camel@phil-desktop>
References: <1310736077.3805.37.camel@phil-desktop>
Date: Fri, 15 Jul 2011 09:51:21 -0400
Message-ID: <CADkTA4OYB0mch1SRSgidwGfZiWBeBuaWKH1BU1NgF9jPVa1Niw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernels
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
X-List-Received-Date: Fri, 15 Jul 2011 13:55:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2011 at 9:21 AM, Phil Blundell <pb@pbcl.net> wrote:
> The other day I was working on a BSP layer for a fairly generic i586
> system and I was struck by the fact that we don't appear to have any
> vanilla kernel recipes in oe-core. =A0I had sort of expected that, to get
> a standard bzImage out, I would just need to ship an appropriate
> defconfig in my layer and everything else would "just work".

Hmm. Perhaps it isn't documented clearly enough as such, but the linux-yoct=
o
kernel base can work in this mode, since that was a design goal of
1.0.

You pick a branch, throw in a config fragment (or defconfig if you really
want)  and build. The base branches in the tree are generic enough to
sort a range of boards out of the box, and should form a base.

The benefit with this is that you'd pickup and fixes, features and benefit
from the QA and testing that is performed on that kernel. Everyone
doing their own thing, means duplicated efforts.

>
> However, the only kernel that I could immediately find in oe-core was
> linux-yocto, which appears to be somewhat more specialized than that
> and, at a first glance, looks like it would be better placed in some or
> other poky layer than oe-core itself.

We use linux-yocto to support the set of embedded features and work
flow that yocto is intended to support, but as I said above, it is intended
to be used either standalone (i.e. without oe/poky/bitbake) or as an
extension point.

>
> Is it the intent that BSP layers are meant to start from linux-yocto and
> customise that, or are they expected to provide their own standalone
> recipes?

Customization is what we do, or you can include and extend. I have
2 extension recipes in the poky-extras repo that do just that.

>
> I was also slightly confused by the fragmentary nature of the kernel
> helper files. =A0Chasing the references from linux-yocto.bb seems to show
> that it includes two .incs and explicitly inherits a total of
> six .bbclasses (one of which is, admittedly, blank) and it's not always
> entirely obvious what each one is really doing or how they are meant to
> interact with each other.

The factoring of these files was to pull out common parts, so the recipe
could be re-used and extended. Nothing is ever perfect, so it is still a
work in progress. The empty .inc looks to be a casualty of cleanups and
we didn't drop the bogus include in linux-yocto, that's some house keeping
that I'll take care of.

I can show you what you need to do, and generate some docs around this
(if you are interested)  and if there are problems, we'll fix the workflow.

Cheers,

Bruce

>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


