Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6E5407780A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 14:40:52 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id f28so667537lfi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 07:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Rfk2ybJqacOZ7KUfsGhE+v+XUtfMsZc5G+Qsv0cT3io=;
	b=KROeJ5gWa1nUmBk28BoDrvgXE2nISeg/jn3dAImS1WtJCiGOBkIi8L5r3U/X6B+h0D
	hRiyJl3zvUBfk+go9ayCptKZDE2xY2AkvFXMSyfX48R0uEsuLrSDqRW8OmHmI7wBd5kN
	jGc4C5fTKzZCiXyy+dmRVVRig5i/oZwP+gofwn12NVrOOnhMNOtr4jdJ8yqfE2MumvMD
	29lLJRycb/Olh/4Wj5TI141fEZv5Ufmr36cjTK9APJCHtzAvC2auubN1xiu9gygQY6kA
	4Lwa09ZuE95WLinZdqqU92MhBMD7qnq2mUo8/dmTPA6FKgfQ829ppJqjJWRA2A4o5QBX
	WNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Rfk2ybJqacOZ7KUfsGhE+v+XUtfMsZc5G+Qsv0cT3io=;
	b=i6hUuD99irkk53JH8HvXny5734tcpdoblWQkEhkDgY5ZOcTLsMPPYGNCzfvSUeXX7S
	LDxjMMCfzvSNhy/NrsijbYyTIZghtv7jSWTB/FEfrNMDBUv9Lnmoi+cIpGz5jn3Tj2uK
	0EKetUTr4H7FuYE1RGVrZvYnSxVhQkmkxkiM+AUVJRhiwScYmfXPZSG4eJrzcU7Ae1zc
	BfPMVAAHM3eiu/7LWpbhoOlWp4J08lWDYWBI/trVZO2R/bY4rKJXmL0lcTBO4bvHnzB/
	ANdtixs6J26huIT0hpI/eD6glwlD/CzdYQk686UF+dOmtuqdS0DdD8dTAnKYre/lEZa/
	wgUA==
X-Gm-Message-State: AKS2vOyJNGUu5yYZbRSaG9u5PkgUztLEnOLcSJkid3ktN2vMOYhdlRC0
	rh3ygOMCFYerrcpM
X-Received: by 10.80.158.71 with SMTP id z65mr25792688ede.9.1499352052841;
	Thu, 06 Jul 2017 07:40:52 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.201.242])
	by smtp.gmail.com with ESMTPSA id n26sm232066edd.51.2017.07.06.07.40.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Jul 2017 07:40:52 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 16:40:38 +0200
Message-Id: <1499352038-27144-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] image-mklibs.bbclass: add a missing dependency
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
X-List-Received-Date: Thu, 06 Jul 2017 14:40:52 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

${HOST_PREFIX}readelf is being called in mklibs_optimize_image_doit, so
do_rootfs should depend on
virtual/${MLPREFIX}${TARGET_PREFIX}binutils:do_populate_sysroot.

Also pass ${IMAGE_ROOTFS} with --sysroot option which works well per
test, or else the do_rootfs needs pull in the entire sysroot which cost
too much.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/image-mklibs.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
index 5f6df1b..af9b140 100644
--- a/meta/classes/image-mklibs.bbclass
+++ b/meta/classes/image-mklibs.bbclass
@@ -1,4 +1,4 @@
-do_rootfs[depends] += "mklibs-native:do_populate_sysroot"
+do_rootfs[depends] += "mklibs-native:do_populate_sysroot virtual/${MLPREFIX}${TARGET_PREFIX}binutils:do_populate_sysroot"
 
 IMAGE_PREPROCESS_COMMAND += "mklibs_optimize_image; "
 
@@ -24,7 +24,7 @@ mklibs_optimize_image_doit() {
 	mklibs -v \
 		--ldlib ${dynamic_loader} \
 		--libdir ${baselib} \
-		--sysroot ${PKG_CONFIG_SYSROOT_DIR} \
+		--sysroot ${IMAGE_ROOTFS} \
 		--gcc-options "--sysroot=${PKG_CONFIG_SYSROOT_DIR}" \
 		--root ${IMAGE_ROOTFS} \
 		--target `echo ${TARGET_PREFIX} | sed 's/-$//' ` \
-- 
2.7.4


