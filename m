Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id EA843755F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 23:22:44 +0000 (UTC)
Received: by pasz6 with SMTP id z6so53994005pas.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 16:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bVeygtJj5joYGuC1uiYqEn/NKsVIgH7Ix3V+u+Nzfkc=;
	b=D5uiTsLvagGPQvKD0j+mOfkjZP2YikcBbGJbrsiFg7kx6VV7lz8zFx5t6r26Jqk5CA
	Vr3XdnstQu6nTkL3JKGjXNl7PDVd+SO62TZi8ZQgD+ijOwvrMglRoLATXO6HZN8Q9tfF
	pU0pCsY2LbNg+vF8guo7Om5e+ETxK8JELVKVOYjZ/RRVAKlVkuUH/swehzYITp++DIMw
	TuICC7WBFpNl0lCHl0dOC9DAejWHD1VffqHOhG4OirYKirDLdOYd91tn42JxbnE478oO
	fsfLzOjrVgusEzm3YjsksYyVYrDZ45MNy9VloZWmWB9wm48qHaclB3ePgl6ci1/pVQzO
	oKng==
X-Received: by 10.66.189.68 with SMTP id gg4mr4988252pac.6.1446160964554;
	Thu, 29 Oct 2015 16:22:44 -0700 (PDT)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id
	iy1sm4269110pbb.85.2015.10.29.16.22.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Oct 2015 16:22:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Oct 2015 16:22:41 -0700
Message-Id: <1446160961-25182-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [master][jethro][fido][PATCH] libxslt: CVE-2015-7995
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
X-List-Received-Date: Thu, 29 Oct 2015 23:22:45 -0000

From: Armin Kuster <akuster@mvista.com>

This is a is being give a High rating so please consider it for
all 1.1.28 versions.

A type confusion error within the libxslt "xsltStylePreCompute()"
function in preproc.c can lead to a DoS. Confirmed in version 1.1.28,
other versions may also be affected.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../libxslt/libxslt/CVE-2015-7995.patch            | 33 ++++++++++++++++++++++
 meta/recipes-support/libxslt/libxslt_1.1.28.bb     |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch

diff --git a/meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch b/meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch
new file mode 100644
index 0000000..e4d09c2
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch
@@ -0,0 +1,33 @@
+From 7ca19df892ca22d9314e95d59ce2abdeff46b617 Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Thu, 29 Oct 2015 19:33:23 +0800
+Subject: Fix for type confusion in preprocessing attributes
+
+CVE-2015-7995 http://www.openwall.com/lists/oss-security/2015/10/27/10
+We need to check that the parent node is an element before dereferencing
+its namespace
+
+Upstream-Status: Backport
+
+https://git.gnome.org/browse/libxslt/commit/?id=7ca19df892ca22d9314e95d59ce2abdeff46b617
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ libxslt/preproc.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+Index: libxslt-1.1.28/libxslt/preproc.c
+===================================================================
+--- libxslt-1.1.28.orig/libxslt/preproc.c
++++ libxslt-1.1.28/libxslt/preproc.c
+@@ -2245,7 +2245,8 @@ xsltStylePreCompute(xsltStylesheetPtr st
+ 	} else if (IS_XSLT_NAME(inst, "attribute")) {
+ 	    xmlNodePtr parent = inst->parent;
+ 
+-	    if ((parent == NULL) || (parent->ns == NULL) ||
++	    if ((parent == NULL) ||
++	        (parent->type != XML_ELEMENT_NODE) || (parent->ns == NULL) ||
+ 		((parent->ns != inst->ns) &&
+ 		 (!xmlStrEqual(parent->ns->href, inst->ns->href))) ||
+ 		(!xmlStrEqual(parent->name, BAD_CAST "attribute-set"))) {
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.28.bb b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
index 166bcd8..87fabec 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.28.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
@@ -10,7 +10,8 @@ DEPENDS = "libxml2"
 
 SRC_URI = "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
            file://pkgconfig_fix.patch \
-           file://pkgconfig.patch"
+           file://pkgconfig.patch \
+           file://CVE-2015-7995.patch"
 
 SRC_URI[md5sum] = "9667bf6f9310b957254fdcf6596600b7"
 SRC_URI[sha256sum] = "5fc7151a57b89c03d7b825df5a0fae0a8d5f05674c0e7cf2937ecec4d54a028c"
-- 
2.3.5


