Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 793976D95F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 06:23:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rAD6N9hU014493
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 22:23:09 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 12 Nov 2013 22:23:08 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2013 14:23:08 +0800
Message-ID: <713d5188805f43ade79f8d1e5db31427303f4d3b.1384323613.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1384323613.git.Qi.Chen@windriver.com>
References: <cover.1384323613.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 6/7] iputils: fix program location and QA warning
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
X-List-Received-Date: Wed, 13 Nov 2013 06:23:07 -0000
Content-Type: text/plain

From: Chen Qi <qi.chen@windriver.com>

According to FHS, only `ping' is required to be under /bin.
So this patch move other commands like `ping6' and 'traceroute6' to
/usr/bin.

Doing so will fix QA warnings of unsafe reference of binaries in ping6.

/bin/ping6.iputils requires /usr/lib/libgnutls.so.26
/bin/ping6.iputils requires /usr/lib/libgcrypt.so.11
/bin/ping6.iputils requires /usr/lib/libgpg-error.so.0
/bin/ping6.iputils requires /usr/lib/libtasn1.so.6

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/iputils/iputils_s20121221.bb |   29 ++++++++++++--------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-extended/iputils/iputils_s20121221.bb b/meta/recipes-extended/iputils/iputils_s20121221.bb
index 46f8903..5849f0d 100644
--- a/meta/recipes-extended/iputils/iputils_s20121221.bb
+++ b/meta/recipes-extended/iputils/iputils_s20121221.bb
@@ -29,15 +29,16 @@ do_compile () {
 }
 
 do_install () {
-	install -m 0755 -d ${D}${base_bindir} ${D}${mandir}/man8
+	install -m 0755 -d ${D}${base_bindir} ${D}${mandir}/man8 ${D}${bindir} ${D}${sbindir}
 	# SUID root programs
 	install -m 4555 ping ${D}${base_bindir}/ping
-	install -m 4555 ping6 ${D}${base_bindir}/ping6
-	install -m 4555 traceroute6 ${D}${base_bindir}/
+	install -m 4555 ping6 ${D}${bindir}/ping6
+	install -m 4555 traceroute6 ${D}${bindir}/
 	# Other programgs
-	for i in arping tracepath tracepath6; do
-	  install -m 0755 $i ${D}${base_bindir}/
+	for i in tracepath tracepath6; do
+	  install -m 0755 $i ${D}${bindir}/
 	done
+	install -m 0755 arping ${D}${sbindir}/
 	# Manual pages for things we build packages for
 	for i in tracepath.8 traceroute6.8 ping.8 arping.8; do
 	  install -m 0644 doc/$i ${D}${mandir}/man8/ || true
@@ -52,7 +53,13 @@ ALTERNATIVE_${PN}-ping = "ping"
 ALTERNATIVE_LINK_NAME[ping] = "${base_bindir}/ping"
 
 ALTERNATIVE_${PN}-ping6 = "ping6"
-ALTERNATIVE_LINK_NAME[ping6] = "${base_bindir}/ping6"
+ALTERNATIVE_LINK_NAME[ping6] = "${bindir}/ping6"
+
+ALTERNATIVE_${PN}-traceroute6 = "traceroute6"
+ALTERNATIVE_LINK_NAME[traceroute6] = "${bindir}/traceroute6"
+
+ALTERNATIVE_${PN}-arping = "arping"
+ALTERNATIVE_LINK_NAME[arping] = "${sbindir}/arping"
 
 PACKAGES += "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath ${PN}-tracepath6 ${PN}-traceroute6"
 
@@ -61,9 +68,9 @@ RDEPENDS_${PN} += "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath ${PN}-tra
 
 FILES_${PN}	= ""
 FILES_${PN}-ping = "${base_bindir}/ping.${BPN}"
-FILES_${PN}-ping6 = "${base_bindir}/ping6.${BPN}"
-FILES_${PN}-arping = "${base_bindir}/arping"
-FILES_${PN}-tracepath = "${base_bindir}/tracepath"
-FILES_${PN}-tracepath6 = "${base_bindir}/tracepath6"
-FILES_${PN}-traceroute6	= "${base_bindir}/traceroute6"
+FILES_${PN}-ping6 = "${bindir}/ping6.${BPN}"
+FILES_${PN}-arping = "${sbindir}/arping.${BPN}"
+FILES_${PN}-tracepath = "${bindir}/tracepath"
+FILES_${PN}-tracepath6 = "${bindir}/tracepath6"
+FILES_${PN}-traceroute6	= "${bindir}/traceroute6.${BPN}"
 FILES_${PN}-doc	= "${mandir}/man8"
-- 
1.7.9.5


