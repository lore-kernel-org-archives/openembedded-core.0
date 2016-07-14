Return-Path: <andre.draszik@gmail.com>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6BC3A73169
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 14:06:03 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id l69so8015649lfg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 07:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:mime-version
	:content-transfer-encoding;
	bh=ZmN9bZpTjcuR/t0Oon4jNK4VV4kgcY+QuOGa5/A4ItU=;
	b=mlEx5dUpukn9geIJJWjEmpa4fNVa20sTps/bUz7k/pP8aDvSb+uiF2/efZJ90J5M5n
	umV2w9MOzIddS6qbav4LEBNZkJg/lVP35IiCguOUfqZSMxD9vVSA276U9PN0eJLD5r4k
	rnCb869A6loSoohdRYxpP5QLZHqj8jGp2GHwpsEZkpULwLAxEdlqV7mVUkB3+q5AovZr
	X7KMFtAgZtKaJxQwTycjd+ytokQGgNxz6DWsAo4/tamFb/oh57J4TjCWDHBILq9T++N0
	yUJFx8oCyVCemSpdmsVg3hyLc5yQlsMD93DA8133Q+DwbUVOzm5LKdBnaPI7I/MYmE2S
	f9eg==
X-Gm-Message-State: ALyK8tIJW2Xn3maARsYFfJSnok54Dp3LD5/9HQ49maRFO0DGvWsCCXBodvHBrsq3Eh5KAw==
X-Received: by 10.25.156.77 with SMTP id f74mr2627191lfe.51.1468505162758;
	Thu, 14 Jul 2016 07:06:02 -0700 (PDT)
Received: from localhost ([185.46.212.59])
	by smtp.gmail.com with ESMTPSA id 88sm770464lfr.23.2016.07.14.07.06.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Jul 2016 07:06:01 -0700 (PDT)
Message-ID: <1468505159.17743.31.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 15:05:59 +0100
X-Mailer: Evolution 3.20.3-1 
Mime-Version: 1.0
Subject: extensible SDK doesn't install when initramfs is bundled with kernel?
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
X-List-Received-Date: Thu, 14 Jul 2016 14:06:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

It looks like I can't install the extensible SDK if my initramfs is bundled
with the kernel.

I am building two images - my-image & my-image-initramfs (which are mostly
identical at the moment). I have also set
INITRAMFS_IMAGE = "my-image-initramfs"
INITRAMFS_IMAGE_BUNDLE = "1"

So far so good and things work as expected, I can build image +
kernel/initramfs fine.


Installation of the extensible SDK generated using
bitbake -c populate_sdk_ext my-image or
bitbake -c populate_sdk_ext my-image-initramfs
fails though:

---snip---
Parsing recipes...done.
Parsing of 1804 .bb files complete (0 cached, 1804 parsed). 2362 targets, 384 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
Initialising tasks...Initialising tasks...WARNING: The linux-ramips:do_bundle_initramfs sig is computed to be e434881eda830ba400719204a1e49b8d, but the sig is locked to 2b272ac304fd389f7a0745bbe3d4efe8 in SIGGEN_LOCKEDSIGS_t-tgm-r1a
done.
NOTE: Executing SetScene Tasks
NOTE: Running setscene task 7 of 516 (/space/rel-test/poky-rootfs_sdk/layers/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_qa_setscene)
NOTE: Running setscene task 8 of 516 /space/rel-test/poky-rootfs_sdk/layers/poky/meta/recipes-core/util-linux/util-linux_2.28.bb:do_package_qa_setscene)
[...]
NOTE: Running setscene task 516 of 516 /space/rel-test/poky-rootfs_sdk/layers/poky/meta/recipes-devtools/quilt/quilt-native_0.64.bb:do_populate_sysroot_setscene)
NOTE: recipe quilt-native-0.64-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe quilt-native-0.64-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Executing RunQueue Tasks
ERROR: Task linux-ramips.do_fetch attempted to execute unexpectedly
ERROR: Task linux-ramips.do_unpack attempted to execute unexpectedly
ERROR: Task linux-ramips.do_kernel_checkout attempted to execute unexpectedly
ERROR: Task linux-ramips.do_validate_branches attempted to execute unexpectedly
ERROR: Task linux-ramips.do_kernel_metadata attempted to execute unexpectedly
ERROR: Task linux-ramips.do_patch attempted to execute unexpectedly
ERROR: Task linux-ramips.do_kernel_configme attempted to execute unexpectedly
ERROR: Task linux-ramips.do_configure attempted to execute unexpectedly
ERROR: Task linux-ramips.do_kernel_configcheck attempted to execute unexpectedly
ERROR: Task linux-ramips.do_compile attempted to execute unexpectedly
ERROR: Task linux-ramips.do_kernel_link_images attempted to execute unexpectedly
ERROR: Task linux-ramips.do_compile_kernelmodules attempted to execute unexpectedly
ERROR: Task linux-ramips.do_strip attempted to execute unexpectedly
ERROR: Task linux-ramips.do_sizecheck attempted to execute unexpectedly
ERROR: Task linux-ramips.do_uboot_mkimage attempted to execute unexpectedly
ERROR: Task linux-ramips.do_install attempted to execute unexpectedly
ERROR: Task linux-ramips.do_populate_sysroot attempted to execute unexpectedly and should have been setscened
ERROR: Task linux-ramips.do_bundle_initramfs attempted to execute unexpectedly
NOTE: Tasks Summary: Attempted 1541 tasks of which 1541 didn't need to be rerun and all succeeded.

Summary: There were 2 WARNING messages shown.
Summary: There were 18 ERROR messages shown, returning a non-zero exit code.
---snap---


Installation works fine though once I comment out INITRAMFS_IMAGE.

Any pointers for to how to resolve this while keeping kernel and initramfs
bundled would be greatly appreciated!


Cheers,
Andre'


