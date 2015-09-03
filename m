Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id DB5B07701F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 18:42:14 +0000 (UTC)
Received: by ioii196 with SMTP id i196so68656526ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 11:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=fb7/+0ePv0yhXBrwflOjkLIUDgEuvo2q2/87l0qSfjQ=;
	b=Ctaqa/+vWKh0GjKRRDdBcCiBCWAhDhLhJv26hevWwvfTK2GvICVGb3JKirTe1W54S7
	8W/x9Un1Rzcm0kNiwH57cTEkJw6+JSdUl2hg3jRYiA2zv6RwVoiK5dEXe7N9UGVIN0fC
	qm+nRYgxJ7B0wNgxl0Dj9Kdks2LPLfVl3CKNdLup9b2oriD4R3IKsrTSY79fc8OI0FUA
	RQim0dkW15M6Be9oen1/di6YFnxCr2yADIFMXOvKnft3IEmFvgnPhNdruUvq6c/6vQ/E
	KVO3BhhwtPjBmwoSR6glSv0iCC8J1OHQCpOnhhK6jgsXrTmJzQuEucVsIvLdlmTUnx5a
	tToA==
X-Gm-Message-State: ALoCoQm7/RdtUJtGuw4xlZFKfaPVo+hjGF6KLsYjGwj2HgY0SlDcx2CJQgJqfs7gLwGUN9nupIEk
X-Received: by 10.107.129.205 with SMTP id l74mr899744ioi.181.1441305735133;
	Thu, 03 Sep 2015 11:42:15 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A5686C.dip0.t-ipconnect.de.
	[87.165.104.108])
	by smtp.gmail.com with ESMTPSA id cr1sm166136igb.15.2015.09.03.11.42.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Sep 2015 11:42:14 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 20:42:28 +0200
Message-Id: <83484c727a293a698ccdd1e3bbf0f28db7ed9d3a.1441305437.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <2ec9c7eef58ac9972154daa2d5d2d95d64931bd3.1441305437.git.patrick.ohly@intel.com>
References: <2ec9c7eef58ac9972154daa2d5d2d95d64931bd3.1441305437.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1441305437.git.patrick.ohly@intel.com>
References: <cover.1441305437.git.patrick.ohly@intel.com>
Subject: [PATCH 3/8] initramfs-live-boot: create /dev/console
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
X-List-Received-Date: Thu, 03 Sep 2015 18:42:15 -0000

Some kernels, for example linux-yocto 3.19 for qemux86, fail to
execute /init in an initramfs unless there is already a /dev/console
char device in the initramfs. Booting then fails with:
    Kernel panic - not syncing: /dev/console is missing or not a character device!
    Please ensure your rootfs is properly configured

The panic itself comes from a linux-yocto specific patch to
kernel_init_freeable in init/main.c, but even without it, that
function will print an error when /dev/console is missing. The
kernel's Documentation/initrd.txt also mentions creating that device.

It remained unclear why this is not a problem on other machines. On
intel-corei7-64 from meta-intel, something (the kernel?) creates
/dev/console and /dev/[012] before transfering control to the init
script. In that case, creating /dev/console in advance is not
necessary, but does not cause any problem either.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
index b54cb61..57b3025 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
@@ -11,9 +11,11 @@ S = "${WORKDIR}"
 
 do_install() {
         install -m 0755 ${WORKDIR}/init-live.sh ${D}/init
+        install -d ${D}/dev
+        mknod -m 622 ${D}/dev/console c 5 1
 }
 
-FILES_${PN} += " /init "
+FILES_${PN} += " /init /dev "
 
 # Due to kernel dependency
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.1.4


