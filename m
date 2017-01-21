Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 226577721F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2017 14:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0LEZqaT001015; Sat, 21 Jan 2017 14:35:52 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id niBaDCSFZ4jQ; Sat, 21 Jan 2017 14:35:52 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0LEZl5h001007
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 21 Jan 2017 14:35:48 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cUwlf-0000yK-IZ; Sat, 21 Jan 2017 14:35:47 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Jan 2017 14:35:43 +0000
Message-Id: <1485009344-3664-6-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485009344-3664-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1485009344-3664-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 6/7] package_ipk: Clean up pointless exception handling
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
X-List-Received-Date: Sat, 21 Jan 2017 14:35:55 -0000

The exception handling in this function seemed mildly crazy. Python will
given perfectly good or in several cases better information if we let its
standard traceback/exception handling happen. Remove the pointless code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_ipk.bbclass | 67 ++++++++++++++--------------------------
 1 file changed, 24 insertions(+), 43 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 9fb128b..a76b235 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -104,11 +104,7 @@ python do_package_ipk () {
 
         controldir = os.path.join(root, 'CONTROL')
         bb.utils.mkdirhier(controldir)
-        try:
-            ctrlfile = open(os.path.join(controldir, 'control'), 'w')
-        except OSError:
-            bb.utils.unlockfile(lf)
-            bb.fatal("unable to open control file for writing")
+        ctrlfile = open(os.path.join(controldir, 'control'), 'w')
 
         fields = []
         pe = d.getVar('PKGE')
@@ -134,35 +130,28 @@ python do_package_ipk () {
 
         ctrlfile.write("Package: %s\n" % pkgname)
         # check for required fields
-        try:
-            for (c, fs) in fields:
-                for f in fs:
-                    if localdata.getVar(f, False) is None:
-                        raise KeyError(f)
-                # Special behavior for description...
-                if 'DESCRIPTION' in fs:
-                    summary = localdata.getVar('SUMMARY') or localdata.getVar('DESCRIPTION') or "."
-                    ctrlfile.write('Description: %s\n' % summary)
-                    description = localdata.getVar('DESCRIPTION') or "."
-                    description = textwrap.dedent(description).strip()
-                    if '\\n' in description:
-                        # Manually indent
-                        for t in description.split('\\n'):
-                            # We don't limit the width when manually indent, but we do
-                            # need the textwrap.fill() to set the initial_indent and
-                            # subsequent_indent, so set a large width
-                            ctrlfile.write('%s\n' % textwrap.fill(t.strip(), width=100000, initial_indent=' ', subsequent_indent=' '))
-                    else:
-                        # Auto indent
-                        ctrlfile.write('%s\n' % textwrap.fill(description, width=74, initial_indent=' ', subsequent_indent=' '))
+        for (c, fs) in fields:
+            for f in fs:
+                if localdata.getVar(f, False) is None:
+                    raise KeyError(f)
+            # Special behavior for description...
+            if 'DESCRIPTION' in fs:
+                summary = localdata.getVar('SUMMARY') or localdata.getVar('DESCRIPTION') or "."
+                ctrlfile.write('Description: %s\n' % summary)
+                description = localdata.getVar('DESCRIPTION') or "."
+                description = textwrap.dedent(description).strip()
+                if '\\n' in description:
+                    # Manually indent
+                    for t in description.split('\\n'):
+                        # We don't limit the width when manually indent, but we do
+                        # need the textwrap.fill() to set the initial_indent and
+                        # subsequent_indent, so set a large width
+                        ctrlfile.write('%s\n' % textwrap.fill(t.strip(), width=100000, initial_indent=' ', subsequent_indent=' '))
                 else:
-                    ctrlfile.write(c % tuple(pullData(fs, localdata)))
-        except KeyError:
-            import sys
-            (type, value, traceback) = sys.exc_info()
-            ctrlfile.close()
-            bb.utils.unlockfile(lf)
-            bb.fatal("Missing field for ipk generation: %s" % value)
+                    # Auto indent
+                    ctrlfile.write('%s\n' % textwrap.fill(description, width=74, initial_indent=' ', subsequent_indent=' '))
+            else:
+                ctrlfile.write(c % tuple(pullData(fs, localdata)))
         # more fields
 
         custom_fields_chunk = get_package_additional_metadata("ipk", localdata)
@@ -222,22 +211,14 @@ python do_package_ipk () {
             scriptvar = localdata.getVar('pkg_%s' % script)
             if not scriptvar:
                 continue
-            try:
-                scriptfile = open(os.path.join(controldir, script), 'w')
-            except OSError:
-                bb.utils.unlockfile(lf)
-                bb.fatal("unable to open %s script file for writing" % script)
+            scriptfile = open(os.path.join(controldir, script), 'w')
             scriptfile.write(scriptvar)
             scriptfile.close()
             os.chmod(os.path.join(controldir, script), 0o755)
 
         conffiles_str = ' '.join(get_conffiles(pkg, d))
         if conffiles_str:
-            try:
-                conffiles = open(os.path.join(controldir, 'conffiles'), 'w')
-            except OSError:
-                bb.utils.unlockfile(lf)
-                bb.fatal("unable to open conffiles for writing")
+            conffiles = open(os.path.join(controldir, 'conffiles'), 'w')
             for f in conffiles_str.split():
                 if os.path.exists(oe.path.join(root, f)):
                     conffiles.write('%s\n' % f)
-- 
2.7.4


