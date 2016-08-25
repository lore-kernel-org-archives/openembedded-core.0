Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A30C731E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 14:41:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7PEf88d002379
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 07:41:08 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 25 Aug 2016 07:41:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Aug 2016 07:40:57 -0700
Message-ID: <cover.1472120966.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH V5 00/10] runqemu: refactor it and remove machine knowledge
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
X-List-Received-Date: Thu, 25 Aug 2016 14:41:08 -0000
Content-Type: text/plain

* V5
  - Fix race issues when building multi image recipes at the same time, they
    might write qemuboo.py at the same time in the past. Now each image has
    a unique ${IMAGE_LINK_NAME}.runqemu.conf.

  - qemuboot.py -> ${IMAGE_LINK_NAME}.runqemu.conf, I used "import qemuboot.py",
    but now we can't "import ${IMAGE_LINK_NAME}.runqemu.py" since
    IMAGE_LINK_NAME contains dash "-", so rename it to .conf and use configparser
    to read/write it.

* V4
  - Now the conf files can use @TAP@, @ROOTFS@ and @PORT@ when set vars
    for runqemu, so all the arch info are gone. And also update comments
    in qemuboot.bbclass.
  - Add var QB_SLIRP_OPT for slirp mode as Nathan suggested, also add
    QB_TAP_OPT whichi is for tap mode.
  - Print "Try 'runqemu help' on how to use it" when failed to parse args
    as Nathan suggested.
  - Fix device locking problems.
  - Fix nativesdk-qemu-helper.
  - Fix comments for qemurunner.py/qemutinyrunner.py

* V3 
  - Move the qemu boot settings out of tune files (e.g., arch-x86.inc)
    to avoid mixing BSP settings with the tunings as Mark suggested. and
    put them to <machine>.conf or <qemuboot>.inc file.

* V2 
  - Fixes for RP's comments
    a) Remove a kvm commit message since qemu-kvm can only run target when
       its arch is the same as the host arch:
       The kvm support is not limited on x86 or x86_64
    
    b) Fix a typo in commit message: qemu-boot.bbclass -> qemuboot.bbclass,
       You may wonder why I use qemuboot.bbclass but not qemu-boot.bbclass,
       this is because the bbclass will save vars into qemuboot.conf, the
       qemuboot.conf can't be qemu-boot.py here, otherwise,
       "import qemu-boot.py" doesn't work since "-" is not a validate
       identifier, so use "qemuboot" to make them unify.
    
    c) Reorder the patches to make sure they don't break the bisect build.
  
  - Update commit message:
    "Fix SLIRP mode" -> "Fix SLIRP mode, add help message, avoid mixing
  with tap" 

* V1
  Previously, runqemu had hard coded machine knowledge, which limited its
  usage, for example, qemu can boot genericx86, but runqemu can't, we need
  edit runqemu/runqemu-internal a lot if we want to boot genericx86.
  
  Now bsp conf files can set vars to make it can be boot by runqemu, and
  qemuboot.bbclass will save these info to DEPLOY_DIR_IMAGE/qemuboot.conf.
  Please see qemuboot.bbclass' comments on how to set the vars.
  
  - Re-write it in python3, which can reduce lines from 1239 to about 750
    lines
  - All the machine knowledges are gone
  - All of the TUN_ARCH knowledge are gone (FIXED in V4)
  - All the previous options are preserved, and there is a new way to run
    runqemu: (it doesn't need run "bitake -e" in such a case)
    $ runqemu tmp/deploy/images/qemux86
    or:
    $ runqemu tmp/deploy/images/qemuarm/<image>.ext4
    or:
    $ runqemu tmp/deploy/images/qemuarm/qemuboot.conf
  - Fixed audio support, not limited on x86 or x86_64
  - The kvm support is not limited on x86 or x86_64 (REMOVED by V2)
  - Fix SLIRP mode (FIXED by V2)
  - Fix NFS boot, it will extract <image>.tar.bz2 or tar.gz to
    DEPLOY_DIR_IMAGE/<image>-nfsroot when no NFS_DIR, and remove it after
    stop.
  - More bsps can be boot, such as genericx86 and genericx86-64.
  - The patch for qemuzynq, qemuzynqmp, qemumicroblaze has been sent to
    meta-xilinx' mailing list.
  - I can't find any qemush4 bsp or how to build it, so it is not
    considered atm.
  
  - Tested the following machines, all of them work well.
    genericx86 genericx86-64
    qemuarm qemuarm64
    qemumips qemumips64 qemuppc
    qemux86 qemux86-64
    qemuzynq qemuzynqmp
  
    Tested ext4, nfs, slirp, vmdk, iso and cpio.gz when they are available.
  
  And also test "bitbake core-image-sato -ctestimage" which uses runqemu,
  it works, well.

// Robert

The following changes since commit a7f1435c4c26237cdb55066c9f5408b4fdf016aa:

  combo-layer: python3: fix UnicodeDecodeError (2016-08-24 13:58:24 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/runqemu

Robert Yang (10):
  qemuboot.bbclass: add it for runqemu
  qemuarm.conf: set vars for runqemu
  qemuarm64.conf: set vars for runqemu
  qemux86.conf/qemux86-64.conf: set vars for runqemu
  qemumips/qemumips64.conf: set vars for runqemu
  qemuppc.conf: set vars for runqemu
  qemu.inc: inherit qemuboot.bbclass
  runqemu: refactor it and remove machine knowledge
  nativesdk-qemu-helper: fix for new runqemu
  qemurunner.py/qemutinyrunner.py: remove runqemu-internal

 meta/classes/qemuboot.bbclass                      |   75 ++
 meta/conf/machine/include/qemu.inc                 |    2 +
 meta/conf/machine/include/qemuboot-mips.inc        |    7 +
 meta/conf/machine/include/qemuboot-x86.inc         |   14 +
 meta/conf/machine/qemuarm.conf                     |    5 +
 meta/conf/machine/qemuarm64.conf                   |   13 +
 meta/conf/machine/qemumips.conf                    |    1 +
 meta/conf/machine/qemumips64.conf                  |    1 +
 meta/conf/machine/qemuppc.conf                     |    7 +
 meta/conf/machine/qemux86-64.conf                  |    1 +
 meta/conf/machine/qemux86.conf                     |    1 +
 meta/lib/oeqa/utils/qemurunner.py                  |    2 +-
 meta/lib/oeqa/utils/qemutinyrunner.py              |    2 +-
 .../qemu/nativesdk-qemu-helper_1.0.bb              |    9 +-
 scripts/runqemu                                    | 1332 ++++++++++++--------
 scripts/runqemu-internal                           |  739 -----------
 16 files changed, 941 insertions(+), 1270 deletions(-)
 create mode 100644 meta/classes/qemuboot.bbclass
 create mode 100644 meta/conf/machine/include/qemuboot-mips.inc
 create mode 100644 meta/conf/machine/include/qemuboot-x86.inc
 delete mode 100755 scripts/runqemu-internal

-- 
2.9.0


