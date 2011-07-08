Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qezih-00055K-Kc
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 03:19:03 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Jul 2011 18:15:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,496,1304319600"; d="scan'208";a="24180087"
Received: from unknown (HELO [10.255.13.180]) ([10.255.13.180])
	by azsmga001.ch.intel.com with ESMTP; 07 Jul 2011 18:15:09 -0700
Message-ID: <4E165A1C.3060604@linux.intel.com>
Date: Thu, 07 Jul 2011 18:15:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1310081443.git.sgw@linux.intel.com>	<d188228df9d99be77ec2b3becc354a1fc905ab65.1310081443.git.sgw@linux.intel.com>
	<886C3867-FF12-4B5E-90C3-9E5906BAA94F@gmail.com>
In-Reply-To: <886C3867-FF12-4B5E-90C3-9E5906BAA94F@gmail.com>
Subject: Re: [PATCH 7/8] eglibc: Add RDEPENDS on bash
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
X-List-Received-Date: Fri, 08 Jul 2011 01:19:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/07/2011 05:59 PM, Khem Raj wrote:
>
>
> On Jul 7, 2011, at 4:31 PM, Saul Wold<sgw@linux.intel.com>  wrote:
>
>> [YOCTO #1214]
>>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>> meta/recipes-core/eglibc/eglibc-package.inc |    2 +-
>> meta/recipes-core/eglibc/eglibc.inc         |    2 +-
>> meta/recipes-core/eglibc/eglibc_2.12.bb     |    2 +-
>> meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
>> 4 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
>> index 1c6626c..f0fac76 100644
>> --- a/meta/recipes-core/eglibc/eglibc-package.inc
>> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
>> @@ -69,7 +69,7 @@ FILES_eglibc-utils = "${bindir}/* ${sbindir}/*"
>> FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/audit/.debug"
>> FILES_catchsegv${PKGSUFFIX} = "${bindir}/catchsegv"
>> RDEPENDS_catchsegv${PKGSUFFIX} = "libsegfault"
>> -EDEPENDS_eglibc-utils = "libsotruss"
>> +RDEPENDS_eglibc-utils += "libsotruss bash"
>
> While typo fix is ok why do we need dependency on bash ?
> If it is for ldd then there is already a fix to free it from bashism
> We should use that
>
Actually it's for xtrace and tzselect which are part of eglibc-utils and 
are scripts that use /bin/bash.

Where's the fix for ldd?  I don't think its part of eglibc currently.

Sau!

>> FILES_eglibc-pcprofile = "${base_libdir}/libpcprofile.so"
>> FILES_eglibc-thread-db${PKGSUFFIX} = "${base_libdir}/libthread_db*"
>> RPROVIDES_eglibc-dev += "libc-dev"
>> diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
>> index 74afb9d..058d58e 100644
>> --- a/meta/recipes-core/eglibc/eglibc.inc
>> +++ b/meta/recipes-core/eglibc/eglibc.inc
>> @@ -22,7 +22,7 @@ siteconfig_do_siteconfig_gencache_prepend = " \
>> # nptl needs unwind support in gcc, which can't be built without glibc.
>> DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
>> #this leads to circular deps, so lets not add it yet
>> -#RDEPENDS_ldd += " bash"
>> +RDEPENDS_ldd += " bash"
>> # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
>> #RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
>> PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
>> diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb b/meta/recipes-core/eglibc/eglibc_2.12.bb
>> index 85d58fa..fd7b485 100644
>> --- a/meta/recipes-core/eglibc/eglibc_2.12.bb
>> +++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
>> @@ -1,7 +1,7 @@
>> require eglibc.inc
>>
>> DEPENDS += "gperf-native"
>> -PR = "r18"
>> +PR = "r19"
>>
>> SRCREV = "14158"
>>
>> diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
>> index 7986131..be65787 100644
>> --- a/meta/recipes-core/eglibc/eglibc_2.13.bb
>> +++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
>> @@ -4,7 +4,7 @@ SRCREV = "14157"
>>
>> DEPENDS += "gperf-native"
>> FILESPATHPKG =. "eglibc-svn:"
>> -PR = "r5"
>> +PR = "r6"
>> PR_append = "+svnr${SRCPV}"
>>
>> EGLIBC_BRANCH="eglibc-2_13"
>> --
>> 1.7.3.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


