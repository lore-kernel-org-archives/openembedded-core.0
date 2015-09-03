Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id AB2B77701F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 18:42:13 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so55987778igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 11:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=7daHMFyinlmH4ieZbtspkdH6oiJ3pN3IbW7hs0MBtqo=;
	b=FqsunEfmAzsRaboHntZ809HLinJaLjLXQ85mbzf1ABH7OoHebA+SZbT3indA7tabiI
	xHRWxau6s+mD/xG5HIS7Z+78V0JrkWgCA28R+WmJwQJotYsh93dEt9Z5HeC2SM4YalCg
	VAWJdGDn2G1hzfNb7rHU8gtPtHq6YFVbRamDI8BBFxFIx/0DUJK4rZq/3QxhIOTLM7lf
	qOrv5GB8yTD/bjnFRJDeMGBLTLwvwdcRkiE//EFXw+/IWJluN1LzRT3Al7qHdHqx0l+n
	2y6hWvNDmlzvxuLYG6TF7z142v1XqD24JH8riFRMLQv7713WvMFgWmZYGbwgj9CVEGGt
	ZnSQ==
X-Gm-Message-State: ALoCoQni/I4pDOR7nJKV5xvh5oYGH8qHv92d1a7Vg3xszVL+ecC66yO5MtVUQNoJ5k1jRYSI37o/
X-Received: by 10.50.50.177 with SMTP id d17mr16307624igo.55.1441305733129;
	Thu, 03 Sep 2015 11:42:13 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A5686C.dip0.t-ipconnect.de.
	[87.165.104.108])
	by smtp.gmail.com with ESMTPSA id cr1sm166136igb.15.2015.09.03.11.42.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Sep 2015 11:42:12 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 20:42:27 +0200
Message-Id: <f87dd02d2553c3cc459aac628e0435b93e1d32bb.1441305437.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <2ec9c7eef58ac9972154daa2d5d2d95d64931bd3.1441305437.git.patrick.ohly@intel.com>
References: <2ec9c7eef58ac9972154daa2d5d2d95d64931bd3.1441305437.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1441305437.git.patrick.ohly@intel.com>
References: <cover.1441305437.git.patrick.ohly@intel.com>
Subject: [PATCH 2/8] initramfs-framework: create /dev/console
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
X-List-Received-Date: Thu, 03 Sep 2015 18:42:14 -0000

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
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 89b900d..6c37b9a 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -34,6 +34,11 @@ do_install() {
 
     # debug
     install -m 0755 ${WORKDIR}/debug ${D}/init.d/00-debug
+
+    # Create device nodes expected by some kernels in initramfs
+    # before even executing /init.
+    install -d ${D}/dev
+    mknod -m 622 ${D}/dev/console c 5 1
 }
 
 PACKAGES = "${PN}-base \
@@ -42,7 +47,7 @@ PACKAGES = "${PN}-base \
             initramfs-module-e2fs \
             initramfs-module-debug"
 
-FILES_${PN}-base = "/init /init.d/99-finish"
+FILES_${PN}-base = "/init /init.d/99-finish /dev"
 
 SUMMARY_initramfs-module-mdev = "initramfs support for mdev"
 RDEPENDS_initramfs-module-mdev = "${PN}-base"
-- 
2.1.4


