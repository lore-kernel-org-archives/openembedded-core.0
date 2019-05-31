Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9C53E7E563
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 09:10:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4V994UB027037
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 May 2019 02:09:15 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 31 May 2019 02:08:54 -0700
To: <richard.purdie@linuxfoundation.org>
References: <20190530092232.169453-1-kai.kang@windriver.com>
	<20190530092232.169453-2-kai.kang@windriver.com>
	<39d1e5c522b70d7c6dad4cb37641c0c1ae7cbd41.camel@linuxfoundation.org>
	<068b03a0-b96b-eee3-0dc5-9ddfde048066@windriver.com>
	<cfb5ffc25d8a5d7c378b196807c984661b0bd606.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <596f0025-11ae-eb5f-9542-9040de9b2066@windriver.com>
Date: Fri, 31 May 2019 17:07:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cfb5ffc25d8a5d7c378b196807c984661b0bd606.camel@linuxfoundation.org>
Cc: poky@yoctoproject.org, peter.kjellerstedt@axis.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-poky][PATCH v4 1/3] poky.conf: make systemd as default init manager
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
X-List-Received-Date: Fri, 31 May 2019 09:10:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/5/31 下午5:00, richard.purdie@linuxfoundation.org wrote:
> On Fri, 2019-05-31 at 10:07 +0800, Kang Kai wrote:
>> On 2019/5/30 下午7:44, richard.purdie@linuxfoundation.org wrote:
>>> On Thu, 2019-05-30 at 05:22 -0400, kai.kang@windriver.com wrote:
>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>
>>>> Move configurations from local.conf.sample.extended to poky.conf
>>>> to
>>>> make
>>>> systemd as default init manager for poky. Introduce a new
>>>> variable
>>>> 'POKY_INIT_MANAGER' whose value should be either 'systemd' or
>>>> 'sysvinit'
>>>> to configure the init manager setting.
>>>>
>>>> For users who still want to use sysvinit, set in local.conf or
>>>> any
>>>> other
>>>> configure file with:
>>>>
>>>>     POKY_INIT_MANAGER = "sysvinit"
>>>>
>>>> [YOCTO #13031]
>>>>
>>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>> ---
>>>>    meta-poky/conf/distro/poky.conf           | 10 ++++++++++
>>>>    meta-poky/conf/local.conf.sample.extended |  9 ---------
>>>>    2 files changed, 10 insertions(+), 9 deletions(-)
>>> Thanks for working on this patchset, I think its nearly there. I'm
>>> wondering if we should set
>>>
>>> POKY_INIT_MANAGER_libc-musl = "sysvinit"
>>>
>>> since I am worried about what I read about musl and systemd from a
>>> security perspective.
>> OK. I'll add it.
>>
>>
>>> I'm also wondering what we need to do with the autobuilder init
>>> system
>>> tests, I think those may need rewriting to add some sysvinit tests.
>> Something likes meta/lib/oeqa/runtime/cases/systemd.py? I think it
>> is better to do in next milestone and create a defect to address it.
>> If it is ok, I'll create one.
> No, I mean:
>
> http://git.yoctoproject.org/cgit.cgi/yocto-autobuilder-helper/tree/config.json#n813
>
> which corresponds to steps 5-7 of 'qa-extras2' on the autobuilder.
>
> We're going to need to update the test configuration on master to cover
> the things we no longer test and remove the duplication.
>
>>> Does POKY_INIT_MANAGER = "sysvinit systemd" work for the mode where
>>> we allow old sysvinit scripts for compatibility?
>> I am afraid only one value could be set for POKY_INIT_MANAGER. And I
>> believe that most packages have been supporting systemd. If there is,
>> we can add a systemd service file for it.
> This isn't the point, we support 3 different configurations of this and
> the variable needs to reflect that.
>
> How about a slightly different approach. We define POKY_INIT_MANAGER to
> take three different values, sysvinit, systemd and systemd-compat.
>
> We do something like:
>
> require conf/distro/include/init-template-${POKY_INIT_MANAGER}.inc
>
> and then put the appropriate configuration in each .inc file?
>
>> BTW, POKY_INIT_MANAGER doesn't consider the case of mdev/busybox. If
>> want to use mdev/busybox for init, just set DISTRO with poky-tiny and
>> everything have been set properly in poky-tiny.conf.
> This might be an opportunity to have another setting for
> POKY_INIT_MANAGER which covers this too through an additional .inc?

Got it.

Regards,
Kai


>
> Cheers,
>
> Richard
>
>
>

-- 
Kai Kang


