Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7252C71979
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 13:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489583541; x=1521119541;
	h=date:from:to:cc:subject:message-id:reply-to:references:
	mime-version:in-reply-to;
	bh=deGoE9qkQdiMZEoFJU/57kJlSBlAhKs96k9VirvobIQ=;
	b=cl8VBsNt+tYBr/espPVuDzz3nbRXRCMoYpkI/U4pCAtDGZ71D0586Kcd
	j57KA22LVN++uxVx9yv35BBchILeXA==;
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2017 06:12:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,168,1486454400"; d="scan'208";a="1142567983"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2017 06:12:18 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 270CE2C8001;
	Wed, 15 Mar 2017 06:12:12 -0700 (PDT)
Date: Wed, 15 Mar 2017 14:58:10 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170315125810.GA28986@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <2791e915-9e22-a01a-ccb5-c629d250edb2@phytec.de>
	<20170308105729.GA22401@linux.intel.com>
	<7d4a770f-25c6-5747-5a5c-370c822f2efb@mlbassoc.com>
	<20170308134349.GA16099@linux.intel.com>
	<a0d78645-9670-f3a1-cd9d-d66370e89ef9@phytec.de>
	<20170314171147.GA28498@linux.intel.com>
	<1489513785.6396.83.camel@intel.com>
	<20170314180644.GA22000@linux.intel.com>
	<1489562674.6396.89.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1489562674.6396.89.camel@intel.com>
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
X-List-Received-Date: Wed, 15 Mar 2017 13:12:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 15, 2017 at 08:24:34AM +0100, Patrick Ohly wrote:
> On Tue, 2017-03-14 at 20:06 +0200, Ed Bartosh wrote:
> > On Tue, Mar 14, 2017 at 06:49:45PM +0100, Patrick Ohly wrote:
> > > 
> > > > It's not a big deal to run wic sequentially to produce multiple images,
> > > > but it will create more problems than it solves I believe. It will be slower and
> > > > will make a mess in image naming in deploy directory.
> > > 
> > > I personally would prefer to support generating more than one wic image
> > > per image recipe. The different output files could be distinguished with
> > > an additional suffix (".efi.wic", ".live.wiC", etc.) where the suffix is
> > > either specified by the WKS file or the configuration where the WKS file
> > > is selected - the latter might be a bit more flexible.
> > >
> > 
> > From my point of view ths would be against the current design of oe
> > image building susbsystem. It would be also more complex and slower
> > unless we'll find a way to dynamically generate multiple image creation
> > tasks per one recipe and run them in parallel. In this case it will be
> > even more complex.
> 
> That's a good point. However, directly sharing the content of the build
> directory from different recipes is also against the OE design and
> requires special attention, for example to suppressing the do_rootfs
> task in one recipe and preventing do_rm_work in the other.
> 
> Either way, something that works out of the box might be useful.

I'm going to address this in near future when I'll be working on
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10073
Feel free to comment on it, btw.

So far the plan is to treat EFI boot partition as a rootfs. wic job
would be to simply put content of multiple rootfs-es into partitions of
the final image. No suppressing of do_rootfs would be needed, I hope.

Regarding do_rm_work. It should not touch rootfs directories, I believe.

--
Regards,
Ed

