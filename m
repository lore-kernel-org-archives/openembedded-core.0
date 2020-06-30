Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.9139.1593494331079073408
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 22:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rERS84Yx;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id 80so17502382qko.7
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 22:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GLruQ2HCE6awvqqWYLcLwVqLp0IDZPMLCMBdUlVQDTE=;
        b=rERS84YxKkYilh8OOxvyq9GZayszxjO9tcT3tUgLceY58Vh7TtseU/9OZI5oY75Whw
         7jhlXLzgpb7aOqRvCSZmKALxBe6OaA0uXB7w+1/YKXyYICWsTflYfot/oKytrY2EDvZ+
         MpGeDGI5mgVFeMfdb4DA8SpJ6pRAYqVY5Ht0R5E3JphSwJZhEArm8vJ+nva5RM4Ndp2f
         wzep/dgIkOgvPEGc5yQtOxjIjGJLq0U4o7gcIsLqRnq1c+T1FFYYUZq82BAolfv7nPRm
         qIEkjiZOVTd+Gb6DHY0fI/oI8XQm9o2ik++GQI4eaIkBqb/sY+3VFmb4olZgAH9FUU74
         zsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GLruQ2HCE6awvqqWYLcLwVqLp0IDZPMLCMBdUlVQDTE=;
        b=MnHPuzs2wtjB0WpCQk4YD9oAqJxoTZaQLI9NUetg0PoSklLyUjIpbWe1AtLiN7vA2C
         TYEcraJgjbUGsPQauoJpxsqy2/frsp4FdBie+/sARctgqrIXjfBZeVpcoBqUhxqrd18i
         ePfvmVbC134RD0GmudtjDidy1KXPOQVcO06BvdOvUcNDxyxE2eL+90Q7FqOGc5zOrDqk
         7qNE6jFsToMTY3HV03iYTxGQjRfG5OzAi/gc8VSZn1ymqR+Zux1Q8P1WW89D/CRkTDv5
         SedT4DJp0JCUKI7EdqrP4hAGfy+N4eSt0YRtFWLNXvWnfpoENXEq1ug43aRfpnIMuQNk
         NnRQ==
X-Gm-Message-State: AOAM533//ayUBwAPfk3gi8w6M3F3uN65iun6d8fTffwIft/vOdB+6/NO
	QYAnx6vO3k8pHnxam/GfwSo=
X-Google-Smtp-Source: ABdhPJycftjGARTcZK0U0Cuokt3OrEIFx7u+RbeHCzv+s54S1MEsnxpK/UPjaxvmB9GAEm8q1n7uzw==
X-Received: by 2002:a37:a78c:: with SMTP id q134mr19145599qke.368.1593494330097;
        Mon, 29 Jun 2020 22:18:50 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id o10sm2163403qtq.71.2020.06.29.22.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 22:18:49 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] kernel/yocto: ensure that defconfigs are processed first
Date: Tue, 30 Jun 2020 01:18:41 -0400
Message-Id: <6a6d971f5d21443cb0384beac8bb59ffbdcdd19e.1593494109.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1593494109.git.bruce.ashfield@gmail.com>
References: <cover.1593494109.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2.19.1

