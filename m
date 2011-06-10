Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QV6cb-0002PZ-34
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 20:39:53 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 Jun 2011 11:36:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,348,1304319600"; d="scan'208";a="16897848"
Received: from unknown (HELO [10.255.12.216]) ([10.255.12.216])
	by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2011 11:36:30 -0700
Message-ID: <4DF2642E.5070706@linux.intel.com>
Date: Fri, 10 Jun 2011 11:36:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1307686598.git.sgw@linux.intel.com>	<79966738c56b3d8dbcb262642447f9efe7af930a.1307686610.git.sgw@linux.intel.com>
	<1307697909.2529.4983.camel@phil-desktop>
In-Reply-To: <1307697909.2529.4983.camel@phil-desktop>
Subject: Re: [CONSOLIDATED PULL 4/4] multiple recipes converted to -staticdev packages
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
X-List-Received-Date: Fri, 10 Jun 2011 18:39:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/10/2011 02:25 AM, Phil Blundell wrote:
> On Thu, 2011-06-09 at 23:26 -0700, Saul Wold wrote:
>> +DEPENDS_libpci-staticdev = "libpci-dev (= ${EXTENDPKGV})"
>
> This can't be right.  I guess that would be a good thing for
> recipe-sanity to test for in fact.
>
It's not, I did not catch the cut and paste error on the RDEPENDS vs 
DEPENDS.

>> +FILES_eglibc-dev_append += "${bindir}/rpcgen ${base_libdir}/*.o ${datadir}/aclocal"
>> +FILES_eglibc-staticdev_append += "${libdir}/*.a ${base_libdir}/*.a"
>
> You need to make sure that libc_nonshared.a goes into -dev rather than
> -staticdev somehow.  I didn't immediately spot any mechanism which would
> do this, though I haven't tested the package to find out what happens.
>
>> +FILES_uclibc-staticdev_append = "\
>> +        ${libdir}/*_nonshared.a \
>> +        ${libdir}/lib*.a \
>
> In similar vein, this doesn't look right.
>
I think I should be able to remove nonshared from a list.

>> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
>> index b77266a..ed4bcdb 100644
>> --- a/meta/recipes-core/util-linux/util-linux.inc
>> +++ b/meta/recipes-core/util-linux/util-linux.inc
>> @@ -13,6 +13,8 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=9c920d811858a74b67a36ba23cbaa95f
>>                       file://licenses/COPYING.UCB;md5=263860f8968d8bafa5392cab74285262 \
>>                       file://getopt/COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>>
>> +INC_PR = "r0"
>> +
>> diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
>> index 132f28b..3c5747c 100644
>> --- a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
>> +++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
>> @@ -1,5 +1,5 @@
>>   MAJOR_VERSION = "2.19"
>> -PR = "r1"
>> +PR = "${INC_PR}.0"
>
> This looks like it will cause PR to go backwards.
>
>>   require util-linux.inc
>>
>>   # note that `lscpu' is under GPLv3+
>> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
>> index 08c14b2..82d9511 100644
>> --- a/meta/recipes-devtools/binutils/binutils.inc
>> +++ b/meta/recipes-devtools/binutils/binutils.inc
>> @@ -24,7 +24,6 @@ FILES_${PN} = " \
>>
>>   FILES_${PN}-dev = " \
>>   	${includedir} \
>> -	${libdir}/*.a \
>>   	${libdir}/*.la \
>>   	${libdir}/libbfd.so \
>>   	${libdir}/libopcodes.so"
>
> This one is a bit odd: it seems to just be dropping the .a files
> altogether without introducing a -staticdev package for them.
>
I thought that maybe the default rule provided in bitbake.conf should 
accomplish this since it is FILES_${PN}-staticdev = "${libdir}/*.a 
${base_libdir}/*.a"


>> +DEPENDS_libg2c-staticdev = "libg2c-dev (= ${EXTENDPKGV})"
>> +DEPENDS_libstdc++-staticdev = "libstdc++-dev (= ${EXTENDPKGV})"
>> +DEPENDS_libssp-staticdev = "libssp-dev (= ${EXTENDPKGV})"
>> +DEPENDS_libfortran-staticdev = "libfortran-dev (= ${EXTENDPKGV})"
>> +DEPENDS_libmudflap-staticdev = "libmudflap-dev (= ${EXTENDPKGV})"
>> +DEPENDS_libopkg${PKGSUFFIX}-staticdev = "libopkg${PKGSUFFIX}-dev (= ${EXTENDPKGV})"
>
> Those all look wrong.
>
Cut and paste issue

>> --- a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
>> +++ b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
>> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>>   			file://include/a52.h;beginline=1;endline=12;md5=81152ceb3562bf20a60d1b6018175dd1"
>>   SECTION = "libs"
>>   PRIORITY = "optional"
>> -PR = "r2"
>> +PR = "r3"
>>
>>   inherit autotools
>>
>> @@ -21,7 +21,8 @@ EXTRA_OECONF = " --enable-shared "
>>   PACKAGES =+ "a52dec a52dec-dbg a52dec-doc"
>>
>>   FILES_${PN} = " ${libdir}/liba52.so.0 ${libdir}/liba52.so.0.0.0 "
>> -FILES_${PN}-dev = " ${includedir}/a52dec/*.h ${libdir}/liba52.so ${libdir}/liba52.la ${libdir}/liba52.a "
>> +#FILES_${PN}-dev = " ${includedir}/a52dec/*.h ${libdir}/liba52.so ${libdir}/liba52.la "
>> +#FILES_${PN}-staticdev = " ${libdir}/liba52.a "
>
> This is a bit weird.  What's going on here?
>
As above, trying to ensure that the default bitbake.conf rules would work.

>> +DEPENDS_lib${PN}-staticdev = "lib${PN}-dev (= ${EXTENDPKGV})"
>
> As above.
>
>> +DEPENDS_lib${PN}-staticdev = "lib${PN}-dev (= ${EXTENDPKGV})"
>
> Ditto.
>
> All in all I think this patch needs a bit more work.  It was quite a big
> diff so I only skimmed it rather than reviewing it thoroughly but I
> don't think it is quite ready to go in yet.  Also, can't a lot of this
> be done in bitbake.conf without quite so much recipe patching?
>
Most of it is done there, I was looking at adding a staticdev.bbclass 
that would handle the lib${PN} case generically, as a second phase of this.

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


