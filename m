Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T6fsB-0007LV-PF
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 12:51:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7TAdWql000204
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 03:39:32 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Wed, 29 Aug 2012 03:39:32 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Aug 2012 18:39:39 +0800
Message-ID: <9f48122d927aa0253b5f5a4e0f3dfe242c557d4e.1346236551.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346236551.git.kai.kang@windriver.com>
References: <cover.1346236551.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/2] Add dependency libidn to 3 packages
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
X-List-Received-Date: Wed, 29 Aug 2012 10:51:48 -0000
Content-Type: text/plain

Add dependency libidn to wget, ghostscript and msmtp. These packages
check libidn automatically to build with or without libidn.
When libidn has been populate to sysroot but doesn't create rpm/deb
package, create image will fail as follow:

| Processing task-core-basic...
| Processing task-core-ssh-openssh...
| Processing task-base-extended...
| error: Failed dependencies:
| 	libidn11 >= 1.25 is needed by msmtp-1.4.24-r3.i586
| 	libidn.so.11(LIBIDN_1.0) is needed by msmtp-1.4.24-r3.i586
| 	libidn.so.11 is needed by msmtp-1.4.24-r3.i586
| 	libidn11 >= 1.25 is needed by ghostscript-9.05-r2.i586
| 	libidn.so.11(LIBIDN_1.0) is needed by ghostscript-9.05-r2.i586
| 	libidn.so.11 is needed by ghostscript-9.05-r2.i586
| ERROR: Function failed: do_rootfs (see
| /mnt/sda10/poky-all-platform/build/tmp/work/qemux86-poky-linux/core-image-lsb-1.0-r0/temp/log.do_rootfs.29665
| for further information)

Add libidn to dependence to fix this error.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../ghostscript/ghostscript_9.05.bb                |    4 ++--
 meta/recipes-extended/msmtp/msmtp_1.4.24.bb        |    4 ++--
 meta/recipes-extended/wget/wget.inc                |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.05.bb b/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
index dc6e481..a0de5db 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
@@ -15,9 +15,9 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c5326026692dbed183f0558f926580f8"
 
-PR = "r2"
+PR = "r3"
 
-DEPENDS = "ghostscript-native tiff jpeg fontconfig cups"
+DEPENDS = "ghostscript-native tiff jpeg fontconfig cups libidn"
 DEPENDS_virtclass-native = ""
 
 SRC_URI_BASE = "http://downloads.ghostscript.com/public/ghostscript-${PV}.tar.gz"
diff --git a/meta/recipes-extended/msmtp/msmtp_1.4.24.bb b/meta/recipes-extended/msmtp/msmtp_1.4.24.bb
index 08566ca..780bdf1 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.4.24.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.4.24.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://msmtp.sourceforge.net/"
 SECTION = "console/network"
 
 LICENSE = "GPLv3"
-DEPENDS = "zlib gnutls"
-PR = "r3"
+DEPENDS = "zlib gnutls libidn"
+PR = "r4"
 
 
 #COPYING or Licence
diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 3575c87..156c8a8 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -2,9 +2,9 @@ DESCRIPTION = "A console URL download utility featuring HTTP, FTP, and more."
 SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-DEPENDS = "openssl"
+DEPENDS = "openssl libidn"
 
-INC_PR = "r15"
+INC_PR = "r16"
 
 inherit autotools gettext update-alternatives
 
-- 
1.7.5.4



