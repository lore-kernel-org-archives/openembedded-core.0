Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.1084.1596646599600655873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 09:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=kL6Z+9qZ;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: tyhicks@linux.microsoft.com)
Received: from sequoia.work.tihix.com (162-237-133-238.lightspeed.rcsntx.sbcglobal.net [162.237.133.238])
	by linux.microsoft.com (Postfix) with ESMTPSA id A5EBD20B490A;
	Wed,  5 Aug 2020 09:56:38 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A5EBD20B490A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1596646598;
	bh=AS9DUEI3QGh3zW4O+O0uZvKSGMNa9VQL6n9lT4vvl84=;
	h=From:To:Cc:Subject:Date:From;
	b=kL6Z+9qZpfSJNjv7fe31z+uRVYHuJjxIpODaLlKPGa7ViPKzMarzOiwf0DN3T8wo4
	 hk1loMaXEZf+5KzV8dEgpuxjxAkB7sezeHcl8FXkKcCt9qXUdTJhpGuGJAUiI+3kur
	 rGrLGKw1v06swNfjjXY/Z6fZZpxQ3Dhqtc+6eBXc=
From: tyhicks@linux.microsoft.com
To: openembedded-core@lists.openembedded.org
Cc: Paul Eggleton <paul.eggleton@linux.microsoft.com>
Subject: [PATCH] kernel-devicetree: Fix intermittent build failures caused by DTB builds
Date: Wed,  5 Aug 2020 11:56:12 -0500
Message-Id: <20200805165612.53600-1-tyhicks@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix a build-time race condition that resulted in intermittent build
failures in the do_assemble_fitimage task. The race condition involved
the do_assemble_fitimage task reading the vmlinux file while the
do_compile_kernelmodules task was re-writing the vmlinux file.

This can be seen with an aarch64 image build that uses a 5.4 based
kernel and sets KERNEL_DEVICETREE. The problem is that the do_compile
snippet that the kernel-devicetree class appends did not specify the
full kernel build environment when building the DTB(s) from the kernel
tree. This resulted in CONFIG_CC_CAN_LINK=3Dy being removed from the
kernel config file just before the do_compile task completed. The
CONFIG_CC_CAN_LINK=3Dy line was then re-inserted into the kernel config
file as part of the do_compile_kernelmodules task.

In some cases, this resulted in the do_compile_kernelmodules task to
re-link vmlinux which sometimes occured at the same time that the
do_assemble_fitimage task was attempting to use vmlinux. The
do_assemble_fitimage task would fail with the following error message:

 aarch64-poky-linux-objcopy:vmlinux: file format not recognized

We can use the pine-a64-lts machine, from the meta-pine64 layer, to show
that the kernel config file was changed between do_compile and
do_compile_kernelmodules:

 $ C=3Dtmp/work/pine_a64_lts-poky-linux/linux-pine64/5.7+gitAUTOINC+ae03b=
ade3b-r0/linux-pine_a64_lts-standard-build/.config
 $ bitbake -c do_kernel_configcheck virtual/kernel
 ...
 $ md5sum $C; grep CC_CAN_LINK $C
 32b133cf8a749a91f698a7ca8616c84f  ...
 CONFIG_CC_CAN_LINK=3Dy

 $ bitbake -c do_compile virtual/kernel
 ...
 $ md5sum $C; grep CC_CAN_LINK $C
 2fd2ec2a66eecc329dcb5afaf005eada  ...

 $ bitbake -c do_compile_kernelmodules virtual/kernel
 ...
 $ md5sum $C; grep CC_CAN_LINK $C
 32b133cf8a749a91f698a7ca8616c84f  ...
 CONFIG_CC_CAN_LINK=3Dy

With this change, the do_compile snippet appended by the
kernel-devicetree class does not modify the kernel config. The kernel
config is unchanged across the do_compile and do_compile_kernelmodules
tasks and do_compile_kernelmodules will not attempt to re-link vmlinux.

Signed-off-by: Tyler Hicks <tyhicks@linux.microsoft.com>
---
 meta/classes/kernel-devicetree.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel=
-devicetree.bbclass
index 522c46575d12..81dda8003f46 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -52,7 +52,7 @@ do_configure_append() {
 do_compile_append() {
 	for dtbf in ${KERNEL_DEVICETREE}; do
 		dtb=3D`normalize_dtb "$dtbf"`
-		oe_runmake $dtb
+		oe_runmake $dtb CC=3D"${KERNEL_CC} $cc_extra " LD=3D"${KERNEL_LD}" ${K=
ERNEL_EXTRA_ARGS}
 	done
 }
=20
--=20
2.17.1

