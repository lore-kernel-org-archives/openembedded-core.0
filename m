Return-Path: <bob.ham@collabora.com>
X-Greylist: delayed 375 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 19 Nov 2015 11:30:20 UTC
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 5774760107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 11:30:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rah)
	with ESMTPSA id AD7C2601BBF
From: Bob Ham <bob.ham@collabora.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 11:24:00 +0000
Message-Id: <1447932240-27544-1-git-send-email-bob.ham@collabora.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/1] systemd.class - Allow enabling of parameterised services
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
X-List-Received-Date: Thu, 19 Nov 2015 11:30:20 -0000

Currently the systemd.class will check whether a service exists when
it is requested to enabled it.  However, its check does not take into
account that a service like 'foo@eth0.service' can be enabled from a
service named 'foo@.service'.  This patch alters the check function in
systemd.class to look for 'foo@.service' if the normal check fails.

Signed-off-by: Bob Ham <bob.ham@collabora.com>
---
 meta/classes/systemd.bbclass | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 46e72c7..db7873f 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -59,6 +59,8 @@ systemd_populate_packages[vardepsexclude] += "OVERRIDES"
 
 
 python systemd_populate_packages() {
+    import re
+
     if not bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
         return
 
@@ -144,10 +146,22 @@ python systemd_populate_packages() {
         for pkg_systemd in systemd_packages.split():
             for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).split():
                 path_found = ''
+
+                # Deal with adding, for example, 'ifplugd@eth0.service' from
+                # 'ifplugd@.service'
+                base = None
+                if service.find('@') != -1:
+                    base = re.sub('@[^.]+.', '@.', service)
+
                 for path in searchpaths:
                     if os.path.exists(oe.path.join(d.getVar("D", True), path, service)):
                         path_found = path
                         break
+                    elif base is not None:
+                        if os.path.exists(oe.path.join(d.getVar("D", True), path, base)):
+                            path_found = path
+                            break
+
                 if path_found != '':
                     systemd_add_files_and_parse(pkg_systemd, path_found, service, keys)
                 else:
-- 
2.1.4


