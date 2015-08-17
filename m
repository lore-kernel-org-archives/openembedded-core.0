Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id F0082766D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 15:16:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 17 Aug 2015 08:16:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,695,1432623600"; d="scan'208";a="785698488"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga002.jf.intel.com with ESMTP; 17 Aug 2015 08:16:18 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Aug 2015 07:10:13 +0000
Message-Id: <c80acaac2c897d8dfe1b4dcd0a6b723032fd8150.1439794714.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1439794714.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1439794714.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1439794714.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1439794714.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v2 2/2] package_deb.bbclass: Allow UTF-8 characters on control files
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
X-List-Received-Date: Mon, 17 Aug 2015 15:16:24 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Allow UTF-8 characters on control files. Also handle an expection
in case of invalid characters (non UTF-8).

[YOCTO #6693]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/classes/package_deb.bbclass | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 9e1ed28..398ceee 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -96,9 +96,8 @@ python do_package_deb () {
         bb.utils.mkdirhier(controldir)
         os.chmod(controldir, 0755)
         try:
-            ctrlfile = open(os.path.join(controldir, 'control'), 'w')
-            # import codecs
-            # ctrlfile = codecs.open("someFile", "w", "utf-8")
+            import codecs
+            ctrlfile = codecs.open(os.path.join(controldir, 'control'), 'w', 'utf-8')
         except OSError:
             bb.utils.unlockfile(lf)
             raise bb.build.FuncFailed("unable to open control file for writing.")
@@ -149,7 +148,7 @@ python do_package_deb () {
                 # Special behavior for description...
                 if 'DESCRIPTION' in fs:
                      summary = localdata.getVar('SUMMARY', True) or localdata.getVar('DESCRIPTION', True) or "."
-                     ctrlfile.write('Description: %s\n' % unicode(summary))
+                     ctrlfile.write('Description: %s\n' % unicode(summary,'utf-8'))
                      description = localdata.getVar('DESCRIPTION', True) or "."
                      description = textwrap.dedent(description).strip()
                      if '\\n' in description:
@@ -158,19 +157,24 @@ python do_package_deb () {
                              # We don't limit the width when manually indent, but we do
                              # need the textwrap.fill() to set the initial_indent and
                              # subsequent_indent, so set a large width
-                             ctrlfile.write('%s\n' % unicode(textwrap.fill(t, width=100000, initial_indent=' ', subsequent_indent=' ')))
+                             ctrlfile.write('%s\n' % unicode(textwrap.fill(t, width=100000, initial_indent=' ', subsequent_indent=' '),'utf-8'))
                      else:
                          # Auto indent
-                         ctrlfile.write('%s\n' % unicode(textwrap.fill(description.strip(), width=74, initial_indent=' ', subsequent_indent=' ')))
+                         ctrlfile.write('%s\n' % unicode(textwrap.fill(description.strip(), width=74, initial_indent=' ', subsequent_indent=' '),'utf-8'))
 
                 else:
-                     ctrlfile.write(unicode(c % tuple(pullData(fs, localdata))))
+                     ctrlfile.write(unicode(c % tuple(pullData(fs, localdata)),'utf-8'))
         except KeyError:
             import sys
             (type, value, traceback) = sys.exc_info()
             bb.utils.unlockfile(lf)
             ctrlfile.close()
             raise bb.build.FuncFailed("Missing field for deb generation: %s" % value)
+        except UnicodeDecodeError:
+            bb.utils.unlockfile(lf)
+            ctrlfile.close()
+            raise bb.build.FuncFailed("Non UTF-8 characters found in one of the fields")
+
         # more fields
 
         custom_fields_chunk = get_package_additional_metadata("deb", localdata)
-- 
1.8.4.5


