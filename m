Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 31FC57FC36
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 03:45:09 +0000 (UTC)
IronPort-SDR: zXgFEtAWC7nndldvLh8rMRhqxp/3l35PYp1gcbHWjP2yxpS70v586p99GpAn05oKdUOhOOYLUB
	li3+1BYgI8IYEz7EI2fWmFIG3FL3X0SzHKX8Ik8mdHbaNI7569WqKoF3gOQqprlIpkqT5sIAv4
	NwaBNIfPfPCJVv9hlTEpiJZK/+hjiiI5mGLGd0AwR0vqwYOPuFvgJswp2e1j+CvuV1vtjDV1nw
	htgM/n1SO1c/igKwTNfWz75q9W6v2x0K4rkvbCDN5nXo68BAHnDJj/ymkpc/+BOHlgf/vtCD3b
	pv0=
X-IronPort-AV: E=Sophos;i="5.69,408,1571695200"; d="scan'208,217";a="4160260"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@intel.com>
Date: Wed,  8 Jan 2020 04:44:52 +0100
Message-Id: <20200108034455.10101-4-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200108034455.10101-1-pkj@axis.com>
References: <20200108034455.10101-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH 4/7] oe-pkgdata-browser: Show file sizes in a human readable format
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
X-List-Received-Date: Wed, 08 Jan 2020 03:45:10 -0000
Content-Transfer-Encoding: 8bit

Just like the package sizes already are shown.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/oe-pkgdata-browser       | 2 ++
 scripts/oe-pkgdata-browser.glade | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata-browser
index 36b5e798fa..57e56f66ee 100755
--- a/scripts/oe-pkgdata-browser
+++ b/scripts/oe-pkgdata-browser
@@ -133,6 +133,8 @@ class PkgUi():
 
         self.file_store = builder.get_object("file_store")
         self.file_store.set_sort_column_id(FileColumns.Filename, Gtk.SortType.ASCENDING)
+        builder.get_object("file_size_column").set_cell_data_func(builder.get_object("file_size_cell"), lambda column, cell, model, iter, data: cell.set_property("text", human_size(model[iter][FileColumns.Size])))
+
         self.files_view = builder.get_object("files_scrollview")
         self.files_label = builder.get_object("files_label")
 
diff --git a/scripts/oe-pkgdata-browser.glade b/scripts/oe-pkgdata-browser.glade
index 04e987b975..a6aae60bdd 100644
--- a/scripts/oe-pkgdata-browser.glade
+++ b/scripts/oe-pkgdata-browser.glade
@@ -289,12 +289,12 @@
                               </object>
                             </child>
                             <child>
-                              <object class="GtkTreeViewColumn" id="treeviewcolumn4">
+                              <object class="GtkTreeViewColumn" id="file_size_column">
                                 <property name="title" translatable="yes">Size</property>
                                 <property name="sort_indicator">True</property>
                                 <property name="sort_column_id">1</property>
                                 <child>
-                                  <object class="GtkCellRendererText" id="cellrenderertext4"/>
+                                  <object class="GtkCellRendererText" id="file_size_cell"/>
                                   <attributes>
                                     <attribute name="text">1</attribute>
                                   </attributes>
-- 
2.21.1


