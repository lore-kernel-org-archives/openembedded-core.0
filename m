Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80B0C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 10:28:14 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.48042.1699007293085856591
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 03:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lk2Pn4XO;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40837ebba42so12257035e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 03:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699007291; x=1699612091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuFfbLlDjuZ6y9ZPhHyTkBIvvQUm/cHH890IM4H/3cw=;
        b=Lk2Pn4XOgMKdwin0/mqEWKw6w++1dL0VqiHXIhoXBPBDtsmaEOM4RqGnNkFd1qq/b8
         +oWjrDj/cS8frjUNHjwpxumwtvxM84+ilpVavgIWyK1SLKxS3qoaLp3n3bcfsyOKQiP3
         QyuCKuIFzvbpkiOWKLpE+g+9x5hrLwbKb3dm9Y/uMJDj/hqFBjHzqACLgtusL7cCknvu
         E8dRpSvKffFRFfpcEExvZ/NIrBDy7fGxosa1K/Sep75Fk/Ab/PMMLXkfbALqJwakETwp
         aoMJKECkpyqOCBmMykoHFi/rl7ANEYrfpOa9utmZFMQXC6VyIC6BrvFvhI22JJyW2qoQ
         L3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699007291; x=1699612091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuFfbLlDjuZ6y9ZPhHyTkBIvvQUm/cHH890IM4H/3cw=;
        b=LOEhHF5XTjnwnn3ofbQqQVEV3y1kraBgEMeaYhJpnWHuFLOsCJZsFwZW7vsfRZ6HI0
         VIa7fqPY0o85v15bPZjNiBC1q+EEeVNdT3rU7rh/s9XSaOdG12QESs3GVT0FfD1euF3M
         DdhNVHHa12PqSYYhdNjMXoTfLnCn6ymUAcLYGzfWmxTqBRePEOiiTM0xWsWxk/HKoTNF
         /BsDqGL/F5oshIlLXwN/L/EesjaG/4hG/z2+3aANobkPFR7jeHYaGJbCbTxDtEqib8Wd
         lxZFoXfLbtPzIRv2dncF/T+oVY+KtlvtgS00z9Enw84zZtLVJrTnXQaU0cXjClzmuEgZ
         SjaA==
X-Gm-Message-State: AOJu0Yw6VsxrlUwQjqMWJYmRmJZCIsRUjmaEqzKcyc4rqY+XM8yvAXfB
	lscZXAPVOSgrbZaRDDAMtm1p318Yl1o=
X-Google-Smtp-Source: AGHT+IFrJjPUD3PCw3zE1hlj4gl/kqQXJRQx9gQ9hwNCcobZmcn08n48GN+zMSW3RVWkxDD6fXBbbA==
X-Received: by 2002:a05:600c:4f91:b0:408:4120:bad2 with SMTP id n17-20020a05600c4f9100b004084120bad2mr18819558wmq.9.1699007291435;
        Fri, 03 Nov 2023 03:28:11 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id y14-20020a05600c2b0e00b00405718cbeadsm1976643wme.1.2023.11.03.03.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 03:28:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/4] scripts/esdk-tools: use a dedicated, static directory for esdk tools
Date: Fri,  3 Nov 2023 11:28:05 +0100
Message-Id: <20231103102806.2332746-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103102806.2332746-1-alex@linutronix.de>
References: <20231103102806.2332746-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 10:28:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190150

This allows easier replication of esdk environment (which provides
a curated, limited set of tools that for example does not include bitbake)
in a standard yocto build. Switchover between various sets can be achieved
via PATH manipulation.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 16 ++++------------
 scripts/esdk-tools/devtool                   |  1 +
 scripts/esdk-tools/oe-find-native-sysroot    |  1 +
 scripts/esdk-tools/recipetool                |  1 +
 scripts/esdk-tools/runqemu                   |  1 +
 scripts/esdk-tools/runqemu-addptable2image   |  1 +
 scripts/esdk-tools/runqemu-export-rootfs     |  1 +
 scripts/esdk-tools/runqemu-extract-sdk       |  1 +
 scripts/esdk-tools/runqemu-gen-tapdevs       |  1 +
 scripts/esdk-tools/runqemu-ifdown            |  1 +
 scripts/esdk-tools/runqemu-ifup              |  1 +
 scripts/esdk-tools/wic                       |  1 +
 12 files changed, 15 insertions(+), 12 deletions(-)
 create mode 120000 scripts/esdk-tools/devtool
 create mode 120000 scripts/esdk-tools/oe-find-native-sysroot
 create mode 120000 scripts/esdk-tools/recipetool
 create mode 120000 scripts/esdk-tools/runqemu
 create mode 120000 scripts/esdk-tools/runqemu-addptable2image
 create mode 120000 scripts/esdk-tools/runqemu-export-rootfs
 create mode 120000 scripts/esdk-tools/runqemu-extract-sdk
 create mode 120000 scripts/esdk-tools/runqemu-gen-tapdevs
 create mode 120000 scripts/esdk-tools/runqemu-ifdown
 create mode 120000 scripts/esdk-tools/runqemu-ifup
 create mode 120000 scripts/esdk-tools/wic

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 173b3065b00..53adc868d47 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -220,16 +220,16 @@ python copy_buildsystem () {
         if os.path.exists(os.path.join(baseoutpath, relpath)):
             conf_initpath = relpath
 
-        relpath = os.path.join('layers', path, 'scripts', 'devtool')
+        relpath = os.path.join('layers', path, 'scripts', 'esdk-tools', 'devtool')
         if os.path.exists(os.path.join(baseoutpath, relpath)):
-            scriptrelpath = os.path.dirname(relpath)
+            esdk_tools_path = os.path.dirname(relpath)
 
         relpath = os.path.join('layers', path, 'meta')
         if os.path.exists(os.path.join(baseoutpath, relpath, 'lib', 'oe')):
             core_meta_subdir = relpath
 
     d.setVar('oe_init_build_env_path', conf_initpath)
-    d.setVar('scriptrelpath', scriptrelpath)
+    d.setVar('esdk_tools_path', esdk_tools_path)
 
     # Write out config file for devtool
     import configparser
@@ -627,14 +627,6 @@ def get_sdk_required_utilities(buildtools_fn, d):
     return ' '.join(sanity_required_utilities)
 
 install_tools() {
-	install -d ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}
-	scripts="devtool recipetool oe-find-native-sysroot runqemu* wic"
-	for script in $scripts; do
-		for scriptfn in `find ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath} -maxdepth 1 -executable -name "$script"`; do
-			targetscriptfn="${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/$(basename $scriptfn)"
-			test -e ${targetscriptfn} || ln -rs ${scriptfn} ${targetscriptfn}
-		done
-	done
 	touch ${SDK_OUTPUT}/${SDKPATH}/.devtoolbase
 
 	# find latest buildtools-tarball and install it
@@ -713,7 +705,7 @@ sdk_ext_postinst() {
 
 	# A bit of another hack, but we need this in the path only for devtool
 	# so put it at the end of $PATH.
-	echo "export PATH=\"$target_sdk_dir/sysroots/${SDK_SYS}${bindir_nativesdk}:\$PATH\"" >> $env_setup_script
+	echo "export PATH=\"$target_sdk_dir/${esdk_tools_path}:\$PATH\"" >> $env_setup_script
 
 	echo "printf 'SDK environment now set up; additionally you may now run devtool to perform development tasks.\nRun devtool --help for further details.\n'" >> $env_setup_script
 
diff --git a/scripts/esdk-tools/devtool b/scripts/esdk-tools/devtool
new file mode 120000
index 00000000000..176a01ca682
--- /dev/null
+++ b/scripts/esdk-tools/devtool
@@ -0,0 +1 @@
+../devtool
\ No newline at end of file
diff --git a/scripts/esdk-tools/oe-find-native-sysroot b/scripts/esdk-tools/oe-find-native-sysroot
new file mode 120000
index 00000000000..d3493f3310a
--- /dev/null
+++ b/scripts/esdk-tools/oe-find-native-sysroot
@@ -0,0 +1 @@
+../oe-find-native-sysroot
\ No newline at end of file
diff --git a/scripts/esdk-tools/recipetool b/scripts/esdk-tools/recipetool
new file mode 120000
index 00000000000..60a95dd9360
--- /dev/null
+++ b/scripts/esdk-tools/recipetool
@@ -0,0 +1 @@
+../recipetool
\ No newline at end of file
diff --git a/scripts/esdk-tools/runqemu b/scripts/esdk-tools/runqemu
new file mode 120000
index 00000000000..ae7e7ad7c22
--- /dev/null
+++ b/scripts/esdk-tools/runqemu
@@ -0,0 +1 @@
+../runqemu
\ No newline at end of file
diff --git a/scripts/esdk-tools/runqemu-addptable2image b/scripts/esdk-tools/runqemu-addptable2image
new file mode 120000
index 00000000000..afcd00e79d9
--- /dev/null
+++ b/scripts/esdk-tools/runqemu-addptable2image
@@ -0,0 +1 @@
+../runqemu-addptable2image
\ No newline at end of file
diff --git a/scripts/esdk-tools/runqemu-export-rootfs b/scripts/esdk-tools/runqemu-export-rootfs
new file mode 120000
index 00000000000..a26fcf6110f
--- /dev/null
+++ b/scripts/esdk-tools/runqemu-export-rootfs
@@ -0,0 +1 @@
+../runqemu-export-rootfs
\ No newline at end of file
diff --git a/scripts/esdk-tools/runqemu-extract-sdk b/scripts/esdk-tools/runqemu-extract-sdk
new file mode 120000
index 00000000000..cc858aaad55
--- /dev/null
+++ b/scripts/esdk-tools/runqemu-extract-sdk
@@ -0,0 +1 @@
+../runqemu-extract-sdk
\ No newline at end of file
diff --git a/scripts/esdk-tools/runqemu-gen-tapdevs b/scripts/esdk-tools/runqemu-gen-tapdevs
new file mode 120000
index 00000000000..dbdf79134cf
--- /dev/null
+++ b/scripts/esdk-tools/runqemu-gen-tapdevs
@@ -0,0 +1 @@
+../runqemu-gen-tapdevs
\ No newline at end of file
diff --git a/scripts/esdk-tools/runqemu-ifdown b/scripts/esdk-tools/runqemu-ifdown
new file mode 120000
index 00000000000..0097693ca3d
--- /dev/null
+++ b/scripts/esdk-tools/runqemu-ifdown
@@ -0,0 +1 @@
+../runqemu-ifdown
\ No newline at end of file
diff --git a/scripts/esdk-tools/runqemu-ifup b/scripts/esdk-tools/runqemu-ifup
new file mode 120000
index 00000000000..41026d2c0a4
--- /dev/null
+++ b/scripts/esdk-tools/runqemu-ifup
@@ -0,0 +1 @@
+../runqemu-ifup
\ No newline at end of file
diff --git a/scripts/esdk-tools/wic b/scripts/esdk-tools/wic
new file mode 120000
index 00000000000..a9d908aa254
--- /dev/null
+++ b/scripts/esdk-tools/wic
@@ -0,0 +1 @@
+../wic
\ No newline at end of file
-- 
2.39.2


