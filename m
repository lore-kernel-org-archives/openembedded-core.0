Return-Path: <dvhart@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id D63C46D88C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 05:04:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 21 Nov 2013 21:04:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,750,1378882800"; d="scan'208";a="431921802"
Received: from unknown (HELO [10.255.15.203]) ([10.255.15.203])
	by fmsmga001.fm.intel.com with ESMTP; 21 Nov 2013 21:04:40 -0800
Message-ID: <1385096680.3614.35.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: jhuang0 <jackie.huang@windriver.com>
Date: Thu, 21 Nov 2013 21:04:40 -0800
In-Reply-To: <528ED172.3020702@windriver.com>
References: <cover.1384854113.git.jackie.huang@windriver.com>
	<60e1553243c2b4d99fcb18246b516c1b4e03e2e9.1384854113.git.jackie.huang@windriver.com>
	<1385088545.3614.28.camel@dvhart-mobl4.amr.corp.intel.com>
	<528ED172.3020702@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] grub-efi: allow compilation without large model support
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
X-List-Received-Date: Fri, 22 Nov 2013 05:04:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-22 at 11:37 +0800, jhuang0 wrote:
> 
> On 11/22/2013 10:49 AM, Darren Hart wrote:
> > On Wed, 2013-11-20 at 09:40 +0800, jackie.huang@windriver.com wrote:
> >> From: Jackie Huang <jackie.huang@windriver.com>
> >>
> >> -mcmodel=large is not supported by gcc with version lower
> >> than 4.4, but we don't need to use memory over 4GiB, so add
> >> a patch to allow compilation without large model support.
> >>
> >> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> >> ---
> >>   ...allow-a-compilation-without-mcmodel-large.patch | 69 ++++++++++++++++++++++
> >>   meta/recipes-bsp/grub/grub-efi_2.00.bb             |  1 +
> >>   2 files changed, 70 insertions(+)
> >>   create mode 100644 meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
> >>
> >> diff --git a/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch b/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
> >> new file mode 100644
> >> index 0000000..b2be74a
> >> --- /dev/null
> >> +++ b/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
> >> @@ -0,0 +1,69 @@
> >> +From 0cea0e4266214da1f11e812834f5d5c47a6e04e6 Mon Sep 17 00:00:00 2001
> >> +From: Jackie Huang <jackie.huang@windriver.com>
> >> +Date: Tue, 5 Nov 2013 07:23:32 -0500
> >> +Subject: [PATCH] Allow a compilation without -mcmodel=large
> >> +
> >> +* kern/efi/mm.c (grub_efi_allocate_pages): don't allocate >4GiB
> >> +  when compiled without -mcmodel=large
> >> +  (filter_memory_map): remove memory post 4 GiB when compiled
> >> +  without -mcmodel=large
> >> +* configure.ac: add -DMCMODEL_SMALL=1 to TARGET_CFLAGS when
> >> +  -mcmodel=large isn't supported
> >> +
> >> +Upstream-Status: Inappropriate [configuration]
> >
> > Nice try ;-) This is compatibility, not configuration. If grub-efi
> > maintainers refuse to accept the patch that's up to them, but we need to
> 
> Actually it's ported from old version of grub which means that they 
> allowed the comilation without large model support before, but not now. 
>  From the Changelog, it was added in 2009:
> 
> 2009-06-04  Vladimir Serbinenko  <phcoder@gmail.com>
> 
>          Allow a compilation without -mcmodel=large
> 
>          * kern/efi/mm.c (grub_efi_allocate_pages): don't allocate >4GiB
>          when compiled without -mcmodel=large
>          (filter_memory_map): remove memory post 4 GiB when compiled
>          without -mcmodel=large
>          * configure.ac: fail gracefully and add -DMCMODEL_SMALL=1 to
>          TARGET_CFLAGS when -mcmodel=large isn't supported
> 
> but it was removed in 2010:
> 2010-04-21  Vladimir Serbinenko  <phcoder@gmail.com>
> 
>          * configure.ac: Refuse to compile for x86_64-efi is mcmodel=large
>          is not supported.
> 
> So I think they may not accept this patch again.

It does appear to be a deliverate removale, fortunatley, you know
exactly who to Cc on the list now :-) It's worth shooting it off to the
list to see what they say. Either way, it is definitely not a
configuration patch.

--
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



