Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web10.1872.1611710784490508575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 17:26:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: jmEDhwYZXbFtq5yMSJEtOF2RbOjNykcHsQnB9LrKx227eo/hib78bncZaD56s5EvsWqhUdmYjr
 /rDwfUls6QZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="180080203"
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="180080203"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 17:26:22 -0800
IronPort-SDR: jeWWLizNbO/pLNXeE8A0xK/R4Nkny4sGmOT8zb+SJwUA0d6lAhiK29iichb7UEswDis68fqa1N
 8CvqEMmRmKpQ==
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="472965417"
Received: from yfong-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.89])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 17:26:21 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Subject: [gatesgarth][PATCH 00/20] pull request
Date: Wed, 27 Jan 2021 09:26:13 +0800
Message-Id: <cover.1611710622.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please merge these changes in gatesgarth.

Thanks,

Anuj

The following changes since commit c7bf9aebd002fc6bc23a57bc5e9863382bd17ae7:

  systemd: upgrade 246.6 -> 246.9 (2021-01-15 00:05:41 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/gatesgarth-next

Adrian Herrera (1):
  scripts: oe-run-native, fix *-native directories

Andrey Mozzhuhin (1):
  toolchain-shar-extract.sh: Handle special characters in script path

Chris Laplante (1):
  systemd.bbclass: improve error message when a service unit specified
    in SYSTEMD_SERVICE is not found

Mans Rullgard (1):
  boost: drop arm-intrinsics.patch

Marek Vasut (2):
  meta: toolchain-shar-relocate.sh: Do not use $target_sdk_dir as regex
  meta: toolchain-shar-relocate.sh: Filter out post-relocate-setup
    script

Mikko Rapeli (1):
  zip: whitelist CVE-2018-13410 and CVE-2018-13684

Nathan Rossi (1):
  gcc: Backport patch to resolve i*86 tune configuration overrides

Oleksiy Obitotskyy (1):
  flex: Fix --noline option behavior

Oleksiy Obitotskyy yIEf0zt.mo (1):
  toolchain-shar-relocate.sh: Fix handling files with colons

Paul Barker (7):
  wic: Add workdir argument
  wic: Ensure internal workdir is not reused
  wic: Allow exec_native_cmd to run HOSTTOOLS
  image_types_wic: Move wic working directory
  wic: Update pseudo db when excluding content from rootfs
  wic: Copy rootfs dir if fstab needs updating
  wic: Optimise fstab modification for ext2/3/4 and msdos partitions

Tomasz Dziendzielski (2):
  lib/oe/utils: Return empty string in parallel_make
  devtool: Fix source extraction for gcc shared source

Yi Fan Yu (1):
  binutils: Fix CVE-2020-35448

 meta/classes/image_types_wic.bbclass          |  10 +-
 meta/classes/systemd.bbclass                  |   3 +-
 meta/files/toolchain-shar-extract.sh          |  12 +-
 meta/files/toolchain-shar-relocate.sh         |   7 +-
 meta/lib/oe/utils.py                          |   2 +-
 .../binutils/binutils-2.35.1.inc              |   1 +
 .../binutils/binutils/CVE-2020-35448.patch    |  85 +++++++
 ...directives-if-gen_line_dirs-is-false.patch |  32 +++
 meta/recipes-devtools/flex/flex_2.6.4.bb      |   1 +
 meta/recipes-devtools/gcc/gcc-10.2.inc        |   2 +-
 ...0001-lib-Remove-i-86-march-overrides.patch | 113 ----------
 ...libgomp-libitc-Fix-bootstrap-PR70454.patch | 208 ++++++++++++++++++
 meta/recipes-extended/zip/zip_3.0.bb          |   6 +
 .../boost/boost/arm-intrinsics.patch          |  55 -----
 meta/recipes-support/boost/boost_1.74.0.bb    |   2 +-
 scripts/lib/devtool/standard.py               |  30 ++-
 scripts/lib/wic/misc.py                       |   7 +-
 scripts/lib/wic/partition.py                  |  32 ++-
 scripts/lib/wic/plugins/imager/direct.py      |  48 ++--
 scripts/lib/wic/plugins/source/rootfs.py      |  33 ++-
 scripts/oe-run-native                         |   2 +-
 scripts/wic                                   |   2 +
 22 files changed, 464 insertions(+), 229 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2020-35448.patch
 create mode 100644 meta/recipes-devtools/flex/flex/0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch
 delete mode 100644 meta/recipes-support/boost/boost/arm-intrinsics.patch

-- 
2.29.2

