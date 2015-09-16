Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0F0B176FD0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 02:04:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8G24F6M007091
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 19:04:15 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 15 Sep 2015 19:04:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Sep 2015 19:04:10 -0700
Message-ID: <44cc6bc3ea2962ab719565bc30927bb5ccdb07bc.1442311946.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1442311946.git.liezhi.yang@windriver.com>
References: <cover.1442311946.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] oe-pkgdata-util: avoid returning skipped packages
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
X-List-Received-Date: Wed, 16 Sep 2015 02:04:18 -0000
Content-Type: text/plain

The skipped packages may be pulled in by another package, for example,
when libc6-dbg is already installed and should be skipped, but it would
be pulled in by libsegfault, this patch fixes the issue.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/oe-pkgdata-util |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index b075775..116cfae 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -60,6 +60,7 @@ def glob(args):
         skipval += "|" + args.exclude
     skipregex = re.compile(skipval)
 
+    skippedpkgs = set()
     mappedpkgs = set()
     with open(args.pkglistfile, 'r') as f:
         for line in f:
@@ -73,6 +74,7 @@ def glob(args):
             # Skip packages for which there is no point applying globs
             if skipregex.search(pkg):
                 logger.debug("%s -> !!" % pkg)
+                skippedpkgs.add(pkg)
                 continue
 
             # Skip packages that already match the globs, so if e.g. a dev package
@@ -84,6 +86,7 @@ def glob(args):
                     already = True
                     break
             if already:
+                skippedpkgs.add(pkg)
                 logger.debug("%s -> !" % pkg)
                 continue
 
@@ -152,7 +155,7 @@ def glob(args):
 
     logger.debug("------")
 
-    print("\n".join(mappedpkgs))
+    print("\n".join(mappedpkgs - skippedpkgs))
 
 def read_value(args):
     # Handle both multiple arguments and multiple values within an arg (old syntax)
-- 
1.7.9.5


