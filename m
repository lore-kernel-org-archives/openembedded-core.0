Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.19246.1597251825329881698
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 10:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ugD3Zhog;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id e5so2024839qth.5
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2020 10:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9sqcmZ7qapfXG8YytSuPqBs907V/353l7FLgQPWcz5A=;
        b=ugD3Zhogz060OtsizmZ1JbmGqCOvThd8YF1ycBr5pw09+8+s95mOAMTlU/gYzArDx4
         ZG94IpLAITAPHNVU899Yp00G69kxZAWeqYQnK8TYj0rpQmgEvWOOYJ6HmKkAyaQlpSEp
         W9fcHBRGrcA2qWW5LTUUo93LXigF+ltgsLyFNDczAY9zE2NVr8Faoey2uXYD7oYmYPtJ
         eO6m0hFuhCses2tgeN2nyc96yKUaVel1KGzmk+JUb1B5NLALcluJSikRDRZsatQzgOu3
         UU7lYj//l+XyHA+bwCGBCq/XkMdSLejGyQOzzIRRD7bX8rD+OwMmiivrNBNDJP/CXCVs
         zgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9sqcmZ7qapfXG8YytSuPqBs907V/353l7FLgQPWcz5A=;
        b=FdX+emwxTObpO85ewHCMiR7LZyz4l73Ap508bkGCFQq5xIE3RNX3++DrYHT2U3o8fX
         zJxFvSL/kZwPhT+E96a2Mv2LRPLyoNWhhWY0HHcUSMFZ0qGMhWpUSpr9RoPk9Kootudh
         OZH/yrq4wKt0jhbQ3uLadZJGQ7bJYjV5kiTpreIcRbh+5LnaVS3zOa+qfPGt3W5nq2y5
         XVP+/Kt5ehijJUEqM1LxNXGUyfs42f+TZIYDds+nSSPKVmmyUxJDs4rXMxQ/l/mAqiyP
         bczVfL2f5CcBZTt+5ADS14OIaBt+cWc9QXlAMOmmP49ERN9xoEDLw23zzQ62XK4UNGx4
         Aq8g==
X-Gm-Message-State: AOAM531ewY5/0K+b9YxUHyAVjOsA7cXy3zzub1sVZCwiKwoDcVMMFunr
	i+/3VffHRVqjx5Ba+PoIC84QqYjTedfsng==
X-Google-Smtp-Source: ABdhPJzQs0Y4lxfIqC3yiJOWMxxFLcgOwm6e+hl4eu0wlEKdMljocNPzTQOMiY5g5hyQcuox2BLDmQ==
X-Received: by 2002:ac8:470e:: with SMTP id f14mr633647qtp.380.1597251824214;
        Wed, 12 Aug 2020 10:03:44 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id k24sm3249977qtb.26.2020.08.12.10.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 10:03:43 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/10] kernel-yocto: split meta data gathering into patch and config phases
Date: Wed, 12 Aug 2020 13:03:28 -0400
Message-Id: <0238915523c18365bda63e4d15cddfb721ab08a6.1597203921.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1597203921.git.bruce.ashfield@gmail.com>
References: <cover.1597203921.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

do_kernel_metadata gathers and sanitizes the meta-data that is used
in later steps of the kernel-yocto build process. The processing
takes the form of configuration and patch gathering.

The current single pass of both config and patch gathering means
that patches can't modify in-tree configuration elements (although
this makes tracing configuration changes harder, it is a valid
workflow).

We can divide the routine into a patch and configuration phase, and
call the config variant after patching is done. This keeps the
common parts of the gahering intact, but allows us flexibilty in
when the stages happen.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 72 ++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 29 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index fa8466e587..96ea612258 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -87,6 +87,13 @@ def get_machine_branch(d, default):
 
 do_kernel_metadata() {
 	set +e
+
+	if [ -n "$1" ]; then
+		mode="$1"
+	else
+		mode="patch"
+	fi
+
 	cd ${S}
 	export KMETA=${KMETA}
 
@@ -120,14 +127,13 @@ do_kernel_metadata() {
 	if [ -n "${KBUILD_DEFCONFIG}" ]; then
 		if [ -f "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}" ]; then
 			if [ -f "${WORKDIR}/defconfig" ]; then
-				# If the two defconfig's are different, warn that we didn't overwrite the
-				# one already placed in WORKDIR by the fetcher.
+				# If the two defconfig's are different, warn that we overwrote the
+				# one already placed in WORKDIR
 				cmp "${WORKDIR}/defconfig" "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}"
 				if [ $? -ne 0 ]; then
-					bbwarn "defconfig detected in WORKDIR. ${KBUILD_DEFCONFIG} skipped"
-				else
-					cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
+					bbdebug 1 "detected SRC_URI or unpatched defconfig in WORKDIR. ${KBUILD_DEFCONFIG} copied over it"
 				fi
+				cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
 			else
 				cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
 			fi
@@ -137,17 +143,19 @@ do_kernel_metadata() {
 		fi
 	fi
 
-	# was anyone trying to patch the kernel meta data ?, we need to do
-	# this here, since the scc commands migrate the .cfg fragments to the
-	# kernel source tree, where they'll be used later.
-	check_git_config
-	patches="${@" ".join(find_patches(d,'kernel-meta'))}"
-	for p in $patches; do
-	    (
-		cd ${WORKDIR}/kernel-meta
-		git am -s $p
-	    )
-	done
+	if [ "$mode" = "patch" ]; then
+		# was anyone trying to patch the kernel meta data ?, we need to do
+		# this here, since the scc commands migrate the .cfg fragments to the
+		# kernel source tree, where they'll be used later.
+		check_git_config
+		patches="${@" ".join(find_patches(d,'kernel-meta'))}"
+		for p in $patches; do
+		    (
+			cd ${WORKDIR}/kernel-meta
+			git am -s $p
+		    )
+		done
+	fi
 
 	sccs_from_src_uri="${@" ".join(find_sccs(d))}"
 	patches="${@" ".join(find_patches(d,''))}"
@@ -237,13 +245,15 @@ do_kernel_metadata() {
 		done
         fi
 
-	# run1: pull all the configuration fragments, no matter where they come from
-	elements="`echo -n ${bsp_definition} $sccs_defconfig ${sccs} ${patches} $KERNEL_FEATURES_FINAL`"
-	if [ -n "${elements}" ]; then
-		echo "${bsp_definition}" > ${S}/${meta_dir}/bsp_definition
-		scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} $sccs_defconfig $bsp_definition $sccs $patches $KERNEL_FEATURES_FINAL
-		if [ $? -ne 0 ]; then
-			bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
+	if [ "$mode" = "config" ]; then
+		# run1: pull all the configuration fragments, no matter where they come from
+		elements="`echo -n ${bsp_definition} $sccs_defconfig ${sccs} ${patches} $KERNEL_FEATURES_FINAL`"
+		if [ -n "${elements}" ]; then
+			echo "${bsp_definition}" > ${S}/${meta_dir}/bsp_definition
+			scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} $sccs_defconfig $bsp_definition $sccs $patches $KERNEL_FEATURES_FINAL
+			if [ $? -ne 0 ]; then
+				bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
+			fi
 		fi
 	fi
 
@@ -254,12 +264,14 @@ do_kernel_metadata() {
 		sccs="${bsp_definition} ${sccs}"
 	fi
 
-	# run2: only generate patches for elements that have been passed on the SRC_URI
-	elements="`echo -n ${sccs} ${patches} $KERNEL_FEATURES_FINAL`"
-	if [ -n "${elements}" ]; then
-		scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${sccs} ${patches} $KERNEL_FEATURES_FINAL
-		if [ $? -ne 0 ]; then
-			bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
+	if [ "$mode" = "patch" ]; then
+		# run2: only generate patches for elements that have been passed on the SRC_URI
+		elements="`echo -n ${sccs} ${patches} $KERNEL_FEATURES_FINAL`"
+		if [ -n "${elements}" ]; then
+			scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${sccs} ${patches} $KERNEL_FEATURES_FINAL
+			if [ $? -ne 0 ]; then
+				bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
+			fi
 		fi
 	fi
 }
@@ -363,6 +375,8 @@ do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_po
 do_kernel_configme[depends] += "kern-tools-native:do_populate_sysroot"
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
+	do_kernel_metadata config
+
 	# translate the kconfig_mode into something that merge_config.sh
 	# understands
 	case ${KCONFIG_MODE} in
-- 
2.19.1

