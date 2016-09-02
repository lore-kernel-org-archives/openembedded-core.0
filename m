Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C9E0601D4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 01:24:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u821OLcX022523
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 1 Sep 2016 18:24:22 -0700
Received: from [128.224.162.177] (128.224.162.177) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 1 Sep 2016 18:24:21 -0700
To: Joshua Lock <joshua.g.lock@linux.intel.com>, "'Patches and discussions
	about the oe-core layer'" <openembedded-core@lists.openembedded.org>,
	<seebs@seebs.net>, Richard Purdie <richard.purdie@linuxfoundation.org>
References: <e33a2d23-6067-cf14-57ab-d40623a3597a@windriver.com>
	<1472656299.2904.4.camel@linux.intel.com>
From: wenzong fan <wenzong.fan@windriver.com>
Message-ID: <73742f7e-c691-0655-16b4-c60344272755@windriver.com>
Date: Fri, 2 Sep 2016 09:24:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1472656299.2904.4.camel@linux.intel.com>
Subject: Re: pseudo 1.8.1 doesn't work with docker & dumb-init
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
X-List-Received-Date: Fri, 02 Sep 2016 01:24:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/31/2016 11:11 PM, Joshua Lock wrote:
> On Wed, 2016-08-31 at 17:21 +0800, wenzong fan wrote:
>> Hi Experts,
>>
>> While I trying to build Yocto in Docker Container which using dumb-
>> init
>> as init system, I found the build always be stopped at some point
>> and
>> the container was terminated as well with below errors:
>>
>>      Child process timeout after 2 seconds.
>>      Child process exit status 4: lock_held
>>
>> Sometimes there's not any obvious error message.
>>
>> After some `git bisect` testing, I believe the issue was started
>> since
>> commit:
>>
>> ----------------------
>> 9df3cdf42d8c1216682f497f0b166a43ef9f4184 is the first bad commit
>> commit 9df3cdf42d8c1216682f497f0b166a43ef9f4184
>> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Date: Tue Jul 5 13:18:31 2016 +0100
>>
>>      pseudo: Upgrade to 1.8.1
>>
>>      * Drop patches where the changes exist upstream
>>      * Fetch from git as no tarball is available for 1.8.1
>>      * Move common code to pseudo.inc
>>      * Update patchset in git recipe
>>
>>      (From OE-Core rev: 0c36984d4c501d12fa91cf7371511641585cc256)
>> -----------------------
>>
>> Finally I narrowed it down to pseudo commit:
>>
>> ------------------------
>> commit 77ee254a6c974aad9bcab2c58c9ee9e0880c9718
>> Author: Peter Seebach <peter.seebach@windriver.com>
>> Date: Tue Mar 1 16:21:15 2016 -0600
>>
>>      Server launch reworking.
>>
>>      This is the big overhaul to have the server provide meaningful
>> exit
>> status
>>      to clients.
>>
>>      In the process, I discovered that the server was running with
>> signals blocked
>>      if launched by a client, which is not a good thing, and
>> prevented
>> this from
>>      working as intended.
>>
>>      Still looking to see why more than one server spawn seems to
>> happen.
>> ------------------------
>>
>> I also created a testcase for reproducing the issue at:
>>
>>      https://github.com/WenzongFan/docker-build-yocto
>
> Thanks for providing a detailed reproducer. I'm trying to configure a
> container behind my proxy here.
>
>>
>> For dumb-init please refer to:
>>
>>      https://github.com/Yelp/dumb-init
>>
>> Could anyone help to fix the signal handling in pseudo?
>
> It may not actually be pseudo at fault here. I've only skimmed the
> dumb-init README but it looks like there might be a strange interaction
> between the newly fixed signal handling in pseudo and dumb-init's
> signal handling.
>
> Should dumb-init be running in single-child/non-setsid mode so that
> signals are only forwarded to the direct child rather than all child
> processes in the dumb-init session? Is this a scenario you've tested?

Yes, I had try below options, but all of them don't work:

1) Run dumb-init with the -c flag: 
https://github.com/Yelp/dumb-init/issues/51 - single-child/non-setsid mode
2) Update dumb-init to latest version v1.1.3 (the release notes mention 
fixes for race conditions)
3) Switch to tini which an alterative to dumb-init: 
https://github.com/krallin/tini

Thanks
Wenzong

>
> Regards,
>
> Joshua
>
>

