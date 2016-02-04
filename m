Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8CFA677309
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 13:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u14D7ts7021268 for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Feb 2016 13:07:55 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3CpHwCsRwKdo
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 13:07:55 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u14D7rK8021261
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Feb 2016 13:07:54 GMT
Message-ID: <1454591273.27087.238.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 04 Feb 2016 13:07:53 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] libical: Work around hardcoded paths in pkgconfig file
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
X-List-Received-Date: Thu, 04 Feb 2016 13:07:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

For now, work around the hardcoded path in the pkgconfig file.
Issue filed upstream as:

https://github.com/libical/libical/issues/227

This raises questions about whether some sanity tests are running.
Those issues will be addressed in a separate patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-support/libical/libical_2.0.0.bb b/meta/recipes-support/libical/libical_2.0.0.bb
index fdbe026..0e5ada9 100644
--- a/meta/recipes-support/libical/libical_2.0.0.bb
+++ b/meta/recipes-support/libical/libical_2.0.0.bb
@@ -18,3 +18,10 @@ UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 inherit cmake
 
 FILES_${PN}-dev += "${libdir}/cmake/*"
+
+#
+# Turn specific library paths in the pkgconfig file into standard library entries
+#
+do_install_append () {
+	sed -i -e "s#${STAGING_LIBDIR}/lib\([a-z0-9]*\)\.so#-l\1#g" ${D}${libdir}/pkgconfig/libical.pc
+}



