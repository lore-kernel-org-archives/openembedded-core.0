Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id B0E3C78688
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 20:06:59 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id k61so9210735wrc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 12:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=plMJEqQ0VTRVtD++FucN309zHWy3sLWReTgYfsnl48M=;
	b=rlAiu95KLe6E1E/9UpbvOWmImgJd2+Y6N+a7/AfbQafP+dYqwkqGvwDu+QCTl4ryTb
	jKj3O1S5xJVJ9WA1aj050k9DmAhNb2v9WyiX7CyG6/I8qipS3HPCqPryjyIKMa9rlPtG
	mDivAOLobKWtK1nn7cYCw2YEyV7C+BSxO5YS/nstv9VLxsgciYFljg40LFrdY0CA/mvW
	8owH+QbXtnfzk8wr5l7HYv/mMBs7+NWAmxz6wB5CtowB4WR5hfj8JGXQwJ3SMuS6j6Wo
	Ndpt6ByXQYt7IZLx6isgc2WXEeSdJBCQiMa1b03N0XUhQdX1aZFsYgEHv4w7KU2N3AOF
	rjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=plMJEqQ0VTRVtD++FucN309zHWy3sLWReTgYfsnl48M=;
	b=FhApsBrPVqgRmVXPa59CpJnQvWlkwbjd+CA7TgDYm1S7CXbjjpI/4W1geHXSkgFkHE
	hTBzIJqNIHmygAO+SHpu9DifsBdcfA0zhU/6j4vEuWBNOoeg4/9xdeCFL0Mq9jXnhdSn
	HaHhSPeosiZMJIRKQnEx/Tw2FvGvYVL4AFOeuU3x/OFhoRKdzhZ/Mx3IPGOhMXfiJcMi
	ffYb+ZshBvViwxYBNwg3HlGvtYu3KcJATpVu4LJaWA1YsEDzygz9+tst7gQJURWkR/Ad
	SMRWwXwrGZnsKs99SCTptEgVeaf7z4eC9Wkd665d0EIXcZYz+IZ6mxBapJdmen2OjD62
	gqkg==
X-Gm-Message-State: AJaThX66lFSfxu5slUUvtokpQsPACJnIjIUe8v+Uy6gQCl3SkWIeNWOJ
	7ippUjRz8tzOEprLOKvX1NNGiw==
X-Google-Smtp-Source: AGs4zMb/ygbg43gxuQZwaKbwDLWZbrKRxeaPTUz5qa0w5yh8FNvlgEeoqK1fI7Bx+5RIDUZkDc4OMQ==
X-Received: by 10.223.202.1 with SMTP id o1mr13021228wrh.233.1511208420162;
	Mon, 20 Nov 2017 12:07:00 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id g7sm9206019wra.38.2017.11.20.12.06.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Nov 2017 12:06:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Nov 2017 20:11:00 +0000
Message-Id: <cover.1511207344.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [RFC][PATCH 0/5] Kernel artifacts naming changes
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
X-List-Received-Date: Mon, 20 Nov 2017 20:07:00 -0000

This is only RFC, because it wasn't tested in all possible combinations
people might use.

I did some limited testing with raspberrypi3 and raspberrypi3-64 with
default configuration and also our modified naming where rpi builds
were failing and we had to use our own sdcard_image-rpi.bbclass to
work around it.

Basically all our build artifacts from jenkins jobs contain values like
product version, type of build, build number (or just release name for
"release" jobs).

For that we modify variables like:
IMAGE_NAME, IMAGE_LINK_NAME, INITRAMFS_IMAGE_NAME, KERNEL_IMAGE_BASE_NAME,
KERNEL_IMAGE_SYMLINK_NAME, MODULE_IMAGE_BASE_NAME, MODULE_IMAGE_SYMLINK_NAME
and it works OK, but only until some other bbclasses are assuming that
these variables are still using default value (e.g. -${MACHINE} in
KERNEL_IMAGE_SYMLINK_NAME.

Things are actually a bit worse, we want to use the same version suffix
across all artifacts, even when some of them were actually reused from sstate
- e.g. if build number 6 reuses kernel.do_deploy sstate archive created in
build number 5, then kernel artifacts would be named with -5 and image with -6.

So we cannot use vardepsexclude for the build number (like the default
values do for DATETIME). But that would require reexecuting actual kernel
do_deploy task every single build (and as it depends on tasks like kernel.do_install
it's not just relativey fast do_deploy, but whole kernel build).

Instead we changed the variables to create the artifacts without any version
in sstate covered tasks (so kernel.do_deploy produces just files without any
version (like default KERNEL_IMAGE_SYMLINK_NAME) and then we execute separate
very fast do_kernel_fixup task, which adds versioned _hard_ link (instead of
symlink, so that we can update or remove the file without version and the
versioned file is still usable).

And that's still not enough, few found that some tools which we use in do_rootfs
sometimes modify instead of overwrite the file in deploy (so that the file
with versioned name was modified during the next build through the file without
the version).

And as a last step we also had to update many task dependencies, where the task
was depending on do_deploy and we actually needed the task to depend on
do_deploy_fixup.

This RFC doesn't implement it all, but it makes naming all the artifacts in
consistent way a bit easier. If there is an agreement that OE should support
the naming scenario described above, I'll submit the rest of the changes.

Regards,

The following changes since commit a17f3ec910366e9e7551fa24fbc07929b9584341:

  dhcp: fix build issue with libxml2 support (2017-11-10 14:44:31 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/kernel
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=jansa/kernel

Martin Jansa (5):
  kernel-devicetree.bbclass: Use lowercase names for shell variables
  kernel-devicetree.bbclass: Fix and simplify instalation of DTB files
  kernel-devicetree.bbclass: build DTBs with make dtbs
  kernel.bbclass: use the consistent naming schema for initramfs
  kernel.bbclass: move variables for kernel artifacts names to separate
    bbclass

 meta/classes/kernel-artifact-names.bbclass | 19 +++++++
 meta/classes/kernel-devicetree.bbclass     | 89 ++++++++++++------------------
 meta/classes/kernel.bbclass                | 26 ++-------
 3 files changed, 60 insertions(+), 74 deletions(-)
 create mode 100644 meta/classes/kernel-artifact-names.bbclass

-- 
2.7.4


