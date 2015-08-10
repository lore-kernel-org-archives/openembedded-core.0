Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id 172A976845
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 14:00:46 +0000 (UTC)
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <mcfrisk@kapsi.fi>)
	id 1ZOnd5-0000nr-Sr; Mon, 10 Aug 2015 17:00:43 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.80)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ZOnd5-0008Ae-N9; Mon, 10 Aug 2015 17:00:43 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Aug 2015 17:00:23 +0300
Message-Id: <1439215223-3228-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <20150810114757.GG6102@loska>
References: <20150810114757.GG6102@loska>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Cc: mike.looijmans@topic.nl
Subject: [PATCH v2] sanity.bbclass: check SSTATE_DIR, DL_DIR and *MIRROR for broken symlinks
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
X-List-Received-Date: Mon, 10 Aug 2015 14:00:52 -0000

This change makes broken symlinks stand out clearly instead of bitbake
failing with odd error messages. Tested locally with broken symlink
as SSTATE_DIR, DL_DIR and SSTATE_MIRROR.

Change-Id: I2e92702237ab3bdb897d0bdefcf33480aabbc288
Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/classes/sanity.bbclass | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

v2: Use raise_sanity_error() as suggested by Mike Looijmans
    <mike.looijmans@topic.nl>, move sstate cache symlink check to be
    executed on every bitbake run and not just when sanity versions
    changed.

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 6ad620b..ef90fc8 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -259,6 +259,11 @@ def check_not_nfs(path, name):
         return "The %s: %s can't be located on nfs.\n" % (name, path)
     return ""
 
+# Check that path isn't a broken symlink
+def check_symlink(lnk, data):
+    if os.path.islink(lnk) and not os.path.exists(lnk):
+        raise_sanity_error("%s is a broken symlink." % lnk, data)
+
 def check_connectivity(d):
     # URI's to check can be set in the CONNECTIVITY_CHECK_URIS variable
     # using the same syntax as for SRC_URI. If the variable is not set
@@ -718,6 +723,7 @@ def check_sanity_everybuild(status, d):
         status.addresult("DL_DIR is not set. Your environment is misconfigured, check that DL_DIR is set, and if the directory exists, that it is writable. \n")
     if os.path.exists(dldir) and not os.access(dldir, os.W_OK):
         status.addresult("DL_DIR: %s exists but you do not appear to have write access to it. \n" % dldir)
+    check_symlink(dldir, d)
 
     # Check that the MACHINE is valid, if it is set
     machinevalid = True
@@ -811,8 +817,17 @@ def check_sanity_everybuild(status, d):
                 bb.warn('Invalid protocol in %s: %s' % (mirror_var, mirror_entry))
                 continue
 
-            if mirror.startswith('file://') and not mirror.startswith('file:///'):
-                bb.warn('Invalid file url in %s: %s, must be absolute path (file:///)' % (mirror_var, mirror_entry))
+            if mirror.startswith('file://'):
+                if not mirror.startswith('file:///'):
+                    bb.warn('Invalid file url in %s: %s, must be absolute path (file:///)' % (mirror_var, mirror_entry))
+                import urlparse
+                check_symlink(urlparse.urlparse(mirror).path, d)
+                # SSTATE_MIRROR ends with a /PATH string
+                if mirror.endswith('/PATH'):
+                    # remove /PATH$ from SSTATE_MIRROR to get a working
+                    # base directory path
+                    mirror_base = urlparse.urlparse(mirror[:-1*len('/PATH')]).path
+                    check_symlink(mirror_base, d)
 
     # Check that TMPDIR hasn't changed location since the last time we were run
     tmpdir = d.getVar('TMPDIR', True)
@@ -860,6 +875,8 @@ def check_sanity(sanity_data):
     tmpdir = sanity_data.getVar('TMPDIR', True)
     sstate_dir = sanity_data.getVar('SSTATE_DIR', True)
 
+    check_symlink(sstate_dir, sanity_data)
+
     # Check saved sanity info
     last_sanity_version = 0
     last_tmpdir = ""
-- 
2.4.6


