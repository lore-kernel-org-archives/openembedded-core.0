Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6069377D0A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 10:55:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 11 Apr 2017 03:55:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,185,1488873600"; d="scan'208";a="844505871"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Apr 2017 03:55:21 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id CEB3D6A4006;
	Tue, 11 Apr 2017 03:55:11 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 13:55:14 +0300
Message-Id: <cover.1491907553.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCHv2 0/4] Use fixed DISTRO_FEATURES for native
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
X-List-Received-Date: Tue, 11 Apr 2017 10:55:22 -0000

Avoid signifant native task churn when DISTRO_FEATURES is changed
by defining (almost) fixed DISTRO_FEATURES for native recipes.

The DISTRO_FEATURES_FILTER_NATIVE variable lists the features that do
change based on DISTRO_FEATURES: currently the default value is
"api-documentation".

Changes since V1:
* Add DISTRO_FEATURES_FILTER_NATIVE instead of just a fixed list
* Use DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation": this is
  required for gtk-doc to work (and we don't want to enable it for
  all builds because of extensive dependencies)
* Only remove "x11" from required features for native x font tools:
  otherwise a non-x11 world build fails


Thanks,
 Jussi

The following changes since commit 0793c758b15e5007b4dd4b146987a0e74d6f6cba:

  Revert "staging: Fix sysroot problem with populate_sysroot dependencies on do_fetch" (2017-04-11 00:57:03 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/native-distro-features
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/native-distro-features

Jussi Kukkonen (4):
  mkfontdir: Remove x11 requirement for -native
  mkfontscale: Remove x11 requirement for -native
  xorg-font-common.inc: Remove x11 requirement for -native
  native.bbclass: Use fixed DISTRO_FEATURES

 meta/classes/native.bbclass                          | 13 +++++++++----
 meta/conf/bitbake.conf                               |  4 ++++
 meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb    |  3 +++
 meta/recipes-graphics/xorg-app/mkfontscale_1.1.2.bb  |  2 ++
 meta/recipes-graphics/xorg-font/xorg-font-common.inc |  1 +
 5 files changed, 19 insertions(+), 4 deletions(-)

-- 
2.1.4


