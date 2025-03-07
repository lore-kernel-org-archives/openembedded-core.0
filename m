Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87845C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 16:24:30 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.15341.1741364670076581108
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 08:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S9HnRfYO;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2c1c44c3f8dso877469fac.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 08:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741364668; x=1741969468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XQV6Sty9QFeTTgAUrIRNyE7RAW6qZKPAyqwmAg74X8c=;
        b=S9HnRfYOcKFexhiM22J3n94fBIBk3gKEpCKHpqWUmizY6kDBQjeCgwOR+vEdhAaStd
         JpAezu6XzbDamDLRgmwhG/m3blWzsSJF7eJs4q9K5ZuSyf4klyqg0J8/O90d+q1jTNg8
         CaR3VMeLHH4hkqh7Ib4X2ZM9zZPOLtjN7L5165Gu+UuLkLnf7WHBW+GnIyTmTHA6YAax
         uNOhrJ+s/vbzJ9oyHZ3wxLxfp7c3PL+ZrTWUcWbXGS8boJ9ih8eW8Am1H1UGNra1dJyd
         pckN11okNLHtyDObFOdZLRFoXb8OqjsnzG38wk+6lxaS/Rgy4Rf25GrmhOeFWWdTXteb
         mgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364668; x=1741969468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQV6Sty9QFeTTgAUrIRNyE7RAW6qZKPAyqwmAg74X8c=;
        b=mId1V3VbOf5w+jjlUWYU2i9Wm4MD8co3FfTO0Yn2MKzWO5DG5xJLGoIZ5SzOLE6050
         UNA1Ap1TMurZx4moEOv15GqSA/MWtzISSwGLc1BKYRLHSybWV9lKcuezOENNs818+qS1
         W1/17PRcNhKm+ROao7fG8rEgohskIpbviejXUgXe3ChH/JpkmjSkqhumr30P03CR2/dG
         bA38VcEs9u0cWkXpVkXNZ320HljtbZmD58jeZAgzkieeIHlFnwYZIAIPxDBB9S+Pl4zP
         R83TiIMKYLE1Qr3i6kgW4ZVnRl8pGmMNc+xlhp5i98XocyLeaCt/czogI8+pDTlCzvAx
         ESJw==
X-Gm-Message-State: AOJu0YyN2M+tNQRHFaE7/2jn1oetPLIzVgUpzZO/OAXIuiKSBUNJiP6b
	HRkXEp/JIWy3xiOS2ajx1woqtmi/s7JdN+ZkN9le3IyGsYu+biMkmb+YFw==
X-Gm-Gg: ASbGncuk9ZcSXsQH/EiKK7UTRIAdlIml0Vf//j2KiiqyNgirEdfrUL3WKAPrgJX791Z
	IVOzslDwheknhwqEgSEZRCarIYdr+2Xum9miyx2NpmduhGmogFLlgCCQ0MdQQSBTTHd88iGgwjC
	hq3VGth0+Yk10lw/IgmLPY/sCi0jCj5qS0BuSERIi2qNn3ksT9tk9rYW/1BUVtssslrUQx1Xv90
	/AGOI5DUHBKozBfxIO5G+Fm9eI/4Wh57JFaVkyh+NsKJHAf7/DEiLi2s+weCp4KdjFxBJG1c+LJ
	BqkZQaXHmAvmmWJZLDCkxYc67ZoIvDcF5YL1jnAX7CY=
X-Google-Smtp-Source: AGHT+IG7cqfaydO+iAcfAVOScBmz5++zZPrs6x+nQltCoHB7blKKWHSXSLg9krOUfcUOnpWQfmVFvg==
X-Received: by 2002:a05:6870:9726:b0:2bc:8c86:ea31 with SMTP id 586e51a60fabf-2c2610d9f7cmr2158704fac.20.1741364668496;
        Fri, 07 Mar 2025 08:24:28 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::1fad])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72a2dbc3836sm692656a34.58.2025.03.07.08.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:24:27 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] lib: spdx30_tasks: Use Fetch.expanded_urldata()
Date: Fri,  7 Mar 2025 09:24:25 -0700
Message-ID: <20250307162426.1152646-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 16:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212455

Converts the SPDX 3 code to use the Fetch.expanded_urldata() API instead
of iterating over all the SRC_URI entries manually. This will correctly
report additional download URIs (e.g. submodules) in the SPDX data.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx30_tasks.py | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index e20bb0c86f3..f85fbeb0f0a 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -349,12 +349,11 @@ def add_download_files(d, objset):
     urls = d.getVar("SRC_URI").split()
     fetch = bb.fetch2.Fetch(urls, d)
 
-    for download_idx, src_uri in enumerate(urls):
-        fd = fetch.ud[src_uri]
-
+    for download_idx, fd in enumerate(fetch.expanded_urldata()):
         for name in fd.names:
-            file_name = os.path.basename(fetch.localpath(src_uri))
-            if oe.patch.patch_path(src_uri, fetch, "", expand=False):
+            fd.setup_localpath(d)
+            file_name = os.path.basename(fd.localpath)
+            if oe.patch.patch_path(fd.url, fetch, "", expand=False):
                 primary_purpose = oe.spdx30.software_SoftwarePurpose.patch
             else:
                 primary_purpose = oe.spdx30.software_SoftwarePurpose.source
-- 
2.47.1


