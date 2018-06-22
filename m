Return-Path: <damien.riegel@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 19B4C75219
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 18:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 907A39C3356;
	Fri, 22 Jun 2018 14:43:08 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id jaEHcRy7aoKw; Fri, 22 Jun 2018 14:43:08 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 1121B9C336F;
	Fri, 22 Jun 2018 14:43:08 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id JYZzXYeDTYfO; Fri, 22 Jun 2018 14:43:07 -0400 (EDT)
Received: from workotop.mtl.sfl (unknown [192.168.50.174])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id DEC789C3343;
	Fri, 22 Jun 2018 14:43:07 -0400 (EDT)
From: Damien Riegel <damien.riegel@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 14:43:02 -0400
Message-Id: <20180622184302.17835-2-damien.riegel@savoirfairelinux.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180622184302.17835-1-damien.riegel@savoirfairelinux.com>
References: <20180622184302.17835-1-damien.riegel@savoirfairelinux.com>
Subject: [PATCH v2 1/1] systemd: escape paths passed to shell
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
X-List-Received-Date: Fri, 22 Jun 2018 18:43:08 -0000

Systemd mount configuration file must have a name that match the mount
point directory they control. So for instance, if a mount file contains

    [Mount]
    ...
    Where=/mnt/my-data

The file must be named `mnt-my\x2ddata.mount`, or systemd will refuse to
honour it.

If this config file contains an [Install] section, it will silently fail
because the unit file is not escaped properly when systemctl is called.
To fix that, make sure paths are escaped through `shlex.quote`.

Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
---
Changes in v2:
 - v1 didn't handle multiple files in SYSTEMD_SERVICE_${PN}, this v2
   fixes using a solution suggested by Christopher Larson

 meta/classes/systemd.bbclass | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 1b134322fb..c7b784dea8 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -34,10 +34,10 @@ if type systemctl >/dev/null 2>/dev/null; then
 		systemctl daemon-reload
 	fi
 
-	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
+	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE_ESCAPED}
 
 	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
-		systemctl --no-block restart ${SYSTEMD_SERVICE}
+		systemctl --no-block restart ${SYSTEMD_SERVICE_ESCAPED}
 	fi
 fi
 }
@@ -51,10 +51,10 @@ fi
 
 if type systemctl >/dev/null 2>/dev/null; then
 	if [ -z "$D" ]; then
-		systemctl stop ${SYSTEMD_SERVICE}
+		systemctl stop ${SYSTEMD_SERVICE_ESCAPED}
 	fi
 
-	systemctl $OPTS disable ${SYSTEMD_SERVICE}
+	systemctl $OPTS disable ${SYSTEMD_SERVICE_ESCAPED}
 fi
 }
 
@@ -65,6 +65,7 @@ systemd_populate_packages[vardepsexclude] += "OVERRIDES"
 
 python systemd_populate_packages() {
     import re
+    import shlex
 
     if not bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
         return
@@ -85,6 +86,9 @@ python systemd_populate_packages() {
     def systemd_generate_package_scripts(pkg):
         bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
 
+        paths_escaped = ' '.join(shlex.quote(s) for s in d.getVar('SYSTEMD_SERVICE_' + pkg, True).split())
+        d.setVar('SYSTEMD_SERVICE_ESCAPED_' + pkg, paths_escaped)
+
         # Add pkg to the overrides so that it finds the SYSTEMD_SERVICE_pkg
         # variable.
         localdata = d.createCopy()
@@ -130,7 +134,7 @@ python systemd_populate_packages() {
                 systemd_add_files_and_parse(pkg_systemd, path, service_base + '@.service', keys)
             for key in keys.split():
                 # recurse all dependencies found in keys ('Also';'Conflicts';..) and add to files
-                cmd = "grep %s %s | sed 's,%s=,,g' | tr ',' '\\n'" % (key, fullpath, key)
+                cmd = "grep %s %s | sed 's,%s=,,g' | tr ',' '\\n'" % (key, shlex.quote(fullpath), key)
                 pipe = os.popen(cmd, 'r')
                 line = pipe.readline()
                 while line:
-- 
2.17.1


