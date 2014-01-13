Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8CC326B7AD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 22:15:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Jan 2014 14:11:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,655,1384329600"; d="scan'208";a="438258110"
Received: from unknown (HELO [10.255.12.133]) ([10.255.12.133])
	by orsmga001.jf.intel.com with ESMTP; 13 Jan 2014 14:15:24 -0800
Message-ID: <52D4657B.1030602@linux.intel.com>
Date: Mon, 13 Jan 2014 14:15:23 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1389376488-22286-1-git-send-email-ross.burton@intel.com>	<1389376488-22286-2-git-send-email-ross.burton@intel.com>
	<52D4635F.6030304@linux.intel.com>
In-Reply-To: <52D4635F.6030304@linux.intel.com>
Subject: Re: [PATCH 1/3] cmake: respect ${S} and ${B}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Jan 2014 22:15:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/13/2014 02:06 PM, Saul Wold wrote:
> On 01/10/2014 09:54 AM, Ross Burton wrote:
>> Instead of the class-specific variables OECMAKE_BUILDPATH and
>> OECMAKE_SOURCEPATH, just use ${B} and ${S}.
>>
>> If these two paths are different, delete any existing ${B} before
>> running a
>> build so that previous builds don't taint the current build.
>>
>> Note that OECMAKE_SOURCEPATH and OECMAKE_BUILDPATH are not respected,
>> so recipes
>> that manually set these in the past will need to be updated to either use
>> something along the lines of separatebuilddir.inc or set B
>> themselves.  If the
>> old variables are set, a warning is displayed.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>   meta/classes/cmake.bbclass |   35 +++++++++++------------------------
>>   1 file changed, 11 insertions(+), 24 deletions(-)
>>
>> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
>> index 30c1792..1dc406d2 100644
>> --- a/meta/classes/cmake.bbclass
>> +++ b/meta/classes/cmake.bbclass
>> @@ -6,15 +6,6 @@ CCACHE = ""
>>   # We want the staging and installing functions from autotools
>>   inherit autotools
>>
>> -# Use in-tree builds by default but allow this to be changed
>> -# since some packages do not support them (e.g. llvm 2.5).
>> -OECMAKE_SOURCEPATH ?= "."
>> -
>> -# If declaring this, make sure you also set EXTRA_OEMAKE to
>> -# "-C ${OECMAKE_BUILDPATH}". So it will run the right makefiles.
>> -OECMAKE_BUILDPATH ?= ""
>> -B="${S}"
>> -
>>   # C/C++ Compiler (without cpu arch/tune arguments)
>>   OECMAKE_C_COMPILER ?= "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
>>   OECMAKE_CXX_COMPILER ?= "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
>> @@ -73,10 +64,14 @@ EOF
>>   addtask generate_toolchain_file after do_patch before do_configure
>>
>>   cmake_do_configure() {
>> -    if [ ${OECMAKE_BUILDPATH} ]
>> -    then
>> -        mkdir -p ${OECMAKE_BUILDPATH}
>> -        cd ${OECMAKE_BUILDPATH}
>> +    if [ "${OECMAKE_BUILDPATH}" -o "${OECMAKE_SOURCEPATH}" ]; then
>> +        bbnote "cmake.bbclass no longer uses OECMAKE_SOURCEPATH and
>> OECMAKE_BUILDPATH. This recipe now will do in-tree builds, to do
>> out-of-tree builds set S and B."
>> +    fi
>> +
>> +    if [ "${S}" != "${B}" ]; then
>> +        rm -rf ${B}
>> +        mkdir -p ${B}
>> +        cd ${B}
>>       fi
>>
>>       # Just like autotools cmake can use a site file to cache result
>> that need generated binaries to run
>> @@ -88,7 +83,7 @@ cmake_do_configure() {
>>
>>       cmake \
>>         ${OECMAKE_SITEFILE} \
>> -      ${OECMAKE_SOURCEPATH} \
>> +      ${S} \
>>         -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
>>         -DCMAKE_INSTALL_SO_NO_EXE=0 \
>>         -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
>> @@ -98,20 +93,12 @@ cmake_do_configure() {
>>   }
>>
>>   cmake_do_compile()  {
>> -    if [ ${OECMAKE_BUILDPATH} ]
>> -    then
>> -        cd ${OECMAKE_BUILDPATH}
>> -    fi
>> -
>> +    cd ${B}
>>       base_do_compile
>>   }
>>
>>   cmake_do_install() {
>> -    if [ ${OECMAKE_BUILDPATH} ];
>> -    then
>> -        cd ${OECMAKE_BUILDPATH}
>> -    fi
>> -
>> +    cd ${B}
>>       autotools_do_install
>
> This seems to cause a problem:
> ERROR: Logfile of failure stored in:
> /srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/cmake/2.8.12.1-r0/temp/log.do_install.5697
>
> Log data follows:
> | DEBUG: SITE files ['endian-big', 'bit-32', 'powerpc-common',
> 'common-linux', 'common-glibc', 'powerpc32-linux', 'powerpc-linux',
> 'common']
> | DEBUG: Executing shell function do_install
> | NOTE: make -j 16
> DESTDIR=/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/cmake/2.8.12.1-r0/image
> install
> | make: *** No rule to make target `install'.  Stop.
> | ERROR: oe_runmake failed
> | WARNING:
> /srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/cmake/2.8.12.1-r0/temp/run.do_install.5697:1
> exit 1 from
> |   exit 1
> | ERROR: Function failed: do_install (log file is located at
> /srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/cmake/2.8.12.1-r0/temp/log.do_install.5697)
>
> ERROR: Task 7891
> (/srv/hdd/poky/meta/recipes-devtools/cmake/cmake_2.8.12.1.bb,
> do_install) failed with exit code '1'
>
>
Oops, sorry spoke to soon, needed to have a clean WORKDIR, I was 
building in a pre existing tmp.

Sorry for the noise.

Sau!

> Sau!
>
>>   }
>>
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

