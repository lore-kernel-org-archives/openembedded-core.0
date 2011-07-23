Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QkSuD-0000uf-Qe
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jul 2011 05:29:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Jul 2011 20:25:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,251,1309762800"; d="scan'208";a="31017323"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by orsmga001.jf.intel.com with ESMTP; 22 Jul 2011 20:25:23 -0700
Message-ID: <4E2A3F22.8000007@linux.intel.com>
Date: Fri, 22 Jul 2011 20:25:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311378711.git.sgw@linux.intel.com>	<5d2ad40722bd5bca32c9c1da396e5dfc252120c7.1311378711.git.sgw@linux.intel.com>
	<1311379036.8710.1.camel@scimitar>
In-Reply-To: <1311379036.8710.1.camel@scimitar>
Subject: Re: [PATCH 1/3] openjade-native: Add SYSROOT_PREPROCESS_FUNC
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
X-List-Received-Date: Sat, 23 Jul 2011 03:29:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/22/2011 04:57 PM, Joshua Lock wrote:
> On Fri, 2011-07-22 at 16:54 -0700, Saul Wold wrote:
>> [YOCTO #1250]
>>
>> This added function will install a private install-catalog binary so that shared state
>> can find the binary as there is not a guarantee.
>>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>>   .../openjade/openjade-native_1.3.2.bb              |   12 ++++++++++--
>>   1 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
>> index 1c672e1..3922968 100644
>> --- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
>> +++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
>> @@ -7,7 +7,7 @@ SECTION = "base"
>>   LICENSE = "BSD"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=641ff1e4511f0a87044ad42f87cb1045"
>>
>> -PR = "r2"
>> +PR = "r3"
>>
>>   DEPENDS = "opensp-native sgml-common-native"
>>   RDEPENDS_${PN} = "sgml-common"
>> @@ -31,6 +31,8 @@ CONFIGUREOPTS := "${@d.getVar('CONFIGUREOPTS', True).replace('--datadir=${datadi
>>   CFLAGS =+ "-I${S}/include"
>>
>>   SSTATEPOSTINSTFUNCS += "openjade_sstate_postinst"
>> +SYSROOT_PREPROCESS_FUNCS += "openjade_sysroot_preprocess"
>> +
>>
>>   # We need to do this else the source interdependencies aren't generated and
>>   # build failures can result (e.g. zero size style/Makefile.dep file)
>> @@ -66,8 +68,14 @@ openjade_sstate_postinst() {
>>   	then
>>   		# Ensure that the catalog file sgml-docbook.cat is properly
>>   		# updated when the package is installed from sstate cache.
>> -		install-catalog \
>> +		${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-openjade \
>>   			--add ${sysconfdir}/sgml/sgml-docbook.cat \
>>   			${sysconfdir}/sgml/openjade-${PV}.cat
>>   	fi
>>   }
>> +
>> +docbook_sgml_dtd_sysroot_preprocess () {
>
> This is not the same function name as above...
>
Good catch on Johsua's part,  Bad on my part for not completing testing 
before sending this out.  I had a build going before I send the pull 
request.

Thanks
	Sau!

>> +    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
>> +    install -m 755 ${STAGING_BINDIR_NATIVE}/install-catalog ${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-openjade
>> +}
>> +
>


