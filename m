Return-Path: <tom.pollard@codethink.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51CCFC433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 11:10:47 +0000 (UTC)
Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk
 [176.9.8.87])
 by mx.groups.io with SMTP id smtpd.web12.29683.1632741045703215153
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 04:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: codethink.co.uk, ip: 176.9.8.87, mailfrom: tom.pollard@codethink.co.uk)
Received: from cpc109023-salf6-2-0-cust777.10-2.cable.virginm.net
 ([82.29.243.10] helo=[192.168.0.15])
	by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1mUoWv-0002XF-Gz; Mon, 27 Sep 2021 12:10:41 +0100
Subject: Re: [OE-core] [PATCH] libsamplerate0: Set correct soname for 0.1.9
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20210924124757.86731-1-tom.pollard@codethink.co.uk>
 <a7ef7af8-6a70-4396-89c0-e84dc5d01a5b@gmail.com>
From: Tom Pollard <tom.pollard@codethink.co.uk>
Message-ID: <2433fb0b-99af-5c4f-7170-7fbe6f40dc75@codethink.co.uk>
Date: Mon, 27 Sep 2021 12:10:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a7ef7af8-6a70-4396-89c0-e84dc5d01a5b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 11:10:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156383

Hi Khem,

On 24/09/2021 17:15, Khem Raj wrote:
> 
> 
> On 9/24/21 5:47 AM, Tom Pollard wrote:
>> Manually patch SHARED_VERSION_INFO, which was missed in
>> the 0.1.9 release and later incorrectly fixed until 0.2.1
>>
>> Signed-off-by: Tom Pollard <tom.pollard@codethink.co.uk>
>> ---
>>   .../libsamplerate0/shared_version_info.patch        | 13 +++++++++++++
>>   .../libsamplerate/libsamplerate0_0.1.9.bb           |  1 +
>>   2 files changed, 14 insertions(+)
>>   create mode 100644 meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch
>>
>> diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch b/meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch
>> new file mode 100644
>> index 0000000000..b42d564b4b
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch
>> @@ -0,0 +1,13 @@
>> +Index: libsamplerate-0.1.8/configure.ac
>> +===================================================================
>> +--- libsamplerate-0.1.8.orig/configure.ac
>> ++++ libsamplerate-0.1.8/configure.ac
>> +@@ -53,7 +53,7 @@ AC_PROG_LN_S
>> + #  6. If any interfaces have been removed since the last public release, then set age
>> + #     to 0.
>> +
>> +-SHARED_VERSION_INFO="1:8:1"
>> ++SHARED_VERSION_INFO="1:9:1"
>> +
> 
> it can be synthesized from PV, that will be better, since we dont have 
> to change it manually everytime version upgrade is done.

This patch is only required for this specific 0.1.9 release, it was
incorrectly 'fixed' across a number of commits going into the following
release 0.2.0, which is marked as do not use because of the issue:

https://github.com/libsndfile/libsamplerate/releases/tag/0.2.0

Once the recipe is bumped to the next release 0.2.1 and thus targets
github releases it the patch be dropped.

> 
>> +
>> +
>> diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
>> index 6dfc42b436..8345d6880f 100644
>> --- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
>> +++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
>> @@ -10,6 +10,7 @@ PR = "r1"
>>   
>>   SRC_URI = "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz \
>>              file://0001-configure.ac-improve-alsa-handling.patch \
>> +           file://shared_version_info.patch \
>>   "
>>   
>>   SRC_URI[md5sum] = "2b78ae9fe63b36b9fbb6267fad93f259"
>>
>>
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#156333): https://lists.openembedded.org/g/openembedded-core/message/156333
>> Mute This Topic: https://lists.openembedded.org/mt/85838060/2167528
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tom.pollard@codethink.co.uk]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
https://www.codethink.co.uk/privacy.html

