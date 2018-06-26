Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DCE036010D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 18:51:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5QIpLo0021607
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 11:51:21 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 26 Jun 2018 11:51:20 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jun 2018 11:51:20 -0700
Message-ID: <20180626185120.86068-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] gtk-immodules-cache: add conditional delay_to_first_boot
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
X-List-Received-Date: Tue, 26 Jun 2018 18:51:21 -0000
Content-Type: text/plain

We might not be able to execute target code using qemu, so
defer to first boot in that case.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/classes/gtk-immodules-cache.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
index 9bb0af8..3b8acb1 100644
--- a/meta/classes/gtk-immodules-cache.bbclass
+++ b/meta/classes/gtk-immodules-cache.bbclass
@@ -10,13 +10,16 @@ GTKIMMODULES_PACKAGES ?= "${PN}"
 
 gtk_immodule_cache_postinst() {
 if [ "x$D" != "x" ]; then
+    # allow for not being able to execute target code via qemu
     $INTERCEPT_DIR/postinst_intercept update_gtk_immodules_cache ${PKG} \
             mlprefix=${MLPREFIX} \
             binprefix=${MLPREFIX} \
             libdir=${libdir} \
             libexecdir=${libexecdir} \
             base_libdir=${base_libdir} \
-            bindir=${bindir}
+            bindir=${bindir} || \
+    $INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} \
+            mlprefix=${MLPREFIX}
 else
     if [ ! -z `which gtk-query-immodules-2.0` ]; then
         gtk-query-immodules-2.0 > ${libdir}/gtk-2.0/2.10.0/immodules.cache
-- 
2.7.4


