Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 432B66D8A0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 19:06:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Mar 2014 12:06:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,687,1389772800"; d="scan'208";a="495317371"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.192])
	by fmsmga001.fm.intel.com with ESMTP; 19 Mar 2014 12:05:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Stefan Stanacar <stefanx.stanacar@intel.com>
Date: Wed, 19 Mar 2014 19:05:54 +0000
Message-ID: <10573578.XnzgTfVZqB@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.6-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <cover.1395069742.git.stefanx.stanacar@intel.com>
References: <cover.1395069742.git.stefanx.stanacar@intel.com>
MIME-Version: 1.0
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [RFC PATCH v2 0/3] Master image generation and testing
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
X-List-Received-Date: Wed, 19 Mar 2014 19:06:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Stefan,

On Monday 17 March 2014 17:42:13 Stefan Stanacar wrote:
> This is what I currently use for doing automated deployment
> for a genericx86-64 image. More details on the commit
> messages. There is nothing particular to genericx86-64,
> it should work on any EFI-enabled device with gummiboot as bootloader.
> 
> Changes since v2:
>   - droped the kernel options patch, the required options are now in the
> default config fragments. You still neeed to build with an updated SRCREV
> though, as the kernel recipes haven't picked up the changes yet.
> (SRCREV_meta_pn-linux-yocto = "${AUTOREV}" in local.conf)
>   - impove a bit the master image recipe (inherit core-image and add to
> IMAGE_INSTALL instead of overwriting IMAGE_INSTALL, that ensures we pick up
> the correct modules, as core-image brings in packagegroup-base-extended)
>   - tweaks and fixes for GenericEfi - I did a complete test run for a NUC
> device connected to a web power strip. The powercontrol command is an
> expect script that does ssh on a device which controls the power strip
> (this is particular to a network setup that I can't control). It still
> works for the no power command available case.
> 
> Also see YB#1596 and it's sub-bug #5614 for a bit of background.
> Any comments, questions, most welcome.
> 
> Cheers,
> Stefan
> 
> 
> Please review the following changes for suitability for inclusion. If you
> have any objections or suggestions for improvement, please respond to the
> patches. If you agree with the changes, please provide your Acked-by.
> 
> The following changes since commit 92155fde2079251739f455bca599a52cd21ef12b:
> 
>   bitbake: runqueue: Don't error if we never setup workers (2014-03-17
> 15:04:46 +0000)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib stefans/masterimage
>  
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stefans/masterimag
> e

Looks good. Some review comments:

* Is all of packagegroup-core-full-cmdline really needed for the master image 
or just some specific utilities that it pulls in?

* Could we have TEST_POWERCONTROL_EXTRA_ARGS so that TEST_POWERCONTROL_CMD can 
be set generically for the user's setup and extra machine-specific arguments 
(such as serial port numbers or other identifiers) can be set easily on a per-
machine basis if needed?

* I wonder if TEST_DEPLOY_CMDS should be lower-case since it would be most 
easily defined as a function i.e. testimage_deploy_cmds() { ... } than a 
traditional variable. (Reading it is exactly the same i.e. d.getVar().)

All of this seems generic enough that I think the better place for it would be 
OE-Core rather than meta-yocto-bsp. If you could apply these changes on top of 
OE-Core and send v3 to the OE-Core mailing list that would be great.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

