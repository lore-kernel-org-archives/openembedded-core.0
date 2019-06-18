Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1BAF67D2D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 01:57:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5I1vheI000791
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Jun 2019 18:57:44 -0700 (PDT)
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 17 Jun 2019 18:57:43 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1560763400.git.Qi.Chen@windriver.com>
	<28e0391ef22f3e131227d66dae731fa14f48e1a0.1560763400.git.Qi.Chen@windriver.com>
	<f70ae3aaabc1a52a994fe5a0eae73f9e0416c851.camel@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <8f1047b7-a0f0-8fa4-bcfd-51fad5083050@windriver.com>
Date: Tue, 18 Jun 2019 10:09:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <f70ae3aaabc1a52a994fe5a0eae73f9e0416c851.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.148]
Subject: Re: [PATCH 1/1] manifest.py: fix test_SDK_manifest_entries
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
X-List-Received-Date: Tue, 18 Jun 2019 01:57:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/17/2019 11:54 PM, Richard Purdie wrote:
> On Mon, 2019-06-17 at 17:24 +0800, Chen Qi wrote:
>> TOOLCHAIN_OUTPUTNAME could be overridden. So use this variable directly
>> instead of its default value ${SDK_NAME}-toolchain-${SDK_VERSION}.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/lib/oeqa/selftest/cases/manifest.py | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/manifest.py b/meta/lib/oeqa/selftest/cases/manifest.py
>> index c0b25ab..5d13f35 100644
>> --- a/meta/lib/oeqa/selftest/cases/manifest.py
>> +++ b/meta/lib/oeqa/selftest/cases/manifest.py
>> @@ -86,11 +86,8 @@ class VerifyManifest(OESelftestTestCase):
>>           try:
>>               mdir = self.get_dir_from_bb_var('SDK_DEPLOY', self.buildtarget)
>>               for k in d_target.keys():
>> -                bb_vars = get_bb_vars(['SDK_NAME', 'SDK_VERSION'], self.buildtarget)
>> -                mfilename[k] = "{}-toolchain-{}.{}.manifest".format(
>> -                        bb_vars['SDK_NAME'],
>> -                        bb_vars['SDK_VERSION'],
>> -                        k)
>> +                toolchain_outputname = get_bb_var('TOOLCHAIN_OUTPUTNAME', self.buildtarget)
>> +                mfilename[k] = "{}.{}.manifest".format(toolchain_outputname, k)
> Whilst I agree there is a problem here, this code is iterating over
> multiple targets. Isn't TOOLCHAIN_OUTPUTNAME only going to be correct
> for one of them?
>
> Cheers,
>
> Richard
>
>

This code is iterating over d_target.keys(), which is 'target' and 
'host'. And the TOOLCHAIN_OUTPUTNAME is for self.buildtarget, which is 
core-image-minimal. Thus, we are basically checking 
${TOOLCHAIN_OUTPUTNAME}.target.manifest and 
${TOOLCHAIN_OUTPUTNAME}.host.target.
e.g.
tmp-glibc/deploy/sdk/poky-glibc-x86_64-core-image-minimal-core2-64-qemux86-64-toolchain-2.7+snapshot.host.manifest
tmp-glibc/deploy/sdk/poky-glibc-x86_64-core-image-minimal-core2-64-qemux86-64-toolchain-2.7+snapshot.target.manifest

So I think things are correct.

Best Regards,
Chen Qi

