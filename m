Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QQ2Yk-0005Ds-OJ
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 21:18:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p4RJFpOC027460
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 12:15:51 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 27 May 2011 12:15:50 -0700
Message-ID: <4DDFF866.5040302@windriver.com>
Date: Fri, 27 May 2011 14:15:50 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1306520012.git.nitin.a.kamble@intel.com>	<b883a6b6076317ebc3eb64f160c5f2df6996a95e.1306520012.git.nitin.a.kamble@intel.com>
	<BANLkTi=nTJ5-uFhtjMh0QhsJHZyRyRwfPA@mail.gmail.com>
In-Reply-To: <BANLkTi=nTJ5-uFhtjMh0QhsJHZyRyRwfPA@mail.gmail.com>
Subject: Re: [bugfix 1/2] gcc-4.6.0: fix ICE with armv7 target
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
X-List-Received-Date: Fri, 27 May 2011 19:18:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 5/27/11 1:25 PM, Khem Raj wrote:
> On Fri, May 27, 2011 at 11:15 AM,  <nitin.a.kamble@intel.com> wrote:
>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>>
>> This fixes an internal compiler error for gcc 4.6.0 for armv7
>>
>> Patch came from: Phil Blundell <pb@pbcl.net>
>> Validated by Nitin
>>
>> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>> Signed-Off-by: Phil Blundell <pb@pbcl.net>
>> ---
>>  meta/recipes-devtools/gcc/gcc-4.6.0.inc            |    3 +-
>>  .../gcc/gcc-4.6.0/ICE_fix_for_arm.patch            |   44 ++++++++++++++++++++
>>  2 files changed, 46 insertions(+), 1 deletions(-)
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/ICE_fix_for_arm.patch
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0.inc b/meta/recipes-devtools/gcc/gcc-4.6.0.inc
>> index fb5c70d..4407eca 100644
>> --- a/meta/recipes-devtools/gcc/gcc-4.6.0.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-4.6.0.inc
>> @@ -7,7 +7,7 @@ require gcc-common.inc
>>
>>  require gcc-4_6-branch-backports.inc
>>
>> -PR = "r2"
>> +PR = "r3"
>>
>>  DEPENDS =+ "mpfr gmp libmpc"
>>  NATIVEDEPS = "mpfr-native gmp-native gettext-native libmpc-native"
>> @@ -53,6 +53,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>           file://gcc-poison-parameters.patch \
>>           file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch \
>>           file://COLLECT_GCC_OPTIONS.patch \
>> +          file://ICE_fix_for_arm.patch \
>>          "
>>  SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch;patch=1 "
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/ICE_fix_for_arm.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/ICE_fix_for_arm.patch
>> new file mode 100644
>> index 0000000..037a180
>> --- /dev/null
>> +++ b/meta/recipes-devtools/gcc/gcc-4.6.0/ICE_fix_for_arm.patch
>> @@ -0,0 +1,44 @@
>> +Upstream-Status: Pending
>> +
>> +Patch came from: Phil Blundell <pb@pbcl.net>
>> +Validated by Nitin
>> +This fixes the following internal compiler error of gcc 4.6.0 on for armv7-a
>> +related gcc bugzilla: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=47719
>> +
>> +
>> +| arm-poky-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon
>> +-mfloat-abi=softfp -fno-tree-vectorize
>> +--sysroot=/srv/home/pokybuild/poky-slave/nightly-external/build/build/tmp/sysroots/beagleboard
>> +-c -I. -I../../../../src/gallium/include -I../../../../src/gallium/auxiliary
>> +-I../../../../src/gallium/drivers
>> +-I../../../../src/gallium/drivers/svga/include -O2 -pipe -g
>> +-feliminate-unused-debug-types -Wall -Wmissing-prototypes -std=c99 -ffast-math
>> +-fvisibility=hidden -fno-strict-aliasing -fPIC -D_GNU_SOURCE -DPTHREADS
>> +-DHAVE_POSIX_MEMALIGN -DUSE_XSHM -std=gnu99 -fvisibility=hidden -DHAVE_STDINT_H
>> +-DHAVE_SYS_TYPES_H svga_resource_buffer_upload.c -o
>> +svga_resource_buffer_upload.o
>> +| svga_tgsi_insn.c: In function 'svga_shader_emit_instructions':
>> +| svga_tgsi_insn.c:2969:1: internal compiler error: in push_minipool_fix, at
>> +config/arm/arm.c:12084
>> +| Please submit a full bug report,
>> +| with preprocessed source if appropriate.
>> +| See <http://gcc.gnu.org/bugs.html> for instructions.
>> +| make[4]: *** [svga_tgsi_insn.o] Error 1
>> +
>> +Nitin A Kamble <nitin.a.kamble@intel.com> 2011/05/27
>> +
>> +Index: gcc-4.6.0/gcc/config/arm/arm.md
>> +===================================================================
>> +--- gcc-4.6.0.orig/gcc/config/arm/arm.md
>> ++++ gcc-4.6.0/gcc/config/arm/arm.md
>> +@@ -4213,7 +4213,9 @@
>> +    uxth%?\\t%0, %1
>> +    ldr%(h%)\\t%0, %1"
>> +   [(set_attr "type" "alu_shift,load_byte")
>> +-   (set_attr "predicable" "yes")]
>> ++   (set_attr "predicable" "yes")
>> ++   (set_attr "pool_range" "*,256")
>> ++   (set_attr "neg_pool_range" "*,244")]
>> + )
>> +
> 
> FWIW a patch which is similar to this was rejected here.
> http://gcc.gnu.org/ml/gcc-patches/2011-02/msg01731.html
> 

based on that link, I'd say there are two cases that are needed for a proper
workaround.

Then likely we wait until upstream has a fix....

--Mark

>> + (define_insn "*arm_zero_extendhisi2addsi"
>> --
>> 1.7.3.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



