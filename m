Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D46A979D62
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 21:54:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3ALs4b0000568
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 14:54:04 -0700 (PDT)
Received: from ord-lpggp3.wrs.com (128.224.149.46) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 10 Apr 2019 14:54:04 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Apr 2019 17:54:02 -0400
Message-ID: <20190410215402.20055-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] gobject-introspection.bbclass: Disable writing to $HOME/.cache/g-ir-scanner
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
X-List-Received-Date: Wed, 10 Apr 2019 21:54:05 -0000
Content-Type: text/plain

Investigation of an end user going over their quota in the user's home
directory showed that the gobject-instrospection is writing files into
the ~/.cache/g-ir-scanner when building -native packages.  The test
package in this case was gdk-pixbuf-native.

Setting the GI_SCANNER_DISABLE_CACHE in the bbclass should be all that
is needed.  The qemu wrapper was already setting this properly, but we
also need it for the -native builds.

meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.3.bb:131:
export GI_SCANNER_DISABLE_CACHE=1

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/gobject-introspection.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
index 4ceb0c68b1..359620fba7 100644
--- a/meta/classes/gobject-introspection.bbclass
+++ b/meta/classes/gobject-introspection.bbclass
@@ -27,6 +27,9 @@ DEPENDS_append_class-nativesdk = " gobject-introspection-native"
 # This is used by introspection tools to find .gir includes
 export XDG_DATA_DIRS = "${STAGING_DATADIR}:${STAGING_LIBDIR}"
 
+# Disable writing to $HOME/.cache/g-ir-scanner
+export GI_SCANNER_DISABLE_CACHE = "1"
+
 do_configure_prepend_class-target () {
     # introspection.m4 pre-packaged with upstream tarballs does not yet
     # have our fixes
-- 
2.17.1


