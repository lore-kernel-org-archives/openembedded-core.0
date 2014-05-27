Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (unknown [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 03A0E605B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 20:38:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 May 2014 13:33:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,922,1392192000"; d="scan'208";a="518589149"
Received: from msegurah-mobl4.amr.corp.intel.com (HELO [10.254.42.19])
	([10.254.42.19])
	by orsmga001.jf.intel.com with ESMTP; 27 May 2014 13:38:34 -0700
User-Agent: Microsoft-MacOutlook/14.4.1.140326
Date: Tue, 27 May 2014 13:39:44 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>,
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Message-ID: <CFAA456E.93E2C%dvhart@linux.intel.com>
Thread-Topic: [OE-core] Creating a machine specific recipe for config file
References: <5384DAE6.1030407@linux.intel.com>
In-Reply-To: <5384DAE6.1030407@linux.intel.com>
Mime-version: 1.0
Subject: Re: Creating a machine specific recipe for config file
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
X-List-Received-Date: Tue, 27 May 2014 20:38:41 -0000
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

On 5/27/14, 11:35, "Saul Wold" <sgw@linux.intel.com> wrote:

>
>Folks,
>
>We have had an open enhancement in the form of bugzilla #4011
>(https://bugzilla.yoctoproject.org/show_bug.cgi?id=4011).
>
>I am currently working on this and want to get some feedback regarding
>the design, the below list of config files would move to one recipe in
>recipes-bsp, which will reduce the number of .bbappends that a BSP
>writer might need to create in order to customize the configuration of
>the BSP.
>
>Overall, my proposal is to move all the BSP related config files into
>one recipe directory tree. Create a recipe that can have a package or
>packages that are RRECOMMENDS on.
>
>We have 2 choices on the packaging side:
>
>1) 1 Package to rule them all (conffiles)
>   - RPROVIDES PN-conf
>   - conffile.bbclass
>       RRECOMMENDS = "${PN}-conf"
>       # Can be overriden in recipe
>       CONFFILES_conffiles ?= "${PN}.conf"
>   - Will provide files not needed on final image, small
>     amount of extra space used.
>
>2) 1 package / conf file (${PN}-conf)
>   - exactly what's needed will be installed
>   - no needs for additional RPROVIDES
>   - More packaging overhead, package data might be bigger than actual
>contents!

The status quo would suggest that Option 2 is more consistent with what
people expect of the build system. However, if we were to do this, one
might question why we should bother at all and not just leave it in the
hands of MACHINE-specific overrides for the packages we're configuring, as
is done today with alsa-state/asound.conf (for example).

What was your idea here - to replace the MACHINE-specific config for these
packages - or to augment it with an optional mega-config package?

I think it would help to provide a bit of background/motivation regarding
what exactly we're trying to accomplish with this. That would help me form
an opinion on 1 vs 2 anyway.

-- 
Darren Hart					Open Source Technology Center
darren.hart@intel.com				            Intel Corporation




