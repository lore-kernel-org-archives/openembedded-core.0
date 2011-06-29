Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qbybt-0007hw-5t
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 19:31:33 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jun 2011 10:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,444,1304319600"; d="scan'208";a="21982183"
Received: from swold-mobl.jf.intel.com (HELO [10.24.82.35]) ([10.24.82.35])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2011 10:27:34 -0700
Message-ID: <4E0B6086.1070100@linux.intel.com>
Date: Wed, 29 Jun 2011 10:27:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1309305731.git.sgw@linux.intel.com>	<8ef199fe606464ce6bdfef2329607c037ecdbc61.1309305731.git.sgw@linux.intel.com>	<1309357085.20015.399.camel@rex>
	<4E0B519D.40701@linux.intel.com>
	<743A25DC-4AB0-4F27-A05B-E2E20552DAB9@dominion.thruhere.net>
In-Reply-To: <743A25DC-4AB0-4F27-A05B-E2E20552DAB9@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/2] multiple recipes converted to -staticdev packages
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
X-List-Received-Date: Wed, 29 Jun 2011 17:31:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/29/2011 09:26 AM, Koen Kooi wrote:
>
> Op 29 jun 2011, om 18:23 heeft Saul Wold het volgende geschreven:
>
>> On 06/29/2011 07:18 AM, Richard Purdie wrote:
>>> Hi Saul,
>>>
>>> I'm still not 100% sure this patch is the right way to go or not. Let me
>>> ask some specific questions below.
>>>
>>> On Tue, 2011-06-28 at 17:07 -0700, Saul Wold wrote:
>>>> This commit adds a new base package ${PN}-staticdev to
>>>> bitbake.conf which pulls in the static *.a libraries as
>>>> a seperate package, it filters out the nonshared.a
>>>> libraries where appropriate.
>>>>
>>>> Additional this commit adds a new libdev.bbclass which provides
>>>> a set of macros and variables to convert ${PN} to lib${PN},
>>>> which a number of recipes where then converted to use.
>>>>
>>>> PR bumps all around
>>>>
>>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>>> ---
>>>>   meta/classes/lib_package.bbclass                   |   10 ++++-
>>>>   meta/classes/libdev.bbclass                        |   44 ++++++++++++++++++++
>>>>   meta/conf/bitbake.conf                             |    8 +++-
>>>>   meta/recipes-bsp/pciutils/pciutils_3.1.7.bb        |    7 ++-
>>>>   .../wireless-tools/wireless-tools_29.bb            |    9 +++-
>>>>   meta/recipes-core/eglibc/eglibc-common.inc         |    2 +-
>>>>   meta/recipes-core/eglibc/eglibc-package.inc        |    9 +++-
>>>>   meta/recipes-core/gettext/gettext_0.18.1.1.bb      |   16 ++++----
>>>>   meta/recipes-core/glibc/glibc-package.inc          |    9 +++-
>>>>   .../meta/external-csl-toolchain_2008q3-72.bb       |    8 ++-
>>>>   meta/recipes-core/uclibc/uclibc.inc                |    9 +++-
>>>>   meta/recipes-core/udev/udev-new.inc                |   14 ++++--
>>>>   meta/recipes-core/udev/udev_164.bb                 |    2 +-
>>>>   meta/recipes-core/util-linux/util-linux.inc        |   11 ++++-
>>>>   meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
>>>>   .../binutils/binutils-cross-canadian_2.21.bb       |    2 +-
>>>>   meta/recipes-devtools/binutils/binutils-cross.inc  |    2 +
>>>>   .../binutils/binutils-cross_csl-arm-2008q1.bb      |    2 +-
>>>>   .../binutils/binutils-crosssdk_2.21.bb             |    2 +-
>>>>   meta/recipes-devtools/binutils/binutils.inc        |    9 +---
>>>>   meta/recipes-devtools/binutils/binutils_2.21.bb    |    2 +-
>>>>   meta/recipes-devtools/gcc/gcc-package-runtime.inc  |   25 ++++++++---
>>>>   meta/recipes-devtools/gcc/libgcc_4.6.bb            |    2 +-
>>>>   meta/recipes-devtools/opkg/opkg_0.1.8.bb           |    8 ++-
>>>>   meta/recipes-devtools/opkg/opkg_svn.bb             |    8 ++-
>>>>   meta/recipes-devtools/python/python_2.6.6.bb       |    4 +-
>>>>   meta/recipes-devtools/rpm/rpm_5.4.0.bb             |   18 ++++----
>>>>   meta/recipes-extended/augeas/augeas.inc            |    7 +--
>>>>   meta/recipes-extended/augeas/augeas_0.8.1.bb       |    2 +-
>>>>   meta/recipes-extended/gamin/gamin_0.1.10.bb        |   13 +-----
>>>>   .../tcp-wrappers/tcp-wrappers_7.6.bb               |    9 +++-
>>>>   meta/recipes-graphics/cairo/cairo_1.10.2.bb        |    9 ++--
>>>>   meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb     |    7 +--
>>>>   meta/recipes-multimedia/liba52/liba52_0.7.4.bb     |    4 +-
>>>>   meta/recipes-support/attr/acl_2.2.51.bb            |    2 +-
>>>>   meta/recipes-support/attr/attr_2.4.46.bb           |    2 +-
>>>>   meta/recipes-support/attr/ea-acl.inc               |   16 +-------
>>>>   meta/recipes-support/curl/curl_7.21.6.bb           |   17 +++-----
>>>>   meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb       |    5 +-
>>>>   meta/recipes-support/sqlite/sqlite3.inc            |   10 +----
>>>>   meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb     |    2 +-
>>>>   41 files changed, 203 insertions(+), 146 deletions(-)
>>>>   create mode 100644 meta/classes/libdev.bbclass
>>>>
>>>> diff --git a/meta/classes/lib_package.bbclass b/meta/classes/lib_package.bbclass
>>>> index 5ce8727..e8cbc25 100644
>>>> --- a/meta/classes/lib_package.bbclass
>>>> +++ b/meta/classes/lib_package.bbclass
>>>> @@ -5,6 +5,12 @@ FILES_${PN} = "${libexecdir} ${libdir}/lib*${SOLIBS} \
>>>>   	    ${base_libdir}/*${SOLIBS} \
>>>>   	    ${datadir}/${PN} ${libdir}/${PN}"
>>>>   FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
>>>> -		${libdir}/*.o ${libdir}/pkgconfig /lib/*.o \
>>>> -		${datadir}/aclocal ${bindir}/*-config"
>>>> +            ${libdir}/*.o ${libdir}/pkgconfig /lib/*.o \
>>>> +            ${datadir}/aclocal ${bindir}/*-config \
>>>> +            ${libdir}/*_nonshared.a"
>>>>   FILES_${PN}-bin = "${bindir}/* ${sbindir}/* /bin/* /sbin/*"
>>>> +
>>>> +staticdev_libs = "${libdir}/*.a ${base_libdir}/*.a"
>>>> +FILES_${PN}-staticdev = "${@oe_filter_out('lib.*_nonshared.a', '${staticdev_libs}', d)}"
>>>
>>> As Phil says, I'm not sure this works and since the nonshared.a thing is
>>> a *libc thing its probably not worth adding this complexity to the core
>>> but just work putting it in the *libc packaging code.
>>>
>>
>> I have tested this and it works, after reviewing this further, I will move this to handled by the specific cases that need, rather than being a general solution in bitbake.conf
>>
>>>> diff --git a/meta/classes/libdev.bbclass b/meta/classes/libdev.bbclass
>>>> new file mode 100644
>>>> index 0000000..d0aac2f
>>>> --- /dev/null
>>>> +++ b/meta/classes/libdev.bbclass
>>>> @@ -0,0 +1,44 @@
>>>> +#
>>>> +# This bbclass it a common case for lib${PN}*.a static libraries
>>>> +#
>>>> +
>>>> +SUMMARY_lib${PN}-dbg ?= "${SUMMARY} - Debugging files"
>>>> +DESCRIPTION_lib${PN}-dbg ?= "${DESCRIPTION}  \
>>>> +This package contains ELF symbols and related sources for debugging purposes."
>>>> +
>>>> +SUMMARY_lib${PN}-dev ?= "${SUMMARY} - Development files"
>>>> +DESCRIPTION_lib${PN}-dev ?= "${DESCRIPTION}  \
>>>> +This package contains symbolic links, header files, and \
>>>> +related items necessary for software development."
>>>> +
>>>> +SUMMARY_lib${PN}-doc ?= "${SUMMARY} - Documentation files"
>>>> +DESCRIPTION_lib${PN}-doc ?= "${DESCRIPTION} This package contains documentation."
>>>> +
>>>> +SUMMARY_lib${PN}-staticdev ?= "${SUMMARY} - Development files (Static Libraries)"
>>>> +DESCRIPTION_lib${PN}-staticdev?= "${DESCRIPTION}  \
>>>> +This package contains static libraries for software development."
>>>> +
>>>> +PACKAGES =+ "lib${PN} lib${PN}-dev lib${PN}-doc lib${PN}-staticdev"
>>>> +
>>>> +FILES_lib${PN} = "${base_libdir}/lib*.so.* ${libdir}/lib*.so.*"
>>>> +RDEPENDS_lib${PN} = "${PN}"
>>>> +
>>>> +FILES_lib${PN}-dev = "${includedir} \
>>>> +                      ${libdir}/lib*.so \
>>>> +                      ${libdir}/lib*_nonshared.a \
>>>> +                      ${libdir}/lib*.la \
>>>> +                      ${libdir}/pkgconfig \
>>>> +                      ${base_libdir}/lib*.so \
>>>> +                      ${base_libdir}/lib*_nonshared.a \
>>>> +                      ${base_libdir}/lib*.la"
>>>> +
>>>> +
>>>> +FILES_lib${PN}-doc = "${mandir}/man2 \
>>>> +                      ${mandir}/man3"
>>>> +
>>>> +lib_staticdev_libs = "${libdir}/*.a ${base_libdir}/*.a"
>>>> +FILES_lib${PN}-staticdev = "${@oe_filter_out('lib.*_nonshared.a', '${lib_staticdev_libs}', d)}"
>>>> +
>>>> +
>>>> +SECTION_lib${PN}-staticdev = "devel"
>>>> +RDEPENDS_lib${PN}-staticdev = "lib${PN}-dev (= ${EXTENDPKGV})"
>>>
>>> This file is doing *way* more than just some static lib packaging.
>>>
>>> I'm totally in favour of splitting out libraries where it makes sense
>>> but do we have strong usecases for standalone -doc, -dev, -dbg or
>>> -staticdev packaging?
>>>
>>
>> I was originally following the existing use cases of the lib${PN}-* packages, but after reviewing it now, I am going to change approaches and rename the lib${PN}-* packages to ${PN}-* only leaving the core lib${PN}.
>>
>>> Also, how does this compare to the the other lib_package.bbclass or
>>> whatever its called?
>>>
>> The other lib_package.bbclass is maybe mis-named, it would be better named bin_package.bbclass since it explicitly moves the binaries in ${bindir} and ${sbindir} into a separate ${PN}-bin package instead of in the ${PN} package itself.
>
> It's not mis-named, since it moves all the things that impair shlib renaming out of the way, so it's a great tool for packaging libraries.
>

Koen,

As I am looking at lib_package.bbclass and the staticdev work, I am 
trying to understand why the lib_package.bbclass could not be simplified 
to just the following:

PACKAGES += "${PN}-bin"
FILES_${PN}-bin = "${bindir}/* ${sbindir}/* /bin/* /sbin/*"

As this will grab all the binaries first (as RP pointed out) and then 
the FILES_${PN} and FILES_${PN}-dev that are already declared in 
bitbake.conf will collect the remaining files?  Then this is bin packaging.

Similarly, what is currently in my new libdev.bbclass would contain:

PACKAGES += "lib${PN}"
FILES_lib${PN} = "${libdir}/*${SOLIBS} ${base_libdir}/*${SOLIBS}"
RDEPENDS_lib${PN} = "${PN}"

And the rest of the packaging would happen based on the defaults in 
bitbake.conf.  This is no longer a libdev class, but a packaging of the 
libs in lib${PN}.

These need to be in independent and separate bbclass files otherwise we 
will have different undesirable packaging issues.

I am verifying these changes now.

Sau!



  _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


