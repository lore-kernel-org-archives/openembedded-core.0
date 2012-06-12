Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SeY0C-0002Qx-B6
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 22:47:48 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 4E6B12FE87
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 16:37:08 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2012 13:36:41 -0700
Message-Id: <2fcd564b5395950f480a288d434c64c8fee65ece.1339533128.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 4E6B12FE87.CB157
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 10/16] gnupg: disable CCID driver
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
X-List-Received-Date: Tue, 12 Jun 2012 20:47:48 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

The CCID driver driver is apparently unnecessary, so disable it.

Also remove the associated libusb dependency, since that won't be
needed either.

According to Scott Garman <scott.a.garman@intel.com>:

I'd just note that the CCID smartcard reader is a specific piece of
hardware that is unlikely to be used in a majority of our use cases.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Resolved merge conflicts when importing from oe-core master.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-support/gnupg/gnupg_2.0.18.bb |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gnupg/gnupg_2.0.18.bb b/meta/recipes-support/gnupg/gnupg_2.0.18.bb
index 7dfd908..54be88d 100644
--- a/meta/recipes-support/gnupg/gnupg_2.0.18.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.0.18.bb
@@ -4,8 +4,8 @@ LICENSE = "GPLv3 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
 
-DEPENDS = "pth libassuan libksba zlib bzip2 readline libgcrypt libusb"
-PR = "r2"
+DEPENDS = "pth libassuan libksba zlib bzip2 readline libgcrypt"
+PR = "r3"
 
 inherit autotools gettext
 
@@ -15,6 +15,7 @@ SRC_URI[md5sum] = "2f37e0722666a0fedbe4d9f9227ac4d7"
 SRC_URI[sha256sum] = "48aedd762ca443fb952a9e859efe3c66706d7c2c9c77c32dbdbac4fe962dae5b"
 
 EXTRA_OECONF = "--disable-ldap \
+		--disable-ccid-driver \
 		--with-zlib=${STAGING_LIBDIR}/.. \
 		--with-bzip2=${STAGING_LIBDIR}/.. \
                 --with-readline=${STAGING_LIBDIR}/.. \
-- 
1.7.9.5



