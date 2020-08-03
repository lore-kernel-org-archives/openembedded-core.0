Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web12.10090.1596457834636246324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2020 05:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oBv60k8p;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id r19so8691860qvw.11
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2020 05:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mgXTBgynzo6LiXo9vX84W2A2xwZUUZnfv6c2n4oX9ug=;
        b=oBv60k8pLEv9GlQD46xrC4lwUXh6vVuecUe1Rl9Qu0ttXpKJZRzX0qiXk+d6csVL+W
         qTbeA5JC2Ky9yNmCFL3h2Ktbe4jEpXCEbtRO2vYlLw+liiNygwlwrGlO5gqrn8o+S1DJ
         cVxQE4PMxgMqWnIJFI83mT2Oj2EAxM4E8mCXqlc7L0zqV1cEY178Rf1Q/m1a/uIKmbRs
         WvDXKZd1Zf0Fxv7XrECAHbbxljzWbmlZYEtOwjEsvF2TcctTqE/TaHAP8RRgUYkOkrPX
         P4krroI4OARuZPEIdSuQ7yYfORwnA/PFVODIhSrCOPXuvnYPKXy0/1m1lTTbag2A5SAO
         6qnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mgXTBgynzo6LiXo9vX84W2A2xwZUUZnfv6c2n4oX9ug=;
        b=RfKwsDfLvzBmpFvItjXK04Hov4xoPF8J2IM6LDr0C3elTNkcMCNMngjIjgpcMLnWh8
         ACovi96HFIFyRCdlNCf51o7jP8LXtADLdxE2hm3wxlP2Kvu0aLOWfvJzauT8OJsIJwxW
         eyeioTWpez+7PcBdMbqHUr1cU7guIH2N6aeM9bQyT2mGKt6LrP9qQn3ZL29MbjGVjZZG
         l5S5SKgp+9QQ9pVfHplygEjjmliVfYfsBlaY5291AhoFNFBNZG+31UtDOKHqntG76X3m
         aowV3n0W80kl7z7AYTh+fT3jqidSe7kCwgxWwRbljh6tEaXvG4zP2dK2kITUHIDXwcg0
         sx6A==
X-Gm-Message-State: AOAM531KyaXZTEGaP/EtKUnSaHh2o3jJG7OGZrT1d28SweZgx1mi23PB
	pETBjkN6TBdafvXsZ72nXkk=
X-Google-Smtp-Source: ABdhPJxzPEFmV5hGeOory7//nb0DOuhVjP245dwifoRHL/Mk7Zp55fsSUrSYuF6MQ/sqco28PK7z7g==
X-Received: by 2002:ad4:4d03:: with SMTP id l3mr13235434qvl.155.1596457833698;
        Mon, 03 Aug 2020 05:30:33 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id z14sm20184299qtn.92.2020.08.03.05.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 05:30:33 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] kernel/yocto: allow dangling KERNEL_FEATURES
Date: Mon,  3 Aug 2020 08:30:27 -0400
Message-Id: <8516d096199df115e1d9997c2f72977dfbdb191f.1596457310.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1596457310.git.bruce.ashfield@gmail.com>
References: <cover.1596457310.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

KERNEL_FEATURES are explicitly checked by the kern-tools, and trigger
and error when not present. This is since the KERNEL_FEATURES are
specified by layers or BSPs as elements that are requied for correct
operation.

That being said, in order to support more kernel recipes that are using
fragments, but not necessarily the yocto kernel-cache for meta-data,
this change introduces: KERNEL_DANGLING_FEATURES_WARN_ONLY

As you'd expect, when set, missing kernel features only print a
message and warn that runtime issues may occur, but otherwise allow
the kernel configuration and build process to continue.

This was noticed/required when meta-virtualization adopted a more
generic kernel bbappend (to serve the needs of more layers in the
ecosystem), but also specifies some KERNEL_FEATURES. If layers using
a recipe derived from kernel-yocto, but not the main kernel-cache,
used meta-virtualization and error would be thrown due to missing
features. We now can both allow them to continue, and also provide
a more useful message to resolve the issue.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 33 +++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 3311f6e84e..70818cc01c 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -212,11 +212,36 @@ do_kernel_metadata() {
 	fi
 	meta_dir=$(kgit --meta)
 
+	KERNEL_FEATURES_FINAL=""
+	if [ -n "${KERNEL_FEATURES}" ]; then
+		for feature in ${KERNEL_FEATURES}; do
+			feature_found=f
+			for d in $includes; do
+				path_to_check=$(echo $d | sed 's/-I//g')
+				if [ "$feature_found" = "f" ] && [ -e "$path_to_check/$feature" ]; then
+				    feature_found=t
+				fi
+			done
+			if [ "$feature_found" = "f" ]; then
+				if [ -n "${KERNEL_DANGLING_FEATURES_WARN_ONLY}" ]; then
+				    bbwarn "Feature '$feature' not found, but KERNEL_DANGLING_FEATURES_WARN_ONLY is set"
+				    bbwarn "This may cause runtime issues, dropping feature and allowing configuration to continue"
+				else
+				    bberror "Feature '$feature' not found, this will cause configuration failures."
+				    bberror "Check the SRC_URI for meta-data repositories or directories that may be missing"
+				    bbfatal_log "Set KERNEL_DANGLING_FEATURES_WARN_ONLY to ignore this issue"
+				fi
+			else
+				KERNEL_FEATURES_FINAL="$KERNEL_FEATURES_FINAL $feature"
+			fi
+		done
+        fi
+
 	# run1: pull all the configuration fragments, no matter where they come from
-	elements="`echo -n ${bsp_definition} $sccs_defconfig ${sccs} ${patches} ${KERNEL_FEATURES}`"
+	elements="`echo -n ${bsp_definition} $sccs_defconfig ${sccs} ${patches} $KERNEL_FEATURES_FINAL`"
 	if [ -n "${elements}" ]; then
 		echo "${bsp_definition}" > ${S}/${meta_dir}/bsp_definition
-		scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} $sccs_defconfig $bsp_definition $sccs $patches ${KERNEL_FEATURES}
+		scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} $sccs_defconfig $bsp_definition $sccs $patches $KERNEL_FEATURES_FINAL
 		if [ $? -ne 0 ]; then
 			bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
 		fi
@@ -230,9 +255,9 @@ do_kernel_metadata() {
 	fi
 
 	# run2: only generate patches for elements that have been passed on the SRC_URI
-	elements="`echo -n ${sccs} ${patches} ${KERNEL_FEATURES}`"
+	elements="`echo -n ${sccs} ${patches} $KERNEL_FEATURES_FINAL`"
 	if [ -n "${elements}" ]; then
-		scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${sccs} ${patches} ${KERNEL_FEATURES}
+		scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${sccs} ${patches} $KERNEL_FEATURES_FINAL
 		if [ $? -ne 0 ]; then
 			bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
 		fi
-- 
2.19.1

