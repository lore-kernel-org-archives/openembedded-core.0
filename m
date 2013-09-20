Return-Path: <leimaohui@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id E0EE360115
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 07:23:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.90,938,1371052800"; 
   d="scan'208";a="8569454"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 20 Sep 2013 15:20:29 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r8K7NfRX018032
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 15:23:41 +0800
Received: from G08FNSTD100511 ([10.167.226.63])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013092015220707-1651413 ;
	Fri, 20 Sep 2013 15:22:07 +0800 
From: "leimaohui" <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Sep 2013 15:23:37 +0800
Message-ID: <00d301ceb5d2$539fbc20$fadf3460$@cn.fujitsu.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Ac610f+HxcqT57neTcGyH4z+jMTezA==
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/09/20 15:22:07,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/09/20 15:22:07,
	Serialize complete at 2013/09/20 15:22:07
Cc: fnst-ulinux@cn.fujitsu.com
Subject: [PATCH 1/1] valgrind: Fix compile error about VEX/auxprogs/genoffsets.c
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
X-List-Received-Date: Fri, 20 Sep 2013 07:23:42 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset="gb2312"
Content-Language: zh-cn

To all=20

    =
=C7=EB=B8=F7=CE=BB=B0=EF=C3=A6review=D2=BB=CF=C2=D2=D4=CF=C2=B5=C4patch



In some situations VEX/auxprogs/genoffsets.c will be compiled.But it =
will cause
a compile error.=20
The error message looks like:

| powerpc-poky-linux-gnuspe-gcc  -m32 -mcpu=3D8548 -mabi=3Dspe -mspe
-mfloat-gprs=3Ddouble =
--sysroot=3D/yocto/fnst/leimh/ubinux-v14/build/p1020rdb/build.
ubinux-p1020rdb/tmp/sysroots/ubinux-p1020rdb -Wno-long-long -O2 -pipe -g
-feliminate-unused-debug-types -Wno-pointer-sign -fno-stack-protector \
|             -Wbad-function-cast -Wcast-qual -Wcast-align =
-fstrict-aliasing \
|             -m32 -O2 -g -Wall -Wmissing-prototypes -Wshadow =
-Wpointer-arith
-Wstrict-prototypes -Wmissing-declarations -Wno-format-zero-length
-fno-strict-aliasing -fno-builtin \
|                               -O -S -o auxprogs/genoffsets.s \
|                                        auxprogs/genoffsets.c
| powerpc-poky-linux-gnuspe-gcc: error: auxprogs/genoffsets.c: No such =
file or
directory


The patch below will fix the error.

Signed-off-by: leimaohui <leimaohui@cn.fujitsu.com>
---
 .../valgrind-3.8.1/fix-genoffsets-error.patch      |   24 =
++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.8.1.bb   |    1 +
 2 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644
meta/recipes-devtools/valgrind/valgrind-3.8.1/fix-genoffsets-error.patch

diff --git =
a/meta/recipes-devtools/valgrind/valgrind-3.8.1/fix-genoffsets-error.
patch =
b/meta/recipes-devtools/valgrind/valgrind-3.8.1/fix-genoffsets-error.patc=
h
new file mode 100644
index 0000000..463c8d0
--- /dev/null
+++ =
b/meta/recipes-devtools/valgrind/valgrind-3.8.1/fix-genoffsets-error.patc=
h
@@ -0,0 +1,24 @@
+diff --git a/Makefile.vex.am b/Makefile.vex.am
+index db16276..e00319b 100644
+--- a/Makefile.vex.am
++++ b/Makefile.vex.am
+@@ -69,17 +69,18 @@ pub/libvex_guest_offsets.h: auxprogs/genoffsets.c \
+               pub/libvex_guest_arm.h \
+               pub/libvex_guest_s390x.h \
+               pub/libvex_guest_mips32.h
++  [ ! -d auxprogs ] && mkdir auxprogs
+   rm -f auxprogs/genoffsets.s
+   $(CC) $(CFLAGS) \
+         $(LIBVEX_CFLAGS) \
+         $(AM_CFLAGS_@VGCONF_PLATFORM_PRI_CAPS@) \
+               -O -S -o auxprogs/genoffsets.s \
+-                   auxprogs/genoffsets.c
++                   `if test -f 'auxprogs/genoffsets.c'; then =
$(CYGPATH_W)
'auxprogs/genoffsets.c'; else $(CYGPATH_W) =
'$(srcdir)/auxprogs/genoffsets.c
'; fi`
+   grep xyzzy auxprogs/genoffsets.s | grep "^#define" \
+      | sed "s/xyzzy\\$$//g" \
+      | sed "s/xyzzy#//g" \
+      | sed "s/xyzzy//g" \
+-     > pub/libvex_guest_offsets.h
++     > $(srcdir)/pub/libvex_guest_offsets.h
+   rm -f auxprogs/genoffsets.s
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
index 3520d49..2d36258 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
@@ -18,6 +18,7 @@ SRC_URI =3D
"http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            =
file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
            file://configure-with-newer-glibc.patch \
            file://sepbuildfix.patch \
+          file://fix-genoffsets-error.patch \
           "

 SRC_URI[md5sum] =3D "288758010b271119a0ffc0183f1d6e38"
--
1.7.1



