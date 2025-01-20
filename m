Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED71CC0218F
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 14:00:13 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.35715.1737377274222242717
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 04:47:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QqNKDdvw;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: arturkow2000@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401c52000fso4263849e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 04:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737377272; x=1737982072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7dTj6CJeZyBw1KdAvoV2fYXS6oH4jw2N1nAJElvGwo=;
        b=QqNKDdvwJzYukWmWdq3Yzpua5kXTMwUzV/qrudCDs9pwv4M2KUm77T2SpWEQ7kYAe3
         C2vInxGNhz2KLuq+6beI/9BjbBsDvWrMww+2l7rF5fVLX2k+LsTZ1oxE0hGACX+3gVkW
         cUHO0l+pX0S74lOcJz7saHHqR+yEXfIavFk8G5uhMZqc7/p+91v4/u+vvE+7wvrFe85B
         sGYHi/MsSGBIDhrDLwDeBgdbxJK+lhOBFGlsT0L/pGkJsuT18Rn9HV/1AChe+s5hRKWz
         pvKKD1ylpYujcoesbyOzSXg+JUciEXZCxlcF6OlP75rRo9v93sPMqCK3t5VxrTBV7UcL
         zQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737377272; x=1737982072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7dTj6CJeZyBw1KdAvoV2fYXS6oH4jw2N1nAJElvGwo=;
        b=vqdnRWiDJBlf3K5Mwr951qdTjvLnCRHbSyr/FL9F8z8cKsWdhXZsM+/ZLnKg9jsjFQ
         sCpe/DxcQHeWyoZ8L8bBGN3aQ45Ai+BlB9OEfQ4EkyjGhTckix2e0+QzW3lfZkjr7y+2
         i7L/wKlyJxlcl88t6nZKAvw9PSVMgXtBTevh6NmNIeOg3kUuall5U+FBXlSuurKW2WRr
         4eCFmZe5eRNygwkq2ua3HT2waIMEvyj64zmIl+1YQ3LlbaizkwfK1ZszfdOyn3AWo6Ek
         QFql5cJgAuX/LLv7G6DeJ2+gO581NyVyR3xZVFkE0uCKPJvr+g7QJIGvZ3IOFhJGRehu
         NfsA==
X-Gm-Message-State: AOJu0Yyq2jDPF1ZarMIxl1kkP08+HX0FpB2/Q4sDS3GJIs2QWeJy206J
	kLkQL6VprUAVEc9CM1UvUi5ECTnbEm0vS3Ueq7RgOu+JeRlXpxWNdNP+tQ==
X-Gm-Gg: ASbGncvoxonZZqc+r1yinWmjwHIGa8XQ6UR9Xp+oyA4n6aKKw3Cxvb12XXY6PqLjR/K
	yW4/evA22VGqy3UNJBixCD6pOtYuxE/piXZ36hlqxa8BfU4ee6qyW0c9CYuNCUSb1CNYBdQ2guc
	B+KlFo227xGdEX5MAeRUIDbpOLPVG33cazg0yplyLNdS4D/45F63cCH9XF9i0C4zvVzKojI4bBi
	Qjlvc1zTtKcbB01GYPQn3d8FeUTm1inj8uItrdlfycNtKRp76/RYI5Lq3UlX6QwQoLmj/NDBQpq
	tw==
X-Google-Smtp-Source: AGHT+IGEPHa3rR6XoZQMxe7nhl0of54Hlo7NCvD//exwWf7V2cBe3hrsCZvhf9CWemOU6d3bz17XhA==
X-Received: by 2002:a05:6512:3e03:b0:541:1c49:26a with SMTP id 2adb3069b0e04-5439c2875fdmr5721177e87.43.1737377271809;
        Mon, 20 Jan 2025 04:47:51 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:23ed:c831:8228:ebaa])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0742csm1307523e87.37.2025.01.20.04.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 04:47:51 -0800 (PST)
From: "Artur Kowalski" <arturkow2000@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH v3 3/8] systemd.bbclass: factor out service lookup logic into separate function
Date: Mon, 20 Jan 2025 13:46:01 +0100
Message-ID: <20250120124605.263817-5-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120124605.263817-2-arturkow2000@gmail.com>
References: <20250120124605.263817-2-arturkow2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 14:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210034

Factor out the logic into systemd_service_path(). This will be needed by
following commits to avoid code duplication.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 meta/classes-recipe/systemd.bbclass | 41 ++++++++++++++++-------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index c167689d2a..14fef2d7a6 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -68,6 +68,28 @@ systemd_populate_packages[vardeps] += "systemd_prerm systemd_postinst"
 systemd_populate_packages[vardepsexclude] += "OVERRIDES"
 
 
+def systemd_service_path(service, searchpaths, d):
+    path_found = ''
+
+    # Deal with adding, for example, 'ifplugd@eth0.service' from
+    # 'ifplugd@.service'
+    base = None
+    at = service.find('@')
+    if at != -1:
+        ext = service.rfind('.')
+        base = service[:at] + '@' + service[ext:]
+
+    for path in searchpaths:
+        if os.path.lexists(oe.path.join(d.getVar("D"), path, service)):
+            path_found = path
+            break
+        elif base is not None:
+            if os.path.exists(oe.path.join(d.getVar("D"), path, base)):
+                path_found = path
+                break
+
+    return path_found, base
+
 python systemd_populate_packages() {
     import re
     import shlex
@@ -158,24 +180,7 @@ python systemd_populate_packages() {
         # scan for all in SYSTEMD_SERVICE[]
         for pkg_systemd in systemd_packages.split():
             for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).split():
-                path_found = ''
-
-                # Deal with adding, for example, 'ifplugd@eth0.service' from
-                # 'ifplugd@.service'
-                base = None
-                at = service.find('@')
-                if at != -1:
-                    ext = service.rfind('.')
-                    base = service[:at] + '@' + service[ext:]
-
-                for path in searchpaths:
-                    if os.path.lexists(oe.path.join(d.getVar("D"), path, service)):
-                        path_found = path
-                        break
-                    elif base is not None:
-                        if os.path.exists(oe.path.join(d.getVar("D"), path, base)):
-                            path_found = path
-                            break
+                path_found, base = systemd_service_path(service, searchpaths, d)
 
                 if path_found != '':
                     systemd_add_files_and_parse(pkg_systemd, path_found, service)
-- 
2.47.1


