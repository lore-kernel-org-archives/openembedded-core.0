Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0F0356F7C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 17:27:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 31 Mar 2014 10:21:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,766,1389772800"; d="scan'208";a="503700352"
Received: from williams-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.67])
	by fmsmga001.fm.intel.com with ESMTP; 31 Mar 2014 10:23:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 31 Mar 2014 18:23:20 +0100
Message-ID: <5611115.ovePUcShQE@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.6-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <1396285412.14790.83.camel@ted>
References: <cover.1396259433.git.cristian.iorga@intel.com>
	<2505811.xE1RLRgDA1@peggleto-mobl5.ger.corp.intel.com>
	<1396285412.14790.83.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] core-image-lsb: enforce pam as a needed distro feature
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
X-List-Received-Date: Mon, 31 Mar 2014 17:27:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 31 March 2014 18:03:32 Richard Purdie wrote:
> On Mon, 2014-03-31 at 13:18 +0100, Paul Eggleton wrote:
> > On Monday 31 March 2014 11:58:49 Stanacar, StefanX wrote:
> > > On Mon, 2014-03-31 at 10:58 +0100, Richard Purdie wrote:
> > > > On Mon, 2014-03-31 at 12:51 +0300, Cristian Iorga wrote:
> > > > > core-image-lsb only gave a warning:
> > > > > "WARNING: Building libpam but 'pam' isn't in DISTRO_FEATURES,
> > > > > PAM won't work correctly"
> > > > > when the proper DISTRO was not set for it.
> > > > > default choice would be DISTRO = "poky-lsb",
> > > > > but not necessarily, depending on each custom distro.
> > > > > 
> > > > > This fix will enforce the proper usage of pam
> > > > > as a distro feature for core-image-lsb by giving
> > > > > an error instead of just a warning.
> > > > > 
> > > > > Fixes [YOCTO #6073]
> > > > > 
> > > > > Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> > > > > ---
> > > > > 
> > > > >  meta/recipes-extended/images/core-image-lsb.bb | 4 +++-
> > > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/meta/recipes-extended/images/core-image-lsb.bb
> > > > > b/meta/recipes-extended/images/core-image-lsb.bb index
> > > > > ed316a6..ab61c6e
> > > > > 100644
> > > > > --- a/meta/recipes-extended/images/core-image-lsb.bb
> > > > > +++ b/meta/recipes-extended/images/core-image-lsb.bb
> > > > > @@ -9,4 +9,6 @@ IMAGE_INSTALL = "\
> > > > > 
> > > > >      packagegroup-core-lsb \
> > > > >      "
> > > > > 
> > > > > -inherit core-image
> > > > > +inherit core-image distro_features_check
> > > > > +
> > > > > +REQUIRED_DISTRO_FEATURES = "pam"
> > > > 
> > > > I have a feeling the autobuilder builds core-image-lsb in situations
> > > > where DISTRO=poky, although I could be wrong. Have you checked?
> > > 
> > > FWIW, all the -lsb buildsets are done with DISTRO=poky-lsb on the AB.
> > > Unfortuntely we do have one problematic build.
> > > So the answer to your question is: we don't have core-image-lsb builds
> > > with DISTRO=poky but we do have a lib64-core-image-lsb-sdk image built
> > > with DISTRO=poky and no pam in DISTRO_FEATURES, see the last build on
> > > nightly-multilib... :(
> > 
> > If we're doing this then we should be changing the autobuilder so it
> > doesn't. LSB images should not be built in non-LSB configuration.
> 
> I kind of disagree with that, the LSB image can take into account
> configuration in other parts of the system. If pam isn't configured, I'm
> not sure that should automatically make it completely unbuildable...

For other situations I would agree, but the fact that the image has "lsb" in 
its name will naturally lead users to assume that that the output will be 
something LSB-compliant, but if poky-lsb or some other similar distro 
configuration is not used to build it then it will not be. Building something 
that's almost-LSB but not quite but is still labelled LSB just dilutes the 
meaning of LSB, and therefore doesn't seem to me to be particularly desirable.

Since we can't just check if DISTRO is "poky-lsb", an alternative check would 
be to look for "linuxstdbase" in OVERRIDES since we ought to be able to rely 
upon that given usage within other recipes.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

