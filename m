Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A6B7260249
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 15:45:17 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 06 Jan 2016 07:45:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,529,1444719600"; d="scan'208";a="24584555"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.151])
	([10.219.5.151])
	by fmsmga004.fm.intel.com with ESMTP; 06 Jan 2016 07:45:17 -0800
To: Tudor Florea <tudor.florea@enea.com>,
	openembedded-core@lists.openembedded.org
References: <1451932157-3190-1-git-send-email-anibal.limon@linux.intel.com>
	<568C5C24.5060601@enea.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <568D36EE.1070505@linux.intel.com>
Date: Wed, 6 Jan 2016 09:46:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <568C5C24.5060601@enea.com>
Cc: paul.eggleton@linux.intel.com, poky@yoctoproject.org,
	benjamin.esquivel@intel.com, georgex.l.musat@intel.com
Subject: Re: [PATCH v3 0/3] ptest-runner 2.0
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
X-List-Received-Date: Wed, 06 Jan 2016 15:45:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Todor,

Comments below,
	alimon


On 01/05/2016 06:13 PM, Tudor Florea wrote:
> Hi Anibal,
> Please see my comments inline.
> Regards,
>   Tudor.
> 
> On 04/01/2016 20:29, Aníbal Limón wrote:
>> The whole set is sent to two ML for reviewing purposes the first
>> two patches are for oe-core and the last one for poky.
>>
>> The first two commits (oe-core) adds a new ptest-runner written in
>> python the sh one is conserved to use in tiny systems.
>>
>> What's new in ptest runner:
>>
>> - Monitor/timeout stdout, stderr of the test suite to avoid block
>> indefinetly.
> This is definitely something useful.
>> - Add option for change ptest root directory. - Add option for list
>> available tests. - Add option for only run certain tests.
>>
>> The last commit (meta-yocto) sets ptest-runner to 1.0 in poky-tiny
>> systems due to python dependency.
> I think adding python dependency is a shift in a wrong direction for
> for ptest-runner. The assumption that most embedded devices (tiny or
> not) have python might not be correct.
> The alternative of using the old version of ptest-runner only
> complicate things.
> I do think this kind of work is really useful but this should be done
> into a testing framework that runs outside of the DUT.

The original problem is the current sh ptest-runner blocks indefinitely
when a package ptest blocks (we don't control this), now python-ptest is
blocking the ptest-runner, see [1]. The way to solve this is adding
timeout in some place.

I know that bash support timeout option but this option works over the
whole process making us to define timeouts too big or per machine/device
also tiny systems mainly don't use bash. That's the reason for i decide
to write python version of ptest-runner that applies a timeout over the
output of the program give us better control/granularity over the
running ptest.


If you now other way to solve the problem please tell us.


[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=8021


>>
>> The changes are available in the git repository at:
>>
>> git://git.yoctoproject.org/poky-contrib alimon/ptest-runner 
>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/ptest-runner
>>
>>  Aníbal Limón (3): ptest-runner: Add version 2.0 re-implementation
>> in python. ptest-runner: Add a recipe for install ptest-runner
>> 2.0. conf/distro/poky-tiny.conf: Add default install of
>> ptest-runner 1.0
>>
>> meta-yocto/conf/distro/poky-tiny.conf              |   4 + 
>> .../ptest-runner/files/ptest-runner_2.0.py         | 162
>> +++++++++++++++++++++ .../ptest-runner/ptest-runner_2.0.bb
>> |  27 ++++ 3 files changed, 193 insertions(+) create mode 100755
>> meta/recipes-support/ptest-runner/files/ptest-runner_2.0.py create
>> mode 100644 meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
>>

