Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1F48A70016
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 16:12:16 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o80so25717819wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 09:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YBaq3ss3duchGi/mN89cVe4DWSg5kW3HWF+HludspKQ=;
	b=ZcJo/MthiHIIUKlsgPiVKHGUC2OqUSOaU2C+ccujCUW1Z0TfBA8y29U0R9qs6xL37W
	K2xxaaYOYoToHaL0Cv1PB/P8MJiQPzZ1GZx+5izeb+f9IRBNPT3nPl+NBke8DgsIWzxq
	J5+rX/SYCaILhSc3JdUONju0T3OYmitf0+XPqw+MXGkBfHYuMNkxXQb9YyolAJcQK1XV
	SRNah1aodmnidTgNIcM/nam3PGAwyWhDURtE0EEGkjk3mZtP49sTMZwm041110SjrWw1
	HQeHqiyklsY+7wkjYWjHnVm4wFgdRe+ndQIEWqz9Mr8f53Fg2/DZijsF5cZUeFViOFM5
	wk5Q==
X-Gm-Message-State: AEkoousFcJKsuUd7HGg1b7KiBRKNu3OD49oaezvOrTMDhl/QD14pA7q3+n92NGeyQLmNIA==
X-Received: by 10.28.113.135 with SMTP id d7mr26130000wmi.43.1471450336698;
	Wed, 17 Aug 2016 09:12:16 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	t202sm27231734wmt.22.2016.08.17.09.12.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Aug 2016 09:12:15 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2016 17:12:15 +0100
Message-Id: <20160817161215.17698-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160817152538.14181-1-git@andred.net>
References: <20160817152538.14181-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH] kernel-module-split.bbclass: no need for running depmod
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
X-List-Received-Date: Wed, 17 Aug 2016 16:12:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the recent changes, executing depmod is not needed
anymore.

This simplifies and remove a lot of unnecessary code.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/classes/kernel-module-split.bbclass | 67 +-------------------------------
 1 file changed, 1 insertion(+), 66 deletions(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index db0ad33..9518747 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -63,68 +63,6 @@ python split_kernel_module_packages () {
             vals[m.group(1)] = m.group(2)
         return vals
 
-    def parse_depmod():
-
-        dvar = d.getVar('PKGD', True)
-
-        kernelver = d.getVar('KERNEL_VERSION', True)
-        kernelver_stripped = kernelver
-        m = kerverrexp.match(kernelver)
-        if m:
-            kernelver_stripped = m.group(1)
-        staging_kernel_dir = d.getVar("STAGING_KERNEL_BUILDDIR", True)
-        system_map_file = "%s/boot/System.map-%s" % (dvar, kernelver)
-        if not os.path.exists(system_map_file):
-            system_map_file = "%s/System.map-%s" % (staging_kernel_dir, kernelver)
-            if not os.path.exists(system_map_file):
-                bb.fatal("System.map-%s does not exist in '%s/boot' nor STAGING_KERNEL_BUILDDIR '%s'" % (kernelver, dvar, staging_kernel_dir))
-
-        cmd = "depmod -n -a -b %s -F %s %s" % (dvar, system_map_file, kernelver_stripped)
-        f = os.popen(cmd, 'r')
-
-        deps = {}
-        line = f.readline()
-        while line:
-            if not depmodpat0.match(line):
-                line = f.readline()
-                continue
-            m1 = depmodpat1.match(line)
-            if m1:
-                deps[m1.group(1)] = m1.group(2).split()
-            else:
-                m2 = depmodpat2.match(line)
-                if m2:
-                    deps[m2.group(1)] = m2.group(2).split()
-                    line = f.readline()
-                    m3 = depmodpat3.match(line)
-                    while m3:
-                        deps[m2.group(1)].extend(m3.group(1).split())
-                        line = f.readline()
-                        m3 = depmodpat3.match(line)
-                    m4 = depmodpat4.match(line)
-                    deps[m2.group(1)].extend(m4.group(1).split())
-            line = f.readline()
-        f.close()
-        return deps
-
-    def get_dependencies(file, pattern, format):
-        # file no longer includes PKGD
-        file = file.replace(d.getVar('PKGD', True) or '', '', 1)
-        # instead is prefixed with /lib/modules/${KERNEL_VERSION}
-        file = file.replace("/lib/modules/%s/" % d.getVar('KERNEL_VERSION', True) or '', '', 1)
-
-        if file in module_deps:
-            dependencies = []
-            for i in module_deps[file]:
-                m = re.match(pattern, os.path.basename(i))
-                if not m:
-                    continue
-                on = legitimize_package_name(m.group(1))
-                dependency_pkg = format % on
-                dependencies.append(dependency_pkg)
-            return dependencies
-        return []
-
     def frob_metadata(file, pkg, pattern, format, basename):
         vals = extract_modinfo(file)
 
@@ -179,9 +117,7 @@ python split_kernel_module_packages () {
                 on = legitimize_package_name(dep)
                 dependency_pkg = format % on
                 modinfo_deps.append(dependency_pkg)
-        depmod_deps = get_dependencies(file, pattern, format)
-        all_deps = list(set(modinfo_deps + depmod_deps))
-        for dep in all_deps:
+        for dep in modinfo_deps:
             if not dep in rdepends:
                 rdepends[dep] = []
         d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
@@ -189,7 +125,6 @@ python split_kernel_module_packages () {
         # Avoid automatic -dev recommendations for modules ending with -dev.
         d.setVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs', 1)
 
-    module_deps = parse_depmod()
     module_regex = '^(.*)\.k?o$'
 
     module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX', True)
-- 
2.9.3


