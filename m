Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 587086E5F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 16:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t69GqbZB030840 for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jul 2015 17:52:59 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lOlqgMSD-rVa
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 17:52:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t69Gqj5j030874
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jul 2015 17:52:56 +0100
Message-ID: <1436460764.9778.42.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 09 Jul 2015 17:52:44 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] libtool: Fix regression from previous commit
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
X-List-Received-Date: Thu, 09 Jul 2015 16:53:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Commit http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=f44aa10ec122df309d9810d4d25fbb8f799107d2
inadvertently moved the m4 macros to the -dev package. These need to be
in the main package since libtoolize is useless without them.

Move them back (as the commented code implies was always needed)

[YOCTO #7889]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
index b5343b0..3182986 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
@@ -39,7 +39,7 @@ DEPENDS = "libtool-native"
 PACKAGES =+ "libltdl"
 FILES_${PN} += "${datadir}/aclocal"
 
-#FILES_${PN}-dev := "${@oe_filter_out('${datadir}/aclocal', '${FILES_libtool-dev}', d)}"
+FILES_${PN}-dev_remove = "${datadir}/aclocal"
 FILES_libltdl = "${libdir}/libltdl${SOLIBS}"
 
 export CONFIG_SHELL="/bin/dash"



