Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8CB9A618E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 04:02:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2020 20:02:32 -0800
X-IronPort-AV: E=Sophos;i="5.70,493,1574150400"; d="scan'208";a="238642449"
Received: from unknown (HELO [10.221.217.105]) ([10.221.217.105])
	by orsmga003-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	27 Feb 2020 20:02:31 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <20200227000603.14252-1-timothy.t.orling@linux.intel.com>
	<20200227000603.14252-4-timothy.t.orling@linux.intel.com>
	<2c3ea5cc-29e6-0ce6-f9b3-c720e835e363@intel.com>
Message-ID: <185c60c7-a44e-fe7c-b49e-7a95909e900b@intel.com>
Date: Fri, 28 Feb 2020 12:02:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2c3ea5cc-29e6-0ce6-f9b3-c720e835e363@intel.com>
Subject: Re: [PATCH 3/4] at-spi2-atk: upgrade 2.32.0 -> 2.34.1
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
X-List-Received-Date: Fri, 28 Feb 2020 04:02:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

It looks like this is failing on non musl as well:

https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/1617
https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/524

Thanks,

Anuj

On 28-Feb-20 11:54 AM, Anuj Mittal wrote:
> Hi Tim,
> 
> On 27-Feb-20 08:06 AM, Tim Orling wrote:
>> Release notes:
>> https://gitlab.gnome.org/GNOME/at-spi2-atk/-/raw/043b793de2161a0548835424f4d087ac90d1172d/NEWS 
>>
>>
>> License-Update: Changed to LGPL-2.1+
>>
>> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
>> ---
>>   .../atk/{at-spi2-atk_2.32.0.bb => at-spi2-atk_2.34.1.bb}  | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>   rename meta/recipes-support/atk/{at-spi2-atk_2.32.0.bb => 
>> at-spi2-atk_2.34.1.bb} (66%)
> 
> This is failing on musl-qemu86:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1623
> 
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: error: unknown field 
> ‘tv_sec’ specified in initializer
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: excess 
> elements in struct initializer [enabled by default]
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: (near 
> initialization for ‘timeout’) [enabled by default]
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: error: unknown field 
> ‘tv_nsec’ specified in initializer
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: excess 
> elements in struct initializer [enabled by default]
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: (near 
> initialization for ‘timeout’) [enabled by default]
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:19: error: storage size 
> of ‘timeout’ isn’t known
>     struct timespec timeout = { .tv_sec = 0, .tv_nsec = 10 * 1000000 };
>                     ^
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:90:5: warning: implicit 
> declaration of function ‘nanosleep’ [-Wimplicit-function-declaration]
>       nanosleep(&timeout, NULL);
>       ^
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c: In function ‘terminate_app’:
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: variable 
> ‘timeout’ has initializer but incomplete type
>     struct timespec timeout = { .tv_sec = 0, .tv_nsec = 10 * 1000000 };
>            ^
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: unknown field 
> ‘tv_sec’ specified in initializer
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: excess 
> elements in struct initializer [enabled by default]
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: (near 
> initialization for ‘timeout’) [enabled by default]
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: unknown field 
> ‘tv_nsec’ specified in initializer
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: excess 
> elements in struct initializer [enabled by default]
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: (near 
> initialization for ‘timeout’) [enabled by default]
> ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:19: error: storage size 
> of ‘timeout’ isn’t known
>     struct timespec timeout = { .tv_sec = 0, .tv_nsec = 10 * 1000000 };
> 

