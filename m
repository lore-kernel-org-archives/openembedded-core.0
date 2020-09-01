Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web12.5832.1598993084315407600
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 13:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 081KiLMP026284
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 1 Sep 2020 15:44:29 -0500
Subject: Re: [OE-core] [master][PATCH v7 3/3] package.bbclass: hash equivalency and pr service
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20200827221237.143692-1-mark.hatle@kernel.crashing.org>
 <20200827221237.143692-4-mark.hatle@kernel.crashing.org>
 <4c41acd31147f3bce1424199f619692918cf8388.camel@linuxfoundation.org>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <7f5a116d-1f8d-f6b8-2b2c-c949a34e6a72@kernel.crashing.org>
Date: Tue, 1 Sep 2020 15:44:15 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <4c41acd31147f3bce1424199f619692918cf8388.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/28/20 1:05 AM, Richard Purdie wrote:
> On Thu, 2020-08-27 at 17:12 -0500, Mark Hatle wrote:
>> When the PR service is enabled a number of small changes may happen
>> to variables.  In the do_package step a call to package_get_auto_pr
>> will end up setting PRAUTO and modifying PKGV (if AUTOINC is there).
>>
>> PRAUTO is then used by EXTENDPRAUTO, which is then used to generate
>> PKGR.
>>
>> Since this behavior typically happens BEFORE the BB_UNIHASH is
>> calculated for do_package, we need a way to defer the expansion
>> until after we have the unihash value.
>>
>> Writing out the pkgdata files w/o AUTOPR and PKGV (AUTOINC) expanded
>> to placeholder values is the easiest way to deal with this.  All
>> other
>> variables are expanded as expected.
>>
>> In the next task, typically do_packagedata, we will then use the
>> UNIHASH from the do_package to get the PR (AUTOPR) as well as
>> generate the AUTOINC replacement value (now PRSERV_PV_AUTOINC).
>>
>> The do_packagedata then translates the placeholders to the final
>> values
>> when copying the data from pkgdata to pkgdata-pdata-input.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
>> ---
>>  meta/classes/package.bbclass | 58 +++++++++++++++++++++++++++++++---
>> --
>>  meta/conf/bitbake.conf       |  1 +
>>  2 files changed, 51 insertions(+), 8 deletions(-)
> 
> This looked ok in testing apart from:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/1289
> (and similar)
> 
> which should reproduce with:
> 
> oe-selftest -r prservice.BitbakePrTests
> 
> basically the PRServ tests need updating to match the code changes.

I see the error in the logs, but I'm not able to reproduce this.  No errors are
reported on my system.  I added some additional debugging and I'm seeing that
it's reading from

.../tmp-glibc/pkgdata/qemux86-64/runtime/m4

This is the correct one, as it should have the complete value of PKGR as it was
the one transferred by do_packagedata.

Is there a standard way to keep the temp files around so that I can see what the
values actually are?

--Mark

> Cheers,
> 
> Richard
> 
> 
> 
> 
