Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 10B7871A74
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Apr 2018 01:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 56D33189A1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Apr 2018 03:54:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id R0i1ZZFxCk90
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Apr 2018 03:54:51 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 3EC84183A0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Apr 2018 03:54:51 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B2DB1A081
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Apr 2018 03:54:51 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E8CA1A05F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Apr 2018 03:54:51 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Apr 2018 03:54:51 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 1106C707
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Apr 2018 03:54:51 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w3S1si5d005206
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Apr 2018 03:54:44 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w3S1siSa005205
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Apr 2018 03:54:44 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Apr 2018 03:54:42 +0200
Message-Id: <20180428015442.5162-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] glib: Make glib-mkenums ignore unknown per value options
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
X-List-Received-Date: Sat, 28 Apr 2018 01:54:52 -0000

If some other per value option was present than 'skip' or 'nick' then
a KeyError would occur. Ignoring such options matches the behaviour of
the old, Perl-based glib-mkenums.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...s-Ignore-other-per-value-options-than-ski.patch | 32 ++++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.54.3.bb      |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-glib-mkenums-Ignore-other-per-value-options-than-ski.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-glib-mkenums-Ignore-other-per-value-options-than-ski.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-glib-mkenums-Ignore-other-per-value-options-than-ski.patch
new file mode 100644
index 0000000000..c87635a082
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-glib-mkenums-Ignore-other-per-value-options-than-ski.patch
@@ -0,0 +1,32 @@
+From 12ffb50d587003a46678567b771c6e984035a5e9 Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <pkj@axis.com>
+Date: Sat, 28 Apr 2018 03:07:50 +0200
+Subject: [PATCH] glib-mkenums: Ignore other per value options than 'skip' and
+ 'nick'
+
+If some other per value option was present than 'skip' or 'nick' then
+a KeyError would occur. Ignoring such options matches the behaviour of
+the old, Perl-based glib-mkenums.
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=795008]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ gobject/glib-mkenums.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
+index fe9a10756..4ccc1f458 100755
+--- a/gobject/glib-mkenums.in
++++ b/gobject/glib-mkenums.in
+@@ -218,7 +218,7 @@ def parse_entries(file, file_name):
+             if options is not None:
+                 options = parse_trigraph(options)
+                 if 'skip' not in options:
+-                    entries.append((name, value, options['nick']))
++                    entries.append((name, value, options.get('nick', None)))
+             else:
+                 entries.append((name, value))
+         elif re.match(r's*\#', line):
+-- 
+2.12.0
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.54.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.54.3.bb
index faf594569d..53fa07e74c 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.54.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.54.3.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-ignore-return-value-of-write.patch \
            file://0001-Test-for-pthread_getname_np-before-using-it.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
+           file://0001-glib-mkenums-Ignore-other-per-value-options-than-ski.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.12.0


