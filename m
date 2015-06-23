Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B12AE74115
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 14:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5NEDmE4027368 for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 15:13:48 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id X7MXzykbacgS
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 15:13:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5NEDZlj027356
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 15:13:47 +0100
Message-ID: <1435068815.11489.79.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jun 2015 15:13:35 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] apt-native: Drop obsolete symlinks
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
X-List-Received-Date: Tue, 23 Jun 2015 14:13:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Apt no longer uses GLIBC_VER and LIBSTDCPP_VER variables nor appears
to need these odd symlinks. The variables expand to empty enties
which then create symlinks which loop back on themselves.

To fix, drop the obsolete code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devtools/apt/apt-native.inc
index 567eb0c..27cc9ff 100644
--- a/meta/recipes-devtools/apt/apt-native.inc
+++ b/meta/recipes-devtools/apt/apt-native.inc
@@ -47,12 +47,8 @@ do_install_base () {
 
 	oe_libinstall -so -C bin libapt-private ${D}${libdir}/
 
-	eval `cat environment.mak | grep ^GLIBC_VER | sed -e's, = ,=,'`
-	eval `cat environment.mak | grep ^LIBSTDCPP_VER | sed -e's, = ,=,'`
 	oe_libinstall -so -C bin libapt-pkg$GLIBC_VER$LIBSTDCPP_VER ${D}${libdir}/
-	ln -sf libapt-pkg$GLIBC_VER$LIBSTDCPP_VER.so ${D}${libdir}/libapt-pkg.so
 	oe_libinstall -so -C bin libapt-inst$GLIBC_VER$LIBSTDCPP_VER ${D}${libdir}/
-	ln -sf libapt-inst$GLIBC_VER$LIBSTDCPP_VER.so ${D}${libdir}/libapt-inst.so
 
 	install -d ${D}${libdir}/apt/methods
 	install -m 0755 bin/methods/* ${D}${libdir}/apt/methods/



