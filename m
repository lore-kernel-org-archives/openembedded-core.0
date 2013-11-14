Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id ED1336D732
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 13:52:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Nov 2013 05:52:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,699,1378882800"; d="scan'208";a="433424009"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 14 Nov 2013 05:52:55 -0800
Date: Thu, 14 Nov 2013 15:52:54 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20131114135254.GB7503@lpalcu-linux>
References: <cover.1383742507.git.laurentiu.palcu@intel.com>
	<0dcafa1bce7a6ae871ee0f6b20eab8834860b334.1383742507.git.laurentiu.palcu@intel.com>
	<20131114124302.GA7503@lpalcu-linux>
	<1384435150.6460.124.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1384435150.6460.124.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/1] flex: fix m4 issue on target
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
X-List-Received-Date: Thu, 14 Nov 2013 13:52:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 14, 2013 at 01:19:10PM +0000, Richard Purdie wrote:
> On Thu, 2013-11-14 at 14:43 +0200, Laurentiu Palcu wrote:
> > Even though this was in the last C-pull, for some reason, it didn't end
> > up in master... Didn't see any comments on it either. Or maybe I missed
> > them...
> 
> In the target case, M4 should be compiled in as ${bindir}/m4 and there
> should be no need of a wrapper. Can someone confirm this is the case? Is
> the OEMAKE command only used for compilation and not built into the
> target?
The m4 variable set in EXTRA_OEMAKE is used to generate skel.c file. And, for
that, it needs the native m4. It does not end into the target. The path
set with ac_cv_path_M4=${M4} in EXTRA_OECONF ends into the target.

Laurentiu
> 
> Cheers,
> 
> Richard
> 
> 
> > Thanks,
> > Laurentiu
> > 
> > On Wed, Nov 06, 2013 at 03:07:58PM +0200, Laurentiu Palcu wrote:
> > > Flex needs m4 to run (see below) and, since the create_wrapper
> > > introduces a bash dependency on target, give the path to m4 binary in
> > > the configure command line.
> > > 
> > > Snippet from the flex documentation:
> > > "The macro processor m4 must be installed wherever flex is installed.
> > > <...>
> > > m4 is only required at the time you run flex."
> > > 
> > > [YOCTO #5329]
> > > 
> > > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> > > ---
> > >  meta/recipes-devtools/flex/flex.inc |    5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
> > > index 43f1dda..96d5de5 100644
> > > --- a/meta/recipes-devtools/flex/flex.inc
> > > +++ b/meta/recipes-devtools/flex/flex.inc
> > > @@ -13,6 +13,9 @@ inherit autotools gettext
> > >  M4 = "${bindir}/m4"
> > >  M4_class-native = "${STAGING_BINDIR_NATIVE}/m4"
> > >  
> > > +EXTRA_OECONF += "ac_cv_path_M4=${M4}"
> > > +EXTRA_OEMAKE += "m4=${STAGING_BINDIR_NATIVE}/m4"
> > > +
> > >  do_install_append_class-native() {
> > >  	create_wrapper ${D}/${bindir}/flex M4=${M4}
> > >  }
> > > @@ -20,3 +23,5 @@ do_install_append_class-native() {
> > >  do_install_append_class-nativesdk() {
> > >  	create_wrapper ${D}/${bindir}/flex M4=${M4}
> > >  }
> > > +
> > > +RDEPENDS_${PN} += "m4"
> > > -- 
> > > 1.7.9.5
> > > 
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > 
> 
> 

