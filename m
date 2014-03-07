Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7FB6E6B89F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 10:50:16 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s27AoCUw014852 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Mar 2014 10:50:12 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VrtDgGGeQsf2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 10:50:11 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s27Ao7MT014847
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Mar 2014 10:50:09 GMT
Message-ID: <1394189399.12327.31.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Mar 2014 10:49:59 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] wayland: Add target sysroot scanner m4 macro
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
X-List-Received-Date: Fri, 07 Mar 2014 10:50:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

With the new aclocals process, accesses to the macros is a lot stricter and
the native macros are not used. We need to ensure the modified macros are used
in target builds to get the correct scanner functionality. Inserting the
native macro into the target is the correct thing to do in this case.

This resolves build failures in libva.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/wayland/wayland_1.4.0.bb b/meta/recipes-graphics/wayland/wayland_1.4.0.bb
index 0f08cac..604b7f4 100644
--- a/meta/recipes-graphics/wayland/wayland_1.4.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.4.0.bb
@@ -34,3 +34,7 @@ do_install_append_class-native() {
       -e 's,$PKG_CONFIG,pkg-config-native,g' \
       -i ${D}/${datadir}/aclocal/wayland-scanner.m4
 }
+
+sysroot_stage_all_append_class-target () {
+	cp ${STAGING_DATADIR_NATIVE}/aclocal/wayland-scanner.m4 ${SYSROOT_DESTDIR}/${datadir}/aclocal/
+}



