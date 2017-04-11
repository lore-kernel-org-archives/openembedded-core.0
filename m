Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 04A3077CEF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 17:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v3BHmJcL014469; 
	Tue, 11 Apr 2017 18:48:20 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xyUG98xCr9vK; Tue, 11 Apr 2017 18:48:20 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3BGv4OV009419
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 11 Apr 2017 17:57:06 +0100
Message-ID: <1491929824.12091.28.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Patrick Ohly <patrick.ohly@intel.com>
Date: Tue, 11 Apr 2017 17:57:04 +0100
In-Reply-To: <CAMKF1srOa1mWXXRvF9_EXrUFiy43_K4kAC4i9aYdpsm2hTJQNw@mail.gmail.com>
References: <1491828558.10884.112.camel@intel.com>
	<1491928471.10884.196.camel@intel.com>
	<CAMKF1srOa1mWXXRvF9_EXrUFiy43_K4kAC4i9aYdpsm2hTJQNw@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: go-cross: incorrect dependency on tune-specific libgcc
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
X-List-Received-Date: Tue, 11 Apr 2017 17:48:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-04-11 at 09:39 -0700, Khem Raj wrote:
> On Tue, Apr 11, 2017 at 9:34 AM, Patrick Ohly <patrick.ohly@intel.com
> > wrote:
> > 
> > On Mon, 2017-04-10 at 14:49 +0200, Patrick Ohly wrote:
> > > 
> > > Hello!
> > > 
> > > I'm currently extending the yocto-compat-layer.py so that it can
> > > detect
> > > invalid signature changes when changing MACHINE. go-cross-x86_64
> > > shows
> > > up as broken when comparing signatures for MACHINE=intel-corei7-
> > > 64 and
> > > MACHINE=qemux86-64.
> > > 
> > > Both machines share the same go-cross-x86_64, but that DEPENDS on
> > > libgcc:
> > > 
> > > meta/recipes-devtools/go/go.inc:# libgcc is required for the
> > > target specific libraries to build properly
> > > meta/recipes-devtools/go/go.inc:DEPENDS += "go-bootstrap-native
> > > libgcc"
> > > 
> > > And libgcc itself depends on the tune flags for the target
> > > architecture
> > > and thus is different for these two machines:
> > > 
> > > $ bitbake-diffsigs -t go-cross-x86_64 do_prepare_recipe_sysroot
> > > -s 563f419e3854c2351e2cbbf33a9025f6
> > > 64e378fd9853a6cd6a4e7f684f52d2fc
> > > Hash for dependent task gcc/libgcc_6.3.bb.do_populate_sysroot
> > > changed from afb6b55c0e2b7d2e816b3d2d214a7326 to
> > > 208fac5ae428b07a4aa491b130879e4a
> > >   Hash for dependent task gcc/libgcc_6.3.bb.do_multilib_install
> > > changed from 596e1612d7b84b7a9c1b409ee78cca89 to
> > > d41e2e835d0abe7646e53e3d63ce00cd
> > >     Hash for dependent task gcc/libgcc_6.3.bb.do_install changed
> > > from 9ca4126c69fcceb410253a0603c3d76b to
> > > cb0c49687a91ea17f1027c6394baacab
> > >       Hash for dependent task gcc/libgcc_6.3.bb.do_compile
> > > changed from ab80902424c73af49257cc3f6fe049aa to
> > > 436f978a703476968bd5ae1c1915ee5a
> > >         Hash for dependent task gcc/libgcc_6.3.bb.do_configure
> > > changed from eb0c36d87f32ce1ceb7d1e42609578fb to
> > > f62c98806faf3a28c2144919b89d3460
> > >           Hash for dependent task
> > > gcc/libgcc_6.3.bb.do_prepare_recipe_sysroot changed from
> > > b037b950e346bef71a4f8fd2c6a2195c to
> > > d4564b5730941279392932e3c670a5a5
> > >             Hash for dependent task gcc/libgcc_6.3.bb.do_fetch
> > > changed from e64cd9e029ed63ba3a09e5fe085b7057 to
> > > ea4d3f9d10544219ceb8591d5a5a4041
> > >               basehash changed from
> > > 8744593af2eddb60244788f2b9476e2d to
> > > dabeb22478ef501e35311af75119a2cf
> > >               Variable TUNE_CCARGS value changed:
> > >               " -m64 [--march=corei7 -mtune=corei7-] {+-
> > > march=core2 -mtune=core2 -msse3+} -mfpmath=sse [--msse4.2-]"
> > > 
> > > Does this fix look correct? It turns go-cross into a package that
> > > is
> > > specific to the tune flags for the target.
> > [...]
> > 
> > > 
> > > The alternative would be to drop the libgcc dependency, but I
> > > have no
> > > idea whether that would work at all.
> > Besides Bruce who pointed out the implications on recipes depending
> > on
> > go-cross-${TARGET_ARCH}, Richard also had concerns about making go-
> > cross
> > tune-specific, so I ended up testing the libgcc removal approach.
> > It
> > happened to build okay, so the patch that I ended up proposing (see
> > "go-cross: avoid libgcc dependency") just removes libgcc from
> > DEPENDS
> > for go-cross.
> > 
> > I need to revise the method how its done (i.e. not with
> > DEPENDS_remove),
> > but besides that, can anyone explain whether such a change might
> > hit
> > some problems somewhere? Khem?
> > 
> I think TUNE_PKGARCH is the granularity it needs for setting GOARM
> anyway. It should be fine to change it.

Once we go down the TUNE_PKGARCH route we probably won't get back. I'm
reluctant to give up on this quite so easily since having common tools
make a lot of sense from a build time perspective (and we already have
fun with testing and the time it takes).

We could make arm append a v7 to PN in the v7 case and only have two go
compilers on arm to address the GOARM issue...

Cheers,

Richard




