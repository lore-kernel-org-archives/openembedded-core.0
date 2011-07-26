Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QlYOm-0002wh-Ks
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 05:33:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6Q3TM9M004501
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Jul 2011 20:29:22 -0700 (PDT)
Received: from localhost (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 25 Jul 2011 20:29:22 -0700
Message-ID: <91d24bec4de6457460841637c65a68c38c09dd53.1311648798.git.kai.kang@windriver.com>
In-Reply-To: <cover.1311648798.git.kai.kang@windriver.com>
References: <cover.1311648798.git.kai.kang@windriver.com>
Old-Date: Wed, 20 Jul 2011 09:57:12 +0800
Date: Tue, 26 Jul 2011 11:29:19 +0800
To: <scott.a.garman@intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.213]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] cups: add pam support
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
X-List-Received-Date: Tue, 26 Jul 2011 03:33:37 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

According to distro_feature then add pam support for cups or not.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/cups/cups_1.4.6.bb |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/cups/cups_1.4.6.bb b/meta/recipes-extended/cups/cups_1.4.6.bb
index 86b5340..fd20dcc 100644
--- a/meta/recipes-extended/cups/cups_1.4.6.bb
+++ b/meta/recipes-extended/cups/cups_1.4.6.bb
@@ -1,7 +1,8 @@
 require cups14.inc
 
-PR = "r0"
-DEPENDS += "libusb"
+PR = "r1"
+DEPENDS += "libusb \
+       ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=956e7600195e6139f12de8c2a5bbefa9"
 SRC_URI += " \
@@ -12,6 +13,7 @@ SRC_URI += " \
 SRC_URI[md5sum] = "de8fb5a29c36554925c0c6a6e2c0dae1"
 SRC_URI[sha256sum] = "f08711702a77b52c7150f96fe1f45482f6151cb95ef601268c528607fe6ad514"
 
-EXTRA_OECONF += " --disable-gssapi --enable-debug --disable-relro --enable-libusb"
+EXTRA_OECONF += " --disable-gssapi --enable-debug --disable-relro --enable-libusb \
+       ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
 
 CONFFILES_${PN} += "${sysconfdir}/cups/cupsd.conf"
-- 
1.7.5.1.300.gc565c



