Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0250679185
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 20:41:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7FKfGQh004217
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Aug 2018 13:41:17 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 15 Aug 2018 13:41:17 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Chen Qi
	<Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1534316428.git.Qi.Chen@windriver.com>
	<7d5cc9be5bd515a06b51069668934b39764c9687.1534316428.git.Qi.Chen@windriver.com>
	<ce03de9160c86123efd9a4623821028728de5f14.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <10581037-f7c0-11e4-66a1-0ffd31d56a6e@windriver.com>
Date: Wed, 15 Aug 2018 16:41:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <ce03de9160c86123efd9a4623821028728de5f14.camel@linuxfoundation.org>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH 1/1] glibc: re-package for libnss-db
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
X-List-Received-Date: Wed, 15 Aug 2018 20:41:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 08/15/2018 10:02 AM, Richard Purdie wrote:
> On Wed, 2018-08-15 at 15:00 +0800, Chen Qi wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> On other distros like ubuntu/centos, libnss-db usually provides:
>> - The libraries
>> - The Makefile to create database
>>    (in /var/db for centos, /var/lib/misc/ for ubuntu)
>> - The makedb command (it's in glibc-common for centos7)
>>
>> What we had is:
>> - The libraries are in glibc-extra-nss
>> - The Makefile is removed
>> - The makedb command is in glibc-utils (lack of dependency)
>>
>> So when glibc-extra-nss is installed but glibc-utils is not,
>> we see error like:
>> nscd[165]: 165 checking for monitored file `/var/db/group.db': No
>> such file or directory
>> nscd[165]: 165 checking for monitored file `/var/db/passwd.db': No
>> such file or directory
>>
>> And there is not an easy way to create these databases.
>>
>> To fix the issue:
>> - Re-package the libraries into libnss-db
>> - Don't remove the Makefile and add it in libnss-db
>> - Add RDEPENDS for libnss-db on glibc-utils and make
>>
>> Notes:
>> For external toolchain, an extra package 'libnss-db' need to be
>> provided
>> If replacing glibc from core.
>>
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-core/glibc/glibc-package.inc | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> This breaks on the autobuilder in oe-selftest:
> 
> 2018-08-15 13:09:15,551 - oe-selftest - INFO - ======================================================================


...

> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'make' (but /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/recipes-core/glibc/glibc_2.28.bb RDEPENDS on or otherwise requires it)
> make was skipped: it has an incompatible license: GPLv3 & LGPLv2
> NOTE: Runtime target 'make' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['make']
> ERROR: Required build target 'selftest-ed' has no buildable providers.
> Missing or unbuildable dependency chain was: ['selftest-ed', 'virtual/libc', 'make']
> 
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
> 
> https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/1281/steps/Running%20oe-selftest/logs/stdio
> 
> We really don't want a make dependency in glibc :(

Switching from RDEPENDS to RSUGGESTS  seems like a
reasonable solution. The GPLv2 build would work but
libnss-db would fail unless meta-gplv2 were used to
get an old version of make.

One way to avoid needing make is to demand that the bdb
files are generated during the build. That would be nice
but it shouldn't be a requirement since it's not the
typical workflow and since the db will usually be dynamic.

History and more details below.

../Randy

To support on target generation of the bdb files that
libnss-db uses then we need to:
  - separate the libnss-db files into a libnss-db pkg
  - *suggest* a 'make' as described below:

Back in January, Jackie had replied to:
    [OE-core] [PATCH 0/2 v2] glibc: fixes for nscd and libnss-db

with:

> Sorry, I didn't noticed that make is gplv3. I change the dependency to
> RSUGGESTS and the test passed:
> 
> $ oe-selftest -r bbtests.BitbakeTests.test_non_gplv3
> ...
> 2018-01-16 21:46:22,540 - oe-selftest - INFO - oe-selftest - OK - All required tests passed

but of course that papers over the failure by allowing the build to
pass even though runtime needs to include make to be able to
rebuild the db(s). And of course libnss-db isn't even being tested yet
so once we add that to oeqa, the test will fail for GPLv2-only images
where meta-gplv2 isn't added to the list of layers. I'm fine with
such oeqa failing when meta-gplv2 isn't around.


Qi, if no one comes up with a better idea,
please test that as well as:
   $ oe-selftest -r bbtests.BitbakeTests.test_non_gplv3
so that Richard doesn't burn another build cycle on it.

This isn't urgent but it would be nice to resolve the
issue properly for M3 without driving Richard around the bend!

Thanks,
../Randy


> 
> Cheers,
> 
> Richard
> 


-- 
# Randy MacLeod
# Wind River Linux

