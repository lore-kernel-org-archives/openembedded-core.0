Received: from mail.klausen.dk (mail.klausen.dk [157.90.24.29])
 by mx.groups.io with SMTP id smtpd.web08.6189.1631705471960963070
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 04:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@klausen.dk header.s=dkim header.b=i4YYMVip;
 spf=pass (domain: klausen.dk, ip: 157.90.24.29, mailfrom: kristian@klausen.dk)
Date: Wed, 15 Sep 2021 13:31:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
	t=1631705469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7M1MckvENI/BFUmZvK5VcitjU42KD0qq+WN+Rc2KHDk=;
	b=i4YYMVipvpjeNVZ7PfKihh90zgD8KbKiXWyJ81G1VoVUGJceER6O2tDIKouOqhQExlVHTu
	CROfOf2/j+1lpN2q1N9QjcPjraqCVlkmQwwQP1naOjyyLyue3lKi/e68FMSOSX5VsOnTVr
	WRzGZ1HAVDsOhV49dY2UIP4+ZHlTH14=
From: "Kristian Klausen" <kristian@klausen.dk>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: kristian@klausen.dk, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] systemd: Add tpm2 PACKAGECONFIG
Message-ID: <YUHZe8zK2lV0lWPy@bob>
References: <20210915102308.1892-1-kristian@klausen.dk>
 <20210915104818.43wown7ss2pcfnky@fedora>
MIME-Version: 1.0
In-Reply-To: <20210915104818.43wown7ss2pcfnky@fedora>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Den Wed, Sep 15, 2021 at 12:48:18 +0200 skrev Quentin Schulz:
> Hi Kristian,
> 
> On Wed, Sep 15, 2021 at 12:23:08PM +0200, Kristian Klausen via lists.openembedded.org wrote:
> > The TPM2 support is used, among other things, for unlocking encrypted
> > volumes.
> > 
> > Signed-off-by: Kristian Klausen <kristian@klausen.dk>
> > ---
> >  meta/recipes-core/systemd/systemd_249.3.bb | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/meta/recipes-core/systemd/systemd_249.3.bb b/meta/recipes-core/systemd/systemd_249.3.bb
> > index c027b88fd6..f8c85dabf0 100644
> > --- a/meta/recipes-core/systemd/systemd_249.3.bb
> > +++ b/meta/recipes-core/systemd/systemd_249.3.bb
> > @@ -128,6 +128,7 @@ PACKAGECONFIG[bzip2] = "-Dbzip2=true,-Dbzip2=false,bzip2"
> >  PACKAGECONFIG[cgroupv2] = "-Ddefault-hierarchy=unified,-Ddefault-hierarchy=hybrid"
> >  PACKAGECONFIG[coredump] = "-Dcoredump=true,-Dcoredump=false"
> >  PACKAGECONFIG[cryptsetup] = "-Dlibcryptsetup=true,-Dlibcryptsetup=false,cryptsetup,,cryptsetup"
> > +PACKAGECONFIG[tpm2] = "-Dtpm2=true,-Dtpm2=false,tpm2-tss,tpm2-tss libtss2 libtss2-tcti-device"
> 
> Shouldn't the RDEPENDS part of the PACKAGECONFIG be pulled in
> automatically by Bitbake since I assume the libs they contained are used
> by the linker for systemd?
> 
> Also looking at the tpm2-tss recipe, I'm not sure there's a package
> named libtss2-tcti-device?

Are we looking at the same recipe? It is defined in 
tpm2-tss_3.0.3.bb[1].

[1] https://git.yoctoproject.org/cgit/cgit.cgi/meta-security/tree/meta-tpm/recipes-tpm2/tpm2-tss/tpm2-tss_3.0.3.bb?id=e0fca90835169e21ffabe6f2e4b901678236d36e#n37

> 
> I would assume that
> 
> PACKAGECONFIG[tpm2] = "-Dtpm2=true,-Dtpm2=false,tpm2-tss"
> 
> would be enough except if there's dynamic loading of libraries or
> binaries from tpm2-tss that are required at runtime?

I my testing it didn't work, presumably due to systemd not linking with 
libtss2*.so but loading them with dlopen()[2].

libtss2 is also using dlopen() for loading the TCTI implementation 
(libtss2-tcti-device in this case)[3].

[2] https://github.com/systemd/systemd/blob/aff870ef61bda152ea6241f684dcab26a9265e78/src/shared/tpm2-util.c#L46-L81
[3] https://github.com/tpm2-software/tpm2-tss/blob/9288970a3e657cdee85d08d3813199ec864de3ad/src/tss2-tcti/tctildr-dl.c#L79-L125

Cheers,
Kristian

> 
> Cheers,
> Quentin
