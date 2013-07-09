Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D075F608C6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 22:59:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Jul 2013 15:59:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1031,1363158000"; d="scan'208";a="367438662"
Received: from dvhart-mobl3.amr.corp.intel.com (HELO [10.7.199.52])
	([10.7.199.52])
	by orsmga002.jf.intel.com with ESMTP; 09 Jul 2013 15:59:39 -0700
Message-ID: <1373410775.3429.19.camel@envy.home>
From: Darren Hart <dvhart@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 09 Jul 2013 15:59:35 -0700
In-Reply-To: <51DC920E.1040305@linux.intel.com>
References: <e01e4656b562f087f270dc1134e7501c8f6b169b.1373408128.git.dvhart@linux.intel.com>
	<51DC920E.1040305@linux.intel.com>
Organization: Intel
X-Mailer: Evolution 3.8.3 (3.8.3-2.fc19) 
Mime-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] alsa-state: Provide an empty asound.conf by default
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
X-List-Received-Date: Tue, 09 Jul 2013 22:59:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-07-09 at 15:43 -0700, Saul Wold wrote:
> On 07/09/2013 03:15 PM, Darren Hart wrote:
> > An empty asound.conf should work for most cases. The existing asound.conf
> > uses plug dmix which causes arecord to fail without a special -D device
> > specification on the command line (as no capture device is defined).
> >
> > Clear asound.conf for the default case. Any needed changes should be
> > made in the BSP layers.
> >
> Does there need to be any corresponding change for the meta-yocto-bsps?

I don't believe so, but I have not built and tested every one. The old
one setup an alias "mixer0" to hardware card 0, which isn't necessary
for alsamixer to work and should be the default anyway.

I don't know what the motivation was to use dmix for the default pcm.
This was pulled in from open-embedded, which has a minimal commit
message:

commit bbc2776c0d955da7ec774ae934c541f33133f876
Author: Michael Lauer <mickey@vanille-media.de>
Date:   Thu Sep 13 01:10:23 2007 +0000

    alsa-state: ship standard asoundrc (simple dmix configuration)
    that should be a reasonable default for most devices

According to the alsa wiki, the asound.conf should not be required for
basic functionality:

http://www.alsa-project.org/main/index.php/Asoundrc

--
Darren

> 
> 
> Sau!
> 
> 
> > Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> > Cc: Koen Kooi <koen@dominion.thruhere.net>
> > ---
> >   meta/recipes-bsp/alsa-state/alsa-state/asound.conf | 13 +------------
> >   1 file changed, 1 insertion(+), 12 deletions(-)
> >
> > diff --git a/meta/recipes-bsp/alsa-state/alsa-state/asound.conf b/meta/recipes-bsp/alsa-state/alsa-state/asound.conf
> > index 6be0242..03653cf 100644
> > --- a/meta/recipes-bsp/alsa-state/alsa-state/asound.conf
> > +++ b/meta/recipes-bsp/alsa-state/alsa-state/asound.conf
> > @@ -1,12 +1 @@
> > -# default dmix configuration
> > -
> > -pcm.!default {
> > -    type plug
> > -    slave.pcm "dmix"
> > -}
> > -
> > -ctl.mixer0 {
> > -    type hw
> > -    card 0
> > -}
> > -
> > +# Global alsa-lib configuration
> >

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


