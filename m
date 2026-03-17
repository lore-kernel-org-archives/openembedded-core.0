Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E5FFD874A
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 11:56:18 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74055.1773748571522441783
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 04:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cmX0gVzo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so5551353f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 04:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773748569; x=1774353369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=A+aZzV0CosERZ1bjXy8dVPINwogBGHKQhDhqplJyGzU=;
        b=cmX0gVzoMV3Qhmw31DhZjFTKpSDhhLTKLA05soX07wx27V3B8HIwu6zJ73Z7zb8RlB
         LywgR2rb0BdzAUe4yXWY6cE0dQHhYzTB/9aOaceWH/0lVUOD8CePN6rWdbDZyOjNPRCH
         FFDEVoJBTGWXO4MWwU9X3mONk7GXMvgzz4J7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773748569; x=1774353369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+aZzV0CosERZ1bjXy8dVPINwogBGHKQhDhqplJyGzU=;
        b=b5yXphP8vU98r0hk6SWjzpAspai+LAwrf7c6uL0OspZc9nexgEaLASf40NkoXcKmDm
         vSY+uhTRwFO0+2RGi0PwjxnowfspyQJdflik2+RVU4BxIYD5HjVnevUoq6nxz5NDQdxg
         NuZyBzf+fC/rwggjv+v495vXaw+EnboEbO2YOOPt8Uy/n6KEbOUd3sUNGKWz5qMS6Pi0
         uSaEyO1isYQTtFQvLn0HbtsYCU2pbNVYRhvHCfrSF+9/WFFN9K6BNXCnM1xJxevHc6+G
         LrbSX+zcULGw7GNHx0HbfM+/HjjqqB+aoS6DdycTylsGt6602QOLM/daoQRl8B/0j7PF
         qr8w==
X-Gm-Message-State: AOJu0Ywzbll4y8cU1JL+KjqH86Hmh0WhSGoGZynh05tXaTBs5wKDCaGF
	CbG6ULyBRV6M2SD7ZWepRXSSMPiQ3YBfkkwUaQEkngAhq7PFLNjmsdqut5kM+hX42w+EFVMxkrQ
	b8zk2Eno=
X-Gm-Gg: ATEYQzyqKPxAsqOKoeCo9TzhCpc4Zwmq13qSKSw/bhpig4gW8TfwYpxtdd9BAX6K4mI
	zJ3BPhR3feB0Pb7DRURZf1RSqnHQbbGY3VQo4KsxzpbOLUrRVQG/HTAynGdgkqrKpw0ShOWvMbL
	jJkGIQF1UV8neLp3hmDrVZ/j8bkhsCIKnxZtH9mI0ElBmoUpDpMvWz7WZZeWwfZGOOET+oN7WaN
	i1ukQORtsBFGffnZ1/PItYl/avo+lKCg8EHUHCijkAWSs61UFcq19xujWlxqipFOLJ6nnXfMiIG
	9a+LRYQbhdLahuQP95nAPeE2gKVsj3iDciPLE4NsVbe5gLZmWq71nEV6QiQ0V7xpN3ZRU9Y0MwR
	8v6DI/X9ztOxqq0kNmysVR2URB4ZRp5SdLe1+qb243NTWktCCfFXP4PeozbxfmPi/6Kml8KXdlz
	De5Butnvqe/cpGhBk7R14Behd9k+dv5hWt/0Es0avY6NuIhhsFxiDFH/x9WLpXuA==
X-Received: by 2002:a5d:5d11:0:b0:43b:4c6b:754a with SMTP id ffacd0b85a97d-43b4c6b7618mr3606578f8f.53.1773748568892;
        Tue, 17 Mar 2026 04:56:08 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:183c:b889:ee72:b492])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm51073203f8f.20.2026.03.17.04.56.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 04:56:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] license: Fix sstate hash conflict issues
Date: Tue, 17 Mar 2026 11:56:07 +0000
Message-ID: <20260317115607.931693-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 11:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233318

Currently, SSTATE_PKGARCH is injected into the sstate packages themselves but
the output of do_populate_lic is meant to be architecture invariant.

Instead of putting it into the package, use that part of the path as the
installation location. This makes the sstate packages architecture invariant
and avoids hash mismatch issues.

I suspect this was what I'd originally intended when I added SSTATE_PKGARCH to
the path but things weren't quite done correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/license.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/license.bbclass
index af5f1ed41df..0069c7219da 100644
--- a/meta/classes-global/license.bbclass
+++ b/meta/classes-global/license.bbclass
@@ -18,14 +18,14 @@ LICENSE_CREATE_PACKAGE ??= "0"
 LICENSE_PACKAGE_SUFFIX ??= "-lic"
 LICENSE_FILES_DIRECTORY ??= "${datadir}/licenses/"
 
-LICENSE_DEPLOY_PATHCOMPONENT = "${SSTATE_PKGARCH}"
+LICENSE_DEPLOY_PATHCOMPONENT = "target"
 LICENSE_DEPLOY_PATHCOMPONENT:class-cross = "native"
 LICENSE_DEPLOY_PATHCOMPONENT:class-native = "native"
 # Ensure the *value* of SSTATE_PKGARCH is captured as it is used in the output paths
 LICENSE_DEPLOY_PATHCOMPONENT[vardepvalue] += "${LICENSE_DEPLOY_PATHCOMPONENT}"
 
 addtask populate_lic after do_patch before do_build
-do_populate_lic[dirs] = "${LICSSTATEDIR}/${LICENSE_DEPLOY_PATHCOMPONENT}/${PN}"
+do_populate_lic[dirs] = "${LICSSTATEDIR}/${PN}"
 do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
 
 python do_populate_lic() {
@@ -35,7 +35,7 @@ python do_populate_lic() {
     lic_files_paths = find_license_files(d)
 
     # The base directory we wrangle licenses to
-    destdir = os.path.join(d.getVar('LICSSTATEDIR'), d.getVar('LICENSE_DEPLOY_PATHCOMPONENT'), d.getVar('PN'))
+    destdir = os.path.join(d.getVar('LICSSTATEDIR'),  d.getVar('PN'))
     copy_license_files(lic_files_paths, destdir)
     info = get_recipe_info(d)
     with open(os.path.join(destdir, "recipeinfo"), "w") as f:
@@ -256,7 +256,7 @@ def find_license_files(d):
 
 SSTATETASKS += "do_populate_lic"
 do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
-do_populate_lic[sstate-outputdirs] = "${LICENSE_DIRECTORY}/"
+do_populate_lic[sstate-outputdirs] = "${LICENSE_DIRECTORY}/${LICENSE_DEPLOY_PATHCOMPONENT}/"
 
 IMAGE_CLASSES:append = " license_image"
 

