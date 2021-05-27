Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.655.1622139521281260523
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 11:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rcGjCZ/H;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id j75so1642414oih.10
        for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 11:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ewOMYqc11ANIlcb0LeWzKlvBiGzzSQtRG7kSkEUZoQ4=;
        b=rcGjCZ/HJvSEN5X+9N2lvY20izVIuhq9eUHpMWaCLmFIMkTQbDCF21uquYDML+TsFX
         rw+f86d9hj2R2fLv+1h80DhWz6nVc7NA5ht6Q69zrOlfgAmptbNYY0HQp/NOvPdpJK//
         WiBivNDLeXVIphPLg+3TXYryW0Kfw+9B3vXOPjS7O4Jy/skMnynVjlgUbfg7m3MtEvYz
         7Hc38R9iI6CeOabSKWSimzIZm2kD2ZOATddD+7JH1v1DmZd6VKq3FsMDVBkwJRV9QLOL
         zkynEN4/Q9p8UiVLHLhiyCpukKLIr0MZ3DgQHew8VgPHd5eTVlk112Qvh0hm83WkoIec
         TrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ewOMYqc11ANIlcb0LeWzKlvBiGzzSQtRG7kSkEUZoQ4=;
        b=UierXzBArLl0YVecnoZ17vUHEuxaqrO14tdS3T71+6puB7bNrdRLvX9iZUIPWpJ8ds
         T9zhnmlePA+d27t4CtbKUJ0oze2hJ6uwQRUHTzVKMd0WIhfYSz8G/ialUPP8/WUX5auU
         xx6pZ8NVREDZ0g/xseiJDV2XbJ11i2l/1amvwYgCEvugMOrpMt7lNJsmN0Tr5GWx3YGd
         dQMtHlOLZtQloISyyaxnZPleFFNiG1UoEtNShjYrTkgIxZzuGa0mAGZkxBUHnYe57SNO
         4kLH6WWjKbPCbpmBzn34nurkk6YWaCVWs19rbixlkMrdPL3gBJuMVvf5UZ/FmH8fFtZ6
         xGUQ==
X-Gm-Message-State: AOAM531WMxc7E7FZ0Zz40xAjMUmKF3Tb7oC26BXjoh0dHXQiEb1oTS+t
	c/Zydic4DJ+Mqxe4FVG9XmZZYh3g6R0=
X-Google-Smtp-Source: ABdhPJz4jR6OtocVFZ8xBTm9gWd1lBsNzAYyfAaywY6zw/sCnS94MmBbZz+iou2/Sns8OZlYnqd+XA==
X-Received: by 2002:a05:6808:d4:: with SMTP id t20mr6236507oic.146.1622139520267;
        Thu, 27 May 2021 11:18:40 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id h2sm563061oop.47.2021.05.27.11.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 11:18:39 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/buildhistory: Add option to strip path prefix
Date: Thu, 27 May 2021 13:18:35 -0500
Message-Id: <20210527181835.35921-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds an option to strip a prefix from the paths reported in
buildhistory. This makes it easier to compare task signatures in the
build history when the builds were done from different directories.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/buildhistory.bbclass |  3 ++-
 meta/lib/oe/sstatesig.py          | 15 +++++++++++++--
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 059de36a5d..55b12d7893 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -43,6 +43,7 @@ BUILDHISTORY_COMMIT ?= "1"
 BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 BUILDHISTORY_PUSH_REPO ?= ""
 BUILDHISTORY_TAG ?= "build"
+BUILDHISTORY_PATH_PREFIX_STRIP ?= ""
 
 SSTATEPOSTINSTFUNCS_append = " buildhistory_emit_pkghistory"
 # We want to avoid influencing the signatures of sstate tasks - first the function itself:
@@ -697,7 +698,7 @@ python buildhistory_write_sigs() {
     if hasattr(bb.parse.siggen, 'dump_siglist'):
         taskoutdir = os.path.join(d.getVar('BUILDHISTORY_DIR'), 'task')
         bb.utils.mkdirhier(taskoutdir)
-        bb.parse.siggen.dump_siglist(os.path.join(taskoutdir, 'tasksigs.txt'))
+        bb.parse.siggen.dump_siglist(os.path.join(taskoutdir, 'tasksigs.txt'), d.getVar("BUILDHISTORY_PATH_PREFIX_STRIP"))
 }
 
 def buildhistory_get_build_id(d):
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index e86a09b332..47f3ca4efb 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -248,13 +248,24 @@ class SignatureGeneratorOEBasicHashMixIn(object):
                 f.write('    "\n')
             f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' % (self.machine, " ".join(l)))
 
-    def dump_siglist(self, sigfile):
+    def dump_siglist(self, sigfile, path_prefix_strip=None):
+        def strip_fn(fn):
+            nonlocal path_prefix_strip
+            if not path_prefix_strip:
+                return fn
+
+            fn_exp = fn.split(":")
+            if fn_exp[-1].startswith(path_prefix_strip):
+                fn_exp[-1] = fn_exp[-1][len(path_prefix_strip):]
+
+            return ":".join(fn_exp)
+
         with open(sigfile, "w") as f:
             tasks = []
             for taskitem in self.taskhash:
                 (fn, task) = taskitem.rsplit(":", 1)
                 pn = self.lockedpnmap[fn]
-                tasks.append((pn, task, fn, self.taskhash[taskitem]))
+                tasks.append((pn, task, strip_fn(fn), self.taskhash[taskitem]))
             for (pn, task, fn, taskhash) in sorted(tasks):
                 f.write('%s:%s %s %s\n' % (pn, task, fn, taskhash))
 
-- 
2.31.1

