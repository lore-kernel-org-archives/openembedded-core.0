Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web12.32441.1620656115308496210
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: bst@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7] helo=dude.pengutronix.de.)
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <bst@pengutronix.de>)
	id 1lg6gi-0000IQ-KM; Mon, 10 May 2021 16:15:12 +0200
From: "Bastian Krause" <bst@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Bastian Krause <bst@pengutronix.de>
Subject: [PATCH] ccache: version bump 4.2.1 -> 4.3
Date: Mon, 10 May 2021 16:15:09 +0200
Message-Id: <20210510141509.20043-1-bst@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: 8bit

Instead of [1] a very similar PR [2] was merged that allows
enabling/disabling documentation builds. So drop the patch here and use
the upstream cmake option ENABLE_DOCUMENTATION instead.

[1] https://github.com/ccache/ccache/pull/844
[2] https://github.com/ccache/ccache/pull/842

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
 ...w-disabling-docs-man-page-generation.patch | 161 ------------------
 .../ccache/{ccache_4.2.1.bb => ccache_4.3.bb} |   8 +-
 2 files changed, 3 insertions(+), 166 deletions(-)
 delete mode 100644 meta/recipes-devtools/ccache/ccache/0001-doc-allow-disabling-docs-man-page-generation.patch
 rename meta/recipes-devtools/ccache/{ccache_4.2.1.bb => ccache_4.3.bb} (72%)

diff --git a/meta/recipes-devtools/ccache/ccache/0001-doc-allow-disabling-docs-man-page-generation.patch b/meta/recipes-devtools/ccache/ccache/0001-doc-allow-disabling-docs-man-page-generation.patch
deleted file mode 100644
index 51ca0e82f6..0000000000
--- a/meta/recipes-devtools/ccache/ccache/0001-doc-allow-disabling-docs-man-page-generation.patch
+++ /dev/null
@@ -1,161 +0,0 @@
-From aebabafe085dd1b84027a1e31e5566c82528bd62 Mon Sep 17 00:00:00 2001
-From: Bastian Krause <bst@pengutronix.de>
-Date: Tue, 4 May 2021 11:41:56 +0200
-Subject: [PATCH] doc: allow disabling docs/man page generation
-
-The assumption that HTML documentation and manual pages should be
-generated if the required tools (asciidoc) are present is not always
-true. So add a cmake option that allows disabling the docs/man page
-generation. The default is to generate docs/man pages like before.
-
-Origin: https://github.com/ccache/ccache/pull/844
-Upstream-Status: Submitted
-Signed-off-by: Bastian Krause <bst@pengutronix.de>
----
- doc/CMakeLists.txt | 128 +++++++++++++++++++++++----------------------
- 1 file changed, 66 insertions(+), 62 deletions(-)
-
-diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt
-index c5ce224d..74b7831b 100644
---- a/doc/CMakeLists.txt
-+++ b/doc/CMakeLists.txt
-@@ -1,70 +1,74 @@
-+option(BUILD_DOCS "Indicates whether HTML documentation and manual pages should be built or not" ON)
-+
- find_program(ASCIIDOC_EXE asciidoc)
- mark_as_advanced(ASCIIDOC_EXE) # Don't show in CMake UIs
- 
--if(NOT ASCIIDOC_EXE)
--  message(WARNING "Could not find asciidoc; documentation will not be generated")
--else()
--  #
--  # HTML documentation
--  #
--  function(generate_html adoc_file)
--    get_filename_component(base_name "${adoc_file}" NAME_WE)
--    set(html_file "${base_name}.html")
--    add_custom_command(
--      OUTPUT "${html_file}"
--      COMMAND
--        ${ASCIIDOC_EXE}
--          -o "${html_file}"
--          -a revnumber="${CCACHE_VERSION}"
--          -a toc
--          -b xhtml11
--          "${CMAKE_SOURCE_DIR}/${adoc_file}"
--      MAIN_DEPENDENCY "${CMAKE_SOURCE_DIR}/${adoc_file}"
--    )
--    set(html_files "${html_files}" "${html_file}" PARENT_SCOPE)
--  endfunction()
-+if (BUILD_DOCS)
-+  if(NOT ASCIIDOC_EXE)
-+    message(WARNING "Could not find asciidoc; documentation will not be generated")
-+  else()
-+    #
-+    # HTML documentation
-+    #
-+    function(generate_html adoc_file)
-+      get_filename_component(base_name "${adoc_file}" NAME_WE)
-+      set(html_file "${base_name}.html")
-+      add_custom_command(
-+        OUTPUT "${html_file}"
-+        COMMAND
-+          ${ASCIIDOC_EXE}
-+            -o "${html_file}"
-+            -a revnumber="${CCACHE_VERSION}"
-+            -a toc
-+            -b xhtml11
-+            "${CMAKE_SOURCE_DIR}/${adoc_file}"
-+        MAIN_DEPENDENCY "${CMAKE_SOURCE_DIR}/${adoc_file}"
-+      )
-+      set(html_files "${html_files}" "${html_file}" PARENT_SCOPE)
-+    endfunction()
- 
--  generate_html(LICENSE.adoc)
--  generate_html(doc/AUTHORS.adoc)
--  generate_html(doc/MANUAL.adoc)
--  generate_html(doc/NEWS.adoc)
-+    generate_html(LICENSE.adoc)
-+    generate_html(doc/AUTHORS.adoc)
-+    generate_html(doc/MANUAL.adoc)
-+    generate_html(doc/NEWS.adoc)
- 
--  add_custom_target(doc-html DEPENDS "${html_files}")
--  set(doc_files "${html_files}")
-+    add_custom_target(doc-html DEPENDS "${html_files}")
-+    set(doc_files "${html_files}")
- 
--  #
--  # Man page
--  #
--  find_program(A2X_EXE a2x)
--  mark_as_advanced(A2X_EXE) # Don't show in CMake UIs
--  if(NOT A2X_EXE)
--    message(WARNING "Could not find a2x; man page will not be generated")
--  else()
--    # MANUAL.adoc -> MANUAL.xml -> man page
--    add_custom_command(
--      OUTPUT MANUAL.xml
--      COMMAND
--        ${ASCIIDOC_EXE}
--          -o -
--          -a revnumber=${CCACHE_VERSION}
--          -d manpage
--          -b docbook "${CMAKE_SOURCE_DIR}/doc/MANUAL.adoc"
--        | perl -pe 's!<literal>\(.*?\)</literal>!<emphasis role="strong">\\1</emphasis>!g'
--            >MANUAL.xml
--      MAIN_DEPENDENCY "${CMAKE_SOURCE_DIR}/doc/MANUAL.adoc"
--    )
--    add_custom_command(
--      OUTPUT ccache.1
--      COMMAND ${A2X_EXE} --doctype manpage --format manpage MANUAL.xml
--      MAIN_DEPENDENCY MANUAL.xml
--    )
--    add_custom_target(doc-man-page DEPENDS ccache.1)
--    install(
--      FILES "${CMAKE_CURRENT_BINARY_DIR}/ccache.1"
--      DESTINATION "${CMAKE_INSTALL_MANDIR}/man1"
--    )
--    set(doc_files "${doc_files}" ccache.1)
--  endif()
-+    #
-+    # Man page
-+    #
-+    find_program(A2X_EXE a2x)
-+    mark_as_advanced(A2X_EXE) # Don't show in CMake UIs
-+    if(NOT A2X_EXE)
-+      message(WARNING "Could not find a2x; man page will not be generated")
-+    else()
-+      # MANUAL.adoc -> MANUAL.xml -> man page
-+      add_custom_command(
-+        OUTPUT MANUAL.xml
-+        COMMAND
-+          ${ASCIIDOC_EXE}
-+            -o -
-+            -a revnumber=${CCACHE_VERSION}
-+            -d manpage
-+            -b docbook "${CMAKE_SOURCE_DIR}/doc/MANUAL.adoc"
-+          | perl -pe 's!<literal>\(.*?\)</literal>!<emphasis role="strong">\\1</emphasis>!g'
-+              >MANUAL.xml
-+        MAIN_DEPENDENCY "${CMAKE_SOURCE_DIR}/doc/MANUAL.adoc"
-+      )
-+      add_custom_command(
-+        OUTPUT ccache.1
-+        COMMAND ${A2X_EXE} --doctype manpage --format manpage MANUAL.xml
-+        MAIN_DEPENDENCY MANUAL.xml
-+      )
-+      add_custom_target(doc-man-page DEPENDS ccache.1)
-+      install(
-+        FILES "${CMAKE_CURRENT_BINARY_DIR}/ccache.1"
-+        DESTINATION "${CMAKE_INSTALL_MANDIR}/man1"
-+      )
-+      set(doc_files "${doc_files}" ccache.1)
-+    endif()
- 
--  add_custom_target(doc ALL DEPENDS "${doc_files}")
-+    add_custom_target(doc ALL DEPENDS "${doc_files}")
-+  endif()
- endif()
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/ccache/ccache_4.2.1.bb b/meta/recipes-devtools/ccache/ccache_4.3.bb
similarity index 72%
rename from meta/recipes-devtools/ccache/ccache_4.2.1.bb
rename to meta/recipes-devtools/ccache/ccache_4.3.bb
index 8dd5893d68..53a0bcf7ae 100644
--- a/meta/recipes-devtools/ccache/ccache_4.2.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.3.bb
@@ -11,10 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=698a26b57e513d678e1e7727bf56395b"
 
 DEPENDS = "zstd"
 
-SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz \
-           file://0001-doc-allow-disabling-docs-man-page-generation.patch \
-	   "
-SRC_URI[sha256sum] = "320d2b17d2f76393e5d4bb28c8dee5ca783248e9cd23dff0654694d60f8a4b62"
+SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
+SRC_URI[sha256sum] = "b9789c42e52c73e99428f311a34def9ffec3462736439afd12dbacc7987c1533"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
 
@@ -24,4 +22,4 @@ PATCHTOOL = "patch"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PACKAGECONFIG[docs] = "-DBUILD_DOCS=ON,-DBUILD_DOCS=OFF,asciidoc"
+PACKAGECONFIG[docs] = "-DENABLE_DOCUMENTATION=ON,-DENABLE_DOCUMENTATION=OFF,asciidoc"
-- 
2.29.2

