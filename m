Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 39E867FC39
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 03:45:07 +0000 (UTC)
IronPort-SDR: ma/b4GlmOWeblPfyxKh7GQ0Zb+Xn5J1E33K4gRXtRS+aiJJznICic2pAsGVpHYYWpFBtEbsvHS
	gD+bnmonX1HzMtre0ngfICCpJ+VWIXGKssVR49S9iiwx403r+0rEqUCpZGeivcwjCWD+URDiku
	sAXe+NTgCK9jT6EmTQP9sADxZ3DJu4g77pNtE/z6k70KhhioSli7Fk8+eM6kQXqVNXnH2gWO9f
	AoLLgOSA7m+kx4RR/g/alLfuM9P5WfWgWZydvERnlfopY5+Yza1XCW38Xn31PL9MBKiTECSEXB
	3+A=
X-IronPort-AV: E=Sophos;i="5.69,408,1571695200"; 
   d="scan'208";a="4160255"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@intel.com>
Date: Wed,  8 Jan 2020 04:44:54 +0100
Message-Id: <20200108034455.10101-6-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200108034455.10101-1-pkj@axis.com>
References: <20200108034455.10101-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH 6/7] oe-pkgdata-browser: Select a matching package when a recipe is selected
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
X-List-Received-Date: Wed, 08 Jan 2020 03:45:08 -0000
Content-Transfer-Encoding: 8bit

When a recipe is selected, automatically select the package that
matches the recipe name (if it exists), otherwise select the first
package.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/oe-pkgdata-browser | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata-browser
index 75d889271b..8d223185a4 100755
--- a/scripts/oe-pkgdata-browser
+++ b/scripts/oe-pkgdata-browser
@@ -176,12 +176,18 @@ class PkgUi():
             return
 
         recipe = model[it][RecipeColumns.Recipe]
-        for package in packages_in_recipe(self.pkgdata, recipe):
+        packages = packages_in_recipe(self.pkgdata, recipe)
+        for package in packages:
             # TODO also show PKG after debian-renaming?
             data = load_runtime_package(self.pkgdata, package)
             # TODO stash data to avoid reading in on_package_changed
             self.package_iters[package] = self.package_store.append([package, int(data["PKGSIZE"])])
 
+        package = recipe if recipe in packages else sorted(packages)[0]
+        path = self.package_store.get_path(self.package_iters[package])
+        self.package_view.set_cursor(path)
+        self.package_view.scroll_to_cell(path)
+
     def on_package_changed(self, selection):
         self.label.set_text("")
         self.file_store.clear()
-- 
2.21.1


