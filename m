Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UHPiP-0007Lo-TJ
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 03:22:44 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I2EYQm024770; Mon, 18 Mar 2013 02:14:35 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hQc0oBwye1P1; Mon, 18 Mar 2013 02:14:35 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I2ETiu024750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 18 Mar 2013 02:14:30 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UHPRv-0003VK-1Y; Mon, 18 Mar 2013 02:05:19 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2013 02:05:05 +0000
Message-Id: <1363572312-13399-7-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363572312-13399-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1363572312-13399-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 07/13] icu: Fix case where ${B} != ${S}
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
X-List-Received-Date: Mon, 18 Mar 2013 02:22:59 -0000

Fix out of tree builds by fixing cwd assumptions and using correct
full paths where needed, or just simply the correct paths.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/icu/icu.inc |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index 64b3edf..d7cb84a 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -27,15 +27,15 @@ EXTRA_OECONF_class-native = ""
 # This is a bug of ICU. See bug reference:
 # http://bugs.icu-project.org/trac/ticket/9790
 do_configure_prepend() {
-    [ -f acinclude.m4 ] || cp aclocal.m4 acinclude.m4
+    [ -f ${S}/acinclude.m4 ] || cp ${S}/aclocal.m4 ${S}/acinclude.m4
 }
 
 do_install_append_class-native() {
 	mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
-	cp -r ${S}/config/icucross.mk ${D}/${STAGING_ICU_DIR_NATIVE}/config
-	cp -r ${S}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
-	cp -r ${S}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
-	cp -r ${S}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
+	cp -r ${B}/config/icucross.mk ${D}/${STAGING_ICU_DIR_NATIVE}/config
+	cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
+	cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
+	cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
 
 }
 
-- 
1.7.10.4



