Return-Path: <max.eliaser@intel.com>
Received: from mga09.intel.com (unknown [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9D301601A0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 21:38:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 May 2014 14:32:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1054,1389772800"; d="scan'208";a="511779123"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.149])
	by orsmga001.jf.intel.com with ESMTP; 14 May 2014 14:37:31 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 May 2014 14:35:37 -0700
Message-Id: <cover.1400103108.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH 0/3] Suppress Texinfo utilities invoked at build time for -cross & -native recipes
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
X-List-Received-Date: Wed, 14 May 2014 21:38:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello list,

As per discussion with Richard Purdie and others, I'm submitting a patch to 
suppress some unnecessary invocations of utilities from the Texinfo suite during
Yocto builds. Specifically, it targets -native and -cross recipes that inherit
texinfo.bbclass.

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
The following changes since commit 7b78c364b7de901f97cd8dbe56d5e02f545bf3d3:

  cleanup-workdir: Fix crosssdk reference after addition of PN (2014-05-05 09:05:42 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib meliaser/texinfo-build
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=meliaser/texinfo-build

Max Eliaser (3):
  Allow texinfo, texinfo-native recipes to build w/o host system's
    Texinfo utils
  Add texinfo-dummy-native recipe w/ scripts to stand in for Texinfo
    utils.
  native/cross recipes use texinfo-dummy-native; target arch use host's
    Texinfo.

 meta/classes/texinfo.bbclass                       |  15 ++-
 meta/conf/bitbake.conf                             |   1 +
 .../texinfo-dummy-native/texinfo-dummy-native.bb   |  30 +++++
 .../texinfo-dummy-native/texinfo-dummy/COPYING     |  19 ++++
 .../texinfo-dummy-native/texinfo-dummy/template.py | 122 +++++++++++++++++++++
 .../texinfo/texinfo/disable-native-tools.patch     |  43 --------
 .../texinfo/texinfo/use_host_makedoc.patch         |  17 ---
 meta/recipes-extended/texinfo/texinfo_5.2.bb       |   8 +-
 8 files changed, 188 insertions(+), 67 deletions(-)
 create mode 100644 meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb
 create mode 100644 meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/COPYING
 create mode 100644 meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
 delete mode 100644 meta/recipes-extended/texinfo/texinfo/disable-native-tools.patch
 delete mode 100644 meta/recipes-extended/texinfo/texinfo/use_host_makedoc.patch

-- 
1.8.3.2


