Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TYuKN-0008TZ-He
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 08:57:35 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Nov 2012 23:43:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,255,1352102400"; d="scan'208";a="249411524"
Received: from lpalcu-linux (HELO [10.237.105.42]) ([10.237.105.42])
	by fmsmga002.fm.intel.com with ESMTP; 14 Nov 2012 23:43:37 -0800
Message-ID: <50A49D28.4060509@intel.com>
Date: Thu, 15 Nov 2012 09:43:36 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120912 Thunderbird/15.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1352884713.git.laurentiu.palcu@intel.com>
	<5467b530a59b1d698e8171b4a7c77104593dde40.1352884713.git.laurentiu.palcu@intel.com>
	<50A3C6B5.3050909@linux.intel.com>
In-Reply-To: <50A3C6B5.3050909@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 12/12] xf86-video-omapfb: upgrade to 0.4.2
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
X-List-Received-Date: Thu, 15 Nov 2012 07:57:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 11/14/2012 06:28 PM, Saul Wold wrote:
> On 11/14/2012 01:28 AM, Laurentiu Palcu wrote:
>> Other changes:
>>   * changed the recipe's SRC_URI to track the new (maintained) repo;
>>   * removed all old patches as the latest driver's structure has changed
>>     drastically;
>>   * license file changed quite a bit: MIT -> GPLv2 (needs to be reviewed
>>     by somebody with a better understanding of these things though);
>>   * xf86-video-omapfb changed its name to xf86-video-omap: change the
>>     recipe name acordingly;
>>   * add dependency of libdrm-omap;
>>
>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>> ---
>>   ...-video-omapfb_git.bb => xf86-video-omap_git.bb} |   27 ++++++++++----------
>>   1 file changed, 13 insertions(+), 14 deletions(-)
>>   rename meta/recipes-graphics/xorg-driver/{xf86-video-omapfb_git.bb => xf86-video-omap_git.bb} (43%)
>>
>> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
>> similarity index 43%
>> rename from meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
>> rename to meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
>> index f16441e..fec3365 100644
>> --- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
>> +++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
>> @@ -6,19 +6,18 @@ DESCRIPTION = "omapfb driver supports the basic Texas Instruments OMAP \
>>   framebuffer."
>>
>>   LICENSE = "MIT-X & GPLv2+"
> If the license changed to GPLv2, then why is MIT-X still listed, if the 
> MIT bits are gone the remove MIT here.
The v3 patchset had this already fixed.
> 
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=63e2cbac53863f60e2f43343fb34367f"
>> -DEPENDS += "virtual/libx11"
>> -
>> -SRCREV = "28c006c94e57ea71df11ec4fff79d7ffcfc4860f"
>> -PR = "${INC_PR}.6"
>> -PV = "0.1.1+gitr${SRCPV}"
>> -
>> -SRC_URI = "git://git.pingu.fi/xf86-video-omapfb;protocol=http \
>> -            file://omap-revert-set-CRTC-limit.patch \
>> -            file://omap-revert-set-virtual-size.patch \
>> -            file://omap-force-plain-mode.patch  \
>> -            file://omap-blacklist-tv-out.patch  \
>> -            file://0004-Attempt-to-fix-VRFB.patch \
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"
>> +DEPENDS += "virtual/libx11 libdrm-omap"
>> +
> Why did you move LIC_FILES_CHKSUM and DEPENDS down here, they were in 
> the correct location above.
I didn't move anything. It's probably because the create-pull-request
script did not give the right -M option to git format-patch. A -M10
would have shown the patch as expected.

Anyway, you can ignore that now. The v3 patchset leaves
xf86-video-omapfb in place. It just adds another recipe.

Laurentiu

> 
>> +RPROVIDES = "xf86-video-omapfb"
>> +RCONFLICTS = "xf86-video-omapfb"
>> +RREPLACES = "xf86-video-omapfb"
>> +
>> +SRCREV = "ae0394e687f1a77e966cf72f895da91840dffb8f"
>> +PR = "${INC_PR}.0"
>> +PV = "0.4.2+gitr${SRCPV}"
>> +
>> +SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-omap;protocol=git \
>>   "
>>
>>   S = "${WORKDIR}/git"
>> @@ -28,5 +27,5 @@ CFLAGS += " -I${STAGING_INCDIR}/xorg "
>>
>>   # Use overlay 2 on omap3 to enable other apps to use overlay 1 (e.g. dmai or omapfbplay)
>>   do_compile_prepend_armv7a () {
>> -        sed -i -e s:fb1:fb2:g ${S}/src/omapfb-xv.c
>> +        sed -i -e s:fb1:fb2:g ${S}/src/omap_xv.c
>>   }
>>


