Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF0AC3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:24:13 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.1405.1746804243523191304
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SeBoeD4p;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so2294542b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746804242; x=1747409042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uBFUgMI3CMXidd0bDfXxsK4EibVzW+KUvzXEr8r4NKU=;
        b=SeBoeD4psk5HhK0Im2L8U1dtjMPZvD0KbKSRhwXpRwewZ5YJHG0gpDbuV6vH7RcGgn
         FjPNJ0rKGGGmKO2U1rmlBoggm5xjjRSYCwuHl5ejWlWnpR7XnKuzr6PxKa2hG8CDQcJG
         OxVerUGd52Ja+cxe6+pW0tFFD/4fnjAhOaFAHv93MOqR+/CWdCU5ybPJ9aUyduvG1WqF
         QrAkDmklA70NbrCx1pjAMEOR2EMjcgt/VL6Ja423DXFxh2648MSZPdNRK3c8xERLXYxM
         XY18iwZ/C1UjubNhW95SfAmRSAGU4OOuSijv2XhAhhgFMvt9JL9QC/h3Jh56v5J9jdAT
         GeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804242; x=1747409042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBFUgMI3CMXidd0bDfXxsK4EibVzW+KUvzXEr8r4NKU=;
        b=dmFTtOwKCOu4bifvB0FC4+8CmfW6jX9LTvJSGyD3ji1oAnYnYezUMC9XFI/qcxnl23
         Ay8nbcliGLtq41NowShlz4pwEtvS1p7i24R7wFSJcIYhxgdXZUH8RITrzJTrXymd/6ug
         BswHUbPm/lAc112RthfJ9bSl9+rTXdj4flRHQxqMNM6p/j7GUOAwfjmpGe6h8idmNCHH
         iJn4tnY6wRgmtiqyt7Rc5GC3XW1TuxcLmXQ3VkU/oMenv8HUyCE0624Xd8lpUW+cd7UO
         5w8nFpsB4YVEI3Ru6Ei8Ts5Vjg2hfXsDlFasxUVkt0DGrrJb0HDtVSGPXuazfHVJwCid
         eF8w==
X-Gm-Message-State: AOJu0Yxp4ka5DprG+bgRIuZcGFmHx57mXeW//WzENA9OnF+X1EaMRHj9
	jh+3hISZmcWxM2dPq0SA09n/b2iBdyvLiMWgM+PxPiKYMKHj5CyU4XsDicdpU/tgnWhMPFaXL7X
	o
X-Gm-Gg: ASbGncuvrlKvleXkbu/KLP2Z00jzi6K4IA5xz1jmPT+IxmT2cLFdwxFCwI/y+YPcimX
	IPdEeQWc/elfZI2nezSTU6vahGFP6ErF/D6tCwnq9uV4eRWZeYWffneWTKv/RcsKHJPkKB2D74h
	RLgbFoLJLv9Y6UyOtNIEZrfhdPaDFpsWZwYaULAYaASyJ/RHbSdDNWM8eRJxHAbbnQvBnUQHEhZ
	wae3sP3L23riMZ5k8wXi8nekWrz8/V5Ic1nUyuomU1oBoej4hpVbh2OJWjtijoWj815WWVRSg6/
	NRLDAbkJT6FAnSPg+oPOxNKLEo9HWNa+
X-Google-Smtp-Source: AGHT+IEIpffr1wP9uAqiwYJmUKblttyLd5wAsJ9DmCjWvi4U/yyoF+/rJwYlHlLdZH3UJBnY/Kh+Aw==
X-Received: by 2002:a05:6a00:c81:b0:730:9801:d3e2 with SMTP id d2e1a72fcca58-7423be6f965mr6202258b3a.8.1746804242341;
        Fri, 09 May 2025 08:24:02 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a108fbsm1848319b3a.115.2025.05.09.08.24.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:24:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 07/17] insane.bbclass: Move test for invalid PACKAGECONFIGs to do_recipe_qa
Date: Fri,  9 May 2025 08:23:23 -0700
Message-ID: <ed0e8f5142bc9c3a5c2fca7068135b2dc11ec3db.1746804035.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746804035.git.steve@sakoman.com>
References: <cover.1746804035.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216215

From: Peter Kjellerstedt <pkj@axis.com>

This makes sure invalid PACKAGECONFIGs are reported also for recipes
that have no do_configure task, e.g., packagegroups.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/insane.bbclass | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index fc4ca84b35..748de050e0 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1418,16 +1418,6 @@ Rerun configure task after fixing this."""
         except subprocess.CalledProcessError:
             pass
 
-    # Check invalid PACKAGECONFIG
-    pkgconfig = (d.getVar("PACKAGECONFIG") or "").split()
-    if pkgconfig:
-        pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
-        for pconfig in pkgconfig:
-            if pconfig not in pkgconfigflags:
-                pn = d.getVar('PN')
-                error_msg = "%s: invalid PACKAGECONFIG: %s" % (pn, pconfig)
-                oe.qa.handle_error("invalid-packageconfig", error_msg, d)
-
     oe.qa.exit_if_errors(d)
 }
 
@@ -1475,10 +1465,20 @@ python do_recipe_qa() {
             if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url) or "//codeload.github.com/" in url:
                 oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol" % pn, d)
 
+    def test_packageconfig(pn, d):
+        pkgconfigs = (d.getVar("PACKAGECONFIG") or "").split()
+        if pkgconfigs:
+            pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
+            for pkgconfig in pkgconfigs:
+                if pkgconfig not in pkgconfigflags:
+                    error_msg = "%s: invalid PACKAGECONFIG: %s" % (pn, pkgconfig)
+                    oe.qa.handle_error("invalid-packageconfig", error_msg, d)
+
     pn = d.getVar('PN')
     test_missing_metadata(pn, d)
     test_missing_maintainer(pn, d)
     test_srcuri(pn, d)
+    test_packageconfig(pn, d)
     oe.qa.exit_if_errors(d)
 }
 
-- 
2.43.0


