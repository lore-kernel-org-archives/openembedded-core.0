Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qf3tY-0004uv-7Q
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 07:46:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Jul 2011 22:42:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,498,1304319600"; d="scan'208";a="24771741"
Received: from unknown (HELO [10.255.13.180]) ([10.255.13.180])
	by orsmga001.jf.intel.com with ESMTP; 07 Jul 2011 22:42:38 -0700
Message-ID: <4E1698CE.4070207@linux.intel.com>
Date: Thu, 07 Jul 2011 22:42:38 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1310081443.git.sgw@linux.intel.com>	<c55e57619344a0ddff4444e1a4403c9516089e5b.1310081443.git.sgw@linux.intel.com>
	<1310081883.20015.862.camel@rex>
In-Reply-To: <1310081883.20015.862.camel@rex>
Subject: Re: [PATCH 1/8] rootfs_rpm: Add 50Meg to image size for zypper
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
X-List-Received-Date: Fri, 08 Jul 2011 05:46:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/07/2011 04:38 PM, Richard Purdie wrote:
> On Thu, 2011-07-07 at 16:31 -0700, Saul Wold wrote:
>> [YOCTO #1171]
>>
>> Add /var space for zypper due to its space usage for db maintence
>
> This hasn't been tested for opkg/deb and is missing something like:
>
> ZYPPER_VAR_DB_SPACE ??= 0
>
> I'd suggest we just change this to append " + 51200" to
> IMAGE_ROOTFS_EXTRA_SPACE. I'd also like this only to happen when we're
> actually installing zypper so the minimal images are unaffected...
>
I can do the + 51200, but I have not figured out how to do the check for 
zypper, maybe it's something straight forward, but I am not finding a 
way to do it easily.

Sau!

> Cheers,
>
> Richard
>
>
>
>
>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>>   meta/classes/image_types.bbclass |    2 +-
>>   meta/classes/rootfs_rpm.bbclass  |    5 +++++
>>   2 files changed, 6 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
>> index 8c86227..505342d 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -13,7 +13,7 @@ def get_imagecmds(d):
>>
>>   runimagecmd () {
>>   	# Image generation code for image type ${type}
>> -	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = $1 * ${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_EXTRA_SPACE}; OFMT = "%.0f" ; print (size>  ${IMAGE_ROOTFS_SIZE} ? size : ${IMAGE_ROOTFS_SIZE}) }'`
>> +	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = $1 * ${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_EXTRA_SPACE} + ${ZYPPER_VAR_DB_SPACE}; OFMT = "%.0f" ; print (size>  ${IMAGE_ROOTFS_SIZE} ? size : ${IMAGE_ROOTFS_SIZE}) }'`
>>   	${cmd}
>>   	cd ${DEPLOY_DIR_IMAGE}/
>>   	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${type}
>> diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
>> index 3a11858..67c547f 100644
>> --- a/meta/classes/rootfs_rpm.bbclass
>> +++ b/meta/classes/rootfs_rpm.bbclass
>> @@ -3,6 +3,10 @@
>>   #
>>
>>   ROOTFS_PKGMANAGE = "rpm zypper"
>> +
>> +# Add 50Meg of extra space for zypper database space
>> +ZYPPER_VAR_DB_SPACE = "51200"
>> +
>>   # Postinstalls on device are handled within this class at present
>>   ROOTFS_PKGMANAGE_BOOTSTRAP = ""
>>
>> @@ -101,6 +105,7 @@ EOF
>>   	export IPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
>>   	export OPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
>>
>> +
>>   	${ROOTFS_POSTINSTALL_COMMAND}
>>
>>   	mkdir -p ${IMAGE_ROOTFS}/etc/rpm-postinsts/
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


