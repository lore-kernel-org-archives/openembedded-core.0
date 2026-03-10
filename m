Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10729FD4F32
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 18:41:14 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2601.1773168073592393680
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 11:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PqXScd7B;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-466f00535cfso2326844b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 11:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773168073; x=1773772873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pH0P+1ESZgjWAPDC3epT+SOFN7MIIdYB7o7a9YkSZhs=;
        b=PqXScd7BIMlLSMKeYT/f2bKmJ0ydk9KGJH6SUWec5UWXtaQFk2wfPYkh8EwEqJqChD
         rMeFMqrlXLgSG9O6eONaxlZgtXmCXeFaY9fqR0J3u7H1lZuN4n/fhK4cW34oiS9B0pbS
         LWK6Ng7y8EdV8D6Dl0v+zxu17KPX3C+O9WkeMEIr9kx+OphxwMtPcXQMSoBSk4TzAXna
         s9GAZd8EU8pdaPK703bY1ig++oVd+qsTA4fWODULtRkipKyptvfj8RokFG+TmZn7DWE3
         ueu9hXV71DlQbyTgS6kiL/GnpXYB7SsDTROh0+XQhCoWy24IIhPAGXwg5eWgrEHuNzbq
         LqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773168073; x=1773772873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pH0P+1ESZgjWAPDC3epT+SOFN7MIIdYB7o7a9YkSZhs=;
        b=cPzKaZHTNuat+e1aOAFPpmjqSfAIA+kFxECzTC1NL9wuIWOX+uq6tHMfiRYs/HstnM
         ubr0pAVQvAKltm5L8xFxqAovPG9aV4aqb8FteOwnGVpgThPWJKPTG32fjcLzr9VSZRcF
         kt3EZjHs9twdG/f1+NqHfzQu/4XQGpRYh3m9bRjVzRDVpY9oZIiWpIAEZRnBkOwyd0Xh
         riaznLk2sLfXyCQR+OgUbXGrmlTV6jN44qxteW8DUtEXbygHxmCmlbWBcanF0ytRewK1
         zibZTU3HhU179Yvo6CRlimuPS6Rz/jlxsV8r5znBkvpliDr6DQg9HS3VzT+sGYKq3KqG
         LmJw==
X-Gm-Message-State: AOJu0YzwKG1EhZmtY5teUIuPvAt1n0I8tNlbKR+g5iTCnzwZYMwWip/0
	znLCT+GaOBSSMzPu8o2SDRLzsuVDGO0ma7fDM62yXEInzLkTtHFh87zI6L5SXw==
X-Gm-Gg: ATEYQzz8v1mRQ0SDSjv9GXhWwJ55I4KbXdPSacD08rVrTJgoK7DgyP1MPasDZd1ZlR5
	pwVedT3TZGUNFHm5xn1xAUi2pjzLMyuPPmdHVYAXIdYPmK/Nta7oROlbxeq+eLYFon3NltvXy5u
	WNxPN1iHeoo/Tu7cgptRsYCReMZ7qrTUgZK+dKPRXYBIhjv9T14Qs6kBV49Y2awmCvue65Dec0T
	FmUnpHTXD7QDo6aQPZNwkmKQbHah49ivpU7b++vh2E9rv7txZzfJ+l32c/SH9K351gM/Uf8fbCw
	kJXD5zcQ23dg8W4d0sfGVfwjlYD8hGrvRSYoNZ5Trp+w+FRtS6gDzj2hxhF4RNaea/aaYEB04iU
	B1Nk2nd0CvAB0wYygU5IveXbxT8pq9s/idyfRocM5QM8CKMSWDmnBIH9rICD8c8GoLwOMmTfPNk
	qkdjYS+bRXO5BpF3mbwi3F
X-Received: by 2002:a05:6808:4fd4:b0:467:272e:87d with SMTP id 5614622812f47-467272e1177mr1150928b6e.14.1773168072590;
        Tue, 10 Mar 2026 11:41:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::9891])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4671d2a7ebfsm2444524b6e.20.2026.03.10.11.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:41:12 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 11/15] spdx: Remove fatal errors for missing providers
Date: Tue, 10 Mar 2026 12:38:31 -0600
Message-ID: <20260310184058.533343-12-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184058.533343-1-JPEWhacker@gmail.com>
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 18:41:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232822

When creating images and SDKs, do not error on missing providers. This
allows recipes to use the `nospdx` inherit to prevent SPDX from being
generated, but not result in an error when assembling the final image.

Note that runtime packages generation already ignored missing
providers, so this is changing image and SDK generation to match

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 3 ++-
 meta/lib/oe/spdx30_tasks.py          | 8 +-------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 3288cdf75a..aa39208eae 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -858,7 +858,8 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
     if packages:
         for name in sorted(packages.keys()):
             if name not in providers:
-                bb.fatal("Unable to find SPDX provider for '%s'" % name)
+                bb.note("Unable to find SPDX provider for '%s'" % name)
+                continue
 
             pkg_name, pkg_hashfn = providers[name]
 
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 887fac813a..ba15d74278 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1251,11 +1251,10 @@ def collect_build_package_inputs(d, objset, build, packages, files_by_hash=None)
     providers = oe.spdx_common.collect_package_providers(d)
 
     build_deps = set()
-    missing_providers = set()
 
     for name in sorted(packages.keys()):
         if name not in providers:
-            missing_providers.add(name)
+            bb.note(f"Unable to find SPDX provider for '{name}'")
             continue
 
         pkg_name, pkg_hashfn = providers[name]
@@ -1274,11 +1273,6 @@ def collect_build_package_inputs(d, objset, build, packages, files_by_hash=None)
             for h, f in pkg_objset.by_sha256_hash.items():
                 files_by_hash.setdefault(h, set()).update(f)
 
-    if missing_providers:
-        bb.fatal(
-            f"Unable to find SPDX provider(s) for: {', '.join(sorted(missing_providers))}"
-        )
-
     if build_deps:
         objset.new_scoped_relationship(
             [build],
-- 
2.53.0


