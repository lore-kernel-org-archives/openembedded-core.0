Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 34E3A6DB40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 12:52:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2SCqGSC008495
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 05:52:16 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 28 Mar 2014 05:52:16 -0700
Message-ID: <5335707F.7050105@windriver.com>
Date: Fri, 28 Mar 2014 08:52:15 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1395944068.git.bruce.ashfield@windriver.com>	
	<a047b35664364fc8577f758f70cd781b9d675bb1.1395944068.git.bruce.ashfield@windriver.com>
	<1395999939.24890.170.camel@ted>
In-Reply-To: <1395999939.24890.170.camel@ted>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 10/13] linux-yocto/3.14: introduce versioned recipes
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
X-List-Received-Date: Fri, 28 Mar 2014 12:52:19 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-03-28 05:45 AM, Richard Purdie wrote:
> On Thu, 2014-03-27 at 14:25 -0400, Bruce Ashfield wrote:
>> The release kernel for Yocto 1.5 is the 3.14 kernel, so we introduce
>> the versioned recipes here.
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>   meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb | 21 ++++++++++++
>>   meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 37 ++++++++++++++++++++++
>>   2 files changed, 58 insertions(+)
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.14.bb
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
>> new file mode 100644
>> index 000000000000..8faa9584acf0
>> --- /dev/null
>> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
>> @@ -0,0 +1,21 @@
>> +require recipes-kernel/linux/linux-yocto.inc
>> +
>> +KBRANCH = "standard/tiny/base"
>> +LINUX_KERNEL_TYPE = "tiny"
>> +KCONFIG_MODE = "--allnoconfig"
>> +
>> +LINUX_VERSION ?= "3.14-rc8"
>> +
>> +KMETA = "meta"
>> +
>> +SRCREV_machine ?= "fecc3fd7d31bd93766ff4f0431fecdbbfa4c3a7c"
>> +SRCREV_meta ?= "3689f99f4d2a051e8d3ff72345a67d4d04a88020"
>> +
>> +PV = "${LINUX_VERSION}+git${SRCPV}"
>
> I'm afraid we can't do this in such a simple way. The big issue is that
> according to our version comparison functions (in bitbake and in the
> package managers), "3.14-rc8" > "3.14". This will then break updates
> from package feeds.
>
> The traditional way we've worked around this in times gone by is the
> rather ugly:
>
> PV = "3.13+3.14-rc8+git${SRCPV}"
>
> since in this case "3.14" > "3.13+3.14-rc8"
>
> The better way to handle this would be "3.14~rc8" however not all of our
> package backends have support for "~" at this point so we can't do that.
> There is a long standing bug open about this.
>
> The same issue also applies to the libc-headers recipe.

eeee. Since I don't do package feeds, it's never been a problem for me.

Wouldn't PE bump when I go to 3.14 work as well ? Or does that go away
with the PR sever as well ?

I can muck with PV, or we can hold until Linus releases over the
weekend, and I go with the released PVs.

What's your preference ?

Bruce

>
> Cheers,
>
> Richard
>
>


