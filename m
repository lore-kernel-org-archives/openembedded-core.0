Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A37936E5D7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 14:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t13EOhlC012830; Tue, 3 Feb 2015 14:25:15 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sO5BhIvB7mt0; Tue,  3 Feb 2015 14:25:15 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t13EOwlE012891
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 3 Feb 2015 14:25:12 GMT
Message-ID: <1422973498.22544.17.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 03 Feb 2015 14:24:58 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] libtool: Fix tools path issues
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
X-List-Received-Date: Tue, 03 Feb 2015 14:25:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If for example you build on a machine with /bin/grep, then restore that sstate
onto a machine with /usr/bin/grep, things will fail. Simply don't bother
hardcoding paths.

This was lost during the libtool upgrade:

http://git.yoctoproject.org/cgit.cgi/poky/diff/meta/recipes-devtools/libtool/libtool/avoid_absolute_paths_for_general_utils.patch?id=d4e1862453b2a4c12400de0f43f08a9871a4de60

since the path to the files changed. This restores the previous behaviour.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.5.inc b/meta/recipes-devtools/libtool/libtool-2.4.5.inc
index 603dc52..5b22250 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.5.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.5.inc
@@ -17,6 +17,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://norm-rpath.patch \
            file://dont-depend-on-help2man.patch \
            file://fix-resolve-lt-sysroot.patch \
+           file://nohardcodepaths.patch \
           "
 
 SRC_URI[md5sum] = "7d30ed9fa6bb11270ebb31639a37bd54"
diff --git a/meta/recipes-devtools/libtool/libtool/nohardcodepaths.patch b/meta/recipes-devtools/libtool/libtool/nohardcodepaths.patch
new file mode 100644
index 0000000..b2239fb
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/nohardcodepaths.patch
@@ -0,0 +1,27 @@
+If for example you build on a machine with /bin/grep, then restore that sstate
+onto a machine with /usr/bin/grep, things will fail. Simply don't bother
+hardcoding paths.
+
+RP 2015/2/3
+
+Index: libtool-2.4.5/libtoolize.in
+===================================================================
+--- libtool-2.4.5.orig/libtoolize.in
++++ libtool-2.4.5/libtoolize.in
+@@ -40,11 +40,11 @@
+ 
+ : ${AUTOCONF="autoconf"}
+ : ${AUTOMAKE="automake"}
+-: ${EGREP="@EGREP@"}
+-: ${FGREP="@FGREP@"}
+-: ${GREP="@GREP@"}
+-: ${LN_S="@LN_S@"}
+-: ${SED="@SED@"}
++: ${EGREP="egrep"}
++: ${FGREP="fgrep"}
++: ${GREP="grep"}
++: ${LN_S="ln -s"}
++: ${SED="sed"}
+ 
+ 
+ ## -------------------------- ##



