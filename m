Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 60F5F6D181
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 04:40:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9V4dmMG003166
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Oct 2013 21:39:48 -0700 (PDT)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Wed, 30 Oct 2013 21:39:47 -0700
Message-ID: <5271DF4D.30607@windriver.com>
Date: Thu, 31 Oct 2013 12:40:45 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1383098783.git.Qi.Chen@windriver.com>
	<8375914656f9a76b45495b0bb7209df9a7fde180.1383098783.git.Qi.Chen@windriver.com>
	<CAMKF1sokaQmkE6imxFxYD88UB2woFrFkybRprAkbd3kHhSucjg@mail.gmail.com>
In-Reply-To: <CAMKF1sokaQmkE6imxFxYD88UB2woFrFkybRprAkbd3kHhSucjg@mail.gmail.com>
X-Originating-IP: [128.224.162.213]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] iproute2: explicitly add 'bash' to its RDEPENDS
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
X-List-Received-Date: Thu, 31 Oct 2013 04:40:16 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/2013 11:32 AM, Khem Raj wrote:
> On Tue, Oct 29, 2013 at 7:07 PM,  <Qi.Chen@windriver.com> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> If we build a minimal image with iproute2 installed, the following
>> error will appear during rootfs.
>>
>> error: Can't install iproute2-3.10.0-r0.0@i586: no package provides /bin/bash
>>
>> The problem is that iproute2 has an implicit dependency on 'bash'.
>> This dependency is from per-file dependency checking. But as 'bash'
>> is not explicitly specified in the RDEPENDS in recipe, it's not built.
>> This leads to the above error.
> To be a bit more surgical if you could figure out which script is it
> which is asking for it that will help
> to determine if we can create a separate package for these scripts which
> have dependency on bash and then create a RDEPEND for this new package instead.

/sbin/ifcfg and /sbin/rtpr.

Here's a grep result from the package/ directory of iproute2.
iproute2/3.10.0-r0/package [1] $ grep -R '/bin/bash' ./*
./sbin/ifcfg:#! /bin/bash
./sbin/rtpr:#! /bin/bash
./usr/share/doc/iproute2/examples/cbq.init-v0.7.3:#!/bin/bash
./usr/share/doc/iproute2/examples/dhcp-client-script:#!/bin/bash
./usr/share/doc/iproute2/ip-cref.tex:#! /bin/bash
./usr/share/doc/iproute2/ip-cref.tex:#! /bin/bash

Best Regards,
Chen Qi

>> Fix this problem by explicitly adding 'bash' to the RDEPENDS.
>>
>> [YOCTO #5415]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-connectivity/iproute2/iproute2.inc |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
>> index 3db21db..40f6a6c 100644
>> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
>> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
>> @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
>>                       file://ip/ip.c;beginline=3;endline=8;md5=689d691d0410a4b64d3899f8d6e31817"
>>
>>   DEPENDS = "flex-native bison-native iptables"
>> +RDEPENDS_${PN} = "bash"
>>
>>   inherit update-alternatives
>>
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


