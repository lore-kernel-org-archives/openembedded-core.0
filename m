Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UBkAi-0003CQ-GQ
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 12:00:11 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r22AhhjY019963
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 2 Mar 2013 02:43:43 -0800 (PST)
Received: from pek-usp-3.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 2 Mar 2013 02:43:41 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 2 Mar 2013 18:46:40 +0800
Message-ID: <cover.1362217827.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [RFC PATCH 0/2] Fully support ext3/ext4 rootfs generation
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
X-List-Received-Date: Sat, 02 Mar 2013 11:00:30 -0000
Content-Type: text/plain

Replace genext2fs with populate-extfs.sh in image_types.bbclass to fully
support ext3/ext4 rootfs.

Comments from Darren:
We used genext2fs to create ext3/ext4 rootfs in the past, basically,
genext2fs doesn't support creating ext4 filesystems. It creates, as I
understand it, an ext2 filesystem, then adds a journal, and sets some
bits. It can't support the newer features like extents. So what we end
up with is a bit of a hack for a filesystem.

The ext tools (e2fsprogs) unfortunately don't provide an integrated
solution for generating prepopulated filesystem images as many other
mkfs* tools do. One thing missing was symlink support in libext2fs. I
added that support and demonstrated a script which uses the e2fsprogs
debugfs tool that can populate the newly formatted filesystem from a
directory and without root privileges.

This patches integrate this stage of development into OE-Core. We can
go about this in two ways. One is to just prototype this in a branch and
use it to validate the functionality and not make any changes to oe-core
image generation until mke2fs has initial directory support. The other
is to merge this and get broader testing of the concept and later move
to the full mke2fs implementation once it becomes available. I
understand the resistance to the latter, but long term I think it will
result in a more robust solution as we will have caught more of the
corner cases and have been able to do a better job integrating into
mke2fs the first time.


* Impact:
  + Rootfs generation time:
    - For a core-image-minimal image, about more 3 seconds are needed
    - For a core-image-sato image, about more 15 seconds are needed

  + Disk space usage:
    - Nearly no changes:
    $ ls -lh BEFORE.rootfs.ext3 AFTER.rootfs.ext3 | awk '{print $5"\t"$NF}'
    357M BEFORE.rootfs.ext3
    357M AFTER.rootfs.ext3
    
    $ du -sh BEFORE.rootfs.ext3 AFTER.rootfs.ext3
    238M    BEFORE.rootfs.ext3
    357M    AFTER.rootfs.ext3
    # This is different because BEFORE.rootfs.ext3 has sparse files,
    # they are very similar (less than 1M gap) after mount them and run
    # "du -sh".

// Robert

The following changes since commit 8264863ea0674f6cb105f5f7301861408fdc409b:

  Add KERNEL_EXTRA_ARGS parameter (2013-03-01 14:57:52 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/e2fsprogs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/e2fsprogs

Robert Yang (2):
  e2fsprogs: add populate-extfs.sh
  image_types.bbclass: replace genext2fs with populate-extfs.sh

 meta/classes/image_types.bbclass                   | 45 ++++++--------
 .../e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh   | 69 ++++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb |  2 +
 3 files changed, 88 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh

-- 
1.7.11.2



