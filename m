Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F48C433FE
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 07:23:23 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.1842.1665127398761802945
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Oct 2022 00:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LdiZBqG0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 38FC4FF803;
	Fri,  7 Oct 2022 07:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665127396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gqyPY8NXjF43erqxHh6wEW0tJ0SHPcKUlr1YIuSlGO8=;
	b=LdiZBqG0g3l6kKbPHsKNx8/x6CFdiY9EbNcjwRUvTlZyy5pKI01DjjOr4ff7znWQUanp36
	fleDewQuKKllvSAMUc+dPSP7Pnbz4g77JQqtnSYNIA8ba9aKr+Q2Dv8iFcMA0/AqhMYPas
	w84wDwQL/N0Q83DvNNFmO/JQ73/kmQ1ve0+n4TG81C/S+Khvkitxe7MPhRDSTI49UWjQsg
	nqPz3qOltGqFsCAu4IQgMZPTffRz3IsoBcUgexp697/icptfu6O+rNc+ZFQkRosJp7HfWk
	oCSfgzB2GXdLNfvdiNucpc6rhKqSZKta3Lt2olEOCz37VRk6/ggs6owq37Unsg==
Message-ID: <9a8a5af4-1928-ffe0-2815-b9efd24c6bd5@bootlin.com>
Date: Fri, 7 Oct 2022 09:23:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: Pavel Zhukov <pavel.zhukov@huawei.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] dbus: Fix incorrect path for container sockets
Content-Language: en-US
To: sean.anderson@seco.com
References: <20221006210210.1744501-1-sean.anderson@seco.com>
 <e610bcc9-7ba5-5977-6548-b624ac9724c2@seco.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <e610bcc9-7ba5-5977-6548-b624ac9724c2@seco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Oct 2022 07:23:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171516

Hi Sean

On 06.10.22 23:03, Sean Anderson via lists.openembedded.org wrote:
>
> On 10/6/22 5:02 PM, Sean Anderson wrote:
>> I noticed the following warning from systemd-tmpfiles while booting:
>>
>>      /usr/lib/tmpfiles.d/dbus.conf:13: Line references path below legacy directory /var/run/, updating /var/run/dbus/containers
>>
>> The offending line [1] is
>>
>>      d @EXPANDED_RUNSTATEDIR@/dbus/containers 0755 @DBUS_USER@ - - -
>>
>> We do not set runstatedir, so it defaults to /var/run. Set runstatedir
>> to /run to avoid this problem.
>>
>> [1] https://gitlab.freedesktop.org/dbus/dbus/-/blob/master/bus/tmpfiles.d/dbus.conf.in#L13
>>
>> Fixes: 4df1a16e5c ("dbus: Specify runstatedir configure option")
>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>> ---
>>
>>   meta/recipes-core/dbus/dbus_1.14.0.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/dbus/dbus_1.14.0.bb b/meta/recipes-core/dbus/dbus_1.14.0.bb
>> index 0046b9fda2..9fb1f777bd 100644
>> --- a/meta/recipes-core/dbus/dbus_1.14.0.bb
>> +++ b/meta/recipes-core/dbus/dbus_1.14.0.bb
>> @@ -21,6 +21,7 @@ EXTRA_OECONF = "--disable-xml-docs \
>>                   --disable-doxygen-docs \
>>                   --enable-largefile \
>>                   --with-system-socket=/run/dbus/system_bus_socket \
>> +                --runstatedir=/run \
>>                   --enable-tests \
>>                   --enable-checks \
>>                   --enable-asserts \
>>
> oops, ignore this please
>
> I didn't read the patch I put in fixes >.>


There's also a problem with the way you send your patches. I used to 
have it too.

If I apply your patch through "git am", the author of the commit is:
Sean Anderson via lists.openembedded.org 
<sean.anderson=seco.com@lists.openembedded.org>
instead of
Sean Anderson <sean.anderson@seco.com>

Because of this issue, the maintainer has to manually fix this field 
when accepting your patch. Worse, if he doesn't catch this, that's 
harder to fix afterwards.

You should be able to fix this by running:

git config --global sendemail.from "sean.anderson@seco.com"

At least this worked for me. See 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_using_git-send-email

Don't hesitate to send a test e-mail to me first if you wish.

Thanks in advance
Michael.


-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


