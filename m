Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1730D731D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 21:29:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0ELTkw3016647
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:29:47 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Thu, 14 Jan 2016 13:29:46 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1452805356.git.peter.seebach@windriver.com>
	<f6baa71e96dbb72af5d9a48fcea142544bc47795.1452805356.git.peter.seebach@windriver.com>
	<CAJ86T=USrxx9LmAHpZXC9wnMDCZ1s-NT+Fq+H=ovLApjU8ks1A@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56981349.4070904@windriver.com>
Date: Thu, 14 Jan 2016 15:29:45 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=USrxx9LmAHpZXC9wnMDCZ1s-NT+Fq+H=ovLApjU8ks1A@mail.gmail.com>
Subject: Re: [PATCH 1/1] Use TUNE_CCARGS for target compilation
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
X-List-Received-Date: Thu, 14 Jan 2016 21:29:49 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 1/14/16 3:24 PM, Andre McCurdy wrote:
> Hi Peter,
> 
> On Thu, Jan 14, 2016 at 1:04 PM, Peter Seebach
> <peter.seebach@windriver.com> wrote:
>> The initial gcc configuration is using TARGET_CFLAGS, but this is
>> probably not what is intended, because TARGET_CFLAGS doesn't include
>> any architecture-specific flags.
> 
> I think the current behaviour is deliberate, in order to try to make
> it possible to reuse gcc binaries across builds for machines with
> different CPU tuning flags.
> 
> See the comments associated with this commit from 2014, which
> effectively makes all ARM toolchains default to soft float (instead of
> defaulting to fpu calling convention of the target machine).
> 
>   http://git.openembedded.org/openembedded-core/commit/?id=ce1f3fd20d81545d6d5dfc68f86f9fddf8ac9bbf
> 
>> For PPC64, it's possible to end up with gcc configured to pass -a64 to
>> the assembler, but be itself getting invoked without -m64, which can result
>> in alignment problems in generated code. Solution: Instead of setting
>> CFLAGS_FOR_TARGET to TARGET_CFLAGS, set it to TARGET_CFLAGS + TUNE_CCARGS.
> 
> Could that PPC64 issue be solved in the same way that the default arch
> is set in gcc-configure-common.inc for the various MIPS targets?
> 
>   EXTRA_OECONF_append_mips64 = " --with-abi=64 --with-arch-64=mips64
> --with-tune-64=mips64"
>   EXTRA_OECONF_append_mips64el = " --with-abi=64 --with-arch-64=mips64
> --with-tune-64=mips64"
>   EXTRA_OECONF_append_mips64n32 = " --with-abi=64
> --with-arch-64=mips64 --with-tune-64=mips64"
>   EXTRA_OECONF_append_mips64eln32 = " --with-abi=64
> --with-arch-64=mips64 --with-tune-64=mips64"

The issue Peter was working on is specific to building something that runs on
the host.  (or the hostsdk machine).

The problem is, if you are building for a target that say needs -mpowerpc.  That
won't work when you pass it to the compiler building an x86_64 target binary.

So in the crosssdk case (host to -sdk- target) we clear the TUNE_*ARGS since
they are not relevant.

Then int he main gcc setup, we manually setup the target CCFLAGS to include the
tune elements so when NOT in the crosssdk, they will be properly included and
build the -target- pieces with the correct options.  (target pieces such as the
.o files gcc needs to produce.)

--Mark

> 
>> However, for crosssdk cases, we need to prevent that from having any
>> effect; this can be done by emptying out the TUNE_*ARGS flags in the
>> crosssdk bbclass, because there is no "target tune" in crosssdk cases.
>>
>> Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
>> ---
>>  meta/classes/crosssdk.bbclass                      | 4 ++++
>>  meta/recipes-devtools/gcc/gcc-configure-common.inc | 2 +-
>>  meta/recipes-devtools/gcc/gcc-cross.inc            | 2 +-
>>  3 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
>> index 7315c38..ccff3ce 100644
>> --- a/meta/classes/crosssdk.bbclass
>> +++ b/meta/classes/crosssdk.bbclass
>> @@ -6,6 +6,10 @@ PACKAGE_ARCH = "${SDK_ARCH}"
>>  python () {
>>         # set TUNE_PKGARCH to SDK_ARCH
>>         d.setVar('TUNE_PKGARCH', d.getVar('SDK_ARCH', True))
>> +       # We're not running a 'target', so clear these...
>> +       d.setVar('TUNE_CCARGS', '')
>> +       d.setVar('TUNE_LDARGS', '')
>> +       d.setVar('TUNE_ASARGS', '')
>>  }
>>
>>  STAGING_DIR_TARGET = "${STAGING_DIR}/${SDK_ARCH}-${SDKPKGSUFFIX}${SDK_VENDOR}-${SDK_OS}"
>> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
>> index 45b3f15..4b4d91d 100644
>> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
>> @@ -120,7 +120,7 @@ do_configure () {
>>         export CPPFLAGS_FOR_BUILD="${BUILD_CPPFLAGS}"
>>         export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
>>         export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
>> -       export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
>> +       export CFLAGS_FOR_TARGET="${TARGET_CFLAGS} ${TUNE_CCARGS}"
>>         export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
>>         export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
>>         export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
>> index aa10633..b6020a4 100644
>> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
>> @@ -43,7 +43,7 @@ do_compile () {
>>         export LD_FOR_TARGET="${TARGET_SYS}-ld"
>>         export NM_FOR_TARGET="${TARGET_SYS}-nm"
>>         export CC_FOR_TARGET="${CCACHE} ${TARGET_SYS}-gcc"
>> -       export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
>> +       export CFLAGS_FOR_TARGET="${TARGET_CFLAGS} ${TUNE_CCARGS}"
>>         export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
>>         export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
>>         export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
>> --
>> 2.3.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


