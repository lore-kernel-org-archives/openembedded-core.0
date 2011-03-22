Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q26Fa-0006id-1E
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 19:24:14 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q26Dn-0001fH-Kp from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 11:22:23 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 22 Mar 2011 11:22:23 -0700
Received: from localhost.localdomain ([172.30.80.248]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 22 Mar 2011 12:22:22 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2011 11:21:57 -0700
Message-Id: <3f44e1b84aa48bcf4c9a92639b0146ebecc90538.1300817337.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1300817337.git.tom_rini@mentor.com>
References: <cover.1300817337.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 22 Mar 2011 18:22:22.0392 (UTC)
	FILETIME=[1630D380:01CBE8BE]
Subject: [PATCH 2/2] gettext.bbclass: Fix cases where we lost DEPENDS_GETTEXT
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Mar 2011 18:24:14 -0000

This is a partial sync-up with 2a9a834ce426f4dc97162870ef1632540ff044f1
of openembedded master.  After consulting with Khem there's a few things
that we can do to further improve the situation but doing this fixes
the cases such as BBCLASSEXTEND where we can loose DEPENDS_GETTEXT
and trigger the QA error about missing inherit gettext (when we aren't).

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/classes/gettext.bbclass |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
index a40e74f..45e883f 100644
--- a/meta/classes/gettext.bbclass
+++ b/meta/classes/gettext.bbclass
@@ -4,7 +4,7 @@ def gettext_after_parse(d):
         cfg = oe_filter_out('^--(dis|en)able-nls$', bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
         cfg += " --disable-nls"
         depends = bb.data.getVar('DEPENDS', d, 1) or ""
-        bb.data.setVar('DEPENDS', oe_filter_out('^(virtual/libiconv|virtual/libintl)$', depends, d), d)
+        bb.data.setVar('DEPENDS', oe_filter_out('^(gettext|gettext-native|virtual/libiconv|virtual/libintl)$', depends, d), d)
         bb.data.setVar('EXTRA_OECONF', cfg, d)
 
 python () {
@@ -13,5 +13,9 @@ python () {
 
 DEPENDS_GETTEXT = "gettext gettext-native"
 
-DEPENDS =+ "${DEPENDS_GETTEXT}"
+DEPENDS_prepend += "${DEPENDS_GETTEXT} "
+DEPENDS_virtclass-native_prepend = "${DEPENDS_GETTEXT} "
+DEPENDS_virtclass-nativesdk_prepend = "${DEPENDS_GETTEXT} "
+DEPENDS_virtclass-cross_prepend = "${DEPENDS_GETTEXT} "
+DEPENDS_virtclass-crosssdk_prepend = "${DEPENDS_GETTEXT} "
 EXTRA_OECONF += "--enable-nls"
-- 
1.7.0.4



