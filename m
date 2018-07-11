Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8BFE160807
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 06:31:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6B6VexB026249
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 23:31:41 -0700 (PDT)
Received: from pek-lpgtest5.wrs.com (128.224.153.85) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Tue, 10 Jul 2018 23:31:40 -0700
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <haiqing.bai@windriver.com>
Date: Wed, 11 Jul 2018 14:01:17 +0800
Message-ID: <20180711060118.30193-1-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Subject: [PATCH] iproute2: create symbol link '/bin/ip' to '/sbin/ip.iproute2'
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
X-List-Received-Date: Wed, 11 Jul 2018 06:31:41 -0000
Content-Type: text/plain

Some applications which depend on iproute/iproute2 need to
run '/sbin/ip.iproute2' through the symbol link '/bin/ip'
e.g ifupdown.

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 4fbfec6f08..71d04a1021 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -29,6 +29,8 @@ do_configure_append () {
 do_install () {
     oe_runmake DESTDIR=${D} install
     mv ${D}${base_sbindir}/ip ${D}${base_sbindir}/ip.iproute2
+    install -d ${D}${base_bindir}
+    ln -s ${base_sbindir}/ip.iproute2 ${D}${base_bindir}/ip
     install -d ${D}${datadir}
     mv ${D}/share/* ${D}${datadir}/ || true
     rm ${D}/share -rf || true
-- 
2.13.3


