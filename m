Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.1466.1626403353753587249
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494544"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494544"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:31 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075372"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:30 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/28] review request
Date: Fri, 16 Jul 2021 10:41:58 +0800
Message-Id: <cover.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review these changes for hardknott. Builds cleanly on autobuilder
except for two intermittent ptest failures in lttng-tools and parted.

Thanks,

Anuj

The following changes since commit 4c2c3d3b84d883b2f1ad94095187e6b5b39e663f:

  lttng-modules: update to v2.12.6 (2021-07-02 11:14:53 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Andrej Valek (1):
  busybox: add tmpdir option into mktemp applet

Asfak Rahman (1):
  openssh: Remove temporary keys before generating new ones

Bruce Ashfield (6):
  linux-yocto/5.10: update to v5.10.47
  linux-yocto/5.4: update to v5.4.129
  linux-yocto/5.10: scsi-debug needs scsi-disk
  linux-yocto-dev: base AUTOREV on specified version
  kernel-devsrc: fix scripts/prepare for ARM64
  kernel-devsrc: fix scripts prepare for powerpc

Changqing Li (2):
  libconvert-asn1-perl: fix CVE-2013-7488
  boost-build-native: workaround one rarely hang problem on fedora34

Florian Amstutz (1):
  devtool: deploy-target: Fix preserving attributes when using --strip

Kai Kang (1):
  rxvt-unicode: fix CVE-2021-33477

Khairul Rohaizzat Jamaluddin (2):
  curl: Fix CVE-2021-22898
  curl: Fix CVE-2021-22897

Marek Vasut (1):
  linux-firmware: Package RSI 911x WiFi firmware

Mingli Yu (1):
  perl: correct libpth and glibpth

Richard Purdie (7):
  oeqa/selftest/runcmd: Tweal test timeouts
  sstate/staging: Handle directory creation race issue
  oeqa/selftest/archiver: Allow tests to ignore empty directories
  runqemu: Remove potential lock races around tap device handling
  glibc-testsuite: Fix build failures when directly running recipe
  oeqa/selftest/multiprocesslauch: Fix test race
  dwarfsrcfiles: Avoid races over debug-link files

Vinay Kumar (1):
  binutils: Fix CVE-2021-20197

Wadim Egorov (1):
  xserver-xorg: Fix builds without glx

wangmy (2):
  go: upgrade 1.16.3 -> 1.16.4
  go: upgrade 1.16.4 -> 1.16.5

zhengruoqin (1):
  busybox: upgrade 1.33.0 -> 1.33.1

 meta/classes/kernel-yocto.bbclass             |  24 +++
 meta/classes/sstate.bbclass                   |   8 +-
 meta/classes/staging.bbclass                  |   6 +-
 meta/lib/oeqa/selftest/cases/archiver.py      |  16 +-
 meta/lib/oeqa/selftest/cases/oelib/utils.py   |   3 +-
 meta/lib/oeqa/selftest/cases/runcmd.py        |   4 +-
 .../openssh/openssh/sshd_check_keys           |   1 +
 ...ss_gunzip-Fix-DoS-if-gzip-is-corrupt.patch |  58 -----
 .../0001-mktemp-add-tmpdir-option.patch       |  81 +++++++
 .../{busybox_1.33.0.bb => busybox_1.33.1.bb}  |   8 +-
 .../glibc/glibc-testsuite_2.33.bb             |   1 +
 .../binutils/binutils-2.36.inc                |   3 +
 .../binutils/0001-CVE-2021-20197.patch        | 201 ++++++++++++++++++
 .../binutils/0002-CVE-2021-20197.patch        | 170 +++++++++++++++
 .../binutils/0003-CVE-2021-20197.patch        | 171 +++++++++++++++
 .../dwarfsrcfiles/files/dwarfsrcfiles.c       |  13 +-
 .../go/{go-1.16.3.inc => go-1.16.5.inc}       |   4 +-
 ...e_1.16.3.bb => go-binary-native_1.16.5.bb} |   4 +-
 ..._1.16.3.bb => go-cross-canadian_1.16.5.bb} |   0
 ...{go-cross_1.16.3.bb => go-cross_1.16.5.bb} |   0
 ...osssdk_1.16.3.bb => go-crosssdk_1.16.5.bb} |   0
 ...o-native_1.16.3.bb => go-native_1.16.5.bb} |   0
 ...runtime_1.16.3.bb => go-runtime_1.16.5.bb} |   0
 .../go/{go_1.16.3.bb => go_1.16.5.bb}         |   0
 meta/recipes-devtools/perl/perl_5.32.1.bb     |   2 +
 .../libconvert-asn1-perl/CVE-2013-7488.patch  |  35 +++
 .../perl/libconvert-asn1-perl_0.27.bb         |   3 +-
 ...nd-Makefile.am-fix-build-without-glx.patch |  46 ++++
 .../xorg-xserver/xserver-xorg_1.20.10.bb      |   1 +
 .../linux-firmware/linux-firmware_20210511.bb |  11 +
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  22 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 .../rxvt-unicode-fix-CVE-2021-33477.patch     |  33 +++
 .../rxvt-unicode/rxvt-unicode_9.22.bb         |   4 +-
 .../boost/boost-build-native_4.3.0.bb         |   2 +-
 .../curl/curl/CVE-2021-22897.patch            |  72 +++++++
 .../curl/curl/CVE-2021-22898.patch            |  32 +++
 meta/recipes-support/curl/curl_7.75.0.bb      |   2 +
 scripts/lib/devtool/deploy.py                 |   2 +-
 scripts/runqemu                               |  27 ++-
 45 files changed, 1006 insertions(+), 138 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch
 rename meta/recipes-core/busybox/{busybox_1.33.0.bb => busybox_1.33.1.bb} (92%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-CVE-2021-20197.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0002-CVE-2021-20197.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0003-CVE-2021-20197.patch
 rename meta/recipes-devtools/go/{go-1.16.3.inc => go-1.16.5.inc} (88%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.3.bb => go-binary-native_1.16.5.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.3.bb => go-cross-canadian_1.16.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.3.bb => go-cross_1.16.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.3.bb => go-crosssdk_1.16.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.3.bb => go-native_1.16.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.3.bb => go-runtime_1.16.5.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.3.bb => go_1.16.5.bb} (100%)
 create mode 100644 meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2013-7488.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-hw-xwayland-Makefile.am-fix-build-without-glx.patch
 create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt-unicode-fix-CVE-2021-33477.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22897.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22898.patch

-- 
2.31.1

