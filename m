Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web12.18459.1593600406526649892
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 03:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MhdXSXXD;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: andrey.z@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id z17so19206790edr.9
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2020 03:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=EOr8rJBEgRMraMVHACAjGxQFj8oqVXnQ6mmw5TPEPVI=;
        b=MhdXSXXDKy/YVI+HYYwByJURxcHHc4kMvaD3+VcToouW7trUL2hgL6ef5PxXN6I4vT
         s0hY3BoLl3xgvUz+lNBCUPVXos8DyKIbSbmChbvaxvtJOaS+nzo3ouUFuN9In6L/7Szn
         iG7g7+h2Eu3xCX/V1LyAovL6ijKCvXE6ov7bD6qju0s08lY0EePvIffCW9dw+7mj2KY2
         /up7a7pFtdgS8iOxy3awneEJXSyDmW2G6RjIWmX92/XT1BAUKka5cZq93HRBkknvKepb
         /238sREDsF0CTjY1xiWPleynW5lXYvl/IfJ47pSFOMhoSIuzo9savxgUolHv4lZtpTVL
         cEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EOr8rJBEgRMraMVHACAjGxQFj8oqVXnQ6mmw5TPEPVI=;
        b=Zp1876tqeXW+rO3Fhz9sqIRTtdu0FXsJl6Hfxjjvx7+yq3gngSFsqfcqrDBXb8Rc3i
         eOXSB+kck3f63vPP6wzE3GsiSlRiQLB6IfzeyxluYRp4VDWayyNiiUAr1No6FSCePYRD
         jZwyi0TPriaiSb3+3PinMRhVreuzl0MWKUSRA35FkA0xZYligo/n9Vu0t8t6GsmRsRA2
         jhM/8QjmbfPALLi0bUL8l/tx87nVp7413WBl8gXMogqyDElDUPwbJukmmrp7m4KEmJqH
         ipFpN7w77dnjjd2YAwQ+Sl0KocKcX5hnjEbIAsTFmlTM/4wwxXg4TE52y3YNwQ9fUqq/
         HehQ==
X-Gm-Message-State: AOAM5320b3vK2HEErRXzBCA1lErypNoAuqwHh/QCPls3gVX5yr6ZoKDO
	VC7Z8gJgl0f7yWdIL7J8QZyiPVDc
X-Google-Smtp-Source: ABdhPJz5DdpqRtUUA+FRHpOQvHYMjS8gK+aEtx1HSQ0wqJHiEkEsbmyGP+PEx2S3dHFLVxtb4EXozw==
X-Received: by 2002:a50:b065:: with SMTP id i92mr29893036edd.112.1593600404647;
        Wed, 01 Jul 2020 03:46:44 -0700 (PDT)
Return-Path: <andrey.z@gmail.com>
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id w12sm5974421edx.19.2020.07.01.03.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 03:46:43 -0700 (PDT)
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrey Zhizhikin <andrey.z@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] kernel/yocto: fix search for defconfig from src_uri
Date: Wed,  1 Jul 2020 10:46:28 +0000
Message-Id: <20200701104628.32696-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.17.1

Fetcher provides full paths to defconfig and scc files, which awk
comparison operator does not catch during construction of
src_uri_defconfig and sccs_from_src_uri lists. This causes the
src_uri_defconfig variable to come out empty, and fails further
validation if defconfig is only supplied via SRC_URI.

Replace comparison operator with awk index function which searches for
sub-string during filtering, effectively placing defconfig from SRC_URI
into src_uri_defconfig and scc files in sccs_from_src_uri respectively.

Fixes: 23dcff0d396c (kernel/yocto: ensure that defconfigs are processed first)
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 41d8620e67..059d78b7dc 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -156,9 +156,10 @@ do_kernel_metadata() {
 	# a quick check to make sure we don't have duplicate defconfigs If
 	# there's a defconfig in the SRC_URI, did we also have one from the
 	# KBUILD_DEFCONFIG processing above ?
-	src_uri_defconfig=$(echo $sccs_from_src_uri | awk '{ if ($0=="defconfig") { print $0 } }' RS=' ')
+	src_uri_defconfig=$(echo $sccs_from_src_uri | awk '(index($0, "defconfig") != 0) { print $0 }' RS=' ')
 	# drop and defconfig's from the src_uri variable, we captured it just above here if it existed
-	sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '{ if ($0!="defconfig") { print $0 } }' RS=' ')
+	sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '(index($0, "defconfig") == 0) { print $0 }' RS=' ')
+
 	if [ -n "$in_tree_defconfig" ]; then
 		sccs_defconfig=$in_tree_defconfig
 		if [ -n "$src_uri_defconfig" ]; then
-- 
2.17.1

