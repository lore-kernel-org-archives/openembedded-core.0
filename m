Return-Path: <sledz@dresearch-fe.de>
Received: from zk223.dresearch-fe.de (zk223.dresearch-fe.de [217.92.177.116])
	by mail.openembedded.org (Postfix) with ESMTP id 51AD865FFC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 12:25:36 +0000 (UTC)
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 06B1CE00C5;
	Thu, 25 Sep 2014 14:19:39 +0200 (CEST)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id C6F68700D59; Thu, 25 Sep 2014 14:19:38 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Sep 2014 14:17:56 +0200
Message-Id: <1411647477-12992-2-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1411647477-12992-1-git-send-email-sledz@dresearch-fe.de>
References: <1411647477-12992-1-git-send-email-sledz@dresearch-fe.de>
Subject: [daisy][PATCH 2/3] update-rc.d/systemd: Remove OVERRIDES dependency
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
X-List-Received-Date: Thu, 25 Sep 2014 12:25:37 -0000

Taking run-postinsts and building for two machines which have different
OVERRIDES leads to two different sets of stamps for an allarch package.

We don't need to depend on OVERRIDES in these classes, the end resulting
variables are good enough. We can therefore exclude the dependency
and allow a single package to be generated for run-postinsts.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 meta/classes/systemd.bbclass     | 1 +
 meta/classes/update-rc.d.bbclass | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 2bd63a4..1516cd9 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -55,6 +55,7 @@ fi
 
 
 systemd_populate_packages[vardeps] += "systemd_prerm systemd_postinst"
+systemd_populate_packages[vardepsexclude] += "OVERRIDES"
 
 python systemd_populate_packages() {
     if not oe.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 668ead8..e8debdf 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -71,6 +71,7 @@ PACKAGESPLITFUNCS_prepend = "populate_packages_updatercd "
 PACKAGESPLITFUNCS_remove_class-nativesdk = "populate_packages_updatercd "
 
 populate_packages_updatercd[vardeps] += "updatercd_prerm updatercd_postrm updatercd_preinst updatercd_postinst"
+populate_packages_updatercd[vardepsexclude] += "OVERRIDES"
 
 python populate_packages_updatercd () {
     def update_rcd_auto_depend(pkg):
-- 
2.1.1


