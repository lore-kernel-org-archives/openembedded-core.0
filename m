Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D3A67D2D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 02:07:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5I27JAY002510
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Jun 2019 19:07:19 -0700 (PDT)
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 17 Jun 2019 19:07:18 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1560760310.git.Qi.Chen@windriver.com>
	<04e801ca1c0747dbf5e932a159d35968a6bf938c.1560760310.git.Qi.Chen@windriver.com>
	<1776c2e6d791cffa71e5f3bd8d375f94dec1cb70.camel@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <31e93e66-a9ed-7682-d492-522da7543744@windriver.com>
Date: Tue, 18 Jun 2019 10:19:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1776c2e6d791cffa71e5f3bd8d375f94dec1cb70.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.148]
Subject: Re: [PATCH 1/1] pkgdata: fix test_find_path to consider multilib
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
X-List-Received-Date: Tue, 18 Jun 2019 02:07:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/17/2019 11:51 PM, Richard Purdie wrote:
> On Mon, 2019-06-17 at 16:32 +0800, Chen Qi wrote:
>> Fix test_find_path test case to take into consideration of multilib
>> being enabled. After this change, no matter multilib is enabled or
>> not, the test case should pass.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/lib/oeqa/selftest/cases/pkgdata.py | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
>> index 833a180..2bd15eb 100644
>> --- a/meta/lib/oeqa/selftest/cases/pkgdata.py
>> +++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
>> @@ -47,10 +47,11 @@ class OePkgdataUtilTests(OESelftestTestCase):
>>           self.assertGreater(pkgsize, 1, "Size should be greater than 1. %s" % result.output)
>>   
>>       def test_find_path(self):
>> -        result = runCmd('oe-pkgdata-util find-path /lib/libz.so.1')
>> -        self.assertEqual(result.output, 'zlib: /lib/libz.so.1')
>> +        base_libdir = get_bb_var('base_libdir')
>> +        result = runCmd('oe-pkgdata-util find-path %s/libz.so.1' % base_libdir)
>> +        self.assertEqual(result.output, 'zlib: %s/libz.so.1' % base_libdir)
>>           result = runCmd('oe-pkgdata-util find-path /usr/bin/m4')
>> -        self.assertEqual(result.output, 'm4: /usr/bin/m4')
>> +        self.assertTrue('m4: /usr/bin/m4' in result.output)
>>           result = runCmd('oe-pkgdata-util find-path /not/exist', ignore_status=True)
>>           self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
>>           self.assertEqual(result.output, 'ERROR: Unable to find any package producing path /not/exist')
> For selftest we really want a "known" configuration so I'm not sure we
> want to go down this route as there are a lot of configurations which
> could confuse the test results.
>
> It would probably be better to have selftest only build a clean config
> and accept a limited number of variables. The parallel execution code
> did go a long way to getting us to the point where it would do that.
>
> Cheers,
>
> Richard
>
>
>

Got it, Thanks.

Best Regards,
Chen Qi

