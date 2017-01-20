Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5977771E52
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 13:38:14 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id c7so20038057itd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 05:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=UZsFeRBGArqJh+2e2912buB23o/fjAojNqM10HtSR6M=;
	b=ntNW/6BQVa54ZuH52uto4udesUB+3OpAfln7b1M8eLEknMB+9Ijx1Oa9YdY8aDNdJE
	h8C66KVbjJGnlJ5d0r2Hosx3QvLhWUB6CbBcivwyC34DkaAyAMaK/oHPa4TJIkiefO5m
	5XBuzy7jJsXtFcHGEKoNXipvU62aRyS5B2NoP8Lm34Nc/WXxufQNuNmbworh3GPFOpLi
	uHgua48owWzzXMakw8D5cILOyPY03Yc1w6ZK+5tr/RpKPdIiMG4GuoySjCBnTA05m3RQ
	6aesM5T0HUF5XNnTIR2Mp9FpL9K6dZ83jEmjoMgxYDlojl8FYt6IxmhWkPV8Hz6j0SMw
	C9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UZsFeRBGArqJh+2e2912buB23o/fjAojNqM10HtSR6M=;
	b=dxbpIUZj7yjSeYzbC+DdiT/UTtl+aBWayoiZRm20a8KGIuGVNV9mnYupda8aW35XWx
	DPOKnPGXsyrmU12ykEaDYax4Qs+84FJl7dxdQMxScnV9VJKK7fb0R6yTlFMSjN6gs9e3
	N5Q7gupiYaN/+R12tLI9ffWkk6Zg8j/QTvxElbKKLsca6Mh4DsLCDNHvh7UgvuJ20j1q
	nIELR14BYAjNo10GjQo8p1p4ovmsmONV/ij5lUwhTiVXbqfC4Uc17Nhkkg0/ON3sHaSe
	yw9lx6849uvfFGljReC2TTp95ZOLrDPbSmEFJf2ERpXzQx+Cv85vvmbLXMsErMUaH+u2
	2mvQ==
X-Gm-Message-State: AIkVDXIKBqOl7VprnKjkf/su0cLNXfAE+eklVKlc0MPeDVF4+EFCsMafCjxQwKf9tAKMc1Y4
X-Received: by 10.107.185.65 with SMTP id j62mr12315094iof.3.1484919495147;
	Fri, 20 Jan 2017 05:38:15 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56DD5.dip0.t-ipconnect.de.
	[87.165.109.213])
	by smtp.gmail.com with ESMTPSA id e24sm1362361itd.6.2017.01.20.05.38.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jan 2017 05:38:14 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 14:37:57 +0100
Message-Id: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v3 00/12] UEFI + Secure Boot + qemu
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
X-List-Received-Date: Fri, 20 Jan 2017 13:38:15 -0000

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

Fathi Boudra (1):
  acpica: move from meta-oe to OE-core

Patrick Ohly (10):
  ovmf: explicitly depend on nasm-native
  ovmf: deploy firmware in image directory
  ovmf_git.bb: enable parallel compilation
  ovmf_git.bb: enable Secure Boot
  runqemu: also accept -image suffix for rootfs parameter
  runqemu: fix undefined variable reference in check_arg_path()
  runqemu: support UEFI with OVMF firmware
  ovmf: build image which enrolls standard keys
  ovmf: remove BGRT patch
  acpica: work around flex 2.6.2 code generation issue

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

base-commit: a7cb408dd784178197687a2129e936620bf6a0d3
-- 
git-series 0.9.1

