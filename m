Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id AF66A6D578
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 12:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lgWkuJl0kpt7NJhET9zasfeBJI2XkLU28C8Xu7aghpo=;
	b=MiQQYf9Q/BDRCb4blyx/NHUvER
	H5fKJtW0wSr/PFI9/rMWoMgbAZhsuguXe8FsRNI/cczjYm0pktfyU+3Cidi00tj+Pef9G5DjUrwHx
	GkTQswBku2A68tZqgbX+CNz6luoBFOOjoZHRdy6XBSYFecXFq1+3umXeoMMUPDrSOJc1LyAetcV7P
	c1kvTTZm5Yr6BZ2uaX2hiMAEE4aJKcMXtkyVVI71Tu72RQknJb5EIZ1VZXYjU900Vhl++o73BkFLb
	2nCDWxTlfcmOyNescYLCqcfBnfEu1G4N5uAhtxlRpt5ri47uQfBoiQ/OZ1rySJcBZI0fRhTNQFz+f
	honbJ1aw==;
Received: from lakka.kapsi.fi ([2001:67c:1be8::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1gSLKX-0004Q5-FG; Thu, 29 Nov 2018 14:22:05 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1gSLKX-0005sX-CH; Thu, 29 Nov 2018 14:22:05 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 14:21:34 +0200
Message-Id: <1543494097-19534-3-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1543494097-19534-1-git-send-email-mikko.rapeli@bmw.de>
References: <1543494097-19534-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:67c:1be8::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Cc: Ulf Magnusson <Ulf.Magnusson@bmw.de>, Michael.Ho@bmw.de
Subject: [PATCH 2/5] bitbake: fetch2/svn: Fix SVN repository concurrent update race
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
X-List-Received-Date: Thu, 29 Nov 2018 12:50:30 -0000

From: Ulf Magnusson <Ulf.Magnusson@bmw.de>

The ${DL_DIR}/svn directory is used by BitBake to keep checked-out SVN
repositories from which tarballs are generated. These repositories were
protected from concurrent update with a lock on the tarballs. However,
the tarballs are specific to the SRCREV and module checked out (many
tarballs can come from the same repository), meaning a repository could
be modified concurrently if two recipes checked out two different
SRCREVs or modules from it in parallel. This caused errors like the
following:

ERROR: Fetcher failure: Fetch command failed with exit code 1, output:
svn: E155004: Run 'svn cleanup' to remove locks (type 'svn help cleanup' for details)
svn: E155004: Working copy '/home/foo/downloads/svn/repo/trunk' locked.
svn: E155004: '/home/foo/downloads/svn/repo/trunk' is already locked.

Fix it by adding a per-repository lock that's independent of the module
and SRCREV.

Signed-off-by: Ulf Magnusson <Ulf.Magnusson@bmw.de>
Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
---
 bitbake/lib/bb/fetch2/svn.py | 64 +++++++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 28 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/svn.py b/bitbake/lib/bb/fetch2/svn.py
index ed70bcf..9dcf3eb 100644
--- a/bitbake/lib/bb/fetch2/svn.py
+++ b/bitbake/lib/bb/fetch2/svn.py
@@ -63,6 +63,9 @@ class Svn(FetchMethod):
         relpath = self._strip_leading_slashes(ud.path)
         ud.pkgdir = os.path.join(svndir, ud.host, relpath)
         ud.moddir = os.path.join(ud.pkgdir, ud.module)
+        # Protects the repository from concurrent updates, e.g. from two
+        # recipes fetching different revisions at the same time
+        ud.svnlock = os.path.join(ud.pkgdir, "svn.lock")
 
         ud.setup_revisions(d)
 
@@ -123,35 +126,40 @@ class Svn(FetchMethod):
 
         logger.debug(2, "Fetch: checking for module directory '" + ud.moddir + "'")
 
-        if os.access(os.path.join(ud.moddir, '.svn'), os.R_OK):
-            svnupdatecmd = self._buildsvncommand(ud, d, "update")
-            logger.info("Update " + ud.url)
-            # We need to attempt to run svn upgrade first in case its an older working format
-            try:
-                runfetchcmd(ud.basecmd + " upgrade", d, workdir=ud.moddir)
-            except FetchError:
-                pass
-            logger.debug(1, "Running %s", svnupdatecmd)
-            bb.fetch2.check_network_access(d, svnupdatecmd, ud.url)
-            runfetchcmd(svnupdatecmd, d, workdir=ud.moddir)
-        else:
-            svnfetchcmd = self._buildsvncommand(ud, d, "fetch")
-            logger.info("Fetch " + ud.url)
-            # check out sources there
-            bb.utils.mkdirhier(ud.pkgdir)
-            logger.debug(1, "Running %s", svnfetchcmd)
-            bb.fetch2.check_network_access(d, svnfetchcmd, ud.url)
-            runfetchcmd(svnfetchcmd, d, workdir=ud.pkgdir)
-
-        scmdata = ud.parm.get("scmdata", "")
-        if scmdata == "keep":
-            tar_flags = ""
-        else:
-            tar_flags = "--exclude='.svn'"
+        lf = bb.utils.lockfile(ud.svnlock)
+
+        try:
+            if os.access(os.path.join(ud.moddir, '.svn'), os.R_OK):
+                svnupdatecmd = self._buildsvncommand(ud, d, "update")
+                logger.info("Update " + ud.url)
+                # We need to attempt to run svn upgrade first in case its an older working format
+                try:
+                    runfetchcmd(ud.basecmd + " upgrade", d, workdir=ud.moddir)
+                except FetchError:
+                    pass
+                logger.debug(1, "Running %s", svnupdatecmd)
+                bb.fetch2.check_network_access(d, svnupdatecmd, ud.url)
+                runfetchcmd(svnupdatecmd, d, workdir=ud.moddir)
+            else:
+                svnfetchcmd = self._buildsvncommand(ud, d, "fetch")
+                logger.info("Fetch " + ud.url)
+                # check out sources there
+                bb.utils.mkdirhier(ud.pkgdir)
+                logger.debug(1, "Running %s", svnfetchcmd)
+                bb.fetch2.check_network_access(d, svnfetchcmd, ud.url)
+                runfetchcmd(svnfetchcmd, d, workdir=ud.pkgdir)
+
+            scmdata = ud.parm.get("scmdata", "")
+            if scmdata == "keep":
+                tar_flags = ""
+            else:
+                tar_flags = "--exclude='.svn'"
 
-        # tar them up to a defined filename
-        runfetchcmd("tar %s -czf %s %s" % (tar_flags, ud.localpath, ud.path_spec), d,
-                    cleanup=[ud.localpath], workdir=ud.pkgdir)
+            # tar them up to a defined filename
+            runfetchcmd("tar %s -czf %s %s" % (tar_flags, ud.localpath, ud.path_spec), d,
+                        cleanup=[ud.localpath], workdir=ud.pkgdir)
+        finally:
+            bb.utils.unlockfile(lf)
 
     def clean(self, ud, d):
         """ Clean SVN specific files and dirs """
-- 
1.9.1


