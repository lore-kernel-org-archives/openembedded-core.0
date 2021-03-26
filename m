Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web09.5742.1616717808230304130
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 17:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.168.0.2])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 12Q0GjMo001794
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 19:16:46 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] populate_sdk_ext: Add support for PR service
Date: Thu, 25 Mar 2021 19:16:44 -0500
Message-Id: <20210326001644.55424-2-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210326001644.55424-1-mark.hatle@kernel.crashing.org>
References: <20210326001644.55424-1-mark.hatle@kernel.crashing.org>

From: Mark Hatle <mark.hatle@xilinx.com>

In the classes/populate_sdk_ext.bbclass the system already copies a number
of configurations, such as the hash equivalency data.  However, the PR
service was being handled.

The new code works by checking if PRSERV_HOST is defined, if it is, use
the existing export functions to write out a conf/prserv.inc file into
the eSDK.  On eSDK install, if a conf/prserv.inc file is present we then
import this file into the system.

This mechanism will work if the PRSERV_HOST is local or remote, as it pulls
the necessary data from the server and then imports it to a local database
on eSDK installation.

Note: the conf/prserv.inc file is not deleted at this time.  It was left
for possible debugging purposes, but removing it is something we could decide
to do in the future.

Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/populate_sdk_ext.bbclass | 25 +++++++++++++++++++++++++
 meta/files/ext-sdk-prepare.py         | 17 +++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 14689ec6ac..84232ed9f5 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -375,6 +375,10 @@ python copy_buildsystem () {
             # Map gcc-dependent uninative sstate cache for installer usage
             f.write('SSTATE_MIRRORS += " file://universal/(.*) file://universal-4.9/\\1 file://universal-4.9/(.*) file://universal-4.8/\\1"\n\n')
 
+            if d.getVar("PRSERV_HOST"):
+                # Override this, we now include PR data, so it should only point ot the local database
+                f.write('PRSERV_HOST = "localhost:0"\n\n')
+
             # Allow additional config through sdk-extra.conf
             fn = bb.cookerdata.findConfigFile('sdk-extra.conf', d)
             if fn:
@@ -398,6 +402,27 @@ python copy_buildsystem () {
         bb.utils.mkdirhier(os.path.join(baseoutpath, 'cache'))
         shutil.copyfile(builddir + '/cache/bb_unihashes.dat', baseoutpath + '/cache/bb_unihashes.dat')
 
+    # If PR Service is in use, we need to export this as well
+    bb.note('Do we have a pr database?')
+    if d.getVar("PRSERV_HOST"):
+        bb.note('Writing PR database...')
+        # Based on the code in classes/prexport.bbclass
+        import oe.prservice
+        #dump meta info of tables
+        localdata = d.createCopy()
+        localdata.setVar('PRSERV_DUMPOPT_COL', "1")
+        localdata.setVar('PRSERV_DUMPDIR', os.path.join(baseoutpath, 'conf'))
+        localdata.setVar('PRSERV_DUMPFILE', '${PRSERV_DUMPDIR}/prserv.inc')
+
+        bb.note('PR Database write to %s' % (localdata.getVar('PRSERV_DUMPFILE')))
+
+        retval = oe.prservice.prserv_dump_db(localdata)
+        if not retval:
+            bb.error("prexport_handler: export failed!")
+            return
+        (metainfo, datainfo) = retval
+        oe.prservice.prserv_export_tofile(localdata, metainfo, datainfo, True)
+
     # Use templateconf.cfg file from builddir if exists
     if os.path.exists(builddir + '/conf/templateconf.cfg') and use_custom_templateconf == '1':
         shutil.copyfile(builddir + '/conf/templateconf.cfg', baseoutpath + '/conf/templateconf.cfg')
diff --git a/meta/files/ext-sdk-prepare.py b/meta/files/ext-sdk-prepare.py
index 163d5e9912..d191e5e19c 100644
--- a/meta/files/ext-sdk-prepare.py
+++ b/meta/files/ext-sdk-prepare.py
@@ -44,6 +44,23 @@ def main():
         sdk_targets = []
     else:
         sdk_targets = ' '.join(sys.argv[2:]).split()
+
+    prserv = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'conf', 'prserv.inc')
+    if os.path.isfile(prserv):
+        with open(logfile, 'a') as logf:
+            logf.write('Importing PR data...\n')
+
+            ret = run_command_interruptible('bitbake-prserv-tool import %s' % prserv)
+
+            lastlog = get_last_consolelog()
+            if lastlog:
+                with open(lastlog, 'r') as f:
+                    for line in f:
+                        logf.write(line)
+            if ret:
+                print('ERROR: PR data import failed: error log written to %s' % logfile)
+                return ret
+
     if not sdk_targets:
         # Just do a parse so the cache is primed
         ret = run_command_interruptible('bitbake -p --quiet')
-- 
2.17.1

