Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BAC6870AA8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 01:23:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7B1NIDF010453
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Aug 2014 18:23:18 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 10 Aug 2014 18:23:17 -0700
Message-ID: <53E81B00.3070803@windriver.com>
Date: Mon, 11 Aug 2014 09:23:12 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1407678222.git.hongxu.jia@windriver.com>
	<af818f3281c55ad5c06332310cf1e5940217c06c.1407678222.git.hongxu.jia@windriver.com>
	<20140810142146.GR14848@jama>
In-Reply-To: <20140810142146.GR14848@jama>
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] guile: workaround ice ssa corruption while DEBUG_BUILD
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
X-List-Received-Date: Mon, 11 Aug 2014 01:23:25 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Ok, I will rebase to your patch since yours merged. V2 incomming.

//Hongxu


On 08/10/2014 10:21 PM, Martin Jansa wrote:
> On Sun, Aug 10, 2014 at 09:47:12PM +0800, Hongxu Jia wrote:
>> Add:
>> MACHINE = "qemux86-64"
>> DEBUG_BUILD = "1"
>> to local.conf and there was a ssa corruption to build guile:
>> ..
>> Unable to coalesce ssa_names 48 and 3476 which are marked as MUST COALESCE.
>> sp_48(ab) and  sp_3476(ab)
>> guile-2.0.11/libguile/vm-engine.c: In function 'vm_debug_engine':
>> guile-2.0.11/libguile/vm.c:673:19: internal compiler error: SSA corruption
>>   #define VM_NAME   vm_debug_engine
>>                     ^
>> guile-2.0.11/libguile/vm-engine.c:39:1: note: in expansion of macro 'VM_NAME'
>>   VM_NAME (SCM vm, SCM program, SCM *argv, int nargs)
>>   ^
>> Please submit a full bug report,
>> with preprocessed source if appropriate.
>> See <http://gcc.gnu.org/bugs.html> for instructions.
>> ...
>>
>> Tweak libguile/vm-i-system.c to add boundary value check to workaround it.
>>
>> Also fix qa issue while DEBUG_BUILD:
>> ...
>> WARNING: QA Issue: guile rdepends on ncurses-libncurses but its not a build dependency? [build-deps]
>> WARNING: QA Issue: guile rdepends on readline but its not a build dependency? [build-deps]
>> ...
>>
>> [YOCTO #6411]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   .../files/workaround-ice-ssa-corruption.patch      | 52 ++++++++++++++++++++++
>>   meta/recipes-devtools/guile/guile_2.0.11.bb        |  8 +++-
>>   2 files changed, 59 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-devtools/guile/files/workaround-ice-ssa-corruption.patch
>>
>> diff --git a/meta/recipes-devtools/guile/files/workaround-ice-ssa-corruption.patch b/meta/recipes-devtools/guile/files/workaround-ice-ssa-corruption.patch
>> new file mode 100644
>> index 0000000..1363d63
>> --- /dev/null
>> +++ b/meta/recipes-devtools/guile/files/workaround-ice-ssa-corruption.patch
>> @@ -0,0 +1,52 @@
>> +libguile/vm-i-system.c: workaround ice ssa corruption while compiling with option -g -O
>> +
>> +While compiling with option -g -O, there was a ssa corruption:
>> +..
>> +Unable to coalesce ssa_names 48 and 3476 which are marked as MUST COALESCE.
>> +sp_48(ab) and  sp_3476(ab)
>> +guile-2.0.11/libguile/vm-engine.c: In function 'vm_debug_engine':
>> +guile-2.0.11/libguile/vm.c:673:19: internal compiler error: SSA corruption
>> + #define VM_NAME   vm_debug_engine
>> +                   ^
>> +guile-2.0.11/libguile/vm-engine.c:39:1: note: in expansion of macro 'VM_NAME'
>> + VM_NAME (SCM vm, SCM program, SCM *argv, int nargs)
>> + ^
>> +Please submit a full bug report,
>> +with preprocessed source if appropriate.
>> +See <http://gcc.gnu.org/bugs.html> for instructions.
>> +...
>> +
>> +Tweak libguile/vm-i-system.c to add boundary value check to workaround it.
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +---
>> + libguile/vm-i-system.c | 11 +++++++----
>> + 1 file changed, 7 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/libguile/vm-i-system.c b/libguile/vm-i-system.c
>> +index 5057fb0..8d31214 100644
>> +--- a/libguile/vm-i-system.c
>> ++++ b/libguile/vm-i-system.c
>> +@@ -625,10 +625,13 @@ VM_DEFINE_INSTRUCTION (47, bind_optionals_shuffle, "bind-optionals/shuffle", 6,
>> +   /* now shuffle up, from walk to ntotal */
>> +   {
>> +     scm_t_ptrdiff nshuf = sp - walk + 1, i;
>> +-    sp = (fp - 1) + ntotal + nshuf;
>> +-    CHECK_OVERFLOW ();
>> +-    for (i = 0; i < nshuf; i++)
>> +-      sp[-i] = walk[nshuf-i-1];
>> ++    if (nshuf > 0)
>> ++    {
>> ++      sp = (fp - 1) + ntotal + nshuf;
>> ++      CHECK_OVERFLOW ();
>> ++      for (i = 0; i < nshuf; i++)
>> ++        sp[-i] = walk[nshuf-i-1];
>> ++    }
>> +   }
>> +   /* and fill optionals & keyword args with SCM_UNDEFINED */
>> +   while (walk <= (fp - 1) + ntotal)
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb b/meta/recipes-devtools/guile/guile_2.0.11.bb
>> index d19460a..e380bed 100644
>> --- a/meta/recipes-devtools/guile/guile_2.0.11.bb
>> +++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
>> @@ -21,6 +21,9 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
>>              file://arm_endianness.patch \
>>              "
>>   
>> +SRC_URI_append_class-target = " \
>> +           ${@base_conditional( "DEBUG_BUILD", "1", " file://workaround-ice-ssa-corruption.patch", "", d )} \
>> +           "
>>   #           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
>>   #           file://opensuse/guile-turn-off-gc-test.patch
>>   
>> @@ -35,7 +38,10 @@ DEPENDS = "libunistring bdwgc gmp libtool libffi"
>>   # add guile-native only to the target recipe's DEPENDS
>>   DEPENDS_append_class-target = " guile-native libatomics-ops"
>>   
>> -RDEPENDS_${PN}_append_libc-glibc_class-target = "glibc-gconv-iso8859-1"
>> +RDEPENDS_${PN}_append_class-target = " \
>> +             ${@base_conditional( "DEBUG_BUILD", "1", " readline ncurses", "", d )} \
>> +             "
> This seems to be needed even withotu DEBUG_BUILD, see
> http://lists.openembedded.org/pipermail/openembedded-core/2014-August/095585.html
> and IMHO it's build time dependncy not runtime.
>
>> +RDEPENDS_${PN}_append_libc-glibc_class-target = " glibc-gconv-iso8859-1"
>>   
>>   EXTRA_OECONF += "${@['--without-libltdl-prefix --without-libgmp-prefix --without-libreadline-prefix', ''][bb.data.inherits_class('native',d)]}"
>>   
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


