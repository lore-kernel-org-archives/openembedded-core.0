Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 585A37557B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 08:00:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6B80IJb014961
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 01:00:19 -0700 (PDT)
Received: from pek-lpgtest5.wrs.com (128.224.153.85) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 11 Jul 2018 01:00:18 -0700
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <haiqing.bai@windriver.com>
Date: Wed, 11 Jul 2018 15:29:46 +0800
Message-ID: <1531294187-8173-1-git-send-email-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ifupdown: fix issue that ifupdown does not configure local interface
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
X-List-Received-Date: Wed, 11 Jul 2018 08:00:18 -0000
Content-Type: text/plain

The patch "inet-6-.defn-fix-inverted-checks-for-loopback.patch" is not
needed for ifupdown-0.8.16. And it causes the issue that ifupdown can
not configure the loopback interface like:
$cat /etc/network/interfaces
auto lo
iface lo inet loopback
$ifconfig shows all up interfaces including 'lo'
$ifup lo
ifup: interface lo already configured
$ifdown lo
$ifconfig still shows the up interface 'lo'

The function of ifup/ifdown depends on '/bin/ip' which is provided by
iproute2, so here add this runtime dependency.

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 meta/recipes-core/ifupdown/ifupdown_0.8.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb
index e9f3a2a..f91831f 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb
@@ -8,13 +8,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https \
 	   file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch \
-	   file://inet-6-.defn-fix-inverted-checks-for-loopback.patch \
 	   file://99_network \
 	  "
 SRCREV = "11b9f99f7ecc7052497e6786156cfed531f11823"
 
 S = "${WORKDIR}/git"
 
+RDEPENDS_${PN} = "iproute2"
 
 inherit update-alternatives
 
-- 
1.9.1


