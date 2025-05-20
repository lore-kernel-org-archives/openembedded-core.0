Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A2AC3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 06:45:40 +0000 (UTC)
Received: from h3.cmg1.smtp.forpsi.com (h3.cmg1.smtp.forpsi.com [185.129.138.162])
 by mx.groups.io with SMTP id smtpd.web11.15101.1747723528716820365
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 23:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=EvM2xwdG;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 185.129.138.162, mailfrom: andrej.v@skyrain.eu)
Received: from [172.25.231.43] ([85.248.43.180])
	by cmgsmtp with ESMTPSA
	id HGj7uPbpKwQNXHGj7u7aGE; Tue, 20 May 2025 08:45:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1747723526; bh=iPuGbv7pDSyYZaXiDTEecTN6PaSUBI38+0rK1lHOMKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=EvM2xwdGNAEpbjHHvs5RLeQUY3wfk1t7kVZNHOg7RIYKsLYdhpnDWNTKDC2yLRvdj
	 1YdEOdIpPqNx/xbg/40pcEnMYaGYO6LDecKdoPfwP29dOIYfoXo+FtiB47Druoda4N
	 5407lJr+7zkr+opMDIO9/77FJO5BAFQPfKN9yQrKQAcK/EDZUQvrCPFs2ZdLVQS4fO
	 KOtUsOBsgRbk5ne/Cl9yA0x+NwhHblpJY8PHU1wvmd8qtGEUE5PcK4Ol4IQsAeUY6j
	 W/2cFroaJzFUt/yeSNkMZn9zI8ByVzgxGEcu4mTI9w0nszJIsjaHRqYuRZikE7NX+h
	 GGBP3jRtDjL/g==
Message-ID: <406640d1-2b40-407e-a324-00110bfeec43@skyrain.eu>
Date: Tue, 20 May 2025 08:45:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] kernel-fitImage: allow overwrite the
 configuration dtb label
To: adrian.freihofer@siemens.com, "Oliver.Rohe@wago.com"
 <Oliver.Rohe@wago.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <DB4PR08MB8102C882795C5B8725105A0F9E93A@DB4PR08MB8102.eurprd08.prod.outlook.com>
 <f5080c649ce5d0f214dfdbb69a25449923b2948b.camel@siemens.com>
Content-Language: en-US
From: Andrej Valek <andrej.v@skyrain.eu>
In-Reply-To: <f5080c649ce5d0f214dfdbb69a25449923b2948b.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfLNxxk/eRo1ut3aN01PbiS3OcChB9u33ISli3ud4eqw65JamdG/BN5kllRiaHVycK/nL8gwHpn+0JCt18z2r2gkkm3bh5HLkaOSbVhDpBkdsp3h3eTgz
 a0Mq32yXznL3zgxKNzK4Wz905u7fel09kLxYpCuRhoJJTA1WO0EGqD/J2gum844Bh8s/2QFarvvycLOVMTHPrORbauSUvcUOqUwQcVgME91zmSpufaliD4ca
 Oo7CtQZtmDkgf/+XC4nU5OTHpOZ71+UmRLuIH5ueXZEMqyTGUV6VjPI02y0yA6D7
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 06:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216885

Hi guys,

I've just quickly looked at the code and when I see something like 
${variable} in bitbake, my control LED starts blinking. Please try to 
avoid using the ${ } for shell variables in bitbake' context.

Some day some developer creates a bitbake's variable like: dtb_img = 
"my-machine.dtb" and your function will be in troubles.

Just my 5cents.

Regards,
Andy

On 19.05.2025 19:05, Adrian Freihofer via lists.openembedded.org wrote:
> Hi Oliver
>
> On Fri, 2025-05-16 at 12:32 +0000, Oliver ROHE via
> lists.openembedded.org wrote:
>> This allows to provide a custom label for each dtb
>> without having to overwrite the whole function.
> There is also a patch-set pending which does a complete rewrite of this
> code in Python:
> https://lists.openembedded.org/g/openembedded-core/message/216836. I
> guess your change will potentially be simpler if it will would done in
> Python later on. What do you think?
>
> With the current implementation of the kernel-fitimage.bbclass many
> details are hard-coded to "one configuration node gets generated per
> dtb". Are you sure that we can change the labels without breaking other
> things here? What's your exact use case for this?
>
>> Signed-off-by: Oliver Rohe <oliver.rohe@wago.com>
>> ---
>>   meta/classes-recipe/kernel-fitimage.bbclass | 26 ++++++++++++++-----
>> --
>>   1 file changed, 18 insertions(+), 8 deletions(-)
>>
>> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass
>> b/meta/classes-recipe/kernel-fitimage.bbclass
>> index 07786647e1..f770d65087 100644
>> --- a/meta/classes-recipe/kernel-fitimage.bbclass
>> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
>> @@ -344,6 +344,15 @@ symlink_points_below() {
>>          echo "$realpath"
>>   }
>>
>> +#
>> +# Simple function to allow overwriting the configuration node label
>> +#
>> +# $1 ... DTB image name
>> +fitimage_emit_section_config_dtb_label() {
>> +       dtb_img="$1"
>> +       echo "${FIT_CONF_PREFIX}${dtb_img}"
>> +}
> The convention here is that functions starting with
> fitimage_emit_section_... emits a section. However, this function is
> just concatenating 2 variables.
>
> Thank you for the patch
> Adrian
>
>> +
>>   #
>>   # Emit the fitImage ITS configuration section
>>   #
>> @@ -404,7 +413,7 @@ fitimage_emit_section_config() {
>>          # conf node name is selected based on dtb ID if it is
>> present,
>>          # otherwise its selected based on kernel ID
>>          if [ -n "$dtb_image" ]; then
>> -               conf_node=$conf_node$dtb_image
>> +               conf_node=$(fitimage_emit_section_config_dtb_label
>> $dtb_image)
>>          else
>>                  conf_node=$conf_node$kernel_id
>>          fi
>> @@ -442,13 +451,14 @@ fitimage_emit_section_config() {
>>                  # default node is selected based on dtb ID if it is
>> present,
>>                  # otherwise its selected based on kernel ID
>>                  if [ -n "$dtb_image" ]; then
>> -                       # Select default node as user specified dtb
>> when
>> -                       # multiple dtb exists.
>> -                       if [ -n "$default_dtb_image" ]; then
>> -                               default_line="default =
>> \"${FIT_CONF_PREFIX}$default_dtb_image\";"
>> -                       else
>> -                               default_line="default =
>> \"${FIT_CONF_PREFIX}$dtb_image\";"
>> -                       fi
>> +                       # Select default node as user specified dtb
>> when
>> +                       # multiple dtb exists.
>> +                       if [ -n "$default_dtb_image" ]; then
>> +                               img=$default_dtb_image
>> +                       else
>> +                               img=$dtb_img
>> +                       fi
>> +                       default_line="default =
>> \"$(fitimage_emit_section_config_dtb_label $img)\";"
>>                  else
>>                          default_line="default =
>> \"${FIT_CONF_PREFIX}$kernel_id\";"
>>                  fi
>> --
>> 2.43.0
>>
>> Internal
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216864): https://lists.openembedded.org/g/openembedded-core/message/216864
> Mute This Topic: https://lists.openembedded.org/mt/113144105/3619876
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [andrej.v@skyrain.eu]
> -=-=-=-=-=-=-=-=-=-=-=-
>


