Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6B99C6E2E5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 03:08:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBD389nP028595
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 19:08:09 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 12 Dec 2013 19:08:08 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Dec 2013 11:09:02 +0800
Message-ID: <f308ef3f4a4f2db8a0b8a6354336bdcfb1c090de.1386903269.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1386903269.git.Qi.Chen@windriver.com>
References: <cover.1386903269.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] packaging: change the process of CONFFILES handling
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
X-List-Received-Date: Fri, 13 Dec 2013 03:08:09 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Previously, the CONFFILES variable is a list of config files to be
packaged. However, as these files may come directly from the source
instead of our WORKDIR, it's very common mistake that we forget to set
this variable in our recipes. This will lead to unexpected behavior
when doing an on-target upgrade. For example, we modify the /etc/login.defs
locally and then do an upgrade. The file will be replaced, which is
obviously not correct.

This patch changes the handling and the semantics of CONFFILES. After this
change, the CONFFILES can take the same form as FILES. That means, we don't
have to list a bunch of files for CONFFILES. It will just be expanded
like the FILES variable.

As almost all files under /etc are basically configuration files, we
provide a default value for CONFFILES.

    CONNFFILES_DEFAULT = "${sysconfdir}"

In this way, we don't need to modify every recipe to set the CONFFILES
variable. Of course, setting CONFFILES in recipes take precedence over
the CONFFILES_DEFAULT. For example, if the recipe author decides that
package A should only treat files under ${sysconfdir}/default/ as config
files, he/she can write like this.

    CONFFILES_A = "${sysconfdir}/default"

The above situation should not be common. As according to FHS, the /etc
directory is a place for all system related configuration files.

[YOCTO #5200]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/insane.bbclass      |    2 +-
 meta/classes/package.bbclass     |   35 +++++++++++++++++++++++++++++++++++
 meta/classes/package_deb.bbclass |    2 +-
 meta/classes/package_ipk.bbclass |    2 +-
 meta/classes/package_rpm.bbclass |    2 +-
 meta/conf/bitbake.conf           |    2 ++
 6 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index a51f504..7376846 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -981,7 +981,7 @@ python () {
 
     issues = []
     if (d.getVar('PACKAGES', True) or "").split():
-        for var in 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RCONFLICTS', 'RPROVIDES', 'RREPLACES', 'FILES', 'pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm', 'ALLOW_EMPTY':
+        for var in 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RCONFLICTS', 'RPROVIDES', 'RREPLACES', 'FILES', 'CONFFILES', 'pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm', 'ALLOW_EMPTY':
             if d.getVar(var):
                 issues.append(var)
     for i in issues:
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 44a852f..16ba4bd 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -234,6 +234,41 @@ python () {
         d.setVar("PACKAGERDEPTASK", "")
 }
 
+# Called in package_<rpm,ipk,deb>.bbclass to get the correct list of configuration files
+def get_conffiles(pkg, d):
+    import glob
+    pkgdest = d.getVar('PKGDEST', True)
+    conf_list = []
+    root = os.path.join(pkgdest, pkg)
+    cwd = os.getcwd()
+    os.chdir(root)
+    conffiles = (d.getVar('CONFFILES_%s' % pkg, True) or d.getVar('CONFFILES_DEFAULT', True) or "").split()
+    for conffile in conffiles:
+        if os.path.isabs(conffile):
+            conffile = '.' + conffile
+        if not conffile.startswith('./'):
+            conffile = './' + conffile
+        if not os.path.islink(conffile) and os.path.isdir(conffile):
+            newconffiles = [ os.path.join(conffile, x) for x in os.listdir(conffile) ]
+            if newconffiles:
+                conffiles += newconffiles
+                continue
+        globbed = glob.glob(conffile)
+        if globbed:
+            if [ conffile ] != globbed:
+                conffile += globbed
+                continue
+        if (not os.path.islink(conffile)) and (not os.path.exists(conffile)):
+            continue
+        if conffile in conf_list:
+            continue
+        conf_list.append(conffile)
+    # Remove the leading './'
+    for i in range(0, len(conf_list)):
+        conf_list[i] = conf_list[i][1:]
+    os.chdir(cwd)
+    return conf_list
+
 def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
     # Function to split a single file into two components, one is the stripped
     # target system binary, the other contains any debugging information. The
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index d18c250..2a983b7 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -389,7 +389,7 @@ python do_package_deb () {
             scriptfile.close()
             os.chmod(os.path.join(controldir, script), 0755)
 
-        conffiles_str = localdata.getVar("CONFFILES", True)
+        conffiles_str = ' '.join(get_conffiles(pkg, d))
         if conffiles_str:
             try:
                 conffiles = open(os.path.join(controldir, 'conffiles'), 'w')
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index d0db945..a8d152b 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -390,7 +390,7 @@ python do_package_ipk () {
             scriptfile.close()
             os.chmod(os.path.join(controldir, script), 0755)
 
-        conffiles_str = localdata.getVar("CONFFILES", True)
+        conffiles_str = ' '.join(get_conffiles(pkg, d))
         if conffiles_str:
             try:
                 conffiles = open(os.path.join(controldir, 'conffiles'), 'w')
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 346b7ab..6d7886a 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -774,7 +774,7 @@ python write_specfile () {
 
         bb.data.update_data(localdata)
 
-        conffiles = (localdata.getVar('CONFFILES', True) or "").split()
+        conffiles = get_conffiles(pkg, d)
 
         splitname    = strip_multilib(pkgname, d)
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 386c935..a02a6fa 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -272,6 +272,8 @@ PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE
 PACKAGES_DYNAMIC = "^${PN}-locale-.*"
 FILES = ""
 
+CONFFILES_DEFAULT = "${sysconfdir}"
+
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
             ${base_bindir}/* ${base_sbindir}/* \
-- 
1.7.9.5


