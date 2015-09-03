Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0758A76FB8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 15:32:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Sep 2015 08:32:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,462,1437462000"; d="scan'208";a="797539448"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Sep 2015 08:32:45 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 18:34:09 +0300
Message-Id: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/12] Various package/RRS updates
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
X-List-Received-Date: Thu, 03 Sep 2015 15:32:48 -0000

This week I've reviewed all the packages that have been last touched in 2013 
or earlier (according to RRS) and this is the resulting patchset.

Since the feature freeze is happening soon, and there is still a large backlog of 
unmerged patches, I will stop the package version update at this point to avoid making
the situation worse :) and will look into other things, perhaps these:

1) fixing gobject introspection

2) completing the work of porting matchbox stuff to gtk3 (or *gasp* looking into 
replacing it with the most minimal possible gnome 3 shell/launcher).

3) other suggestions?

The following changes since commit c80b582212336044c55052ad0d39f9da06d71438:

  debianutils: create package for run-parts (2015-09-03 12:43:33 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (12):
  ccache: update to 3.2.3
  mailx: update to 12.5-5
  net-tools: update to 1.60-25
  gnome-icon-theme: remove the recipe
  libunique: remove the recipe
  mkelfimage: add RECIPE_NO_UPDATE_REASON
  python-async: update to 0.6.2
  python-smmap: update to 0.9.0
  remake: update to 4.1+dbg-1.1
  uclibc: update PV to 0.9.33.2 to match latest upstream release
  vte: add RECIPE_NO_UPDATE_REASON
  package_regex.inc: various updates to improve RRS accuracy

 meta/conf/distro/include/package_regex.inc         |  14 +-
 meta/recipes-core/uclibc/uclibc-git.inc            |   2 +-
 meta/recipes-devtools/ccache/ccache.inc            |   4 +-
 meta/recipes-devtools/ccache/ccache_3.1.11.bb      |   7 -
 meta/recipes-devtools/ccache/ccache_3.2.3.bb       |   8 +
 ...ion-in-recent-change-related-to-zlib-in-n.patch |  73 ++++
 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |   3 +
 ...python-async_0.6.1.bb => python-async_0.6.2.bb} |   4 +-
 ...python-smmap_0.8.2.bb => python-smmap_0.9.0.bb} |   4 +-
 meta/recipes-devtools/remake/remake.inc            |   4 +-
 ...ve-errors-about-colophon-and-cygnus-comma.patch |  39 --
 .../{remake_git.bb => remake_4.1+dbg-1.1.bb}       |   8 +-
 ...e-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch |  59 +++
 ...-SSL2-support-since-it-is-no-longer-suppo.patch |  41 ++
 ...ntian-warning-warning-macro-N-not-defined.patch |  25 ++
 .../0011-outof-Introduce-expandaddr-flag.patch     |  70 ++++
 ...ble-option-processing-for-email-addresses.patch |  79 ++++
 ...c-Unconditionally-require-wordexp-support.patch | 113 ++++++
 ...4-globname-Invoke-wordexp-with-WRDE_NOCMD.patch |  30 ++
 .../mailx/files/0015-usr-sbin-sendmail.patch       |  38 ++
 .../explicitly.disable.krb5.support.patch          |   0
 .../mailx/{mailx_12.5.bb => mailx_12.5-5.bb}       |  21 +-
 .../{net-tools_1.60-25.bb => net-tools_1.60-26.bb} |   6 +-
 .../gnome/gnome-icon-theme/pkgconfig-native.patch  |  28 --
 .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |  22 --
 meta/recipes-gnome/libunique/libunique/build.patch | 421 ---------------------
 .../libunique/fix_for_compile_with_gcc-4.6.0.patch |  36 --
 .../libunique/libunique/noconst.patch              | 130 -------
 meta/recipes-gnome/libunique/libunique_1.1.6.bb    |  25 --
 meta/recipes-support/vte/vte_0.28.2.bb             |   2 +
 30 files changed, 579 insertions(+), 737 deletions(-)
 delete mode 100644 meta/recipes-devtools/ccache/ccache_3.1.11.bb
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.2.3.bb
 create mode 100644 meta/recipes-devtools/ccache/files/0001-Fix-regression-in-recent-change-related-to-zlib-in-n.patch
 rename meta/recipes-devtools/python/{python-async_0.6.1.bb => python-async_0.6.2.bb} (77%)
 rename meta/recipes-devtools/python/{python-smmap_0.8.2.bb => python-smmap_0.9.0.bb} (82%)
 delete mode 100644 meta/recipes-devtools/remake/remake/remake-remove-errors-about-colophon-and-cygnus-comma.patch
 rename meta/recipes-devtools/remake/{remake_git.bb => remake_4.1+dbg-1.1.bb} (80%)
 create mode 100644 meta/recipes-extended/mailx/files/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch
 create mode 100644 meta/recipes-extended/mailx/files/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
 create mode 100644 meta/recipes-extended/mailx/files/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch
 create mode 100644 meta/recipes-extended/mailx/files/0011-outof-Introduce-expandaddr-flag.patch
 create mode 100644 meta/recipes-extended/mailx/files/0012-unpack-Disable-option-processing-for-email-addresses.patch
 create mode 100644 meta/recipes-extended/mailx/files/0013-fio.c-Unconditionally-require-wordexp-support.patch
 create mode 100644 meta/recipes-extended/mailx/files/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch
 create mode 100644 meta/recipes-extended/mailx/files/0015-usr-sbin-sendmail.patch
 rename meta/recipes-extended/mailx/{mailx-12.5 => files}/explicitly.disable.krb5.support.patch (100%)
 rename meta/recipes-extended/mailx/{mailx_12.5.bb => mailx_12.5-5.bb} (48%)
 rename meta/recipes-extended/net-tools/{net-tools_1.60-25.bb => net-tools_1.60-26.bb} (91%)
 delete mode 100644 meta/recipes-gnome/gnome/gnome-icon-theme/pkgconfig-native.patch
 delete mode 100644 meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
 delete mode 100644 meta/recipes-gnome/libunique/libunique/build.patch
 delete mode 100644 meta/recipes-gnome/libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch
 delete mode 100644 meta/recipes-gnome/libunique/libunique/noconst.patch
 delete mode 100644 meta/recipes-gnome/libunique/libunique_1.1.6.bb

-- 
2.1.4


