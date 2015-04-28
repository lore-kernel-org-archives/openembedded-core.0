Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C501C716CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 08:22:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 28 Apr 2015 01:22:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,662,1422950400"; d="scan'208";a="486578953"
Received: from pkcletus-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.230])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Apr 2015 01:22:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Marek Vasut <marex@denx.de>
Date: Tue, 28 Apr 2015 09:22:26 +0100
Message-ID: <14304962.9ToapJcVz6@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <201504280439.32255.marex@denx.de>
References: <1413746147-7120-1-git-send-email-marex@denx.de>
	<E8543342-2D6B-4707-810A-E88564881F20@dominion.thruhere.net>
	<201504280439.32255.marex@denx.de>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/7] kernel: Pull uImage generation into separate class
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
X-List-Received-Date: Tue, 28 Apr 2015 08:22:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Marek,

On Tuesday 28 April 2015 04:39:32 Marek Vasut wrote:
> On Monday, October 27, 2014 at 07:59:42 AM, Koen Kooi wrote:
> > > So uh, what exactly would you propose then? Ask the BSPs to cater for
> > > the
> > > change ? I don't quite like that option, since it's like breaking an API
> > > (or similar interface, I'm not sure what the local equivalent of that
> > > would be).
> > 
> > Personally, I'd try to keep the kernel_foo() methods the same since those
> > are very popular, a lot of BSPs append the configure one. So maybe
> > something like:
> > 
> > kernel.bbclass:
> > 	do_configure
> > 	do_install
> > 	addtask
> > 	etc
> > 	inherit kernel-${KERNEL_IMAGETYPE.bbclass}
> > 
> > kernel-${KERNEL_IMAGETYPE.bbclass}
> > 
> > 	do_install (overrides the one in kernel.bbclass)
> > 
> > Someone more familiar with bbclass method (re)naming and scoping should
> > weigh in on the method override above, but I think it should work.
> 
> I wonder, is it possible to inherit bbclass if it exists as a file and
> inherit nothing otherwise ?
> 
> In case I do:
> inherit kernel-${@d.getVar("KERNEL_IMAGETYPE", True).lower()}
> I get a nasty spit from bitbake in case I'm building with zImage
> KERNEL_IMAGETYPE . The reason is obvious, the file kernel-zimage.bbclass
> doesn't exist. So I wonder if there's some easy way to check if the class
> actually exists.

FYI, one way to handle this is to make the item being inherited an empty 
string if you don't want to inherit anything. You'd probably need to define a 
python function with def... and then call that from the inherit line.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

