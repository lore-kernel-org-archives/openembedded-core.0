Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9D3866D88C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 05:02:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Nov 2013 20:58:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,750,1378882800"; d="scan'208";a="439661850"
Received: from unknown (HELO [10.255.15.203]) ([10.255.15.203])
	by orsmga002.jf.intel.com with ESMTP; 21 Nov 2013 21:02:07 -0800
Message-ID: <1385096527.3614.32.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: jhuang0 <jackie.huang@windriver.com>
Date: Thu, 21 Nov 2013 21:02:07 -0800
In-Reply-To: <528EE256.2030909@windriver.com>
References: <cover.1384854113.git.jackie.huang@windriver.com>
	<726632570b9d8a6bfcd88c5a411a6387f6869f91.1384854113.git.jackie.huang@windriver.com>
	<1385088300.3614.25.camel@dvhart-mobl4.amr.corp.intel.com>
	<528EE256.2030909@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] grub-efi: change to generate EFI image in target package
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
X-List-Received-Date: Fri, 22 Nov 2013 05:02:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-22 at 12:49 +0800, jhuang0 wrote:
> 
> On 11/22/2013 10:45 AM, Darren Hart wrote:
> > On Wed, 2013-11-20 at 09:40 +0800, jackie.huang@windriver.com wrote:
> >> From: Jackie Huang <jackie.huang@windriver.com>
> >>
> >> It's not a good idea to generate the target EFI image in
> >> a native packge,
> >
> > This was admittedly a hack when I wrote it...
> >
> >>   it would be a problem when build a 64bit
> >> target on 32bit host.
> >
> > I build 32b on a 64b host regularly, why is it a problem the other way
> > around?
> >
> > There is infrastructure in place to specify the target architecture for
> > the grub efi binary and the modules. The 32b compiler should be able to
> > do -m64 just as the 64b compiler can do -m32.
> 
> It should be, but for most 32bit linux distributions, gcc is not 
> compiled for supporting 64bit cross compiling.

Thanks for the detail - including this information in the justification
would be a good idea so anyone looking at the commit log can understand
why it was necessary.


> >> -do_install[noexec] = "1"
> >> -do_populate_sysroot[noexec] = "1"
> >> +FILES_${PN}-dbg += "${libdir}/${BPN}/${GRUB_TARGET}-efi/.debug"
> >
> > Technically this is an independent functional change...
> 
> You mean it should be in a separate commit?

I was thinking so, but I see Saul raised it as an issue with V2, so
please disregard this comment, it's fine.

I'd like to see a blurb added to the commit message stating the bit
about gcc not having support in some distributions (debian/ubuntu do
have it for example, but later versions require the compat package or
some such). The fact that some don't is enough though, and your solution
is cleaner and more consistent with bitbake recipe conventions anyway.

Thanks for keeping at it, this is a good improvement.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



