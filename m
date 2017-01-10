Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5C22B71A5E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 16:07:26 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id c20so77800057itb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 08:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=7je6X5O7IfTQUfbu6hnJq0/7TXqXSz5O67e1KwEGZVI=;
	b=SZDugecAv8AdWDEfxsX/rSm9KlEtA8a53XPD+uwVtuLRJSFO7ZV+FqFI8AoxVKlPIp
	6i5SP/Q7GgoaEU+n4plbwonzVi8oyna6GpaOU90RkgnsolaW7BK9OUZTskO7v/npLxDF
	00bjRFUBdOR1fTlBVhioJPHPDda1xne30eJhkJN+rWjBSg6IlJbI3ckfHTuG9dpQyHFp
	Qy16aknQXPPSgdki3a1PcPlyfUCLY8nxXEzOaNYg+3ggYa3mZbggXN/1zibP/lHG/iFo
	bHLxKvtjGD+ZNIP5JeeG33YFJ9yCLxVsMG7m4bw+TqitiJToQ4QiWQ6I877lSOLF2/B9
	uZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7je6X5O7IfTQUfbu6hnJq0/7TXqXSz5O67e1KwEGZVI=;
	b=dXqAjVfRMxlZgSo4HT19LG7GLFnu4I86jQ1ju9aiIFB/DFU7MtE4f688AvBdDgcsHg
	bYVNuQopHw5wbA79cYrtevwBsoBThPARNAHjvwvl9Ed0UcbDkiTJ8FNASOzUngquXTsM
	d2MtczoQjojxLsib8gSwXJbkSB+umIoR9moztMVilgIcZ/m05u82Hzs6haH4UJRP1fo8
	HclVdoL/CUI+2LGaaOumvfVZ8741m9WxfWclbSZpjEXqQuxEGrSCYrSpMBxe5iwJOd/I
	NbawWk+dAe+FHG6M4cyXgrpdlunTjQjUI3lnAkMpjQHxMhTxoYo2sLBPJc7R6hKcTYQs
	nCzw==
X-Gm-Message-State: AIkVDXJKq8X4A46b2mOv8JCAKgKxAGoeunbCoziTBqW02QixBa63WupwpZEORBOdfDgfKa04
X-Received: by 10.36.200.10 with SMTP id w10mr3716470itf.21.1484064447239;
	Tue, 10 Jan 2017 08:07:27 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56084.dip0.t-ipconnect.de.
	[87.165.96.132]) by smtp.gmail.com with ESMTPSA id
	b128sm5355597itb.5.2017.01.10.08.07.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jan 2017 08:07:25 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 17:07:16 +0100
Message-Id: <cover.1484063948.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2 00/11] UEFI + Secure Boot + qemu
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
X-List-Received-Date: Tue, 10 Jan 2017 16:07:27 -0000

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

The following changes since commit acce512a0b85853b5acf2ef07e4163a3b4f33a98:

  selftest/devtool: update test to work with new mtd-utils (2017-01-09 13:34:32 +0000)

are available in the git repository at:

  git://github.com/pohly/openembedded-core secure-boot
  https://github.com/pohly/openembedded-core/tree/secure-boot

Fathi Boudra (1):
  acpica: move from meta-oe to OE-core

Patrick Ohly (9):
  ovmf: explicitly depend on nasm-native
  ovmf: deploy firmware in image directory
  ovmf_git.bb: enable parallel compilation
  ovmf_git.bb: enable Secure Boot
  runqemu: also accept -image suffix for rootfs parameter
  runqemu: fix undefined variable reference in check_arg_path()
  runqemu: support UEFI with OVMF firmware
  ovmf: build image which enrolls standard keys
  ovmf: remove BGRT patch

meta-luv (1):
  ovmf: move from meta-luv to OE-core

 meta/recipes-core/ovmf/ovmf-shell-image.bb         |   17 +
 ...s-Force-tools-variables-to-host-toolchain.patch |   48 +
 ...0002-ovmf-update-path-to-native-BaseTools.patch |   32 +
 ...makefile-adjust-to-build-in-under-bitbake.patch |   39 +
 ...ollDefaultKeys-application-for-enrolling-.patch | 1124 ++++++++++++++++++++
 meta/recipes-core/ovmf/ovmf/ovmf-shell-image.wks   |    4 +
 meta/recipes-core/ovmf/ovmf_git.bb                 |  201 ++++
 meta/recipes-extended/acpica/acpica_20150515.bb    |   46 +
 .../acpica/acpitests/aapits-linux.patch            |  336 ++++++
 .../acpica/acpitests/aapits-makefile.patch         |   34 +
 meta/recipes-extended/acpica/acpitests_20140828.bb |   35 +
 meta/recipes-extended/acpica/files/no-werror.patch |   32 +
 scripts/runqemu                                    |   50 +-
 13 files changed, 1993 insertions(+), 5 deletions(-)
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

-- 
2.1.4


