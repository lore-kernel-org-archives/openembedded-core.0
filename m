Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web11.61412.1594051874386436873
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GJR2NNX5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.67, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f67.google.com with SMTP id gc9so10509582pjb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=GN9sFl1+GQFttZ/ZUfHEVtcjfduArap3m+/OPwLpDQM=;
        b=GJR2NNX5WDI0vfgRQSS6mQ6313Axtg7fkS90uX25kf69lsQxBMqSqzV2bDDvaHoNGn
         /gdmSqVJZjgrHP/4DB0o4DHwAqKpUEzAPDd/DkKAb2eR+5qLMmZMF4Vdx7Qfgy21a+sI
         gy528x9EDGrkjYdrQvfIED+R4FXBSjpMKQHL5O4uhEF0VaMy/rE2aAxEcBzfhacz5ZKm
         iyAlaFw12nYmfVzX4kFl8WNjcjqiuvpsXtrHmFEo+3DJt+IbRB88ij76KXwCiS5piX9X
         FdLzcPJdK7+n2qbjUhBQYsAvb7L8Ep2y/MagqoLz4vqxDttv2HYTZWuMHVHUzGIkwyRe
         KTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=GN9sFl1+GQFttZ/ZUfHEVtcjfduArap3m+/OPwLpDQM=;
        b=DsON9nzMzXQbrQX2kcBHfSkYKkm4kKNHoa/bqGHBn1ruo7tRzGBYv572hw0aB/f+0Q
         SD/4ldfBZMvpnf3ez6GIn0XenFSF7W7dqYmdua8jWbd5vQfHEgqqgKVygyVU623ZGSVq
         UJ4i8aUyPtD/rE9dkxeCknlnGyXIuOsKijUJT7+QTnLBB/UP8M9PNin0wWC1QKmFoFh0
         xL0Mcm1LFc0dV0oDdEMf6PQCsILHVR4DA5VsD9KtOhjDcq9aL64OdhbdUE1hVZpGUEjO
         dIeEumHbMoMksNA1dfLjv2Per87Zz0gpv+o/smcB1qSTUEK37ZaUiIguExGZ+K8SMtgy
         wogQ==
X-Gm-Message-State: AOAM533P6viNLUWuTp3TCPQgPywLNqR02Yw/pHxwhthurZJYH4URc6Zd
	7d19KTxJ0w9/jh9w9gPB5MFvTlrORgZ3qw==
X-Google-Smtp-Source: ABdhPJzVHrJOyqTVZmioi+co42sGJPJ9tWTErzyBgS8NEkJiaFKOebPLtljC34fsCCjekY/8nES4xQ==
X-Received: by 2002:a17:90a:2465:: with SMTP id h92mr24302pje.26.1594051873389;
        Mon, 06 Jul 2020 09:11:13 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.11.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:11:12 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/25] kernel/yocto: ensure that defconfigs are processed first
Date: Mon,  6 Jul 2020 06:10:06 -1000
Message-Id: <7a8612998a367dd3a54344ae75983cb210db813d.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594050175.git.steve@sakoman.com>
References: <cover.1594050175.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

It is uncommon that a BSP definition and a defconfig are used in
a single configuration. That being said, it is a valid way to
organize kernel configuration meta data.

When a defconfig is used, either on the src_uri or from in
the kernel tree, it is normally expected that it is the baseline,
with all options applied on top of it.

With this commit, we detect either type of defconfig and ensure
that it is used first, followed by the fragments in their
previous order. This allows existing configuration stacks to
remain the same, while ensuring that a defconfig combined stack
works as expected.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e6845327b69396d843a2f3c4c3ac9400ae9caedf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-yocto.bbclass | 33 ++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 5bc627066e..41d8620e67 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -131,7 +131,7 @@ do_kernel_metadata() {
 			else
 				cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
 			fi
-			sccs="${WORKDIR}/defconfig"
+			in_tree_defconfig="${WORKDIR}/defconfig"
 		else
 			bbfatal "A KBUILD_DEFCONFIG '${KBUILD_DEFCONFIG}' was specified, but not present in the source tree"
 		fi
@@ -153,14 +153,24 @@ do_kernel_metadata() {
 	patches="${@" ".join(find_patches(d,''))}"
 	feat_dirs="${@" ".join(find_kernel_feature_dirs(d))}"
 
-	# a quick check to make sure we don't have duplicate defconfigs
-	# If there's a defconfig in the SRC_URI, did we also have one from
-	# the KBUILD_DEFCONFIG processing above ?
-	if [ -n "$sccs" ]; then
-	    # we did have a defconfig from above. remove any that might be in the src_uri
-	    sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '{ if ($0!="defconfig") { print $0 } }' RS=' ')
+	# a quick check to make sure we don't have duplicate defconfigs If
+	# there's a defconfig in the SRC_URI, did we also have one from the
+	# KBUILD_DEFCONFIG processing above ?
+	src_uri_defconfig=$(echo $sccs_from_src_uri | awk '{ if ($0=="defconfig") { print $0 } }' RS=' ')
+	# drop and defconfig's from the src_uri variable, we captured it just above here if it existed
+	sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '{ if ($0!="defconfig") { print $0 } }' RS=' ')
+	if [ -n "$in_tree_defconfig" ]; then
+		sccs_defconfig=$in_tree_defconfig
+		if [ -n "$src_uri_defconfig" ]; then
+			bbwarn "[NOTE]: defconfig was supplied both via KBUILD_DEFCONFIG and SRC_URI. Dropping SRC_URI defconfig"
+		fi
+	else
+		# if we didn't have an in-tree one, make our defconfig the one
+		# from the src_uri. Note: there may not have been one from the
+		# src_uri, so this can be an empty variable.
+		sccs_defconfig=$src_uri_defconfig
 	fi
-	sccs="$sccs $sccs_from_src_uri"
+	sccs="$sccs_from_src_uri"
 
 	# check for feature directories/repos/branches that were part of the
 	# SRC_URI. If they were supplied, we convert them into include directives
@@ -187,11 +197,10 @@ do_kernel_metadata() {
 	# expand kernel features into their full path equivalents
 	bsp_definition=$(spp ${includes} --find -DKMACHINE=${KMACHINE} -DKTYPE=${LINUX_KERNEL_TYPE})
 	if [ -z "$bsp_definition" ]; then
-		echo "$sccs" | grep -q defconfig
-		if [ $? -ne 0 ]; then
+		if [ -z "$sccs_defconfig" ]; then
 			bbfatal_log "Could not locate BSP definition for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was provided"
 		fi
-
+	else
 		# if the bsp definition has "define KMETA_EXTERNAL_BSP t",
 		# then we need to set a flag that will instruct the next
 		# steps to use the BSP as both configuration and patches.
@@ -206,7 +215,7 @@ do_kernel_metadata() {
 	elements="`echo -n ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}`"
 	if [ -n "${elements}" ]; then
 		echo "${bsp_definition}" > ${S}/${meta_dir}/bsp_definition
-		scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
+		scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} $sccs_defconfig $bsp_definition $sccs $patches ${KERNEL_FEATURES}
 		if [ $? -ne 0 ]; then
 			bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
 		fi
-- 
2.17.1

