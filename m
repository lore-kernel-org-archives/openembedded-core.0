Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CCED97D084
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 09:30:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x689TfbO010193
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Jul 2019 02:30:08 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 8 Jul 2019 02:29:59 -0700
To: <richard.purdie@linuxfoundation.org>, Adrian Bunk <bunk@stusta.de>
References: <20190704134520.16320-1-kai.kang@windriver.com>
	<20190704134520.16320-2-kai.kang@windriver.com>
	<20190706095328.GA1877@localhost>
	<637f10ea8804f01bcde302ad0c418a362f257b69.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <96f7c0fd-880c-dc50-9195-9e745ecab2f7@windriver.com>
Date: Mon, 8 Jul 2019 17:28:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <637f10ea8804f01bcde302ad0c418a362f257b69.camel@linuxfoundation.org>
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 08 Jul 2019 09:30:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/7/6 下午8:31, richard.purdie@linuxfoundation.org wrote:
> On Sat, 2019-07-06 at 12:53 +0300, Adrian Bunk wrote:
>> On Thu, Jul 04, 2019 at 09:45:19PM +0800, kai.kang@windriver.com
>> wrote:
>>> From: Kai Kang <kai.kang@windriver.com>
>>>
>>> Introduce a new variable INIT_MANAGER and create 3 init-manager-
>>> *.inc
>>> files to configure init manager settings. Available values of
>>> INIT_MANAGER are sysvinit, systemd and mdev-busybox. 'sysvinit' is
>>> set
>>> by default for compatibility.
>>> ...
>>> --- a/meta/conf/distro/defaultsetup.conf
>>> +++ b/meta/conf/distro/defaultsetup.conf
>>> @@ -23,3 +23,6 @@ PACKAGE_CLASSES ?= "package_ipk"
>>>   INHERIT_BLACKLIST = "blacklist"
>>>   INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool"
>>>   INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}
>>> ${INHERIT_BLACKLIST}"
>>> +
>>> +INIT_MANAGER ??= "sysvinit"
>>> +require conf/distro/include/init-manager-${INIT_MANAGER}.inc
>>> ...
>>> --- /dev/null
>>> +++ b/meta/conf/distro/include/init-manager-sysvinit.inc
>>> @@ -0,0 +1,6 @@
>>> +# Use sysvinit for system initialization
>>> +DISTRO_FEATURES_append = " sysvinit"
>>> +DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " systemd"
>>> +VIRTUAL-RUNTIME_init_manager = "sysvinit"
>>> +VIRTUAL-RUNTIME_initscripts = "initscripts"
>>> +VIRTUAL-RUNTIME_login_manager = "busybox"
>> I am not sure whether this can be fixed better, but this does break
>> existing configurations that use a non-default init system.
>>
>> I just ran into a build issue with
>>    VIRTUAL-RUNTIME_init_manager = "systemd"
>> since this now resulted in both sysvinit and systemd being attempted
>> to
>> be installed to the image.
>>
>> This was fixable in my configuration with
>>    -VIRTUAL-RUNTIME_init_manager = "systemd"
>>    +INIT_MANAGER = "systemd"
>>
>> This at least needs to be properly documented as a breaking change.
> This change also didn't quite work out for some of our selftests. I've
> a patch in master-next which tried to improve things and that fixed the
> selftests.
>
> The only other way we could do this is to default INIT_MANAGER to say
> "unset" and have an empty file for that. That will of course break my
> patch and need the defaults adding back into the recipe. Unless we put
> those defaults into the unset version.

How about keep a empty INIT_MANAGER by default, and check if 
INIT_MANAGER is set, then overwrite other configs such as
VIRTUAL-RUNTIME_init_manager whether is from user config or predefined 
value from config files or recipes? It could be done
in a anonymous function.

Regards,
Kai


>
> Not sure quite what we should do here...
>
> Cheers,
>
> Richard
>
>
>

-- 
Kai Kang


