Return-Path: <Lu.Jiang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B76B07CE66
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 09:42:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2K9gAKp000406
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Mar 2019 02:42:10 -0700 (PDT)
Received: from ljiang0-OptiPlex-9020.wrs.com (128.224.162.158) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 20 Mar 2019 02:42:09 -0700
From: Jiang Lu <lu.jiang@windriver.com>
To: <lu.jiang@windriver.com>, <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 20 Mar 2019 17:39:28 +0800
Message-ID: <20190320093929.28688-4-lu.jiang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190320093929.28688-1-lu.jiang@windriver.com>
References: <20190320093929.28688-1-lu.jiang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] glib-networking:enable glib-networking build as native package
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
X-List-Received-Date: Wed, 20 Mar 2019 09:42:11 -0000
Content-Type: text/plain

Enable glib-networking build as a native package, for it is depended
by libsoup.

Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
---
 .../glib-networking/glib-networking_2.58.0.bb            | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
index f3190e1cae..96ba181b71 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
@@ -29,3 +29,12 @@ FILES_${PN} += "\
                 "
 FILES_${PN}-dev += "${libdir}/gio/modules/libgio*.la"
 FILES_${PN}-staticdev += "${libdir}/gio/modules/libgio*.a"
+
+# Make sure we compile with ca-certificates support enabled.
+PACKAGECONFIG_append = " ca-certificates"
+
+DEPENDS += "ca-certificates"
+RDEPENDS_${PN} += "ca-certificates"
+
+# We need native version for ostree-/flatpak-native.
+BBCLASSEXTEND = "native"
-- 
2.17.1


