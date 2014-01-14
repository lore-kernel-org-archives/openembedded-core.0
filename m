Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AA60E6AE73
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 15:16:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Jan 2014 07:16:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,658,1384329600"; d="scan'208";a="438663633"
Received: from unknown (HELO [10.255.12.133]) ([10.255.12.133])
	by orsmga001.jf.intel.com with ESMTP; 14 Jan 2014 07:16:14 -0800
Message-ID: <52D554BE.4020802@linux.intel.com>
Date: Tue, 14 Jan 2014 07:16:14 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Lu Chong <Chong.Lu@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1389259902.git.Chong.Lu@windriver.com>
	<6422a763adc5b9909e47c2354a58d4b7a0dd017a.1389259902.git.Chong.Lu@windriver.com>
	<52D40D43.9040407@linux.intel.com> <52D4A8D0.8020602@windriver.com>
In-Reply-To: <52D4A8D0.8020602@windriver.com>
Subject: Re: [PATCH 1/1] attr: enable ptest support
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
X-List-Received-Date: Tue, 14 Jan 2014 15:16:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/13/2014 07:02 PM, Lu Chong wrote:
>
> On 01/13/2014 11:58 PM, Saul Wold wrote:
>> On 01/09/2014 02:02 AM, Chong Lu wrote:
>>> Install attr test suite and run it as ptest.
>>>
>>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>>> ---
>>>   meta/recipes-support/attr/attr.inc                 | 15 +++-
>>>   .../attr/files/attr-make-ptest-pass.patch          | 82
>>> ++++++++++++++++++++++
>>>   meta/recipes-support/attr/files/run-ptest          |  5 ++
>>>   3 files changed, 101 insertions(+), 1 deletion(-)
>>>   create mode 100644
>>> meta/recipes-support/attr/files/attr-make-ptest-pass.patch
>>>   create mode 100644 meta/recipes-support/attr/files/run-ptest
>>>
>>> diff --git a/meta/recipes-support/attr/attr.inc
>>> b/meta/recipes-support/attr/attr.inc
>>> index 4961ba7..8cb08e4 100644
>>> --- a/meta/recipes-support/attr/attr.inc
>>> +++ b/meta/recipes-support/attr/attr.inc
>>> @@ -11,7 +11,10 @@ LIC_FILES_CHKSUM =
>>> "file://doc/COPYING;md5=2d0aa14b3fce4694e4f615e30186335f \
>>> file://attr/attr.c;endline=17;md5=be0403261f0847e5f43ed5b08d19593c \
>>> file://libattr/libattr.c;endline=17;md5=7970f77049f8fa1199fff62a7ab724fb"
>>>
>>>
>>> -SRC_URI =
>>> "http://download.savannah.gnu.org/releases/attr/${BP}.src.tar.gz"
>>> +SRC_URI =
>>> "http://download.savannah.gnu.org/releases/attr/${BP}.src.tar.gz \
>>> +           file://attr-make-ptest-pass.patch \
>>> +           file://run-ptest \
>>> +"
>>>
>>>   require ea-acl.inc
>>>
>>> @@ -20,3 +23,13 @@ do_install_append() {
>>>       sed -i ${D}${libdir}/libattr.la -e \
>>>           s,^libdir=\'${base_libdir}\'$,libdir=\'${libdir}\',
>>>   }
>>> +
>>> +inherit ptest
>>> +
>>> +do_install_ptest() {
>>> +    cp -r ${S}/test ${D}${PTEST_PATH}
>>> +    mkdir ${D}${PTEST_PATH}/include
>>> +    cp ${S}/include/builddefs ${S}/include/buildmacros
>>> ${S}/include/buildrules ${D}${PTEST_PATH}/include/
>>> +}
>>> +
>>> +RDEPENDS_${PN}-ptest = "coreutils perl-module-filehandle
>>> perl-module-getopt-std perl-module-posix"
>>> diff --git
>>> a/meta/recipes-support/attr/files/attr-make-ptest-pass.patch
>>> b/meta/recipes-support/attr/files/attr-make-ptest-pass.patch
>>> new file mode 100644
>>> index 0000000..e2da8b0
>>> --- /dev/null
>>> +++ b/meta/recipes-support/attr/files/attr-make-ptest-pass.patch
>>> @@ -0,0 +1,82 @@
>>> +attr: make ptest pass
>>> +
>>> +Upstream-Status: Inappropriate [embedded specific]
>>> +
>>> +Delete the second '@' character of the same row in test/Makefile, else
>>> +we would get the error as below:
>>> +    @echo: command not found
>>> +In fs.test file, the result of `ls -s' is incorrect. Change it to make
>>> +ext-tests pass.
>>> +
>> Can you please verify that these tests are actually wrong, it seems
>> incorrect to be changing the test results to make the test pass.
>>
>> Are we missing a setting (like the acl) or something else?
>>
>> Sau!
>>
> Saul,
>
> I tested attr from upstream tar package on some distributions.(Ubuntu
> Desktop 12.04 and Fedora 20)
> test/ext/fs.test is actually wrong.

If the test fails on distributions, then it's not an embedded specific 
problem, the patch should be submitted upstream.

Sau!

> In target, I have already added acl setting. My test likes following:(in
> target)
>      root@qemuarm:/usr/lib/attr/ptest# ./run-ptest
>      make: Entering directory '/usr/lib/attr/ptest/test'
>      ......
>      PASS: $ rm f
>      PASS: $ touch f g h
>      PASS: $ setfattr -n user.novalue f g h
>      PASS: $ ls -s f g h
>      PASS: $ setfattr -n user.name -v value f
>      PASS: $ ls -s f g h
>      PASS: $ getfattr -d f g h
>      PASS: $ setfattr -n user.name -v value g
>      PASS: $ ls -s f g h
>      PASS: $ setfattr -x user.novalue h
>      PASS: $ ls -s f g h
>      PASS: $ setfattr -n user.name -v other-value g
>      PASS: $ setfattr -n user.name -v value g
>      PASS: $ setfattr -x user.name f g
>      PASS: $ setfattr -x user.novalue f g
>      PASS: $ ls -s f g h
>      PASS: $ rm f g h
>      20 commands (20 passed, 0 failed)
>      make: Leaving directory '/usr/lib/attr/ptest/test'
>      root@qemuarm:/usr/lib/attr/ptest# mount
>      rootfs on / type rootfs (rw)
>      /dev/root on / type ext3
> (rw,relatime,errors=continue,user_xattr,acl,barrier=1,data=ordered)
>      devtmpfs on /dev type devtmpfs
> (rw,relatime,size=60172k,nr_inodes=15043,mode=755)
>      proc on /proc type proc (rw,relatime)
>      tmpfs on /mnt/.psplash type tmpfs (rw,relatime,size=40k)
>      sysfs on /sys type sysfs (rw,relatime)
>      debugfs on /sys/kernel/debug type debugfs (rw,relatime)
>      tmpfs on /run type tmpfs (rw,nosuid,nodev,mode=755)
>      tmpfs on /var/volatile type tmpfs (rw,relatime)
>      devpts on /dev/pts type devpts (rw,relatime,gid=5,mode=620)
>      nfsd on /proc/fs/nfsd type nfsd (rw,relatime)
>
> Best Regards
> Chong
>
>
>
>>> +Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>>> +---
>>> + test/Makefile    |    4 ++--
>>> + test/ext/fs.test |   22 +++++++++++-----------
>>> + 2 files changed, 13 insertions(+), 13 deletions(-)
>>> +
>>> +diff --git a/test/Makefile b/test/Makefile
>>> +index b7bd8db..d916bf4 100644
>>> +--- a/test/Makefile
>>> ++++ b/test/Makefile
>>> +@@ -40,10 +40,10 @@ $(TEST):
>>> +     @echo "*** $@ ***"; perl run $@
>>> +
>>> + $(EXT):
>>> +-    @echo "EXT specific tests"; @echo "*** $@ ***"; perl run $@
>>> ++    @echo "EXT specific tests"; echo "*** $@ ***"; perl run $@
>>> +
>>> + $(ROOT):
>>> +-    @echo "Note: Tests must run as root"; @echo "*** $@ ***"; perl
>>> run $@
>>> ++    @echo "Note: Tests must run as root"; echo "*** $@ ***"; perl
>>> run $@
>>> +
>>> + .PHONY: $(TEST) $(EXT) $(ROOT)
>>> + .NOTPARALLEL:
>>> +diff --git a/test/ext/fs.test b/test/ext/fs.test
>>> +index cc28fec..381d54b 100644
>>> +--- a/test/ext/fs.test
>>> ++++ b/test/ext/fs.test
>>> +@@ -19,15 +19,15 @@ Test extended attribute block sharing
>>> +     $ touch f g h
>>> +     $ setfattr -n user.novalue f g h
>>> +     $ ls -s f g h
>>> +-    > 4 f
>>> +-    > 4 g
>>> +-    > 4 h
>>> ++    > 0 f
>>> ++    > 0 g
>>> ++    > 0 h
>>> +
>>> +     $ setfattr -n user.name -v value f
>>> +     $ ls -s f g h
>>> +-    > 4 f
>>> +-    > 4 g
>>> +-    > 4 h
>>> ++    > 0 f
>>> ++    > 0 g
>>> ++    > 0 h
>>> +
>>> +     $ getfattr -d f g h
>>> +     > # file: f
>>> +@@ -43,14 +43,14 @@ Test extended attribute block sharing
>>> +
>>> +     $ setfattr -n user.name -v value g
>>> +     $ ls -s f g h
>>> +-    > 4 f
>>> +-    > 4 g
>>> +-    > 4 h
>>> ++    > 0 f
>>> ++    > 0 g
>>> ++    > 0 h
>>> +
>>> +     $ setfattr -x user.novalue h
>>> +     $ ls -s f g h
>>> +-    > 4 f
>>> +-    > 4 g
>>> ++    > 0 f
>>> ++    > 0 g
>>> +     > 0 h
>>> +
>>> +     $ setfattr -n user.name -v other-value g
>>> +--
>>> +1.7.9.5
>>> +
>>> diff --git a/meta/recipes-support/attr/files/run-ptest
>>> b/meta/recipes-support/attr/files/run-ptest
>>> new file mode 100644
>>> index 0000000..f0bd9fc
>>> --- /dev/null
>>> +++ b/meta/recipes-support/attr/files/run-ptest
>>> @@ -0,0 +1,5 @@
>>> +#!/bin/sh
>>> +
>>> +make -C test -k tests root-tests ext-tests |sed \
>>> + -e 's|^\[.*\] \(.*\) -- ok$|PASS: \1|' \
>>> + -e 's|^\[.*\] \(.*\) -- failed|FAIL: \1|'
>>>
>>
>>
>
>
>

