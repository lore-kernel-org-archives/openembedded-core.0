Return-Path: <amarnath.valluri@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7600271AC1
	for <Openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 21:08:30 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 02 Feb 2017 13:08:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,326,1477983600"; d="scan'208";a="816402835"
Received: from saudsley-mobl.ger.corp.intel.com (HELO avalluri-ubook)
	([10.252.0.20])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Feb 2017 13:08:29 -0800
Message-ID: <1486069831.2080.17.camel@intel.com>
From: Amarnath Valluri <amarnath.valluri@intel.com>
Reply-To: amarnath.valluri@intel.com
To: Jason Wessel <jason.wessel@windriver.com>
Date: Thu, 02 Feb 2017 23:10:31 +0200
In-Reply-To: <869ff8ea-8803-2751-3d2f-187eff4755b5@windriver.com>
References: <20170119211441.126457-1-jason.wessel@windriver.com>
	<20170119211441.126457-2-jason.wessel@windriver.com>
	<f97e0ddf-dd9d-06d3-831c-fa47349a1e66@windriver.com>
	<20170120132920.GA8341@mbabyjoh-desk.ger.corp.intel.com>
	<CAJTo0LaFMD3cFHR2d_1W4pM3cy7ekhM21UpBRz_Ec+C4tYigQQ@mail.gmail.com>
	<63d74901-4f7e-292f-8163-445006e226d2@windriver.com>
	<CAJTo0LZ+C=_cz3wdvtqmYJBrNHR-UBX9fasrg_T632G_u43itA@mail.gmail.com>
	<869ff8ea-8803-2751-3d2f-187eff4755b5@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] Revert "kernel: Modify kernel modules installation path."
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
X-List-Received-Date: Thu, 02 Feb 2017 21:08:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

I am very sorry, i couldn't respond earlier than this, somehow i missed
this thread :(

The motivation of these patches was achieving merged '/usr' in oe-core,
which demands no package installs anything into root(/bin, /sbin, /lib)
folders, and i see no exception for kernel modules/firmware(may be i am
wrong :!). In the real merged usr environment this shouldn't be a
problem as the root symlinks exists.

I guess i can resend these patches as part of 'usrmerge' feature patch
sequence, by keeping these changes behind DISTRO_FEATURES check:

- Amarnath


On Fri, 2017-01-20 at 08:04 -0600, Jason Wessel wrote:
> On 01/20/2017 07:52 AM, Burton, Ross wrote:
> 
> > 
> > On 20 January 2017 at 13:48, Jason Wessel
> > <jason.wessel@windriver.com> wrote:
> >         WARNING: linux-yocto-4.8.12+gitAUTOINC
> >         +3edb4de355_9bcb4ea3fa-r0 do_package: QA Issue: linux-yocto:
> >         Files/directories were installed but not shipped in any
> >         package:
> >           /lib64
> >           /lib/modules/4.8.17-yocto-standard/modules.builtin
> >           /lib64/firmware
> >           /lib64/firmware/cpia2
> >           /lib64/firmware/cpia2/stv0672_vp4.bin
> >         Please set FILES such that these items are packaged.
> >         Alternatively if they are unneeded, avoid installing them or
> >         delete them within do_install.
> >         linux-yocto: 5 installed and not shipped files.
> >         [installed-vs-shipped]
> >         
> > I suspect this is trivial with fresh eyes.  What multilib
> > configuration are you using?  My usual "test multilib" stanza is:
> > 
> > 
> > #require conf/multilib.conf
> > #MULTILIBS_x86-64 = "multilib:lib32"
> > #DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> > 
> > 
> > I'm guessing this isn't going to produce the same paths that you're
> > seeing problems with.
> > 
> > 
> > Ross
> 
> 
> It looks like it probably should. 
> 
> 
> MULTILIBS = "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> 
> 
> 
> If for some reason you wanted to perform the exact same build I have
> the instructions to do so:
> 
> https://github.com/WindRiver-OpenSourceLabs/wr-core/blob/master/docs/README-intel-x86.TXT
> 
> 
> That basically amounts to:
> 
> git clone -b master --recurse-submodules
> https://github.com/WindRiver-OpenSourceLabs/wr-core
> 
> cd wr-core
> 
> . init-intel-x86-env
> 
> 
> Jason. 
> 
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



