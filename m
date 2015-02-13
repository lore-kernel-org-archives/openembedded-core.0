Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7C987733DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 13:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1DD6EeY019411 for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 13:06:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Wz7iRs5qGrpe
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 13:06:14 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1DD5xxV019398
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 13:06:11 GMT
Message-ID: <1423832759.20217.85.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Feb 2015 13:05:59 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gcc-target: Don't install target gcc libdir files
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
X-List-Received-Date: Fri, 13 Feb 2015 13:06:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Installing /usr/lib/gcc/* means we'd have two copies, one from gcc-cross
and one from here. These can confuse gcc cross where includes use #include_next
and builds track file dependencies (e.g. perl and its makedepends code).
For determinism we don't install this to the sysroot, ever and rely on the
copy from gcc-cross.

[YOCTO #7287]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index a266f16..4c3eea6 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -166,3 +166,12 @@ do_install () {
 
 	chown -R root:root ${D}
 }
+
+# Installing /usr/lib/gcc/* means we'd have two copies, one from gcc-cross
+# and one from here. These can confuse gcc cross where includes use #include_next
+# and builds track file dependencies (e.g. perl and its makedepends code).
+# For determinism we don't install this ever and rely on the copy from gcc-cross.
+# [YOCTO #7287]
+sysroot_stage_dirs_append () {
+	rm -rf $to${libdir}/gcc
+}



