Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1Txcn8-0001wX-PC
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 13:17:30 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0M9RrT3025570
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 01:27:54 -0800 (PST)
Received: from pek-wfan-d2.corp.ad.wrs.com (128.224.162.225) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 22 Jan 2013 01:27:53 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jan 2013 17:27:39 +0800
Message-ID: <1358846859-2005-2-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1358846859-2005-1-git-send-email-wenzong.fan@windriver.com>
References: <1358846859-2005-1-git-send-email-wenzong.fan@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] bind: disable nslookup man page
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2013 12:17:33 -0000
Content-Type: text/plain

The nslookup is not shipped for now, we should disable its man page if
the binary tool is not installed.

[YOCTO#3754]

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-connectivity/bind/bind_9.8.1.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.8.1.bb b/meta/recipes-connectivity/bind/bind_9.8.1.bb
index 23ff0b4..18cbb99 100644
--- a/meta/recipes-connectivity/bind/bind_9.8.1.bb
+++ b/meta/recipes-connectivity/bind/bind_9.8.1.bb
@@ -6,7 +6,7 @@ LICENSE = "ISC & BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=0fbe2a3ab3c68ac3fea3cad13093877c"
 
 DEPENDS = "openssl libcap"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://conf.patch \
@@ -38,6 +38,7 @@ FILES_${PN}-dev += "${bindir}/isc-config.h"
 
 do_install_append() {
 	rm "${D}${bindir}/nslookup"
+	rm "${D}${mandir}/man1/nslookup.1"
 	install -d "${D}${sysconfdir}/bind"
 	install -d "${D}${sysconfdir}/init.d"
 	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
-- 
1.7.10.4



