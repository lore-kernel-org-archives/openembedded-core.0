Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05705C43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 18:39:38 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.11457.1658515167864888721
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 11:39:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=STI7n4A7;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id bp15so10010873ejb.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 11:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CZ7O/lVz7iG5tzI+KqS10McRb3q0eu+CXiiRrpWfzJg=;
        b=STI7n4A71in9UgEzmtCqrbOY/PwHegmKb1SGqee7vxY/umIFGU9h+iBGKL2TEdwHXf
         2UIbAUFxbHFSaYs5PcwzbgnP/M9cTn3q8NxDRqiL1fALjnMwAKkZW4olrcCt/tvEIm22
         Eh+ZZC4AnY/xuXvf7ItpeX3WGXlznQlIgQ31Vxbo3JCZhlrAPqiO1zWHyb4PH5MyDRit
         ukbADYjke57bsamcTSpf0Ar49wTrv3RssOXZ2UMD/VPIZOpBTLOEZD6Aoaxikx54fBT8
         O4H8i7J//ASlMVWizEK1erdD1cN19hnu4GZXjLdtLqpogjdBUmBYSSzYOx5dYLqX80oz
         rMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CZ7O/lVz7iG5tzI+KqS10McRb3q0eu+CXiiRrpWfzJg=;
        b=Hi0vRyFGHupz89GCM6wuymQ/DujRhfJoMyocDv1uSgXrsfbOJHz4NFJx09drhDBLtk
         HA7OHz89mrBQOMnypGvisbgfv1D778wZm6+RZJq9be7CoJcjhNneZoHnO3vM6duyhZvZ
         ONmiWJIEfMaCH8uSa9HcgWZlg4EMBCjbhjDzxfNshuXLt1C0FFTGX63Y4lBqEr1eS4e0
         U1z9ZPxqzGmcmKZydIuQEj68bcVZT6ht9gH10prlRzteicARPMRUp0rwfIQKmrVg/ADf
         l5N1oq5GjhoL2z3ZiEXJKV16kcRTdSDgwafo0MV4yrh1IIlspXVgjHpj6lakufSI4oAv
         TJ1g==
X-Gm-Message-State: AJIora9xwk/hr0EF3Ehpv+yotVoiDx2q4wMOY1wbLGX+xStbIFp/riL7
	84Fg7oInOP3HqvTrf9Mfen68obVsOTU=
X-Google-Smtp-Source: 
 AGRyM1td7uvqZ8vDQdPtA3aMvwl/1z+NgbBpphlYW7AVy+PDD+iaELOd180OCpCO6parwfrFkS1rqA==
X-Received: by 2002:a17:907:7395:b0:72e:e6c4:53d9 with SMTP id
 er21-20020a170907739500b0072ee6c453d9mr936220ejc.42.1658515166255;
        Fri, 22 Jul 2022 11:39:26 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 bt8-20020a0564020a4800b0043bba5ed21csm2931885edb.15.2022.07.22.11.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 11:39:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/6] toolchain-scripts.bbclass: adjust
 toolchain_create_tree_env_script to better replicate (e)SDK
Date: Fri, 22 Jul 2022 20:39:11 +0200
Message-Id: <20220722183916.360600-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 18:39:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168418

Specifically:
1. Place the environment setup file into $B and not into $TMPDIR,
so that the recipe using the class can itself better decide what to do with the file.

2. Use global, unified sysroots (provided through build-sysroots recipe)
and not recipe-specific ones, as this allows flexible on-the-fly management of what
libraries are available to build applications, without having to modify any
recipes, similar to eSDK 'extensible' part.

This also requires adjustment of the sstate sametune_samegsigs test, as meta-ide-support
becomes dependent on $MACHINE (unified sysroots have it in their paths)
and needs to be excluded from the test.

3. Add a few missing settings that have been added to SDK environment files.

4. Add a snippet to the environment setup file that also runs the relocation scripts.
In regular SDKs this is executed by the SDK installer, in direct SDK we can do it when
setting up the environment.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/toolchain-scripts.bbclass      | 40 ++++++++++++++++-----
 meta/lib/oeqa/selftest/cases/sstatetests.py |  2 +-
 2 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 1d7c703748..16f1e17607 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -63,24 +63,46 @@ toolchain_create_sdk_env_script () {
 	toolchain_shared_env_script
 }
 
-# This function creates an environment-setup-script in the TMPDIR which enables
+# This function creates an environment-setup-script in B which enables
 # a OE-core IDE to integrate with the build tree
 # Caller must ensure CONFIG_SITE is setup
 toolchain_create_tree_env_script () {
-	script=${TMPDIR}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
+	script=${B}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
 	rm -f $script
 	touch $script
+	echo 'standalone_sysroot_target="${STAGING_DIR}/${MACHINE}"' >> $script
+	echo 'standalone_sysroot_native="${STAGING_DIR}/${BUILD_ARCH}"' >> $script
 	echo 'orig=`pwd`; cd ${COREBASE}; . ./oe-init-build-env ${TOPDIR}; cd $orig' >> $script
-	echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${STAGING_BINDIR_TOOLCHAIN}:$PATH' >> $script
-	echo 'export PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR}' >> $script
-	echo 'export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}' >> $script
+	echo 'export PATH=$standalone_sysroot_native/${bindir_native}:$standalone_sysroot_native/${bindir_native}/${TARGET_SYS}:$PATH' >> $script
+	echo 'export PKG_CONFIG_SYSROOT_DIR=$standalone_sysroot_target' >> $script
+	echo 'export PKG_CONFIG_PATH=$standalone_sysroot_target'"$libdir"'/pkgconfig:$standalone_sysroot_target'"$prefix"'/share/pkgconfig' >> $script
 	echo 'export CONFIG_SITE="${CONFIG_SITE}"' >> $script
-	echo 'export SDKTARGETSYSROOT=${STAGING_DIR_TARGET}' >> $script
-	echo 'export OECORE_NATIVE_SYSROOT="${STAGING_DIR_NATIVE}"' >> $script
-	echo 'export OECORE_TARGET_SYSROOT="${STAGING_DIR_TARGET}"' >> $script
-	echo 'export OECORE_ACLOCAL_OPTS="-I ${STAGING_DIR_NATIVE}/usr/share/aclocal"' >> $script
+	echo 'export SDKTARGETSYSROOT=$standalone_sysroot_target' >> $script
+	echo 'export OECORE_NATIVE_SYSROOT=$standalone_sysroot_native' >> $script
+	echo 'export OECORE_TARGET_SYSROOT=$standalone_sysroot_target' >> $script
+	echo 'export OECORE_ACLOCAL_OPTS="-I $standalone_sysroot_native/usr/share/aclocal"' >> $script
+	echo 'export OECORE_BASELIB="${baselib}"' >> $script
+	echo 'export OECORE_TARGET_ARCH="${TARGET_ARCH}"' >>$script
+	echo 'export OECORE_TARGET_OS="${TARGET_OS}"' >>$script
 
 	toolchain_shared_env_script
+
+	cat >> $script <<EOF
+
+if [ -d "\$OECORE_NATIVE_SYSROOT/${datadir}/post-relocate-setup.d/" ]; then
+	for s in \$OECORE_NATIVE_SYSROOT/${datadir}/post-relocate-setup.d/*; do
+		if [ ! -x \$s ]; then
+			continue
+		fi
+		\$s "\$1"
+		status=\$?
+		if [ \$status != 0 ]; then
+			echo "post-relocate command \"\$s \$1\" failed with status \$status" >&2
+			exit \$status
+		fi
+	done
+fi
+EOF
 }
 
 toolchain_shared_env_script () {
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 4749f28ab8..63827f3068 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -444,7 +444,7 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
             f = []
             for root, dirs, files in os.walk(d):
                 for name in files:
-                    if "meta-environment" in root or "cross-canadian" in root:
+                    if "meta-environment" in root or "cross-canadian" in root or 'meta-ide-support' in root:
                         continue
                     if "qemux86copy-" in root or "qemux86-" in root:
                         continue
-- 
2.30.2


