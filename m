Return-Path: <max.eliaser@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CE46365D0E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 20:25:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Jun 2014 13:25:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1011,1392192000"; d="scan'208";a="555306410"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.65])
	by orsmga002.jf.intel.com with ESMTP; 10 Jun 2014 13:25:43 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jun 2014 13:24:04 -0700
Message-Id: <cover.1402431641.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH 0/3] Suppress Texinfo utilities invoked at build time for -cross & native recipes (revised)
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
X-List-Received-Date: Tue, 10 Jun 2014 20:25:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello list,

As per discussion with Richard Purdie and others, I'm submitting a patch to 
suppress some unnecessary invocations of utilities from the Texinfo suite during
Yocto builds. Specifically, it targets -native and -cross recipes that inherit
texinfo.bbclass. This series is revised to fix issues that came up on the 
autobuilder when I first tried submitting it.

The Texinfo utilities are suppressed by supplying doppelgänger executables which
understand the same command-line options as the genuine Texinfo utilites, and
which can create blank output files where expected, but which do no actual
processing, formatting, or markup. To see how this is done, look in the 
texinfo-dummy-native recipe (under meta/recipes-extended,) added in this patch
series, as well as the modifications to texinfo.bbclass, also in this patch 
series.

Suppressing the Texinfo utilities for -native and -cross recipes does provide a
noticable performance gain, as documented in bug 2421. [1] You could make the 
case that this patch series still does not completely address bug 2421, as there
are other utilities not from the Texinfo suite (groff, pod2man, etc) which are
not suppressed by these changes.

Target-architecture recipes continue to use the host system's Texinfo utilities
as before, so that dependency is not eliminated by this patch series. 

Regards,
-Max Eliaser

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=2421
The following changes since commit e7114046be6e71fb326477dc882adb814ef6a751:

  busybox: fix meta-yocto's bbappend's FILESEXTRAPATH (2014-06-03 17:53:13 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib meliaser/texinfo-build-2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=meliaser/texinfo-build-2

Max Eliaser (3):
  texinfo: Use texinfo-replacement-native as an alias for
    texinfo-native.
  texinfo-dummy-native: Create recipe w/ scripts to stand in for Texinfo
    utils.
  texinfo.bbclass: native/cross uses dummy texinfo; target uses host's
    Texinfo.

 meta/classes/texinfo.bbclass                       |  15 ++-
 meta/conf/bitbake.conf                             |   1 +
 .../texinfo-dummy-native/texinfo-dummy-native.bb   |  30 +++++
 .../texinfo-dummy-native/texinfo-dummy/COPYING     |  19 ++++
 .../texinfo-dummy-native/texinfo-dummy/template.py | 122 +++++++++++++++++++++
 meta/recipes-extended/texinfo/texinfo_5.2.bb       |   4 +-
 6 files changed, 189 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb
 create mode 100644 meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/COPYING
 create mode 100644 meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py

-- 
1.8.3.2


