Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 761776E7D3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 11:23:36 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1SBNWHs020526 for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 11:23:32 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mG_AkKUK43Xg
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 11:23:32 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1SBNTgT020495
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 11:23:31 GMT
Message-ID: <1393586602.31769.196.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Feb 2014 11:23:22 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] python3: Fix make race
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
X-List-Received-Date: Fri, 28 Feb 2014 11:23:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This fixes a race which was showing up on the autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/python/python3-native_3.3.3.bb b/meta/re=
cipes-devtools/python/python3-native_3.3.3.bb
index 26b811f..ef33e43 100644
--- a/meta/recipes-devtools/python/python3-native_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.3.3.bb
@@ -22,6 +22,7 @@ file://shutil-follow-symlink-fix.patch \
 file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
 file://sysroot-include-headers.patch \
 file://unixccompiler.patch \
+file://makerace.patch \
 ${DISTRO_SRC_URI} \
 "
 SRC_URI[md5sum] =3D "f3ebe34d4d8695bf889279b54673e10c"
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/rec=
ipes-devtools/python/python3/makerace.patch
new file mode 100644
index 0000000..62d7de1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -0,0 +1,26 @@
+There is a race due to the execution of make inside the makefile:
+
+| gcc  -pthread -c -Wno-unused-result -DNDEBUG -g  -O3 -Wall -Wstrict-prot=
otypes -isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-wo=
rld/build/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -isystem/ho=
me/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/build/build/tm=
p/sysroots/x86_64-linux/usr/include -O2 -pipe   -I. -IInclude -I./Include -=
isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/buil=
d/build/tmp/sysroots/x86_64-linux/usr/include -isystem/home/pokybuild/yocto=
-autobuilder-dev/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-=
linux/usr/include -fPIC -DPy_BUILD_CORE -o Objects/obmalloc.o Objects/obmal=
loc.c
+| gcc  -pthread -c -Wno-unused-result -DNDEBUG -g  -O3 -Wall -Wstrict-prot=
otypes -isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-wo=
rld/build/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -isystem/ho=
me/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/build/build/tm=
p/sysroots/x86_64-linux/usr/include -O2 -pipe   -I. -IInclude -I./Include -=
isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/buil=
d/build/tmp/sysroots/x86_64-linux/usr/include -isystem/home/pokybuild/yocto=
-autobuilder-dev/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-=
linux/usr/include -fPIC -DPy_BUILD_CORE -o Parser/pgen.o Parser/pgen.c| gcc=
  -pthread -c -Wno-unused-result -DNDEBUG -g  -O3 -Wall -Wstrict-prototypes=
 -isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/bu=
ild/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -isystem/home/pok=
ybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/build/build/tmp/sysr=
oots/x86_64-linux/usr/include -O2 -pipe   -I. -IInclude -I./Include -isyste=
m/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/build/buil=
d/tmp/sysroots/x86_64-linux/usr/include -isystem/home/pokybuild/yocto-autob=
uilder-dev/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/=
usr/include -fPIC -DPy_BUILD_CORE -o Objects/obmalloc.o Objects/obmalloc.c
+| gcc  -pthread -c -Wno-unused-result -DNDEBUG -g  -O3 -Wall -Wstrict-prot=
otypes -isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-wo=
rld/build/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -isystem/ho=
me/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/build/build/tm=
p/sysroots/x86_64-linux/usr/include -O2 -pipe   -I. -IInclude -I./Include -=
isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/buil=
d/build/tmp/sysroots/x86_64-linux/usr/include -isystem/home/pokybuild/yocto=
-autobuilder-dev/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-=
linux/usr/include -fPIC -DPy_BUILD_CORE -o Objects/obmalloc.o Objects/obmal=
loc.c
+| Objects/obmalloc.o: file not recognized: File truncated
+| collect2: error: ld returned 1 exit status
+| make[1]: *** [Parser/pgen] Error 1
+
+The easiest way to avoid this is to list the dependencies explictly.
+
+RP 28/2/2014
+
+Index: Python-3.3.3/Makefile.pre.in
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- Python-3.3.3.orig/Makefile.pre.in	2014-02-27 14:04:38.268339533 +0000
++++ Python-3.3.3/Makefile.pre.in	2014-02-28 10:40:59.166361125 +0000
+@@ -676,7 +676,7 @@
+=20
+ $(IO_OBJS): $(IO_H)
+=20
+-$(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGENSRCS)
++$(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGENSRCS) $(PGEN)
+ 		@$(MKDIR_P) Include
+ 		$(MAKE) $(PGEN)
+ 		$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
diff --git a/meta/recipes-devtools/python/python3_3.3.3.bb b/meta/recipes-d=
evtools/python/python3_3.3.3.bb
index d359863..4eb2108 100644
--- a/meta/recipes-devtools/python/python3_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3_3.3.3.bb
@@ -17,6 +17,7 @@ file://110-enable-zlib.patch \
 file://130-readline-setup.patch \
 file://150-fix-setupterm.patch \
 file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
+file://makerace.patch \
 ${DISTRO_SRC_URI} \
 "
=20


