Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BAE767016E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 00:27:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7N0RBpu003485
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 22 Aug 2016 17:27:11 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 22 Aug 2016 17:27:10 -0700
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1471850849.git.liezhi.yang@windriver.com>
	<57BB562C.40409@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <69d8206d-73aa-d267-8836-b46a99f0d271@windriver.com>
Date: Tue, 23 Aug 2016 08:27:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <57BB562C.40409@linux.intel.com>
Subject: Re: [PATCH V4 00/11] runqemu: refactor it and remove machine knowledge
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
X-List-Received-Date: Tue, 23 Aug 2016 00:27:11 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit



On 08/23/2016 03:44 AM, Aníbal Limón wrote:
> Hi Robert,
>
> May be your v4 now cover the current failures but only for notice,
> here's some example.
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-arm/builds/926/steps/Running%20Sanity%20Tests/logs/stdio

Yes, RP found this on Saturday, I've fixed it in V4.

// Robert

>
> Cheers,
> 	alimon
>
> On 08/22/2016 02:52 AM, Robert Yang wrote:
>> * V4
>>   - Now the conf files can use @TAP@, @ROOTFS@ and @PORT@ when set vars
>>     for runqemu, so all the arch info are gone. And also update comments
>>     in qemuboot.bbclass.
>>   - Add var QB_SLIRP_OPT for slirp mode as Nathan suggested, also add
>>     QB_TAP_OPT whichi is for tap mode.
>>   - Print "Try 'runqemu help' on how to use it" when failed to parse args
>>     as Nathan suggested.
>>   - Fix device locking problems.
>>   - Fix nativesdk-qemu-helper.
>>   - Fix comments for qemurunner.py/qemutinyrunner.py
>>
>> * V3
>>   - Move the qemu boot settings out of tune files (e.g., arch-x86.inc)
>>     to avoid mixing BSP settings with the tunings as Mark suggested. and
>>     put them to <machine>.conf or <qemuboot>.inc file.
>>
>> * V2
>>   - Fixes for RP's comments
>>     a) Remove a kvm commit message since qemu-kvm can only run target when
>>        its arch is the same as the host arch:
>>        The kvm support is not limited on x86 or x86_64
>>
>>     b) Fix a typo in commit message: qemu-boot.bbclass -> qemuboot.bbclass,
>>        You may wonder why I use qemuboot.bbclass but not qemu-boot.bbclass,
>>        this is because the bbclass will save vars into qemuboot.py, the
>>        qemuboot.py can't be qemu-boot.py here, otherwise,
>>        "import qemu-boot.py" doesn't work since "-" is not a validate
>>        identifier, so use "qemuboot" to make them unify.
>>
>>     c) Reorder the patches to make sure they don't break the bisect build.
>>
>>   - Update commit message:
>>     "Fix SLIRP mode" -> "Fix SLIRP mode, add help message, avoid mixing
>>   with tap"
>>
>> * V1
>>   Previously, runqemu had hard coded machine knowledge, which limited its
>>   usage, for example, qemu can boot genericx86, but runqemu can't, we need
>>   edit runqemu/runqemu-internal a lot if we want to boot genericx86.
>>
>>   Now bsp conf files can set vars to make it can be boot by runqemu, and
>>   qemuboot.bbclass will save these info to DEPLOY_DIR_IMAGE/qemuboot.py.
>>   Please see qemuboot.bbclass' comments on how to set the vars.
>>
>>   - Re-write it in python3, which can reduce lines from 1239 to about 750
>>     lines
>>   - All the machine knowledges are gone
>>   - All of the TUN_ARCH knowledge are gone (FIXED in V4)
>>   - All the previous options are preserved, and there is a new way to run
>>     runqemu: (it doesn't need run "bitake -e" in such a case)
>>     $ runqemu tmp/deploy/images/qemux86
>>     or:
>>     $ runqemu tmp/deploy/images/qemuarm/<image>.ext4
>>     or:
>>     $ runqemu tmp/deploy/images/qemuarm/qemuboot.py
>>   - Fixed audio support, not limited on x86 or x86_64
>>   - The kvm support is not limited on x86 or x86_64 (REMOVED by V2)
>>   - Fix SLIRP mode (FIXED by V2)
>>   - Fix NFS boot, it will extract <image>.tar.bz2 or tar.gz to
>>     DEPLOY_DIR_IMAGE/<image>-nfsroot when no NFS_DIR, and remove it after
>>     stop.
>>   - More bsps can be boot, such as genericx86 and genericx86-64.
>>   - The patch for qemuzynq, qemuzynqmp, qemumicroblaze has been sent to
>>     meta-xilinx' mailing list.
>>   - I can't find any qemush4 bsp or how to build it, so it is not
>>     considered atm.
>>
>>   - Tested the following machines, all of them work well.
>>     genericx86 genericx86-64
>>     qemuarm qemuarm64
>>     qemumips qemumips64 qemuppc
>>     qemux86 qemux86-64
>>     qemuzynq qemuzynqmp
>>
>>     Tested ext4, nfs, slirp, vmdk, iso and cpio.gz when they are available.
>>
>>   And also test "bitbake core-image-sato -ctestimage" which uses runqemu,
>>   it works, well.
>>
>> // Robert
>>
>> The following changes since commit 0865a5b8b8fbf478fb4b2310f808bcffff84a091:
>>
>>   packagefeed-stability.bbclass: cleansstate should remove pkgs from deploy dir (2016-08-20 16:05:29 +0100)
>>
>> are available in the git repository at:
>>
>>   git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
>>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/runqemu
>>
>> Robert Yang (11):
>>   qemuboot.bbclass: add it for runqemu
>>   qemuarm.conf: set vars for runqemu
>>   qemuarm64.conf: set vars for runqemu
>>   qemux86.conf/qemux86-64.conf: set vars for runqemu
>>   qemumips/qemumips64.conf: set vars for runqemu
>>   qemuppc.conf: set vars for runqemu
>>   qemu.inc: inherit qemuboot.bbclass
>>   runqemu: refactor it and remove machine knowledge
>>   python-3.5-manifest.inc: the signal module RDEPENDS on enum
>>   nativesdk-qemu-helper: fix for new runqemu
>>   qemurunner.py/qemutinyrunner.py: remove runqemu-internal
>>
>>  meta/classes/qemuboot.bbclass                      |   67 +
>>  meta/conf/machine/include/qemu.inc                 |    2 +
>>  meta/conf/machine/include/qemuboot-mips.inc        |    7 +
>>  meta/conf/machine/include/qemuboot-x86.inc         |   14 +
>>  meta/conf/machine/qemuarm.conf                     |    5 +
>>  meta/conf/machine/qemuarm64.conf                   |   13 +
>>  meta/conf/machine/qemumips.conf                    |    1 +
>>  meta/conf/machine/qemumips64.conf                  |    1 +
>>  meta/conf/machine/qemuppc.conf                     |    7 +
>>  meta/conf/machine/qemux86-64.conf                  |    1 +
>>  meta/conf/machine/qemux86.conf                     |    1 +
>>  meta/lib/oeqa/utils/qemurunner.py                  |    2 +-
>>  meta/lib/oeqa/utils/qemutinyrunner.py              |    2 +-
>>  .../python/python-3.5-manifest.inc                 |    2 +-
>>  .../qemu/nativesdk-qemu-helper_1.0.bb              |    9 +-
>>  scripts/contrib/python/generate-manifest-3.5.py    |    2 +-
>>  scripts/runqemu                                    | 1287 ++++++++++++--------
>>  scripts/runqemu-internal                           |  739 -----------
>>  18 files changed, 890 insertions(+), 1272 deletions(-)
>>  create mode 100644 meta/classes/qemuboot.bbclass
>>  create mode 100644 meta/conf/machine/include/qemuboot-mips.inc
>>  create mode 100644 meta/conf/machine/include/qemuboot-x86.inc
>>  delete mode 100755 scripts/runqemu-internal
>>
>

