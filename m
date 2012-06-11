Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SeCvn-0002io-7r
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 00:17:52 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Jun 2012 15:07:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="154966072"
Received: from unknown (HELO [10.255.12.133]) ([10.255.12.133])
	by azsmga001.ch.intel.com with ESMTP; 11 Jun 2012 15:07:15 -0700
Message-ID: <4FD66C13.8010603@linux.intel.com>
Date: Mon, 11 Jun 2012 15:07:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1339194124.git.nitin.a.kamble@intel.com>
	<01b0f43cacd0beed93aebd108730bfe420ab2397.1339194124.git.nitin.a.kamble@intel.com>
	<4FD28477.9020201@linux.intel.com>
In-Reply-To: <4FD28477.9020201@linux.intel.com>
Cc: yocto@yoctoproject.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [PATCH 1/1] eglibc: remove runtime dependency of perl from eglibc-mtrace
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
X-List-Received-Date: Mon, 11 Jun 2012 22:17:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2012 04:02 PM, Darren Hart wrote:
>
>
> On 06/08/2012 03:23 PM, nitin.a.kamble@intel.com wrote:
>> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>>
>> perl needs eglibc to build.
>> The presence of runtime dependency of
>> perl for eglibc-mtrace caused bitbake to build perl before eglibc,
>> which causes build failure of perl with poky-tiny distro
>>
>
> So is this a circular dependency chain?
>
> perl DEPENDS on eglibc
> eglibc (because of eglibc-mtrace) RDEPENDS on perl?
>
> If so, doesn't this solution leave eglibc-mtrace with an incomplete set
> of dependencies in it's final package meta-data?
>
> Would the correct solution be to break eglibc-mtrace out into a separate
> recipe.
>
I am not sure if this would be more correct or have the PACKAGES contain 
something like ${EGLIBC_PACKAGE_MTRACE}, which could the be over-ridden 
by the yocto-tiny distro.

EGLIBC_PACKAGE_MTRACE ?= "${PN}-mtrace"

and then change ${PN}-mtrace in the PACKAGES list to 
${EGLIBC_PACKAGE_MTRACE}.

This exposes another "global", so I am not sure which is better.

Sau!


> eglibc-mtrace.bb could then DEPENDS=eglibc and RDEPENDS=perl and
> poky-tiny would need to be able to exclude eglibc-mtrace.
>
>
>>    This fixes bug: [YOCTO #2523]
>>
>> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
>> ---
>>   meta/recipes-core/eglibc/eglibc-package.inc |    1 -
>>   1 files changed, 0 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
>> index ce37155..423729a 100644
>> --- a/meta/recipes-core/eglibc/eglibc-package.inc
>> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
>> @@ -55,7 +55,6 @@ FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/audit/.debug"
>>   FILES_catchsegv${PKGSUFFIX} = "${bindir}/catchsegv"
>>   RDEPENDS_catchsegv${PKGSUFFIX} = "libsegfault"
>>   RDEPENDS_${PN}-utils += "bash"
>> -RDEPENDS_${PN}-mtrace += "perl"
>>   FILES_${PN}-pcprofile = "${base_libdir}/libpcprofile.so"
>>   FILES_eglibc-thread-db${PKGSUFFIX} = "${base_libdir}/libthread_db.so.* ${base_libdir}/libthread_db-*.so"
>>   RPROVIDES_${PN}-dev += "libc-dev"
>


