Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QgiPO-0001jq-G0
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 21:14:14 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jul 2011 12:10:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,522,1304319600"; d="scan'208";a="29504105"
Received: from unknown (HELO [10.255.14.40]) ([10.255.14.40])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jul 2011 12:10:15 -0700
Message-ID: <4E1C9C17.2050905@linux.intel.com>
Date: Tue, 12 Jul 2011 12:10:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1310425837.git.sgw@linux.intel.com>	<f5be3f07f8372f657d248c739a666cf25fff06a4.1310425837.git.sgw@linux.intel.com>
	<917F1944-E900-4DD8-8A44-FB1F3AB9F330@dominion.thruhere.net>
In-Reply-To: <917F1944-E900-4DD8-8A44-FB1F3AB9F330@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 14/26] tcp-wrappers: Use bitbake default FILES for packaging
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
X-List-Received-Date: Tue, 12 Jul 2011 19:14:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2011 12:16 AM, Koen Kooi wrote:
>
> Op 12 jul 2011, om 01:13 heeft Saul Wold het volgende geschreven:
>
>> This will ensure correct -dev and -staticdev packging
>>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>> .../tcp-wrappers/tcp-wrappers_7.6.bb               |   17 ++++++++++-------
>> 1 files changed, 10 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
>> index 1aeb9ff..1acb15a 100644
>> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
>> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
>> @@ -5,13 +5,16 @@ SECTION = "console/network"
>>
>> LICENSE = "tcp-wrappers"
>> LIC_FILES_CHKSUM = "file://DISCLAIMER;md5=071bd69cb78b18888ea5e3da5c3127fa"
>> -PR ="r0"
>> +PR ="r1"
>>
>>
>> -PACKAGES = "${PN}-dbg libwrap libwrap-doc libwrap-dev tcp-wrappers tcp-wrappers-doc"
>> -FILES_libwrap = "${base_libdir}/lib*.so.*"
>
> base_libdir
>
>> +PACKAGES = "${PN}-dbg libwrap libwrap-doc libwrap-dev libwrap-staticdev \
>> +            tcp-wrappers tcp-wrappers-doc"
>> +FILES_libwrap = "${base_libdir}/lib*${SOLIBS}
>
> base_libdir, so far, so good
>
Correct they are needed in base_libdir since they are used by cmds 
located in base_bindir.

>> FILES_libwrap-doc = "${mandir}/man3 ${mandir}/man5"
>> -FILES_libwrap-dev = "${libdir}/lib*.so ${libdir}/lib*.a ${includedir}"
>> +FILES_libwrap-dev = "${libdir}/lib*${SOLIBSDEV} ${includedir}"
>
> libdir
>
>> +FILES_libwrap-staticdev = "${libdir}/lib*.a"
>
> libdir
>
This also seems OK to me (not my doing originally) as it matches how 
other libraries are delivered.

>> +RDEPENDS_libwrap-staticdev = "libwrap-dev (= ${EXTENDPKGV})"
>> FILES_tcp-wrappers = "${bindir}"
>> FILES_tcp-wrappers-doc = "${mandir}/man8"
>>
>> @@ -86,9 +89,9 @@ do_install () {
>> 	oe_libinstall -C shared -so libwrap ${D}${base_libdir}
>>
>> 	rel_lib_prefix=`echo ${libdir} | sed 's,\(^/\|\)[^/][^/]*,..,g'`
>> -	libname=`readlink ${D}${base_libdir}/libwrap.so | xargs basename`
>> -	ln -s ${rel_lib_prefix}${base_libdir}/${libname} ${D}${libdir}/libwrap.so
>> -	rm -f ${D}${base_libdir}/libwrap.so
>> +	libname=`readlink ${D}${base_libdir}/libwrap${SOLIBSDEV} | xargs basename`
>> +	ln -s ${rel_lib_prefix}${base_libdir}/${libname} ${D}${libdir}/libwrap${SOLIBSDEV}
>> +	rm -f ${D}${base_libdir}/libwrap${SOLIBSDEV}
>
> And here some bits get moved between base_libdir and libdir, what is it trying to do?

Based on the make file the .so is delivered into base_libdir and needs 
to be moved to libdir, thus this code.

Sau!

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


