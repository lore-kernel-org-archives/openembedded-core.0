Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sw1PC-0006Nm-Cl
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 03:37:50 +0200
Received: by weyr6 with SMTP id r6so3652997wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 18:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Y4bzq2qTCKvqX/oLIG/XkgOYjGbB4JcvqYMCzozekDg=;
	b=aRz2qlDxFGGm3H80pGq5H7coD5phxo8aMBG6Po0G9vE/7fdC1fe07I47wZKwznYhGB
	+cAthwj+UPoIX+UuWNMT3aF+FqHFjqPlaajA1aCg877LK78zdmxMDbd5Zv2TZU5n+oo/
	0tYTgc+3cysFcdyCLh43zLDf0tpg4TyGkk7MWladEgmKAeMrPxuxW6WyJ4L11+MMjtv6
	463p2qlPNDiKZ72laItOtqoICwY3bKBKfG9Iqybu8qSzttT0MUEFj57fYvY54Ydrpl0A
	Bpvj6RVLtAMpSrHmzHEoOQ42XBnaprVQ/guxEHFjm9baSpo+T50ieKhndaHiMmEYSvkL
	0aLw==
Received: by 10.216.244.202 with SMTP id m52mr5885106wer.28.1343697974014;
	Mon, 30 Jul 2012 18:26:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t8sm19488898wiy.3.2012.07.30.18.26.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 18:26:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 03:26:06 +0200
Message-Id: <1343697966-29777-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [RFC] gdb-cross: add pythonnative
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2012 01:37:50 -0000

* fails like this without:
| gcc -isystem/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -L/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib -L/OE/shr-core/tmp-eglibc/sysroo
ts/x86_64-linux/lib -Wl,-rpath-link,/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/lib -Wl,-rpath,/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/lib -Wl,-O1   \
|       -o gdb gdb.o libgdb.a \
|          -lreadline ../opcodes/libopcodes.a ../bfd/libbfd.a  ../libiberty/libiberty.a ../libdecnumber/libdecnumber.a    -ldl -lncurses -lz -lm    -lpthread -ldl -lutil -lm -lpython2.7 -Xlinker -export-dynamic /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libexpat.so -Wl,-rpath -Wl,/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib ../libiberty/libiberty.a  gnulib/libgnu.a
| libgdb.a(python.o): In function `gdbpy_target_wide_charset':
| python.c:(.text+0x1e7): undefined reference to `PyUnicodeUCS4_Decode'
| libgdb.a(python.o): In function `gdbpy_target_charset':
| python.c:(.text+0x237): undefined reference to `PyUnicodeUCS4_Decode'
| libgdb.a(py-cmd.o): In function `cmdpy_completer':
| py-cmd.c:(.text+0x97): undefined reference to `PyUnicodeUCS4_Decode'
| py-cmd.c:(.text+0xc3): undefined reference to `PyUnicodeUCS4_Decode'
| libgdb.a(py-cmd.o): In function `cmdpy_function':
| py-cmd.c:(.text+0x39d): undefined reference to `PyUnicodeUCS4_Decode'
| libgdb.a(py-frame.o):py-frame.c:(.text+0xa21): more undefined references to `PyUnicodeUCS4_Decode' follow
| libgdb.a(py-utils.o): In function `unicode_to_encoded_string':
| py-utils.c:(.text+0x8): undefined reference to `PyUnicodeUCS4_AsEncodedString'
| libgdb.a(py-utils.o): In function `python_string_to_unicode':
| py-utils.c:(.text+0xc6): undefined reference to `PyUnicodeUCS4_FromEncodedObject'
| libgdb.a(py-utils.o): In function `unicode_to_target_python_string':
| py-utils.c:(.text+0x13a): undefined reference to `PyUnicodeUCS4_AsEncodedString'
| libgdb.a(py-utils.o): In function `target_string_to_unicode':
| py-utils.c:(.text+0x2a5): undefined reference to `PyUnicodeUCS4_Decode'
| libgdb.a(py-value.o): In function `valpy_string':
| py-value.c:(.text+0x4ac): undefined reference to `PyUnicodeUCS4_Decode'
| libgdb.a(py-value.o): In function `valpy_str':
| py-value.c:(.text+0xab4): undefined reference to `PyUnicodeUCS4_Decode'
| collect2: error: ld returned 1 exit status
| make[2]: *** [gdb] Error 1
| make[2]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gdb-cross-7.4.1-r1.0/build-arm-oe-linux-gnueabi/gdb'
| make[1]: *** [all-gdb] Error 2

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross_7.4.1.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.4.1.bb b/meta/recipes-devtools/gdb/gdb-cross_7.4.1.bb
index a14d0ba..81afc38 100644
--- a/meta/recipes-devtools/gdb/gdb-cross_7.4.1.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross_7.4.1.bb
@@ -1,5 +1,7 @@
 require gdb-cross.inc
 
+inherit pythonnative
+
 SRC_URI += "file://sim-install-6.6.patch"
 
 PR = "${INC_PR}.0"
-- 
1.7.8.6



