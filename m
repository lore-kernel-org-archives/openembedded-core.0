Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Randy.MacLeod@windriver.com>) id 1TbKY8-0002G7-07
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 01:21:48 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qALLGY0G004069
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Nov 2012 13:16:34 -0800 (PST)
Received: from [128.224.147.228] (128.224.147.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Wed, 21 Nov 2012 13:16:33 -0800
Message-ID: <50AD44B0.5040307@windriver.com>
Date: Wed, 21 Nov 2012 16:16:32 -0500
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: "fupan.li" <fupan.li@windriver.com>
References: <1353465025-13655-1-git-send-email-fupan.li@windriver.com>
	<20121121074659.GF12637@jama.jama.net>
	<50AC89D9.2080601@windriver.com>
In-Reply-To: <50AC89D9.2080601@windriver.com>
X-Originating-IP: [128.224.147.228]
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] move the benchmark package bonnie++ from meta-oe layer to oe-core and upgrade bonnie++ from 1.03c to 1.03e
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Nov 2012 00:21:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-11-21 02:59 AM, fupan.li wrote:
> On 11/21/2012 03:46 PM, Martin Jansa wrote:
>> On Wed, Nov 21, 2012 at 10:30:25AM +0800, fupan.li@windriver.com wrote:
>>> From: fli <fupan.li@windriver.com>
>> Why do you think that bonnie++ is "core" enough to be in oe-core?
>>
>> Cheers,
> I think it's better to afford those benchmark packages such as lmbench,
> iozone3, bonnie++ and so on
> in the oe-core, so that the users can benchmark its built system easily!
> Benchmark test for an embedded system is essential, especially for those
> projects based on the OE.

Right it shouldn't be in oe-core, sorry for suggeting that Fupan.
What do you suggest Martin? I haven't been following how people
choose to make a YP layer or add things to meta-oe in OpenEmbedded.

Should we make meta-benchmark layer for the YP or
should we try to re-use:
 
http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-benchmark
	
d---------	bonnie
d---------	cpuburn
d---------	dbench
d---------	fio
d---------	iozone3
d---------	iperf
d---------	lmbench
d---------	memtester
d---------	nbench-byte
d---------	netperf
d---------	tiobench


The Phoronix Test Suite would be useful for some systems although
I've primarily just read the PTS reports and expect it would be a
pain to work with it.

Thanks,

// Randy


>
> Thanks!
>
> Fupan
>>> Signed-off-by: fli <fupan.li@windriver.com>
>>> ---
>>>   recipes-benchmark/bonnie/bonnie++_1.03e.bb         |   32
>>> ++++++++++++++++++++
>>>   .../bonnie/files/compiler-error-fix.patch          |   14 +++++++++
>>>   2 files changed, 46 insertions(+)
>>>   create mode 100644 recipes-benchmark/bonnie/bonnie++_1.03e.bb
>>>   create mode 100644
>>> recipes-benchmark/bonnie/files/compiler-error-fix.patch
>>>
>>> diff --git a/recipes-benchmark/bonnie/bonnie++_1.03e.bb
>>> b/recipes-benchmark/bonnie/bonnie++_1.03e.bb
>>> new file mode 100644
>>> index 0000000..848b206
>>> --- /dev/null
>>> +++ b/recipes-benchmark/bonnie/bonnie++_1.03e.bb
>>> @@ -0,0 +1,32 @@
>>> +# bonnie OE build file
>>> +# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights
>>> Reserved
>>> +# Released under the GPLv4 license (see copyright.tx)
>>> +
>>> +DESCRIPTION="Tests large file IO and creation/deletion of small files."
>>> +HOMEPAGE = "http://www.coker.com.au/bonnie++"
>>> +SECTION = "benchmark/tests"
>>> +LICENSE="GPLv2"
>>> +
>>> +SRC_URI="http://www.coker.com.au/bonnie++/${PN}-${PV}.tgz \
>>> +    file://compiler-error-fix.patch"
>>> +
>>> +SRC_URI[md5sum] = "750aa5b5051263a99c6c195888c74968"
>>> +SRC_URI[sha256sum] =
>>> "cb3866116634bf65760b6806be4afa7e24a1cad6f145c876df8721f01ba2e2cb"
>>> +LIC_FILES_CHKSUM =
>>> "file://copyright.txt;md5=cd4dde95a6b9d122f0a9150ae9cc3ee0"
>>> +
>>> +inherit autotools
>>> +
>>> +EXES="bonnie++ zcav"
>>> +SCRIPTS="bon_csv2html bon_csv2txt"
>>> +
>>> +PACKAGES += "bonnie-scripts"
>>> +
>>> +do_install () {
>>> +    install -d ${D}/${bindir}
>>> +    install -d ${D}/${sbindir}
>>> +    install -m 0755 ${EXES} ${D}/${sbindir}
>>> +    install -m 0755 ${SCRIPTS} ${D}/${bindir}
>>> +}
>>> +
>>> +FILES_${PN} = "${sbindir}"
>>> +FILES_bonnie-scripts="${bindir}"
>>> diff --git a/recipes-benchmark/bonnie/files/compiler-error-fix.patch
>>> b/recipes-benchmark/bonnie/files/compiler-error-fix.patch
>>> new file mode 100644
>>> index 0000000..6655b88
>>> --- /dev/null
>>> +++ b/recipes-benchmark/bonnie/files/compiler-error-fix.patch
>>> @@ -0,0 +1,14 @@
>>> +---
>>> + zcav.cpp |    1 +
>>> + 1 file changed, 1 insertion(+)
>>> +
>>> +Index: bonnie++-1.03a/zcav.cpp
>>> +===================================================================
>>> +--- bonnie++-1.03a.orig/zcav.cpp
>>> ++++ bonnie++-1.03a/zcav.cpp
>>> +@@ -15,6 +15,7 @@ using namespace std;
>>> + #else
>>> + #include <vector.h>
>>> + #endif
>>> ++#include <string.h>
>>> +
>>> --
>>> 1.7.9.5
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350


