Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BCB006011A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 19:21:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Mar 2017 11:21:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,254,1484035200"; d="scan'208";a="1105428554"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 06 Mar 2017 11:21:06 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 591AD6A4080;
	Mon,  6 Mar 2017 11:21:03 -0800 (PST)
Date: Mon, 6 Mar 2017 21:07:28 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Message-ID: <20170306190728.GA19275@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20170223181309.13899-1-fabio.berton@ossystems.com.br>
	<CAJTo0LaFsWxaGy1Jwo9K92KTry+7Hyzn-MVHvMOpaqx+Q+qCGw@mail.gmail.com>
	<d2ccba14-ac14-1379-d5e1-ac799e9c120b@ossystems.com.br>
	<CAJTo0La=NDhfuMSYG3bjVYe2u6KA4TAZSNN_f1PyrsfVipoxBg@mail.gmail.com>
	<ccfcafd7-cd74-3330-2a64-ccd1e7a27984@ossystems.com.br>
	<20170306181327.GA18694@linux.intel.com>
	<bad2d5fb-ee7d-e32f-7f97-da988d126f0f@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <bad2d5fb-ee7d-e32f-7f97-da988d126f0f@ossystems.com.br>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: Prevent duplicate entries on fstab
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
X-List-Received-Date: Mon, 06 Mar 2017 19:21:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 06, 2017 at 03:48:00PM -0300, Fabio Berton wrote:
> Hi Ed,
> 
> The main motivation to my patch is prevent to duplicate entries. For
> example, if I add to my fstab line:
> 
> LABEL=data           /data                auto defaults              0  1
> 
> and add to wsk file:
> 
> part /data --ondisk mmcblk0 --fstype=ext4 --label data --align 8192
> --size 500M --extra-space 0
> 
> Final fstab will have two entries for /data.
This can be easily avoided if you remove leading slash:
part data --ondisk mmcblk0 --fstype=ext4 --label data --align 8192 --size 500M --extra-space 0


> 
> In most Linux distros mount /boot partition, if we have kernel image
> or boot script to update we need to mount /boot partition. Why the
> reason to not mount /boot?
>
The code that skips / and /boot was brought to wic codebase more than 4
years ago: https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=75c143a7aef46ecea07cf33edd2b1a0192e10149

I don't know exact reason to be honest. However, I think we need to be careful with this
kind of legacy. It doesn't mean we shouldn't remove it, but it should
not be done as a side effect of the patch addressing absolutely
different issue, I believe.

> >>>    For qemuarm machines I get the error:
> >>>
> >>>    | DEBUG: Executing python function set_image_size
> >>>    | DEBUG: Python function set_image_size finished
> >>>    | DEBUG: Executing shell function do_image_wic
> >>>    | Error: Please build syslinux first

Sorry, missed this. It looks like you're trying to use plugin that
depends on syslinux. For example, directdisk.wks uses bootimg-pcbios,
which uses syslinux. It's x86 specific and should not be used on arm.

--
Regards,
Ed

