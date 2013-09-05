Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 054B66147B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 21:17:37 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r85LUjps029918; Thu, 5 Sep 2013 22:30:45 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dTfcFjoK2vVw; Thu,  5 Sep 2013 22:30:45 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r85LUeEb029911
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 5 Sep 2013 22:30:41 +0100
Message-ID: <1378415843.32427.84.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 05 Sep 2013 22:17:23 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH RFC] gcc-runtime: Hacks for libgfortran with gcc-4.8
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
X-List-Received-Date: Thu, 05 Sep 2013 21:17:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

These are the hacks I needed to make libgfortran build. This is ugly, no
argument from me. We could probably get better results if we patch
configure and libtool to stop doing nasty things. I've probably taken
this as far as I'd want to though, not being a particular fan of
fortran...

Khem: Any thoughts on this?

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 2599760..395623f 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -18,6 +18,9 @@ RUNTIMETARGET = "libssp libstdc++-v3 libgomp"
 # libmudflap
 # libgfortran
 
+DEPENDS_append = " chrpath-replacement-native"
+EXTRANATIVEPATH += "chrpath-native"
+
 do_configure () {
 	export CXX="${CXX} -nostdinc++ -nostdlib++"
 	mtarget=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
@@ -30,6 +33,11 @@ do_configure () {
 		cd ${B}/$target/$d/
 		chmod a+x ${S}/$d/configure
 		${S}/$d/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+		# Ugly hack, libgfortran configure looks for ../libquadmath/libquadmath.la 
+		# so we need to compile it before configure
+		if [ "$d" = "libquadmath" ]; then
+			oe_runmake MULTIBUILDTOP=${B}/$target/$d/
+		fi
 	done
 }
 
@@ -38,6 +46,16 @@ do_compile () {
 	for d in libgcc ${RUNTIMETARGET}; do
 		cd ${B}/$target/$d/
 		oe_runmake MULTIBUILDTOP=${B}/$target/$d/
+		if [ "$d" = "libgfortran" ]; then
+			# libtool needs libdir to match the final installation directory which configure
+			# sets from output from this command (e.g. both set to /usr/lib/../lib
+			# It also adds bogus RPATHS which we have to delete
+			fulllibdir=`$CC -print-multi-os-directory`
+			if [ $fulllibdir != "." ]; then
+				sed -i -e "s#relink_command=.*#relink_command=#" ${B}/$target/$d/libgfortran.la
+				chrpath -d `readlink -f ${B}/$target/$d/.libs/libgfortran.so`
+			fi
+		fi
 	done
 }
 




