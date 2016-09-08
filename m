Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 900C177326
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 09:33:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u889Xo63008935
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Sep 2016 02:33:50 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 8 Sep 2016 02:33:50 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Sep 2016 17:34:28 +0800
Message-ID: <ac752ebcea771c0252a3ccf624ca4f76f867e40b.1473326978.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1473326978.git.Qi.Chen@windriver.com>
References: <cover.1473326978.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/3] systemd.bbclass: add support to manage user services
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
X-List-Received-Date: Thu, 08 Sep 2016 09:33:50 -0000
Content-Type: text/plain

Add new variable SYSTEMD_USER_SERVICE and SYSTEM_USER_AUTO_ENABLE
to manage user services. Their usage is like SYSTEMD_SERVICE and
SYSTEMD_AUTO_ENABLE.

[YOCTO #7800]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/systemd.bbclass | 41 +++++++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index db7873f..b6a4176 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -7,6 +7,7 @@ SYSTEMD_PACKAGES_class-nativesdk ?= ""
 
 # Whether to enable or disable the services on installation.
 SYSTEMD_AUTO_ENABLE ??= "enable"
+SYSTEMD_USER_AUTO_ENABLE ??= "enable"
 
 # This class will be included in any recipe that supports systemd init scripts,
 # even if systemd is not in DISTRO_FEATURES.  As such don't make any changes
@@ -29,10 +30,17 @@ if [ -n "$D" ]; then
 fi
 
 if type systemctl >/dev/null 2>/dev/null; then
-	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
-
-	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
-		systemctl restart ${SYSTEMD_SERVICE}
+	if [ "${SYSTEMD_SERVICE}" != "" ]; then
+		systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
+		if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
+			systemctl restart ${SYSTEMD_SERVICE}
+		fi
+	fi
+	if [ "${SYSTEMD_USER_SERVICE}" != "" ]; then
+		systemctl $OPTS --global ${SYSTEMD_USER_AUTO_ENABLE} ${SYSTEMD_USER_SERVICE}
+		if [ -z "$D" -a "${SYSTEMD_USER_AUTO_ENABLE}" = "enable" ]; then
+			systemctl --global restart ${SYSTEMD_USER_SERVICE}
+		fi
 	fi
 fi
 }
@@ -45,11 +53,18 @@ if [ -n "$D" ]; then
 fi
 
 if type systemctl >/dev/null 2>/dev/null; then
-	if [ -z "$D" ]; then
-		systemctl stop ${SYSTEMD_SERVICE}
+	if [ "${SYSTEMD_SERVICE}" != "" ]; then
+		if [ -z "$D" ]; then
+			systemctl stop ${SYSTEMD_SERVICE}
+		fi
+		systemctl $OPTS disable ${SYSTEMD_SERVICE}
+	fi
+	if [ "${SYSTEMD_USER_SERVICE}" != "" ]; then
+		if [ -z "$D" ]; then
+			systemctl --global stop ${SYSTEMD_USER_SERVICE}
+		fi
+		systemctl $OPTS --global disable ${SYSTEMD_USER_SERVICE}
 	fi
-
-	systemctl $OPTS disable ${SYSTEMD_SERVICE}
 fi
 }
 
@@ -139,12 +154,14 @@ python systemd_populate_packages() {
     def systemd_check_services():
         searchpaths = [oe.path.join(d.getVar("sysconfdir", True), "systemd", "system"),]
         searchpaths.append(d.getVar("systemd_system_unitdir", True))
+        searchpaths.append(oe.path.join(d.getVar("sysconfdir", True), "systemd", "user"))
+        searchpaths.append(d.getVar("systemd_user_unitdir", True))
         systemd_packages = d.getVar('SYSTEMD_PACKAGES', True)
 
         keys = 'Also'
         # scan for all in SYSTEMD_SERVICE[]
         for pkg_systemd in systemd_packages.split():
-            for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).split():
+            for service in (get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd) + get_package_var(d, 'SYSTEMD_USER_SERVICE', pkg_systemd)).split():
                 path_found = ''
 
                 # Deal with adding, for example, 'ifplugd@eth0.service' from
@@ -165,14 +182,14 @@ python systemd_populate_packages() {
                 if path_found != '':
                     systemd_add_files_and_parse(pkg_systemd, path_found, service, keys)
                 else:
-                    raise bb.build.FuncFailed("SYSTEMD_SERVICE_%s value %s does not exist" % \
-                        (pkg_systemd, service))
+                    raise bb.build.FuncFailed("SYSTEMD_SERVICE_%s or SYSTEMD_USER_SERVICE_%s value %s does not exist" % \
+                        (pkg_systemd, pkg_systemd, service))
 
     # Run all modifications once when creating package
     if os.path.exists(d.getVar("D", True)):
         for pkg in d.getVar('SYSTEMD_PACKAGES', True).split():
             systemd_check_package(pkg)
-            if d.getVar('SYSTEMD_SERVICE_' + pkg, True):
+            if d.getVar('SYSTEMD_SERVICE_' + pkg, True) or d.getVar('SYSTEMD_USER_SERVICE_' + pkg, True):
                 systemd_generate_package_scripts(pkg)
         systemd_check_services()
 }
-- 
1.9.1


