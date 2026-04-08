Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5280710F9964
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 17:14:24 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.111725.1775668334198922982
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 10:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g/OPLaq4;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: zizuzacker@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82c20b9fb15so4658b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 10:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775668333; x=1776273133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hisKIg1OG71lyAFsrcwjNMjFW7MOg4tmjQpGhZvW9JY=;
        b=g/OPLaq49tUsm+R/mTwTBt2x5RBnWxtcfrkJfxArct4Kt99Cr+WCg/fTIi0tQMyvIS
         uKKvMzKN6mPZ6QytPeN2F49tQA9V4aMRnCTuLCwSsiZWtGUjLA/a+/XhUbomhJt50dG2
         czvMUEysELh3Yc3pt6V8jT1wHGIaBRx2bQeljwzBV0psOSZOr8Hw/IKg+3B3dfttRdwu
         mRq94rTeo5atskDJ3uSaXAtcZ+Kd0XHqYrjJchflO1rlhuXBa6/qrQWyUz6/su+Al6bl
         OGxB+o3JjJjIVc/ZChZVcaYwRShPOc8rYfpIvRw8VE5+4E7XMD3Cvn0fG+0e4AHDYkRJ
         w6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775668333; x=1776273133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hisKIg1OG71lyAFsrcwjNMjFW7MOg4tmjQpGhZvW9JY=;
        b=VXzfucvt91WzbkrHwNm2X/Yw68HF/g5Dq7ieWo0Ia2ymqUgYCzhpYXovWyVru+fzmG
         gqtNLfU53syEwePJfHSEW7/JBpQZmZzZDGueRyxFF8XmWloHDr1dFw0+jOg7hW7Q2NsW
         8wtIvwQ4u7+A0LVBEHsWA1vuJiH4qnKq3ZfSP9FP7vJERZz4ECTmF1hm7/GB0EeuI2GQ
         Mga2+mdhxGCKONnSgyU2S0qZ+cLtBbxr9BtzTWBo++99FxB0EtQLIx7CVIbVJs9peInK
         hmTRgOlYg293iTO8BiA08N7xDrDfYflEtyRy6rJKrghlSZuUVhilzUjYX6EdUCbwDDXl
         jT8Q==
X-Gm-Message-State: AOJu0Yxqqm44AlZBxjTdodr/L5WTj7zaTpUrGe42KhM/47gmqF+8DJtS
	arhOItuQYJ8pAl8a/OAYrHkOH+kC8x1O8kS+FnONPWU804gjPyE+9z64TX+aTA==
X-Gm-Gg: AeBDievUYSQNTTfrsYScV/wHODLQun3ju0Jl4Gg2O38R/GcqQk6kc5yHozUT7DhpXim
	OuNxdHge3P6eYuyZo3pvJ9SXCEgj+SYAGy519Gtj9ULYu1JcUHheTs476GV1sXdMYTMtMv/iyO6
	X8S/utsRYGBpZ1QfqBELEq97Nf0kWCvPkT279pdqj7/hNC9Kh/6fcxIYTCLokc80qGUw0YalsXe
	WX4FTfQxKuQThofEU+a02yUgMMT4L3VVzD0vqqoJysAte5w/qWEeHr6QdzgWlYuvF1vyM/Kpq6C
	mzs6Zz/DJw/KAy6KVXBBEGR6kaxjxdON49NkDDW+YdnWKqXACw22+DBR8+E/jdajpNcBKiHn1vP
	YPoXeWtO+5TLvBSo6y+ODCz5weVwpzpiZJGp7Rksj0EtsC9qyqxTifV0BncUToe0OdW/PlgdAUZ
	yLtFGy7DOh3a9GOrX/yqh0aObkafpyvFpsKmG7RpM2BmJ6Tg==
X-Received: by 2002:a05:6a20:958f:b0:39b:d9f1:6cff with SMTP id adf61e73a8af0-39fc8337001mr594671637.47.1775668332901;
        Wed, 08 Apr 2026 10:12:12 -0700 (PDT)
Received: from localhost.localdomain ([42.112.63.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c747fdsm21943538b3a.50.2026.04.08.10.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:12:12 -0700 (PDT)
From: "Zk47T" <zizuzacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: zizuzacker@gmail.com
Subject: [PATCH] oe-pkgdata-util: improve lookup-pkg error for RPROVIDES packages
Date: Thu,  9 Apr 2026 00:12:07 +0700
Message-Id: <20260408171207.987097-1-zizuzacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 17:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234857

When a package is not found by 'oe-pkgdata-util lookup-pkg', the error
message provides no guidance on what went wrong or where to look.

Improve the error message by checking the runtime-rprovides directory
for the missing package. If the package exists in RPROVIDES:

 - If the provider package was generated, suggest looking up the actual
   package name instead.
 - If the provider package was not generated (e.g. empty package or
   disabled by PACKAGECONFIG), inform the user which recipe provides it
   and that it was not generated.

This helps users quickly identify the correct package name or
understand why a package is missing from their build.

Before:
  ERROR: The following packages could not be found: eglibc

After:
  ERROR: eglibc is in the RPROVIDES of glibc (recipe: glibc), try
  looking up 'glibc' instead

[YOCTO #16083]

Signed-off-by: Zk47T <zizuzacker@gmail.com>
---
 scripts/oe-pkgdata-util | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 44ae40549a..bbfc6a2ddd 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -237,7 +237,27 @@ def lookup_pkg(args):
 
     if len(mappings) < len(pkgs):
         missing = list(set(pkgs) - set(mappings.keys()))
-        logger.error("The following packages could not be found: %s" % ', '.join(missing))
+        for pkg in missing:
+            providepkgpath = os.path.join(args.pkgdata_dir, "runtime-rprovides", pkg)
+            if os.path.exists(providepkgpath):
+                providers = os.listdir(providepkgpath)
+                for provider in providers:
+                    if provider == pkg:
+                        continue
+                    pn = ""
+                    pkgdatafile = os.path.join(args.pkgdata_dir, "runtime", provider)
+                    if os.path.exists(pkgdatafile):
+                        with open(pkgdatafile, 'r') as f:
+                            for line in f:
+                                if line.startswith('PN:'):
+                                    pn = line.split(':', 1)[1].strip()
+                                    break
+                    if os.path.exists(os.path.join(args.pkgdata_dir, "runtime", "%s.packaged" % provider)):
+                        logger.error("%s is in the RPROVIDES of %s (recipe: %s), try looking up '%s' instead" % (pkg, provider, pn or "unknown", provider))
+                    else:
+                        logger.error("%s is in the RPROVIDES of %s (recipe: %s), but the package was not generated (e.g. empty package or disabled PACKAGECONFIG)" % (pkg, provider, pn or "unknown"))
+            else:
+                logger.error("The following packages could not be found: %s" % pkg)
         sys.exit(1)
 
     if args.reverse:
-- 
2.34.1


