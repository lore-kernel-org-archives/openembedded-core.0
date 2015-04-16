Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7829473D41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 01:59:28 +0000 (UTC)
Received: by pdbqd1 with SMTP id qd1so73342789pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 18:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=f4AhY/X/LUWhFcvUWoF8qzeoV0n3HoZ6y01FpWS5xvM=;
	b=OVdP3EpqekhzVwxg9HdSug+1S833zgFza1R8JsTguGH6OqouLWL45hPNJDLfCBZpDE
	1XoLR8mSFPLaMfFBhDS0GEI2mqa6L4/6OKpVNOnxaYYRlrnBSV3a0FVXG2JgxiIkBBcn
	/tZb9mKxcP7koYRtf+Gt0sgmK25G5Z5ufte3CB42awKWkQ+DN0QZdfH5FFdfN4botLgZ
	Gp9sCWCvzz0eaGNvEvdCwIEG8WYyyjgDpEH56u/DW6eysmgimafKqtzsNV4ywr22mPcZ
	aOwBM7P98XCGEF5Zfq4uA+TeTbtblwVmiBrMbeSmMElLuwOT6Ev/1X+JR6SSrNZhlfAY
	YALA==
X-Received: by 10.66.250.106 with SMTP id zb10mr51802128pac.36.1429149569802; 
	Wed, 15 Apr 2015 18:59:29 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id el6sm5320945pdb.93.2015.04.15.18.59.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Apr 2015 18:59:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Apr 2015 18:59:22 -0700
Message-Id: <cover.1429149397.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/10] More musl fixes
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
X-List-Received-Date: Thu, 16 Apr 2015 01:59:33 -0000

This patchset fixes few more recipes as we move towards building
world with musl, mainly addresses the recipes which install charset.alias
on musl systems, Now we have 60 odd packages left to compile in world build 

Khem Raj (10):
  at: Remove glibc specific code
  coreutils: Add code to consider musl when selecting charsets
  openssh: Upgrade 6.7 - > 6.8
  dosfstools: Fix build with musl
  distcc:Include missing fcntl.h in zeroconf
  parted: Add patches to fix build on musl
  libnfsidmap: Include sys/types.h for u_int32_t
  recipes: Fix charset.alias for musl
  mtd-utils: update to latest and fix static inlining
  connman: Fix builds to compile on musl

 ...need_charset_alias-when-building-for-musl.patch |  30 +++
 meta/recipes-bsp/grub/grub2.inc                    |   1 +
 ...cktrace-API-only-when-compiling-for-glibc.patch |  41 ++++
 .../connman/connman/0002-musl-header-fixes.patch   | 235 +++++++++++++++++++++
 ...resolve-musl-does-not-implement-res_ninit.patch |  77 +++++++
 ...Fix-duplicate-definitions-issue-with-musl.patch |  43 ++++
 meta/recipes-connectivity/connman/connman_1.28.bb  |   4 +
 ...clude-sys-types.h-for-getting-u_-typedefs.patch |  27 +++
 .../Set_nobody_user_group.patch                    |   0
 .../{files => libnfsidmap}/fix-ac-prereq.patch     |   0
 .../nfs-utils/libnfsidmap_0.25.bb                  |   1 +
 .../openssh/add-test-support-for-busybox.patch     |  38 ++--
 .../openssh/{openssh_6.7p1.bb => openssh_6.8p1.bb} |   4 +-
 ...need_charset_alias-when-building-for-musl.patch |  33 +++
 meta/recipes-core/coreutils/coreutils_8.23.bb      |   1 +
 ...need_charset_alias-when-building-for-musl.patch |  33 +++
 meta/recipes-devtools/bison/bison_2.7.1.bb         |   1 +
 meta/recipes-devtools/distcc/distcc_3.1.bb         |   1 +
 .../files/0001-zeroconf-Include-fcntl.h.patch      |  29 +++
 ...ude-fcntl.h-for-getting-loff_t-definition.patch |  41 ++++
 .../recipes-devtools/dosfstools/dosfstools_2.11.bb |   5 +-
 meta/recipes-devtools/m4/m4-1.4.17.inc             |   3 +
 ...need_charset_alias-when-building-for-musl.patch |  33 +++
 ...emove-duplicate-hashtable_iterator_value-.patch |  64 ++++++
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |   1 +
 ...need_charset_alias-when-building-for-musl.patch |  33 +++
 meta/recipes-devtools/patch/patch_2.7.5.bb         |   4 +-
 .../at/at/0001-remove-glibc-assumption.patch       |  57 +++++
 meta/recipes-extended/at/at_3.1.16.bb              |   1 +
 meta/recipes-extended/augeas/augeas.inc            |   1 +
 ...need_charset_alias-when-building-for-musl.patch |  30 +++
 ...need_charset_alias-when-building-for-musl.patch |  30 +++
 meta/recipes-extended/cpio/cpio_2.11.bb            |   3 +-
 ...need_charset_alias-when-building-for-musl.patch |  33 +++
 meta/recipes-extended/diffutils/diffutils_3.3.bb   |   1 +
 ...need_charset_alias-when-building-for-musl.patch |  30 +++
 .../recipes-extended/findutils/findutils_4.5.14.bb |   2 +
 ...need_charset_alias-when-building-for-musl.patch |  33 +++
 meta/recipes-extended/grep/grep_2.21.bb            |   4 +-
 ...need_charset_alias-when-building-for-musl.patch |  30 +++
 meta/recipes-extended/groff/groff_1.22.3.bb        |   8 +-
 .../0001-Include-fcntl.h-in-platform_defs.h.patch  |  29 +++
 ...need_charset_alias-when-building-for-musl.patch |  33 +++
 meta/recipes-extended/parted/parted_3.2.bb         |   2 +
 ...need_charset_alias-when-building-for-musl.patch |  33 +++
 meta/recipes-extended/sed/sed_4.2.2.bb             |   1 +
 ...need_charset_alias-when-building-for-musl.patch |  30 +++
 meta/recipes-extended/texinfo/texinfo_5.2.bb       |   3 +-
 ...need_charset_alias-when-building-for-musl.patch |  30 +++
 meta/recipes-extended/wget/wget_1.16.3.bb          |   1 +
 ...need_charset_alias-when-building-for-musl.patch |  30 +++
 .../libunistring/libunistring_0.9.4.bb             |   1 +
 52 files changed, 1214 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-Enable-backtrace-API-only-when-compiling-for-glibc.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0002-musl-header-fixes.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0003-resolve-musl-does-not-implement-res_ninit.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0004-tethering-Fix-duplicate-definitions-issue-with-musl.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/libnfsidmap/0001-include-sys-types.h-for-getting-u_-typedefs.patch
 rename meta/recipes-connectivity/nfs-utils/{files => libnfsidmap}/Set_nobody_user_group.patch (100%)
 rename meta/recipes-connectivity/nfs-utils/{files => libnfsidmap}/fix-ac-prereq.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh_6.7p1.bb => openssh_6.8p1.bb} (97%)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.23/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-devtools/bison/bison/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-devtools/distcc/files/0001-zeroconf-Include-fcntl.h.patch
 create mode 100644 meta/recipes-devtools/dosfstools/dosfstools/0001-Include-fcntl.h-for-getting-loff_t-definition.patch
 create mode 100644 meta/recipes-devtools/m4/m4/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch
 create mode 100644 meta/recipes-devtools/patch/patch/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-extended/at/at/0001-remove-glibc-assumption.patch
 create mode 100644 meta/recipes-extended/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-extended/diffutils/diffutils-3.3/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-extended/findutils/findutils/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-extended/grep/grep/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-extended/groff/groff-1.22.3/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-extended/parted/files/0001-Include-fcntl.h-in-platform_defs.h.patch
 create mode 100644 meta/recipes-extended/parted/files/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-extended/sed/sed-4.2.2/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-extended/wget/wget/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-support/libunistring/libunistring/0001-Unset-need_charset_alias-when-building-for-musl.patch

-- 
2.1.4


