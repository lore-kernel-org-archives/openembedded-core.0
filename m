Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A74C624CF
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 21:49:27 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17148.1788126560349050641
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 14:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=kVGeLUC+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-2026083021491753bff86eb30002076b-lnrwu0@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026083021491753bff86eb30002076b
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Aug 2026 23:49:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=dRA0GrgzP21Y7AktCLuUt6URHG5IBVeRB4L3ox7Hw1Q=;
 b=kVGeLUC+NQZuEoQbuiu4HL59XrYX9PdRhn8sOqFhJmrzNxQsvmZF2c9aZJ1cnNXMb0DCvT
 6c14RCNTzOGjd6uetLnsNR9YmbPSYzPORjxYvXDLXraNq1P6W3XW5/se7jfsGeMdqjFATH57
 Qvmh526oIhmM5lqkhyKxNoiw3ABfNo2CPga0yQ5y7B0fRmqarRJ0xBw3HejXigvHC431mF6B
 zBWml2EOcvoZ6GvlIrAlj+Yu+FdQ78hKgyKuept4/i6340koQ8fQJquF/emdq80IRsh805/e
 1emHnoPFdov56mEvzGkbd3Yidq1P05rApCLMu/HAbRY8sBpACxble7Ww==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 02/25] devtool: ide-sdk: dedupe solib_search_path entries
Date: Sun, 30 Aug 2026 23:48:24 +0200
Message-ID: <20260830214912.1346063-3-adrian.freihofer@siemens.com>
In-Reply-To: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
References: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 21:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244706

From: Adrian Freihofer <adrian.freihofer@siemens.com>

With usrmerge in DISTRO_FEATURES (the default), root_prefix becomes
exec_prefix, so base_libdir and libdir resolve to the same path. This
made most entries of solib_search_path() literal duplicates. Dedupe
while preserving order.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 4fdeeec24d..6f08940c9c 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -643,7 +643,8 @@ class RecipeModified:
             os.path.join(image.rootfs, base_libdir),
             os.path.join(image.rootfs, libdir)
         ]
-        return so_paths
+        # base_libdir == libdir when usrmerge is in DISTRO_FEATURES (the default), dedupe
+        return list(dict.fromkeys(so_paths))
 
     def solib_search_path_str(self, image):
         """Return a : separated list of paths usable by GDB's set solib-search-path"""
-- 
2.55.0


