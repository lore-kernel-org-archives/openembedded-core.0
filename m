Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6BBF0782EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 14:15:24 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7OEFNRu023825
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 24 Aug 2017 15:15:24 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dksup-0007CQ-T9; Thu, 24 Aug 2017 15:15:23 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Aug 2017 15:15:21 +0100
Message-Id: <1503584121-27629-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503584121-27629-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1503584121-27629-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 24 Aug 2017 15:15:24 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/2] ca-certificates: Fix postinst dependency issues
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
X-List-Received-Date: Thu, 24 Aug 2017 14:15:25 -0000

We were relying on running ca-certificates from the -native version. This
meant the host and target path layouts had to match which might not be true,
it certainly isn't true for the sdk builds.

There was a dependency on run-parts which wasn't represented (we can get it
from busybox or debianutils).

Since this is an allarch script, call the script directly, making sure debianutils
and openssl are available as postinst rootfs time to resolve the issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/ca-certificates/ca-certificates_20161130.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb b/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
index 9a80f43..5867b00 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
@@ -8,10 +8,11 @@ LICENSE = "GPL-2.0+ & MPL-2.0"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=e7358b9541ccf3029e9705ed8de57968"
 
 # This is needed to ensure we can run the postinst at image creation time
-DEPENDS = "ca-certificates-native"
+DEPENDS = ""
 DEPENDS_class-native = "openssl-native"
-DEPENDS_class-nativesdk = "ca-certificates-native openssl-native"
-PACKAGE_WRITE_DEPS += "ca-certificates-native"
+DEPENDS_class-nativesdk = "openssl-native"
+# Need c_rehash from openssl and run-parts from debianutils
+PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
 SRCREV = "adc13592b55ef00450412d61a2145d162a4afb19"
 PR = "r20170717"
@@ -64,7 +65,7 @@ do_install_append_class-target () {
 }
 
 pkg_postinst_${PN} () {
-    SYSROOT="$D" update-ca-certificates
+    SYSROOT="$D" $D${sbindir}/update-ca-certificates
 }
 
 CONFFILES_${PN} += "${sysconfdir}/ca-certificates.conf"
-- 
2.7.4


