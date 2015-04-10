Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B291B6E277
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 09:26:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3A9QJBe027743
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 10 Apr 2015 02:26:19 -0700 (PDT)
Received: from [128.224.163.137] (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 10 Apr 2015 02:26:19 -0700
Message-ID: <55279738.8040102@windriver.com>
Date: Fri, 10 Apr 2015 17:26:16 +0800
From: Yi Zhao <yi.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1428563457-15238-1-git-send-email-yi.zhao@windriver.com>
	<DEF0B711-0C4D-4AFB-8057-E981A06E7DAC@gmail.com>
In-Reply-To: <DEF0B711-0C4D-4AFB-8057-E981A06E7DAC@gmail.com>
X-Originating-IP: [128.224.163.137]
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lib/oeqa/selftest/bblayers: improve test for add-layer and remove-layer
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
X-List-Received-Date: Fri, 10 Apr 2015 09:26:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



在 2015年04月10日 08:22, Khem Raj 写道:
>> On Apr 9, 2015, at 12:10 AM, Yi Zhao <yi.zhao@windriver.com> wrote:
>>
>> Use absolute path instead of relative path for meta-skeleton.
>> Otherwise the case would fail if the builddir outside the poky source
>> tree.
> may be you should say ‘OE-Core’ sources instead here.

Thanks,  Khem. Strictly speaking it should be OE-Core.

Yi

>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>> meta/lib/oeqa/selftest/bblayers.py |    9 +++++----
>> 1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/selftest/bblayers.py b/meta/lib/oeqa/selftest/bblayers.py
>> index 5b046d0..3a18029 100644
>> --- a/meta/lib/oeqa/selftest/bblayers.py
>> +++ b/meta/lib/oeqa/selftest/bblayers.py
>> @@ -6,7 +6,7 @@ import shutil
>>
>> import oeqa.utils.ftools as ftools
>> from oeqa.selftest.base import oeSelfTest
>> -from oeqa.utils.commands import runCmd
>> +from oeqa.utils.commands import runCmd, get_bb_var
>> from oeqa.utils.decorators import testcase
>>
>> class BitbakeLayers(oeSelfTest):
>> @@ -44,15 +44,16 @@ class BitbakeLayers(oeSelfTest):
>>          self.assertTrue(find_in_contents)
>>
>>      def test_bitbakelayers_add_remove(self):
>> +        test_layer = os.path.join(get_bb_var('COREBASE'), 'meta-skeleton')
>>          result = runCmd('bitbake-layers show-layers')
>>          self.assertNotIn('meta-skeleton', result.output, 'This test cannot run with meta-skeleton in bblayers.conf')
>> -        result = runCmd('bitbake-layers add-layer ../meta-skeleton')
>> +        result = runCmd('bitbake-layers add-layer %s' % test_layer)
>>          result = runCmd('bitbake-layers show-layers')
>>          self.assertIn('meta-skeleton', result.output)
>> -        result = runCmd('bitbake-layers remove-layer ../meta-skeleton')
>> +        result = runCmd('bitbake-layers remove-layer %s' % test_layer)
>>          result = runCmd('bitbake-layers show-layers')
>>          self.assertNotIn('meta-skeleton', result.output)
>> -        result = runCmd('bitbake-layers add-layer ../meta-skeleton')
>> +        result = runCmd('bitbake-layers add-layer %s' % test_layer)
>>          result = runCmd('bitbake-layers show-layers')
>>          self.assertIn('meta-skeleton', result.output)
>>          result = runCmd('bitbake-layers remove-layer */meta-skeleton')
>> -- 
>> 1.7.9.5
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


