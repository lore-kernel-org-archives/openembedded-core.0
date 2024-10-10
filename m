Return-Path: <preid@electromag.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15BCCCF07A6
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 05:25:47 +0000 (UTC)
Received: from anchovy3.45ru.net.au (anchovy3.45ru.net.au [203.30.46.155])
 by mx.groups.io with SMTP id smtpd.web10.36627.1728537943384824963
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 22:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: electromag.com.au, ip: 203.30.46.155, mailfrom: preid@electromag.com.au)
Received: (qmail 28015 invoked by uid 5089); 10 Oct 2024 05:25:41 -0000
Received: by simscan 1.2.0 ppid: 27815, pid: 27819, t: 0.6220s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950 spam: 3.1.4
X-RBL: $rbltext
Received: from unknown (HELO PR-7680.localdomain) (preid@electromag.com.au@144.6.137.188)
  by anchovy2.45ru.net.au with ESMTPA; 10 Oct 2024 05:25:40 -0000
Received: by PR-7680.localdomain (Postfix, from userid 1000)
	id B9F421274; Thu, 10 Oct 2024 13:25:44 +0800 (AWST)
From: Phil Reid <preid@electromag.com.au>
To: openembedded-core@lists.openembedded.org
Cc: Phil Reid <preid@electromag.com.au>
Subject: [OE-core] [PATCH] archiver.bbclass: Fix archiver interaction with kernel recipes
Date: Thu, 10 Oct 2024 13:25:29 +0800
Message-ID: <20241010052529.18502-1-preid@electromag.com.au>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 05:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205376

Changes to the logic of is_work_shared where made in
commit: 5fbb4ca8da4f4f1ea426275c45634802dcb5a575
"archiver.bbclass: Improve work-shared checking"

The resuled in a change of the logic (simplifed here) from:
  inherits(gcc-source) or inherits(kernel) or (inherits(kernelsrc) and srcin(work-shared))
to just
  srcin(work-shared)

With INHERIT += "archiver" in the local.conf and a kernel recipe that uses
KERNEL_PACKAGE_NAME. When KERNEL_PACKAGE_NAME is defined the kernel
source is not placed into work-shared, but the archiver ends up
deleting the source folder in the work dir, and the build subsequently fails.

Restore the previous logic while also mainting the referenced commits intent
to consider all recipes that use work-shared. Logic is now
  inherits(gcc-source) or inherits(kernel) or srcin(work-shared)

Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 meta/classes/archiver.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 9d286224d6..2112b696ce 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -472,9 +472,12 @@ def create_diff_gz(d, src_orig, src, ar_outdir):
         os.chdir(cwd)
 
 def is_work_shared(d):
+    pn = d.getVar('PN')
     sharedworkdir = os.path.join(d.getVar('TMPDIR'), 'work-shared')
     sourcedir = os.path.realpath(d.getVar('S'))
-    return sourcedir.startswith(sharedworkdir)
+    return sourcedir.startswith(sharedworkdir) or \
+      pn.startswith('gcc-source') or bb.data.inherits_class('kernel', d)
+
 
 # Run do_unpack and do_patch
 python do_unpack_and_patch() {
-- 
2.34.1


