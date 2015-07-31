Return-Path: <mcfrisk@kapsi.fi>
X-Greylist: delayed 1205 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 31 Jul 2015 09:20:36 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id EBCF576531
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 09:20:36 +0000 (UTC)
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <mcfrisk@kapsi.fi>)
	id 1ZL6B2-0001bQ-61; Fri, 31 Jul 2015 12:00:28 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.80)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ZL6B1-0006kU-VV; Fri, 31 Jul 2015 12:00:27 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jul 2015 12:00:15 +0300
Message-Id: <1438333215-1593-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 1.7.10.4
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH] sanity.bbclass: check SSTATE_DIR, DL_DIR and *MIRROR for broken symlinks
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
X-List-Received-Date: Fri, 31 Jul 2015 09:20:37 -0000

This change makes broken symlinks stand out clearly instead of bitbake
failing with odd error messages. Tested locally with broken symlink
as SSTATE_DIR, DL_DIR and SSTATE_MIRROR.

Change-Id: I2e92702237ab3bdb897d0bdefcf33480aabbc288
Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/classes/sanity.bbclass | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 5be5efb..45ca992 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -253,6 +253,12 @@ def check_not_nfs(path, name):
         return "The %s: %s can't be located on nfs.\n" % (name, path)
     return ""
 
+# Check that path isn't a broken symlink
+def check_symlink(lnk):
+    if os.path.islink(lnk) and not os.path.exists(lnk):
+       return False
+    return True
+
 def check_connectivity(d):
     # URI's to check can be set in the CONNECTIVITY_CHECK_URIS variable
     # using the same syntax as for SRC_URI. If the variable is not set
@@ -532,6 +538,8 @@ def check_sanity_sstate_dir_change(sstate_dir, data):
     # Check that SSTATE_DIR isn't on a filesystem with limited filename length (eg. eCryptFS)
     testmsg = ""
     if sstate_dir != "":
+        if not check_symlink(sstate_dir):
+            raise_sanity_error("SSTATE_DIR %s is a broken symlink." % sstate_dir, data)
         testmsg = check_create_long_filename(sstate_dir, "SSTATE_DIR")
         # If we don't have permissions to SSTATE_DIR, suggest the user set it as an SSTATE_MIRRORS
         try:
@@ -695,6 +703,8 @@ def check_sanity_everybuild(status, d):
         status.addresult("DL_DIR is not set. Your environment is misconfigured, check that DL_DIR is set, and if the directory exists, that it is writable. \n")
     if os.path.exists(dldir) and not os.access(dldir, os.W_OK):
         status.addresult("DL_DIR: %s exists but you do not appear to have write access to it. \n" % dldir)
+    if not check_symlink(dldir):
+        status.addresult("DL_DIR: %s is a broken symlink." % dldir)
 
     # Check that the MACHINE is valid, if it is set
     machinevalid = True
@@ -788,8 +798,19 @@ def check_sanity_everybuild(status, d):
                 bb.warn('Invalid protocol in %s: %s' % (mirror_var, mirror_entry))
                 continue
 
-            if mirror.startswith('file://') and not mirror.startswith('file:///'):
-                bb.warn('Invalid file url in %s: %s, must be absolute path (file:///)' % (mirror_var, mirror_entry))
+            if mirror.startswith('file://'):
+                if not mirror.startswith('file:///'):
+                    bb.warn('Invalid file url in %s: %s, must be absolute path (file:///)' % (mirror_var, mirror_entry))
+                import urlparse
+                if not check_symlink(urlparse.urlparse(mirror).path):
+                    raise_sanity_error("Mirror %s is a broken symlink." % mirror_entry, d)
+                # SSTATE_MIRROR ends with a /PATH string
+                if mirror.endswith('/PATH'):
+                    # remove /PATH$ from SSTATE_MIRROR to get a working
+                    # base directory path
+                    mirror_base = urlparse.urlparse(mirror[:-1*len('/PATH')]).path
+                    if not check_symlink(mirror_base):
+                        raise_sanity_error("State mirror %s is a broken symlink." % mirror_base, d)
 
     # Check that TMPDIR hasn't changed location since the last time we were run
     tmpdir = d.getVar('TMPDIR', True)
-- 
2.4.6


