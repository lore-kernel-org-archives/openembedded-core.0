Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SIiTR-0003pY-Tu
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 17:31:46 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3DFMMme020165
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Apr 2012 08:22:23 -0700 (PDT)
Received: from msp-dhcp21.wrs.com (172.25.34.21) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 13 Apr 2012 08:22:22 -0700
Message-ID: <4F8844AD.8090406@windriver.com>
Date: Fri, 13 Apr 2012 10:22:21 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1334265557.git.mark.hatle@windriver.com>
	<3d06ef85d583f8ef824cb7ca91ff070dcddd0e8b.1334265557.git.mark.hatle@windriver.com>
	<4F884293.6000101@linux.intel.com>
In-Reply-To: <4F884293.6000101@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] pseudo: Tell pseudo to avoid specifying an RPATH
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
X-List-Received-Date: Fri, 13 Apr 2012 15:31:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/13/12 10:13 AM, Saul Wold wrote:
> On 04/12/2012 02:21 PM, Mark Hatle wrote:
>> [Yocto #2251]
>>
>> Add --without-rpath to avoid embedding rpaths into the pseudo
>> components.
>>
>> Signed-off-by: Mark Hatle<mark.hatle@windriver.com>
>> ---
>>    meta/recipes-devtools/pseudo/pseudo.inc    |    8 ++++----
>>    meta/recipes-devtools/pseudo/pseudo_1.3.bb |    2 +-
>>    meta/recipes-devtools/pseudo/pseudo_git.bb |    2 +-
>>    3 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
>> index 664a9b5..d5c33df 100644
>> --- a/meta/recipes-devtools/pseudo/pseudo.inc
>> +++ b/meta/recipes-devtools/pseudo/pseudo.inc
>> @@ -29,9 +29,9 @@ NO32LIBS ??= "0"
>>    # Compile for the local machine arch...
>>    do_compile () {
>>    	if [ "${SITEINFO_BITS}" == "64" ]; then
>> -	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=${SITEINFO_BITS} --enable-static-sqlite
>> +	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
>>    	else
>> -	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=${SITEINFO_BITS} --enable-static-sqlite
>> +	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
>>    	fi
>>    	oe_runmake ${MAKEOPTS}
>>    }
>> @@ -42,7 +42,7 @@ do_compile () {
>>    do_compile_prepend_virtclass-native () {
>>    	if [ "${SITEINFO_BITS}" == "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" == "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
>>    		# We need the 32-bit libpseudo on a 64-bit machine...
>> -		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32
>> +		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
>>    		oe_runmake ${MAKEOPTS} libpseudo
>>    		# prevent it from removing the lib, but remove everything else
>>    		make 'LIB=foo' ${MAKEOPTS} distclean
>> @@ -52,7 +52,7 @@ do_compile_prepend_virtclass-native () {
>>    do_compile_prepend_virtclass-nativesdk () {
>>    	if [ "${SITEINFO_BITS}" == "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" == "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
>>    		# We need the 32-bit libpseudo on a 64-bit machine...
>> -		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32
>> +		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
> We might still need this rpath or something similar since the nativesdk
> now breaks not finding the correct version of the included libc.so.6

In this case, I don't think embedding a static RPATH makes sense, but perhaps a 
$ORIGIN path might?

Can chrpath be used to add an rpath after compilation and linking, if so that is 
what I would suggest to do.  Otherwise I'm not exactly sure how to resolve this...

Note, typically pseudo is -not- linked the "sdk" version of the libc, but is 
linked to the host libc.  In the past when exporting and sdk with something like 
pseudo you needed to either build on a common machine (where everything was 
compatible) or have a way to rebuild pseudo on the final target system.  Perhaps 
that is what is needed?

--Mark

> /opt/poky/1.2/sysroots/x86_64-pokysdk-linux/usr/bin/pseudo -P
> /opt/poky/1.2/sysroots/x86_64-pokysdk-linux/usr tar -C "/tmp/opt" -xjf
> "/intel/home/sgw/Downloads/core-image-minimal-qemux86-64.tar.bz2"
> tar: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.14' not found
> (required by
> /opt/poky/1.2/sysroots/x86_64-pokysdk-linux/usr/lib/pseudo/lib64/libpseudo.so)
>
> See also bug 1968
>
> I do have a libc.so.6.
>
> /opt/poky/1.2/sysroots/x86_64-pokysdk-linux/lib/libc.so.6 ->  libc-2.15.so
>
> Sau!
>
>>    		oe_runmake ${MAKEOPTS} libpseudo
>>    		# prevent it from removing the lib, but remove everything else
>>    		make 'LIB=foo' ${MAKEOPTS} distclean
>> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.3.bb b/meta/recipes-devtools/pseudo/pseudo_1.3.bb
>> index e7a329c..080b739 100644
>> --- a/meta/recipes-devtools/pseudo/pseudo_1.3.bb
>> +++ b/meta/recipes-devtools/pseudo/pseudo_1.3.bb
>> @@ -1,6 +1,6 @@
>>    require pseudo.inc
>>
>> -PR = "r7"
>> +PR = "r8"
>>
>>    SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
>>
>> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
>> index 9414c79..7857275 100644
>> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
>> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
>> @@ -2,7 +2,7 @@ require pseudo.inc
>>
>>    SRCREV = "f0375c9aaefbccfd41aebbf6d332bb4d9e8f980c"
>>    PV = "1.3+git${SRCPV}"
>> -PR = "r22"
>> +PR = "r23"
>>
>>    DEFAULT_PREFERENCE = "-1"
>>



