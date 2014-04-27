Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 745DC65D3E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 00:24:00 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3R0NtE3015382 for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 01:23:56 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1jwekGxc3UAO
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 01:23:55 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3R0NpgB015377
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 01:23:53 +0100
Message-ID: <1398558226.16672.284.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Apr 2014 01:23:46 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gcc-target: Limit compile to host targets, don't build runtimes.
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
X-List-Received-Date: Sun, 27 Apr 2014 00:24:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently the gcc builds are building copies of the target libraries
that we never use (it isn't installed in do_install). This is a rather
pointless waste of cpu time.

Instead just compile the host targets. Comparing the package output of
this compared to a previous build shows that the unwind.h header is
missing since its provided by gcc. Fix this simply by copying it in.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index aff395c..45a1637 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -100,8 +100,16 @@ FILES_${PN}-doc = "\
   ${gcclibdir}/${TARGET_SYS}/${BINV}/include/README \
 "
 
+do_compile () {
+	oe_runmake all-host
+}
+
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install-host
+
+	# Add unwind.h, it comes from libgcc which we don't want to build again
+	install ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/unwind.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
+
 	# Info dir listing isn't interesting at this point so remove it if it exists.
 	if [ -e "${D}${infodir}/dir" ]; then
 		rm -f ${D}${infodir}/dir



