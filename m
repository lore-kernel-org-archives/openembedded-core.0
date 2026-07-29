Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359D1C53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 15:30:04 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14288.1785338997797416565
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 08:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=EnORI4mX;
 spf=pass (domain: snapchat.com, ip: 209.85.215.171, mailfrom: ecordonnier@snapchat.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-caf707e3a70so1631613a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 08:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1785338997; x=1785943797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JUDOeBarzDsrvunyNcTTnIjhcvvu8H2rohGzo0Mzltc=;
        b=EnORI4mXBSibW4Zo0xTPI1dLVHNFC7lLcJFhPjGWPBM7Sqa4SUbTYLPtWC18gllP0U
         M3hGpKCpXtc6arhYHrjLITqBDbvbIfqdn3frLrh9nApbQS/hAkpgqWHO59l1XBr2DPV+
         aSubZAwMI9se606RI1SEdBok8I+2CQSKtcC2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338997; x=1785943797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JUDOeBarzDsrvunyNcTTnIjhcvvu8H2rohGzo0Mzltc=;
        b=b8Rg0uI8T1ETyEFURRLLImMqVYF/WWMkc60I6n8d6/LqJmXGpGS0vYiPrPmoWpTnTr
         KXlA+tw39bmyIH22Z5etC8Ja5tKt9ZeP83dwP86wRHCZmiYesbEAU3B05WKdZAfSSN5C
         sRrs6Gj7xMP9abLlEl3qpu0ZafF28daXqgH0oZyzGCNlACQ55GEmQqbXGTht91QOPDo8
         sZ2/PLEqOPKcgYCYEg5KLzpfYKzPrvHW/j2OIIaKziHQxCcihUFsd8n0R6nLhEOHJr0N
         Xr7aAT8eFbREELpGxa8F8N1i4lzmczZ3qZwUG1vNsRV6tjERDRzOfi6kT2CW7vSrF2qJ
         jTnQ==
X-Gm-Message-State: AOJu0YxZguXbGVb8+hUbVxiZUXSdFII80ReEw/lhwmbunSNpb06MKHS4
	W/z4R8cRF3e1KPR+pHUdiVriuJ73JWVsSLMU9/9G1A2qbJoYFwzDngB2ObWV93LEkUpMQqM8FPb
	yPpmGeWA=
X-Gm-Gg: AR+sD11SMBsSKKS8lnRACjlnoyFZ5N0mZK4ciT+JasE7aBOevovf40neEQ2f8bnS9jX
	qkeY8cO0/HRo/InWAgdf4u9kaBe+JV+9uE97kjxPDXxyifCy18wiFQyuZg6xu5cJB5LNINJby55
	nI4GSqhB8QiL9uJtUC+pRwAXpvEtlUd6zf+MKHh1CWTGAg0SD2UNM4LxKdjsJMvcdm57wJ5Crm+
	vZOzw7bw3U2gC6DZhj6ONSq9ZrL/hXqh7IjywT5GaywPA4OeET6T3rhDo2s8faogswjaqd+3/8G
	w2aViao2YC7iUHOeH2CLzmwov9BPjgNALbJq8Vsaif3HTXzt4AAv2E/O3PTN32NdtLUxGvyY6HC
	VdHgGgBZxlz7MoLwChdOxfrd6nR5Qhiu7O2zM/f6432pXkLPjG6/9t1P7mED45iE/m2xKWFngsm
	/+8EH8/JfNh2RJQWGBr3yNHslzpuLWQCXajmXUKxHF7k9t9O6av1tp/4TqsTMUKHu1WZGouQfQ/
	P4l1dbbiJQlENrUq5JbrcKuo97uiC+A6w==
X-Received: by 2002:a05:6a20:6a0c:b0:3ba:d7b0:fcac with SMTP id adf61e73a8af0-3c8e45ceedamr3177564637.5.1785338996771;
        Wed, 29 Jul 2026 08:29:56 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72735084sm10409030c88.12.2026.07.29.08.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:29:56 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH 1/2] package_manager/ipk: skip checksums for unsigned local feeds
Date: Wed, 29 Jul 2026 17:29:30 +0200
Message-ID: <20260729152931.1347887-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 15:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242274

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
index 344e0852177..6c0b896a086 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -12,7 +12,7 @@ from oe.package_manager import *
 from oe.package_manager.common_deb_ipk import OpkgDpkgPM
 
 class OpkgIndexer(Indexer):
-    def write_index(self):
+    def write_index(self, skip_checksums=False):
         arch_vars = ["ALL_MULTILIB_PACKAGE_ARCHS",
                      "SDK_PACKAGE_ARCHS",
                      ]
@@ -44,8 +44,9 @@ class OpkgIndexer(Indexer):
                 if not os.path.exists(pkgs_file):
                     open(pkgs_file, "w").close()
 
-                index_cmds.add('%s --checksum md5 --checksum sha256 -r %s -p %s -m %s %s' %
-                                  (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir, opkg_index_cmd_extra_params))
+                checksum_args = '' if skip_checksums else '--checksum md5 --checksum sha256 '
+                index_cmds.add('%s %s-r %s -p %s -m %s %s' %
+                                  (opkg_index_cmd, checksum_args, pkgs_file, pkgs_file, pkgs_dir, opkg_index_cmd_extra_params))
 
                 index_sign_files.add(pkgs_file)
 
@@ -103,8 +104,12 @@ class OpkgPM(OpkgDpkgPM):
         self.deploy_dir = oe.path.join(self.d.getVar('WORKDIR'), ipk_repo_workdir)
         self.deploy_lock_file = os.path.join(self.deploy_dir, "deploy.lock")
         self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
+        self.from_feeds = (self.d.getVar('BUILD_IMAGES_FROM_FEEDS') or "") == "1"
+        self._skip_checksums = self.d.getVar('PACKAGE_FEED_SIGN') != '1' and not self.from_feeds
         self.opkg_args = ['--volatile-cache', '-f', config_file, '-t', self.d.expand('${T}/ipktemp/'), '-o', target_rootfs]
         self.opkg_args.extend(shlex.split(self.d.getVar("OPKG_ARGS")))
+        if self._skip_checksums:
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
+        result = self.indexer.write_index(skip_checksums=self._skip_checksums)
 
         self.deploy_dir_unlock()
 
-- 
2.43.0


