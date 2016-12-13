Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8E754719B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 05:56:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBD5u8Ur019361
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Dec 2016 21:56:08 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 12 Dec 2016 21:56:07 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1479363545.git.liezhi.yang@windriver.com>
	<61246658fe264929d272f4da2f681e0fb95f9809.1479363545.git.liezhi.yang@windriver.com>
	<3281082.n0HP4LhUSl@peggleto-mobl.ger.corp.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <10c5001f-1209-acd7-dc7a-7c64792b36b2@windriver.com>
Date: Tue, 13 Dec 2016 13:56:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <3281082.n0HP4LhUSl@peggleto-mobl.ger.corp.intel.com>
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>, "Limon,
	Anibal" <anibal.limon@intel.com>, "Lopez,
	Mariano" <mariano.lopez@intel.com>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 13 Dec 2016 05:56:09 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Paul,

Thanks for reply, please see my comments inline.

On 12/13/2016 12:45 PM, Paul Eggleton wrote:
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
>>  meta/lib/oeqa/sdkext/devtool.py | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/lib/oeqa/sdkext/devtool.py
>> b/meta/lib/oeqa/sdkext/devtool.py index 65f41f6..f101eb6 100644
>> --- a/meta/lib/oeqa/sdkext/devtool.py
>> +++ b/meta/lib/oeqa/sdkext/devtool.py
>> @@ -15,6 +15,9 @@ class DevtoolTest(oeSDKExtTest):
>>          self.myapp_cmake_dst = os.path.join(self.tc.sdktestdir,
>> "myapp_cmake") shutil.copytree(self.myapp_cmake_src, self.myapp_cmake_dst)
>>
>> +        # Clean sources dir to make "git clone" can run again
>> +        shutil.rmtree(os.path.join(self.tc.sdktestdir,
>> "tc/workspace/sources"), True) +
>>      def _test_devtool_build(self, directory):
>>          self._run('devtool add myapp %s' % directory)
>>          try:
>
> It seems to me that's what's missing here is a proper teardown process like we
> have for oe-selftest, so that tests clean up after themselves whether they
> succeed or fail. I'm unsure as to whether that is part of the plan for the new
> QA refactoring though.

There is already a 'devtool reset' which can do the cleanup, but it
can't remove sources as I said in the commit log.

// Robert

>
> In the absence of that however I guess we don't have much choice but to do
> something like this.
>
> Cheers,
> Paul
>

