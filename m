Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id A51D6760FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 17:15:37 +0000 (UTC)
Received: by padck2 with SMTP id ck2so63596574pad.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 10:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=aUrF+eNIw5vPBb8YqqjvWLZpB28+lbB+gTEBDsBtZ4c=;
	b=n9qWFdsyJ0BBO8tiljVDnZSEk4xLYuqlorcJ6qr2qregtg46TDuF7QlXDsbta1jdrz
	5WgG0AkkxpLbvXGX29tx7hC1SpRG63GXGO3hH06Zi9znaG6zXP7qwp+rLTEqRCjjfLDA
	UkSeuCvk+Y2TLaqRyA0WOpXie1KscQ/0qPfk/Q9Tpy6+l82QRQ8vRvA0dZnlP55SRvO6
	XqAO61CJAdvTYPAbv9U8uDR+oeFr9ad0mmVoCqJq/9EfmxbqU3qzC5gFXfJlwI/VbI9B
	ylI7xSs8q33Ky6TryJ3GYWhgVHBzGhcq5dI5QHwxXQWXXe8Sex8NPL2SG+JS8JkFeRN6
	jQXQ==
X-Received: by 10.70.95.198 with SMTP id dm6mr31562715pdb.53.1437153337674;
	Fri, 17 Jul 2015 10:15:37 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	nl10sm11832492pdb.38.2015.07.17.10.15.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Jul 2015 10:15:36 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jul 2015 10:16:05 -0700
Message-Id: <927dba1917b9fa5e2d526b0994d959fc8465800c.1437153291.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <910a69c2d626117ec01e2d9dacad04c447999489.1437153291.git.chris_larson@mentor.com>
References: <910a69c2d626117ec01e2d9dacad04c447999489.1437153291.git.chris_larson@mentor.com>
In-Reply-To: <cover.1437153291.git.chris_larson@mentor.com>
References: <cover.1437153291.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/3] recipetool: appendsrcfile: handle S == STAGING_KERNEL_DIR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jul 2015 17:15:37 -0000

From: Christopher Larson <chris_larson@mentor.com>

When determining the path from WORKDIR to the extracted sources, we're using
S, but if S is in work-shared, that's problematic and won't give us good
results, so assume 'git' for that case, warning when appropriate.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/lib/recipetool/append.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index ed4af20..3f2f9a4 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -356,6 +356,10 @@ def appendsrc(args, files, rd):
     for newfile, srcfile in files.iteritems():
         src_destdir = os.path.dirname(srcfile)
         if not args.use_workdir:
+            if rd.getVar('S', True) == rd.getVar('STAGING_KERNEL_DIR', True):
+                srcdir = os.path.join(workdir, 'git')
+                if not bb.data.inherits_class('kernel-yocto', rd):
+                    logger.warn('S == STAGING_KERNEL_DIR and non-kernel-yocto, unable to determine path to srcdir, defaulting to ${WORKDIR}/git')
             src_destdir = os.path.join(os.path.relpath(srcdir, workdir), src_destdir)
         src_destdir = os.path.normpath(src_destdir)
 
-- 
2.2.1


