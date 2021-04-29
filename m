Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.2365.1619671281658268226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 21:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 0iFMqOFcSpYUYuOg2jhJ3RcrYsXPJEhbZjbKuPRK0eS532yJtqPM69kL2enHQOs7JbPqnxQtO9
 3dtiGDwBNxEw==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="282258271"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="282258271"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 21:41:20 -0700
IronPort-SDR: EymSHZips8wGNIYfJkVumjzvEF9VohTAE7jYse6j7GGvHaKSuQ8ZDDONK41wmXMgSfkFFlY1pf
 4i5X7RCOOw9g==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="423883605"
Received: from ytakikit-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.43.188])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 21:41:19 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/10] review request
Date: Thu, 29 Apr 2021 12:40:57 +0800
Message-Id: <cover.1619667368.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review these changes for hardknott. Builds cleanly on autobuilder
except for one intermittent and unrelated change.

Thanks,

Anuj

The following changes since commit 3357bbf0dad31306d5e16ad306d3e931042eec61:

  go: Use dl.google.com for SRC_URI (2021-04-26 08:44:53 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Alexander Kanavin (2):
  oeqa: tear down oeqa decorators if one of them raises an exception in
    setup
  meta/lib/oeqa/core/tests/cases/timeout.py: add a testcase for the
    previous fix

Chen Qi (3):
  glib-2.0: fix CVE-2021-28153
  weston: fix build failure due to race condition
  rsync: fix CVE-2020-14387

Kai Kang (2):
  kernel-yocto.bbclass: chdir to ${WORKDIR} for do_kernel_checkout
  cmake.bbclass: remove ${B} before cmake_do_configure

Richard Purdie (2):
  yocto-check-layer: Avoid bug when iterating and autoadding
    dependencies
  patchelf: Backport fix from upstream for note section overlap error

Stefan Ghinea (1):
  libssh2: fix build failure with option no-ecdsa

 meta/classes/cmake.bbclass                    |   8 +-
 meta/classes/kernel-yocto.bbclass             |   2 +-
 meta/lib/oeqa/core/case.py                    |   9 +-
 meta/lib/oeqa/core/decorator/oetimeout.py     |   5 +-
 meta/lib/oeqa/core/tests/cases/timeout.py     |  13 +
 meta/lib/oeqa/core/tests/test_decorators.py   |   6 +
 ...outputstream-Fix-a-typo-in-a-comment.patch |  32 ++
 ...-using-g_test_bug_base-in-file-tests.patch |  47 +++
 ...outputstream-Factor-out-a-flag-check.patch |  60 ++++
 ...stream-Fix-CREATE_REPLACE_DESTINATIO.patch | 294 ++++++++++++++++++
 ...stream-Add-a-missing-O_CLOEXEC-flag-.patch |  60 ++++
 meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb |  10 +
 ...c83653ce1b5fc201ff6db93b966394766814.patch |  44 +++
 .../patchelf/patchelf_0.12.bb                 |   1 +
 ...-the-hostname-in-the-certificate-whe.patch |  31 ++
 meta/recipes-devtools/rsync/rsync_3.2.3.bb    |   1 +
 ...001-meson.build-fix-incorrect-header.patch |  32 ++
 meta/recipes-graphics/wayland/weston_9.0.0.bb |   1 +
 ...EC-macro-outside-of-if-check-549-550.patch | 112 +++++++
 meta/recipes-support/libssh2/libssh2_1.9.0.bb |   1 +
 scripts/yocto-check-layer                     |   3 +
 21 files changed, 762 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-glocalfileoutputstream-Fix-a-typo-in-a-comment.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0002-tests-Stop-using-g_test_bug_base-in-file-tests.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0003-glocalfileoutputstream-Factor-out-a-flag-check.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0004-glocalfileoutputstream-Fix-CREATE_REPLACE_DESTINATIO.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0005-glocalfileoutputstream-Add-a-missing-O_CLOEXEC-flag-.patch
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/6edec83653ce1b5fc201ff6db93b966394766814.patch
 create mode 100644 meta/recipes-devtools/rsync/files/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-whe.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-meson.build-fix-incorrect-header.patch
 create mode 100644 meta/recipes-support/libssh2/files/0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch

-- 
2.30.2

