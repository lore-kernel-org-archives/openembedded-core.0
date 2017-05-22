Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6FA6660778
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 07:42:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 22 May 2017 00:42:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,377,1491289200"; d="scan'208";a="1133337676"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 22 May 2017 00:42:25 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id CE53F6A4082;
	Mon, 22 May 2017 00:42:03 -0700 (PDT)
Date: Mon, 22 May 2017 10:19:35 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: "Wold, Saul" <saul.wold@intel.com>
Message-ID: <20170522071935.GA11250@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1495028624.git.ed.bartosh@linux.intel.com>
	<b852248822868b543e6bec8c4dbea6d43eb55f1b.1495028624.git.ed.bartosh@linux.intel.com>
	<1495234544.16942.222.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1495234544.16942.222.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 7/7] image_types_wic: schedule prepare_wic_build correctly
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
X-List-Received-Date: Mon, 22 May 2017 07:42:43 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, May 19, 2017 at 10:55:46PM +0000, Wold, Saul wrote:
> On Wed, 2017-05-17 at 13:47 +0000, Ed Bartosh wrote:
> > Scheduled prepare_wic_build only if wic build enabled.
> > Added dependencies to kernel and efi bootloader deploy
> > tasks only if EFI is enabled.
> > 
> > This should fix build failure on machines without
> > EFI functionality.
> > 
> > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > ---
> >  meta/classes/image_types_wic.bbclass | 27 ++++++++++++++----------
> > ---
> >  1 file changed, 14 insertions(+), 13 deletions(-)
> > 
> > diff --git a/meta/classes/image_types_wic.bbclass
> > b/meta/classes/image_types_wic.bbclass
> > index d8430e49ac..3b73261d5e 100644
> > --- a/meta/classes/image_types_wic.bbclass
> > +++ b/meta/classes/image_types_wic.bbclass
> > @@ -69,6 +69,11 @@ python () {
> >                  # file in process_wks_template as well, so just put
> > it in
> >                  # a variable and let the metadata deal with the
> > deps.
> >                  d.setVar('_WKS_TEMPLATE', body)
> > +
> > +        bb.build.addtask('do_prepare_wic_build', 'do_image_wic',
> > None, d)
> > +        if d.getVar('EFI_CLASS'):
> > +            d.appendVarFlag('do_prepare_wic_build', 'depends',
> > +                            '%s%s:do_deploy 
> > virtual/kernel:do_deploy' % (d.getVar('MLPREFIX'),
> > d.getVar('EFI_CLASS')))
> 
> Ed, 
> Have you tested this with any layers?
I tested it with poky layers as I do for all my patches.

> I tied recently with meta-
> intel and tripped over an issue with the rmc-boot not having an actual
> target for the EFI_CLASS to have a deploy task caused a failure.

I also tested it on qemuarm machine that doesn't support EFI. It worked just fine.

I'll try to test it with meta-intel. Can you provide more detailed
instructions how to reproduce this issue? Which image did you try to
build?

--
Regards,
Ed

