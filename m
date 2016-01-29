Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id ACCB56FF23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 06:40:33 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id j99so1501424lfi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 22:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dWUxQz1dPt0GTJf09ApN3oWi13dWtsNxlIDsOeYPqEM=;
	b=GZrxwwWJPnsWqsmx1KUlMs7Qhk6HQfFzBXcwP9Bq+yVjqxWh1lf6eoUzRCWZmjDYzu
	z7z82O16nBbhmPYrBbLl5abQ2CdyM5ZA3Lh9MNyvS2LdPSUsJqvJLlqI6AQNRDyM9BMJ
	5SzgghshFNd45yVElRA7jCNEy7jg4tDnagD12Hz57LIMxilWj2g065bif/dTYEaGo/E9
	PoS6GdjJIN9D0Npkt+sUrQJ/sP7wsd0Hl++t9yFBWVMPspVMap7ddedZXP7mQOmO14Db
	WtQUzlAfzCXQTR8kheoSXDI+nPwGe4QFUXts8L8toD/HtWaBdBfDz9avm+DJw7dJBGMo
	huRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dWUxQz1dPt0GTJf09ApN3oWi13dWtsNxlIDsOeYPqEM=;
	b=GDZsvYTJL0UJ5nbfr6npA7jNHA8IIynfNhYdj+2hLNrBLR9NH7nIrLx7fbHbyXagm2
	yOJVsAo0c4Ih0lKOoGhh5l/1u+pn0X8B3hX1WrLfIUH0bhJwBOzl9/EOh9vj66xBJEZf
	vSsOolbNmOCsyR1BcU4nBN78zjw0IAq8y5B/ni7ZcjMgYT+x0FypvXMRs05J/iT1SaHB
	dWEjwTOkE6LvcPfz+HJccGHBOiiVpVSYNcYmQyopjDAvY+d5T8FBBh4ZYWVXKT9trL95
	N+46W6IaZbvqbgOqldvwYILLHW/4yNTqf58SK0b44VzjoulNdNBq+qY8h9pir7uPAAFP
	hQew==
X-Gm-Message-State: AG10YORBfO1E4fn98871cFlR8eKNp9J/Cj/8pZrTzAebYRIUe2/IL2HCpGBMsZA9X5Bowg==
X-Received: by 10.25.78.66 with SMTP id c63mr2278091lfb.18.1454049632600;
	Thu, 28 Jan 2016 22:40:32 -0800 (PST)
Received: from localhost.localdomain (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231]) by smtp.gmail.com with ESMTPSA id
	mj4sm1874949lbc.19.2016.01.28.22.40.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Jan 2016 22:40:32 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jan 2016 07:40:16 +0100
Message-Id: <1454049619-22703-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <liu.ming50@gmail.com>,
	bruce.ashfield@windriver.com, darren@dvhart.com
Subject: [PATCH V3 0/3] Introduces kernel-initramfs recipe to resolve a implicit dependency issue
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
X-List-Received-Date: Fri, 29 Jan 2016 06:40:34 -0000

Changes in V3:
1 Adjusted to the tip:2a6e061712cfe9cb4738806a0c351a64e0d30144
[ cmake: update to 3.4.2 ]
2 Fixed a KERNEL_PRIORITY expanding issue
3 Tested with following configuration in local.conf:
  a) INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
     INITRAMFS_IMAGE_BUNDLE = "1"
     IMAGE_INSTALL_append = "kernel-initramfs"

  b) INITRAMFS_IMAGE = "core-image-minimal-initramfs"
     INITRAMFS_IMAGE_BUNDLE = "1"
     IMAGE_INSTALL_append = "kernel-initramfs"

  c) # INITRAMFS_IMAGE = "core-image-minimal-initramfs"
     INITRAMFS_IMAGE_BUNDLE = "1"
     IMAGE_INSTALL_append = "kernel-initramfs"

  d) # INITRAMFS_IMAGE = "core-image-minimal-initramfs"
     # INITRAMFS_IMAGE_BUNDLE = "1"
     # IMAGE_INSTALL_append = "kernel-initramfs"

Test was based on qemux86-64 machine, core-image-minimal.
With a and b, the kernel-initramfs package has been installed into rootfs correclty.
With c, got a error message like:
......
ERROR: Nothing RPROVIDES 'kernel-initramfs' (but /data/poky/meta/recipes-core/images/core-image-minimal.bb RDEPENDS on or otherwise requires it)
ERROR: kernel-initramfs was skipped: Set INITRAMFS_IMAGE and INITRAMFS_IMAGE_BUNDLE to enable it
NOTE: Runtime target 'kernel-initramfs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['kernel-initramfs']
ERROR: Required build target 'core-image-minimal' has no buildable providers.
Missing or unbuildable dependency chain was: ['core-image-minimal', 'kernel-initramfs']
......

With d, nothing changed comparing to without the patches.

-----------------------------------------------------------------------
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

 meta/classes/image.bbclass                    | 13 -----
 meta/classes/kernel.bbclass                   |  4 --
 meta/recipes-kernel/linux/kernel-initramfs.bb | 69 +++++++++++++++++++++++++++
 3 files changed, 69 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/kernel-initramfs.bb

-- 
1.9.1


