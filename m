Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 22BE773243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 14:13:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jan 2016 06:13:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,350,1449561600"; d="scan'208";a="868951771"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 26 Jan 2016 06:13:26 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2016 16:13:24 +0200
Message-Id: <1453817605-19259-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1453817605-19259-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1453817605-19259-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/2] externalsrc.bbclas: remove nostamp from do_configure
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
X-List-Received-Date: Tue, 26 Jan 2016 14:13:53 -0000

Be a bit more intelligent than mindlessly re-compiling every time.
Instead of using 'nostamp' flag for do_compile add the whole source tree
as 'file-checksums' flag. This way, do_compile is only re-run if
something in the source tree content changes. Hidden files and
directories in the source tree root are ignored by the glob currently
used. This has the advantage of automatically ignoring .git directory,
for example.

This does not work perfectly, though, as many packages are built under
${S} which effectively changes the source tree causing some unwanted
re-compilations.  However, if do_compile of the recipe does not produce
new/different artefacts on every run (as commonly is and should be the
case) the re-compilation loop stops. Thus, you should usually see only
one re-compilation (if any) after which the source tree is "stabilized"
and no more re-compilations happen.

During the first bitbake run preparing of the task runqueue may take
much longer because all the files in the source tree are hashed.
Subsequent builds are not significantly slower because (most) file
hashes are found from the cache.

[YOCTO #8853]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/externalsrc.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index f7ed66d..fe4963d 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -83,8 +83,7 @@ python () {
 
         d.prependVarFlag('do_compile', 'prefuncs', "externalsrc_compile_prefunc ")
 
-        # Ensure compilation happens every time
-        d.setVarFlag('do_compile', 'nostamp', '1')
+        d.setVarFlag('do_compile', 'file-checksums', externalsrc + '/*:True')
 }
 
 python externalsrc_compile_prefunc() {
-- 
2.1.4


