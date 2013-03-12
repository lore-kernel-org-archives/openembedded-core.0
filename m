Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UFKAS-00005l-EB
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 09:02:40 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Mar 2013 00:46:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,829,1355126400"; d="scan'208";a="304518777"
Received: from lpalcu-linux.rb.intel.com (HELO [10.237.105.165])
	([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 12 Mar 2013 00:45:44 -0700
Message-ID: <513EDD27.1020707@intel.com>
Date: Tue, 12 Mar 2013 09:45:43 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1363018567.git.laurentiu.palcu@intel.com>
	<7ea1df1d417670be7f097ceed27280a30433926c.1363018567.git.laurentiu.palcu@intel.com>
	<513ED289.7070806@linux.intel.com>
In-Reply-To: <513ED289.7070806@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] xf86-video-vmware: delete references to xserver's mibstore.h
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Mar 2013 08:02:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/12/2013 09:00 AM, Saul Wold wrote:
> On 03/11/2013 09:27 AM, Laurentiu Palcu wrote:
>> mibstore.h has been deleted in the new xserver. Update the driver too.
>>
> There seemed to be an issue applying this patch.
> 
> Can you please verify this.
Yep, my bad... I forgot the '+' in SRC_URI. When I tested, I didn't do a
clean and the source code was already there, so the patch applied.

I'll send a v2 in a few moments.

Laurentiu
> 
> Thanks
> 	Sau!
> 
> 
>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>> ---
>>   .../xf86-video-vmware/Kill-mibstore.patch          |   63 ++++++++++++++++++++
>>   .../xorg-driver/xf86-video-vmware_13.0.0.bb        |    2 +
>>   2 files changed, 65 insertions(+)
>>   create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vmware/Kill-mibstore.patch
>>
>> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware/Kill-mibstore.patch b/meta/recipes-graphics/xorg-driver/xf86-video-vmware/Kill-mibstore.patch
>> new file mode 100644
>> index 0000000..e85a2ea
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware/Kill-mibstore.patch
>> @@ -0,0 +1,63 @@
>> +Upstream-Status: Backported
>> +
>> +From 23d87c92b7211cc5249eefe4ab3a2c7f370e279e Mon Sep 17 00:00:00 2001
>> +From: Zack Rusin <zackr@vmware.com>
>> +Date: Thu, 14 Feb 2013 14:33:01 -0800
>> +Subject: [PATCH] Kill mibstore
>> +
>> +It was a noop for at least 5 years and it has been removed.
>> +
>> +Signed-off-by: Zack Rusin <zackr@vmware.com>
>> +---
>> + saa/saa_priv.h         |    1 -
>> + src/vmware.c           |    2 --
>> + vmwgfx/vmwgfx_driver.c |    1 -
>> + 3 files changed, 4 deletions(-)
>> +
>> +diff --git a/saa/saa_priv.h b/saa/saa_priv.h
>> +index 6652054..5d81453 100644
>> +--- a/saa/saa_priv.h
>> ++++ b/saa/saa_priv.h
>> +@@ -48,7 +48,6 @@
>> + #include "pixmapstr.h"
>> + #include "windowstr.h"
>> + #include "servermd.h"
>> +-#include "mibstore.h"
>> + #include "colormapst.h"
>> + #include "gcstruct.h"
>> + #include "input.h"
>> +diff --git a/src/vmware.c b/src/vmware.c
>> +index 41201f1..6b74e14 100644
>> +--- a/src/vmware.c
>> ++++ b/src/vmware.c
>> +@@ -23,7 +23,6 @@ char rcsId_vmware[] =
>> + #include "xf86Pci.h"		/* pci */
>> +
>> + #include "mipointer.h"		/* sw cursor */
>> +-#include "mibstore.h"		/* backing store */
>> + #include "micmap.h"		/* mi color map */
>> + #include "vgaHW.h"		/* VGA hardware */
>> + #include "fb.h"
>> +@@ -1483,7 +1482,6 @@ VMWAREScreenInit(SCREEN_INIT_ARGS_DECL)
>> +      * If backing store is to be supported (as is usually the case),
>> +      * initialise it.
>> +      */
>> +-    miInitializeBackingStore(pScreen);
>> +     xf86SetBackingStore(pScreen);
>> +     xf86SetSilkenMouse(pScreen);
>> +
>> +diff --git a/vmwgfx/vmwgfx_driver.c b/vmwgfx/vmwgfx_driver.c
>> +index 9959ffb..7863ba2 100644
>> +--- a/vmwgfx/vmwgfx_driver.c
>> ++++ b/vmwgfx/vmwgfx_driver.c
>> +@@ -1036,7 +1036,6 @@ drv_screen_init(SCREEN_INIT_ARGS_DECL)
>> + 		   (ms->only_hw_presents) ? "enabled" : "disabled");
>> +     }
>> +
>> +-    miInitializeBackingStore(pScreen);
>> +     xf86SetBackingStore(pScreen);
>> +     xf86SetSilkenMouse(pScreen);
>> +     miDCInitialize(pScreen, xf86GetPointerScreenFuncs());
>> +--
>> +1.7.9.5
>> +
>> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.0.bb
>> index 4399bb1..1466b86 100644
>> --- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.0.bb
>> +++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.0.bb
>> @@ -6,6 +6,8 @@ DESCRIPTION = "vmware is an Xorg driver for VMware virtual video cards."
>>
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=5fcd7d437a959a15fbee8707747c6b53"
>>
>> +SRC_URI = "file://Kill-mibstore.patch"
>> +
>>   DEPENDS += "virtual/libx11 libxvmc drm glproto \
>>   	    virtual/libgl xineramaproto libpciaccess"
>>
>>


