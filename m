Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6AD0770016
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 19:25:43 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jul 2017 12:25:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,305,1496127600"; d="scan'208";a="122352056"
Received: from jgperezc-mobl1.zpn.intel.com (HELO [10.219.4.33])
	([10.219.4.33])
	by fmsmga006.fm.intel.com with ESMTP; 03 Jul 2017 12:25:44 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20170703162641.42332-1-jose.perez.carranza@linux.intel.com>
	<CAMKF1sruAfdxjtU3wO9=JLNbEyS3v=ZoctTSY+pCKY6zT+ovZg@mail.gmail.com>
From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Message-ID: <3bd8e1e2-b5f5-48fa-71be-0b83bbeffb9e@linux.intel.com>
Date: Mon, 3 Jul 2017 14:28:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sruAfdxjtU3wO9=JLNbEyS3v=ZoctTSY+pCKY6zT+ovZg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/sdk: Replace buildiptables for buildgzip tests
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
X-List-Received-Date: Mon, 03 Jul 2017 19:25:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 07/03/2017 11:59 AM, Khem Raj wrote:
> On Mon, Jul 3, 2017 at 9:26 AM,  <jose.perez.carranza@linux.intel.com> wrote:
>> From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
>>
>> Buildiptables test cases are conflicting with images built with “musl”
>> as standard C library, in order to avoid those issues gzip package was
>> selected to be used on the tests as this does not conflicts with “musl”.
>>
>> [YOCTO #11713]
> I see that gzip recipes also have musl appends for do_configure, I
> understand, that this test case will compile on device so it will get
> hosted env and it might be working fine. I would think it will be good
> to use a package which we dont patch even in OE
I did some test also suing "Lzip", I did not see any reference to "musl" 
on that recipe, did you see any problem using "lzip"instead "gzip"?

Regards
José
>
>> Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
>> ---
>>   meta/lib/oeqa/sdk/cases/{buildiptables.py => buildgzip.py} | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>   rename meta/lib/oeqa/sdk/cases/{buildiptables.py => buildgzip.py} (84%)
>>
>> diff --git a/meta/lib/oeqa/sdk/cases/buildiptables.py b/meta/lib/oeqa/sdk/cases/buildgzip.py
>> similarity index 84%
>> rename from meta/lib/oeqa/sdk/cases/buildiptables.py
>> rename to meta/lib/oeqa/sdk/cases/buildgzip.py
>> index 419c7ebd09b..a92df65c28b 100644
>> --- a/meta/lib/oeqa/sdk/cases/buildiptables.py
>> +++ b/meta/lib/oeqa/sdk/cases/buildgzip.py
>> @@ -3,15 +3,15 @@ from oeqa.sdk.case import OESDKTestCase
>>   from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
>>
>>
>> -class BuildIptablesTest(OESDKTestCase):
>> +class BuildGzipTest(OESDKTestCase):
>>       td_vars = ['DATETIME']
>>
>>       @classmethod
>>       def setUpClass(self):
>>           dl_dir = self.td.get('DL_DIR', None)
>>
>> -        self.project = SDKBuildProject(self.tc.sdk_dir + "/iptables/", self.tc.sdk_env,
>> -                        "http://downloads.yoctoproject.org/mirror/sources/iptables-1.4.13.tar.bz2",
>> +        self.project = SDKBuildProject(self.tc.sdk_dir + "/gzip/", self.tc.sdk_env,
>> +                        "http://downloads.yoctoproject.org/mirror/sources/gzip-1.8.tar.gz",
>>                           self.tc.sdk_dir, self.td['DATETIME'], dl_dir=dl_dir)
>>           self.project.download_archive()
>>
>> @@ -21,7 +21,7 @@ class BuildIptablesTest(OESDKTestCase):
>>                   self.tc.hasTargetPackage("gcc")):
>>               raise unittest.SkipTest("SDK doesn't contain a cross-canadian toolchain")
>>
>> -    def test_iptables(self):
>> +    def test_gzip(self):
>>           self.assertEqual(self.project.run_configure(), 0,
>>                           msg="Running configure failed")
>>
>> --
>> 2.12.0
>>

-- 
Saludos
José


