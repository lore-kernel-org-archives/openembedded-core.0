Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3C6C47E508
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 02:09:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4V29Hje022760
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 May 2019 19:09:17 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 30 May 2019 19:09:16 -0700
To: <richard.purdie@linuxfoundation.org>
References: <20190530092232.169453-1-kai.kang@windriver.com>
	<20190530092232.169453-2-kai.kang@windriver.com>
	<39d1e5c522b70d7c6dad4cb37641c0c1ae7cbd41.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <068b03a0-b96b-eee3-0dc5-9ddfde048066@windriver.com>
Date: Fri, 31 May 2019 10:07:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <39d1e5c522b70d7c6dad4cb37641c0c1ae7cbd41.camel@linuxfoundation.org>
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
X-List-Received-Date: Fri, 31 May 2019 02:09:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/5/30 下午7:44, richard.purdie@linuxfoundation.org wrote:
> On Thu, 2019-05-30 at 05:22 -0400, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Move configurations from local.conf.sample.extended to poky.conf to
>> make
>> systemd as default init manager for poky. Introduce a new variable
>> 'POKY_INIT_MANAGER' whose value should be either 'systemd' or
>> 'sysvinit'
>> to configure the init manager setting.
>>
>> For users who still want to use sysvinit, set in local.conf or any
>> other
>> configure file with:
>>
>>    POKY_INIT_MANAGER = "sysvinit"
>>
>> [YOCTO #13031]
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta-poky/conf/distro/poky.conf           | 10 ++++++++++
>>   meta-poky/conf/local.conf.sample.extended |  9 ---------
>>   2 files changed, 10 insertions(+), 9 deletions(-)
> Thanks for working on this patchset, I think its nearly there. I'm
> wondering if we should set
>
> POKY_INIT_MANAGER_libc-musl = "sysvinit"
>
> since I am worried about what I read about musl and systemd from a
> security perspective.

OK. I'll add it.


>
> I'm also wondering what we need to do with the autobuilder init system
> tests, I think those may need rewriting to add some sysvinit tests.

Something likes meta/lib/oeqa/runtime/cases/systemd.py? I think it is 
better to do in next milestone and create a defect to address it.
If it is ok, I'll create one.


>
> Does POKY_INIT_MANAGER = "sysvinit systemd" work for the mode where we
> allow old sysvinit scripts for compatibility?

  I am afraid only one value could be set for POKY_INIT_MANAGER. And I 
believe that most packages have been supporting systemd. If there is,
we can add a systemd service file for it.

BTW, POKY_INIT_MANAGER doesn't consider the case of mdev/busybox. If 
want to use mdev/busybox for init, just set DISTRO with poky-tiny and
everything have been set properly in poky-tiny.conf.

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


