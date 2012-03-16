Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1S8Zyz-0000VK-4I
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 17:26:25 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Mar 2012 09:17:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="118384895"
Received: from unknown (HELO envy.home) ([10.255.12.16])
	by orsmga001.jf.intel.com with ESMTP; 16 Mar 2012 09:17:36 -0700
Message-ID: <4F636773.4010007@linux.intel.com>
Date: Fri, 16 Mar 2012 09:16:51 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1331848750.git.dvhart@linux.intel.com>
	<5ca651eb19c3fcb64de2ce405de0bc7fa2a8c90b.1331848750.git.dvhart@linux.intel.com>
	<4F636508.2090908@linux.intel.com>
In-Reply-To: <4F636508.2090908@linux.intel.com>
X-Enigmail-Version: 1.4
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] rt-tests: Add src/backfire to FILES_${PN}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Mar 2012 16:26:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/16/2012 09:06 AM, Saul Wold wrote:
> On 03/15/2012 03:00 PM, Darren Hart wrote:
>> Fixes [YOCTO #2114]
>>
>> The rt-tests recipe was issuing the following WARNINGs:
>>
>> WARNING: For recipe rt-tests, the following files/directories were installed
>> but not shipped in any package:
>> WARNING:   /usr/src
>> WARNING:   /usr/src/backfire
>> WARNING:   /usr/src/backfire/backfire.c
>> WARNING:   /usr/src/backfire/Makefile
>>
>> Add ${prefix}/src/backfire to FILES_${PN} to include these files in the package.
>> These depend on the target kernel and are meant to be able to be rebuilt as
>> needed.  Ideally we would also build this module and include it with rt-tests or
>> the linux-yocto-rt kernel. For now, conform with the intent of the rt-tests
>> Makefile and avoid the WARNINGs.
>>
>> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
>> ---
>>   meta/recipes-rt/rt-tests/rt-tests_0.83.bb |    3 +++
>>   1 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
>> index 78d51b3..6425027 100644
>> --- a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
>> +++ b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
>> @@ -11,6 +11,7 @@ SRCREV = "5f1e84f8b015df3ff950056494134eca3f640d70"
>>
>>   # git ->  0.83 needs a PE bump
>>   PE = "1"
>> +PR = "r1"
>>
>>   SRC_URI = "git://github.com/clrkwllms/rt-tests.git"
>>
>> @@ -25,3 +26,5 @@ do_install() {
>>           oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} \
>>                              INCLUDEDIR=${includedir}
>>   }
>> +
>> +FILES_${PN} += "${prefix}/src/backfire"
> Darren,
> 
> I looked closer and you need you use ${D}${prefix}/src here instead, 
> that will get you what you want.


Hrm, that isn't consistent with the rest of the usage I see in oe-core:

$ git grep 'FILES_${PN}.*${prefix}'
classes/cross-canadian.bbclass:FILES_${PN} = "${prefix}"
classes/cross-canadian.bbclass:FILES_${PN}-dbg += "${prefix}/.debug \
recipes-devtools/binutils/binutils.inc:FILES_${PN}-dbg += "${prefix}/${TARGET_SYS}/
recipes-devtools/rpm/rpm_5.4.0.bb:FILES_${PN}-build = "${prefix}/src/rpm \
recipes-devtools/tcltk/tcl_8.5.11.bb:FILES_${PN} += "${prefix}/lib/tcl8.5 ${prefix}
recipes-sato/puzzles/puzzles_r9375.bb:FILES_${PN} = "${prefix}/games/* ${datadir}/a
recipes-sato/puzzles/puzzles_r9375.bb:FILES_${PN}-dbg += "${prefix}/games/.debug"

Also, it works as intended if I use "${prefix}/src/backfire/*" and this is
consistent with existing usage.

What lead you to suggest "${D}${prefix}" ?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


