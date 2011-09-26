Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1R8CW7-0007Jt-Vm
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 16:50:48 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QEpgtb027422 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 15:51:42 +0100
X-Quarantine-ID: <C0xo+2H7wMOM>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id C0xo+2H7wMOM
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 15:51:42 +0100 (BST)
Received: from ted (tim [93.97.173.237])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QEpdV6027404
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 15:51:41 +0100
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1R8CQl-0007vl-N6
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 15:45:15 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2011 15:45:04 +0100
Message-Id: <73401f4ceee1928a312d8d0c6fd05a9d4f7874ee.1317048110.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1317048110.git.richard.purdie@linuxfoundation.org>
References: <cover.1317048110.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1317048110.git.richard.purdie@linuxfoundation.org>
References: <cover.1317048110.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 01/03] openssl: Ensure perl scripts reference the correct perl
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
X-List-Received-Date: Mon, 26 Sep 2011 14:50:48 -0000

Without this change the perl path from the build system is used.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssl/openssl.inc      |    1 +
 .../recipes-connectivity/openssl/openssl_0.9.8r.bb |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 88d5081..f3ada13 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -112,4 +112,5 @@ do_install () {
 	chmod 644 ${D}${libdir}/pkgconfig/openssl.pc
 	oe_libinstall -so libcrypto ${D}${libdir}
 	oe_libinstall -so libssl ${D}${libdir}
+	sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
 }
diff --git a/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb b/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
index 54bdcc2..5add70e 100644
--- a/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
+++ b/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
@@ -1,6 +1,6 @@
 require openssl.inc
 
-PR = "r5"
+PR = "r6"
 SRC_URI += "file://debian/ca.patch \
             file://debian/config-hurd.patch;apply=no \
             file://debian/debian-targets.patch \
-- 
1.7.5.4



