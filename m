Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3CFDF783DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 09:56:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBK9uCA2014695
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Dec 2017 01:56:12 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 20 Dec 2017 01:56:11 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Tom Rini
	<trini@konsulko.com>, Saul Wold <sgw@linux.intel.com>
References: <20171219201148.19828-1-sgw@linux.intel.com>
	<20171219205438.GN14220@bill-the-cat>
	<1513763468.16507.71.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <9c7c99a0-2876-d5d9-b8c8-f0c5cd5a53fc@windriver.com>
Date: Wed, 20 Dec 2017 17:55:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1513763468.16507.71.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image_types: preserve rootfs if mkext234fs() fails
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
X-List-Received-Date: Wed, 20 Dec 2017 09:56:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 12/20/2017 05:51 PM, Richard Purdie wrote:
> On Tue, 2017-12-19 at 15:54 -0500, Tom Rini wrote:
>> On Tue, Dec 19, 2017 at 12:11:48PM -0800, Saul Wold wrote:
>>>
>>> We have seen more failures, but have not been able to directly
>>> reproduce
>>> it maybe svaing the rootfs and it contains some content that is
>>> tripping
>>> up the e2fsprogs mkfs.ext4 populate_rootfs() function
>>>
>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>> ---
>>>   meta/classes/image_types.bbclass | 7 ++++++-
>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/image_types.bbclass
>>> b/meta/classes/image_types.bbclass
>>> index 9188bed4197..6b4f39ed274 100644
>>> --- a/meta/classes/image_types.bbclass
>>> +++ b/meta/classes/image_types.bbclass
>>> @@ -86,9 +86,14 @@ oe_mkext234fs () {
>>>   	bbdebug 1 Executing "dd if=/dev/zero
>>> of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype
>>> seek=$ROOTFS_SIZE count=$COUNT bs=1024"
>>>   	dd if=/dev/zero
>>> of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype
>>> seek=$ROOTFS_SIZE count=$COUNT bs=1024
>>>   	bbdebug 1 "Actual Rootfs size:  `du -s ${IMAGE_ROOTFS}`"
>>> -	bbdebug 1 "Actual Partion size: `ls -s
>>> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype`"
>>> +	bbdebug 1 "Actual Partion size: `ls -l
>>> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype`"
>>>   	bbdebug 1 Executing "mkfs.$fstype -F $extra_imagecmd
>>> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d
>>> ${IMAGE_ROOTFS}"
>>>   	mkfs.$fstype -F $extra_imagecmd
>>> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d
>>> ${IMAGE_ROOTFS}
>>> +	if [ $? -ne 0 ]; then
>>> +		tmp_saved_rootfs=`mktemp -d -p /tmp
>>> saved_rootfs.XXXXX`
>>> +		cp -r ${IMAGE_ROOTFS} $tmp_saved_rootfs
>>> +	fi
>> Wouldn't it be better to just fail on error here, rather than dump
>> stuff to /tmp ?
> 
> We have a problem with a recurring issue where the image generation
> code is failing in the eSDK selftests. The eSDK selftests run a
> completely separate build which then gets cleaned up. I'm not entirely
> sure the best way to handle this but that is why Saul is proposing
> this.
> 
> It may be an idea to detect the failing selftest and then stop the
> cleanup in that case. That is going to be fairly invasive on the

+1 on this, the cleanup makes the debug very hard when error happens.

// Robert

> selftest code though
> 
> I may just pull this into master-next (but not master) so at least if
> it fails there we have better debugging. We are struggling to get to
> the bottom of the issue :(.
> 
> Cheers,
> 
> Richard
> 
> 

