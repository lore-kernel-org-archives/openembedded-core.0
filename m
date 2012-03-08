Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ken.werner@linaro.org>) id 1S5Z7A-0005T4-Jo
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 09:54:24 +0100
Received: by bkcjg15 with SMTP id jg15so149465bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Mar 2012 00:45:46 -0800 (PST)
Received: by 10.204.157.145 with SMTP id b17mr2457938bkx.112.1331196346568;
	Thu, 08 Mar 2012 00:45:46 -0800 (PST)
Received: from [9.152.213.70] (deibp9eh1--blueice3n2.emea.ibm.com.
	[195.212.29.180])
	by mx.google.com with ESMTPS id m3sm1740882bkz.0.2012.03.08.00.45.44
	(version=SSLv3 cipher=OTHER); Thu, 08 Mar 2012 00:45:45 -0800 (PST)
Message-ID: <4F5871B7.1070301@linaro.org>
Date: Thu, 08 Mar 2012 09:45:43 +0100
From: Ken Werner <ken.werner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120302 Thunderbird/11.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1330635344-27411-1-git-send-email-ken.werner@linaro.org>
	<4F5017E5.1020501@linux.intel.com> <4F508084.1010500@linaro.org>
In-Reply-To: <4F508084.1010500@linaro.org>
X-Gm-Message-State: ALoCoQlfZ8Z1/o28GBSwsCKsuCpuB/WSMOJLaSXWWEIyH83ZwmBLMoC7YBoo20BQJttmwn0C3ZB7
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
X-List-Received-Date: Thu, 08 Mar 2012 08:54:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/02/2012 09:10 AM, Ken Werner wrote:
> On 03/02/2012 01:44 AM, Saul Wold wrote:
>> On 03/01/2012 12:55 PM, Ken Werner wrote:
>>> Introduce a new variable called IMAGE_ROOTFS_ALIGNMENT that allows to
>>> control
>>> the aligment of the size of the rootfs. Its default value is set to
>>> 1KiB so
>>> that the existing behaviour is not changed. In case the SD card
>>> emulation of
>>> a QEMU system emulator gets used you may set the alignment to 2MiB.
>>> ---
>>> meta/classes/image_types.bbclass | 12 +++++++++++-
>>> 1 files changed, 11 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/meta/classes/image_types.bbclass
>>> b/meta/classes/image_types.bbclass
>>> index f756c39..314d6d1 100644
>>> --- a/meta/classes/image_types.bbclass
>>> +++ b/meta/classes/image_types.bbclass
>>> @@ -55,9 +55,19 @@ def get_imagecmds(d):
>>> cmds += "\n" + localdata.getVar("runimagecmd", True)
>>> return cmds
>>>
>>> +# The default aligment of the size of the rootfs is set to 1KiB. In
>>> case
>>> +# you're using the SD card emulation of a QEMU system simulator you may
>>> +# set this value to 2048 (2MiB alignment).
>>> +IMAGE_ROOTFS_ALIGNMENT ?= "1"
>>> +
>>> runimagecmd () {
>>> # Image generation code for image type ${type}
>>> - ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{base_size = ($1 *
>>> ${IMAGE_OVERHEAD_FACTOR}); OFMT = "%.0f" ; print ((base_size>
>>> ${IMAGE_ROOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) +
>>> ${IMAGE_ROOTFS_EXTRA_SPACE}) }'`
>>> + # The base_size gets calculated:
>>> + # - initial size determined by `du -ks` of the IMAGE_ROOTFS
>>> + # - then multiplied by the IMAGE_OVERHEAD_FACTOR
>>> + # - then rounded up to IMAGE_ROOTFS_ALIGNMENT
>>> + # - finally tested against IMAGE_ROOTFS_SIZE
>>> + ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{base_size = $1 *
>>> ${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_ALIGNMENT} - 1; base_size -=
>>> base_size % ${IMAGE_ROOTFS_ALIGNMENT}; print ((base_size>
>>> ${IMAGE_ROOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) +
>>> ${IMAGE_ROOTFS_EXTRA_SPACE}) }'`
>>> ${cmd}
>> Is there a reason you removed the OFMT from this line?
>
> Hi,
>
> Thanks for reviewing!
> I'm not too much into awk but I thought the fraction part of the result
> from the modulo operation equals the fraction part of the initial
> base_size. Since we subtract each other only the integer part remains.

Of course I'm happy to put the OFMT back in if it's desired. Just let me 
know and I'll provide and updated patch.

Regards,
Ken


