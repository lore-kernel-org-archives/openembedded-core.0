Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.280.1631893631980585853
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Sep 2021 08:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 220006000F;
	Fri, 17 Sep 2021 15:47:08 +0000 (UTC)
Date: Fri, 17 Sep 2021 17:47:08 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: kristian@klausen.dk
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] systemd: Add tpm2 PACKAGECONFIG
Message-ID: <YUS4fOY2J2hoAsxx@piout.net>
References: <20210915102308.1892-1-kristian@klausen.dk>
 <20210915104818.43wown7ss2pcfnky@fedora>
 <YUHZe8zK2lV0lWPy@bob>
MIME-Version: 1.0
In-Reply-To: <YUHZe8zK2lV0lWPy@bob>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 15/09/2021 13:31:07+0200, Kristian Klausen via lists.openembedded.org wrote:
> Den Wed, Sep 15, 2021 at 12:48:18 +0200 skrev Quentin Schulz:
> > Hi Kristian,
> > 
> > On Wed, Sep 15, 2021 at 12:23:08PM +0200, Kristian Klausen via lists.openembedded.org wrote:
> > > The TPM2 support is used, among other things, for unlocking encrypted
> > > volumes.
> > > 
> > > Signed-off-by: Kristian Klausen <kristian@klausen.dk>
> > > ---
> > >  meta/recipes-core/systemd/systemd_249.3.bb | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/meta/recipes-core/systemd/systemd_249.3.bb b/meta/recipes-core/systemd/systemd_249.3.bb
> > > index c027b88fd6..f8c85dabf0 100644
> > > --- a/meta/recipes-core/systemd/systemd_249.3.bb
> > > +++ b/meta/recipes-core/systemd/systemd_249.3.bb
> > > @@ -128,6 +128,7 @@ PACKAGECONFIG[bzip2] = "-Dbzip2=true,-Dbzip2=false,bzip2"
> > >  PACKAGECONFIG[cgroupv2] = "-Ddefault-hierarchy=unified,-Ddefault-hierarchy=hybrid"
> > >  PACKAGECONFIG[coredump] = "-Dcoredump=true,-Dcoredump=false"
> > >  PACKAGECONFIG[cryptsetup] = "-Dlibcryptsetup=true,-Dlibcryptsetup=false,cryptsetup,,cryptsetup"
> > > +PACKAGECONFIG[tpm2] = "-Dtpm2=true,-Dtpm2=false,tpm2-tss,tpm2-tss libtss2 libtss2-tcti-device"
> > 
> > Shouldn't the RDEPENDS part of the PACKAGECONFIG be pulled in
> > automatically by Bitbake since I assume the libs they contained are used
> > by the linker for systemd?
> > 
> > Also looking at the tpm2-tss recipe, I'm not sure there's a package
> > named libtss2-tcti-device?
> 
> Are we looking at the same recipe? It is defined in 
> tpm2-tss_3.0.3.bb[1].
> 
> [1] https://git.yoctoproject.org/cgit/cgit.cgi/meta-security/tree/meta-tpm/recipes-tpm2/tpm2-tss/tpm2-tss_3.0.3.bb?id=e0fca90835169e21ffabe6f2e4b901678236d36e#n37
> 

Then, shouldn't that be a bbappend in meta-security? Else, you run the
risk of pulling a dependency for a recipe in a layer you don't have.

> > 
> > I would assume that
> > 
> > PACKAGECONFIG[tpm2] = "-Dtpm2=true,-Dtpm2=false,tpm2-tss"
> > 
> > would be enough except if there's dynamic loading of libraries or
> > binaries from tpm2-tss that are required at runtime?
> 
> I my testing it didn't work, presumably due to systemd not linking with 
> libtss2*.so but loading them with dlopen()[2].
> 
> libtss2 is also using dlopen() for loading the TCTI implementation 
> (libtss2-tcti-device in this case)[3].
> 
> [2] https://github.com/systemd/systemd/blob/aff870ef61bda152ea6241f684dcab26a9265e78/src/shared/tpm2-util.c#L46-L81
> [3] https://github.com/tpm2-software/tpm2-tss/blob/9288970a3e657cdee85d08d3813199ec864de3ad/src/tss2-tcti/tctildr-dl.c#L79-L125
> 
> Cheers,
> Kristian
> 
> > 
> > Cheers,
> > Quentin

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
