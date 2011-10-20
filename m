Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RGyUy-0005A3-UJ
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 21:41:53 +0200
Received: by pzk33 with SMTP id 33so7979540pzk.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 12:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=5KL3M27/Wp4n/P6KtkXNvDndxnoc2ReQ92q0zJIJwYo=;
	b=G5LZVmKoCzHx/G5j/aoZbJgJht8parM3lMDI8C6InwEuBK9EJaka9fK1gND5JrC7Bi
	1iPIaLerqGGTs8us9wlNFcuu4d9xSb532Z8Ny4Si4WhYC4dOfyZbZhe8HiaBGVD1SkA7
	afig+y7wsDIcXv1XIVqCbMeXLZd7G1wQFuJvA=
Received: by 10.68.72.167 with SMTP id e7mr5691116pbv.19.1319139359654;
	Thu, 20 Oct 2011 12:35:59 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id x7sm21676287pbf.5.2011.10.20.12.35.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 12:35:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 12:35:52 -0700
Message-Id: <cover.1319139126.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/4] Update coreutils, libtool and fixes needed for gold
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Oct 2011 19:41:53 -0000

This patchset does the following

1. Upgrades coreutils and libtool partially helped with gold
2. Fixes a gcc bug thats highlighted by gold when linking connman
3. Fixes a DEPENDS problem in xserver-xorg

With these changes I am able to build systemd-gnome-image for angstrom on arm

The following changes since commit 808b43dff8facfddae05ef14b7b7daf5fa993a3d:

  libtool: Upgrade from 2.4 -> 2.4.2 (2011-10-20 12:26:13 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/gold-updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/gold-updates

Khem Raj (4):
  xserver-xorg: Add mesa-dri to DEPENDS
  gcc-4.6: Backport fix for PR32219
  coreutils: Upgrade recipe 8.12 -> 8.14
  libtool: Upgrade from 2.4 -> 2.4.2

 .../remove-usr-local-lib-from-m4.patch             |   18 +++---
 .../{coreutils_8.12.bb => coreutils_8.14.bb}       |   11 ++--
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    3 +-
 meta/recipes-devtools/gcc/gcc-4.6/pr32219.patch    |   71 ++++++++++++++++++++
 .../libtool/{libtool.inc => libtool-2.4.2.inc}     |   26 ++++++--
 meta/recipes-devtools/libtool/libtool-2.4.inc      |   13 ----
 ...libtool-cross_2.4.bb => libtool-cross_2.4.2.bb} |    2 +-
 ...btool-native_2.4.bb => libtool-native_2.4.2.bb} |    2 +-
 ...nativesdk_2.4.bb => libtool-nativesdk_2.4.2.bb} |    2 +-
 meta/recipes-devtools/libtool/libtool/prefix.patch |   46 ++++++------
 .../libtool/libtool/resolve-sysroot.patch          |   42 ------------
 .../libtool/{libtool_2.4.bb => libtool_2.4.2.bb}   |    2 +-
 .../xorg-xserver/xserver-xorg_1.11.1.bb            |    1 +
 meta/site/common-linux                             |    3 +
 14 files changed, 139 insertions(+), 103 deletions(-)
 rename meta/recipes-core/coreutils/{coreutils-8.12 => coreutils-8.14}/remove-usr-local-lib-from-m4.patch (65%)
 rename meta/recipes-core/coreutils/{coreutils_8.12.bb => coreutils_8.14.bb} (90%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/pr32219.patch
 rename meta/recipes-devtools/libtool/{libtool.inc => libtool-2.4.2.inc} (57%)
 delete mode 100644 meta/recipes-devtools/libtool/libtool-2.4.inc
 rename meta/recipes-devtools/libtool/{libtool-cross_2.4.bb => libtool-cross_2.4.2.bb} (98%)
 rename meta/recipes-devtools/libtool/{libtool-native_2.4.bb => libtool-native_2.4.2.bb} (96%)
 rename meta/recipes-devtools/libtool/{libtool-nativesdk_2.4.bb => libtool-nativesdk_2.4.2.bb} (97%)
 delete mode 100644 meta/recipes-devtools/libtool/libtool/resolve-sysroot.patch
 rename meta/recipes-devtools/libtool/{libtool_2.4.bb => libtool_2.4.2.bb} (94%)

-- 
1.7.5.4



