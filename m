Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6503477D1F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 20:53:34 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Apr 2017 13:53:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,191,1488873600"; d="scan'208";a="86717916"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 12 Apr 2017 13:53:35 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id A32936A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 13:53:25 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 23:40:55 +0300
Message-Id: <cover.1492029084.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/5] Make runqemu to work when rm_work is enabled
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
X-List-Received-Date: Wed, 12 Apr 2017 20:53:35 -0000

Hi,

runqemu fails when rm_work is enabled as it can't get qemu-system and tunctl
binaries from the native sysroot as it's removed by rm_work.

This is fixed by disabling removal of the qemu-helper-native sysroot directory
and changing runqemu code to run qemu-system and tunctl from it.

[YOCTO #11266]
[YOCTO #11193]

The following changes since commit 94467d5087ca3b13e7baac670af107550701b333:

  dev-manual, ref-manual: Edits to the "Incrementing Binary Package" section. (2017-04-12 19:35:00 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/oe-core/rm_work-runqemu-ed
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/oe-core/rm_work-runqemu-ed

Ed Bartosh (4):
  runqemu: get qemu from qemu-helper-native sysroot
  runqemu: add bindir_native property
  runqemu: use bindir_native property to run ifup/down scripts
  qemuboot: write native sysroot of qemu-helper into qemuboot.conf

brian avery (1):
  qemu-helper-native: prepare native sysroot for runqemu

 meta/classes/qemuboot.bbclass                      |  9 ++++++-
 .../qemu/qemu-helper-native_1.0.bb                 |  4 +++
 scripts/runqemu                                    | 30 +++++++++++++++++++---
 scripts/runqemu-ifdown                             |  6 ++---
 scripts/runqemu-ifup                               |  6 ++---
 5 files changed, 44 insertions(+), 11 deletions(-)

--
Regards,
Ed


