Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3011890A93
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 03:21:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2019 19:21:12 -0800
X-IronPort-AV: E=Sophos;i="5.69,327,1571727600"; d="scan'208";a="205701767"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.17.193])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2019 19:21:11 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 11:20:56 +0800
Message-Id: <2e40289582c3223776d7658bac6595669b8dc2c9.1576638856.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1576638856.git.anuj.mittal@intel.com>
References: <cover.1576638856.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 8/9] systemd-systemctl: Fix handling of aliased targets
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
X-List-Received-Date: Wed, 18 Dec 2019 03:21:11 -0000
Content-Transfer-Encoding: 8bit

From: Slavic Brutalik <no@good.com>

The script scans for services, parses them and makes sure those targets are still
there. The exists file check fails if the target is an alias, such as default.target
so add an additional test.

[YOCTO #13685]

(From OE-Core rev: 10bdbf033e51c97f6408c9114d480372135a2c2e)

Signed-off-by: Werner Grift <sky.captin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index ebac863739..990de1ab39 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -172,7 +172,7 @@ class SystemdUnit():
     def _path_for_unit(self, unit):
         for location in locations:
             path = self.root / location / "system" / unit
-            if path.exists():
+            if path.exists() or path.is_symlink():
                 return path
 
         raise SystemdUnitNotFoundError(self.root, unit)
-- 
2.21.0


