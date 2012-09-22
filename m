Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TFOY3-000482-Cp
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 14:11:03 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Sep 2012 04:58:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,467,1344236400"; d="scan'208";a="210469385"
Received: from unknown (HELO helios.localnet) ([10.252.121.225])
	by orsmga002.jf.intel.com with ESMTP; 22 Sep 2012 04:58:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sat, 22 Sep 2012 12:58:15 +0100
Message-ID: <13626095.DW4eKnj4IV@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.1 (Linux/3.2.0-31-generic-pae; KDE/4.9.1; i686; ; )
In-Reply-To: <1348314953.10108.204.camel@ted>
References: <cover.1348245594.git.paul.eggleton@linux.intel.com>
	<12e61841995abb0cd1a96b334edc982c80a7d47f.1348245594.git.paul.eggleton@linux.intel.com>
	<1348314953.10108.204.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] classes/multilib: ensure MLPREFIX is set for image recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Sep 2012 12:11:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 22 September 2012 12:55:53 Richard Purdie wrote:
> On Fri, 2012-09-21 at 17:40 +0100, Paul Eggleton wrote:
> > We need MLPREFIX to be set so that oe.utils.prune_suffix() (as used for
> > the value of BPN) can derive the bare name from the multilib-extended
> > name for image recipes. BPN being set correctly avoids missing file
> > warnings during parse from the file checksum code for (unusual) images
> > that set SRC_URI, such as build-appliance-image.
> > 
> > First half of the fix for [YOCTO #3146].
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> > 
> >  meta/classes/multilib.bbclass |   14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> > 
> > diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
> > index b1a593e..25cf068 100644
> > --- a/meta/classes/multilib.bbclass
> > +++ b/meta/classes/multilib.bbclass
> > @@ -11,13 +11,17 @@ python multilib_virtclass_handler () {
> > 
> >      if bb.data.inherits_class('kernel', e.data) or 
bb.data.inherits_class('module-base', e.data):
> >          raise bb.parse.SkipPackage("We shouldn't have multilib variants
> >          for the kernel")> 
> > -    if bb.data.inherits_class('image', e.data):
> > -        e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
> > -        return
> > -
> > 
> >      if bb.data.inherits_class('native', e.data):
> >          raise bb.parse.SkipPackage("We can't extend native recipes")
> > 
> > +    # Set variables suitable for image recipes (as well as everything
> > else) +    e.data.setVar("MLPREFIX", variant + "-")
> > +    e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
> > +
> > +    if bb.data.inherits_class('image', e.data):
> > +        # We've set all we need to set for images here
> > +        return
> > +
> > 
> >      save_var_name=e.data.getVar("MULTILIB_SAVE_VARNAME", True) or ""
> >      
> >      for name in save_var_name.split():
> >          val=e.data.getVar(name, True)
> > 
> > @@ -29,8 +33,6 @@ python multilib_virtclass_handler () {
> > 
> >      override = ":virtclass-multilib-" + variant
> > 
> > -    e.data.setVar("MLPREFIX", variant + "-")
> > -    e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
> > 
> >      e.data.setVar("SHLIBSDIR_virtclass-multilib-" + variant
> >      ,e.data.getVar("SHLIBSDIR", False) + "/" + variant)>      
> >      if e.data.getVar("TARGET_VENDOR_virtclass-multilib-" + variant, 
False) is None:
> >  	    e.data.setVar("TARGET_VENDOR_virtclass-multilib-" + variant,
> >  	    e.data.getVar("TARGET_VENDOR", False) + "ml" + variant)
>
> We can't do this due to MULTILIB_SAVE_VARNAME which may then get
> influenced by the PN change. This is why the PN setting is duplicated,
> we probably need to just duplicate the MLPREFIX line too. Ugly but such
> is life :/

Oops. I'll send a v2 shortly.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


