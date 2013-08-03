Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6C860664
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2013 19:32:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Aug 2013 12:29:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,808,1367996400"; d="scan'208";a="356940407"
Received: from unknown (HELO [10.255.14.110]) ([10.255.14.110])
	by orsmga001.jf.intel.com with ESMTP; 03 Aug 2013 12:32:02 -0700
Message-ID: <51FD5AB2.6020209@linux.intel.com>
Date: Sat, 03 Aug 2013 12:32:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Yevhen Kyriukha <kirgene@gmail.com>
References: <1375472467-8051-1-git-send-email-kirgene@gmail.com>
	<51FC1D1A.10608@linux.intel.com>
	<CADV-EXFtuyca0R_thUm89teFACNW8Fnv6zD0sg8kUw5Ae_d8Uw@mail.gmail.com>
In-Reply-To: <CADV-EXFtuyca0R_thUm89teFACNW8Fnv6zD0sg8kUw5Ae_d8Uw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] btrfs-tools: upgrade to upstream revision.
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
X-List-Received-Date: Sat, 03 Aug 2013 19:32:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2013 08:30 AM, Yevhen Kyriukha wrote:
> 2013/8/2 Saul Wold <sgw@linux.intel.com>:
>>
>> Please add an explanation of why the patches are removed and a
>> Signed-off-by: in the commit message.
>>
>> Thanks
>>          Sau!
>>
>>
>>
>> On 08/02/2013 12:41 PM, Yevhen Kyriukha wrote:
>>>
>>> ---
>>>    ...ix_race_condition_with_multithreaded_make.patch | 36
>>> ----------------------
>>>    .../btrfs-tools/btrfs-tools/fix_use_of_gcc.patch   | 31
>>> -------------------
>>>    .../btrfs-tools/btrfs-tools_git.bb                 | 13 +++-----
>>>    3 files changed, 4 insertions(+), 76 deletions(-)
>>>    delete mode 100644
>>> meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_race_condition_with_multithreaded_make.patch
>>>    delete mode 100644
>>> meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch
>>>
>>> diff --git
>>> a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_race_condition_with_multithreaded_make.patch
>>> b/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_race_condition_with_multithreaded_make.patch
>>> deleted file mode 100644
>>> index 40175b8..0000000
>>> ---
>>> a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_race_condition_with_multithreaded_make.patch
>>> +++ /dev/null
>>> @@ -1,36 +0,0 @@
>>> -Upstream-Status: Pending
>>> -
>>> -Fix makefile for multithreaded (make -j ) building.
>>> -
>>> -btrfsctl.c
>>> -| i586-poky-linux-gcc  -m32   -march=i586
>>> --sysroot=/intel/poky/builds/world/tmp/sysroots/qemux86
>>> -Wp,-MMD,./.btrfsctl.o.d,-MT,btrfsctl.o -Wall -D_FILE_OFFSET_BITS=64
>>> -D_FORTIFY_SOURCE=2 -O2 -pipe -g -feliminate-unused-debug-types -c
>>> btrfsctl.c
>>> -| btrfsctl.c:37:21: fatal error: version.h: No such file or directory
>>> -| compilation terminated.
>>> -| btrfslabel.c:40:21: fatal error: version.h: No such file or directory
>>> -| compilation terminated.
>>> -
>>> -Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
>>> -2012/01/02
>>> -
>>> -Index: git/Makefile
>>> -===================================================================
>>> ---- git.orig/Makefile
>>> -+++ git/Makefile
>>> -@@ -26,14 +26,13 @@ else
>>> -       check = ls
>>> - endif
>>> -
>>> --.c.o:
>>> -+%.o: %.c version.h
>>> -       $(check) $<
>>> -       $(CC) $(DEPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c $<
>>> -
>>> -+all: $(progs) manpages
>>> -
>>> --all: version $(progs) manpages
>>> --
>>> --version:
>>> -+version.h: version.sh
>>> -       bash version.sh
>>> -
>>> - btrfs: $(objects) btrfs.o btrfs_cmds.o scrub.o
>>> diff --git
>>> a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch
>>> b/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch
>>> deleted file mode 100644
>>> index 7f6594a..0000000
>>> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch
>>> +++ /dev/null
>>> @@ -1,31 +0,0 @@
>>> -Nitin A Kamble <nitin.a.kamble@intel.com> 2011/06/09
>>> -Upstream-Status: Pending
>>> -
>>> -Avoid these kinds of errors while doing cross build:
>>> -
>>> -| ccache i586-poky-linux-gcc -march=i586
>>> --sysroot=/disk0/pokybuild/build0/tmp/sysroots/qemux86
>>> -Wp,-MMD,./.btrfsctl.o.d,-MT,btrfsctl.o -Wall -D_FILE_OFFSET_BITS=64
>>> -D_FORTIFY_SOURCE=2 -O2 -pipe -g -feliminate-unused-debug-types -c
>>> btrfsctl.c
>>> -| gcc -O2 -pipe -g -feliminate-unused-debug-types -o btrfsctl btrfsctl.o
>>> ctree.o disk-io.o radix-tree.o extent-tree.o print-tree.o root-tree.o
>>> dir-item.o file-item.o inode-item.o inode-map.o crc32c.o rbtree.o
>>> extent-cache.o extent_io.o volumes.o utils.o btrfs-list.o -Wl,-O1
>>> -Wl,--as-needed -luuid
>>> -| /usr/bin/ld: i386 architecture of input file `btrfsctl.o' is
>>> incompatible with i386:x86-64 output
>>> -| /usr/bin/ld: i386 architecture of input file `ctree.o' is incompatible
>>> with i386:x86-64 output
>>> -
>>> -Index: git/Makefile
>>> -===================================================================
>>> ---- git.orig/Makefile
>>> -+++ git/Makefile
>>> -@@ -41,13 +41,13 @@ btrfs: $(objects) btrfs.o btrfs_cmds.o s
>>> -               $(objects) $(LDFLAGS) $(LIBS)
>>> -
>>> - calc-size: $(objects) calc-size.o
>>> --      gcc $(CFLAGS) -o calc-size calc-size.o $(objects) $(LDFLAGS)
>>> $(LIBS)
>>> -+      $(CC) $(CFLAGS) -o calc-size calc-size.o $(objects) $(LDFLAGS)
>>> $(LIBS)
>>> -
>>> - find-root: $(objects) find-root.o
>>> --      gcc $(CFLAGS) -o find-root find-root.o $(objects) $(LDFLAGS)
>>> $(LIBS)
>>> -+      $(CC) $(CFLAGS) -o find-root find-root.o $(objects) $(LDFLAGS)
>>> $(LIBS)
>>> -
>>> - restore: $(objects) restore.o
>>> --      gcc $(CFLAGS) -o restore restore.o $(objects) $(LDFLAGS) $(LIBS)
>>> $(RESTORE_LIBS)
>>> -+      $(CC) $(CFLAGS) -o restore restore.o $(objects) $(LDFLAGS) $(LIBS)
>>> $(RESTORE_LIBS)
>>> -
>>> - btrfsctl: $(objects) btrfsctl.o
>>> -       $(CC) $(CFLAGS) -o btrfsctl btrfsctl.o $(objects) $(LDFLAGS)
>>> $(LIBS)
>>> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
>>> b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
>>> index ef575ae..d63f1e0 100644
>>> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
>>> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
>>> @@ -12,21 +12,16 @@ LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
>>>    SECTION = "base"
>>>    DEPENDS = "util-linux attr"
>>>
>>> -SRCREV = "fdb6c0402337d9607c7a39155088eaf033742752"
>>> +SRCREV = "194aa4a1bd6447bb545286d0bcb0b0be8204d79f"
>>>    SRC_URI =
>>> "git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs.git;protocol=git"
>>>
>>>    S = "${WORKDIR}/git"
>>>
>>> -PV = "0.19+git${SRCPV}"
>>> +PV = "0.20+git${SRCPV}"
>>>
>>> -PR = "r6"
>>> +PR = "r7"
>>>
>> We do not need PR Bumps any more, so it can just be removed as you are
>> incrementing the PV.
>>
>
> So what do I need to do with existing PR? Just don't change it or
> remove it from recipe?
>
>
Sorry for being unclear since you have incremented the PV, you can 
completely remove the PR entry.

Sau!


