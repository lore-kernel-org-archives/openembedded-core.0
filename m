Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8HbB-0005sd-Kl for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 22:16:30 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QKHD4I012447 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 21:17:14 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8p2ANbEd-C1z
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 21:17:13 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QKH9tm012443
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 21:17:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2011 21:10:45 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317067852.26109.91.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] sqlite3: Fix nativesdk packaging/QA warnings
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
X-List-Received-Date: Mon, 26 Sep 2011 20:16:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When building sqlite3-nativesdk, there was a warning about debug files in the
main package. This was due to the order of items in PACKAGES with -dbg after
the main package which breaks an assumption native.bbclass makes. Changing
the order fixes the packaging problem with no change to the normal target
packaging.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 2a52a44..ece35c5 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -20,7 +20,7 @@ export config_TARGET_LFLAGS = "${LDFLAGS}"
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 
-PACKAGES = "lib${BPN}${PKGSUFFIX} lib${BPN}${PKGSUFFIX}-dev lib${BPN}${PKGSUFFIX}-doc ${PN} ${PN}-dbg"
+PACKAGES = "lib${BPN}${PKGSUFFIX} lib${BPN}${PKGSUFFIX}-dev lib${BPN}${PKGSUFFIX}-doc ${PN}-dbg ${PN}"
 FILES_${PN} = "${bindir}/*"
 FILES_lib${BPN}${PKGSUFFIX} = "${libdir}/*.so.*"
 FILES_lib${BPN}${PKGSUFFIX}-dev = "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so \
diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb b/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb
index 5651c07..fd03780 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b357
 
 SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3070701.tar.gz"
 S = "${WORKDIR}/sqlite-autoconf-3070701"
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "554026fe7fac47b1cf61c18d5fe43419"
 SRC_URI[sha256sum] = "7dcc36b25f7bcbe2938d0ea2baea5b706f0af93473d02a3f612d7ab39e386edf"




