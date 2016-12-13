Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 3742671B58
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 13:58:00 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 13 Dec 2016 05:58:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,341,1477983600"; d="scan'208";a="202076381"
Received: from mlopezva-mobl.amr.corp.intel.com (HELO [10.254.191.171])
	([10.254.191.171])
	by fmsmga004.fm.intel.com with ESMTP; 13 Dec 2016 05:58:00 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Robert Yang <liezhi.yang@windriver.com>
References: <cover.1479363545.git.liezhi.yang@windriver.com>
	<61246658fe264929d272f4da2f681e0fb95f9809.1479363545.git.liezhi.yang@windriver.com>
	<3281082.n0HP4LhUSl@peggleto-mobl.ger.corp.intel.com>
From: "Lopez, Mariano" <mariano.lopez@linux.intel.com>
Message-ID: <709e6fa6-6217-23b8-30ca-bc326600e135@linux.intel.com>
Date: Tue, 13 Dec 2016 07:58:00 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <3281082.n0HP4LhUSl@peggleto-mobl.ger.corp.intel.com>
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>,
	openembedded-core@lists.openembedded.org, "Limon,
	Anibal" <anibal.limon@intel.com>
Subject: Re: [PATCH 2/8] oeqa/sdkext/devtool.py: remove workspace/sources before running test cases
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
X-List-Received-Date: Tue, 13 Dec 2016 13:58:01 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 12/12/2016 10:45 PM, Paul Eggleton wrote:
> On Wed, 16 Nov 2016 22:19:31 Robert Yang wrote:
>> Fixed:
>> MACHINE = "qemux86-64"
>> require conf/multilib.conf
>> MULTILIBS = "multilib:lib32"
>> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>>
>> $ bitbake core-image-minimal -cpopulate_sdk_ext
>> [snip]
>> ERROR: Source tree path
>> /path/to/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testsdkex
>> t/tc/workspace/sources/v4l2loopback-driver already exists and is not
>> empty\n' [snip]
>>
>> This is because the test case will run twice
>> (environment-setup-core2-64-poky-linux and
>> environment-setup-x86-pokymllib32-linux), it would fail in the second
>> run, 'devtool reset' can not remove sources, so remove it before running
>> test cases.
>>
>> [YOCTO #10647]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/lib/oeqa/sdkext/devtool.py | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/lib/oeqa/sdkext/devtool.py
>> b/meta/lib/oeqa/sdkext/devtool.py index 65f41f6..f101eb6 100644
>> --- a/meta/lib/oeqa/sdkext/devtool.py
>> +++ b/meta/lib/oeqa/sdkext/devtool.py
>> @@ -15,6 +15,9 @@ class DevtoolTest(oeSDKExtTest):
>>           self.myapp_cmake_dst = os.path.join(self.tc.sdktestdir,
>> "myapp_cmake") shutil.copytree(self.myapp_cmake_src, self.myapp_cmake_dst)
>>
>> +        # Clean sources dir to make "git clone" can run again
>> +        shutil.rmtree(os.path.join(self.tc.sdktestdir,
>> "tc/workspace/sources"), True) +
>>       def _test_devtool_build(self, directory):
>>           self._run('devtool add myapp %s' % directory)
>>           try:
> It seems to me that's what's missing here is a proper teardown process like we
> have for oe-selftest, so that tests clean up after themselves whether they
> succeed or fail. I'm unsure as to whether that is part of the plan for the new
> QA refactoring though.

To clean directories before/after the test it is not in the plans of the 
QA refactoring, they way Robert did the clean up is appropriated, in the 
setUpClass method, this way it will run before every class test and only 
one time.

Mariano

>
> In the absence of that however I guess we don't have much choice but to do
> something like this.
>
> Cheers,
> Paul
>


