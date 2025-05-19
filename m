Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397E6C3ABDD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 11:09:03 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.48704.1747652938055455179
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 04:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=KDglOTfs;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20250519110854163402b132cf617394-kbnjs_@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250519110854163402b132cf617394
        for <openembedded-core@lists.openembedded.org>;
        Mon, 19 May 2025 13:08:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=nnzpWh8FAahEzQWm1oqZGv/ahy5i/dN8DmIaYRAxRgE=;
 b=KDglOTfswOuRGMl6DVfDflyGo0sqQmvstegnC/p8MsaSZqS6Fo0q2QICi6DEL7xDsUnWmK
 WtdNs4DhTMXCpm8TiSZ1ES7r9S2kO4i4g53pzW2u66xBo1spGWxIl+obQOBM2qcUoKvJjVsh
 BNkMEY8BIBBqIXw9NMvgRhIQxrYE+Zi+4hn3ZGVGokk4i657qKY4W9DH9kMSmK6vk3RY/B6l
 zJDPTQ4YZ2zJpc9qg1EZeVrKc1nZVZf7dz2zwi4XtH9CLfovyYeVlRJiyy8g2VRfsWQkwvEH
 phYiDgDkBt4Yj7qm/F7TDPTYJCWdDTfsxbexPBfvGY8Be9HL1RTfq91Q==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 00/16] FIT image improvements
Date: Mon, 19 May 2025 13:07:44 +0200
Message-ID: <20250519110838.82978-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 11:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216836

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This patch series re-writes the FIT image related code. The goal is to
fix [YOCTO #12912] which is a long standing issue.

Changes in comparison to v3
---------------------------

* Fix ERROR: linux-yocto-6.12.27+git-r0 do_uboot_mkimage: Execution...
* Pass the kernel artifacts via the deploy directory. This makes the task
  dependencies slightly more complicated. But passing the artifacts via
  sysroot requires having some artifacts twice in the sstate-cache (once
  in sysroot and once in deploy-dir).
* Support the bundled kernel+initramfs in FIT image again. After some
  discussions, it turned out that some BSPs make use of this unusual
  combination and dropping support for it would probably lead to issues.
  Re-introducing this was also part of the motivation for passing the
  artifacts via deploy rather than via sysroot.
* Drop the patch which merged kernel-uboot.bbclass into
  kernel-uimage.bbclass. This can be done later if it seems useful.
* Drop doc patches again

Changes in comparison to v2
---------------------------

* Fix the multilib exclusion check linux-fit-image -> kernel-fit-image
  This should solve the issue with bitbake world and multilib builds

Changes in comparison to v1
---------------------------

* Exclude recipes which inherit the kernel-fit-image.bbclass from
  multilib builds. This fixes an issue discovered by the AB when
  running bitbake world with a multilib configuraton enabled.
* Remove some new tests which expected openssl from the host.
* Rebase the patches on the new bug-fix commit
  "u-boot: ensure keys are generated before assembling U-Boot FIT image"
  from Rogerio Guerra Borin <rogerio.borin@toradex.com>
  This fix required splitting the key generation into a separate recipe.
  Note: These patches depend on this commit, which is included in this
  series. As of today, the patch is already present on master-next.
* Add a cover letter with correct subject for the patch series

What gets fixed
---------------

* sstate does not work well if a FIT image contains an initramfs.
  The kernel gets re-built from scratch if the build runs from an
  empty TMPDIR:
  https://lists.openembedded.org/g/openembedded-core/message/203510.
  This is also problematic for SDK use cases since working with the
  SDK is annoying if the kernel gets re-built from scratch for no
  good reason.
* A FIT image kernel is not available as a package, but all other
  kernel image types are.
* The its-file is generated by complicated shell code with lots of
  code duplications. Switching to Python simplifies the maintenance
  (also because of the indentation with spaces and tabs in the shell
  code).
* Separating the FIT image related complexity from the kernel build
  complexity simplifies the maintenance of the kernel but also of
  the FIT image related code.
* There is already a new (but unfortunately completely unaligned)
  implementation for creating FIT images in meta-openembedded:
  https://github.com/openembedded/meta-openembedded/blob/master/meta-oe/
  classes/fitimage.bbclass. Let's hope this patch series will lay a
  solid foundation for a future merge of the two implementations.
* The new implementation in Python is also a preparation for additional
  features, such as adding different types of artifacts or generating
  the configuration nodes with greater flexibility. Currently, exactly
  one configuration per device node is supported.

Architectural change
--------------------

The existing kernel-fitimage.bbclass is designed to be added to
KERNEL_CLASSES. It appends code to the kernel's tasks and injects
additional tasks between the existing ones. Some functions rely on
running within the kernel's build folder structure.

The new implementation introduces the kernel-fit-image.bbclass,
which is intended to be inherited by an independent recipe. This
recipe takes the kernel artifacts from the sstate-cache and assembles
the FIT image entirely independently of the kernel's build tasks and
directory structure.

An example of using the new kernel-fit-image.bbclass is the
linux-yocto-fitimage.bb recipe, which builds the FIT image for the
linux-yocto kernel. The recipe looks like this:

  SUMMARY = "The Linux kernel as a FIT image (optionally with initramfs)"
  SECTION = "kernel"
  LICENSE = "GPL-2.0-with-Linux-syscall-note"
  LIC_FILES_CHKSUM = "\
    file://${COREBASE}/meta/files/common-licenses/GPL-2.0-with-Linux-syscall-note;
    md5=0bad96c422c41c3a94009dcfe1bff992"

  inherit kernel-fit-image

The configuration variables defined in the conf/image-fitimage.conf
file are handled by the kernel-fit-image.bbclass in the same way as
they are by the kernel-fitimage.bbclass. The new implementation is
99% backward compatible with the existing kernel-fitimage.bbclass.
The existing test-suite runs with minimal chagnes.

With the kernel-fitimage.bbclass, the FIT image was built as part of
the kernel itself. To ensure the new recipe is built automatically,
the following variables can be set, for example, in the machine
configuration file:

  # Do not install the kernel image package
  RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base = ""

  # Install the FIT image package into the rootfs (there is now a package :-)
  MACHINE_EXTRA_RDEPENDS += "${PREFERRED_PROVIDER_virtual/kernel}-fitimage"

  # Configure the image.bbclass to depend on the fitImage instead of only
  # the kernel to ensure the FIT image is built with the image
  KERNEL_DEPLOY_DEPEND = "${PREFERRED_PROVIDER_virtual/kernel}-fitimage:do_deploy"

Breaking changes
----------------

* Building a kernel FIT image changes.
  Before this patch series:

    A configuration like:
      KERNEL_IMAGETYPE = "fitImage"
      KERNEL_CLASSES = "kernel-fitimage"
    and building a kernel like:
      bitbake linux-yocto
    generated a FIT image including the kernel and maybe additional
    artifacts.

  With this patch series merged, the same can be achieved like this:
    bitbake linux-yocto-fitimage

  While this simple example is even simpler than before, there are
  also other examples which might look more complicated with the
  new implementation than with the old implementation.

Proposal for merging these patch series
---------------------------------------

The patches are split into small steps which allow a step-by-step
merging:

1. New tests without impact on code:

   * oe-selftest: add new ext dtb recipe
   * oe-selftest: fitimage: test coverage for ext dtb

2. Add the new implementation without changing the existing implementation

   * kernel-signing-keys-native: refactor key generation into a new recipe
   * kernel-uboot.bbclass: do not require the kernel build folder
   * kernel-uboot.bbclass: deploy the vmlinux kernel binary
   * kernel-fitimage: refactor order in its
   * kernel-fit-image.bbclass: add a new FIT image implementation
   * maintainers: add myself for linux-yocto-fitimage
   * oe-selftest: fitimage add tests for fitimage.py
   * oe-selftest: fitimage support new FIT recipe as well
   * oe-selftest: fitimage: run all tests for both FIT implementations
   * oe-selftest: fitimage refactor classes

3. Refactor the old kernel-fitimage.bbclass to Python to share code
   with the new implementation. While not strictly required, this
   allows users to migrate to the new Python code with 100% backward
   compatibility.
   Both implementations could be maintained until the new one is widely
   accepted and tested.
   Note: This change does obviousely not resolve any issues as the
   architecture remains the same. We can also simply drop this patch.

   * kernel-fitimage: re-write its code in Python

4. Remove the old kernel-fitimage.bbclass and clean up the code from
   the initramfs bundle in the FIT image left overs.

   * oe-selftest: fitimage: remove kernel-fitimage tests
   * kernel.bbclass: remove support for type fitImage
   * kernel-fitimage.bbclass: remove it

Side note: The development of the commits took place the other way round:
First the existing implementation was re-written in Python. Then the new
implementation was split out and finally the independent recipe could be
added to use the new kernel-fit-image.bbclass as well.

Adrian Freihofer (16):
  oe-selftest: add new ext dtb recipe
  oe-selftest: fitimage: test coverage for ext dtb
  kernel-signing-keys-native: refactor key generation into a new recipe
  kernel-uboot.bbclass: do not require the kernel build folder
  kernel-uboot.bbclass: deploy the vmlinux kernel binary
  kernel-fitimage: refactor order in its
  kernel-fit-image.bbclass: add a new FIT image implementation
  maintainers: add myself for linux-yocto-fitimage
  oe-selftest: fitimage add tests for fitimage.py
  oe-selftest: fitimage support new FIT recipe as well
  oe-selftest: fitimage: run all tests for both FIT implementations
  oe-selftest: fitimage refactor classes
  kernel-fitimage: re-write its code in Python
  oe-selftest: fitimage: remove kernel-fitimage tests
  kernel.bbclass: remove support for type fitImage
  kernel-fitimage.bbclass: remove it

 .../recipes-test/ext-dtb/bborg-relay-00a2.bb  |  14 +
 .../ext-dtb/files/BBORG_RELAY-00A2.dts        |  49 +
 meta/classes-recipe/kernel-fit-image.bbclass  | 184 ++++
 meta/classes-recipe/kernel-fitimage.bbclass   | 839 ------------------
 meta/classes-recipe/kernel-uboot.bbclass      |  47 +-
 meta/classes-recipe/kernel-uimage.bbclass     |   3 +-
 meta/classes-recipe/kernel.bbclass            |  20 +-
 meta/classes-recipe/uboot-sign.bbclass        |   5 +-
 meta/classes/multilib.bbclass                 |   1 +
 meta/conf/distro/include/maintainers.inc      |   1 +
 meta/lib/oe/fitimage.py                       | 463 ++++++++++
 meta/lib/oeqa/selftest/cases/fitimage.py      | 249 +++++-
 .../kernel-signing-keys-native.bb             |  75 ++
 .../linux/linux-yocto-fitimage_6.12.bb        |  13 +
 14 files changed, 1060 insertions(+), 903 deletions(-)
 create mode 100644 meta-selftest/recipes-test/ext-dtb/bborg-relay-00a2.bb
 create mode 100644 meta-selftest/recipes-test/ext-dtb/files/BBORG_RELAY-00A2.dts
 create mode 100644 meta/classes-recipe/kernel-fit-image.bbclass
 delete mode 100644 meta/classes-recipe/kernel-fitimage.bbclass
 create mode 100644 meta/lib/oe/fitimage.py
 create mode 100644 meta/recipes-kernel/kernel-signing-keys/kernel-signing-keys-native.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-fitimage_6.12.bb

-- 
2.49.0


