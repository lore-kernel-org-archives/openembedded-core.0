Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web11.14538.1598364862752114929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 07:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MBP-16.int.hatle.net ([76.164.61.197])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 07PEEDEM007865
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 25 Aug 2020 09:14:19 -0500
Subject: Re: [OE-core] [master][PATCH 4/5] package / packagedata bbclass: Change the way PRAUTO and AUTOINC are handled
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20200824232930.150388-1-mark.hatle@kernel.crashing.org>
 <20200824232930.150388-5-mark.hatle@kernel.crashing.org>
 <f80beeb723c0f891dd5727ba09ab28de79836ed5.camel@linuxfoundation.org>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <b5a59644-d00a-3374-2412-5e408e58a6a9@kernel.crashing.org>
Date: Tue, 25 Aug 2020 09:14:13 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <f80beeb723c0f891dd5727ba09ab28de79836ed5.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/25/20 5:56 AM, Richard Purdie wrote:
> On Mon, 2020-08-24 at 18:29 -0500, Mark Hatle wrote:
>> A related change was also needed for the kernel.bbclass.  The kernel
>>
>> needs to get the AUTOINC values used by the various PV/PKGV, but with
>> this new system we don't want to call auto_pr each time -- instead
>> call the read_subpackage_metadata to ensure a consistent result.
>>
>> This also fixes an issue in the old version where the kernel
>> sometimes
>> caused the PR to be incremented twice, as the auto_pr was called
>> multiple times from different tasks.
> 
> [...]
> 
>>
>> diff --git a/meta/classes/kernel.bbclass
>> b/meta/classes/kernel.bbclass
>> index e2ceb6a333..4449452065 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -416,7 +416,7 @@ kernel_do_install() {
>>  	install -d ${D}${sysconfdir}/modules-load.d
>>  	install -d ${D}${sysconfdir}/modprobe.d
>>  }
>> -do_install[prefuncs] += "package_get_auto_pr"
>> +do_install[prefuncs] += "read_subpackage_metadata"
>>  
>>  # Must be ran no earlier than after do_kernel_checkout or else
>> Makefile won't be in ${S}/Makefile
>>  do_kernel_version_sanity_check() {
>> @@ -749,7 +749,7 @@ kernel_do_deploy() {
>>  		done
>>  	fi
>>  }
>> -do_deploy[prefuncs] += "package_get_auto_pr"
>> +do_deploy[prefuncs] += "read_subpackage_metadata"
>>  
>>  addtask deploy after do_populate_sysroot do_packagedata
> 
> I don't think this can be right. I understand why the kernel was
> expanding these early but at this point do_package hasn't happened so
> reading the subpackage metadata is a null op at best and potentially
> changes a lot more in the data store.
> 
> I suspect this is not doing the right thing and will be something that
> comes back to bite us so we need something more careful here and I'd
> like to better understand exactly what change to the variables
> do_install and do_deploy need.

I don't know exactly why it's doing this.  But I believe it is so that the
PV/PKGV is expanded (AUTOINC translated).  I don't see any other reason for it
to be expanded in either do_install or do_deploy.

Best I can find is:

kernel-artifact-names.bbclass:KERNEL_ARTIFACT_NAME ?=
"${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"

(That is then used in other places.)

So the PKGV replacement is desired to be that early.

I'll look into it further.

--Mark

> Cheers,
> 
> Richard
> 
