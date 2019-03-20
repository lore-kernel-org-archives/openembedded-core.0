Return-Path: <Lu.Jiang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 344297CEC4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 09:42:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2K9fnIl017919
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Mar 2019 02:41:59 -0700
Received: from ljiang0-OptiPlex-9020.wrs.com (128.224.162.158) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 20 Mar 2019 02:41:36 -0700
From: Jiang Lu <lu.jiang@windriver.com>
To: <lu.jiang@windriver.com>, <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 20 Mar 2019 17:39:26 +0800
Message-ID: <20190320093929.28688-2-lu.jiang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190320093929.28688-1-lu.jiang@windriver.com>
References: <20190320093929.28688-1-lu.jiang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] libsoup:add soup_uri_to_string_with_password
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
X-List-Received-Date: Wed, 20 Mar 2019 09:42:24 -0000
Content-Type: text/plain

The existed soup_uri_to_string does not have password, add a
function to support it.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
---
 ...add-soup_uri_to_string_with_password.patch | 67 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.64.2.bb             |  3 +-
 2 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-add-soup_uri_to_string_with_password.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-add-soup_uri_to_string_with_password.patch b/meta/recipes-support/libsoup/libsoup-2.4/0001-add-soup_uri_to_string_with_password.patch
new file mode 100644
index 0000000000..c679d6b9e5
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/0001-add-soup_uri_to_string_with_password.patch
@@ -0,0 +1,67 @@
+From 82c2f059bc7c491c8c4c728408eb913bfc4a6f0a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 6 Jun 2018 22:37:30 +0800
+Subject: [PATCH] add soup_uri_to_string_with_password
+
+The existed soup_uri_to_string does not have password, add a
+function to support it.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ libsoup/soup-uri.c | 21 +++++++++++++++++++++
+ libsoup/soup-uri.h |  5 +++++
+ 2 files changed, 26 insertions(+)
+
+diff --git a/libsoup/soup-uri.c b/libsoup/soup-uri.c
+index 3eafd87..8421f1c 100644
+--- a/libsoup/soup-uri.c
++++ b/libsoup/soup-uri.c
+@@ -619,6 +619,27 @@ soup_uri_to_string (SoupURI *uri, gboolean just_path_and_query)
+ }
+ 
+ /**
++ * soup_uri_to_string_with_password:
++ * @uri: a #SoupURI
++ * @just_path_and_query: if %TRUE, output just the path and query portions
++ *
++ * Returns a string representing @uri.
++ *
++ * If @just_path_and_query is %TRUE, this concatenates the path and query
++ * together. That is, it constructs the string that would be needed in
++ * the Request-Line of an HTTP request for @uri.
++ *
++ * Note that the output will contain a password, if @uri does.
++ *
++ * Return value: a string representing @uri, which the caller must free.
++ **/
++char *
++soup_uri_to_string_with_password (SoupURI *uri, gboolean just_path_and_query)
++{
++	return soup_uri_to_string_internal (uri, just_path_and_query, TRUE, FALSE);
++}
++
++/**
+  * soup_uri_copy:
+  * @uri: a #SoupURI
+  *
+diff --git a/libsoup/soup-uri.h b/libsoup/soup-uri.h
+index b9360c6..af702d3 100644
+--- a/libsoup/soup-uri.h
++++ b/libsoup/soup-uri.h
+@@ -57,6 +57,11 @@ char   	   *soup_uri_to_string             (SoupURI    *uri,
+ 					    gboolean    just_path_and_query);
+ 
+ SOUP_AVAILABLE_IN_2_4
++char   	   *soup_uri_to_string_with_password             (SoupURI    *uri,
++					    gboolean    just_path_and_query);
++
++
++SOUP_AVAILABLE_IN_2_4
+ SoupURI	   *soup_uri_copy                  (SoupURI    *uri);
+ 
+ SOUP_AVAILABLE_IN_2_4
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
index ae7c1a6863..a123818cf3 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
@@ -11,6 +11,7 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://0001-Do-not-enforce-no-introspection-when-cross-building.patch \
+           file://0001-add-soup_uri_to_string_with_password.patch \
            "
 SRC_URI[md5sum] = "cac755dc6c6acd6e0c70007f547548f5"
 SRC_URI[sha256sum] = "75ddc194a5b1d6f25033bb9d355f04bfe5c03e0e1c71ed0774104457b3a786c6"
@@ -48,4 +49,4 @@ EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'Tr
 DEBIAN_NOAUTONAME_${PN} = "1"
 
 # glib-networking is needed for SSL, proxies, etc.
-RRECOMMENDS_${PN} = "glib-networking"
+DEPENDS += "glib-networking"
-- 
2.17.1


