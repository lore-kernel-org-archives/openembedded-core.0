Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E67686D470
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 07:01:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6P71NRM023529
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 00:01:24 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 25 Jul 2019 00:01:12 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Jul 2019 15:01:11 +0800
Message-ID: <1564038071-229899-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libsoup: Add password capabilities for use with ostree
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
X-List-Received-Date: Thu, 25 Jul 2019 07:01:23 -0000
Content-Type: text/plain

From: Jason Wessel <jason.wessel@windriver.com>

Add the ability to use a password encoded URI for use with ostree.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 ...0001-add-soup_uri_to_string_with_password.patch | 67 ++++++++++++++++++++++
 meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-add-soup_uri_to_string_with_password.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-add-soup_uri_to_string_with_password.patch b/meta/recipes-support/libsoup/libsoup-2.4/0001-add-soup_uri_to_string_with_password.patch
new file mode 100644
index 0000000..c679d6b
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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
index c4715a0..2d1f921 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
@@ -11,6 +11,7 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://0001-Do-not-enforce-no-introspection-when-cross-building.patch \
+           file://0001-add-soup_uri_to_string_with_password.patch \
            "
 SRC_URI[md5sum] = "66c2ae89d6031b01337d78a2c57c75d5"
 SRC_URI[sha256sum] = "bd2ea602eba642509672812f3c99b77cbec2f3de02ba1cc8cb7206bf7de0ae2a"
-- 
2.7.4


