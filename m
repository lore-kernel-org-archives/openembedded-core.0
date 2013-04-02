Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UN98i-0004DG-2N
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 23:53:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r32LZxN0028072
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Apr 2013 14:35:59 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 2 Apr 2013 14:36:00 -0700
Message-ID: <515B4F3A.3070001@windriver.com>
Date: Tue, 2 Apr 2013 17:35:54 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <1364575688-19681-1-git-send-email-Chase.Maupin@ti.com>
	<515B455E.4030504@linux.intel.com>
In-Reply-To: <515B455E.4030504@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org,
	Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH] linux-dtb: Add simple DTB symlinks for devicetree
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
X-List-Received-Date: Tue, 02 Apr 2013 21:53:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-04-02 04:53 PM, Darren Hart wrote:
>
>
> On 03/29/2013 09:48 AM, Chase Maupin wrote:
>> * This is similar to the symlinks provided for the kernel image
>>    in the /boot directory of a file system.  The goal is to have
>>    simply named symlinks in /boot that mirror the device tree
>>    name in the kernel sources.  This is so that programs like
>>    U-Boot can easily find the default device tree binary in the
>>    /boot directory and use that when booting the kernel.
>> * Use update-alternatives to handle proper creation and removal
>>    of the symlinks.
>
> Hi Chase,
>
> So I have no experience myself with Device Tree. Adding Bruce A. for some
> additional review.

Let me dig up the entire thread and have a look later. gmail
helped me out and tagged this entire series as spam .. so I
didn't see any of it.

Cheers,

Bruce

>
> I am going to assume this is the right thing to do for u-boot systems.
> Which devices have you verified this as working with?
>
>>
>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> ---
>>   meta/recipes-kernel/linux/linux-dtb.inc |   20 ++++++++++++++++++++
>>   1 files changed, 20 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
>> index ec6c375..66cf255 100644
>> --- a/meta/recipes-kernel/linux/linux-dtb.inc
>> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
>> @@ -45,3 +45,23 @@ do_deploy_append() {
>>           done
>>       fi
>>   }
>> +
>> +pkg_postinst_kernel-devicetree () {
>
> Please use tabs for bash functions. Oddly, I see the only tabs in this
> file are in the anonymous python blocks. Doh.
>
>> +    cd /${KERNEL_IMAGEDEST}
>> +    for DTS_FILE in ${KERNEL_DEVICETREE}
>> +    do
>> +        DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
>> +        DTB_NAME="devicetree-uImage-${DTS_BASE_NAME}.dtb"
>
>
> Is "uImage" always correct here? Or should we be using
> ${KERNEL_IMAGETYPE} here?
>
>
>> +        update-alternatives --install /${KERNEL_IMAGEDEST}/${DTS_BASE_NAME}.dtb ${DTS_BASE_NAME}.dtb ${DTB_NAME} ${KERNEL_PRIORITY} || true
>> +    done
>> +}
>> +
>> +pkg_postrm_kernel-devicetree () {
>> +    cd /${KERNEL_IMAGEDEST}
>> +    for DTS_FILE in ${KERNEL_DEVICETREE}
>> +    do
>> +        DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
>> +        DTB_NAME="devicetree-uImage-${DTS_BASE_NAME}.dtb"
>> +        update-alternatives --remove ${DTS_BASE_NAME}.dtb ${DTB_NAME} ${KERNEL_PRIORITY} || true
>> +    done
>> +}
>>
>
> Thanks,
>



