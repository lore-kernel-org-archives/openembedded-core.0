Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3wwk-0002Ga-FR
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Feb 2013 00:01:33 +0100
Received: by mail-wi0-f173.google.com with SMTP id hq4so1434947wib.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 14:45:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=Ml23i5f/UCZ16HRyHnnAi0qgSBNgIE+++VLeu8IUBig=;
	b=UaXXft/Ww3mRAZJGHii6+o7fZpf5sHBGRUQslKSMr0gV1zfAHeKee+c7jZN+zmUFM+
	N4xfrXeXshq17KK4LnDwa7++5JevaFtmo2D45f0yPFwCrK/2r82vGsOaIGMll4M97EgR
	mAKMTie/Cd27qY1RLBgiLFEEoyLxlmZptMTF2crXqFKOEj+dIXxACVk/NnY+VU43Vyrm
	Erd9jRBrwPauwNYJrLrzjdXbP2qNvom3CKNPu1V17knhLRFSmtldc1X2+WmSixsbyEcN
	gfts8SP7foZbBEQy35kKnC/b6GDqvXrlz5niaR/hOPurLDmI7d4pGGWMu9q7ZZITfC7N
	KskA==
X-Received: by 10.180.84.199 with SMTP id b7mr5235472wiz.22.1360363536350;
	Fri, 08 Feb 2013 14:45:36 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id e6sm18190386wiz.1.2013.02.08.14.45.34
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Feb 2013 14:45:35 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2013 22:43:15 +0000
Message-Id: <a32b33801c899dce34b072ad1d9d9ede30e8b598.1360360346.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360360346.git.ross.burton@intel.com>
References: <cover.1360360346.git.ross.burton@intel.com>
In-Reply-To: <cover.1360360346.git.ross.burton@intel.com>
References: <cover.1360360346.git.ross.burton@intel.com>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQl1TKMiQ50GpQDjL+lC8UR8qaaz0RHYXTyxgpolTnZbJhR2y0EFLQ53oKbI3X00UZH+ZKit
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/5] systemd.bbclass: helper class for recipes with systemd units
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
X-List-Received-Date: Fri, 08 Feb 2013 23:01:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This class adds postinst/prerm scripts to start/stop/enable/disable the services
as relevant, and some magic to ensure the service files are installed.

Based on (but not the same as) the systemd.bbclass in meta-systemd, so thanks to
the following for their work there:

Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Khem Raj <raj.khem@gmail.com>
Martin Jansa <Martin.Jansa@gmail.com>
Andreas Müller <schnitzeltony@googlemail.com>
Koen Kooi <koen@dominion.thruhere.net>

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/systemd.bbclass |  158 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)
 create mode 100644 meta/classes/systemd.bbclass

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
new file mode 100644
index 0000000..e0ea65c
--- /dev/null
+++ b/meta/classes/systemd.bbclass
@@ -0,0 +1,158 @@
+# The list of packages that should have systemd packaging scripts added.  For
+# each entry, optionally have a SYSTEMD_SERVICE_[package] that lists the service
+# files in this package.  If this variable isn't set, [package].service is used.
+SYSTEMD_PACKAGES ?= "${PN}"
+
+# Whether to enable or disable the services on installation.
+SYSTEMD_AUTO_ENABLE ??= "enable"
+
+# This class will be included in any recipe that supports systemd init scripts,
+# even if the systemd DISTRO_FEATURE isn't enabled.  As such don't make any
+# changes directly but check the DISTRO_FEATURES first.
+python __anonymous() {
+    if oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
+        d.appendVar("DEPENDS", " systemd-systemctl-native")
+        # Set a variable so that update-rcd.bbclass knows we're active and can
+        # disable itself.
+        d.setVar("SYSTEMD_BBCLASS_ENABLED", "1")
+}
+
+systemd_postinst() {
+OPTS=""
+
+if [ -n "$D" ]; then
+    OPTS="--root=$D"
+fi
+
+systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
+
+if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
+    systemctl start ${SYSTEMD_SERVICE}
+fi
+}
+
+systemd_prerm() {
+if [ -z "$D" ]; then
+    systemctl stop ${SYSTEMD_SERVICE}
+fi
+
+systemctl disable ${SYSTEMD_SERVICE}
+}
+
+def systemd_populate_packages(d):
+    def get_package_var(d, var, pkg):
+        val = (d.getVar('%s_%s' % (var, pkg), True) or "").strip()
+        if val == "":
+            val = (d.getVar(var, True) or "").strip()
+        return val
+
+
+    # Add a runtime dependency on systemd to pkg
+    def systemd_add_rdepends(pkg):
+        rdepends = d.getVar('RDEPENDS_' + pkg, True) or ""
+        if not 'systemd' in rdepends.split():
+            rdepends = '%s %s' % (rdepends, 'systemd')
+        d.setVar('RDEPENDS_' + pkg, rdepends)
+
+
+    def systemd_generate_package_scripts(pkg):
+        bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
+
+        # Add pkg to the overrides so that it finds the SYSTEMD_SERVICE_pkg
+        # variable.
+        localdata = d.createCopy()
+        localdata.prependVar("OVERRIDES", pkg + ":")
+        bb.data.update_data(localdata)
+
+        postinst = d.getVar('pkg_postinst_%s' % pkg, True)
+        if not postinst:
+            postinst = '#!/bin/sh\n'
+        postinst += localdata.getVar('systemd_postinst', True)
+        d.setVar('pkg_postinst_%s' % pkg, postinst)
+
+        prerm = d.getVar('pkg_prerm_%s' % pkg, True)
+        if not prerm:
+            prerm = '#!/bin/sh\n'
+        prerm += localdata.getVar('systemd_prerm', True)
+        d.setVar('pkg_prerm_%s' % pkg, prerm)
+
+
+    # Add files to FILES_*-systemd if existent and not already done
+    def systemd_append_file(pkg_systemd, file_append):
+        appended = False
+        if os.path.exists(oe.path.join(d.getVar("D", True), file_append)):
+            var_name = "FILES_" + pkg_systemd
+            files = d.getVar(var_name, False) or ""
+            if file_append not in files.split():
+                d.appendVar(var_name, " " + file_append)
+                appended = True
+        return appended
+
+    # Add systemd files to FILES_*-systemd, parse for Also= and follow recursive
+    def systemd_add_files_and_parse(pkg_systemd, path, service, keys):
+        # avoid infinite recursion
+        if systemd_append_file(pkg_systemd, oe.path.join(path, service)):
+            fullpath = oe.path.join(d.getVar("D", True), path, service)
+            if service.find('.service') != -1:
+                # for *.service add *@.service
+                service_base = service.replace('.service', '')
+                systemd_add_files_and_parse(pkg_systemd, path, service_base + '@.service', keys)
+            if service.find('.socket') != -1:
+                # for *.socket add *.service and *@.service
+                service_base = service.replace('.socket', '')
+                systemd_add_files_and_parse(pkg_systemd, path, service_base + '.service', keys)
+                systemd_add_files_and_parse(pkg_systemd, path, service_base + '@.service', keys)
+            for key in keys.split():
+                # recurse all dependencies found in keys ('Also';'Conflicts';..) and add to files
+                cmd = "grep %s %s | sed 's,%s=,,g' | tr ',' '\\n'" % (key, fullpath, key)
+                pipe = os.popen(cmd, 'r')
+                line = pipe.readline()
+                while line:
+                    line = line.replace('\n', '')
+                    systemd_add_files_and_parse(pkg_systemd, path, line, keys)
+                    line = pipe.readline()
+                pipe.close()
+
+    # Check service-files and call systemd_add_files_and_parse for each entry
+    def systemd_check_services():
+        base_libdir = d.getVar('base_libdir', True)
+        searchpaths = [oe.path.join(d.getVar("sysconfdir", True), "systemd", "system"),]
+        searchpaths.append(oe.path.join(d.getVar("base_libdir", True), "systemd", "system"))
+        searchpaths.append(oe.path.join(d.getVar("libdir", True), "systemd", "system"))
+        searchpaths.append(oe.path.join(d.getVar("libdir", True), "systemd", "user"))
+        systemd_packages = d.getVar('SYSTEMD_PACKAGES', True)
+        has_exactly_one_service = len(systemd_packages.split()) == 1
+        if has_exactly_one_service:
+            has_exactly_one_service = len(get_package_var(d, 'SYSTEMD_SERVICE', systemd_packages).split()) == 1
+
+        keys = 'Also' # Conflicts??
+        if has_exactly_one_service:
+            # single service gets also the /dev/null dummies
+            keys = 'Also Conflicts'
+        # scan for all in SYSTEMD_SERVICE[]
+        for pkg_systemd in systemd_packages.split():
+            for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).split():
+                path_found = ''
+                for path in searchpaths:
+                    if os.path.exists(oe.path.join(d.getVar("D", True), path, service)):
+                        path_found = path
+                        break
+                if path_found != '':
+                    systemd_add_files_and_parse(pkg_systemd, path_found, service, keys)
+                else:
+                    raise bb.build.FuncFailed, "\n\nSYSTEMD_SERVICE_%s value %s does not exist" % \
+                        (pkg_systemd, service)
+
+    # Run all modifications once when creating package
+    if os.path.exists(d.getVar("D", True)):
+        for pkg in d.getVar('SYSTEMD_PACKAGES', True).split():
+            if d.getVar('SYSTEMD_SERVICE_' + pkg, True):
+                systemd_generate_package_scripts(pkg)
+                systemd_add_rdepends(pkg)
+        systemd_check_services()
+
+
+python populate_packages_prepend () {
+    if oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
+        systemd_populate_packages (d)
+}
-- 
1.7.10.4



