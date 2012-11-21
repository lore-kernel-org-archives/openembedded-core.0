Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Tb6yr-0005fi-QJ
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 10:52:30 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAL9cLjC011596
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Nov 2012 01:38:21 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 21 Nov 2012 01:38:20 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Wed, 21 Nov 2012 17:38:43 +0800
Message-ID: <c663a8b7207bc86e5a26f31f4027316dcac63576.1353490311.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1353490311.git.kai.kang@windriver.com>
References: <cover.1353490311.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] chkconfig: add link files install_initd and remove_initd
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
X-List-Received-Date: Wed, 21 Nov 2012 09:52:30 -0000
Content-Type: text/plain

Add link files ${libdir}/lsb/{install,remove}_initd that they are
required by LSB tests. They were created by package lsbsetup, but
lsbsetup was dropped, so create them in chkconfig.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../recipes-extended/chkconfig/chkconfig_1.3.58.bb |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
index 0f6398f..fd7bd1a 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
 DEPENDS = "libnewt popt"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2"
 
@@ -30,3 +30,11 @@ do_install_append() {
     mkdir -p ${D}${sysconfdir}/chkconfig.d
     rm -f ${D}${sbindir}/update-alternatives
 }
+
+do_install_append_linuxstdbase() {
+	install -d ${D}${libdir}/lsb/
+	ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/install_initd
+	ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/remove_initd
+}
+
+FILES_${PN}_append_linuxstdbase += "${libdir}/lsb"
-- 
1.7.5.4



