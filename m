Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 85EDE60116
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 18:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 5C5D818145
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 20:16:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id H5ODAVUvLZu8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 20:16:43 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 9724A1811C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 20:16:43 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 8122814F4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 20:16:43 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 763821102
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 20:16:43 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 74A7E1086
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 20:16:43 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u36IGhd1004042
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Apr 2016 20:16:43 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u36IGhCK004041
	for openembedded-core@lists.openembedded.org;
	Wed, 6 Apr 2016 20:16:43 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Apr 2016 20:16:42 +0200
Message-Id: <7233483e1d443fd02bf6fa1282dff28190b6de76.1459966555.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1459966555.git.pkj@axis.com>
References: <cover.1459966555.git.pkj@axis.com>
In-Reply-To: <cover.1459966555.git.pkj@axis.com>
References: <cover.1459966555.git.pkj@axis.com>
Subject: [PATCH 1/1] libnl: Make sure files end up in libnl-cli as they should
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
X-List-Received-Date: Wed, 06 Apr 2016 18:16:46 -0000

The modules that belong to libnl-cli ended up in libnl-dev since the
latter appeared earlier in PACKAGES than the former. This also avoids
warnings like the following:

  WARNING: libnl-1_3.2.25-r1 do_package: libnl-dev-3.2.25 was
  registered as shlib provider for basic.so, changing it to
  libnl-cli-3.2.25 because it was built later

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-support/libnl/libnl_3.2.25.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libnl/libnl_3.2.25.bb b/meta/recipes-support/libnl/libnl_3.2.25.bb
index cabe841..a80c23e 100644
--- a/meta/recipes-support/libnl/libnl_3.2.25.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.25.bb
@@ -27,7 +27,7 @@ RREPLACES_${PN} = "libnl2"
 RCONFLICTS_${PN} = "libnl2"
 FILES_${PN}-staticdev += "${libdir}/libnl/cli/*/*.a"
 
-PACKAGES += "${PN}-cli ${PN}-route ${PN}-nf ${PN}-genl ${PN}-idiag"
+PACKAGES =+ "${PN}-cli ${PN}-route ${PN}-nf ${PN}-genl ${PN}-idiag"
 FILES_${PN}-cli   = "${libdir}/libnl-cli-3.so.* \
                      ${libdir}/libnl/cli/*/*.so \
                      ${libdir}/libnl/cli/*/*.la \
-- 
2.1.0


