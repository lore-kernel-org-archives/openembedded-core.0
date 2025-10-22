Return-Path: <jason.m.bills@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE33ACCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 13:46:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by mx.groups.io with SMTP id smtpd.web10.9856.1761140773861519742
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 06:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=arfs4Hvb;
 spf=pass (domain: linux.intel.com, ip: 192.198.163.16, mailfrom: jason.m.bills@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761140774; x=1792676774;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6jA7T16q4tVQMc02z8Pc//3xdxPxbVgGEFN+kxf+nqY=;
  b=arfs4Hvbps94Chjik2TTlrJV8ALf0hGGRiXO5F5lF50ylf64fqKsToVn
   x2du/LE8eon7+oEUJJitsvetVpnwrU9wHr6z4cs3TCpUmPTuBPeyr567i
   ADNAIVUXT4R0lncrcpvxUbtf0uk4ygMd3fC4WLLtHCMaxPVf5swgvwqAx
   ot5MP7gBGNTwSu+ATJ21WBCmk0MPUUdP1N7BuTy9IMeEax30PkRfSidb2
   inQg2NI1l28Va2ikyoaGr5Qpy1fZjMraAKBEQ+KxLlLa0FozYu1JB2QMb
   guGUdSyjvMlbqbm8w/JjOaLqoXAMKVeqCBNMtzpOElmca+aYRW+zxFHdH
   A==;
X-CSE-ConnectionGUID: +vvK98JKSBSc4xVU/06C3A==
X-CSE-MsgGUID: cUWbDCqNTW+9UiTEAj3ZCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50863516"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="50863516"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 06:46:14 -0700
X-CSE-ConnectionGUID: PeZKax8zS2CUM5qOz6/E+A==
X-CSE-MsgGUID: CeaR7R5gTLWeVOI3T8faww==
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 06:46:14 -0700
Received: from [10.124.122.91] (jmbills-mobl1.amr.corp.intel.com [10.124.122.91])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 42D3F20B5713;
	Wed, 22 Oct 2025 06:46:13 -0700 (PDT)
Message-ID: <53820a85-7956-44f5-9f00-4fa147c59511@linux.intel.com>
Date: Wed, 22 Oct 2025 07:46:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] systemd.bbclass: support template files with
 dots
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20251015145936.857490-1-jason.m.bills@linux.intel.com>
 <3FAF0AA8-5867-4822-9D3F-BFA43D40EA4C@arm.com>
Content-Language: en-US
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <3FAF0AA8-5867-4822-9D3F-BFA43D40EA4C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 13:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225195



On 10/22/2025 4:40 AM, Ross Burton wrote:
> On 15 Oct 2025, at 15:59, Bills, Jason M via lists.openembedded.org <jason.m.bills=linux.intel.com@lists.openembedded.org> wrote:
>>
>> If the SYSTEMD_SERVICE variable contains a template instance that has
>> dots in the name such as "xyz.openbmc_project.my@instance.service", the
>> regex splits on all the dots resulting in the following python
>> exception:
>>
>> Exception: ValueError: too many values to unpack (expected 3)
>>
>> To continue to support service files with dots in the name, this changes
>> to first split only on the '@' to isolate the name, then split the
>> second half on the dot to get the remaining two parameters.
>>
>> Confirmed when building that the three parameters for template instances
>> without dots came out the same and that template instances with dots
>> include the full name with dots in the first parameter.
>>
>> Signed-off-by: Jason M. Bills <jason.m.bills@linux.intel.com>
>> ---
>> meta/classes-recipe/systemd.bbclass | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
>> index 5a0550b287..fcd47809b2 100644
>> --- a/meta/classes-recipe/systemd.bbclass
>> +++ b/meta/classes-recipe/systemd.bbclass
>> @@ -247,7 +247,8 @@ python systemd_populate_packages() {
>>                  if not systemd_service_exists(service, user, d):
>>                      continue
>>                  if '@' in service and '@.' not in service:
>> -                    (servicename, instance, service_type) = re.split('[@.]', service)
>> +                    (servicename, postfix) = service.split('@')
>> +                    (instance, service_type) = postfix.split('.')
> 
> The assumption here is that the service name only contains a single dot and the instance isn’t something like foo.bar, right?  Are we certain that is the case?
> 
> Ross
> 

This splits first on the '@', so the assumption is the whole thing 
contains only one '@' and the service name can have many dots.  But the 
instance is assumed to have no dots which is currently the case in 
OpenBMC, but I don't know is guaranteed in systemd.

The documentation ([1]) isn't explicit, but assuming "instance name" 
allows the same characters as "unit name prefix", then it looks like 
it's possible.

I will rework the second split to split on the last dot to allow for the 
case where someone may use an instance with dots.

[1]: 
https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html

-Jason

