Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4905FC55162
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 09:10:38 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7456.1785402633279729310
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 02:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Ktj9+n7o;
 spf=pass (domain: snapchat.com, ip: 209.85.221.50, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1582399f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 02:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1785402631; x=1786007431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ZkIxc15onDTsP5AX302EfJzBd1LP3oxk5yfR18x8qw=;
        b=Ktj9+n7ok1jROBK7NAwdYRanD1R9/JktH1xNRayjny2mzCmiRY8DIqEWYgTDsgCLGo
         TJ85r+u+03OQUFbsNAJd5pqs+8F+YFcbIEZwu9VFMuV4D0K2cJ/OAldjK2fVJS4wY+bS
         XT6PtwyETUKc42lIHg/CUIxwOP3R4JgS/1+UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785402631; x=1786007431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ZkIxc15onDTsP5AX302EfJzBd1LP3oxk5yfR18x8qw=;
        b=ru6AcDCZ9LoJ+D7KgSph96cLiBTRlf2ZUiYju20QFJYWI5q9HPDYwYyL+UuQPZra+r
         yJiqvOS1Jm7t0HEDCIeV0apfpOs4EYY857XSVhIFKv6WDdw6HX3c7zCsn2J/PUjWs/Ua
         ZNrO3ugHBa5oh/OoD09uIc8MDwX2ZUKv1QRzLRVVFkZpUG0iuvb9olRNl7A+Be7hl3Q1
         S04Tw0/OnOV24gEmtT/q1UB7or93ZwXwlIt0imdAfxjcKreOsTDoPvpkuxGh6k7P7rzf
         yYL7DaI2KIXurI8lCEjIpNcXl5C1r7tTnGErBiZy+xShcau2dVg5bbPRxwXMnslJTn+l
         L2qw==
X-Gm-Message-State: AOJu0Yxu7qedvH3ehZ6c0LjwIA443rv+MQD7YtORkPNDlV0EbJe84yP0
	M2NsHK0xPfB0OYwUcgyvXVXWXCKhlfmCwguA2RwFBJ9wVJLPqZtXlD/kxAShcl93VW9igQa9Svm
	ZSlAuLlg=
X-Gm-Gg: AR+sD11W0vd9dKm8L/0SOrK2MKkN9DvWBcWVf7vOwwZcDSbeVdN8+c4DcTUhsJyZuw3
	MLlCxlyLvkY813g5bTWDoCUtVfGr1g7aiElMjcegKjDOEML8yleI4+HTFTswhDVEdX1HhHATITT
	pzdrwsqxMXOtYNn8SY4LPf/fYOOtbexL3MLavWlDiHj2conZyhKFuh5PkO080DlwPQupOMg1XPI
	c1xbAfSSJD1RD5X8XzHbsczfRimXH/zG5rk+OIDlHCNXCciPQ7M9+O4fRO58E16yQM6Zgoxxe5D
	OVAAUEFS+nEndV6mnyIoRB4Jn0eqkcE0jJXIMUnqOe4IwZ44pp2Dc7JUdg9Cj7e4tsWmgTDHRk7
	ZqhVjj4yQkfdvbHzt0JaQq7DGil4X+ORFdfXvghh75QmaBWmvgeQgso1uA42HUN98coBT6BwHFz
	RkRgDpm6SFZBTlz71eEYqrzQVKSnYoJiBtRvb35EZjwgJpTxb4ptPFYctF6YHt5L/w5ysGQeEXq
	NVzs+Ud3c4c3jMqy7DIoMZCjOelsMs+MWFuxnBKGEjW
X-Received: by 2002:a05:6000:41c6:b0:47f:94a8:d6db with SMTP id ffacd0b85a97d-47fc81f6214mr2264264f8f.34.1785402631066;
        Thu, 30 Jul 2026 02:10:31 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc894c994sm4603935f8f.37.2026.07.30.02.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:10:30 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [OE-core][PATCH v2 1/2] package_manager/ipk: skip checksums for unsigned local feeds
Date: Thu, 30 Jul 2026 11:10:16 +0200
Message-ID: <20260730091017.171702-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 09:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242329

From: Etienne Cordonnier <ecordonnier@snap.com>

Computing checksums in the opkg Packages index requires reading every
.ipk file in full.  For a large image with 7000+ packages (including
multi-gigabyte debug packages), this adds 150-300s to every do_rootfs run.

Checksums in the Packages index are only meaningful for signed feeds
(PACKAGE_FEED_SIGN=1): the GPG signature covers the Packages index
which contains the SHA256Sum of each .ipk, forming a chain of trust
that prevents tampered packages being swapped on a remote feed.

For unsigned local file:// feeds the packages are installed directly
from the build host filesystem where there is no tampering risk.  Skip
all checksum generation in that case by passing no --checksum flags to
opkg-make-index (the tool's default behaviour when given no flags).
Pass --force-checksum to opkg so it does not error on the absent
checksum fields.

On a test image with 7000+ packages (including a 2.3 GB debug
package): write_index time reduced from ~180s to ~22s (8x speedup)
when opkg-make-index is configured to produce no checksums by default.

See https://git.openembedded.org/openembedded-core/commit/?id=e462f47489f35902b6972f9837d9adfa542fc796
("Enable sha256 checksums in opkg indexer", 2019) for the original rationale.

AI-Generated: Claude Sonnet 4.6
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/lib/oe/package_manager/ipk/__init__.py | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 344e0852177..93a12fad6a3 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -12,7 +12,7 @@ from oe.package_manager import *
 from oe.package_manager.common_deb_ipk import OpkgDpkgPM
 
 class OpkgIndexer(Indexer):
-    def write_index(self):
+    def write_index(self, build_checksums=True):
         arch_vars = ["ALL_MULTILIB_PACKAGE_ARCHS",
                      "SDK_PACKAGE_ARCHS",
                      ]
@@ -44,8 +44,9 @@ class OpkgIndexer(Indexer):
                 if not os.path.exists(pkgs_file):
                     open(pkgs_file, "w").close()
 
-                index_cmds.add('%s --checksum md5 --checksum sha256 -r %s -p %s -m %s %s' %
-                                  (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir, opkg_index_cmd_extra_params))
+                checksum_args = '--checksum md5 --checksum sha256 ' if build_checksums else ''
+                index_cmds.add('%s %s-r %s -p %s -m %s %s' %
+                                  (opkg_index_cmd, checksum_args, pkgs_file, pkgs_file, pkgs_dir, opkg_index_cmd_extra_params))
 
                 index_sign_files.add(pkgs_file)
 
@@ -103,8 +104,12 @@ class OpkgPM(OpkgDpkgPM):
         self.deploy_dir = oe.path.join(self.d.getVar('WORKDIR'), ipk_repo_workdir)
         self.deploy_lock_file = os.path.join(self.deploy_dir, "deploy.lock")
         self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
+        self.from_feeds = (self.d.getVar('BUILD_IMAGES_FROM_FEEDS') or "") == "1"
+        self._build_checksums = self.from_feeds or self.d.getVar('PACKAGE_FEED_SIGN') == '1'
         self.opkg_args = ['--volatile-cache', '-f', config_file, '-t', self.d.expand('${T}/ipktemp/'), '-o', target_rootfs]
         self.opkg_args.extend(shlex.split(self.d.getVar("OPKG_ARGS")))
+        if not self._build_checksums:
+            self.opkg_args.append('--force-checksum')
 
         if prepare_index:
             create_packages_dir(self.d, self.deploy_dir, d.getVar("DEPLOY_DIR_IPK"), "package_write_ipk", filterbydependencies)
@@ -116,7 +121,6 @@ class OpkgPM(OpkgDpkgPM):
         if not os.path.exists(self.d.expand('${T}/saved')):
             bb.utils.mkdirhier(self.d.expand('${T}/saved'))
 
-        self.from_feeds = (self.d.getVar('BUILD_IMAGES_FROM_FEEDS') or "") == "1"
         if self.from_feeds:
             self._create_custom_config()
         else:
@@ -346,7 +350,7 @@ class OpkgPM(OpkgDpkgPM):
     def write_index(self):
         self.deploy_dir_lock()
 
-        result = self.indexer.write_index()
+        result = self.indexer.write_index(build_checksums=self._build_checksums)
 
         self.deploy_dir_unlock()
 
-- 
2.43.0


