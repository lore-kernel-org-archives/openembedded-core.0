Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 326116071F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 13:11:28 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id 15so22254008iom.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 05:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=hFuWvHJcjTlr3GL8WlbrWrS7lguRQPtfHuqgGU2eiUY=;
	b=jZ3SiaZCPg/3ls5NCnFddUEkBbRpuOU/nAKuNzhpzx+EN0EUWx/ClGek+/HExQnFyj
	0J3HOi9NuJhMLFOABovE1w7DwbS8EjbidIpKqpzTxu8tx6GVtZtsy44xtCYZMFeypWiv
	4vyneUJONmWjSYwzvxokh3RTuFi2OvPJlnfbSrI4YF5OOzks18hy3hbUXfgvxQ8Q5WU/
	Y7Q+I5N6I1Tb5yQJV3iJmQIvMiNcw7ZvET724iarPPiXIFtfWMK/u0vaXlx0nKCPaU8i
	RkFGO5gqhUDE9QdUIcigw2JnJfPkCRjr2wDtpjwqpR4MkrDfunM6nrbXLjJzpTPC3IZF
	g//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hFuWvHJcjTlr3GL8WlbrWrS7lguRQPtfHuqgGU2eiUY=;
	b=Y3vty1NlUO5iLrD6c9oiR5IW5eGOe3xEwY70zIoUkEMrzXoODyQhE1XXU2/MT1MzVy
	vMG2rf6c1G74xeX3BIRQIff2xPiBzm2sgGg83Dvkf3f7C+24bWBPp3j8XP8YS+URcfgJ
	d7QqpX51AJpBFyggvLjX0bZ6AQ10WhFORQScSLBq2FoRlPGQtuKyvwg3xAuJgcF/jqR9
	U9pfeSr6102hJrgSRKlqNaYI+1DgN84VKbAu9YTTUNBCb3VKOh1Q4dD62OQ7fwl+Yqhb
	Q4E3uoMRT/HzkwMvfZ5tnBop9Yje5LOJ7eErXVRolS/2U/RSusZQ718OKaw9JnLELTLE
	PgSg==
X-Gm-Message-State: AIkVDXIk9cdehwlEj+YGqZs4GkXr9ACdDS8F8+ptErn50W4cYsV9Tf7UfF6PeDJva2zgAXiM
X-Received: by 10.107.168.168 with SMTP id e40mr993242ioj.40.1482325889919;
	Wed, 21 Dec 2016 05:11:29 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8F3CB.dip0.t-ipconnect.de.
	[93.232.243.203])
	by smtp.gmail.com with ESMTPSA id 81sm10730988itj.6.2016.12.21.05.11.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Dec 2016 05:11:28 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org,
	ricardo.neri@intel.com
Date: Wed, 21 Dec 2016 14:11:24 +0100
Message-Id: <cover.1482324587.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/9] UEFI + Secure Boot + qemu
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
X-List-Received-Date: Wed, 21 Dec 2016 13:11:30 -0000

There seems to be a consensus that supporting UEFI in OE-core for qemu
would be valuable, and there have been some (stalled) attempts to add
it. For reference, see:
   [OE-core] [PATCH V3 0/3] Add UEFI firmware for qemux86*
   [OE-core] Add ovmf-native to make qemu-native/runqemu support boot UEFI image?
   https://bugzilla.yoctoproject.org/show_bug.cgi?id=5654
   https://github.com/01org/luv-yocto/issues/38

This patch set includes the necessary recipes (ovmf and iasl from
meta-luv), some improvements to them (in particular, enabling Secure
Boot), and changes to runqemu to make it easier to boot with UEFI. A
special image recipes builds an image which can be used to lock down a
virtual machine by enrolling the "normal" pre-installed certificates.

I decided to keep the setup simple and use just a single file for UEFI
code and variables because that makes the usage via runqemu very
easy. See the "runqemu: support UEFI with OVMF firmware" patch for
details. The downside is that the firmware can't be updated without
loosing variables. I don't see a big need for long-lived virtual
machine instances, but would like to hear from others about that.

What's missing is automated testing of this new feature. I'm open for
suggestions here; right now I don't know enough about the automated
testing in the AB to propose something.

I've discussed the usage of ovmf/iasl with Ricardo and he agreed that
moving ovmf and iasl from meta-luv to OE-core makes sense. Ricardo,
would you be willing to act as maintainer of it there, like you did in
meta-luv?

Beware that "git am --keep-cr" must be used to import the ovmf patches
correctly.

The following changes since commit 5e21afc9395060b489156d3f90505a372b713f37:

  Revert "selftest/wic: extending test coverage for WIC script options" (2016-12-20 17:06:01 +0000)

are available in the git repository at:

  git://github.com/pohly/openembedded-core secure-boot
  https://github.com/pohly/openembedded-core/tree/secure-boot

Patrick Ohly (7):
  ovmf: explicitly depend on nasm-native
  ovmf: deploy firmware in image directory
  ovmf_git.bb: enable parallel compilation
  ovmf_git.bb: enable Secure Boot
  runqemu: let command line parameters override defaults
  runqemu: support UEFI with OVMF firmware
  ovmf: build image which enrolls standard keys

meta-luv (2):
  ovmf: move from meta-luv to OE-core
  iasl: move from meta-luv to OE-core

 meta/recipes-core/ovmf/ovmf-shell-image.bb         |   22 +
 ...s-Force-tools-variables-to-host-toolchain.patch |   48 +
 .../ovmf/0001-OvmfPkg-Enable-BGRT-in-OVMF.patch    |  110 ++
 ...0002-ovmf-update-path-to-native-BaseTools.patch |   32 +
 ...makefile-adjust-to-build-in-under-bitbake.patch |   39 +
 ...ollDefaultKeys-application-for-enrolling-.patch | 1123 ++++++++++++++++++++
 meta/recipes-core/ovmf/ovmf/ovmf-shell-image.wks   |    4 +
 meta/recipes-core/ovmf/ovmf_git.bb                 |  178 ++++
 meta/recipes-extended/iasl/iasl_20120215.bb        |   27 +
 meta/recipes-extended/iasl/iasl_20150410.bb        |   27 +
 meta/recipes-extended/iasl/iasl_20150515.bb        |   27 +
 scripts/runqemu                                    |   37 +-
 12 files changed, 1673 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/ovmf/ovmf-shell-image.bb
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-OvmfPkg-Enable-BGRT-in-OVMF.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0002-ovmf-update-path-to-native-BaseTools.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0007-OvmfPkg-EnrollDefaultKeys-application-for-enrolling-.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/ovmf-shell-image.wks
 create mode 100644 meta/recipes-core/ovmf/ovmf_git.bb
 create mode 100644 meta/recipes-extended/iasl/iasl_20120215.bb
 create mode 100644 meta/recipes-extended/iasl/iasl_20150410.bb
 create mode 100644 meta/recipes-extended/iasl/iasl_20150515.bb

-- 
2.1.4


