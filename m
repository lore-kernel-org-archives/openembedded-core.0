Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 842EC6D803
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 06:22:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rAD6N1hv014473
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 22:23:01 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 12 Nov 2013 22:23:00 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2013 14:23:02 +0800
Message-ID: <cover.1384323613.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH V2 0/7] Fixes about unsafe-references QA warnings
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
X-List-Received-Date: Wed, 13 Nov 2013 06:23:00 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Changes since V1:
1. The two principles have been slightly adjusted as follows.
   *) With /usr on a seperate partition, system should still boot without any error. 
   *) Without /usr, system should be able to boot into single user mode. We do not
      need a clean build, we allow for error messages at boot, but the basic utilities
      should work. These should include mount, fsck and maybe udev.
2. Take into consideration the situation where exec_prefix and prefix are set to "".

The following changes since commit 4fdc3d77d4a875b7236536bf78849a4d1f6a7449:

  kbd: Fix stdarg related errors on uclibc (2013-11-08 17:31:36 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/unsafe-reference
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/unsafe-reference

Chen Qi (7):
  udev: fix dependency and location of udevadm
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
 meta/recipes-core/udev/udev.inc                    |   20 +++++++++++---
 meta/recipes-core/zlib/zlib_1.2.8.bb               |    2 +-
 meta/recipes-extended/iputils/iputils_s20121221.bb |   29 ++++++++++++--------
 meta/recipes-kernel/kmod/kmod_git.bb               |    9 ++++--
 7 files changed, 68 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.21.1/busybox-install-ping6-to-usr-bin.patch

-- 
1.7.9.5


