Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.6573.1603143742162939505
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 14:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: <nil>, mailfrom: randy.e.witt@linux.intel.com)
IronPort-SDR: pKmzQCibDxUA34mvraG+TUxfJopvsQgc8PjCJphn4gpEgAIYZByW6VUsI6blLXBfDSMkUYVfIV
 wCz0JNvWnboQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="251805862"
X-IronPort-AV: E=Sophos;i="5.77,395,1596524400"; 
   d="scan'208";a="251805862"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2020 14:42:20 -0700
IronPort-SDR: l4PFLHGiECI8whXC6zjQZ8RohZZpexr+yUbAMMbAQJ+ZSqEsKjCv8r1ssw9Ahr/nsCnfF6f6eI
 U7nK8S8fH6dg==
X-IronPort-AV: E=Sophos;i="5.77,395,1596524400"; 
   d="scan'208";a="358958397"
Received: from rewitt-desk0.jf.intel.com ([10.7.159.148])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2020 14:42:20 -0700
From: "Randy Witt" <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy Witt <randy.e.witt@linux.intel.com>
Subject: [PATCH 0/4] Upgrade rt-tests to v1.8
Date: Mon, 19 Oct 2020 14:42:10 -0700
Message-Id: <20201019214214.2528690-1-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rt-tests now requires numactl in order to successfully compile. Since
numactl lives in meta-openembedded/meta-oe, it is added to oe-core as
part of the patch series.

After numactl is successfully merged into oe-core, I intend to send a
patch to remove it from meta-openembedded.

Randy Witt (4):
  numactl: Add the recipe for numactl
  numactl: Remove COMPATIBLE_HOST restrictions
  numactl: Skip the ptests when numa is not supported
  rt-tests: Update recipes to use 1.8

 ...Allow-for-CC-and-AR-to-be-overridden.patch |  28 +++++
 ...{hwlatdetect_1.1.bb => hwlatdetect_1.8.bb} |   0
 ...gzip-with-n-for-build-reproducibilty.patch |  62 -----------
 meta/recipes-rt/rt-tests/rt-tests.inc         |  11 +-
 .../{rt-tests_1.1.bb => rt-tests_1.8.bb}      |   9 +-
 .../numactl/0001-define-run-test-target.patch |  32 ++++++
 ...1-numademo-fix-error-on-32bit-system.patch | 100 ++++++++++++++++++
 .../numactl/Fix-the-test-output-format.patch  |  64 +++++++++++
 meta/recipes-support/numactl/numactl/Makefile |   7 ++
 .../recipes-support/numactl/numactl/run-ptest |  23 ++++
 meta/recipes-support/numactl/numactl_git.bb   |  57 ++++++++++
 11 files changed, 318 insertions(+), 75 deletions(-)
 create mode 100644 meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
 rename meta/recipes-rt/rt-tests/{hwlatdetect_1.1.bb => hwlatdetect_1.8.bb} (100%)
 delete mode 100644 meta/recipes-rt/rt-tests/rt-tests-1.1/0001-gzip-with-n-for-build-reproducibilty.patch
 rename meta/recipes-rt/rt-tests/{rt-tests_1.1.bb => rt-tests_1.8.bb} (70%)
 create mode 100644 meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
 create mode 100644 meta/recipes-support/numactl/numactl/0001-numademo-fix-error-on-32bit-system.patch
 create mode 100644 meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
 create mode 100644 meta/recipes-support/numactl/numactl/Makefile
 create mode 100755 meta/recipes-support/numactl/numactl/run-ptest
 create mode 100644 meta/recipes-support/numactl/numactl_git.bb

-- 
2.26.2

