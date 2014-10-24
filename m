Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D57A165CED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 14:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9OEGUJm027185 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 15:16:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QGLOpIuCTQln
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 15:16:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9OEGSQ5027181
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 15:16:29 +0100
Message-ID: <1414160223.30118.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Oct 2014 15:17:03 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] base.bbclass: Enable using 'make clean' for rebuilds
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
X-List-Received-Date: Fri, 24 Oct 2014 14:17:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When something rebuilds say due to ${baselib} changing or some
other key variable, software is often not rebuilt due to the
fact that make detects no dependency change.

By running "make clean" when these changes occur, we can at least try
and ensure the correct rebuilds happen. We use the same checksum check as 
autotools to decide if things have changed or not.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index d6a2292..52b835e 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -230,11 +230,24 @@ gdkpixbuf_complete() {
 	GDK_PIXBUF_FATAL_LOADER=1 ${STAGING_BINDIR_NATIVE}/gdk-pixbuf-query-loaders --update-cache || exit 1
 }
 
+CONFIGURESTAMPFILE = "${WORKDIR}/configure.sstate"
+
 addtask configure after do_patch
 do_configure[dirs] = "${S} ${B}"
 do_configure[deptask] = "do_populate_sysroot"
 base_do_configure() {
-	:
+	if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ]; then
+		if [ "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" ]; then
+			cd ${B}
+			if [ -e Makefile -o -e makefile -o -e GNUmakefile ]; then
+				${MAKE} clean
+			fi
+			find ${B} -name \*.la -delete
+		fi
+	fi
+	if [ -n "${CONFIGURESTAMPFILE}" ]; then
+		echo ${BB_TASKHASH} > ${CONFIGURESTAMPFILE}
+	fi
 }
 
 addtask compile after do_configure



