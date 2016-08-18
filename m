Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 64405769F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 07:56:33 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i5so3750706wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 00:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tN32Nj2OgDNEwAuNwRMW7NQQ1bC4aoeL+vL87JLyDpo=;
	b=IjjiOTh+TKAoh3Gonn0jxkwfSwVI4uzyUD/rtT09RS93YNMc/cki9m7UlUkqzO4gwi
	URskX2S1d5+TMZaG1HtLCU6DgS/RWAIM+odt/n1DWDgBNxvNCilDFDsygj5LvKFR3C9q
	pwiDLx9fuLbF6FKWIdl9M2Xm3LCu7kKTV4O9fsdo93ZRJbWe6WJlR6+D8ms35dJ7Vj5J
	Dn2zx2o9lmY2j+bArfGFrbH7n1b65KwXZz8/ViRJ/f5EWq0cmFrk+H2z+6kxKITaSxra
	liAImBxyEwNXiBVAoDvAUbdlnOi3GyIhTj8s/LUaybfJY+rbp2nGVutZ9nnNl3098lkU
	zSFg==
X-Gm-Message-State: AEkooutMdV3G8cBVI8/7sTF2SZ5a0Nyfx+CvvhUYpbCIkfFbQLATqQARaGlj4KHv6l5GUA==
X-Received: by 10.28.172.195 with SMTP id v186mr1184238wme.97.1471506993562;
	Thu, 18 Aug 2016 00:56:33 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	q65sm1318701wmd.24.2016.08.18.00.56.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Aug 2016 00:56:32 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2016 08:56:26 +0100
Message-Id: <20160818075626.15973-4-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160818075626.15973-1-git@andred.net>
References: <20160817152538.14181-1-git@andred.net>
	<20160818075626.15973-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 3/3] kernel-module-split.bbclass: no need for running depmod
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
X-List-Received-Date: Thu, 18 Aug 2016 07:56:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the recent changes, executing depmod is not needed
anymore.

This simplifies and removes a lot of unnecessary code.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/classes/kernel-module-split.bbclass | 73 +-------------------------------
 1 file changed, 1 insertion(+), 72 deletions(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index db0ad33..08d2262 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -36,12 +36,6 @@ python split_kernel_module_packages () {
     import re
 
     modinfoexp = re.compile("([^=]+)=(.*)")
-    kerverrexp = re.compile('^(.*-hh.*)[\.\+].*$')
-    depmodpat0 = re.compile("^(.*\.k?o):..*$")
-    depmodpat1 = re.compile("^(.*\.k?o):\s*(.*\.k?o)\s*$")
-    depmodpat2 = re.compile("^(.*\.k?o):\s*(.*\.k?o)\s*\\\$")
-    depmodpat3 = re.compile("^\t(.*\.k?o)\s*\\\$")
-    depmodpat4 = re.compile("^\t(.*\.k?o)\s*$")
 
     def extract_modinfo(file):
         import tempfile, subprocess
@@ -63,68 +57,6 @@ python split_kernel_module_packages () {
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
 
@@ -179,9 +111,7 @@ python split_kernel_module_packages () {
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
@@ -189,7 +119,6 @@ python split_kernel_module_packages () {
         # Avoid automatic -dev recommendations for modules ending with -dev.
         d.setVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs', 1)
 
-    module_deps = parse_depmod()
     module_regex = '^(.*)\.k?o$'
 
     module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX', True)
-- 
2.9.3


