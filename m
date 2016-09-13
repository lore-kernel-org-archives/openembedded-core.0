Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9277F771DB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 21:52:54 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 13 Sep 2016 14:52:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,330,1470726000"; d="scan'208";a="878435204"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga003.jf.intel.com with ESMTP; 13 Sep 2016 14:52:54 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2016 14:52:47 -0700
Message-Id: <1473803568-13012-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH 0/1] Race during Busybox parallel build
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
X-List-Received-Date: Tue, 13 Sep 2016 21:52:54 -0000

There is an occasional race observed when building Busybox with parallel make.
It has been discussed on Busybox mailing list, see:
https://www.mail-archive.com/busybox@busybox.net/msg23244.html

There were several Busybox attempts to fix this issue:
0dddbc1a59795a77679d8c5ef48a2795cb470563 ("build system: always rewrite NUM_APPLETS.h")
d8e61bbf13d0cf38d477255cfd5dc71c5d51d575 ("build system: different fix for include/applet_tables.h/include/NUM_APPLETS.h")

Although the above patches alleviated the problem somewhat (also included in this patches),
the race can still be observed. The error is consistently the same:

libbb/appletlib.c:164:13: error: 'NUM_APPLETS' undeclared (first use in this function)
  while (i < NUM_APPLETS) {

The reason is the include file where NUM_APPLETS is defined is not yet generated (or is being modified)
at the time libbb/appletlib.c is compiled.
The attached patch fixes the problem by assuring libb is compiled as the last directory.



Juro Bystricky (1):
  busybox: Avoid race building libbb

 .../busybox-kbuild-race-fix-commit-d8e61bb.patch   | 45 +++++++++++++++
 .../commit-applet_tables-fix-commit-0dddbc1.patch  | 53 ++++++++++++++++++
 .../busybox/busybox/makefile-libbb-race.patch      | 34 +++++++++++
 .../busybox/busybox/parallel-make-fix.patch        | 65 ----------------------
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  4 +-
 5 files changed, 135 insertions(+), 66 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-kbuild-race-fix-commit-d8e61bb.patch
 create mode 100644 meta/recipes-core/busybox/busybox/commit-applet_tables-fix-commit-0dddbc1.patch
 create mode 100644 meta/recipes-core/busybox/busybox/makefile-libbb-race.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/parallel-make-fix.patch

-- 
2.7.4


