Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C384561116
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 17:09:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2VH3g9B019837; Mon, 31 Mar 2014 18:03:42 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ge-gs9017ZBW; Mon, 31 Mar 2014 18:03:42 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2VH3bb9019834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 31 Mar 2014 18:03:38 +0100
Message-ID: <1396285412.14790.83.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Mon, 31 Mar 2014 18:03:32 +0100
In-Reply-To: <2505811.xE1RLRgDA1@peggleto-mobl5.ger.corp.intel.com>
References: <cover.1396259433.git.cristian.iorga@intel.com>
	<1396259888.14790.58.camel@ted>
	<1396267153.6418.5.camel@firebird.rb.intel.com>
	<2505811.xE1RLRgDA1@peggleto-mobl5.ger.corp.intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Mon, 31 Mar 2014 17:09:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-03-31 at 13:18 +0100, Paul Eggleton wrote:
> On Monday 31 March 2014 11:58:49 Stanacar, StefanX wrote:
> > On Mon, 2014-03-31 at 10:58 +0100, Richard Purdie wrote:
> > > On Mon, 2014-03-31 at 12:51 +0300, Cristian Iorga wrote:
> > > > core-image-lsb only gave a warning:
> > > > "WARNING: Building libpam but 'pam' isn't in DISTRO_FEATURES,
> > > > PAM won't work correctly"
> > > > when the proper DISTRO was not set for it.
> > > > default choice would be DISTRO = "poky-lsb",
> > > > but not necessarily, depending on each custom distro.
> > > > 
> > > > This fix will enforce the proper usage of pam
> > > > as a distro feature for core-image-lsb by giving
> > > > an error instead of just a warning.
> > > > 
> > > > Fixes [YOCTO #6073]
> > > > 
> > > > Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> > > > ---
> > > > 
> > > >  meta/recipes-extended/images/core-image-lsb.bb | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/meta/recipes-extended/images/core-image-lsb.bb
> > > > b/meta/recipes-extended/images/core-image-lsb.bb index ed316a6..ab61c6e
> > > > 100644
> > > > --- a/meta/recipes-extended/images/core-image-lsb.bb
> > > > +++ b/meta/recipes-extended/images/core-image-lsb.bb
> > > > @@ -9,4 +9,6 @@ IMAGE_INSTALL = "\
> > > > 
> > > >      packagegroup-core-lsb \
> > > >      "
> > > > 
> > > > -inherit core-image
> > > > +inherit core-image distro_features_check
> > > > +
> > > > +REQUIRED_DISTRO_FEATURES = "pam"
> > > 
> > > I have a feeling the autobuilder builds core-image-lsb in situations
> > > where DISTRO=poky, although I could be wrong. Have you checked?
> > 
> > FWIW, all the -lsb buildsets are done with DISTRO=poky-lsb on the AB.
> > Unfortuntely we do have one problematic build.
> > So the answer to your question is: we don't have core-image-lsb builds
> > with DISTRO=poky but we do have a lib64-core-image-lsb-sdk image built
> > with DISTRO=poky and no pam in DISTRO_FEATURES, see the last build on
> > nightly-multilib... :(
> 
> If we're doing this then we should be changing the autobuilder so it doesn't. 
> LSB images should not be built in non-LSB configuration.

I kind of disagree with that, the LSB image can take into account
configuration in other parts of the system. If pam isn't configured, I'm
not sure that should automatically make it completely unbuildable...

Cheers,

Richard


