Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 033D460FA6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 02:15:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r942FHEb010671
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Oct 2013 19:15:17 -0700 (PDT)
Received: from [128.224.23.105] (128.224.23.105) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 3 Oct 2013 19:15:17 -0700
Message-ID: <524E24AE.5060009@windriver.com>
Date: Thu, 3 Oct 2013 22:15:10 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Originating-IP: [128.224.23.105]
Subject: DISTRO_FEATURES and world builds.
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
X-List-Received-Date: Fri, 04 Oct 2013 02:15:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Some world builds without the DFs: x11 or opengl fail unless
I run: bitbake -k world. Ideally packages would exclude themselves
from world builds if a required DF isn't set. Otherwise identifying
broken packages in bb world builds is not straight-forward. I can
add the DFs in to my world test builds but then I'm not really
exercising at least some of the recipes properly.

So....
What are the rules around DISTRO_FEATURES and bitbake world builds?
What testing has been done and which if any DFs are mandatory.


I copied the default DFs from
meta/conf/distro/include/default-distrovars.inc:
DISTRO_FEATURES_DEFAULT ?= \
"alsa argp bluetooth ext2 irda largefile pcmcia usbgadget \
  usbhost wifi xattr nfs zeroconf pci 3g nfc x11"

into my conf/local.conf file as:
DISTRO_FEATURES = \
"alsa argp bluetooth ext2 irda largefile pcmcia usbgadget \
usbhost wifi xattr nfs zeroconf pci 3g nfc x11"

and I if I do a bitbake world it fails with:


NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'virtual/libgl' (but
/home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-graphics/clutter/clutter-1.0_1.14.4.bb, 
/home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb, 
/home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-graphics/glew/glew_1.10.0.bb, 
/home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-qt/qt4/qt4-x11-free_4.8.5.bb, 
/home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-graphics/mesa/libglu_9.0.0.bb, 
/home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-graphics/cogl/cogl-1.0_1.14.0.bb 
DEPENDS on or otherwise requires it)
ERROR: mesa PROVIDES virtual/libgl but was skipped: missing required 
distro feature ['opengl'] (not in DISTRO_FEATURES)
ERROR: mesa-gl PROVIDES virtual/libgl but was skipped: missing required 
distro feature ['opengl'] (not in DISTRO_FEATURES)
ERROR: mesa PROVIDES virtual/libgl but was skipped: missing required 
distro feature ['opengl'] (not in DISTRO_FEATURES)
ERROR: Required build target 'clutter-gtk-1.0' has no buildable providers.
Missing or unbuildable dependency chain was: ['clutter-gtk-1.0', 
'clutter-1.0', 'virtual/libgl']



If I drop x11 from the DF list things are even worse.

I tried to sprinkle these recipes with:
    REQUIRED_DISTRO_FEATURES = "opengl"
but just as I thought, that didn't work either.

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

