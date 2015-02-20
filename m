Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4359D716CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 04:24:38 +0000 (UTC)
Received: by iecar1 with SMTP id ar1so5209571iec.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 20:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xWPalOQzo5SN0Ml2EoqOjsrSu29Qe8sch87jL83NcZs=;
	b=FvSq+TYCSFzoWWSAGTeOFbQMuzNXkpWOi0nq1SsqfKGF/+56n9inYJwb7XODbhpsEN
	dfPOEg/Ryc/VwUf6aZMMS+ILuzIeApRoKy0RSHXS0KLsZ6+iFAp9TqW9TwJQg+omRmki
	1X1Y7giM4QOWpqDAbRkZU/6K1Yjx/UMatwSiNdbQw0FKKCNTLnm9hDbDMYPqyoM/C5dT
	ug2B8Y+cWP6ZYo4Gl31pF1ABixgZeELeB4OUei/6Q+MN2tRTYeRkqin2Q8qN2ecwcQ3x
	L0rJQmeRAkIAePysvgKLFwH1Bt2BBvyb0/jALbQJJrgVp47wR2DU73y4l7d7jBkyYmoy
	gwhQ==
X-Received: by 10.42.71.194 with SMTP id l2mr9724648icj.71.1424406279688;
	Thu, 19 Feb 2015 20:24:39 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205])
	by mx.google.com with ESMTPSA id ig15sm306447igb.10.2015.02.19.20.24.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Feb 2015 20:24:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Feb 2015 04:24:07 +0000
Message-Id: <cover.1424405852.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/5] systemd 219 upgrade and musl fixes
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
X-List-Received-Date: Fri, 20 Feb 2015 04:24:45 -0000

Upgrade to systemd 219 ( tested on mips/x86)
Divide util-linux into libs and apps part this solves
the catch-22 systemd -> libmount(utils-linux) -> systemd
Fix for musl to be a provider for libintl
Tighten glibc recipe parsing, helps in accomodating other libs

The following changes since commit 530565c6cb77319f4cc49edeea6fec6be997415d:

  glibc: Update to glibc 2.21 release tag (2015-02-19 17:04:19 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/misc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc

Khem Raj (5):
  systemd: Upgrade 216 -> 219
  util-linux,util-linux-libs: Build and package util-linux libs
    separately
  systemd: Add missing dependency on util-linux-libs
  tclibc-musl: Use musl for providing virtual/libintl instead of gettext
  glibc: Dont offer to be parsed for non-glibc TCLIBC selection

 meta/conf/distro/include/tclibc-musl.inc           |   2 +-
 meta/recipes-core/glibc/glibc_2.21.bb              |  12 +-
 ...1-Make-root-s-home-directory-configurable.patch | 127 ++++++++-------
 ...onfigure-the-list-of-system-users-files-a.patch | 176 ---------------------
 ...o-not-install-tmpfiles-and-sysusers-files.patch |  56 -------
 ...-Fix-navigating-backwards-missing-entries.patch |  34 ----
 ...ing.h-add-fake-__NR_memfd_create-for-MIPS.patch |  29 ----
 ...ke-resolv.conf-entry-conditional-on-resol.patch | 142 -----------------
 .../systemd/systemd/binfmt-install.patch           |  35 ++--
 .../systemd/systemd-pam-fix-fallocate.patch        |  50 +++---
 .../systemd/systemd/uclibc-sysinfo_h.patch         |  19 ---
 .../systemd/{systemd_216.bb => systemd_219.bb}     |  41 +++--
 ...ch_root_improve_statfs_f_type_portability.patch |  56 +++++++
 .../files/0002-include_statfs_magic.patch          |  45 ++++++
 .../{util-linux => files}/configure-sbindir.patch  |   0
 .../{util-linux => files}/fix-parallel-build.patch |   0
 .../uclibc-__progname-conflict.patch               |   0
 .../util-linux-native-qsort.patch                  |   0
 .../{util-linux => files}/util-linux-native.patch  |   0
 .../util-linux-ng-2.16-mount_lock_path.patch       |   0
 .../util-linux-ng-replace-siginterrupt.patch       |   0
 meta/recipes-core/util-linux/util-linux-libs.inc   |  93 +++++++++++
 .../util-linux/util-linux-libs_2.25.2.bb           |  25 +++
 meta/recipes-core/util-linux/util-linux.inc        |  23 +--
 meta/recipes-core/util-linux/util-linux_2.25.2.bb  |   2 +
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc      |   2 +-
 26 files changed, 357 insertions(+), 612 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-build-sys-configure-the-list-of-system-users-files-a.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-build-sys-do-not-install-tmpfiles-and-sysusers-files.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-journal-Fix-navigating-backwards-missing-entries.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-missing.h-add-fake-__NR_memfd_create-for-MIPS.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-tmpfiles-make-resolv.conf-entry-conditional-on-resol.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/uclibc-sysinfo_h.patch
 rename meta/recipes-core/systemd/{systemd_216.bb => systemd_219.bb} (92%)
 create mode 100644 meta/recipes-core/util-linux/files/0001-switch_root_improve_statfs_f_type_portability.patch
 create mode 100644 meta/recipes-core/util-linux/files/0002-include_statfs_magic.patch
 rename meta/recipes-core/util-linux/{util-linux => files}/configure-sbindir.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux => files}/fix-parallel-build.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux => files}/uclibc-__progname-conflict.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux => files}/util-linux-native-qsort.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux => files}/util-linux-native.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux => files}/util-linux-ng-2.16-mount_lock_path.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux => files}/util-linux-ng-replace-siginterrupt.patch (100%)
 create mode 100644 meta/recipes-core/util-linux/util-linux-libs.inc
 create mode 100644 meta/recipes-core/util-linux/util-linux-libs_2.25.2.bb

-- 
2.1.4


