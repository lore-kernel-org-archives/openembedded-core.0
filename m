Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 873EF606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 08:26:53 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o80so5300767wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 01:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EqnxwsHhe35TpfvPzLi8RN5/v8OCfVC/BzZOrRx8jzE=;
	b=e7h6XM2+LWT8sfthMh9wpBcOGlSeRS4pjqzX2OCyGv/ZKC9NH6LXRNF7cqZF1Gt1MV
	NNgzkByqioUo5NERuJYpGNcjaOGQF73Fg9lY2YHby3/XMEjfm8d+Ty1zqUTh34vXJoGU
	Q7262PqIIp7ymLMcOG2Nqpmhu61yZ4V+V/mkJ+pGswqmr5sAkB2MCjSTUih10ioyMe9z
	tc2i/VWFnMh/olmOEGBerWuo16nend5eiPNkzewGTPoDJlJtmNdip5vA13L6TPvgdj6d
	MdUmq/MJDR1pXBRCsy9DD8fi5WAt97ArA8yzX0BBkPCKzwgesEiNGEJyp+KGBiQK9GIZ
	qrzQ==
X-Gm-Message-State: AEkoout9YGciCtZZYTv+YZ425DV1Fk4KJ3EPa5zIKSZQ6SUcHhmAx9cnHY6HjwcGsG/YPA==
X-Received: by 10.194.120.129 with SMTP id lc1mr26123784wjb.131.1469608013408; 
	Wed, 27 Jul 2016 01:26:53 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id f3sm5147246wjh.2.2016.07.27.01.26.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jul 2016 01:26:52 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 09:26:51 +0100
Message-Id: <1469608011-16915-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] qemu / tune-corei7: move QEMU_EXTRAOPTIONS into qemu.bbclass
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
X-List-Received-Date: Wed, 27 Jul 2016 08:26:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Let's put them into all into one place, PPC defintions are
done inside the class already.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/classes/qemu.bbclass                 | 3 +++
 meta/conf/machine/include/tune-corei7.inc | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 75739db..22d8169 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -50,6 +50,9 @@ def qemu_run_binary(data, rootfs_path, binary):
 QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH', True), True) or ""}"
 QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
 
+QEMU_EXTRAOPTIONS_corei7-32 = " -cpu Nehalem,check=false"
+QEMU_EXTRAOPTIONS_corei7-64 = " -cpu Nehalem,check=false"
+QEMU_EXTRAOPTIONS_corei7-64-x32 = " -cpu Nehalem,check=false"
 QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
 QEMU_EXTRAOPTIONS_ppce500mc = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppce5500 = " -cpu e500mc"
diff --git a/meta/conf/machine/include/tune-corei7.inc b/meta/conf/machine/include/tune-corei7.inc
index 6edfb68..ccce210 100644
--- a/meta/conf/machine/include/tune-corei7.inc
+++ b/meta/conf/machine/include/tune-corei7.inc
@@ -22,18 +22,15 @@ TUNE_FEATURES_tune-corei7-32 = "${TUNE_FEATURES_tune-x86} corei7"
 BASE_LIB_tune-corei7-32 = "lib"
 TUNE_PKGARCH_tune-corei7-32 = "corei7-32"
 PACKAGE_EXTRA_ARCHS_tune-corei7-32 = "${PACKAGE_EXTRA_ARCHS_tune-core2-32} corei7-32"
-QEMU_EXTRAOPTIONS_corei7-32 = " -cpu Nehalem,check=false"
 
 AVAILTUNES += "corei7-64"
 TUNE_FEATURES_tune-corei7-64 = "${TUNE_FEATURES_tune-x86-64} corei7"
 BASE_LIB_tune-corei7-64 = "lib64"
 TUNE_PKGARCH_tune-corei7-64 = "corei7-64"
 PACKAGE_EXTRA_ARCHS_tune-corei7-64 = "${PACKAGE_EXTRA_ARCHS_tune-core2-64} corei7-64"
-QEMU_EXTRAOPTIONS_corei7-64 = " -cpu Nehalem,check=false"
 
 AVAILTUNES += "corei7-64-x32"
 TUNE_FEATURES_tune-corei7-64-x32 = "${TUNE_FEATURES_tune-x86-64-x32} corei7"
 BASE_LIB_tune-corei7-64-x32 = "libx32"
 TUNE_PKGARCH_tune-corei7-64-x32 = "corei7-64-x32"
 PACKAGE_EXTRA_ARCHS_tune-corei7-64-x32 = "${PACKAGE_EXTRA_ARCHS_tune-core2-64-x32} corei7-64-x32"
-QEMU_EXTRAOPTIONS_corei7-64-x32 = " -cpu Nehalem,check=false"
-- 
2.8.1


