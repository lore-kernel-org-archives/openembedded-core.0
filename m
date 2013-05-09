Received: from mail-pa0-f41.google.com ([209.85.220.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UaPrl-0002Mn-5x
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 14:22:33 +0200
Received: by mail-pa0-f41.google.com with SMTP id rl6so2080953pac.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2013 05:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=kyI2/HjazrSHIWQW9zOQsTGcgZ9VeM5MkcFRMn2PK3k=;
	b=QfWIKm0tNTp3wETuAnLXPDVU/3h0XVtHaNMDZAgOzULC+2Ch5h9aXMBpubar6wlFGg
	HbaFz3toI+aLQJPNrP7M4ycwri9R78oUaKnz8zwXO29HN5f2+LP3Fo4mZN52di5tmUpg
	lXYFbaW/NxISvSNqSuptJMjdkURx5LnvkiWYIsxQxRbi24ObJ7QVIQGkMIMtO4Xjy0PR
	Z78Q7okl8zkU5ukwWkndbGyKr6EgK3KIFSxKUt1mKCy/SPGLc2reEltFWAMdZvrJUBEX
	RpDSik7pLw075WqDH7R2ATUAF0DXMcswhQ6Nr3dZ1VIe197B22uRzQ2IQ1ex8Lz9PRoK
	ivBw==
X-Received: by 10.68.251.166 with SMTP id zl6mr12598533pbc.4.1368101068852;
	Thu, 09 May 2013 05:04:28 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id zo4sm2853554pbc.21.2013.05.09.05.04.26
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 09 May 2013 05:04:27 -0700 (PDT)
Message-ID: <518B8FB0.3000309@gmail.com>
Date: Thu, 09 May 2013 21:59:44 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <1368069844-13706-1-git-send-email-net147@gmail.com>
	<1368069844-13706-3-git-send-email-net147@gmail.com>
	<518B5F4F.8090707@windriver.com>
In-Reply-To: <518B5F4F.8090707@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] image-vmdk: Fix error recreating symbolic link
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
X-List-Received-Date: Thu, 09 May 2013 12:22:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 9/05/2013 6:33 PM, Robert Yang wrote:
>
>
> On 05/09/2013 11:24 AM, Jonathan Liu wrote:
>> If the vmdk image symbolic link already exists from a previous build,
>> overwrite it instead of returning an error.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>   meta/classes/image-vmdk.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/image-vmdk.bbclass 
>> b/meta/classes/image-vmdk.bbclass
>> index 6f7df3f..c225bed 100644
>> --- a/meta/classes/image-vmdk.bbclass
>> +++ b/meta/classes/image-vmdk.bbclass
>> @@ -18,8 +18,8 @@ inherit boot-directdisk
>>
>>   create_vmdk_image () {
>>       qemu-img convert -O vmdk 
>> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect 
>> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk
>> +    rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk
>>       ln -s ${IMAGE_NAME}.vmdk 
>> ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk
>
> How about "ln -sf", the '-f' will remove existing destination files.
>
> // Robert
Done.
>
>> -
>>   }
>>
>>   python do_vmdkimg() {
>>
Regards,
Jonathan


