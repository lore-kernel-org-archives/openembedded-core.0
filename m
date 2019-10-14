Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2C5986D545
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 21:50:23 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id u16so272024lfq.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 14:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=EhztFM7yDOH6ukRF3os/nG0QYEteE64A0hr6PM97VTk=;
	b=On9DGUloW79m3mJ4mtq50Fg5IwTcklpHOERM9N9wND+Qm1FIKofdevKtao1XRo4Ix5
	bwuue+6HB2S+1VFSM6MPWDhGdnHhZbPqK5+rSWGi0YKUqVHEQyiRF7TOllq6YXrMEL9b
	SbIr/eq/BohLa6bDU++k7Hj/cS71IeRPuNhIAzfc7jUivQ0SvZlUlI5lrnREm95z7kBg
	Z0u2v9GVMQW0rcTUvP89k8hV8uA8Rxyu5+vYOiq3MIENfgzUjTRBVqyeNjvZV08z2ikw
	wQGMqlC7PXrge3gPUtBfRVpGxarMv41CT2NQLlVrEBn4reJ0iIgB6d5luEZc3R/VeiBT
	bBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EhztFM7yDOH6ukRF3os/nG0QYEteE64A0hr6PM97VTk=;
	b=DIYmQ5JlF9FqLozO09vuDsRXjr8vqAcoD2vNzkobzRzbtLoxfFx+CC7p+ShDBR7vTu
	ess3dyNmoeA7W5+vzNJfoEW+95yLoltIHFJmIjov+TpENXGzu6cUnOduLNjeOpQNOaHO
	cwOx8d8ujfORO7+TkHDDEOuyM/fJA7oUg8141EBo+qFFs3y3hWTo4fi1Julpz87CnHf3
	SNSbj1qMdWUtcm5EXiJMLxBPT7njSU0Wz950cPCpkNcfPAMJeh6ljCXAnqwSd+BffEYA
	oM/8GdqNAK+nQ5qj/bjIjVsLo6edaTkVtZZEj98CLotr8lMkPI9P45WR/8jxcRtYNdVw
	b68g==
X-Gm-Message-State: APjAAAUn92M6GUkPqspZKJSF6pc2eU8PjxmRgMZC/BKvxTKHoJSBFO8J
	DWLrmg3nCgODSySUC/slJaFXnr++IEo=
X-Google-Smtp-Source: APXvYqxCldrwY/HKLMy07BbSUDal1/PXZisuyU+pAVQfGPFesxRmTJ6c6n4YQKP2ZXqAFoCZ5gyw5A==
X-Received: by 2002:a19:5504:: with SMTP id n4mr450416lfe.106.1571089824120;
	Mon, 14 Oct 2019 14:50:24 -0700 (PDT)
Received: from localhost.localdomain ([188.162.65.242])
	by smtp.gmail.com with ESMTPSA id c3sm4418076lfi.32.2019.10.14.14.50.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Oct 2019 14:50:23 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2019 00:50:12 +0300
Message-Id: <20191014215014.9656-3-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014215014.9656-1-dbaryshkov@gmail.com>
References: <20191014215014.9656-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v3 3/5] grub-efi: replace anonymous function with static configuration
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
X-List-Received-Date: Mon, 14 Oct 2019 21:50:24 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Replace anonymous function setting GRUB_* variables with static
configuration, since grub-efi.bbclass will use fixed names for grub
bootloader.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/recipes-bsp/grub/grub-efi_2.04.bb | 40 ++++++++++----------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb b/meta/recipes-bsp/grub/grub-efi_2.04.bb
index b9d6225d2774..29a9a0fe771b 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.04.bb
@@ -13,27 +13,13 @@ SRC_URI += " \
 
 S = "${WORKDIR}/grub-${PV}"
 
-# Determine the target arch for the grub modules
-python __anonymous () {
-    import re
-    target = d.getVar('TARGET_ARCH')
-    prefix = "" if d.getVar('EFI_PROVIDER') == "grub-efi" else "grub-efi-"
-    if target == "x86_64":
-        grubtarget = 'x86_64'
-    elif re.match('i.86', target):
-        grubtarget = 'i386'
-    elif re.match('aarch64', target):
-        grubtarget = 'arm64'
-    elif re.match('arm', target):
-        grubtarget = 'arm'
-    else:
-        raise bb.parse.SkipRecipe("grub-efi is incompatible with target %s" % target)
-    grubimage = prefix + d.getVar("EFI_BOOT_IMAGE")
-    d.setVar("GRUB_TARGET", grubtarget)
-    d.setVar("GRUB_IMAGE", grubimage)
-    prefix = "grub-efi-" if prefix == "" else ""
-    d.setVar("GRUB_IMAGE_PREFIX", prefix)
-}
+GRUB_TARGET = "UNSUPPORTED"
+GRUB_TARGET_x86-64 = "x86_64"
+GRUB_TARGET_x86 = "i386"
+GRUB_TARGET_aarch64 = "arm64"
+GRUB_TARGET_arm = "arm"
+
+GRUB_IMAGE = "grub-efi-${EFI_BOOT_IMAGE}"
 
 inherit deploy
 
@@ -45,7 +31,7 @@ do_mkimage() {
 	# Search for the grub.cfg on the local boot media by using the
 	# built in cfg file provided via this recipe
 	grub-mkimage -c ../cfg -p ${EFIDIR} -d ./grub-core/ \
-	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} \
+	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
 	               ${GRUB_BUILDIN}
 }
 
@@ -57,7 +43,11 @@ do_mkimage_class-native() {
 
 do_install_append_class-target() {
 	install -d ${D}${EFI_FILES_PATH}
-	install -m 644 ${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} ${D}${EFI_FILES_PATH}/${GRUB_IMAGE}
+	if [ "${EFI_PROVIDER}" = "${BPN}" ] ; then
+		install -m 644 ${B}/${GRUB_IMAGE} ${D}${EFI_FILES_PATH}/${EFI_BOOT_IMAGE}
+	else
+		install -m 644 ${B}/${GRUB_IMAGE} ${D}${EFI_FILES_PATH}/${GRUB_IMAGE}
+	fi
 }
 
 do_install_class-native() {
@@ -86,7 +76,7 @@ GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal \
                  efi_gop iso9660 configfile search loadenv test"
 
 do_deploy() {
-	install -m 644 ${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} ${DEPLOYDIR}
+	install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
 }
 
 do_deploy_class-native() {
@@ -97,7 +87,7 @@ addtask deploy after do_install before do_build
 
 FILES_${PN} = "${libdir}/grub/${GRUB_TARGET}-efi \
                ${datadir}/grub \
-               ${EFI_FILES_PATH}/${GRUB_IMAGE} \
+               ${EFI_FILES_PATH} \
                "
 
 FILES_${PN}_remove_aarch64 = "${libdir}/grub/${GRUB_TARGET}-efi"
-- 
2.23.0


