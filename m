Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E21BD71D9A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 00:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0V0Ea8T006136; Tue, 31 Jan 2017 00:14:36 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Q-l-BhKR-0Eh; Tue, 31 Jan 2017 00:14:36 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0V0EXi3006128
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 31 Jan 2017 00:14:34 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cYM5h-00079N-Fi; Tue, 31 Jan 2017 00:14:33 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 00:14:24 +0000
Message-Id: <1485821667-27436-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485821667-27436-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1485821667-27436-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/5] relocatable: Make native .pc files relocatable
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
X-List-Received-Date: Tue, 31 Jan 2017 00:14:40 -0000

The native .pc files currently have hardcoded paths in them meaning each has
to be relocated at final install time. pkg-config has built in functionality
to avoid this, namely the pcfiledir variable.

This function translates .pc files to use the variable meaning further
relocation later is unnecessary.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/relocatable.bbclass | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes/relocatable.bbclass b/meta/classes/relocatable.bbclass
index 4ca9981..582812c 100644
--- a/meta/classes/relocatable.bbclass
+++ b/meta/classes/relocatable.bbclass
@@ -1,7 +1,18 @@
 inherit chrpath
 
-SYSROOT_PREPROCESS_FUNCS += "relocatable_binaries_preprocess"
+SYSROOT_PREPROCESS_FUNCS += "relocatable_binaries_preprocess relocatable_native_pcfiles"
 
 python relocatable_binaries_preprocess() {
     rpath_replace(d.expand('${SYSROOT_DESTDIR}'), d)
 }
+
+relocatable_native_pcfiles () {
+	if [ -d ${SYSROOT_DESTDIR}${libdir}/pkgconfig ]; then
+		rel=${@os.path.relpath(d.getVar('base_prefix'), d.getVar('libdir') + "/pkgconfig")}
+		sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" ${SYSROOT_DESTDIR}${libdir}/pkgconfig/*.pc
+	fi
+	if [ -d ${SYSROOT_DESTDIR}${datadir}/pkgconfig ]; then
+		rel=${@os.path.relpath(d.getVar('base_prefix'), d.getVar('datadir') + "/pkgconfig")}
+		sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" ${SYSROOT_DESTDIR}${datadir}/pkgconfig/*.pc
+	fi
+}
-- 
2.7.4


