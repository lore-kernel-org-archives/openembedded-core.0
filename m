Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C02C433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 09:18:46 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web12.9633.1642756725352760106
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 01:18:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 140331C0011;
	Fri, 21 Jan 2022 09:18:42 +0000 (UTC)
Cc: saul.wold@windriver.com
Subject: Re: [OE-core][PATCH] kernel: add missing path to search for debug
 files
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Andrej Valek <andrej.valek@siemens.com>,
 openembedded-core@lists.openembedded.org
References: <20220119115759.1390792-1-andrej.valek@siemens.com>
 <59f559e8a8f7a1ec6fccb9de63002c781cbe7acf.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <9d5cf8f9-e2db-0d25-4e6f-cab32111b0ee@bootlin.com>
Date: Fri, 21 Jan 2022 10:18:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <59f559e8a8f7a1ec6fccb9de63002c781cbe7acf.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 09:18:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160815


On 1/19/22 5:48 PM, Richard Purdie wrote:
> On Wed, 2022-01-19 at 12:57 +0100, Andrej Valek wrote:
>> Since explicit debug package creation via ${KERNEL_PACKAGE_NAME}-dbg has
>> been added to kernel, it has to cover all PACKAGE_DEBUG_SPLIT_STYLE
>> options. For ex. when the variable "debug-file-directory" package search
>> path has to be set explicitly, otherwise it will not find any files.
>>
>> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>> ---
>>  meta/classes/kernel.bbclass | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 473e28be47..9ea201c936 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -647,6 +647,7 @@ FILES:${KERNEL_PACKAGE_NAME}-image = ""
>>  FILES:${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>>  FILES:${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
>>  FILES:${KERNEL_PACKAGE_NAME}-modules = ""
>> +FILES:${KERNEL_PACKAGE_NAME}-dbg = "/usr/lib/debug /usr/src/debug"
> This seems to highlight that we have no tests for KERNEL_PACKAGE_NAME. At the
> very least we need a bugzilla entry for creating some...


Done: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14700
Cheers
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


