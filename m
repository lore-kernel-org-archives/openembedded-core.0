Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7EE53747FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 00:58:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9F0vaT1009603
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 14 Oct 2018 17:57:46 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 14 Oct 2018 17:57:25 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1539334497.git.kai.kang@windriver.com>
	<0c4bf43c1f51e38b1845b1b86b4513e95828d729.1539334497.git.kai.kang@windriver.com>
	<0c0def66080f069806c2197263eed086a36c008b.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <9da9fad9-38c1-a465-8154-ab1581b15e73@windriver.com>
Date: Mon, 15 Oct 2018 08:54:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <0c0def66080f069806c2197263eed086a36c008b.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/1] image_types_wic: set consistent staging dirs
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
X-List-Received-Date: Mon, 15 Oct 2018 00:58:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年10月12日 18:43, Richard Purdie wrote:
> On Fri, 2018-10-12 at 16:57 +0800, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> When build wic image with multilib enabled by following config:
>>
>>    MACHINE = "qemux86-64"
>>    require conf/multilib.conf
>>    MULTILIBS = "multilib:lib32"
>>    DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>>
>>    IMAGE_FSTYPES = "wic"
>>
>> it fails to build lib32 image such as lib32-core-image-minimal:
>>
>>> DEBUG: Executing shell function do_image_wic
>>> INFO: Creating image(s)...
>>>
>>> ERROR: Couldn't find correct bootimg_dir, exiting
>> Dependency syslinux is not expand to lib32-syslinux when multilib is
>> enabled. It is populated to ${WORKDIR}/recipe-sysroot, but script wic
>> searches syslinux in ${WORKDIR}/lib32-recipe-sysroot and causes
>> error.
>>
>> Set consistent staging dirs for wic to fix the issue.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/classes/image_types_wic.bbclass | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta/classes/image_types_wic.bbclass
>> b/meta/classes/image_types_wic.bbclass
>> index 5b40a9e919..402920805d 100644
>> --- a/meta/classes/image_types_wic.bbclass
>> +++ b/meta/classes/image_types_wic.bbclass
>> @@ -54,6 +54,11 @@ WKS_FILE_DEPENDS ??= "${WKS_FILE_DEPENDS_DEFAULT}
>> ${WKS_FILE_DEPENDS_BOOTLOADERS
>>   
>>   DEPENDS += "${@ '${WKS_FILE_DEPENDS}' if d.getVar('USING_WIC') else
>> '' }"
>>   
>> +# Dependency syslinux is not expanded when multilib is enabled,
>> consistent staging dirs are needed
>> +RECIPE_SYSROOT = "${WORKDIR}/recipe-sysroot"
>> +STAGING_DIR_HOST = "${WORKDIR}/recipe-sysroot"
>> +STAGING_DIR_TARGET = "${WORKDIR}/recipe-sysroot"
>> +
> Doesn't that change this for *all* image types? Not sure that is a good
> idea...

OK. I'll build and test all image types.

--Kai

>
> Cheers,
>
> Richard
>
>
>

-- 
Regards,
Neil | Kai Kang


