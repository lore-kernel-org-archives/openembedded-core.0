Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 96D9B605FE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 13:13:10 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id c192so117452770lfe.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 05:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cL5Iaa05HwrgGnoQtNJpforUtbOzd2WLOqWM9NIY6k8=;
	b=byxkIw7q9bO8AeT0sfIq/iOsRqdvPLWHLB5bAldo9UyEG+MQuGNRFimKAlSHE+QSIW
	xWhStAijDu+jOaE4sA2t+HXQoebl34wO1H3h9/cIx3coHN2AQ8Uy+vRYucDY0DMV0ItH
	6yarufEO991rRaBnYIcPwzjukMW/duCoExADnI7lUpG4kiQ5DFJy7srXV41sPFK1KDSN
	0caOL2TVyhvrFFwi4WPRtiTz5+RJ8yfT056t03rZyfvJed7DiC87VgR0Cf+wyqoHnW4b
	MwhK/6lATKJYCDfNhwUn0IYEhVrUYSsLiunfOoRzNUSjfs8HJMobcVApr9fr692EsJfk
	TZtg==
X-Received: by 10.25.4.214 with SMTP id 205mr22346312lfe.90.1451999590095;
	Tue, 05 Jan 2016 05:13:10 -0800 (PST)
Received: from localhost.localdomain (m77-218-242-32.cust.tele2.se.
	[77.218.242.32]) by smtp.gmail.com with ESMTPSA id
	a124sm9615341lfa.40.2016.01.05.05.13.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Jan 2016 05:13:09 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jan 2016 14:12:42 +0100
Message-Id: <1451999565-3502-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: bruce.ashfield@windriver.com, yue.tao@windriver.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH 0/3] Introduces kernel-initramfs recipe to resolve a implicit dependency issue
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
X-List-Received-Date: Tue, 05 Jan 2016 13:13:11 -0000

In current initramfs bundled kernel packaging policy, there are several
dependency chains co-existing:

| "core-image-minimal.do_build" -> "core-image-minimal.do_bundle_initramfs"
| "core-image-minimal.do_bundle_initramfs" -> "virtual/kernel.do_bundle_initramfs"
| "core-image-minimal.do_bundle_initramfs" -> "core-image-minimal.do_rootfs"
| "core-image-minimal.do_rootfs" -> "virtual/kernel.do_package_write_${IMAGE_PKGTYPE}"
| "virtual/kernel.do_package_write_${IMAGE_PKGTYPE}" -> "virtual/kernel.do_package"
| "virtual/kernel.do_package" -> "virtual/kernel.do_install"
|
| "virtual/kernel.do_deploy" -> "virtual/kernel.do_bundle_initramfs"
| "virtual/kernel.do_bundle_initramfs" -> "virtual/kernel.do_install"

We could see, virtual/kernel.do_package is not explicitly depending on
virtual/kernel.do_bundle_initramfs so far, therefore, there is not a
workable way to add initramfs bundled kernel image into rootfs, because
kernel's do_bundle_initramfs could run parallelly with its do_package,
which means we will get a implicit kernel-image package that sometimes it
contains the initramfs bundled kernel or sometimes it doesn't.

To fix this problem, the idea is to let the initramfs bundled kernel
packaging depend on do_bundle_initramfs, meanwhile, to avoid the circular
dependency issue that commit: 609d5a9ab9e58bb1c2bcc2145399fbc8b701b85a
[ kernel.bbclass, image.bbclass: Implement kernel INITRAMFS dependency and bundling ]

was trying to address, this dependency has to be splitted from kernel
recipe(at least, I could not figure out another way to achieve it), so a
new kernel-initramfs is introduced, in which a dependency chain is created:

| "kernel-initramfs.do_install" -> "virtual/kernel.do_deploy"
| "virtual/kernel.do_deploy" -> "virtual/kernel.do_bundle_initramfs"

Then the users can add initramfs bundled kernel image into rootfs by:

IMAGE_INSTALL_append = " kernel-initramfs"

without introducing any circular dependencies.

Ming Liu (3):
  kernel.bbclass: do not install initramfs bundled kernel image
  image.bbclass: removes bundle_initramfs related code
  kernel-initramfs: new recipe, creates initramfs bundled kernel
    packaging

 meta/classes/image.bbclass                    | 11 -----
 meta/classes/kernel.bbclass                   |  4 --
 meta/recipes-kernel/linux/kernel-initramfs.bb | 69 +++++++++++++++++++++++++++
 3 files changed, 69 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/kernel-initramfs.bb

-- 
1.9.1


