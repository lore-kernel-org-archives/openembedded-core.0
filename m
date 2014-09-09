Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3B5FB7125C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 06:35:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s896ZbKQ005089
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Sep 2014 23:35:37 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 23:35:36 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Sep 2014 14:35:50 +0800
Message-ID: <b96a6f2a162ef49f6f0492337f7402e72e6d56c0.1410244514.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410244514.git.Qi.Chen@windriver.com>
References: <cover.1410244514.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] iputils: fix program location and QA warning
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
X-List-Received-Date: Tue, 09 Sep 2014 06:35:37 -0000
Content-Type: text/plain

From: Chen Qi <qi.chen@windriver.com>

[CQID: WIND00444742]

According to FHS, only `ping' is required to be under /bin.
So this patch move other commands like `ping6' and 'traceroute6' to
/usr/bin.

Doing so will fix QA warnings of unsafe reference of binaries in ping6.

/bin/ping6.iputils requires /usr/lib/libgnutls.so.26
/bin/ping6.iputils requires /usr/lib/libgcrypt.so.11
/bin/ping6.iputils requires /usr/lib/libgpg-error.so.0
/bin/ping6.iputils requires /usr/lib/libtasn1.so.6

(LOCAL REV: NOT UPSTREAM) -- Sent to oe-core on 20131113

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
---
 meta/recipes-extended/iputils/iputils_s20121221.bb | 29 ++++++++++++++--------
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
1.9.1


