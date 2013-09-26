Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A618B6CA7E
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 22:59:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8QMxZj4012694
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 26 Sep 2013 15:59:35 -0700 (PDT)
Received: from [172.25.32.36] (172.25.32.36) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 26 Sep 2013 15:59:34 -0700
Message-ID: <5244BC55.6030006@windriver.com>
Date: Thu, 26 Sep 2013 17:59:33 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <1380234850-27169-1-git-send-email-jason.wessel@windriver.com>
	<1380235504.32071.40.camel@dvhart-mobl4.amr.corp.intel.com>
In-Reply-To: <1380235504.32071.40.camel@dvhart-mobl4.amr.corp.intel.com>
X-Enigmail-Version: 1.5.2
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mkefidisk.sh: Allow using a loopback mounted file
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
X-List-Received-Date: Thu, 26 Sep 2013 22:59:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 09/26/2013 05:45 PM, Darren Hart wrote:
> On Thu, 2013-09-26 at 17:34 -0500, Jason Wessel wrote:
>> There is no reason not allow writing of direct boot disk images for
> Nit:                    ^ to
>
>> testing with simulators.  The easy way is to add loop back writing
>> capabilities.
>
> Just note here that the /dev/loop device has the same partition prefix
> as mmc devices and requires special mkfs arguments.
>
>> Example:
>>   qemu-img create -f raw bigdisk 4G
>>   dev=`sudo losetup -f`
>>   sudo losetup $dev bigdisk
>>   mkefidisk.sh $dev tmp-eglibc/deploy/images/qemux86/core-image-minimal-qemux86.hddimg /dev/sda
>>   sudo losetup -d $dev
>>
>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> ---
>>  scripts/contrib/mkefidisk.sh |    9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
>> index af06b4b..224a146 100755
>> --- a/scripts/contrib/mkefidisk.sh
>> +++ b/scripts/contrib/mkefidisk.sh
>> @@ -142,7 +142,7 @@ SWAP_START=$((ROOTFS_END))
>>  
>>  # MMC devices use a partition prefix character 'p'
>>  PART_PREFIX=""
>> -if [ ! "${DEVICE#/dev/mmcblk}" = "${DEVICE}" ]; then
>> +if [ ! "${DEVICE#/dev/mmcblk}" = "${DEVICE}" ] || [ ! "${TARGET_DEVICE#/dev/loop}" = "${DEVICE}" ]; then
> I think you meant to use "${DEVICE#/dev/loop}" here? Not TARGET_DEVICE?


Right you are.   It worked by accident eh?

I'll send another patch.

Jason.


>
> --
> Darren
>
>>  	PART_PREFIX="p"
>>  fi
>>  BOOTFS=$DEVICE${PART_PREFIX}1
>> @@ -197,7 +197,12 @@ unmount_device
>>  #
>>  echo ""
>>  echo "Formatting $BOOTFS as vfat..."
>> -mkfs.vfat $BOOTFS -n "efi"
>> +if [ ! "${DEVICE#/dev/loop}" = "${DEVICE}" ]; then
>> +	mkfs.vfat -I $BOOTFS -n "efi"
>> +else
>> +	mkfs.vfat $BOOTFS -n "efi"
>> +
>> +fi
>>  
>>  echo "Formatting $ROOTFS as ext3..."
>>  mkfs.ext3 $ROOTFS -L "root"


