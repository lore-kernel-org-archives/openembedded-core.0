Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ken.werner@linaro.org>) id 1S3Nht-0001it-1W
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 09:19:17 +0100
Received: by wibhq12 with SMTP id hq12so470049wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2012 00:10:46 -0800 (PST)
Received-SPF: pass (google.com: domain of ken.werner@linaro.org designates
	10.180.14.37 as permitted sender) client-ip=10.180.14.37; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of ken.werner@linaro.org
	designates 10.180.14.37 as permitted sender)
	smtp.mail=ken.werner@linaro.org
Received: from mr.google.com ([10.180.14.37])
	by 10.180.14.37 with SMTP id m5mr2658535wic.19.1330675846494 (num_hops
	= 1); Fri, 02 Mar 2012 00:10:46 -0800 (PST)
Received: by 10.180.14.37 with SMTP id m5mr2130671wic.19.1330675846438;
	Fri, 02 Mar 2012 00:10:46 -0800 (PST)
Received: from [9.152.213.70] (deibp9eh1--blueice3n2.emea.ibm.com.
	[195.212.29.180])
	by mx.google.com with ESMTPS id p10sm2221367wic.0.2012.03.02.00.10.45
	(version=SSLv3 cipher=OTHER); Fri, 02 Mar 2012 00:10:45 -0800 (PST)
Message-ID: <4F508084.1010500@linaro.org>
Date: Fri, 02 Mar 2012 09:10:44 +0100
From: Ken Werner <ken.werner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1330635344-27411-1-git-send-email-ken.werner@linaro.org>
	<4F5017E5.1020501@linux.intel.com>
In-Reply-To: <4F5017E5.1020501@linux.intel.com>
X-Gm-Message-State: ALoCoQnu/OvCMhXy4EP9CDzb7vulLB04dX8znwRBd6HIKoXCX1M6p/3YU+5aH95nIf2OnHfuAuQ5
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: add IMAGE_ROOTFS_ALIGNMENT
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
X-List-Received-Date: Fri, 02 Mar 2012 08:19:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/02/2012 01:44 AM, Saul Wold wrote:
> On 03/01/2012 12:55 PM, Ken Werner wrote:
>> Introduce a new variable called IMAGE_ROOTFS_ALIGNMENT that allows to
>> control
>> the aligment of the size of the rootfs. Its default value is set to
>> 1KiB so
>> that the existing behaviour is not changed. In case the SD card
>> emulation of
>> a QEMU system emulator gets used you may set the alignment to 2MiB.
>> ---
>> meta/classes/image_types.bbclass | 12 +++++++++++-
>> 1 files changed, 11 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/classes/image_types.bbclass
>> b/meta/classes/image_types.bbclass
>> index f756c39..314d6d1 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -55,9 +55,19 @@ def get_imagecmds(d):
>> cmds += "\n" + localdata.getVar("runimagecmd", True)
>> return cmds
>>
>> +# The default aligment of the size of the rootfs is set to 1KiB. In case
>> +# you're using the SD card emulation of a QEMU system simulator you may
>> +# set this value to 2048 (2MiB alignment).
>> +IMAGE_ROOTFS_ALIGNMENT ?= "1"
>> +
>> runimagecmd () {
>> # Image generation code for image type ${type}
>> - ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{base_size = ($1 *
>> ${IMAGE_OVERHEAD_FACTOR}); OFMT = "%.0f" ; print ((base_size>
>> ${IMAGE_ROOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) +
>> ${IMAGE_ROOTFS_EXTRA_SPACE}) }'`
>> + # The base_size gets calculated:
>> + # - initial size determined by `du -ks` of the IMAGE_ROOTFS
>> + # - then multiplied by the IMAGE_OVERHEAD_FACTOR
>> + # - then rounded up to IMAGE_ROOTFS_ALIGNMENT
>> + # - finally tested against IMAGE_ROOTFS_SIZE
>> + ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{base_size = $1 *
>> ${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_ALIGNMENT} - 1; base_size -=
>> base_size % ${IMAGE_ROOTFS_ALIGNMENT}; print ((base_size>
>> ${IMAGE_ROOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) +
>> ${IMAGE_ROOTFS_EXTRA_SPACE}) }'`
>> ${cmd}
> Is there a reason you removed the OFMT from this line?

Hi,

Thanks for reviewing!
I'm not too much into awk but I thought the fraction part of the result 
from the modulo operation equals the fraction part of the initial 
base_size. Since we subtract each other only the integer part remains.

Regards,
Ken

> Sau!
>> # Now create the needed compressed versions
>> cd ${DEPLOY_DIR_IMAGE}/



