Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 59FD973204
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 11:56:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 27 Apr 2016 04:56:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,541,1455004800"; d="scan'208";a="963769908"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 27 Apr 2016 04:56:25 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 68B626A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 05:44:01 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 12:36:29 +0300
Message-Id: <cover.1461749328.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2 0/3] bmaptool support
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
X-List-Received-Date: Wed, 27 Apr 2016 11:56:25 -0000

Hi,

This patchset adds ability to use bmaptool to flash images faster than
using traditional methods.

Bmaptool is a generic tool for creating the block map (bmap) for a file
and and copying files using the block map. The idea is that large file
containing unused blocks, like raw system image files, can be copied or
flashed a lot faster with bmaptool than with traditional tools like
"dd" or "cp".

Here is an example of flashing image using dd and bmaptool showing
around 25% performance gain in flashing time:

> ls -slh
 19M -rw-r--r-- 1 ed ed  26M Apr 26 11:36 core-image-minimal-qemux86-64-20160426083554.rootfs.ext4
4.0K -rw-r--r-- 1 ed ed 2.7K Apr 26 11:36 core-image-minimal-qemux86-64-20160426083554.rootfs.ext4.bmap

> time dd if=core-image-minimal-qemux86-64-20160426083554.rootfs.ext4 of=/dev/sdb
52302+0 records in
52302+0 records out
26778624 bytes (27 MB) copied, 2.51183 s, 10.7 MB/s

real    0m2.515s
user    0m0.014s
sys     0m0.329s

> time bmaptool copy core-image-minimal-qemux86-64-20160426083554.rootfs.ext4 /dev/sdb
bmaptool: info: discovered bmap file 'core-image-minimal-qemux86-64-20160426083554.rootfs.ext4.bmap'
bmaptool: info: block map format version 2.0
bmaptool: info: 6538 blocks of size 4096 (25.5 MiB), mapped 4799 blocks (18.7 MiB or 73.4%)
bmaptool: info: copying image 'core-image-minimal-qemux86-64-20160426083554.rootfs.ext4' to block device '/dev/sdb' using bmap file 'core-image-minimal-qemux86-64-20160426083554.rootfs.ext4.bmap'
bmaptool: info: 100% copied
bmaptool: info: synchronizing '/dev/sdb'
bmaptool: info: copying time: 1.8s, copying speed 10.3 MiB/sec

real    0m1.909s
user    0m0.226s
sys     0m0.052s

The test was repeated 5 times with the same image and the same usb stick device.

Changes in v2: Combined Alexander's and my bmap-tools recipes.
               Got rid of generating standalone script as it breaks build of bmap-tools-native.

The following changes since commit a9b503b268e94d311f892fa00c5d6bd9ffdb228e:

  license.bbclass: make sure that image manifest dir exists (2016-04-22 16:28:57 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/oe-core/bmap-tools-9414
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/oe-core/bmap-tools-9414

Alexander D. Kanevskiy (1):
  image types: add bmap generation option

Ed Bartosh (2):
  bmap-tools: initial commit, version 3.2
  selftest: add bmap test

 meta/classes/image_types.bbclass                  |  4 +++-
 meta/lib/oeqa/selftest/imagefeatures.py           | 27 +++++++++++++++++++++++
 meta/recipes-support/bmap-tools/bmap-tools_3.2.bb | 24 ++++++++++++++++++++
 3 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/bmap-tools/bmap-tools_3.2.bb

-- 
2.1.4


