Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (unknown [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 28B7C6FAC4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 18:35:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 May 2014 11:35:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,921,1392192000"; d="scan'208";a="545669942"
Received: from unknown (HELO [10.255.12.174]) ([10.255.12.174])
	by fmsmga002.fm.intel.com with ESMTP; 27 May 2014 11:35:18 -0700
Message-ID: <5384DAE6.1030407@linux.intel.com>
Date: Tue, 27 May 2014 11:35:18 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Creating a machine specific recipe for config file
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
X-List-Received-Date: Tue, 27 May 2014 18:35:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Folks,

We have had an open enhancement in the form of bugzilla #4011 
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=4011).

I am currently working on this and want to get some feedback regarding 
the design, the below list of config files would move to one recipe in 
recipes-bsp, which will reduce the number of .bbappends that a BSP 
writer might need to create in order to customize the configuration of 
the BSP.

Overall, my proposal is to move all the BSP related config files into 
one recipe directory tree. Create a recipe that can have a package or 
packages that are RRECOMMENDS on.

We have 2 choices on the packaging side:

1) 1 Package to rule them all (conffiles)
   - RPROVIDES PN-conf
   - conffile.bbclass
       RRECOMMENDS = "${PN}-conf"
       # Can be overriden in recipe
       CONFFILES_conffiles ?= "${PN}.conf"
   - Will provide files not needed on final image, small
     amount of extra space used.

2) 1 package / conf file (${PN}-conf)
   - exactly what's needed will be installed
   - no needs for additional RPROVIDES
   - More packaging overhead, package data might be bigger than actual 
contents!

Currently the list of recipes/config files affected include:


meta/recipes-bsp/pointercal/pointercal/*/pointercal
meta/recipes-bsp/formfactor/files/*/machconfig
meta/recipes-bsp/alsa-state/alsa-state/asound.conf
meta/recipes-graphics/xorg-xserver/xserver-xf86-config/*/xorg.conf
meta/recipes-bsp/keymaps/files/keymap.sh
meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
meta/recipes-graphics/tslib/tslib/ts.conf


Possibly also:
meta/recipes-core/init-ifupdown/init-ifupdown-1.0
meta/recipes-connectivity/connman/connman-conf
meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf
meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd_proxy.conf

Comment, thoughts, ...

Thanks
-- 
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System


