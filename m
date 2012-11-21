Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Tb6ys-0005fj-1m
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 10:52:30 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAL9cNlC021676
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Nov 2012 01:38:23 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 21 Nov 2012 01:38:22 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Wed, 21 Nov 2012 17:38:44 +0800
Message-ID: <bbf45c7739e8d08864c771446b487a5169e1f488.1353490311.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1353490311.git.kai.kang@windriver.com>
References: <cover.1353490311.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] msmtp: add link to ${libdir}/sendmail
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

LSB tests check file ${libdir}/sendmail, and the file was created by
package lsbsetup. Because lsbsetup is dropped, create the link in msmtp.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/msmtp/msmtp_1.4.24.bb |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.4.24.bb b/meta/recipes-extended/msmtp/msmtp_1.4.24.bb
index 13de167..5a290a4 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.4.24.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.4.24.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 
 LICENSE = "GPLv3"
 DEPENDS = "zlib gnutls"
-PR = "r4"
+PR = "r5"
 
 
 #COPYING or Licence
@@ -25,3 +25,10 @@ ALTERNATIVE_${PN} = "sendmail"
 ALTERNATIVE_TARGET[sendmail] = "${bindir}/msmtp"
 ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
 ALTERNATIVE_PRIORITY = "100"
+
+do_install_append_linuxstdbase() {
+	install -d ${D}${libdir}/
+	ln -sf ${sbindir}/sendmail ${D}/${libdir}/sendmail
+}
+
+FILES_${PN}_append_linuxstdbase += "${libdir}/sendmail"
-- 
1.7.5.4



