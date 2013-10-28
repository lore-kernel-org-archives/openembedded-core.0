Return-Path: <cjp256@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3E0B260EE8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 23:54:51 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id el20so5923025lab.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 16:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=pP0xoG+Emw575o9jUIn50q+DYPMLDoHQgal5WJM5NiA=;
	b=oiuGawTWRqXF2V7svIr9sk8HNu0sIArR88NOGU64fgb9RFBAicMG4Tgn8dFr0MIp4z
	hBnP2XnkghLXbw8BxlRV0WdwQLC9zIgLpTxv8oOFrj4zUSKYooseNQ5t51hc62NK5LJd
	hXd8sytbXlj5NfzGggnqUFal7rjG+e3uHC/ltzopbn7yp056LL+GlXjci5HTYp+jb9Qt
	HwdDOAyaFYMmhngWsAzBDkM7smdMaUh2zEYV+RU8jpOTqLrw9C7KE5cnl2poa/OGPK8a
	pzaO4M2hT9/kslZaEozslt5xG/P9uTW7/ZG2kvaACWT4G6/j8dYyktqaUWHkBtzlh6fH
	dcKg==
MIME-Version: 1.0
X-Received: by 10.152.116.109 with SMTP id jv13mr3569087lab.30.1383004492059; 
	Mon, 28 Oct 2013 16:54:52 -0700 (PDT)
Received: by 10.114.181.41 with HTTP; Mon, 28 Oct 2013 16:54:51 -0700 (PDT)
In-Reply-To: <5268DEE0.7000506@linux.intel.com>
References: <1381882516-29599-1-git-send-email-cjp256@gmail.com>
	<5268DEE0.7000506@linux.intel.com>
Date: Mon, 28 Oct 2013 19:54:51 -0400
Message-ID: <CABZSBQepb=+J-OSGkD7Kt-u9sZU0eLJ+-NSqZS-np9tp6xc2RQ@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: upgrade to 1.6.1
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
X-List-Received-Date: Mon, 28 Oct 2013 23:54:54 -0000
Content-Type: multipart/alternative; boundary=001a11c3675e78d70a04e9d5d379

--001a11c3675e78d70a04e9d5d379
Content-Type: text/plain; charset=ISO-8859-1

Hey Saul,

My tests built qemu-native, qemu-helper-native, qemuwrapper-cross, and qemu
for MACHINE_LIST="qemuarm qemumips qemuppc qemux86 qemux86-64 qemux86
sugarbay".  For each machine, I tested running core-image-minimal in the
qemu instance using runqemu.  I should add that my tests were all on a
x86-64 build system.

I'm not terribly familiar with the nativesdk, and (foolishly) neglected to
test that.  However, I looked into it, and it looks like the
relocatable_sdk.patch affects a linker script that is no longer available.
 I dropped the patch and tested installing an oe-core sdk sysroot (via
bitbake -c populate_sdk core-image-minimal) and qemu appears to work fine
from within the sdk environment.

I'm open to suggestions for further testing this upgrade (particularly a
case to cover what relocatable_sdk.patch was originally intended to
resolve). I'm certainly not the expert here, but am willing to help out.

Other notes:

- I did notice that qemu-native should possibly depend on libsdl for the
qemu-native instance.  For users of qemu-native (such as myself), you do
not necessarily get an automatic (SDL) video window unless libsdl
development libraries are installed on the build system. This is perhaps
because there does not appear to be a libsdl-native dependency available
for qemu, but from my testing seemingly pretty straightforward to add.
 However, from docs I've seen online ("getting started - openembedded")
imply you should install libsdl-dev for the build environemnt, and this
does enable SDL support (assuming libsdl is available).  In short,
nativesdk does specify nativesdk-libsdl as a dependency and native does not
(in fact, there is no libsdl-native), and as a result, user may see
differences in behavior.  I assume this is intended...?

- I'm using bitbake from master and have a missing fcntl python module
dependency in my sdk in order to use runqemu wrapper from within the sdk
environment.  I assume that this is not supposed to work and running
qemu-system-* directly within the sdk environment bypasses this issue.

Cheers,
Chris


On Thu, Oct 24, 2013 at 4:48 AM, Saul Wold <sgw@linux.intel.com> wrote:

> On 10/15/2013 05:15 PM, Chris Patterson wrote:
>
>> This update also drops the following patches which appear to have been
>> resolved upstream:
>> - ftd_header.patch
>> - target-i386-Fix-aflag-logic-**for-CODE64-and-the-0x67-.patch
>> - target-ppc_fix_bit_extraction.**patch
>>
>>  There seems to be a problem with one of the patches when building for
> the nativesdk
>
>> ERROR: Command Error: exit status: 1  Output:
>> Applying patch relocatable_sdk.patch
>> can't find file to patch at input line 13
>> Perhaps you used the wrong -p or --strip option?
>> The text leading up to this was:
>> --------------------------
>> |Upstream-Status: Inappropriate [SDK specific]
>> |
>> |In order to be able to change the dynamic loader path when relocating
>> |binaries, the interp section has to be made big enough to accomodate
>> |the new path (4096 is the maximum path length in Linux).
>> |
>> |Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>> |
>> |Index: qemu-1.4.0/ldscripts/i386.ld
>> |=============================**==============================**========
>> |--- qemu-1.4.0.orig/ldscripts/**i386.ld  2013-02-15 15:05:35.000000000
>> -0800
>> |+++ qemu-1.4.0/ldscripts/i386.ld       2013-02-28 22:55:36.138816418
>> -0800
>> --------------------------
>> No file to patch.  Skipping patch.
>> 1 out of 1 hunk ignored
>> can't find file to patch at input line 26
>> Perhaps you used the wrong -p or --strip option?
>> The text leading up to this was:
>> --------------------------
>> |Index: qemu-1.4.0/ldscripts/x86_64.ld
>> |=============================**==============================**========
>> |--- qemu-1.4.0.orig/ldscripts/x86_**64.ld        2013-02-15
>> 15:05:35.000000000 -0800
>> |+++ qemu-1.4.0/ldscripts/x86_64.ld     2013-02-28 22:55:36.138816418
>> -0800
>> --------------------------
>> No file to patch.  Skipping patch.
>> 1 out of 1 hunk ignored
>> Patch relocatable_sdk.patch does not apply (enforce with -f)
>> ERROR: Function failed: patch_do_patch
>>
>
> Also, since qemu is core to the testing and developmen, can you clarify
> for us what kind of testing you have done across the architectures.
>
> Thanks
>         Sau!
>
>
>
>
>  Signed-off-by: Chris Patterson <cjp256@gmail.com>
>> ---
>>   meta/recipes-devtools/qemu/**files/fdt_header.patch  | 39 -----------
>>   ...-Fix-aflag-logic-for-**CODE64-and-the-0x67-.patch | 79
>> ----------------------
>>   .../qemu/files/target-ppc_fix_**bit_extraction.patch | 70
>> -------------------
>>   meta/recipes-devtools/qemu/**qemu.inc                |  2 +-
>>   .../qemu/{qemu_1.5.0.bb => qemu_1.6.1.bb}          | 15 ++--
>>   5 files changed, 9 insertions(+), 196 deletions(-)
>>   delete mode 100644 meta/recipes-devtools/qemu/**files/fdt_header.patch
>>   delete mode 100644 meta/recipes-devtools/qemu/**
>> files/target-i386-Fix-aflag-**logic-for-CODE64-and-the-0x67-**.patch
>>   delete mode 100644 meta/recipes-devtools/qemu/**
>> files/target-ppc_fix_bit_**extraction.patch
>>   rename meta/recipes-devtools/qemu/{qe**mu_1.5.0.bb<http://qemu_1.5.0.bb>=>
>> qemu_1.6.1.bb} (44%)
>>
>> diff --git a/meta/recipes-devtools/qemu/**files/fdt_header.patch
>> b/meta/recipes-devtools/qemu/**files/fdt_header.patch
>> deleted file mode 100644
>> index dccfe53..0000000
>> --- a/meta/recipes-devtools/qemu/**files/fdt_header.patch
>> +++ /dev/null
>> @@ -1,39 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -qemu: define fdt types in libfdt_env.h from qemu
>> -
>> -    * fixes
>> -    In file included from /home/oe/setup-scripts/build/**
>> tmp-angstrom_next-uclibc/**sysroots/x86_64-linux/usr/**
>> include/libfdt.h:55:0,
>> -                     from /home/oe/setup-scripts/build/**
>> tmp-angstrom_next-uclibc/work/**x86_64-linux/qemu-native/1.4.**
>> 0-r0/qemu-1.4.0/hw/arm/../../**device_tree.c:28:
>> -    /home/oe/setup-scripts/build/**tmp-angstrom_next-uclibc/**
>> sysroots/x86_64-linux/usr/**include/fdt.h:58:2: error: unknown type name
>> 'fdt32_t'
>> -    /home/oe/setup-scripts/build/**tmp-angstrom_next-uclibc/**
>> sysroots/x86_64-linux/usr/**include/fdt.h:59:2: error: unknown type name
>> 'fdt32_t'
>> -    /home/oe/setup-scripts/build/**tmp-angstrom_next-uclibc/**
>> sysroots/x86_64-linux/usr/**include/fdt.h:60:2: error: unknown type name
>> 'fdt32_t'
>> -    /home/oe/setup-scripts/build/**tmp-angstrom_next-uclibc/**
>> sysroots/x86_64-linux/usr/**include/fdt.h:61:2: error: unknown type name
>> 'fdt32_t'
>> -    /home/oe/setup-scripts/build/**tmp-angstrom_next-uclibc/**
>> sysroots/x86_64-linux/usr/**include/fdt.h:62:2: error: unknown type name
>> 'fdt32_t'
>> -    /home/oe/setup-scripts/build/**tmp-angstrom_next-uclibc/**
>> sysroots/x86_64-linux/usr/**include/fdt.h:63:2: error: unknown type name
>> 'fdt32_t'
>> -    /home/oe/setup-scripts/build/**tmp-angstrom_next-uclibc/**
>> sysroots/x86_64-linux/usr/**include/fdt.h:64:2: error: unknown type name
>> 'fdt32_t'
>> -    /home/oe/setup-scripts/build/**tmp-angstrom_next-uclibc/**
>> sysroots/x86_64-linux/usr/**include/fdt.h:67:2: error: unknown type name
>> 'fdt32_t'
>> -    /home/oe/setup-scripts/build/**tmp-angstrom_next-uclibc/**
>> sysroots/x86_64-linux/usr/**include/fdt.h:70:2: error: unknown type name
>> 'fdt32_t'
>> -    /home/oe/setup-scripts/build/**tmp-angstrom_next-uclibc/**
>> sysroots/x86_64-linux/usr/**include/fdt.h:73:2: error: unknown type name
>> 'fdt32_t'
>> -    /home/oe/setup-scripts/build/**tmp-angstrom_next-uclibc/**
>> sysroots/x86_64-linux/usr/**include/fdt.h:77:2: error: unknown type name
>> 'fdt64_t'
>> -    /home/oe/setup-scripts/build/**tmp-angstrom_next-uclibc/**
>> sysroots/x86_64-linux/usr/**include/fdt.h:78:2: error: unknown type name
>> 'fdt64_t'
>> -    /home/oe/setup-scripts/build/**tmp-angstrom_next-uclibc/**
>> sysroots/x86_64-linux/usr/**include/fdt.h:82:2: error: unknown type name
>> 'fdt32_t'
>> -    /home/oe/setup-scripts/build/**tmp-angstrom_next-uclibc/**
>> sysroots/x86_64-linux/usr/**include/fdt.h:87:2: error: unknown type name
>> 'fdt32_t'
>> -    /home/oe/setup-scripts/build/**tmp-angstrom_next-uclibc/**
>> sysroots/x86_64-linux/usr/**include/fdt.h:88:2: error: unknown type name
>> 'fdt32_t'
>> -    /home/oe/setup-scripts/build/**tmp-angstrom_next-uclibc/**
>> sysroots/x86_64-linux/usr/**include/fdt.h:89:2: error: unknown type name
>> 'fdt32_t'
>> -
>> -Index: qemu-1.4.0/include/libfdt_env.**h
>> -=============================**==============================**========
>> ---- qemu-1.4.0.orig/include/**libfdt_env.h       2013-02-15
>> 23:05:35.000000000 +0000
>> -+++ qemu-1.4.0/include/libfdt_env.**h    2013-04-13 14:17:27.918885225
>> +0000
>> -@@ -21,6 +21,10 @@
>> -
>> - #include "qemu/bswap.h"
>> -
>> -+typedef uint16_t fdt16_t;
>> -+typedef uint32_t fdt32_t;
>> -+typedef uint64_t fdt64_t;
>> -+
>> - #ifdef HOST_WORDS_BIGENDIAN
>> - #define fdt32_to_cpu(x)  (x)
>> - #define cpu_to_fdt32(x)  (x)
>> diff --git a/meta/recipes-devtools/qemu/**files/target-i386-Fix-aflag-**
>> logic-for-CODE64-and-the-0x67-**.patch b/meta/recipes-devtools/qemu/**
>> files/target-i386-Fix-aflag-**logic-for-CODE64-and-the-0x67-**.patch
>> deleted file mode 100644
>> index 852efd1..0000000
>> --- a/meta/recipes-devtools/qemu/**files/target-i386-Fix-aflag-**
>> logic-for-CODE64-and-the-0x67-**.patch
>> +++ /dev/null
>> @@ -1,79 +0,0 @@
>> -Upstream-Status: Backported
>> -
>> -From dec3fc9657e0682637de4d5a29d947**284d01985c Mon Sep 17 00:00:00 2001
>> -From: Richard Henderson <rth@twiddle.net>
>> -Date: Wed, 29 May 2013 12:30:51 -0700
>> -Subject: [PATCH] target-i386: Fix aflag logic for CODE64 and the 0x67
>> prefix
>> -
>> -The code reorganization in commit 4a6fd938 broke handling of PREFIX_ADR.
>> -While fixing this, tidy and comment the code so that it's more obvious
>> -what's going on in setting both aflag and dflag.
>> -
>> -The TARGET_X86_64 ifdef can be eliminated because CODE64 expands to the
>> -constant zero when TARGET_X86_64 is undefined.
>> -
>> -Cc: Paolo Bonzini <pbonzini@redhat.com>
>> -Reported-by: Laszlo Ersek <lersek@redhat.com>
>> -Signed-off-by: Richard Henderson <rth@twiddle.net>
>> -Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>> -Message-id: 1369855851-21400-1-git-send-**email-rth@twiddle.net<1369855851-21400-1-git-send-email-rth@twiddle.net>
>> -Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
>> ----
>> - target-i386/translate.c |   30 +++++++++++++++---------------
>> - 1 file changed, 15 insertions(+), 15 deletions(-)
>> -
>> -diff --git a/target-i386/translate.c b/target-i386/translate.c
>> -index 0aeccdb..14b0298 100644
>> ---- a/target-i386/translate.c
>> -+++ b/target-i386/translate.c
>> -@@ -4677,8 +4677,6 @@ static target_ulong disas_insn(CPUX86State *env,
>> DisasContext *s,
>> -     }
>> -     s->pc = pc_start;
>> -     prefixes = 0;
>> --    aflag = s->code32;
>> --    dflag = s->code32;
>> -     s->override = -1;
>> -     rex_w = -1;
>> -     rex_r = 0;
>> -@@ -4801,23 +4799,25 @@ static target_ulong disas_insn(CPUX86State *env,
>> DisasContext *s,
>> -     }
>> -
>> -     /* Post-process prefixes.  */
>> --    if (prefixes & PREFIX_DATA) {
>> --        dflag ^= 1;
>> --    }
>> --    if (prefixes & PREFIX_ADR) {
>> --        aflag ^= 1;
>> --    }
>> --#ifdef TARGET_X86_64
>> -     if (CODE64(s)) {
>> --        if (rex_w == 1) {
>> --            /* 0x66 is ignored if rex.w is set */
>> --            dflag = 2;
>> -+        /* In 64-bit mode, the default data size is 32-bit.  Select
>> 64-bit
>> -+           data with rex_w, and 16-bit data with 0x66; rex_w takes
>> precedence
>> -+           over 0x66 if both are present.  */
>> -+        dflag = (rex_w > 0 ? 2 : prefixes & PREFIX_DATA ? 0 : 1);
>> -+        /* In 64-bit mode, 0x67 selects 32-bit addressing.  */
>> -+        aflag = (prefixes & PREFIX_ADR ? 1 : 2);
>> -+    } else {
>> -+        /* In 16/32-bit mode, 0x66 selects the opposite data size.  */
>> -+        dflag = s->code32;
>> -+        if (prefixes & PREFIX_DATA) {
>> -+            dflag ^= 1;
>> -         }
>> --        if (!(prefixes & PREFIX_ADR)) {
>> --            aflag = 2;
>> -+        /* In 16/32-bit mode, 0x67 selects the opposite addressing.  */
>> -+        aflag = s->code32;
>> -+        if (prefixes & PREFIX_ADR) {
>> -+            aflag ^= 1;
>> -         }
>> -     }
>> --#endif
>> -
>> -     s->prefix = prefixes;
>> -     s->aflag = aflag;
>> ---
>> -1.7.9.5
>> -
>> diff --git a/meta/recipes-devtools/qemu/**files/target-ppc_fix_bit_**extraction.patch
>> b/meta/recipes-devtools/qemu/**files/target-ppc_fix_bit_**
>> extraction.patch
>> deleted file mode 100644
>> index 631d23b..0000000
>> --- a/meta/recipes-devtools/qemu/**files/target-ppc_fix_bit_**
>> extraction.patch
>> +++ /dev/null
>> @@ -1,70 +0,0 @@
>> -Delivered-To: raj.khem@gmail.com
>> -Received: by 10.50.216.195 with SMTP id os3csp11191igc;
>> -        Thu, 15 Aug 2013 04:32:45 -0700 (PDT)
>> -X-Received: by 10.180.98.3 with SMTP id ee3mr1508103wib.48.**
>> 1376566364872;
>> -        Thu, 15 Aug 2013 04:32:44 -0700 (PDT)
>> -Return-Path: <aurelien@aurel32.net>
>> -Received: from hall.aurel32.net (hall.aurel32.net.
>> [2001:470:1f0b:4a8::1])
>> -        by mx.google.com with ESMTPS id vv5si15578100wjc.49.2013.08.**
>> 15.04.32.44
>> -        for <raj.khem@gmail.com>
>> -        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
>> -        Thu, 15 Aug 2013 04:32:44 -0700 (PDT)
>> -Received-SPF: pass (google.com: best guess record for domain of
>> aurelien@aurel32.net designates 2001:470:1f0b:4a8::1 as permitted
>> sender) client-ip=2001:470:1f0b:4a8::**1;
>> -Authentication-Results: mx.google.com;
>> -       spf=pass (google.com: best guess record for domain of
>> aurelien@aurel32.net designates 2001:470:1f0b:4a8::1 as permitted
>> sender) smtp.mail=aurelien@aurel32.net
>> -Received: from [2001:470:d4ed:1:2db:dfff:**fe14:52d] (helo=
>> ohm.aurel32.net)
>> -       by hall.aurel32.net with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_**
>> SHA1:128)
>> -       (Exim 4.80)
>> -       (envelope-from <aurelien@aurel32.net>)
>> -       id 1V9vnG-0006cO-NN; Thu, 15 Aug 2013 13:32:42 +0200
>> -Received: from aurel32 by ohm.aurel32.net with local (Exim 4.80)
>> -       (envelope-from <aurelien@aurel32.net>)
>> -       id 1V9vnF-0002Lw-7L; Thu, 15 Aug 2013 13:32:41 +0200
>> -From: Aurelien Jarno <aurelien@aurel32.net>
>> -To: qemu-devel@nongnu.org
>> -Cc: Khem Raj <raj.khem@gmail.com>,
>> -       Alexander Graf <agraf@suse.de> ,
>> -       qemu-stable@nongnu.org,
>> -       qemu-ppc@nongnu.org,
>> -       Aurelien Jarno <aurelien@aurel32.net>
>> -Subject: [PATCH] target-ppc: fix bit extraction for FPBF and FPL
>> -Date: Thu, 15 Aug 2013 13:32:38 +0200
>> -Message-Id: <1376566358-8989-1-git-send-**email-aurelien@aurel32.net<1376566358-8989-1-git-send-email-aurelien@aurel32.net>
>> >
>> -X-Mailer: git-send-email 1.7.10.4
>> -
>> -Bit extraction for the FP BF and L field of the MTFSFI and MTFSF
>> -instructions is wrong and doesn't match the reference manual (which
>> -explain the bit number in big endian format). It has been broken in
>> -commit 7d08d85645def18eac2a9d672c1868**a35e0bcf79.
>> -
>> -This patch fixes this, which in turn fixes the problem reported by
>> -Khem Raj about the floor() function of libm.
>> -
>> -Reported-by: Khem Raj <raj.khem@gmail.com>
>> -Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
>> -
>> -Upstream-Status: Backport
>> -
>> ----
>> - target-ppc/translate.c |    4 ++--
>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>> -
>> -I don't know if we still have time to get this into 1.6, hence the Cc:
>> -to stable. In anycase it also needs to be fixed in 1.5.
>> -
>> -Index: qemu-1.5.0/target-ppc/**translate.c
>> -=============================**==============================**========
>> ---- qemu-1.5.0.orig/target-ppc/**translate.c     2013-05-20
>> 08:34:40.000000000 -0700
>> -+++ qemu-1.5.0/target-ppc/**translate.c  2013-08-15 06:49:25.028144352
>> -0700
>> -@@ -428,9 +428,9 @@
>> - EXTRACT_HELPER(SR, 16, 4);
>> -
>> - /* mtfsf/mtfsfi */
>> --EXTRACT_HELPER(FPBF, 19, 3);
>> -+EXTRACT_HELPER(FPBF, 23, 3);
>> - EXTRACT_HELPER(FPIMM, 12, 4);
>> --EXTRACT_HELPER(FPL, 21, 1);
>> -+EXTRACT_HELPER(FPL, 25, 1);
>> - EXTRACT_HELPER(FPFLM, 17, 8);
>> - EXTRACT_HELPER(FPW, 16, 1);
>> -
>> diff --git a/meta/recipes-devtools/qemu/**qemu.inc
>> b/meta/recipes-devtools/qemu/**qemu.inc
>> index 1b861d7..e533a84 100644
>> --- a/meta/recipes-devtools/qemu/**qemu.inc
>> +++ b/meta/recipes-devtools/qemu/**qemu.inc
>> @@ -55,7 +55,7 @@ do_configure() {
>>          KVMOPTS="--enable-kvm"
>>       fi
>>
>> -    ${S}/configure --prefix=${prefix} --sysconfdir=${sysconfdir}
>> --libexecdir=${libexecdir} --disable-strip ${EXTRA_OECONF} $KVMOPTS
>> +    ${S}/configure --prefix=${prefix} --sysconfdir=${sysconfdir}
>> --libexecdir=${libexecdir} --localstatedir=${**localstatedir}
>> --disable-strip ${EXTRA_OECONF} $KVMOPTS
>>       test ! -e ${S}/target-i386/beginend_**funcs.sh || chmod a+x
>> ${S}/target-i386/beginend_**funcs.sh
>>   }
>>
>> diff --git a/meta/recipes-devtools/qemu/q**emu_1.5.0.bb<http://qemu_1.5.0.bb>b/meta/recipes-devtools/qemu/
>> q**emu_1.6.1.bb <http://qemu_1.6.1.bb>
>> similarity index 44%
>> rename from meta/recipes-devtools/qemu/qem**u_1.5.0.bb<http://qemu_1.5.0.bb>
>> rename to meta/recipes-devtools/qemu/qem**u_1.6.1.bb<http://qemu_1.6.1.bb>
>> index 06c2cdb..03e28a0 100644
>> --- a/meta/recipes-devtools/qemu/q**emu_1.5.0.bb <http://qemu_1.5.0.bb>
>> +++ b/meta/recipes-devtools/qemu/q**emu_1.6.1.bb <http://qemu_1.6.1.bb>
>> @@ -3,14 +3,15 @@ require qemu.inc
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=**441c28d2cf86e15a37fa47e15a72fb
>> **ac \
>>                       file://COPYING.LIB;endline=24;**md5=**
>> c04def7ae38850e7d3ef5485881599**13"
>>
>> -SRC_URI += "file://fdt_header.patch \
>> -            file://target-i386-Fix-aflag-**
>> logic-for-CODE64-and-the-0x67-**.patch \
>> -            file://target-ppc_fix_bit_**extraction.patch \
>> -            file://fxrstorssefix.patch \
>> -           "
>> +SRC_URI += "file://fxrstorssefix.patch"
>>
>>   SRC_URI_prepend = "http://wiki.qemu.org/**download/qemu-${PV}.tar.bz2<http://wiki.qemu.org/download/qemu-$%7BPV%7D.tar.bz2>
>> "
>> -SRC_URI[md5sum] = "**b6f3265b8ed39d77e8f354f35cc26e**16"
>> -SRC_URI[sha256sum] = "**b22b30ee9712568dfb4eedf76783f4**
>> a76546e1cbc41659b909646bcf0b48**67bb"
>> +SRC_URI[md5sum] = "**3a897d722457c5a895cd6ac79a28fd**a0"
>> +SRC_URI[sha256sum] = "**fc736f44aa10478223c881310a7e40**
>> fc8386547e9cadf7d01ca468595160**5294"
>>
>>   COMPATIBLE_HOST_class-target_**mips64 = "null"
>> +
>> +do_install_append() {
>> +    # Prevent QA warnings about installed ${localstatedir}/run
>> +    if [ -d ${D}${localstatedir}/run ]; then rmdir
>> ${D}${localstatedir}/run; fi
>> +}
>>
>>

--001a11c3675e78d70a04e9d5d379
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey Saul,</div><div><br></div><div>My tests built qem=
u-native, qemu-helper-native, qemuwrapper-cross, and qemu for MACHINE_LIST=
=3D&quot;qemuarm qemumips qemuppc qemux86 qemux86-64 qemux86 sugarbay&quot;=
. =A0For each machine, I tested running core-image-minimal in the qemu inst=
ance using runqemu. =A0I should add that my tests were all on a x86-64 buil=
d system.</div>

<div><br></div><div>I&#39;m not terribly familiar with the nativesdk, and (=
foolishly) neglected to test that. =A0However, I looked into it, and it loo=
ks like the relocatable_sdk.patch affects a linker script that is no longer=
 available. =A0I dropped the patch and tested installing an oe-core sdk sys=
root (via bitbake -c populate_sdk core-image-minimal) and qemu appears to w=
ork fine from within the sdk environment.</div>

<div><br></div><div>I&#39;m open to suggestions for further testing this up=
grade (particularly a case to cover what relocatable_sdk.patch was original=
ly intended to resolve). I&#39;m certainly not the expert here, but am will=
ing to help out.</div>

<div><br></div><div>Other notes:</div><div><br></div><div>- I did notice th=
at qemu-native should possibly depend on libsdl for the qemu-native instanc=
e. =A0For users of qemu-native (such as myself), you do not necessarily get=
 an automatic (SDL) video window unless libsdl development libraries are in=
stalled on the build system. This is perhaps because there does not appear =
to be a libsdl-native dependency available for qemu, but from my testing se=
emingly pretty straightforward to add. =A0However, from docs I&#39;ve seen =
online (&quot;getting started - openembedded&quot;) imply you should instal=
l libsdl-dev for the build environemnt, and this does enable SDL support (a=
ssuming libsdl is available). =A0In short, nativesdk does specify nativesdk=
-libsdl as a dependency and native does not (in fact, there is no libsdl-na=
tive), and as a result, user may see differences in behavior. =A0I assume t=
his is intended...?</div>

<div><br></div><div>- I&#39;m using bitbake from master and have a missing =
fcntl python module dependency in my sdk in order to use runqemu wrapper fr=
om within the sdk environment. =A0I assume that this is not supposed to wor=
k and running qemu-system-* directly within the sdk environment bypasses th=
is issue.</div>

<div><br></div><div>Cheers,</div><div>Chris</div></div><div class=3D"gmail_=
extra"><br><br><div class=3D"gmail_quote">On Thu, Oct 24, 2013 at 4:48 AM, =
Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" targ=
et=3D"_blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 10/15/2013 05:15 PM, Ch=
ris Patterson wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
This update also drops the following patches which appear to have been reso=
lved upstream:<br>
- ftd_header.patch<br>
- target-i386-Fix-aflag-logic-<u></u>for-CODE64-and-the-0x67-.patch<br>
- target-ppc_fix_bit_extraction.<u></u>patch<br>
<br>
</blockquote></div>
There seems to be a problem with one of the patches when building for the n=
ativesdk<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
ERROR: Command Error: exit status: 1 =A0Output:<br>
Applying patch relocatable_sdk.patch<br>
can&#39;t find file to patch at input line 13<br>
Perhaps you used the wrong -p or --strip option?<br>
The text leading up to this was:<br>
--------------------------<br>
|Upstream-Status: Inappropriate [SDK specific]<br>
|<br>
|In order to be able to change the dynamic loader path when relocating<br>
|binaries, the interp section has to be made big enough to accomodate<br>
|the new path (4096 is the maximum path length in Linux).<br>
|<br>
|Signed-off-by: Laurentiu Palcu &lt;<a href=3D"mailto:laurentiu.palcu@intel=
.com" target=3D"_blank">laurentiu.palcu@intel.com</a>&gt;<br>
|<br>
|Index: qemu-1.4.0/ldscripts/i386.ld<br>
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=3D<br>
|--- qemu-1.4.0.orig/ldscripts/<u></u>i386.ld =A02013-02-15 15:05:35.000000=
000 -0800<br>
|+++ qemu-1.4.0/ldscripts/i386.ld =A0 =A0 =A0 2013-02-28 22:55:36.138816418=
 -0800<br>
--------------------------<br>
No file to patch. =A0Skipping patch.<br>
1 out of 1 hunk ignored<br>
can&#39;t find file to patch at input line 26<br>
Perhaps you used the wrong -p or --strip option?<br>
The text leading up to this was:<br>
--------------------------<br>
|Index: qemu-1.4.0/ldscripts/x86_64.ld<br>
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=3D<br>
|--- qemu-1.4.0.orig/ldscripts/x86_<u></u>64.ld =A0 =A0 =A0 =A02013-02-15 1=
5:05:35.000000000 -0800<br>
|+++ qemu-1.4.0/ldscripts/x86_64.ld =A0 =A0 2013-02-28 22:55:36.138816418 -=
0800<br>
--------------------------<br>
No file to patch. =A0Skipping patch.<br>
1 out of 1 hunk ignored<br>
Patch relocatable_sdk.patch does not apply (enforce with -f)<br>
ERROR: Function failed: patch_do_patch<br>
</blockquote>
<br>
Also, since qemu is core to the testing and developmen, can you clarify for=
 us what kind of testing you have done across the architectures.<br>
<br>
Thanks<br>
=A0 =A0 =A0 =A0 Sau!<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Signed-off-by: Chris Patterson &lt;<a href=3D"mailto:cjp256@gmail.com" targ=
et=3D"_blank">cjp256@gmail.com</a>&gt;<br>
---<br>
=A0 meta/recipes-devtools/qemu/<u></u>files/fdt_header.patch =A0| 39 ------=
-----<br>
=A0 ...-Fix-aflag-logic-for-<u></u>CODE64-and-the-0x67-.patch | 79 --------=
--------------<br>
=A0 .../qemu/files/target-ppc_fix_<u></u>bit_extraction.patch | 70 --------=
-----------<br>
=A0 meta/recipes-devtools/qemu/<u></u>qemu.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A02 +-<br>
=A0 .../qemu/{<a href=3D"http://qemu_1.5.0.bb" target=3D"_blank">qemu_1.5.0=
.bb</a> =3D&gt; <a href=3D"http://qemu_1.6.1.bb" target=3D"_blank">qemu_1.6=
.1.bb</a>} =A0 =A0 =A0 =A0 =A0| 15 ++--<br>
=A0 5 files changed, 9 insertions(+), 196 deletions(-)<br>
=A0 delete mode 100644 meta/recipes-devtools/qemu/<u></u>files/fdt_header.p=
atch<br>
=A0 delete mode 100644 meta/recipes-devtools/qemu/<u></u>files/target-i386-=
Fix-aflag-<u></u>logic-for-CODE64-and-the-0x67-<u></u>.patch<br>
=A0 delete mode 100644 meta/recipes-devtools/qemu/<u></u>files/target-ppc_f=
ix_bit_<u></u>extraction.patch<br>
=A0 rename meta/recipes-devtools/qemu/{<a href=3D"http://qemu_1.5.0.bb" tar=
get=3D"_blank">qe<u></u>mu_1.5.0.bb</a> =3D&gt; <a href=3D"http://qemu_1.6.=
1.bb" target=3D"_blank">qemu_1.6.1.bb</a>} (44%)<br>
<br>
diff --git a/meta/recipes-devtools/qemu/<u></u>files/fdt_header.patch b/met=
a/recipes-devtools/qemu/<u></u>files/fdt_header.patch<br>
deleted file mode 100644<br>
index dccfe53..0000000<br>
--- a/meta/recipes-devtools/qemu/<u></u>files/fdt_header.patch<br>
+++ /dev/null<br>
@@ -1,39 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-qemu: define fdt types in libfdt_env.h from qemu<br>
-<br>
- =A0 =A0* fixes<br>
- =A0 =A0In file included from /home/oe/setup-scripts/build/<u></u>tmp-angs=
trom_next-uclibc/<u></u>sysroots/x86_64-linux/usr/<u></u>include/libfdt.h:5=
5:0,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/oe/setup-scripts/build=
/<u></u>tmp-angstrom_next-uclibc/work/<u></u>x86_64-linux/qemu-native/1.4.<=
u></u>0-r0/qemu-1.4.0/hw/arm/../../<u></u>device_tree.c:28:<br>
- =A0 =A0/home/oe/setup-scripts/build/<u></u>tmp-angstrom_next-uclibc/<u></=
u>sysroots/x86_64-linux/usr/<u></u>include/fdt.h:58:2: error: unknown type =
name &#39;fdt32_t&#39;<br>
- =A0 =A0/home/oe/setup-scripts/build/<u></u>tmp-angstrom_next-uclibc/<u></=
u>sysroots/x86_64-linux/usr/<u></u>include/fdt.h:59:2: error: unknown type =
name &#39;fdt32_t&#39;<br>
- =A0 =A0/home/oe/setup-scripts/build/<u></u>tmp-angstrom_next-uclibc/<u></=
u>sysroots/x86_64-linux/usr/<u></u>include/fdt.h:60:2: error: unknown type =
name &#39;fdt32_t&#39;<br>
- =A0 =A0/home/oe/setup-scripts/build/<u></u>tmp-angstrom_next-uclibc/<u></=
u>sysroots/x86_64-linux/usr/<u></u>include/fdt.h:61:2: error: unknown type =
name &#39;fdt32_t&#39;<br>
- =A0 =A0/home/oe/setup-scripts/build/<u></u>tmp-angstrom_next-uclibc/<u></=
u>sysroots/x86_64-linux/usr/<u></u>include/fdt.h:62:2: error: unknown type =
name &#39;fdt32_t&#39;<br>
- =A0 =A0/home/oe/setup-scripts/build/<u></u>tmp-angstrom_next-uclibc/<u></=
u>sysroots/x86_64-linux/usr/<u></u>include/fdt.h:63:2: error: unknown type =
name &#39;fdt32_t&#39;<br>
- =A0 =A0/home/oe/setup-scripts/build/<u></u>tmp-angstrom_next-uclibc/<u></=
u>sysroots/x86_64-linux/usr/<u></u>include/fdt.h:64:2: error: unknown type =
name &#39;fdt32_t&#39;<br>
- =A0 =A0/home/oe/setup-scripts/build/<u></u>tmp-angstrom_next-uclibc/<u></=
u>sysroots/x86_64-linux/usr/<u></u>include/fdt.h:67:2: error: unknown type =
name &#39;fdt32_t&#39;<br>
- =A0 =A0/home/oe/setup-scripts/build/<u></u>tmp-angstrom_next-uclibc/<u></=
u>sysroots/x86_64-linux/usr/<u></u>include/fdt.h:70:2: error: unknown type =
name &#39;fdt32_t&#39;<br>
- =A0 =A0/home/oe/setup-scripts/build/<u></u>tmp-angstrom_next-uclibc/<u></=
u>sysroots/x86_64-linux/usr/<u></u>include/fdt.h:73:2: error: unknown type =
name &#39;fdt32_t&#39;<br>
- =A0 =A0/home/oe/setup-scripts/build/<u></u>tmp-angstrom_next-uclibc/<u></=
u>sysroots/x86_64-linux/usr/<u></u>include/fdt.h:77:2: error: unknown type =
name &#39;fdt64_t&#39;<br>
- =A0 =A0/home/oe/setup-scripts/build/<u></u>tmp-angstrom_next-uclibc/<u></=
u>sysroots/x86_64-linux/usr/<u></u>include/fdt.h:78:2: error: unknown type =
name &#39;fdt64_t&#39;<br>
- =A0 =A0/home/oe/setup-scripts/build/<u></u>tmp-angstrom_next-uclibc/<u></=
u>sysroots/x86_64-linux/usr/<u></u>include/fdt.h:82:2: error: unknown type =
name &#39;fdt32_t&#39;<br>
- =A0 =A0/home/oe/setup-scripts/build/<u></u>tmp-angstrom_next-uclibc/<u></=
u>sysroots/x86_64-linux/usr/<u></u>include/fdt.h:87:2: error: unknown type =
name &#39;fdt32_t&#39;<br>
- =A0 =A0/home/oe/setup-scripts/build/<u></u>tmp-angstrom_next-uclibc/<u></=
u>sysroots/x86_64-linux/usr/<u></u>include/fdt.h:88:2: error: unknown type =
name &#39;fdt32_t&#39;<br>
- =A0 =A0/home/oe/setup-scripts/build/<u></u>tmp-angstrom_next-uclibc/<u></=
u>sysroots/x86_64-linux/usr/<u></u>include/fdt.h:89:2: error: unknown type =
name &#39;fdt32_t&#39;<br>
-<br>
-Index: qemu-1.4.0/include/libfdt_env.<u></u>h<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- qemu-1.4.0.orig/include/<u></u>libfdt_env.h =A0 =A0 =A0 2013-02-15 23:=
05:35.000000000 +0000<br>
-+++ qemu-1.4.0/include/libfdt_env.<u></u>h =A0 =A02013-04-13 14:17:27.9188=
85225 +0000<br>
-@@ -21,6 +21,10 @@<br>
-<br>
- #include &quot;qemu/bswap.h&quot;<br>
-<br>
-+typedef uint16_t fdt16_t;<br>
-+typedef uint32_t fdt32_t;<br>
-+typedef uint64_t fdt64_t;<br>
-+<br>
- #ifdef HOST_WORDS_BIGENDIAN<br>
- #define fdt32_to_cpu(x) =A0(x)<br>
- #define cpu_to_fdt32(x) =A0(x)<br>
diff --git a/meta/recipes-devtools/qemu/<u></u>files/target-i386-Fix-aflag-=
<u></u>logic-for-CODE64-and-the-0x67-<u></u>.patch b/meta/recipes-devtools/=
qemu/<u></u>files/target-i386-Fix-aflag-<u></u>logic-for-CODE64-and-the-0x6=
7-<u></u>.patch<br>

deleted file mode 100644<br>
index 852efd1..0000000<br>
--- a/meta/recipes-devtools/qemu/<u></u>files/target-i386-Fix-aflag-<u></u>=
logic-for-CODE64-and-the-0x67-<u></u>.patch<br>
+++ /dev/null<br>
@@ -1,79 +0,0 @@<br>
-Upstream-Status: Backported<br>
-<br>
-From dec3fc9657e0682637de4d5a29d947<u></u>284d01985c Mon Sep 17 00:00:00 2=
001<br>
-From: Richard Henderson &lt;<a href=3D"mailto:rth@twiddle.net" target=3D"_=
blank">rth@twiddle.net</a>&gt;<br>
-Date: Wed, 29 May 2013 12:30:51 -0700<br>
-Subject: [PATCH] target-i386: Fix aflag logic for CODE64 and the 0x67 pref=
ix<br>
-<br>
-The code reorganization in commit 4a6fd938 broke handling of PREFIX_ADR.<b=
r>
-While fixing this, tidy and comment the code so that it&#39;s more obvious=
<br>
-what&#39;s going on in setting both aflag and dflag.<br>
-<br>
-The TARGET_X86_64 ifdef can be eliminated because CODE64 expands to the<br=
>
-constant zero when TARGET_X86_64 is undefined.<br>
-<br>
-Cc: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_bl=
ank">pbonzini@redhat.com</a>&gt;<br>
-Reported-by: Laszlo Ersek &lt;<a href=3D"mailto:lersek@redhat.com" target=
=3D"_blank">lersek@redhat.com</a>&gt;<br>
-Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:rth@twiddle.net" ta=
rget=3D"_blank">rth@twiddle.net</a>&gt;<br>
-Reviewed-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" targ=
et=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
-Message-id: <a href=3D"mailto:1369855851-21400-1-git-send-email-rth@twiddl=
e.net" target=3D"_blank">1369855851-21400-1-git-send-<u></u>email-rth@twidd=
le.net</a><br>
-Signed-off-by: Anthony Liguori &lt;<a href=3D"mailto:aliguori@us.ibm.com" =
target=3D"_blank">aliguori@us.ibm.com</a>&gt;<br>
----<br>
- target-i386/translate.c | =A0 30 +++++++++++++++---------------<br>
- 1 file changed, 15 insertions(+), 15 deletions(-)<br>
-<br>
-diff --git a/target-i386/translate.c b/target-i386/translate.c<br>
-index 0aeccdb..14b0298 100644<br>
---- a/target-i386/translate.c<br>
-+++ b/target-i386/translate.c<br>
-@@ -4677,8 +4677,6 @@ static target_ulong disas_insn(CPUX86State *env, Dis=
asContext *s,<br>
- =A0 =A0 }<br>
- =A0 =A0 s-&gt;pc =3D pc_start;<br>
- =A0 =A0 prefixes =3D 0;<br>
-- =A0 =A0aflag =3D s-&gt;code32;<br>
-- =A0 =A0dflag =3D s-&gt;code32;<br>
- =A0 =A0 s-&gt;override =3D -1;<br>
- =A0 =A0 rex_w =3D -1;<br>
- =A0 =A0 rex_r =3D 0;<br>
-@@ -4801,23 +4799,25 @@ static target_ulong disas_insn(CPUX86State *env, D=
isasContext *s,<br>
- =A0 =A0 }<br>
-<br>
- =A0 =A0 /* Post-process prefixes. =A0*/<br>
-- =A0 =A0if (prefixes &amp; PREFIX_DATA) {<br>
-- =A0 =A0 =A0 =A0dflag ^=3D 1;<br>
-- =A0 =A0}<br>
-- =A0 =A0if (prefixes &amp; PREFIX_ADR) {<br>
-- =A0 =A0 =A0 =A0aflag ^=3D 1;<br>
-- =A0 =A0}<br>
--#ifdef TARGET_X86_64<br>
- =A0 =A0 if (CODE64(s)) {<br>
-- =A0 =A0 =A0 =A0if (rex_w =3D=3D 1) {<br>
-- =A0 =A0 =A0 =A0 =A0 =A0/* 0x66 is ignored if rex.w is set */<br>
-- =A0 =A0 =A0 =A0 =A0 =A0dflag =3D 2;<br>
-+ =A0 =A0 =A0 =A0/* In 64-bit mode, the default data size is 32-bit. =A0Se=
lect 64-bit<br>
-+ =A0 =A0 =A0 =A0 =A0 data with rex_w, and 16-bit data with 0x66; rex_w ta=
kes precedence<br>
-+ =A0 =A0 =A0 =A0 =A0 over 0x66 if both are present. =A0*/<br>
-+ =A0 =A0 =A0 =A0dflag =3D (rex_w &gt; 0 ? 2 : prefixes &amp; PREFIX_DATA =
? 0 : 1);<br>
-+ =A0 =A0 =A0 =A0/* In 64-bit mode, 0x67 selects 32-bit addressing. =A0*/<=
br>
-+ =A0 =A0 =A0 =A0aflag =3D (prefixes &amp; PREFIX_ADR ? 1 : 2);<br>
-+ =A0 =A0} else {<br>
-+ =A0 =A0 =A0 =A0/* In 16/32-bit mode, 0x66 selects the opposite data size=
. =A0*/<br>
-+ =A0 =A0 =A0 =A0dflag =3D s-&gt;code32;<br>
-+ =A0 =A0 =A0 =A0if (prefixes &amp; PREFIX_DATA) {<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0dflag ^=3D 1;<br>
- =A0 =A0 =A0 =A0 }<br>
-- =A0 =A0 =A0 =A0if (!(prefixes &amp; PREFIX_ADR)) {<br>
-- =A0 =A0 =A0 =A0 =A0 =A0aflag =3D 2;<br>
-+ =A0 =A0 =A0 =A0/* In 16/32-bit mode, 0x67 selects the opposite addressin=
g. =A0*/<br>
-+ =A0 =A0 =A0 =A0aflag =3D s-&gt;code32;<br>
-+ =A0 =A0 =A0 =A0if (prefixes &amp; PREFIX_ADR) {<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0aflag ^=3D 1;<br>
- =A0 =A0 =A0 =A0 }<br>
- =A0 =A0 }<br>
--#endif<br>
-<br>
- =A0 =A0 s-&gt;prefix =3D prefixes;<br>
- =A0 =A0 s-&gt;aflag =3D aflag;<br>
---<br>
-1.7.9.5<br>
-<br>
diff --git a/meta/recipes-devtools/qemu/<u></u>files/target-ppc_fix_bit_<u>=
</u>extraction.patch b/meta/recipes-devtools/qemu/<u></u>files/target-ppc_f=
ix_bit_<u></u>extraction.patch<br>
deleted file mode 100644<br>
index 631d23b..0000000<br>
--- a/meta/recipes-devtools/qemu/<u></u>files/target-ppc_fix_bit_<u></u>ext=
raction.patch<br>
+++ /dev/null<br>
@@ -1,70 +0,0 @@<br>
-Delivered-To: <a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.=
khem@gmail.com</a><br>
-Received: by 10.50.216.195 with SMTP id os3csp11191igc;<br>
- =A0 =A0 =A0 =A0Thu, 15 Aug 2013 04:32:45 -0700 (PDT)<br>
-X-Received: by 10.180.98.3 with SMTP id ee3mr1508103wib.48.<u></u>13765663=
64872;<br>
- =A0 =A0 =A0 =A0Thu, 15 Aug 2013 04:32:44 -0700 (PDT)<br>
-Return-Path: &lt;<a href=3D"mailto:aurelien@aurel32.net" target=3D"_blank"=
>aurelien@aurel32.net</a>&gt;<br>
-Received: from <a href=3D"http://hall.aurel32.net" target=3D"_blank">hall.=
aurel32.net</a> (<a href=3D"http://hall.aurel32.net" target=3D"_blank">hall=
.aurel32.net</a>. [2001:470:1f0b:4a8::1])<br>
- =A0 =A0 =A0 =A0by <a href=3D"http://mx.google.com" target=3D"_blank">mx.g=
oogle.com</a> with ESMTPS id vv5si15578100wjc.49.2013.08.<u></u>15.04.32.44=
<br>
- =A0 =A0 =A0 =A0for &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
- =A0 =A0 =A0 =A0(version=3DTLSv1.2 cipher=3DRC4-SHA bits=3D128/128);<br>
- =A0 =A0 =A0 =A0Thu, 15 Aug 2013 04:32:44 -0700 (PDT)<br>
-Received-SPF: pass (<a href=3D"http://google.com" target=3D"_blank">google=
.com</a>: best guess record for domain of <a href=3D"mailto:aurelien@aurel3=
2.net" target=3D"_blank">aurelien@aurel32.net</a> designates 2001:470:1f0b:=
4a8::1 as permitted sender) client-ip=3D2001:470:1f0b:4a8::<u></u>1;<br>

-Authentication-Results: <a href=3D"http://mx.google.com" target=3D"_blank"=
>mx.google.com</a>;<br>
- =A0 =A0 =A0 spf=3Dpass (<a href=3D"http://google.com" target=3D"_blank">g=
oogle.com</a>: best guess record for domain of <a href=3D"mailto:aurelien@a=
urel32.net" target=3D"_blank">aurelien@aurel32.net</a> designates 2001:470:=
1f0b:4a8::1 as permitted sender) smtp.mail=3D<a href=3D"mailto:aurelien@aur=
el32.net" target=3D"_blank">aurelien@aurel32.net</a><br>

-Received: from [2001:470:d4ed:1:2db:dfff:<u></u>fe14:52d] (helo=3D<a href=
=3D"http://ohm.aurel32.net" target=3D"_blank">ohm.aurel32.net</a>)<br>
- =A0 =A0 =A0 by <a href=3D"http://hall.aurel32.net" target=3D"_blank">hall=
.aurel32.net</a> with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_<u></u>SHA1:128)<=
br>
- =A0 =A0 =A0 (Exim 4.80)<br>
- =A0 =A0 =A0 (envelope-from &lt;<a href=3D"mailto:aurelien@aurel32.net" ta=
rget=3D"_blank">aurelien@aurel32.net</a>&gt;)<br>
- =A0 =A0 =A0 id 1V9vnG-0006cO-NN; Thu, 15 Aug 2013 13:32:42 +0200<br>
-Received: from aurel32 by <a href=3D"http://ohm.aurel32.net" target=3D"_bl=
ank">ohm.aurel32.net</a> with local (Exim 4.80)<br>
- =A0 =A0 =A0 (envelope-from &lt;<a href=3D"mailto:aurelien@aurel32.net" ta=
rget=3D"_blank">aurelien@aurel32.net</a>&gt;)<br>
- =A0 =A0 =A0 id 1V9vnF-0002Lw-7L; Thu, 15 Aug 2013 13:32:41 +0200<br>
-From: Aurelien Jarno &lt;<a href=3D"mailto:aurelien@aurel32.net" target=3D=
"_blank">aurelien@aurel32.net</a>&gt;<br>
-To: <a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_blank">qemu-devel@=
nongnu.org</a><br>
-Cc: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">r=
aj.khem@gmail.com</a>&gt;,<br>
- =A0 =A0 =A0 Alexander Graf &lt;<a href=3D"mailto:agraf@suse.de" target=3D=
"_blank">agraf@suse.de</a>&gt; ,<br>
- =A0 =A0 =A0 <a href=3D"mailto:qemu-stable@nongnu.org" target=3D"_blank">q=
emu-stable@nongnu.org</a>,<br>
- =A0 =A0 =A0 <a href=3D"mailto:qemu-ppc@nongnu.org" target=3D"_blank">qemu=
-ppc@nongnu.org</a>,<br>
- =A0 =A0 =A0 Aurelien Jarno &lt;<a href=3D"mailto:aurelien@aurel32.net" ta=
rget=3D"_blank">aurelien@aurel32.net</a>&gt;<br>
-Subject: [PATCH] target-ppc: fix bit extraction for FPBF and FPL<br>
-Date: Thu, 15 Aug 2013 13:32:38 +0200<br>
-Message-Id: &lt;<a href=3D"mailto:1376566358-8989-1-git-send-email-aurelie=
n@aurel32.net" target=3D"_blank">1376566358-8989-1-git-send-<u></u>email-au=
relien@aurel32.net</a>&gt;<br>
-X-Mailer: git-send-email 1.7.10.4<br>
-<br>
-Bit extraction for the FP BF and L field of the MTFSFI and MTFSF<br>
-instructions is wrong and doesn&#39;t match the reference manual (which<br=
>
-explain the bit number in big endian format). It has been broken in<br>
-commit 7d08d85645def18eac2a9d672c1868<u></u>a35e0bcf79.<br>
-<br>
-This patch fixes this, which in turn fixes the problem reported by<br>
-Khem Raj about the floor() function of libm.<br>
-<br>
-Reported-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"=
_blank">raj.khem@gmail.com</a>&gt;<br>
-Signed-off-by: Aurelien Jarno &lt;<a href=3D"mailto:aurelien@aurel32.net" =
target=3D"_blank">aurelien@aurel32.net</a>&gt;<br>
-<br>
-Upstream-Status: Backport<br>
-<br>
----<br>
- target-ppc/translate.c | =A0 =A04 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-I don&#39;t know if we still have time to get this into 1.6, hence the Cc:=
<br>
-to stable. In anycase it also needs to be fixed in 1.5.<br>
-<br>
-Index: qemu-1.5.0/target-ppc/<u></u>translate.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- qemu-1.5.0.orig/target-ppc/<u></u>translate.c =A0 =A0 2013-05-20 08:34=
:40.000000000 -0700<br>
-+++ qemu-1.5.0/target-ppc/<u></u>translate.c =A02013-08-15 06:49:25.028144=
352 -0700<br>
-@@ -428,9 +428,9 @@<br>
- EXTRACT_HELPER(SR, 16, 4);<br>
-<br>
- /* mtfsf/mtfsfi */<br>
--EXTRACT_HELPER(FPBF, 19, 3);<br>
-+EXTRACT_HELPER(FPBF, 23, 3);<br>
- EXTRACT_HELPER(FPIMM, 12, 4);<br>
--EXTRACT_HELPER(FPL, 21, 1);<br>
-+EXTRACT_HELPER(FPL, 25, 1);<br>
- EXTRACT_HELPER(FPFLM, 17, 8);<br>
- EXTRACT_HELPER(FPW, 16, 1);<br>
-<br>
diff --git a/meta/recipes-devtools/qemu/<u></u>qemu.inc b/meta/recipes-devt=
ools/qemu/<u></u>qemu.inc<br>
index 1b861d7..e533a84 100644<br>
--- a/meta/recipes-devtools/qemu/<u></u>qemu.inc<br>
+++ b/meta/recipes-devtools/qemu/<u></u>qemu.inc<br>
@@ -55,7 +55,7 @@ do_configure() {<br>
=A0 =A0 =A0 =A0 =A0KVMOPTS=3D&quot;--enable-kvm&quot;<br>
=A0 =A0 =A0 fi<br>
<br>
- =A0 =A0${S}/configure --prefix=3D${prefix} --sysconfdir=3D${sysconfdir} -=
-libexecdir=3D${libexecdir} --disable-strip ${EXTRA_OECONF} $KVMOPTS<br>
+ =A0 =A0${S}/configure --prefix=3D${prefix} --sysconfdir=3D${sysconfdir} -=
-libexecdir=3D${libexecdir} --localstatedir=3D${<u></u>localstatedir} --dis=
able-strip ${EXTRA_OECONF} $KVMOPTS<br>
=A0 =A0 =A0 test ! -e ${S}/target-i386/beginend_<u></u>funcs.sh || chmod a+=
x ${S}/target-i386/beginend_<u></u>funcs.sh<br>
=A0 }<br>
<br>
diff --git a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_1.5.0.bb" ta=
rget=3D"_blank">q<u></u>emu_1.5.0.bb</a> b/meta/recipes-devtools/qemu/<a hr=
ef=3D"http://qemu_1.6.1.bb" target=3D"_blank">q<u></u>emu_1.6.1.bb</a><br>
similarity index 44%<br>
rename from meta/recipes-devtools/qemu/<a href=3D"http://qemu_1.5.0.bb" tar=
get=3D"_blank">qem<u></u>u_1.5.0.bb</a><br>
rename to meta/recipes-devtools/qemu/<a href=3D"http://qemu_1.6.1.bb" targe=
t=3D"_blank">qem<u></u>u_1.6.1.bb</a><br>
index 06c2cdb..03e28a0 100644<br>
--- a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_1.5.0.bb" target=3D=
"_blank">q<u></u>emu_1.5.0.bb</a><br>
+++ b/meta/recipes-devtools/qemu/<a href=3D"http://qemu_1.6.1.bb" target=3D=
"_blank">q<u></u>emu_1.6.1.bb</a><br>
@@ -3,14 +3,15 @@ require qemu.inc<br>
=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<u></u>441c28d2cf86e15a=
37fa47e15a72fb<u></u>ac \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://COPYING.LIB;endline=3D24=
;<u></u>md5=3D<u></u>c04def7ae38850e7d3ef5485881599<u></u>13&quot;<br>
<br>
-SRC_URI +=3D &quot;file://fdt_header.patch \<br>
- =A0 =A0 =A0 =A0 =A0 =A0file://target-i386-Fix-aflag-<u></u>logic-for-CODE=
64-and-the-0x67-<u></u>.patch \<br>
- =A0 =A0 =A0 =A0 =A0 =A0file://target-ppc_fix_bit_<u></u>extraction.patch =
\<br>
- =A0 =A0 =A0 =A0 =A0 =A0file://fxrstorssefix.patch \<br>
- =A0 =A0 =A0 =A0 =A0 &quot;<br>
+SRC_URI +=3D &quot;file://fxrstorssefix.patch&quot;<br>
<br>
=A0 SRC_URI_prepend =3D &quot;<a href=3D"http://wiki.qemu.org/download/qemu=
-$%7BPV%7D.tar.bz2" target=3D"_blank">http://wiki.qemu.org/<u></u>download/=
qemu-${PV}.tar.bz2</a>&quot;<br>
-SRC_URI[md5sum] =3D &quot;<u></u>b6f3265b8ed39d77e8f354f35cc26e<u></u>16&q=
uot;<br>
-SRC_URI[sha256sum] =3D &quot;<u></u>b22b30ee9712568dfb4eedf76783f4<u></u>a=
76546e1cbc41659b909646bcf0b48<u></u>67bb&quot;<br>
+SRC_URI[md5sum] =3D &quot;<u></u>3a897d722457c5a895cd6ac79a28fd<u></u>a0&q=
uot;<br>
+SRC_URI[sha256sum] =3D &quot;<u></u>fc736f44aa10478223c881310a7e40<u></u>f=
c8386547e9cadf7d01ca468595160<u></u>5294&quot;<br>
<br>
=A0 COMPATIBLE_HOST_class-target_<u></u>mips64 =3D &quot;null&quot;<br>
+<br>
+do_install_append() {<br>
+ =A0 =A0# Prevent QA warnings about installed ${localstatedir}/run<br>
+ =A0 =A0if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir=
}/run; fi<br>
+}<br>
<br>
</blockquote>
</div></div></blockquote></div><br></div>

--001a11c3675e78d70a04e9d5d379--
