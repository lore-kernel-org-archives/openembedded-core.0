Return-Path: <ralph.siemsen@linaro.org>
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52])
	by mail.openembedded.org (Postfix) with ESMTP id E13536C0EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 01:56:04 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id a6so10158201lfl.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 18:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=1U2cREz16eQIWM67u1IoFcQo8apM3O6Y9IRXd8W9SHg=;
	b=Ja360ERKnYYBePuVyHj+h7XQq5IrAwZkvDmjhnE49uXWZGafrMbRQWcBD+povZwhfa
	PRVl3v0uJ0VMoC7COlqN2ybLd1G+Eoec5kZngpDjCDNMqVl4JCL4nnxHKD3zm6ddokCW
	haxj1RTuhbWNOJKyCoESh3tWtgvz9585NntDtFTke9V3eh26UVh01y+lKYzoPFClSRT2
	xBaqIG9el6qFDjsVGGnlm3YZqPvZw++Uz6clym8FFC27OyEMRsbLGFrU80OEdRWjMeTC
	YOYoAUoVPzuy8WT6d8txj+Om6CaC+gTnGqTzNm2LnebNed7REOW/Lt2I+9Lxl0XbxT0Y
	T+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=1U2cREz16eQIWM67u1IoFcQo8apM3O6Y9IRXd8W9SHg=;
	b=FZ2c+xg4Fq4UxEUgHGaAeC9dlmQYJSZdJi30IbBDOvEsywdPyt7fhM4VegZmHiQ6qp
	tM2ZBk1NKA+Hh44gLO/UJZHUuGpBIu4GSSV16+l/FucgZkHlpfxRTFGa7tL5tsTBohnq
	56dP68DOyCB7WfcZueMeCBP9/s7hKTwgHFd3ckl/qIfzFGnurpcpwFeYatmwSWRJux8p
	sArLuqNbdD9QBIshA051q7a70WA1fWfsKe6u3dkrK7S9J6+VLYp77IBt6FpBdsXmHFcU
	WVV5lqxbJJETSO23vib+GXCupczR1ne/cty8rmtIZIlLrB/QDRpJ4c1tvtyWNAnURzsi
	uYWA==
X-Gm-Message-State: APjAAAXXbvwsSFcNcXU39MdUy/dNeaYhHztknWv5RquGdm4gahpXw0r4
	lqN6e5S1GnztVMGMnJD6PlieKB3mLB82vv218tyEpHbYdoI=
X-Google-Smtp-Source: APXvYqyUJDVmz3Wf+ax1Ti0hDlWrNBW81Nt5eosOaLQaULvsRD7mpTQS6fNUQMH6p3/9Fm97NdF09Na9gOb4QjlWRtw=
X-Received: by 2002:a19:7503:: with SMTP id y3mr16715382lfe.83.1553651764859; 
	Tue, 26 Mar 2019 18:56:04 -0700 (PDT)
MIME-Version: 1.0
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Tue, 26 Mar 2019 21:55:53 -0400
Message-ID: <CANp-EDbYksyDzAfB9YVLyodLwUUhgQ6noJ-3q8u5J7W7vHsLFg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: kernel.bbclass: initramfs compression
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
X-List-Received-Date: Wed, 27 Mar 2019 01:56:05 -0000
Content-Type: text/plain; charset="UTF-8"

There is a "regression" of sorts when building initramfs with Yocto,
for kernel version 4.10 and later. Am looking for some suggestions on
how best to handle this.

In a nutshell, the behaviour is:
* kernel 4.9 and earlier: initramfs will be compressed, as long as at
least one decompressor algorithm is enabled in the kernel
* kernel 4.10 and later: initramfs will *not* be compressed, unless
some additional Kconfig parameters are set explicitly to select the
compression method

Phrasing it another way:
* in 4.9 and earlier, compression was done automatically based on the
configured decompression algorithm. The latter can be freely selected
in the kernel configuration.
* in 4.10 and later, compression is a Kconfig option that must be
selected explicitly. The compression option is defined conditionally,
only when an initramfs filename has been specified.

This is problematic for kernel.bbclass because it operates in two steps:
1. yocto first configures the kernel, generating a ".config" file with
all the settings. Notably the initramfs is NOT included at this step.
Thus any compression parameters are ignored by Kconfig.
2. subsequently the kernel gets built, including the initramfs, using
CONFIG_INITRAMFS_SOURCE=... on the "make zImage" command. As the
".config" has not been changed, no initramfs compression occurs.

The kernel behaviour change was introduced in linux 4.10, and
underwent a few revisions thereafter:
https://lore.kernel.org/lkml/57EAD77B.7090607@klondike.es/T/

In Yocto, this results in initramfs no longer being compressed for
kernel 4.10 and up. This has largely gone unnoticed, it seems. The
overall size of the zImage grows slightly, but not dramatically,
because another layer of compression occurs for the zImage itself
(typically with LZO rather than gzip). However, the lack of initramfs
compression is problematic for me because the zImage decompressor is
unaware of reserved memory areas (eg. for secure boot), and the
uncompressed initramfs happened to overlap such a region, causing boot
failure.

I should probably mention that in the case where initramfs file has
been specified in defconfig (eg. CONFIG_INITRAMFS_SOURCE is not
empty), then the compression option behaves like it did in kernel 4.9:
the default value is tied to the user-selected decompressor algorithm.
So kernel developers who include an initramfs in their defconfig files
do not see any regression versus 4.9 behaviour.

Some possible solutions:
- kernel side: remove the conditional dependency between initramfs
compression parameter, and initramfs filename. Then defconfig could
store the preferred compression method.
- yocto side: change sernel.bbclass to pass additional compression
parameter, alongside the existing CONFIG_INITRAMFS_SOURCE parameter.
See patch below.
- yocto side: do not decompress the initramfs at all; let it pass
through unchanged by kernel build process. This might cause problems
(double compression) for 4.9 and earlier.

I will bring this up on kernel list, however even if this got fixed in
kernel 5.2, yocto would still have this problem for kernels between
4.10 and 5.1. This range includes the 4.19 long term stable branch of
course, which many people will likely be using. So I think this will
need to be addressed in yocto through some means. I would welcome any
suggestions...

Finally, just as a proof of concept, here is a patch on the yocto
side, that forces GZIP compression. Obviously if this approach were
taken, it would need to handle all the possible compression schemes,
not just assume GZIP. But the principle would be roughly the same.

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 727851401c..0f38326d8b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -243,7 +243,7 @@ do_bundle_initramfs () {
                                tmp_path=$tmp_path" "$type"##"
                        fi
                done
-
use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
+
use_alternate_initrd="CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
CONFIG_INITRAMFS_COMPRESSION=.gz CONFIG_INITRAMFS_COMPRESSION_GZIP=y"
                kernel_do_compile
                # Restoring kernel image
                for tp in $tmp_path ; do
@@ -310,7 +310,7 @@ kernel_do_compile() {
                # The old style way of copying an prebuilt image and building it
                # is turned on via INTIRAMFS_TASK != ""
                copy_initramfs
-
use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
+
use_alternate_initrd="CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
CONFIG_INITRAMFS_COMPRESSION=.gz CONFIG_INITRAMFS_COMPRESSION_GZIP=y"
        fi
        cc_extra=$(get_cc_option)
        for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
-- 
2.17.1

