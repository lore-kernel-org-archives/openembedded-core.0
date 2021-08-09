Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.24726.1628523364931716435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 08:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="278466765"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="278466765"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:02 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="483462854"
Received: from abinzahx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.229.181])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:01 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/23] review request
Date: Mon,  9 Aug 2021 23:35:32 +0800
Message-Id: <cover.1628522214.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review these changes for hardknott. Testing on autobuilder
resulted in some intermittent ptest failures in valgrind, tcl and
lttng-tools and also a qemu timeout failure in musl-qemux86-64.

Thanks,

Anuj

The following changes since commit 2fd915eda136e20ab52baea6bb908d08ef8f5cbc:

  oe-setup-builddir: update YP docs and OE URLs (2021-07-31 17:56:12 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Alexander Kanavin (2):
  devtool: print a warning on upgrades if PREFERRED_VERSION is set
  nettle: update 3.7.2 -> 3.7.3

Bruce Ashfield (4):
  linux-yocto/5.10: update to v5.10.53
  linux-yocto/5.4: update to v5.4.135
  linux-yocto-rt/5.10: update to -rt47
  linux-yocto/5.10: enable TYPEC_TCPCI in usbc fragment

Chen Qi (1):
  zstd: fix CVE_PRODUCT

Joe Slater (1):
  util-linux: fix CVE 2021-37600

Jon Mason (1):
  parselogs.py: qemuarm should be qemuarmv5

Khem Raj (1):
  stress-ng: Drop defining daddr_t

Lee Chee Yang (2):
  aspell: fix CVE-2019-25051
  qemu: fix CVE-2021-3527

Matthias Klein (1):
  runqemu: Fix typo in error message

Michael Opdenacker (3):
  cve-check: fix comments
  cve-check: update link to NVD website for CVE details
  cve-check: improve comment about CVE patch file names

Mingli Yu (2):
  curl: fix CVE-2021-22925
  curl: fix CVES

Richard Purdie (3):
  sstate: Fix rebuilds when changing layer config
  license: Exclude COPYING.MIT from pseudo
  oeqa/runtime/cases/ptest: Increase test timeout from 300s to 450s

Ross Burton (1):
  qemu: fix virtio vhost-user-gpu CVEs

hongxu (1):
  createrepo-c: fix createrepo-c failed in nativesdk

 meta/classes/cve-check.bbclass                |  19 +-
 meta/classes/license.bbclass                  |   2 +-
 meta/classes/sstate.bbclass                   |   1 +
 meta/lib/oeqa/runtime/cases/parselogs.py      |   3 +-
 meta/lib/oeqa/runtime/cases/ptest.py          |   2 +-
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../util-linux/CVE-2021-37600.patch           |  38 ++
 .../createrepo-c/createrepo-c_0.17.0.bb       |   4 +-
 meta/recipes-devtools/qemu/qemu.inc           |   9 +
 ...ix-memory-disclosure-in-virgl_cmd_ge.patch |  43 ++
 ...ix-resource-leak-in-vg_resource_crea.patch |  41 ++
 ...ix-memory-leak-in-vg_resource_attach.patch |  48 ++
 ...ix-memory-leak-while-calling-vg_reso.patch |  50 ++
 ...ix-memory-leak-in-virgl_cmd_resource.patch |  58 +++
 ...ix-memory-leak-in-virgl_resource_att.patch |  49 ++
 ...ix-OOB-write-in-virgl_cmd_get_capset.patch |  49 ++
 .../qemu/qemu/CVE-2021-3527-1.patch           |  42 ++
 .../qemu/qemu/CVE-2021-3527-2.patch           |  59 +++
 .../stress-ng/stress-ng/no_daddr_t.patch      |  32 --
 .../stress-ng/stress-ng_0.12.05.bb            |   2 -
 meta/recipes-extended/zstd/zstd_1.4.9.bb      |   2 +
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 meta/recipes-support/aspell/aspell_0.60.8.bb  |   4 +-
 .../aspell/files/CVE-2019-25051.patch         | 101 ++++
 .../curl/curl/CVE-2021-22901.patch            | 453 ++++++++++++++++++
 .../curl/curl/CVE-2021-22924.patch            | 298 ++++++++++++
 .../curl/curl/CVE-2021-22925.patch            |  50 ++
 .../curl/curl/CVE-2021-22926.patch            |  79 +++
 meta/recipes-support/curl/curl_7.75.0.bb      |   4 +
 .../{nettle_3.7.2.bb => nettle_3.7.3.bb}      |   2 +-
 scripts/lib/devtool/upgrade.py                |   3 +
 scripts/runqemu                               |   2 +-
 37 files changed, 1537 insertions(+), 87 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-vhost-user-gpu-fix-memory-disclosure-in-virgl_cmd_ge.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-vhost-user-gpu-fix-resource-leak-in-vg_resource_crea.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0003-vhost-user-gpu-fix-memory-leak-in-vg_resource_attach.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0004-vhost-user-gpu-fix-memory-leak-while-calling-vg_reso.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0005-vhost-user-gpu-fix-memory-leak-in-virgl_cmd_resource.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0006-vhost-user-gpu-fix-memory-leak-in-virgl_resource_att.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0007-vhost-user-gpu-fix-OOB-write-in-virgl_cmd_get_capset.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3527-1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3527-2.patch
 delete mode 100644 meta/recipes-extended/stress-ng/stress-ng/no_daddr_t.patch
 create mode 100644 meta/recipes-support/aspell/files/CVE-2019-25051.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22901.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22924.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22925.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22926.patch
 rename meta/recipes-support/nettle/{nettle_3.7.2.bb => nettle_3.7.3.bb} (96%)

-- 
2.31.1

