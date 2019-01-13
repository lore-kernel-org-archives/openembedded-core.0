Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3663F7C0DA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Jan 2019 11:16:03 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id g22so16443286edr.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Jan 2019 03:16:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aSRmqqWkZMtc2I8xxEWKym/7PZBIe8NAkPgkwSu9iD0=;
	b=SgOpNZgiIQd1HLl7y2k2ROALz8Sb34lUnT0+vQN56X4xPl3R3ns6SRZufOtAUeT0sl
	GKZ41Ev1lBmrJ5x/6qGOowojGeCxXOpYhKmx3nivVCM9+zimb4/aihtYLPvIxdy31RWv
	O7M1UHqCpfvU+Cq57+cjQmJqPWmUDgOxm6ld3nC0sjxG8vCqC3dDTNmgOTafoIY1NgW/
	HnBIRWt30hCk8QojkDvR0emHgwMPqYR5cXjQLc25CyJCr+1uOVrV8v2ZWf1wuSl06DlW
	4L7OcrPQ/WqH0QyL7Qr7SycfAGLX8LWynOs0ek0nPiQQUjMW1Ld3PVENLXS1xkxViGlu
	Ou6g==
X-Gm-Message-State: AJcUuke1TteqqzhFohsEcdKCmv3HmdKGbBmMTGJLdvZzHzn/Qgzs2fh/
	i7cfOlaaF399KZJ10LXlUu9LerVE
X-Google-Smtp-Source: ALg8bN68Rz3QH4aaJ9c5/g6lLsAe/J6nw5Fa0e84Fg9+DsceZGR9uOgb0Bm20xtf+jJf2qGnGbnStg==
X-Received: by 2002:a17:906:f252:: with SMTP id
	gy18-v6mr1609886ejb.37.1547378163327; 
	Sun, 13 Jan 2019 03:16:03 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	m44sm4028321edm.54.2019.01.13.03.16.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 13 Jan 2019 03:16:02 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Jan 2019 11:16:01 +0000
Message-Id: <20190113111601.20040-1-git@andred.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] meta: remove True option to getVar calls (again)
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
X-List-Received-Date: Sun, 13 Jan 2019 11:16:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

A couple have still been missed in the past despite multiple
attempts at doing so (or simply have re-appeared?).

Search & replace made using the following command:
    sed -e 's|\(d\.getVar \?\)( \?\([^,()]*\), \?True)|\1(\2)|g' \
        -i $(git grep -E 'getVar ?\( ?([^,()]*), ?True\)' \
             | cut -d':' -f1 \
             | sort -u)

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/classes/sstate.bbclass                          | 4 ++--
 meta/classes/systemd.bbclass                         | 2 +-
 meta/classes/update-alternatives.bbclass             | 2 +-
 meta/classes/useradd-staticids.bbclass               | 4 ++--
 meta/recipes-core/systemd/systemd-boot_239.bb        | 2 +-
 meta/recipes-devtools/python/python-native_2.7.15.bb | 2 +-
 meta/recipes-devtools/python/python3-native_3.5.6.bb | 2 +-
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb            | 6 +++---
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index da0807d6e9..482ffa83f9 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -379,7 +379,7 @@ def sstate_installpkgdir(ss, d):
 
     for plain in ss['plaindirs']:
         workdir = d.getVar('WORKDIR')
-        sharedworkdir = os.path.join(d.getVar('TMPDIR', True), "work-shared")
+        sharedworkdir = os.path.join(d.getVar('TMPDIR'), "work-shared")
         src = sstateinst + "/" + plain.replace(workdir, '')
         if sharedworkdir in plain:
             src = sstateinst + "/" + plain.replace(sharedworkdir, '')
@@ -640,7 +640,7 @@ def sstate_package(ss, d):
         os.rename(state[1], sstatebuild + state[0])
 
     workdir = d.getVar('WORKDIR')
-    sharedworkdir = os.path.join(d.getVar('TMPDIR', True), "work-shared")
+    sharedworkdir = os.path.join(d.getVar('TMPDIR'), "work-shared")
     for plain in ss['plaindirs']:
         pdir = plain.replace(workdir, sstatebuild)
         if sharedworkdir in plain:
diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index c7b784dea8..c8f4fdec88 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -86,7 +86,7 @@ python systemd_populate_packages() {
     def systemd_generate_package_scripts(pkg):
         bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
 
-        paths_escaped = ' '.join(shlex.quote(s) for s in d.getVar('SYSTEMD_SERVICE_' + pkg, True).split())
+        paths_escaped = ' '.join(shlex.quote(s) for s in d.getVar('SYSTEMD_SERVICE_' + pkg).split())
         d.setVar('SYSTEMD_SERVICE_ESCAPED_' + pkg, paths_escaped)
 
         # Add pkg to the overrides so that it finds the SYSTEMD_SERVICE_pkg
diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 1362274d4d..f1250f877b 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -154,7 +154,7 @@ def apply_update_alternative_renames(d):
             if not alt_link:
                 alt_link = "%s/%s" % (d.getVar('bindir'), alt_name)
                 d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link)
-            if alt_link.startswith(os.path.join(d.getVar('sysconfdir', True), 'init.d')):
+            if alt_link.startswith(os.path.join(d.getVar('sysconfdir'), 'init.d')):
                 # Managing init scripts does not work (bug #10433), foremost
                 # because of a race with update-rc.d
                 bb.fatal("Using update-alternatives for managing SysV init scripts is not supported")
diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 64bf6dc823..70d59e5573 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -59,8 +59,8 @@ def update_useradd_static_config(d):
     # Paths are resolved via BBPATH.
     def get_table_list(d, var, default):
         files = []
-        bbpath = d.getVar('BBPATH', True)
-        tables = d.getVar(var, True)
+        bbpath = d.getVar('BBPATH')
+        tables = d.getVar(var)
         if not tables:
             tables = default
         for conf_file in tables.split():
diff --git a/meta/recipes-core/systemd/systemd-boot_239.bb b/meta/recipes-core/systemd/systemd-boot_239.bb
index 312a0145d8..2450d52cb9 100644
--- a/meta/recipes-core/systemd/systemd-boot_239.bb
+++ b/meta/recipes-core/systemd/systemd-boot_239.bb
@@ -29,7 +29,7 @@ EXTRA_OEMESON += "-Defi=true \
 python __anonymous () {
     import re
     target = d.getVar('TARGET_ARCH')
-    prefix = "" if d.getVar('EFI_PROVIDER', True) == "systemd-boot" else "systemd-"
+    prefix = "" if d.getVar('EFI_PROVIDER') == "systemd-boot" else "systemd-"
     if target == "x86_64":
         systemdimage = prefix + "bootx64.efi"
     else:
diff --git a/meta/recipes-devtools/python/python-native_2.7.15.bb b/meta/recipes-devtools/python/python-native_2.7.15.bb
index b0c2a59656..f00153f0ee 100644
--- a/meta/recipes-devtools/python/python-native_2.7.15.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.15.bb
@@ -68,7 +68,7 @@ python(){
 
     # Read JSON manifest
     import json
-    pythondir = d.getVar('THISDIR',True)
+    pythondir = d.getVar('THISDIR')
     with open(pythondir+'/python/python2-manifest.json') as manifest_file:
         manifest_str =  manifest_file.read()
         json_start = manifest_str.find('# EOC') + 6
diff --git a/meta/recipes-devtools/python/python3-native_3.5.6.bb b/meta/recipes-devtools/python/python3-native_3.5.6.bb
index 8476d681c3..c41ee8bbd9 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.6.bb
@@ -82,7 +82,7 @@ python(){
 
     # Read JSON manifest
     import json
-    pythondir = d.getVar('THISDIR',True)
+    pythondir = d.getVar('THISDIR')
     with open(pythondir+'/python3/python3-manifest.json') as manifest_file:
         manifest_str =  manifest_file.read()
         json_start = manifest_str.find('# EOC') + 6
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
index ef5d631917..c2f841cfce 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -104,9 +104,9 @@ do_install_append_class-native() {
 do_install_append_class-nativesdk() {
         for tool in ${WRAPPER_TOOLS}; do
                 create_wrapper ${D}$tool \
-                        RPM_CONFIGDIR='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
-                        RPM_ETCCONFIGDIR='$'{RPM_ETCCONFIGDIR-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/..} \
-                        MAGIC='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/misc/magic.mgc \
+                        RPM_CONFIGDIR='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir'), d.getVar('bindir'))}/rpm \
+                        RPM_ETCCONFIGDIR='$'{RPM_ETCCONFIGDIR-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir'), d.getVar('bindir'))}/..} \
+                        MAGIC='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir'), d.getVar('bindir'))}/misc/magic.mgc \
                         RPM_NO_CHROOT_FOR_SCRIPTS=1
         done
 
-- 
2.20.1


