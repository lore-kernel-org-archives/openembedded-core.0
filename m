Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 25CE17886B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 02:24:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0C2Oxp9007182
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 18:24:59 -0800 (PST)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 11 Jan 2018 18:24:58 -0800
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
References: <20180111030706.18174-1-jackie.huang@windriver.com>
	<fa40b5ce-5334-0f34-785d-d6ad8e978f15@windriver.com>
	<1B858668EC6A94408DCA5225FDFA85AA01566CF55D@ALA-MBC.corp.ad.wrs.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <f7de17db-27f2-f102-8ae7-a9aad388c3d7@windriver.com>
Date: Thu, 11 Jan 2018 21:24:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA01566CF55D@ALA-MBC.corp.ad.wrs.com>
X-Originating-IP: [172.25.44.3]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: add RDEPENDS on util-linux-getopt
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
X-List-Received-Date: Fri, 12 Jan 2018 02:24:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2018-01-11 09:13 PM, Huang, Jie (Jackie) wrote:
> 
> 
>> -----Original Message-----
>> From: MacLeod, Randy
>> Sent: Friday, January 12, 2018 04:16
>> To: Huang, Jie (Jackie); openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH] systemd: add RDEPENDS on util-linux-getopt
>>
>> On 2018-01-10 10:07 PM, jackie.huang@windriver.com wrote:
>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>
>>> 'getopt' is needed by systemd-sysv-install, or it fails with:
>>> | kdump.service is not a native service, redirecting to systemd-sysv-install.
>>> | Executing: /lib/systemd/systemd-sysv-install enable kdump
>>> | /lib/systemd/systemd-sysv-install: line 15: getopt: command not found
>>>
>>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>>> ---
>>>    meta/recipes-core/systemd/systemd_234.bb | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-
>> core/systemd/systemd_234.bb
>>> index 4132cdf40f..5a0e4c2247 100644
>>> --- a/meta/recipes-core/systemd/systemd_234.bb
>>> +++ b/meta/recipes-core/systemd/systemd_234.bb
>>> @@ -521,7 +521,7 @@ FILES_${PN} = " ${base_bindir}/* \
>>>
>>>    FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-
>> 1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
>>>
>>> -RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})
>> util-linux-agetty"
>>> +RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})
>> util-linux-agetty util-linux-getopt"
>>
>> It would be nice to make the dependency conditional on systemd being
>> configured to support sysvinit scripts.
> 
> The sysvinit script is always supported for now:
> 
> commit 9d298d1563b3fd5ad569f806cc296e13279e7cf6
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Sun Sep 6 15:25:41 2015 +0000
> 
>      systemd: Implement OE-Specific systemd-sysv-install
> 
>      Support for chkconfig (--enable-chkconfig) was removed in favour of
>      calling an abstraction /lib/systemd/systemd-sysv-install. This
>      needs to be implemented for OE.
> 
>      Signed-off-by: Khem Raj <raj.khem@gmail.com>
>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> So I think the unconditional dependency is needed unless we change the
> support for sysvinit to be optional as well.

I would like to make it configurable but you're right, it works
properly now and the commit log would tip anyone off should we
get around to making systemd's sysvinit support optional.

Thanks,

../Randy

> 
> Thanks,
> Jackie
>>
>> ../Randy
>>
>>>    RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-
>> generator', '', 'systemd-serialgetty', d)}"
>>>    RDEPENDS_${PN} += "volatile-binds update-rc.d"
>>>
>>>
>>
>>
>> --
>> # Randy MacLeod.  WR Linux
>> # Wind River an Intel Company


-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

