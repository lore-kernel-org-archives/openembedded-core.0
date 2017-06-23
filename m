Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 57D0277DAF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 00:30:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5N0UwSX008891
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 22 Jun 2017 17:30:58 -0700
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Jun 2017 17:30:58 -0700
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <1498097697-12564-1-git-send-email-Randy.MacLeod@windriver.com>
	<d194290a-fad9-3c63-b3a4-379b50074fd5@windriver.com>
	<CAMKF1sqNKaRB0Dagz8aKG5HR6QPHcw6XZMGcMrBnFogP3fbhgw@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <393805e4-6d27-42c4-41c4-253508e8527b@windriver.com>
Date: Thu, 22 Jun 2017 20:30:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqNKaRB0Dagz8aKG5HR6QPHcw6XZMGcMrBnFogP3fbhgw@mail.gmail.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [PATCH v2] systemd: work-around ppc gold linker error
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
X-List-Received-Date: Fri, 23 Jun 2017 00:30:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-06-22 06:22 PM, Khem Raj wrote:
> What's the link to upstream bug in linker

Do you mean: Have I created an upstream bug?

No, not yet but I'm just reading their email lists and
trying to understand where and how to report the bug.
If you'd like to do that and CC me, then the task will
finish sooner and I'll know for next time. :)


I've been taking the opportunity to see how we manage
binutils by adding a bintuils-2.29 this points to
master but I haven't gotten very far yet. My intent is
to see if this bug is reproducible on the bintuils
master branch since looking at:
    git log --oneline master ^binutils-2_28-branch gold/powerpc.cc
only turned up:

bdab445 [GOLD] PowerPC move plt indx_ out of unordered map key
94de2a2 [GOLD] Avoid duplicate PLT stub symbols on ppc32
590b87f PR21503, Gold doesn't create linker stub symbols on ppc64
6528b6e PowerPC ld segfault on script discarding dynamic sections
e666304 [GOLD] PowerPC64 TOC indirect to TOC relative segfault
857e829 Gold: Fix build with GCC 4.2
5edad15 [GOLD] PowerPC64 TOC indirect to TOC relative code editing
f159cdb [GOLD] Add --secure-plt option for ppc32
3254d32 [GOLD] Set sh_info of .rela.plt for powerpc
0e123f6 [GOLD] powerpc.cc tidies
2571583 Update year range in copyright notice of all files.

and after an initial quick review it seems that those commits
are either not relevant or have been cherry-picked back to
binutils-2_28-branch already.

I'll include my cleaned-up link failure summary below.
-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5


--------


powerpc-oe-linux-libtool: link: powerpc-oe-linux-gcc  \
   -m32 -mhard-float -mcpu=7400 -mno-spe \
 
--sysroot=/.../tmp-glibc/work/ppc7400-oe-linux/systemd/1_232-r0/recipe-sysroot 
\
   -shared  -fPIC -DPIC  \
   src/basic/.libs/libsystemd_shared_la-capability-util.o \
   src/basic/.libs/libsystemd_shared_la-conf-files.o \
   src/basic/.libs/libsystemd_shared_la-hostname-util.o \
   ...
   src/libudev/.libs/libsystemd_shared_la-libudev-queue.o \
   src/libudev/.libs/libsystemd_shared_la-libudev-hwdb.o \
   -lcap -lrt -lm -lresolv -llzma -lacl  \
   -m32 -mhard-float -mcpu=7400 -mno-spe \
 
--sysroot=/.../tmp-glibc/work/ppc7400-oe-linux/systemd/1_232-r0/recipe-sysroot 
\
   -fstack-protector -fstack-protector-strong -flto -fstack-protector 
-fstack-protector-strong \
   -flto -pthread -fstack-protector -fstack-protector-strong -flto 
-fstack-protector -fstack-protector-strong \
   -flto -O2 -g \
   -Wl,--gc-sections -Wl,--as-needed -Wl,--no-undefined \
   -Wl,-z -Wl,relro -Wl,-z -Wl,now -Wl,-fuse-ld=gold \
   -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed   -pthread \
   -Wl,-soname -Wl,libsystemd-shared-232.so \
   -o .libs/libsystemd-shared-232.so
----------------------------------------------->>>
/.../tmp-glibc/work/ppc7400-oe-linux/systemd/1_232-r0/recipe-sysroot-native\
/usr/bin/powerpc-oe-linux/powerpc-oe-linux-ld.gold:
    error: invalid STB_LOCAL symbol in external symbols
    error: linker defined: multiple definition of 
'00000001.plt_call.memcpy+8000'
    command line: previous definition here
... <5577 more> ... with functions/symbols such as:
'00000001.plt_call.fflush_and_check+8000'
'00000001.plt_call.fileno+8000'
'00000001.plt_call.fchmod+8000'

| collect2: error: ld returned 1 exit status
| Makefile:11575: recipe for target 'libsystemd-shared.la' failed
| make[2]: *** [libsystemd-shared.la] Error 1
| Makefile:21970: recipe for target 'all-recursive' failed
| make[1]: *** [all-recursive] Error 1
| Makefile:9900: recipe for target 'all' failed
| make: *** [all] Error 2
| ERROR: oe_runmake failed

----------



