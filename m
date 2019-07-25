Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0212F7C326
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 11:12:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6PBBnB6029720
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Jul 2019 04:12:00 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 25 Jul 2019 04:11:39 -0700
To: <richard.purdie@linuxfoundation.org>, "Mittal, Anuj"
	<anuj.mittal@intel.com>, "Burton, Ross" <ross.burton@intel.com>
References: <20190704134520.16320-1-kai.kang@windriver.com>
	<20190704134520.16320-2-kai.kang@windriver.com>
	<CAJTo0LbmYp-70L=Z_T0jE4xS1mR_vLXKQE18O_EpeEwD6wdroA@mail.gmail.com>
	<a3ee2977ee2d63f1908f110d9273352815ba7d35.camel@linuxfoundation.org>
	<8d6b156e-7d68-e4b8-8688-2c897ebf228a@windriver.com>
	<73fdb42fa63f84e7ed6ec52a183bff73edc4272b.camel@intel.com>
	<71422bd44cac604f8a076b30a5d353669cc0b314.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <f82bad2b-c366-9000-32ab-3ce780c328b4@windriver.com>
Date: Thu, 25 Jul 2019 19:10:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <71422bd44cac604f8a076b30a5d353669cc0b314.camel@linuxfoundation.org>
Cc: "poky@yoctoproject.org" <poky@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] defaultsetup.conf: enable select init manager
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
X-List-Received-Date: Thu, 25 Jul 2019 11:12:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/7/24 上午3:30, richard.purdie@linuxfoundation.org wrote:
> On Mon, 2019-07-22 at 23:26 +0000, Mittal, Anuj wrote:
>> On Mon, 2019-07-22 at 09:37 +0800, Kang Kai wrote:
>>> I just run oe-selftest -a with this patch after you updated the
>>> patch
>>> in
>>> oe-core. But I met some (>15) errors
>>>
>>> ERROR: Unable to start bitbake server (None)
>>>
>>> But I think it should not be related with init manager changes and
>>> will
>>> change a build machine to test.
>>> Do you have test it again in autobuilder and any failure found?
>>> Thanks.
>> Not sure if these have been reported but there are some failures in
>> runtime tests which look related to this change:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/38/builds/855/steps/8/logs/step1c
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/852/steps/8/logs/step1c
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/856/steps/8/logs/step2c
> I did a back to back build comparision with and without the init system
> change.
>
> Basically every failure in:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/297


It fails with

$ bitbake core-image-sato-sdk -c testimage

RESULTS - systemd.SystemdBasicTests.test_systemd_failed: FAILED (0.56s)

It checks failed systemd services and got one:

UNIT              LOAD   ACTIVE SUB DESCRIPTION
● nfs-statd.service loaded failed failed NFS status monitor for NFSv2/3 
locking.


But when boot the qemu image or only run systemd testcases( with its 
dependenies), no such failure.
I doubt it may be affected by other test cases.

Regards,
Kai

>
> seems to be due to the init system default change so we have some
> issues in there to resolve before we can change the default.
>
> Cheers,
>
> Richard
>
>

-- 
Kai Kang


