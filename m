Return-Path: <net147@gmail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 69A526EFEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 09:01:57 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id rq2so16599096pbb.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 01:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=vP7xEUwrvB35vysBo0H97zkjinNnfiaCnUzucjtSjOE=;
	b=Elk2xYP+wj4gwmuLBnJmZczARHgwM5ooHxPYMGZteuWfTNPl4NYqmcr1lz0Ri681wy
	Am+W0ieP4P7EGnQmEI6OdWIRioBxYFHA8wkkY5CvOTN29H5CBxfqb3cOogy19ZVRqHw6
	l5Xk/NgSJWcb1pwmS3DEO8mjB72sBezh1Wkjon0N/xfouxo4XhK6koBAq/UYjFHulx3X
	LUZUeTDTDML7XOaRlMLJGprwIOO7IcnB2XpbxPQpXlbaVwZflVqsbAppQZjZqPDdX72B
	CB4FsqOhLn7JhmJCgxZbBVG6KooloIfS1wPKB4qdeoY5j0LV/KvtT0DGiEABiZQNQlVI
	vFXA==
X-Received: by 10.66.142.233 with SMTP id rz9mr31791886pab.71.1392714118471;
	Tue, 18 Feb 2014 01:01:58 -0800 (PST)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	y9sm137297843pas.10.2014.02.18.01.01.56 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Feb 2014 01:01:57 -0800 (PST)
Message-ID: <53032009.1030805@gmail.com>
Date: Tue, 18 Feb 2014 19:55:37 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1392633988-14208-1-git-send-email-net147@gmail.com>
	<1392712895.14081.197.camel@ted>
In-Reply-To: <1392712895.14081.197.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lib/oe/image.py: fix working directory
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
X-List-Received-Date: Tue, 18 Feb 2014 09:01:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/02/2014 7:41 PM, Richard Purdie wrote:
> On Mon, 2014-02-17 at 21:46 +1100, Jonathan Liu wrote:
>> The working directory needs to be changed before the image creation
>> commands instead of afterwards.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>   meta/lib/oe/image.py | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
>> index c15296f..31193f2 100644
>> --- a/meta/lib/oe/image.py
>> +++ b/meta/lib/oe/image.py
>> @@ -176,8 +176,8 @@ class Image(object):
>>               bb.data.update_data(localdata)
>>               localdata.setVar('type', type)
>>   
>> -            cmds.append("\t" + localdata.getVar("IMAGE_CMD", True))
>>               cmds.append(localdata.expand("\tcd ${DEPLOY_DIR_IMAGE}"))
>> +            cmds.append("\t" + localdata.getVar("IMAGE_CMD", True))
>>   
>>               if type in cimages:
>>                   for ctype in cimages[type]:
> I applied this but ended up reverting it since its clear the image
> commands assume a different working directory and this causes failures.
>
> I'd like to see more explanation about the problem this is trying to
> solve.
>
> Cheers,
>
> Richard
>
The sdimg image classes in meta-raspberrypi and meta-sunxi broke when I 
switched from dora to master branch.
See: 
https://github.com/djwillis/meta-raspberrypi/blob/master/classes/sdcard_image-rpi.bbclass#L43
It is using relative path to rootfs which assumes the working directory 
is DEPLOY_DIR_IMAGE.
I was able to build the SD card images fine after the fix.

Regards,
Jonathan

