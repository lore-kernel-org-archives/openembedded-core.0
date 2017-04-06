Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D267677C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 13:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491485010; x=1523021010; h=from:to:subject:date:message-id;
	bh=BRQYAUGr0TkHaYTaoftDaXv/qk1kpjz+Mijqk612NVg=;
	b=DqRSDkwqQnSgoEBC44OKJvhFVdtHbjkCoP9Q/rgZSyGAinKxhKEqsF7o
	nyxgP2mVhJ0/dqK9jypB3WPbq7Tzzg==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2017 06:23:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,159,1488873600"; d="scan'208";a="1116286949"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.12.215])
	by orsmga001.jf.intel.com with ESMTP; 06 Apr 2017 06:23:28 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Apr 2017 14:23:12 +0100
Message-Id: <cover.1491484515.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 0/2] Fixes for building on Fedora 26 (Alpha)
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
X-List-Received-Date: Thu, 06 Apr 2017 13:23:29 -0000

As Fedora 26 has a new gcc [1] and a new system pkg-config implementation [2] I
wanted to do some testing on that host OS so that we might be able to get some
fixes in before Pyro/2.3 is released.

The following series were the only changes required to start building (I have 
tested core-image-minimal, core-image-base and core-image-sato) on Fedora 26.

1. https://fedoraproject.org/wiki/Changes/GCC7
2. https://fedoraproject.org/wiki/Changes/pkgconf_as_system_pkg-config_implementation

The following changes since commit 633ad6c9f436f5d2b6ee1a005b697661a054a394:

  oeqa/runtime/utils/targetbuildproject: use parent classes defaults tmpdir (2017-04-06 10:13:39 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib joshuagl/fedora26
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=joshuagl/fedora26

Joshua Lock (2):
  elfutils: fix building elfutils-native with GCC7
  gcc-6.3: backport fix of check for empty string in ubsan.c

 .../elfutils-0.168/Fix_one_GCC7_warning.patch      | 44 ++++++++++++++++++++++
 .../elfutils/elfutils-0.168/fallthrough.patch      | 36 ++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.168.bb   |  3 ++
 meta/recipes-devtools/gcc/gcc-6.3.inc              |  1 +
 .../gcc/gcc-6.3/ubsan-fix-check-empty-string.patch | 28 ++++++++++++++
 5 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/Fix_one_GCC7_warning.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/fallthrough.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/ubsan-fix-check-empty-string.patch

-- 
2.9.3

