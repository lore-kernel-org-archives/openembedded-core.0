Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B1D177065
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 06:55:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7J6tU4J015529
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 23:55:30 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 18 Aug 2016 23:55:29 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Aug 2016 23:55:21 -0700
Message-ID: <cover.1471589537.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH V3 0/8] runqemu: refactor it and remove machine knowledge
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
X-List-Received-Date: Fri, 19 Aug 2016 06:55:32 -0000
Content-Type: text/plain

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
       this is because the bbclass will save vars into qemuboot.py, the
       qemuboot.py can't be qemu-boot.py here, otherwise,
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
  qemuboot.bbclass will save these info to DEPLOY_DIR_IMAGE/qemuboot.py.
  Please see qemuboot.bbclass' comments on how to set the vars.
  
  - Re-write it in python3, which can reduce lines from 1239 to about 750
    lines
  - All the machine knowledges are gone
  - Most of the TUN_ARCH knowledge are gone except aarch64 and powerpc,
    it's not easy to remove the two, so leave them there atm
  - All the previous options are preserved, and there is a new way to run
    runqemu: (it doesn't need run "bitake -e" in such a case)
    $ runqemu tmp/deploy/images/qemux86
    or:
    $ runqemu tmp/deploy/images/qemuarm/<image>.ext4
    or:
    $ runqemu tmp/deploy/images/qemuarm/qemuboot.py
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

The following changes since commit 5dca6cc2fcdb2799c19b1697f0647a16ce296290:

  systemd-compat-units: Only enable for systemd in DISTRO_FEATURES (2016-08-18 16:52:02 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/runqemu

Robert Yang (8):
  qemuboot.bbclass: add it for runqemu
  qemuarm.conf: set vars for runqemu
  qemuarm64.conf: set vars for runqemu
  qemux86.conf/qemux86-64.conf: set vars for runqemu
  qemumips/qemumips64.conf: set vars for runqemu
  qemuppc.conf: set vars for runqemu
  qemu.inc: inherit qemuboot.bbclass
  runqemu: refactor it and remove machine knowledge

 meta/classes/qemuboot.bbclass               |   59 ++
 meta/conf/machine/include/qemu.inc          |    2 +
 meta/conf/machine/include/qemuboot-mips.inc |    7 +
 meta/conf/machine/include/qemuboot-x86.inc  |   14 +
 meta/conf/machine/qemuarm.conf              |    5 +
 meta/conf/machine/qemuarm64.conf            |    9 +
 meta/conf/machine/qemumips.conf             |    1 +
 meta/conf/machine/qemumips64.conf           |    1 +
 meta/conf/machine/qemuppc.conf              |    6 +
 meta/conf/machine/qemux86-64.conf           |    1 +
 meta/conf/machine/qemux86.conf              |    1 +
 scripts/runqemu                             | 1260 ++++++++++++++++-----------
 scripts/runqemu-internal                    |  739 ----------------
 13 files changed, 841 insertions(+), 1264 deletions(-)
 create mode 100644 meta/classes/qemuboot.bbclass
 create mode 100644 meta/conf/machine/include/qemuboot-mips.inc
 create mode 100644 meta/conf/machine/include/qemuboot-x86.inc
 delete mode 100755 scripts/runqemu-internal

-- 
2.9.0


