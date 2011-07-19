Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qiy4E-000258-3B
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 02:21:42 +0200
Received: by iwn4 with SMTP id 4so3528794iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 17:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=lLGVTkMrd1c//Lj2bZhb71nBEwnXw5D/a9ooHCtIdyE=;
	b=YVqNI2aXVW5s4uwJSmwb+Lt90bQJXMlibb2S1lvso9ZrWN9SqsPO46umFLrBL510mV
	0LKzsBcZ6JqAtnWhxVqs9/upRTp3A05zoTQFZXB9O6b3u2rRoZTxUPFu1GUspMoxl4Ym
	XcLrLKGQSTtBqHFOIzhToox2oSX+b8Tf66Y0Q=
Received: by 10.42.117.9 with SMTP id r9mr2448861icq.67.1311034656346;
	Mon, 18 Jul 2011 17:17:36 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d3sm3200047iba.23.2011.07.18.17.17.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 17:17:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 17:17:26 -0700
Message-Id: <cover.1311034342.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 00/16] Make core-image-minimal core-image-sato buildable with uclibc
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
X-List-Received-Date: Tue, 19 Jul 2011 00:21:42 -0000

This patch is V3 of the recents posts I have been doing from kraj/uclibc-oecore
branch. With this patchset now core-image-minimal is buildable and bootable
for all arches in oe-core. Core-image-sato is buildable but I have not tried to
boot it first attemp hung but then I have been trying to build eglibc based 
core-image-sato and make sure that that boots.

The following changes since commit 3d2c1ca9096790e4c6922b65b83ea1dffb90c362:

  util-linux: Replace sigsetmask with posix compliant functions (2011-07-15 18:52:49 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-oecore
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-oecore

Khem Raj (16):
  bitbake.conf: Change TERM default fallback to XTERM instead of
    GNOME_TERM
  oe-buildenv-internal: Replace POKYMODE POKYLIBC with TCMODE and
    TCLIBC
  default-distrovars: Add largefile and argp to DISTRO_FEATURES
  acl,attr: Fix build failures when NLS is disabled on uclibc
  classes/gettext: Do not disable nls for non target recipes
  libxdamage,libxft,libxrandr: Add missing dependency on virtual/libx11
  tzcode,tzdata: Update tzdata to 2011h
  task-core-x11-sato: Add empty NETWORK_MANAGER for uclibc
  uclibc_0.9.32: Implement sync_file_range2.
  oprofile: Fix build when query_module is not there
  powertop: Add lintl to linker commandline on uclibc
  pimlico/dates: Fix build on uclibc
  binutils: Fix build when compiling target binutils recipe with gcc
    4.6
  clutter-box2d: Replace use of finite macro with C99 compliant
    isfinite()
  sysprof: Define NT_GNU_BUILD_ID if undefined
  mesa-xlib: Dont use locales with uclibc

 meta/classes/gettext.bbclass                       |    2 +-
 meta/conf/bitbake.conf                             |    4 +-
 meta/conf/distro/include/default-distrovars.inc    |    3 +-
 .../uclibc/uclibc-0.9.32/sync_file_range2.patch    |   15 ++++
 meta/recipes-core/uclibc/uclibc_0.9.32.bb          |    3 +-
 .../binutils/binutils/clone-shadow.patch           |   79 ++++++++++++++++++++
 meta/recipes-devtools/binutils/binutils_2.21.1.bb  |    3 +-
 .../recipes-extended/tzcode/tzcode-native_2011g.bb |    7 +-
 .../tzdata/{tzdata_2011g.bb => tzdata_2011h.bb}    |    8 +-
 .../clutter/clutter-box2d/isfinite.patch           |   19 +++++
 meta/recipes-graphics/clutter/clutter-box2d_git.bb |    6 +-
 .../mesa/mesa-xlib/uclibc_locale.patch             |   18 +++++
 meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb     |    3 +-
 meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb |    4 +-
 meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb     |    4 +-
 meta/recipes-graphics/xorg-lib/libxrandr_1.3.1.bb  |    4 +-
 .../oprofile/oprofile-no-query-modules.patch       |   29 +++++++
 meta/recipes-kernel/oprofile/oprofile_0.9.6.bb     |    3 +-
 meta/recipes-kernel/powertop/powertop_1.13.bb      |   11 ++-
 .../sysprof/files/define-NT_GNU_BUILD_ID.patch     |   22 ++++++
 meta/recipes-kernel/sysprof/sysprof_git.bb         |    5 +-
 meta/recipes-sato/pimlico/dates.inc                |    2 +-
 .../uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch      |   37 +++++++++
 meta/recipes-sato/pimlico/dates_git.bb             |    6 +-
 meta/recipes-sato/tasks/task-core-x11-sato.bb      |    2 +
 meta/recipes-support/attr/acl_2.2.51.bb            |    2 +-
 meta/recipes-support/attr/attr.inc                 |    4 -
 meta/recipes-support/attr/attr_2.4.46.bb           |    2 +-
 meta/recipes-support/attr/ea-acl.inc               |    3 +
 scripts/oe-buildenv-internal                       |    2 +-
 30 files changed, 271 insertions(+), 41 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/clone-shadow.patch
 rename meta/recipes-extended/tzdata/{tzdata_2011g.bb => tzdata_2011h.bb} (96%)
 create mode 100644 meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa-xlib/uclibc_locale.patch
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/oprofile-no-query-modules.patch
 create mode 100644 meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
 create mode 100644 meta/recipes-sato/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch

-- 
1.7.4.1



