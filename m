Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F0DE877C2A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 22:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490393187; x=1521929187;
	h=from:to:cc:subject:date:message-id;
	bh=48vT4Vnun8a+cc71vxmPPBU2Wk31ynYzQdhCOtdkrio=;
	b=EB9apN/ucde0Q2EAqBY0LTPCq6/GvpzrSxf8sdCD/xv3l4pwm98TQvA3
	rRVEcXheuUpaLsi/nrV+p5280ok3uw==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Mar 2017 15:06:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,216,1486454400"; d="scan'208";a="1111907761"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 24 Mar 2017 15:06:18 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org,
	juro.bystricky@intel.com
Date: Fri, 24 Mar 2017 15:06:13 -0700
Message-Id: <cover.1490392540.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH 0/3] oeqa/runtime: Import custom targets
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
X-List-Received-Date: Fri, 24 Mar 2017 22:06:27 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This series allows to import custom targets to be used with runtime testing.
Now is possible to have a target in <layer>/lib/oeqa/core/target and
testimage and testexport can use such target using TEST_TARGET variable.

To register a custom target you just need use decorate a target class with
registerTarget, and set "targetName" attribute to the name that will be used
by TEST_TARGET variable.

The following changes since commit 9fe7a69535f9443175da8289633a761f58c372ff:

  bitbake: bitbake-diffsigs: Add debug support (2017-03-23 13:19:50 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/oeqa_target
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/oeqa_target

Mariano Lopez (3):
  oeqa: Remove __init__.py files.
  oeqa/target: Add decorator to register targets
  oeqa/runtime/context.py: Add automatic target loading

 meta/classes/testexport.bbclass                    |  19 +++-
 meta/classes/testimage.bbclass                     |   4 +-
 meta/lib/oeqa/core/__init__.py                     |   0
 meta/lib/oeqa/core/cases/__init__.py               |   0
 .../oeqa/core/decorator/{__init__.py => base.py}   |   0
 meta/lib/oeqa/core/decorator/data.py               |   3 +-
 meta/lib/oeqa/core/decorator/depends.py            |   4 +-
 meta/lib/oeqa/core/decorator/oeid.py               |   2 +-
 meta/lib/oeqa/core/decorator/oetag.py              |   2 +-
 meta/lib/oeqa/core/decorator/oetimeout.py          |   2 +-
 meta/lib/oeqa/core/loader.py                       |   2 +-
 meta/lib/oeqa/core/target/__init__.py              |  33 -------
 meta/lib/oeqa/core/target/base.py                  |  82 ++++++++++++++++
 meta/lib/oeqa/core/target/qemu.py                  |   7 +-
 meta/lib/oeqa/core/target/ssh.py                   |   6 +-
 meta/lib/oeqa/core/tests/__init__.py               |   0
 meta/lib/oeqa/core/utils/__init__.py               |   0
 meta/lib/oeqa/runtime/context.py                   | 109 +++++----------------
 meta/lib/oeqa/runtime/decorator/package.py         |   2 +-
 meta/lib/oeqa/runtime/utils/__init__.py            |   0
 meta/lib/oeqa/sdk/__init__.py                      |   0
 meta/lib/oeqa/sdk/utils/__init__.py                |   0
 meta/lib/oeqa/sdkext/__init__.py                   |   0
 23 files changed, 142 insertions(+), 135 deletions(-)
 delete mode 100644 meta/lib/oeqa/core/__init__.py
 delete mode 100644 meta/lib/oeqa/core/cases/__init__.py
 rename meta/lib/oeqa/core/decorator/{__init__.py => base.py} (100%)
 delete mode 100644 meta/lib/oeqa/core/target/__init__.py
 create mode 100644 meta/lib/oeqa/core/target/base.py
 delete mode 100644 meta/lib/oeqa/core/tests/__init__.py
 delete mode 100644 meta/lib/oeqa/core/utils/__init__.py
 delete mode 100644 meta/lib/oeqa/runtime/utils/__init__.py
 delete mode 100644 meta/lib/oeqa/sdk/__init__.py
 delete mode 100644 meta/lib/oeqa/sdk/utils/__init__.py
 delete mode 100644 meta/lib/oeqa/sdkext/__init__.py

-- 
2.10.2


