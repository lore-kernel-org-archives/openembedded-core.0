Return-Path: <anders.heimer@runbox.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED1FCCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 14:47:06 +0000 (UTC)
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
 by mx.groups.io with SMTP id smtpd.web11.11412.1761144418494564394
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 07:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@runbox.com header.s=selector1 header.b=DaVwTK1Q;
 spf=pass (domain: runbox.com, ip: 185.226.149.37, mailfrom: anders.heimer@runbox.com)
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <anders.heimer@runbox.com>)
	id 1vBa74-00EDcg-28; Wed, 22 Oct 2025 16:46:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=4R7s5x0tb/CN860kzK10txfa4GUL9w1fDsh2ZeWsCvI=; b=DaVwTK1QFuFYoQDocMVvpgXzHD
	GoNz3PltDp3LDfNn6zjZEox6rkvo0c1rKjsGksdGjMxlUyGb+TadnX3jvfwouI9q6tfQA0ZEnsXc+
	xu3Xe/tDrzJNwEVSIoxViy5oVNN1xVenPaUfrhV/bV7sSG557gfUvwPKQTzAJ/DJ8DGSHbKg4fQ+T
	+EXiUThBiqb0oxK//ZuMVWEx2k3XF94i3NT+DYPVZBMSSnIZ0vL+Q0b/oTgbFLKADIue2p+73JiM7
	Gnj1goibNZ4XqH0OSU2D8e4KhPEsGqvKXnObyKTel8t0QyUzkdI2KOiSgJW/an9DsP8SWiJyO3KXZ
	FOS0VFPQ==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <anders.heimer@runbox.com>)
	id 1vBa73-0006OF-9C; Wed, 22 Oct 2025 16:46:53 +0200
Received: by submission02.runbox with esmtpsa  [Authenticated ID (926809)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vBa6j-000g7C-5c; Wed, 22 Oct 2025 16:46:33 +0200
Message-ID: <406bd5ae-0bd5-439c-8eac-1433657f8605@runbox.com>
Date: Wed, 22 Oct 2025 16:46:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] libpam: mark CVE-2025-6018 as not applicable
To: peter.marko@siemens.com, Anders Heimer <anders.heimer@est.tech>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20251021135907.17684-1-anders.heimer@est.tech>
 <AS1PR10MB56975C5F92A56C6F1B7BF094FDF2A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Anders Heimer <anders.heimer@runbox.com>
In-Reply-To: <AS1PR10MB56975C5F92A56C6F1B7BF094FDF2A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 14:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225196

On 10/21/25 16:15, Peter Marko via lists.openembedded.org wrote:
> NVD shows following CPE for this CVE:
> cpe:2.3:a:suse:pam-config:1.1.8-24.71.1:*:*:*:*:*:*:*
>
> So we don't need to ignore it as it won't show up in Yocto CVE reports.
> Next time I'd search for obsolete CVE_STATUS entries I'd erase this commit.
> What's the reason for this patch?

Thanks for the clarification.

I agree, CVE-2025-6018 doesn’t hit Yocto’s libpam.

My patch came from our internal scanner flagging the CVE; it doesn’t use 
Yocto’s product mapping and raised a false positive.

Br, Anders
>
> What would be worth investigating is CVE-2024-10041 which is reported for libpam recipe.
> Unfortunately not reported on autobuilder as it's not using systemd+pam distro config.
>
> Peter
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Anders Heimer
>> Sent: Tuesday, October 21, 2025 15:59
>> To: openembedded-core@lists.openembedded.org
>> Cc: Anders Heimer <anders.heimer@est.tech>
>> Subject: [OE-core][PATCH] libpam: mark CVE-2025-6018 as not applicable
>>
>> CVE-2025-6018 is a local privilege escalation in PAM that requires
>> `user_readenv=1` to be enabled in the PAM configuration. The default
>> configuration does not enable reading user environment files (user_readenv
>> is 0 by default). Hence this vulnerability cannot be exploited using the
>> default configuration.
>>
>> Signed-off-by: Anders Heimer <anders.heimer@est.tech>
>> ---
>>   meta/recipes-extended/pam/libpam_1.7.1.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-extended/pam/libpam_1.7.1.bb b/meta/recipes-
>> extended/pam/libpam_1.7.1.bb
>> index 8d9ea27028..42b50a8c22 100644
>> --- a/meta/recipes-extended/pam/libpam_1.7.1.bb
>> +++ b/meta/recipes-extended/pam/libpam_1.7.1.bb
>> @@ -26,6 +26,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-
>> PAM-${PV}.tar.xz \
>>
>>   SRC_URI[sha256sum] =
>> "21dbcec6e01dd578f14789eac9024a18941e6f2702a05cf91b28c232eeb26ab0"
>>
>> +CVE_STATUS[CVE-2025-6018] = "not-applicable-config: Default PAM config
>> does not use user_readenv=1"
>> +
>>   DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
>>
>>   EXTRA_OEMESON = "-Ddocs=disabled -Dsecuredir=${base_libdir}/security"
>>
>> base-commit: 416731b8756cd2689055ada2deaff48c7751d3b9
>> --
>> 2.34.1
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225151): https://lists.openembedded.org/g/openembedded-core/message/225151
> Mute This Topic: https://lists.openembedded.org/mt/115873392/7170510
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [anders.heimer@runbox.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

