Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A8DAD727E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 10:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3SAoK9J028858 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:51:24 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dZIlBqoGIisM
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:51:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3SApCbf028970
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:51:23 +0100
Message-ID: <1430218272.13022.164.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Apr 2015 11:51:12 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] autotools: Fix find races on source directory
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
X-List-Received-Date: Tue, 28 Apr 2015 10:51:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In a similar way to http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=aa1438b56f30515f9c31b306decef7f562dda81f
there are more find races in the autotools class.

For recipes with PACKAGES_remove = "${PN}", the find which removes
.la files can race against deletion of other directories in WORKDIR
e.g.:
find: '/home/autobuilder/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/qemux86_64-poky-linux/init-ifupdown/1.0-r7/sstate-build-populate_lic': No such file or directory
| WARNING: /home/autobuilder/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/qemux86_64-poky-linux/init-ifupdown/1.0-r7/temp/run.do_configure.6558:1 exit 1 from
| find /home/autobuilder/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/qemux86_64-poky-linux/init-ifupdown/1.0-r7 -name \*.la -delete

Fix the remaining races in the same way.

[YOCTO #7522]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 19c1091..24bc530 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -116,7 +116,7 @@ autotools_preconfigure() {
 					echo "Running \"${MAKE} clean\" in ${S}"
 					${MAKE} clean
 				fi
-				find ${S} -name \*.la -delete
+				find ${S} -ignore_readdir_race -name \*.la -delete
 			fi
 		fi
 	fi
@@ -227,7 +227,7 @@ autotools_do_configure() {
 	# for a package whose autotools are old, on an x86_64 machine, which the old
 	# config.sub does not support.  Work around this by installing them manually
 	# regardless.
-	( for ac in `find ${S} -name configure.in -o -name configure.ac`; do
+	( for ac in `find ${S} -ignore_readdir_race -name configure.in -o -name configure.ac`; do
 		rm -f `dirname $ac`/configure
 		done )
 	if [ -e ${S}/configure.in -o -e ${S}/configure.ac ]; then
@@ -236,7 +236,7 @@ autotools_do_configure() {
 		ACLOCAL="aclocal --system-acdir=${ACLOCALDIR}/"
 		if [ x"${acpaths}" = xdefault ]; then
 			acpaths=
-			for i in `find ${S} -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
+			for i in `find ${S} -ignore_readdir_race -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
 				grep -v 'acinclude.m4' | grep -v 'aclocal-copy' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
 				acpaths="$acpaths -I $i"
 			done
@@ -277,7 +277,7 @@ autotools_do_configure() {
 					fi
 				fi
 				for i in gettext.m4 iconv.m4 lib-ld.m4 lib-link.m4 lib-prefix.m4 nls.m4 po.m4 progtest.m4; do
-					for j in `find ${S} -name $i | grep -v aclocal-copy`; do
+					for j in `find ${S} -ignore_readdir_race -name $i | grep -v aclocal-copy`; do
 						rm $j
 					done
 				done



