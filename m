Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id D382171BD0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 16:00:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 17 Oct 2016 09:00:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,357,1473145200"; d="scan'208";a="890830768"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.5.38])
	([10.219.5.38])
	by orsmga003.jf.intel.com with ESMTP; 17 Oct 2016 09:00:02 -0700
To: Joshua Lock <joshua.g.lock@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<88ed2fc1a30df53f6c94192966c00c5c41de3869.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<1476688132.2604.8.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <9db9997c-9e77-e545-859c-492e83057937@linux.intel.com>
Date: Mon, 17 Oct 2016 11:04:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1476688132.2604.8.camel@linux.intel.com>
Subject: Re: [PATCH 2/9] selftest: skip two bbtest tests depending on distro
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
X-List-Received-Date: Mon, 17 Oct 2016 16:00:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/17/2016 02:08 AM, Joshua Lock wrote:
> On Fri, 2016-10-14 at 11:40 -0500,
> leonardo.sandoval.gonzalez@linux.intel.com wrote:
>> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>>
>> There are two bbtests that just makes sense on certain distros:
>> test_bitbake_g cannot be done on poky-tiny and test_non_gplv3
>> just makes sense on poky and poky-tiny. Skip these when
>> necessary under the latter conditions.
>>
>> [YOCTO #8525]
>>
>> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.in
>> tel.com>
>> ---
>>   meta/lib/oeqa/selftest/bbtests.py | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/meta/lib/oeqa/selftest/bbtests.py
>> b/meta/lib/oeqa/selftest/bbtests.py
>> index baae1e0..9b11cd9 100644
>> --- a/meta/lib/oeqa/selftest/bbtests.py
>> +++ b/meta/lib/oeqa/selftest/bbtests.py
>> @@ -114,6 +114,9 @@ class BitbakeTests(oeSelfTest):
>>   
>>       @testcase(167)
>>       def test_bitbake_g(self):
>> +        if self.distro == 'poky-tiny':
>> +            self.skipTest('core-image-full-cmdline is not buildable
>> with poky-tiny')
>> +
> This test is still valid for poky-tiny, it's just that the image the
> test builds isn't buildable with poky-tiny, right?
>
> I think it would be better to change the test to a different, smaller,
> image that can also be built for poky-tiny (core-image-minimal?).
> We'd also need to change the target the test checks for the presence of
> in pn-buildlist.
Good idea. Which image and pn-buildlist package check do you suggest?

> Regards,
>
> Joshua
>
>>           result = bitbake('-g core-image-full-cmdline')
>>           for f in ['pn-buildlist', 'pn-depends.dot', 'package-
>> depends.dot', 'task-depends.dot']:
>>               self.addCleanup(os.remove, f)
>> @@ -229,6 +232,10 @@ INHERIT_remove = \"report-error\"
>>   
>>       @testcase(1119)
>>       def test_non_gplv3(self):
>> +        supported_distros = ['poky', 'poky-tiny']
>> +        if not self.distro in supported_distros:
>> +            self.skipTest('Test considers only %s distros' %
>> ','.join(supported_distros))
>> +
>>           data = 'INCOMPATIBLE_LICENSE = "GPLv3"'
>>           conf = os.path.join(self.builddir, 'conf/local.conf')
>>           ftools.append_file(conf ,data)
>> -- 
>> 2.1.4
>>


