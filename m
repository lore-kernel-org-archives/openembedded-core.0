Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RQEVr-0006LI-Lh for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 09:37:03 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RQEPf-0007OZ-Ty for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 09:30:39 +0100
Received: from nat-rup.mentorg.com ([139.181.168.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 09:30:39 +0100
Received: from dbaryshkov by nat-rup.mentorg.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 09:30:39 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Tue, 15 Nov 2011 12:30:15 +0400
Message-ID: <4EC22317.1090109@gmail.com>
References: <cover.1320429060.git.paul.eggleton@linux.intel.com>
	<8ae5b3cd9ef609e444cc360e226f857685e2e254.1320429060.git.paul.eggleton@linux.intel.com>
	<E2FAFDF6-ABD2-4242-8BAC-8124ED2B1013@dominion.thruhere.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: nat-rup.mentorg.com
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:5.0) Gecko/20110807 Icedove/5.0
In-Reply-To: <E2FAFDF6-ABD2-4242-8BAC-8124ED2B1013@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 2/3] core-image-minimal-initramfs: force IMAGE_FSTYPES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Nov 2011 08:37:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2011 10:18 PM, Koen Kooi wrote:
>
> Op 4 nov. 2011, om 18:52 heeft Paul Eggleton het volgende geschreven:
>
>> If the user has set their own value for IMAGE_FSTYPES, they may have
>> disabled the cpio.gz image type, preventing the initramfs from being
>> produced in the format that image-live.bbclass expects; so force
>> IMAGE_FSTYPES to cpio.gz within the initramfs image recipe.
>>
>> Signed-off-by: Paul Eggleton<paul.eggleton@linux.intel.com>
>> ---
>> .../images/core-image-minimal-initramfs.bb         |    1 +
>> 1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
>> index 0bac27a..e4d0e51 100644
>> --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
>> +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
>> @@ -13,3 +13,4 @@ LICENSE = "MIT"
>> inherit core-image
>>
>> IMAGE_ROOTFS_SIZE = "8192"
>> +IMAGE_FSTYPES = "cpio.gz"
>
> _append or += would give less suprises.

This was merged as IMAGE_FSTYPES =+ "cpio.gz"
Now this brings problems if I have IMAGE_FSTYPES += "live" in my 
local.conf / BSP machine.conf.

1) OE tries to generate hddimg for this initramfs image, which is 
strange idea
2) If OE is trying to generate bootimg (hddimg) when the kernel is not 
yet deployed, building fails (as bootimg can't find a deployed kernel to 
put into hddimg).

Please revert this back to original patch as proposed by Paul.

-- 
With best wishes
Dmitry



