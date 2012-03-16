Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1S8Zea-0008Qm-Iz
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 17:05:20 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 16 Mar 2012 08:56:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="78402736"
Received: from unknown (HELO envy.home) ([10.255.12.16])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Mar 2012 08:56:31 -0700
Message-ID: <4F636283.7040800@linux.intel.com>
Date: Fri, 16 Mar 2012 08:55:47 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331848750.git.dvhart@linux.intel.com>
	<5ca651eb19c3fcb64de2ce405de0bc7fa2a8c90b.1331848750.git.dvhart@linux.intel.com>
	<4F635D37.2020406@linux.intel.com>
In-Reply-To: <4F635D37.2020406@linux.intel.com>
X-Enigmail-Version: 1.4
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
X-List-Received-Date: Fri, 16 Mar 2012 16:05:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 03/16/2012 08:33 AM, Darren Hart wrote:
> Hrm, this silences the warnings, but the backfire sources are not
> installed on the rootfs....
> 
> Anyone see what is wrong with the below? Is there some magic that purges
> /usr/src in a minimal build?

I was adding "/usr/src/backfire" to FILES_${PN}. It seems one should add
"/usr/src/backfire/*" to actually get the files.

However, I am surprised that the warnings went away and the files were
still not packaged when I used "/usr/src/backfire". Is this expected
behavior?

I have pushed the new version to the same branch using
"/usr/src/backfire/*". Built,booted,and verified on qemux86 using
core-image-rt.

--
Darren

> 
> --
> Darren
> 
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
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> ---
>>  meta/recipes-rt/rt-tests/rt-tests_0.83.bb |    3 +++
>>  1 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
>> index 78d51b3..6425027 100644
>> --- a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
>> +++ b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
>> @@ -11,6 +11,7 @@ SRCREV = "5f1e84f8b015df3ff950056494134eca3f640d70"
>>  
>>  # git -> 0.83 needs a PE bump
>>  PE = "1"
>> +PR = "r1"
>>  
>>  SRC_URI = "git://github.com/clrkwllms/rt-tests.git"
>>  
>> @@ -25,3 +26,5 @@ do_install() {
>>          oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} \
>>                             INCLUDEDIR=${includedir}
>>  }
>> +
>> +FILES_${PN} += "${prefix}/src/backfire"
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


