Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UK8TD-00008q-Pm
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 15:33:58 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Mar 2013 07:16:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,905,1355126400"; d="scan'208";a="275621677"
Received: from lpalcu-linux.rb.intel.com (HELO [10.237.105.165])
	([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 25 Mar 2013 07:16:55 -0700
Message-ID: <51505C56.8040508@intel.com>
Date: Mon, 25 Mar 2013 16:16:54 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20130322170539.C5237504C8@opal> <20130325140816.GA7539@jama>
In-Reply-To: <20130325140816.GA7539@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Laurentiu Palcu : mesa: rename mesa-dri recipe to just mesa
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
X-List-Received-Date: Mon, 25 Mar 2013 14:33:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/25/2013 04:08 PM, Martin Jansa wrote:
> On Fri, Mar 22, 2013 at 05:05:39PM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: c8bbb9983bcc7cfc5332e89c3e8148505b4ca83f
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=c8bbb9983bcc7cfc5332e89c3e8148505b4ca83f
>>
>> Author: Laurentiu Palcu <laurentiu.palcu@intel.com>
>> Date:   Tue Mar 19 18:23:56 2013 +0200
>>
>> mesa: rename mesa-dri recipe to just mesa
>>
>> Rename mesa-dri recipes to just mesa. Also, replace all references to
>> mesa-dri in all recipes/configs.
>>
>> The reason for this renaming (quote from bugzilla):
>>
>> "mesa-dri is a artefact of mesa-xlib existing, which doesn't anymore.
>> mesa-dri should be renamed to mesa."
>>
>> [YOCTO #3385]
> 
> How is this supposed to work with incremental builds?
> 
> WARNING: The recipe mesa is trying to install files into a shared area
> when those files already exist. Those files and their manifest location
> are:
>    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libGLESv2.so
>    Matched in manifest-qemux86-64-mesa-dri
>    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgbm.la
>    Matched in manifest-qemux86-64-mesa-dri
>    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgbm.so.1.0.0
>    Matched in manifest-qemux86-64-mesa-dri
>    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libGLESv2.so.2.0.0
>    Matched in manifest-qemux86-64-mesa-dri
>    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libGLESv1_CM.so.1.1.0
>    Matched in manifest-qemux86-64-mesa-dri
>    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libGLESv1_CM.la
> .. and lot more ..
> 
> from what I remember this means, that old mesa-dri files will be kept in
> sysroot until I do build from scratch (or sstate-cache). That can be
> pretty bad when mesa is upgraded to some new version required by other
> components and my incremental sysroot will still keep old mesa-dri
> instead.
> 
> Yes, I can cleansstate mesa-dri before updating oe-core to include this
> commit or revert this commit to cleansstate and then remove revert..
> but that's not something average OE user will understand and do.

I understand your point here but, frankly, I have no clue how this could
have been avoided... Are there any means in oe-core that would allow
removing the old files from the sysroot?

Thanks,
Laurentiu


> 
>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> ---
>>
>>  meta/conf/distro/include/default-providers.inc     |    6 +++---
>>  meta/conf/machine/include/ia32-base.inc            |    4 ++--
>>  meta/conf/machine/include/qemu.inc                 |    8 ++++----
>>  meta/conf/machine/qemux86-64.conf                  |    8 ++++----
>>  meta/conf/machine/qemux86.conf                     |    8 ++++----
>>  meta/recipes-graphics/mesa/libglu_9.0.0.bb         |    2 +-
>>  meta/recipes-graphics/mesa/mesa-common.inc         |    5 +----
>>  meta/recipes-graphics/mesa/mesa-dri_git.bb         |    8 --------
>>  meta/recipes-graphics/mesa/mesa-git.inc            |    1 -
>>  .../mesa/{mesa-dri.inc => mesa.inc}                |   11 ++++++++---
>>  .../mesa/{mesa-dri_9.0.2.bb => mesa_9.0.2.bb}      |    2 +-
>>  meta/recipes-graphics/mesa/mesa_git.bb             |    7 +++++++
>>  meta/recipes-graphics/wayland/weston_1.0.3.bb      |    6 +++---
>>  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    2 +-
>>  14 files changed, 39 insertions(+), 39 deletions(-)
>>
>> Diff:   http://git.openembedded.org/?p=openembedded-core.git/?a=commitdiff;h=c8bbb9983bcc7cfc5332e89c3e8148505b4ca83f
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
> 


