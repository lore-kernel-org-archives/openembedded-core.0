Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id ABFFD7735D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 15:30:50 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id c7so152652108itd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 07:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=KQfRv8YHghRJ6ERbzRzlHojclBBbE+XE9ig4aWpUHhs=;
	b=u6Gd2kcBBIiuM7pxLvRcVgVtdtHru6YmHfFrObqqtAYmOUozZcx8+ogvLjm8ChBu3c
	rN6FDjOKgTiUVyhcJbJlyJUYY2m9Wv41GOiLmbIJx9l5kOlvRfMPmlcYGwpDjoM2/w8B
	F05K/oPMjJ0OuO4PUxCfoMVUdyo28P8QxCF8QpB5aCKgm0bJLP5xNOGTTd2G/gN465UN
	dr6JvvlVCpuXH8knI34ilkVyKF0Fu8Mw1/fdtodtQgmANBOvJcrnylzpYrBMz8H4D07X
	v7YfjqM1BivDt24hSeU4Ku66s8q+AJw3vCNmTxFKbPHBAvlDHMkdiCsCSJ1c4O8b7vYX
	z+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KQfRv8YHghRJ6ERbzRzlHojclBBbE+XE9ig4aWpUHhs=;
	b=By4cFZEwRARoa7sNZSuJ1yyTw9jH8VSW4VVQB83RRTGmrzxs7ouPskYI8wsddOEBAE
	V+Ot0rzZm31xhKr/NtP/9W/GWnRgaZsyo+DhdYBuEyrSLZBskdMPoWxIIB5r4mwYtLf2
	GKHMABHOgfeDkkDdP+BWWGBDWWhekVWWRy1kll6hwrYhuLtl9XodZ0ZReHyxJ4VmC76D
	qU8y32R2SEpDuzeC086uTfz+EYS0DbTPx9doDqIs3NIuA571tmMPX1d7jWTODOAXoZKj
	qoncrpl03TpD/5JP0oY0xTPw5H4+bZtVOd64CLo/hoNfIbPPfz0D5f7xWoysoFru4RFm
	xRig==
X-Gm-Message-State: AIkVDXKcWoBc0PuvsBeehP4rwrlzKgpGHoMzrurpPjL017/jXq/YjNC8cvcOs89U3YVuhVhV
X-Received: by 10.36.82.22 with SMTP id d22mr3769286itb.0.1485531050603;
	Fri, 27 Jan 2017 07:30:50 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DB2E.dip0.t-ipconnect.de.
	[93.232.219.46]) by smtp.gmail.com with ESMTPSA id
	a128sm1542174itg.22.2017.01.27.07.30.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jan 2017 07:30:49 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 16:30:30 +0100
Message-Id: <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v5 00/12] UEFI + Secure Boot + qemu
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
X-List-Received-Date: Fri, 27 Jan 2017 15:30:51 -0000

There seems to be a consensus that supporting UEFI in OE-core for qemu
would be valuable, and there have been some (stalled) attempts to add
it. For reference, see:
   [OE-core] [PATCH V3 0/3] Add UEFI firmware for qemux86*
   [OE-core] Add ovmf-native to make qemu-native/runqemu support boot UEFI image?
   https://bugzilla.yoctoproject.org/show_bug.cgi?id=5654
   https://github.com/01org/luv-yocto/issues/38

This patch set includes the necessary recipes (ovmf from meta-luv, acpica from
meta-oe), some improvements to them (in particular, enabling Secure
Boot), and changes to runqemu to make it easier to boot with UEFI. A
special image recipes builds an image which can be used to lock down a
virtual machine by enrolling the "normal" pre-installed certificates.

In contrast to the first version of this patch series, one can now use
both a single OVMF firmware file as well as set up persistent
variables for a virtual machine by using two files.

Eduardo promised to add automated testing for this once it is in OE-core.
As it stands now, ovmf-shell-image and ovmf without Secure Boot enabled
should at least be part of a world build.

As discussed on this list, Ricardo and Fathi volunteered to help with
maintaining the ovmf and acpica recipes in OE-core.

Beware that "git am --keep-cr" must be used to import the ovmf patches
correctly.

Changes since V1:
- support both combined code+vars ("ovmf") and separate code
  and vars flash drives ("ovmf.code ovmf.vars")
- OVMF firmware no longer installed in the target sysroot
- slightly simpler renaming from OVMF (uppercase, underscore)
  to OE naming convention (lowercase, dots): now the different
  ln invocation directly create files with the final name
- DEPLOYDIR needs to be cleaned explicitly (done via cleandirs varflag)
- Secure Boot support in ovmf is controlled by a PACKAGECONFIG option,
  off by default
- distros and developers can add additional Secure Boot compile flags
  with OVMF_SECURE_BOOT_EXTRA_FLAGS
- explain how to get ovmf built for use with runqemu via MACHINE_ESSENTIAL_EXTRA_RDEPENDS
- IMAGE_FSTYPES_forcevariable = "wic" used in ovmf-shell-image
- remove OVMF BGRT patch
- location of "inherit deploy"

Changes since V2:
- rebased onto current master
- workaround for acpica compile issue with flex 2.6.2

Changes since V3:
- rebased onto current master (for real, this time!)
- reordered patches a bit

Changes since V4:
- revised the commit message of "ovmf: deploy firmware in image directory"
  to clarify expected usage

Fathi Boudra (1):
  acpica: move from meta-oe to OE-core

Patrick Ohly (10):
  acpica: work around flex 2.6.2 code generation issue
  ovmf: explicitly depend on nasm-native
  ovmf: deploy firmware in image directory
  ovmf_git.bb: enable parallel compilation
  ovmf_git.bb: enable Secure Boot
  runqemu: fix undefined variable reference in check_arg_path()
  runqemu: also accept -image suffix for rootfs parameter
  runqemu: support UEFI with OVMF firmware
  ovmf: build image which enrolls standard keys
  ovmf: remove BGRT patch

meta-luv (1):
  ovmf: move from meta-luv to OE-core

 meta/recipes-core/ovmf/ovmf-shell-image.bb                                                  |   17 +-
 meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch    |   48 +++-
 meta/recipes-core/ovmf/ovmf/0002-ovmf-update-path-to-native-BaseTools.patch                 |   32 ++-
 meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch  |   39 ++-
 meta/recipes-core/ovmf/ovmf/0007-OvmfPkg-EnrollDefaultKeys-application-for-enrolling-.patch | 1124 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 meta/recipes-core/ovmf/ovmf/ovmf-shell-image.wks                                            |    4 +-
 meta/recipes-core/ovmf/ovmf_git.bb                                                          |  201 +++++++++++++-
 meta/recipes-extended/acpica/acpica_20150515.bb                                             |   47 +++-
 meta/recipes-extended/acpica/acpitests/aapits-linux.patch                                   |  336 ++++++++++++++++++++++-
 meta/recipes-extended/acpica/acpitests/aapits-makefile.patch                                |   34 ++-
 meta/recipes-extended/acpica/acpitests_20140828.bb                                          |   35 ++-
 meta/recipes-extended/acpica/files/no-werror.patch                                          |   32 ++-
 meta/recipes-extended/acpica/files/rename-yy_scan_string-manually.patch                     |   64 ++++-
 scripts/runqemu                                                                             |   50 ++-
 14 files changed, 2058 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-core/ovmf/ovmf-shell-image.bb
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0002-ovmf-update-path-to-native-BaseTools.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0007-OvmfPkg-EnrollDefaultKeys-application-for-enrolling-.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/ovmf-shell-image.wks
 create mode 100644 meta/recipes-core/ovmf/ovmf_git.bb
 create mode 100644 meta/recipes-extended/acpica/acpica_20150515.bb
 create mode 100644 meta/recipes-extended/acpica/acpitests/aapits-linux.patch
 create mode 100644 meta/recipes-extended/acpica/acpitests/aapits-makefile.patch
 create mode 100644 meta/recipes-extended/acpica/acpitests_20140828.bb
 create mode 100644 meta/recipes-extended/acpica/files/no-werror.patch
 create mode 100644 meta/recipes-extended/acpica/files/rename-yy_scan_string-manually.patch

base-commit: ce5c7075d530c0950f2feed35f95fbcd9f50721f
-- 
git-series 0.9.1

