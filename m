Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Snz47-0000aV-AU
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jul 2012 23:30:51 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 Jul 2012 14:19:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="174790825"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jul 2012 14:19:27 -0700
Message-ID: <4FF9F95F.8010300@linux.intel.com>
Date: Sun, 08 Jul 2012 14:19:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1341549155-30728-1-git-send-email-msm@freescale.com>
	<4FF9F8F4.6050408@linux.intel.com>
In-Reply-To: <4FF9F8F4.6050408@linux.intel.com>
Cc: Matthew McClintock <msm@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgomp: add libgomp (openmp) library, and build for powerpc targets by default
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
X-List-Received-Date: Sun, 08 Jul 2012 21:30:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2012 02:17 PM, Saul Wold wrote:
> On 07/05/2012 09:32 PM, Matthew McClintock wrote:
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-4.6.inc               |    2 +-
>>   meta/recipes-devtools/gcc/gcc-configure-runtime.inc |    2 ++
>>   meta/recipes-devtools/gcc/gcc-package-runtime.inc   |    9 +++++++++
>>   3 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc
>> b/meta/recipes-devtools/gcc/gcc-4.6.inc
>> index 020e21b..32545eb 100644
>> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
>> @@ -1,6 +1,6 @@
>>   require gcc-common.inc
>>
>> -PR = "r25"
>> +PR = "r26"
>>
>>   # Third digit in PV should be incremented after a minor release
>>   # happens from this branch on gcc e.g. currently its 4.6.0
>> diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
>> b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
>> index 34bfaeb..a7d478c 100644
>> --- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
>> @@ -9,6 +9,8 @@ EXTRA_OECONF_PATHS = " \
>>       --with-build-sysroot=${STAGING_DIR_TARGET}"
>>
>>   RUNTIMETARGET = "libssp libstdc++-v3"
>> +RUNTIMETARGET_append_powerpc = " libgomp"
>> +RUNTIMETARGET_append_powerpc64 = " libgomp"
>>   #  ?
>>   # libiberty
>>   # libmudflap
>> diff --git a/meta/recipes-devtools/gcc/gcc-package-runtime.inc
>> b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
>> index feb8735..001a444 100644
>> --- a/meta/recipes-devtools/gcc/gcc-package-runtime.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
>> @@ -13,6 +13,8 @@ PACKAGES = "\
>>     libgfortran-dev \
>>     libmudflap \
>>     libmudflap-dev \
>> +  libgomp \
>> +  libgomp-dev \
>>   "
>>   # The base package doesn't exist, so we clear the recommends.
>>   RRECOMMENDS_${PN}-dbg = ""
>> @@ -61,3 +63,10 @@ FILES_libmudflap-dev = "\
>>     ${libdir}/libmudflap*.a \
>>     ${libdir}/libmudflap*.la"
>>
>> +FILES_libgomp = "${libdir}/libgomp*.so.*"
>> +FILES_libgomp-dev = "\
>> +  ${libdir}/libgomp*.so \
>> +  ${libdir}/libgomp*.a \
>> +  ${libdir}/libgomp*.la \
>> +  ${libdir}/libgomp.spec \
>> +  ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h"
>>
>
> I should have noticed this before, but it took a build failure!  Did you
> intend to have a ".a" in the -dev package vs the -staticdav package?
>
>> ERROR: QA Issue: non -staticdev package contains static .a library:
>> libgomp-dev path
>> '/work/ppc603e-poky-linux/gcc-runtime-4.7.1+svnr188658-r2/packages-split/libgomp-dev/usr/lib/libgomp.a'
>>
>> ERROR: QA run found fatal errors. Please consider fixing them.
>> ERROR: Function failed: do_package_qa
>> ERROR: Logfile of failure stored in:
>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc603e-poky-linux/gcc-runtime-4.7.1+svnr188658-r2/temp/log.do_package.15360
>>
>> NOTE: package gcc-runtime-4.7.1+svnr188658-r2: task do_package: Failed
>> ERROR: Task 654
>> (/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb,
>> do_package) failed with exit code '1'
>

And one more packaging issue:
> ERROR: QA Issue: gcc-runtime: Files/directories were installed but not shipped
>   /usr/lib/gcc/powerpc-poky-linux/4.7.2/finclude
>   /usr/share/info
>   /usr/share/info/libgomp.info
>   /usr/share/info/dir


Sau!


> Sau!
>
>
>
>



