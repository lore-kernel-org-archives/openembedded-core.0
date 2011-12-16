Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RbfN5-0007GG-1o
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 22:31:15 +0100
Received: by iakh37 with SMTP id h37so1480638iak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 13:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ci3ZUUGAUnlNFTfaTIWd7Ou7Oop6EElnSMPIaKLhJ1c=;
	b=Rckn3S6TVSmPDva/gCvugBKY2QrGcB0wJWLj1NDxBVD2N5fxY/LqCo/sXb3oIm3dT8
	SE+42rcC1nWy4fILCs6FhaAnsbh7EPMKdYPei4XnxH1nzXlrcMge7mFl04BCAcgoIuD4
	8vdf6g4azXX2PhsPqULfo93HCkxj+zx7c5rrA=
Received: by 10.50.154.228 with SMTP id vr4mr10941824igb.65.1324070654306;
	Fri, 16 Dec 2011 13:24:14 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id wn9sm4411164igc.6.2011.12.16.13.24.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Dec 2011 13:24:12 -0800 (PST)
Date: Fri, 16 Dec 2011 13:24:24 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111216212424.GA28832@sakrah.homelinux.org>
References: <1323851280-6342-1-git-send-email-raj.khem@gmail.com>
	<1323856946.25491.31.camel@ted>
	<CAMKF1sqLHP1cWfBswrqnwhAPj4Tt3XCV8GpQv7Dm71PX3F=rAw@mail.gmail.com>
	<1323951419.4568.17.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1323951419.4568.17.camel@ted>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] gcc-4.6: Let G++ relocate gxx-include-dir when using --sysroot option
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
X-List-Received-Date: Fri, 16 Dec 2011 21:31:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/12/11 12:16), Richard Purdie wrote:
> On Wed, 2011-12-14 at 07:49 -0800, Khem Raj wrote:
> > On Wed, Dec 14, 2011 at 2:02 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > Hi Khem,
> > >
> > > What's puzzling me is that reading through this patch, we already do
> > > what this patch is doing?
> > >
> > > Where is the difference which this patch is fixing?
> > >
> > 
> > this does essentially what we were doing earlier but this one is going
> > to go upstream
> 
> Yes, that is good and I'm fine with the patch for that reason.

there is additional detail that this patch does which is that in order
to make gxx-includes to be sysroot relative --with-cxx-include option to
be also specified relative to initials sysroot during configure time

e.g. --with-sysroot=SYSROOT --with-gxx-include-dir=SYSROOT/usr/include/c++

since the original behavior of --with-gxx-include-dir is to specify an
absolute path that is preserved whereas the patch we have in OE relocates
gxx-include-dir regardless.Therefore in order to adopt this patch we have
to use the above syntax which was original syntax before the above patch
and would make up forward compatible provided this patch makes into gcc
upstream.

> 
> > 
> > > I appreciate that patch adds in the prefix to the --with-gxx-include-dir
> > > option but it then removes it again during configure so this should be a
> > > null op. Both versions of the patch set the "1" bit in gcc/cppdefault.c.
> > >
> > > So where is the change this patch makes which fixes things?
> > 
> > changing --with-gxx-include-dir to be within sysroot triggers the
> > relocation code.
> 
> But we were already triggering the relocation code?
> 
> I can't see *any* functionality difference between these, they should
> both just give the same result as far as I can tell...
> 
same functionality but with a different usage see above

> Claiming it fixes things is therefore concerning me.

correct it does not fix anything actually that I know was broken before
Thinking out loud given that with-gxx-include-dir is absolute in nature it could be
the original patch we have, does not work in some weird case since the
absolute path we use is still /usr/include/c++ during configure time.
although I would expect that the include poisoning warning will report it if that
happened

-Khem


