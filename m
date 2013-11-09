Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2359A6D320
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 05:28:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA95SvOc015858
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Nov 2013 21:28:57 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 8 Nov 2013 21:28:56 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 9 Nov 2013 13:28:50 +0800
Message-ID: <cover.1383974819.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/8] Fixes about unsafe-references QA warnings
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
X-List-Received-Date: Sat, 09 Nov 2013 05:28:55 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This solution is based on the following two principles.
1. With /usr on a seperate partition, system should still boot without any error.
2. Without /usr, system should be able to boot into single user mode with error.

When a QA warning about unsafe references is encountered, the above two principles,
together with FHS, are taken into consideration before making a decision.

For example, libkmod is moved to /lib because /lib/udevd requires it; libgudevd
is moved to /usr/lib because it's a GObject wrapper for libudev and it's obviously
not necessary for booting into single user mode.

This patchset also contains several fixes for the sysvinit system.

The overall effect of all these patches:
1. Performing a world build doesn't report any warning about unsafe references.
2. System can boot into runlevel 3 without any error if /usr is on another partition.
3. System can boot into single user mode without any error even if /usr is missing.

---------------------------------------------------------------------------

The following changes since commit 4fdc3d77d4a875b7236536bf78849a4d1f6a7449:

  kbd: Fix stdarg related errors on uclibc (2013-11-08 17:31:36 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/unsafe-reference
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/unsafe-reference

Chen Qi (8):
  udev: fix dependency and location of udevadm
  initscripts: add setup-commands.sh
  zlib: install into base_libdir
  kmod: install libkmod into base_libdir
  udev: fix unsafe reference by installing libgudev in libdir
  insane.bbclass: make the checking stricter for unsafe references in
    scripts
  iputils: fix program location and QA warning
  busybox: install ping6 into bindir by default

 meta/classes/insane.bbclass                        |    2 +-
 .../busybox-install-ping6-to-usr-bin.patch         |   25 +++++++++++++++++
 meta/recipes-core/busybox/busybox_1.21.1.bb        |    1 +
 .../initscripts/initscripts-1.0/setup-commands.sh  |   24 ++++++++++++++++
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    3 ++
 meta/recipes-core/udev/udev.inc                    |   16 ++++++++---
 meta/recipes-core/zlib/zlib_1.2.8.bb               |    2 +-
 meta/recipes-extended/iputils/iputils_s20121221.bb |   29 ++++++++++++--------
 meta/recipes-kernel/kmod/kmod_git.bb               |    7 +++--
 9 files changed, 89 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.21.1/busybox-install-ping6-to-usr-bin.patch
 create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/setup-commands.sh

-- 
1.7.9.5


