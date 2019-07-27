Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2883B7D2AE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jul 2019 08:43:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6R8hKDR006831
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 27 Jul 2019 01:43:31 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Sat, 27 Jul 2019 01:43:09 -0700
To: <richard.purdie@linuxfoundation.org>
References: <20190726092342.37231-1-kai.kang@windriver.com>
	<0c505fd8dd1e01a8ff06eea35144466d3662f67d.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <f13aa830-7c06-8777-8133-714c277ce1b4@windriver.com>
Date: Sat, 27 Jul 2019 16:42:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0c505fd8dd1e01a8ff06eea35144466d3662f67d.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] core-image-sato-sdk: test image with 512M memory
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
X-List-Received-Date: Sat, 27 Jul 2019 08:43:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/7/27 上午5:40, richard.purdie@linuxfoundation.org wrote:
> On Fri, 2019-07-26 at 05:23 -0400, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> When run do_testimage for core-image-sato-sdk, it fails to pass test
>> case:
>>
>>> RESULTS - systemd.SystemdBasicTests.test_systemd_failed: FAILED
>>> (0.43s)
>> It is OOM issue and daemon rpc.statd is killed:
>>
>>>   [  531.306146] Out of memory: Kill process 193 (rpc.statd) score
>>> 200 or sacrifice child
>> Increase the memory of qemu to 512M to avoid such OOM issue.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-sato/images/core-image-sato-sdk.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb
>> b/meta/recipes-sato/images/core-image-sato-sdk.bb
>> index d7cc52b52b..f7963d018e 100644
>> --- a/meta/recipes-sato/images/core-image-sato-sdk.bb
>> +++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
>> @@ -9,3 +9,4 @@ IMAGE_FEATURES += "dev-pkgs tools-sdk \
>>   
>>   IMAGE_INSTALL += "kernel-devsrc"
>>   
>> +TEST_QEMUPARAMS = "-m 512"
> Any idea what is using so much memory in the image when this happens?
>
> Its rather sad that we can't have NFS+systemd with 256MB memory...

It caused by stap test case. I minimized the test cases to

TEST_SUITES = "ping date ssh systemd stap kernelmodule gcc "

which could reproduce the error.

And it PASSes testimage that remove stap test from default TEST_SUITES:

TEST_SUITES_remove = 'stap'

But I can't reproduce the OOM failure to run stap tests manually.


Regards,
Kai

>
> Cheers,
>
> Richard
>
>

-- 
Kai Kang


