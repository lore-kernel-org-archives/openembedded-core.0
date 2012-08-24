Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1T4zVX-0004D5-4i
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 21:25:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7OJDHZ6008934
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Aug 2012 12:13:17 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 24 Aug 2012 12:13:16 -0700
Message-ID: <5037D245.4010400@windriver.com>
Date: Fri, 24 Aug 2012 15:13:09 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Saul Wold <saul.wold@intel.com>
References: <cover.1345785364.git.bruce.ashfield@windriver.com>
	<6bfd8089c0dade4775adfac96644215ffdfc0f4e.1345785364.git.bruce.ashfield@windriver.com>
	<5037CC50.2050805@intel.com>
In-Reply-To: <5037CC50.2050805@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] kernel.bbclass: fix INC directory for SLANG
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2012 19:25:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-08-24 02:47 PM, Saul Wold wrote:
> On 08/23/2012 10:18 PM, Bruce Ashfield wrote:
>> From: Liang Li <liang.li@windriver.com>
>>
>> In the kernel's tools/perf/Makefile CFLAGS was previously hard coded to
>> contain "-I/usr/include/slang" to work with hosts that have
>> "/usr/include/slang/slang.h" as well as hosts that have
>> "/usr/include/slang.h". This path can cause compile warnings like:
>>
>> cc1: warning: '/usr/include/slang' doesn't exists.
>>
>> or
>>
>> cc1: warning: include location "/usr/include/slang" is unsafe for
>> cross-compilation [-Wpoison-system-directories]
>>
>> Then in some cases warnings become errors if WERROR is enabled hence
>> build errors.
>>
>> In coordination with a kernel fix, we can fix this error for all
>> kernels by modifying the perf Makefile within the staged kernel
>> source.
>>
>> Signed-off-by: Liang Li <liang.li@windriver.com>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>> meta/classes/kernel.bbclass | 3 +++
>> .../recipes-kernel/linux/linux-yocto/noslang.patch | 20
>> --------------------
>> meta/recipes-kernel/linux/linux-yocto_3.0.bb | 2 --
>> meta/recipes-kernel/linux/linux-yocto_3.2.bb | 2 --
>> meta/recipes-kernel/linux/linux-yocto_3.4.bb | 2 --
>> 5 files changed, 3 insertions(+), 26 deletions(-)
>> delete mode 100644 meta/recipes-kernel/linux/linux-yocto/noslang.patch
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index f34e632..fdef1be 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -204,6 +204,9 @@ kernel_do_install() {
>> for entry in $bin_files; do
>> rm -f $kerneldir/$entry
>> done
>> +
>> + # Fix SLANG_INC for slang.h
>> + sed -i 's#-I/usr/include/slang#-I=/usr/include/slang#g'
>> $kerneldir/tools/perf/Makefile
>> }
>>
>> sysroot_stage_all_append() {
>> diff --git a/meta/recipes-kernel/linux/linux-yocto/noslang.patch
>> b/meta/recipes-kernel/linux/linux-yocto/noslang.patch
>> deleted file mode 100644
>> index 9cada34..0000000
>> --- a/meta/recipes-kernel/linux/linux-yocto/noslang.patch
>> +++ /dev/null
>> @@ -1,20 +0,0 @@
>> -We (OE) install slang into /usr/include so we never need to look into
>> -/usr/include/slang/. We never want to look into a hardcoded path like
>> this
>> -since it triggers host infection issues. For now, simply remove this
>> -since it causes us problems.
>> -
>> -Upstream-Status: Pending (would need rework)
>> -
>> -Index: tools/perf/Makefile
>> -===================================================================
>> ---- linux.orig/tools/perf/Makefile 2012-08-07 10:29:43.020149620 +0000
>> -+++ linux/tools/perf/Makefile 2012-08-07 10:30:08.128148098 +0000
>> -@@ -504,7 +504,7 @@
>> - BASIC_CFLAGS += -DNO_NEWT_SUPPORT
>> - else
>> - # Fedora has /usr/include/slang/slang.h, but ubuntu
>> /usr/include/slang.h
>> -- BASIC_CFLAGS += -I/usr/include/slang
>> -+ # BASIC_CFLAGS += -I/usr/include/slang
>> - EXTLIBS += -lnewt -lslang
>> - LIB_OBJS += $(OUTPUT)util/ui/setup.o
>> - LIB_OBJS += $(OUTPUT)util/ui/browser.o
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
>> b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
>> index 4d19664..b9e5036 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
>> @@ -24,8 +24,6 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
>>
>> SRC_URI =
>> "git://git.yoctoproject.org/linux-yocto-3.0;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
>>
>>
>> -SRC_URI += "file://noslang.patch"
>> -
>> COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
>>
>> # Functionality flags
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
>> b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
>> index c3fb252..6a162dd 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
>> @@ -24,8 +24,6 @@ KMETA = "meta"
>>
>> SRC_URI =
>> "git://git.yoctoproject.org/linux-yocto-3.2;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
>>
>>
>> -SRC_URI += "file://noslang.patch"
>> -
>> COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
>>
>> # Functionality flags
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>> b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>> index 691d789..6fa4920 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>> @@ -13,8 +13,6 @@ SRCREV_meta ?=
>> "28bcd46af1d592dab39bd8a0891c872454fde8bc"
>>
>> SRC_URI =
>> "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
>>
>>
>> -SRC_URI += "file://noslang.patch"
>> -
>> LINUX_VERSION ?= "3.4.7"
>>
>> PR = "${INC_PR}.0"
>>
> Is a PR bump needed here?

Same branch has been updated with  PR = "${INC_PR}.1" for the three
kernel recipes.

Cheers,

Bruce

>
> Sau!
>



