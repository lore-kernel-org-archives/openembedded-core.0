Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 218A96059F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 15:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489590074; x=1521126074;
	h=date:from:to:cc:subject:message-id:reply-to:references:
	mime-version:in-reply-to;
	bh=61KV1ySKqsqs6MuViNBrMfW/a2K9modm6CuMTOlXB2s=;
	b=L4SJIVMr/PBEN2wy34eGEelqLYDOoKiuFvNeT1kjc+iW+G+Z0lBMOiSe
	pFwGVBDjM2fs9eE4lYj3ZQEeG8IAIg==;
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2017 08:01:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,169,1486454400"; d="scan'208";a="67658941"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 15 Mar 2017 08:01:12 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 116ED2C8001;
	Wed, 15 Mar 2017 08:01:06 -0700 (PDT)
Date: Wed, 15 Mar 2017 16:47:04 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170315144704.GA7153@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20170308134349.GA16099@linux.intel.com>
	<a0d78645-9670-f3a1-cd9d-d66370e89ef9@phytec.de>
	<20170314171147.GA28498@linux.intel.com>
	<1489513785.6396.83.camel@intel.com>
	<20170314180644.GA22000@linux.intel.com>
	<1489562674.6396.89.camel@intel.com>
	<20170315125810.GA28986@linux.intel.com>
	<1489585158.6396.102.camel@intel.com>
	<1489585294.6396.104.camel@intel.com>
	<20170315140143.GA17397@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20170315140143.GA17397@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Gary Thomas <gary@mlbassoc.com>, openembedded-core@lists.openembedded.org
Subject: Re: Create more than one image with WIC
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
X-List-Received-Date: Wed, 15 Mar 2017 15:01:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 15, 2017 at 04:01:43PM +0200, Ed Bartosh wrote:
> On Wed, Mar 15, 2017 at 02:41:34PM +0100, Patrick Ohly wrote:
> > On Wed, 2017-03-15 at 14:39 +0100, Patrick Ohly wrote:
> > > On Wed, 2017-03-15 at 14:58 +0200, Ed Bartosh wrote:
> > > > Regarding do_rm_work. It should not touch rootfs directories, I believe.
> > > 
> 
> > It does, and it should by default because a rootfs can be quite large.
> > If it's not going to be reused in another recipe, then it is worthwhile
> > to remove it.
> This is true unless we're going to use wic as a stand-alone tool, which some
> people still do.
> 
> > I should add that RM_WORK_EXCLUDE_ITEMS += "rootfs" can be used in image
> > recipes which know that their rootfs is going to be needed elsewhere -
> > it's just not the default.
> 
> Isn't rootfs going to be rebuilt if one rootfs recipe depends on another one?

Here is an example of dependency I'm talking about:
wic-image-minimal can be built just fine with enabled rm_work.
Its .wks uses 2 rootfs: core-image-minimal and wic-image-minimal.

I didn't use any RM_WORK_EXCLUDE_ITEMS. I did specified dependency to
core-image-minimal in wic-image-minimal recipe:

# core-image-minimal is referenced in .wks, so we need its rootfs
# to be ready before our rootfs
do_rootfs[depends] += "core-image-minimal:do_image core-image-minimal:do_rootfs_wicenv"

Am I missing something here?

--
Regards,
Ed

