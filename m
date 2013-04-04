Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1UNffJ-0004dd-Jh
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 10:37:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Apr 2013 01:18:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,405,1363158000"; d="scan'208";a="289208043"
Received: from adinu-vostro-460.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 04 Apr 2013 01:19:46 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2013 11:20:34 +0300
Message-Id: <1365063634-1766-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V3] Add file information to package information window
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Apr 2013 08:37:02 -0000

Removed the package files parsing routine from the
packageinfo.bbclass file and added it to the
package.bbclass file.

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 meta/classes/package.bbclass     |   12 ++++++++++++
 meta/classes/packageinfo.bbclass |   20 --------------------
 2 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 3479947..e859a65 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1130,6 +1130,15 @@ python emit_pkgdata() {
     workdir = d.getVar('WORKDIR', True)
 
     for pkg in packages.split():
+        items = {}
+        for files_list in pkgfiles[pkg]:
+             item_name = os.path.basename(files_list)
+             item_path = files_list.split(os.path.basename(files_list))[0][:-1]
+             if item_path not in items:
+                 items[item_path] = []
+                 items[item_path].append(item_name)
+             else:
+                 items[item_path].append(item_name)
         subdata_file = pkgdatadir + "/runtime/%s" % pkg
 
         pkgval = d.getVar('PKG_%s' % pkg, True)
@@ -1137,6 +1146,8 @@ python emit_pkgdata() {
             pkgval = pkg
             d.setVar('PKG_%s' % pkg, pkg)
 
+        d.setVar('FILES_INFO', str(items))
+
         sf = open(subdata_file, 'w')
         write_if_exists(sf, pkg, 'PN')
         write_if_exists(sf, pkg, 'PV')
@@ -1161,6 +1172,7 @@ python emit_pkgdata() {
         write_if_exists(sf, pkg, 'pkg_preinst')
         write_if_exists(sf, pkg, 'pkg_prerm')
         write_if_exists(sf, pkg, 'FILERPROVIDESFLIST')
+        write_if_exists(sf, pkg, 'FILES_INFO')
         for dfile in (d.getVar('FILERPROVIDESFLIST_' + pkg, True) or "").split():
             write_if_exists(sf, pkg, 'FILERPROVIDES_' + dfile)
 
diff --git a/meta/classes/packageinfo.bbclass b/meta/classes/packageinfo.bbclass
index 5e6f590..4709bea 100644
--- a/meta/classes/packageinfo.bbclass
+++ b/meta/classes/packageinfo.bbclass
@@ -8,24 +8,6 @@ python packageinfo_handler () {
         package_archs = e.data.getVar('PACKAGE_ARCHS', True)
         packaging = e.data.getVar('PACKAGE_CLASSES', True).split()[0].split('_')[1]
         deploy_dir = e.data.getVar('DEPLOY_DIR', True) + '/' + packaging
-        dirs = os.listdir(tmpdir + '/work/')
-        pkgsplit_dir = tmpdir + '/work/'
-        items = {}
-        passing = ''
-        for directories in dirs:
-                temp_dirs = os.listdir(pkgsplit_dir + directories)
-                for temps1 in temp_dirs:
-                        if os.path.exists(pkgsplit_dir + directories + '/' + temps1 + '/' + os.listdir(pkgsplit_dir + directories + '/' + temps1)[0] + '/packages-split'):
-                                subs = pkgsplit_dir + directories + '/' + temps1 + '/' + os.listdir(pkgsplit_dir + directories + '/' + temps1)[0] + '/packages-split'
-                                for temps in os.listdir(subs):
-                                        items[temps] = {}
-                                        for path, dirs, files in os.walk(pkgsplit_dir + directories + '/' + temps1 + '/' + os.listdir(pkgsplit_dir + directories + '/' + temps1)[0] + '/packages-split' + '/' + temps):                                                   
-                                                        file_list = []
-                                                        if os.listdir(path) != []:
-                                                                items[temps][path] = []                                                   
-                                                                for f in files:
-                                                                        file_list.append(f)
-                                                                items[temps][path].append(file_list)
                                            
         for arch in package_archs.split():
             pkgdata_dir = tmpdir + '/pkgdata/' + arch + target_vendor + '-' + target_os + '/runtime/'
@@ -38,8 +20,6 @@ python packageinfo_handler () {
                             try:
                                 sdata = oe.packagedata.read_pkgdatafile(pkgdatafile)
                                 sdata['PKG'] = pkgname
-                                if pkgname in items:
-                                        sdata['FILES_INFO'] = items[pkgname]        
                                 pkginfolist.append(sdata)
                             except Exception as e:
                                 bb.warn("Failed to read pkgdata file %s: %s: %s" % (pkgdatafile, e.__class__, str(e)))
-- 
1.7.9.5



