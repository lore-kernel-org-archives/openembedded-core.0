Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2475378984
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 16:39:14 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id f21-v6so18365wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=BRshqaKld7Io9VSDJsVES7hDsC/hPU2FqJROYA0ofe4=;
	b=ZM5r+nQq/i1eqtIVvAozac9elrVlL5FF4Iv4ibClILnP2h7vPfTsogheJ/zZs6h3se
	j6BzaiBXWfMCFbTsyPrX6vAcX0ohJnik5yqUrR+clU8Z/ArGH3B2rQcgd1cv85mFVCqS
	2GyENHE60srfZ2/ujqHDiVkyF4V4bo3FG8gMEi5LbA6HjRKRqGe4qBmSF9mSFIngYDjs
	EGwyMtNLuU49rBnJb6EUrPv+R43aq7dCciRX7tGOVleJOrGm2/Um3k4GRV+MkbPr5Lq4
	S+7HUAH0tLC+4aBeYruVAD7iZhgstu4pSyFH23vI1FrCu4nrDr4b5BLjyO5DkQ8IP28d
	df+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BRshqaKld7Io9VSDJsVES7hDsC/hPU2FqJROYA0ofe4=;
	b=d7xa8FkZC/qUrvKqJQozi/POUxS5ttTFyXnhhPjnxSK04FTHzc/8WGp9EBRD1IaQp5
	8iagHAu7G6Nx1Ym+DICjaiA3C1aI1y+3s//kHEeztbPFrkFpsZzIvPSOwa7CDrUP9xsc
	C69ZeuQnxtnLhCbicQ8omHZ6uPbDRLj/YYVGRYD0EhzKFzMyaHZERwKdlN8sifpJmd3W
	jP0UwYPU20avYcW/tmpCnMVRCQ+oyftJ2b859ozLLIQ8EpLbOKwsWZ0KbrCnjvgsppSM
	tet09asn5mLuPLhtrk71XBzbt1kNBhREIjvbECo3kYSvZUnA4/Abrg03ZCCBEtYcPNsf
	Eb6w==
X-Gm-Message-State: AOUpUlEP/h/Yx+Vmc+F8gulN4EGDXvhhGZDiPH1Tjj9YXXXlHQ0nX1At
	oBbq77wRN8wJgPO/fX4PR5IHvKSw
X-Google-Smtp-Source: AAOMgpebWylikfTTmBCrGURdC14syaOW8iVe79eDsr0AWqBxJOUyFZK5SLo/MKZbQY1tGuiFJwLIQQ==
X-Received: by 2002:a1c:ea17:: with SMTP id
	i23-v6mr1881006wmh.29.1531845555191; 
	Tue, 17 Jul 2018 09:39:15 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i125-v6sm15958wmd.11.2018.07.17.09.39.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jul 2018 09:39:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 17:38:56 +0100
Message-Id: <20180717163910.3196-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 01/15] bc: upgrade to 1.07.1
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
X-List-Received-Date: Tue, 17 Jul 2018 16:39:15 -0000

Relicensed to just GPLv3+, update LICENSE and checksums.

The build dependency for flex should be flex-native.

libmath.h is missing from the tarball (it was present in 1.06) and the
generation rules are not cross-friendly, so delete the rules and copy in a
pre-generated libmath.h.

Remove fix-segment-fault.patch as the fixes are now upstream.

Add PACKAGECONFIG for readline and libedit, defaulting to readline.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/bc/bc/libmath.h              | 46 ++++++++++++++++++++++
 meta/recipes-extended/bc/bc/no-gen-libmath.patch   | 24 +++++++++++
 meta/recipes-extended/bc/bc_1.06.bb                | 26 ------------
 meta/recipes-extended/bc/bc_1.07.1.bb              | 33 ++++++++++++++++
 .../bc/files/fix-segment-fault.patch               | 28 -------------
 5 files changed, 103 insertions(+), 54 deletions(-)
 create mode 100644 meta/recipes-extended/bc/bc/libmath.h
 create mode 100644 meta/recipes-extended/bc/bc/no-gen-libmath.patch
 delete mode 100644 meta/recipes-extended/bc/bc_1.06.bb
 create mode 100644 meta/recipes-extended/bc/bc_1.07.1.bb
 delete mode 100644 meta/recipes-extended/bc/files/fix-segment-fault.patch

diff --git a/meta/recipes-extended/bc/bc/libmath.h b/meta/recipes-extended/bc/bc/libmath.h
new file mode 100644
index 00000000000..63e1acb9ef5
--- /dev/null
+++ b/meta/recipes-extended/bc/bc/libmath.h
@@ -0,0 +1,46 @@
+{"@iK20:s2:p@r",
+"@iF1,5.6,7,8,9,10,11,12,13,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C1,0:",
+"s14:pl7:s0:pl14:RN1:l5:0<Z2:1s12:pl5:ns5:pN2:l2:s15:pK6:l15:+",
+"K.44:l5:*+s13:pl5:cS1+s2:pN3:l5:1>Z4:l10:1+s10:pl5:K2:/s5:pl2:",
+"1+s2:pJ3:N4:l13:s2:p1l5:+s14:pl5:s6:p1s8:pK2:s11:pN6:1B7:J5:N8:",
+"l11:i11:pJ6:N7:l6:l5:*s6:l8:l11:*s8:/s9:pl9:0=Z9:l10:0>Z10:N11:",
+"l10:d10:Z12:l14:l14:*s14:pJ11:N12:N10:l15:s2:pl12:Z13:1l14:/R",
+"N13:l14:1/RN9:l14:l9:+s14:pJ8:N5:0R]@r",
+"@iF2,5.7,9,10,11,12,13,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C2,0:",
+"s14:pl7:s0:pl14:RN1:l5:0{Z2:1K10:l2:^-1/RN2:l2:s15:pK6:l2:+s2:",
+"pK2:s10:p0s11:pN3:l5:K2:}Z4:l10:K2:*s10:pl5:cRs5:pJ3:N4:N5:l5:",
+"K.5:{Z6:l10:K2:*s10:pl5:cRs5:pJ5:N6:l5:1-l5:1+/s13:s14:pl13:l13:",
+"*s12:pK3:s11:pN8:1B9:J7:N10:l11:K2:+s11:pJ8:N9:l13:l12:*s13:l11:",
+"/s9:pl9:0=Z11:l10:l14:*s14:pl15:s2:pl14:1/RN11:l14:l9:+s14:pJ10:N7:",
+"0R]@r",
+"@iF3,5.7,9,11,12,13,16,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C3,0:",
+"s14:pl7:s0:pl14:RN1:l2:s15:pK1.1:l15:*K2:+s2:p1C4,0:s14:pl5:0",
+"<Z2:1s12:pl5:ns5:pN2:0s2:pl5:l14:/K2:+K4:/s13:pl5:K4:l13:*l14:",
+"*-s5:pl13:K2:%Z3:l5:ns5:pN3:l15:K2:+s2:pl5:s9:s14:pl5:nl5:*s16:",
+"pK3:s11:pN5:1B6:J4:N7:l11:K2:+s11:pJ5:N6:l9:l16:l11:l11:1-*/*",
+"s9:pl9:0=Z8:l15:s2:pl12:Z9:l14:n1/RN9:l14:1/RN8:l14:l9:+s14:p",
+"J7:N4:0R]@r",
+"@iF5,5.7,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C5,0:s14:pl7:s0:pl14:",
+"RN1:l2:s15:pl2:K1.2:*s2:pl5:1C4,0:K2:*+C3,0:s14:pl15:s2:pl14:",
+"1/R0R]@r",
+"@iF4,5.6,7,9,10,11,12,13,16,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:",
+"C4,0:s14:pl7:s0:pl14:RN1:1s12:pl5:0<Z2:1ns12:pl5:ns5:pN2:l5:1",
+"=Z3:l2:K25:{Z4:K.7853981633974483096156608:l12:/RN4:l2:K40:{Z5:",
+"K.7853981633974483096156608458198757210492:l12:/RN5:l2:K60:{Z6:",
+"K.785398163397448309615660845819875721049292349843776455243736",
+":l12:/RN6:N3:l5:K.2:=Z7:l2:K25:{Z8:K.1973955598498807583700497",
+":l12:/RN8:l2:K40:{Z9:K.1973955598498807583700497651947902934475",
+":l12:/RN9:l2:K60:{Z10:K.197395559849880758370049765194790293447585103787852101517688",
+":l12:/RN10:N7:l2:s15:pl5:K.2:>Z11:l15:K5:+s2:pK.2:C4,0:s6:pN11:",
+"l15:K3:+s2:pN12:l5:K.2:>Z13:l10:1+s10:pl5:K.2:-1l5:K.2:*+/s5:",
+"pJ12:N13:l5:s13:s14:pl5:nl5:*s16:pK3:s11:pN15:1B16:J14:N17:l11:",
+"K2:+s11:pJ15:N16:l13:l16:*s13:l11:/s9:pl9:0=Z18:l15:s2:pl10:l6:",
+"*l14:+l12:/RN18:l14:l9:+s14:pJ17:N14:0R]@r",
+"@iF6,13,5.6,7,8,9,10,11,12,16,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl13:",
+"l5:C6,00:s14:pl7:s0:pl14:RN1:l2:s15:p0s2:pl13:1/s13:pl13:0<Z2:",
+"l13:ns13:pl13:K2:%1=Z3:1s12:pN3:N2:1s10:pK2:s11:pN5:l11:l13:{",
+"B6:J4:N7:l11:i11:pJ5:N6:l10:l11:*s10:pJ7:N4:K1.5:l15:*s2:pl5:",
+"l13:^K2:l13:^/l10:/s10:p1s9:s14:pl5:nl5:*K4:/s16:pK1.5:l15:*l10:",
+"cL+l10:cS-s2:p1s11:pN9:1B10:J8:N11:l11:i11:pJ9:N10:l9:l16:*l11:",
+"/l13:l11:+/s9:pl9:0=Z12:l15:s2:pl12:Z13:l10:nl14:*1/RN13:l10:",
+"l14:*1/RN12:l14:l9:+s14:pJ11:N8:0R]@r",0}
diff --git a/meta/recipes-extended/bc/bc/no-gen-libmath.patch b/meta/recipes-extended/bc/bc/no-gen-libmath.patch
new file mode 100644
index 00000000000..c4cce587593
--- /dev/null
+++ b/meta/recipes-extended/bc/bc/no-gen-libmath.patch
@@ -0,0 +1,24 @@
+These rules are not cross-friendly so delete them and we'll generate the file offline.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/bc/Makefile.am b/bc/Makefile.am
+index d9d412e..f244241 100644
+--- a/bc/Makefile.am
++++ b/bc/Makefile.am
+@@ -31,14 +31,6 @@ global.o: libmath.h
+ 
+ fbcOBJ = main.o bc.o scan.o execute.o load.o storage.o util.o warranty.o
+ 
+-libmath.h: libmath.b $(fbcOBJ) $(LIBBC)
+-	echo '{0}' > libmath.h
+-	$(MAKE) global.o
+-	$(LINK) -o fbc $(fbcOBJ) global.o $(LIBBC) $(LIBL) $(READLINELIB) $(LIBS)
+-	./fbc -c $(srcdir)/libmath.b </dev/null >libmath.h
+-	$(srcdir)/fix-libmath_h
+-	rm -f ./fbc ./global.o
+-
+ sbcOBJ = main.o sbc.o scan.o execute.o global.o load.o storage.o util.o \
+          warranty.o
+ sbc.o: sbc.c
diff --git a/meta/recipes-extended/bc/bc_1.06.bb b/meta/recipes-extended/bc/bc_1.06.bb
deleted file mode 100644
index d8c8a860f81..00000000000
--- a/meta/recipes-extended/bc/bc_1.06.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "Arbitrary precision calculator language"
-HOMEPAGE = "http://www.gnu.org/software/bc/bc.html"
-
-LICENSE = "GPLv2+ & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
-                    file://bc/bcdefs.h;endline=31;md5=46dffdaf10a99728dd8ce358e45d46d8 \
-                    file://dc/dc.h;endline=25;md5=2f9c558cdd80e31b4d904e48c2374328 \
-                    file://lib/number.c;endline=31;md5=99434a0898abca7784acfd36b8191199"
-
-SECTION = "base"
-DEPENDS = "flex"
-PR = "r3"
-
-SRC_URI = "${GNU_MIRROR}/bc/bc-${PV}.tar.gz \
-           file://fix-segment-fault.patch "
-
-SRC_URI[md5sum] = "d44b5dddebd8a7a7309aea6c36fda117"
-SRC_URI[sha256sum] = "4ef6d9f17c3c0d92d8798e35666175ecd3d8efac4009d6457b5c99cea72c0e33"
-
-inherit autotools texinfo update-alternatives
-
-ALTERNATIVE_${PN} = "dc"
-ALTERNATIVE_PRIORITY = "100"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extended/bc/bc_1.07.1.bb
new file mode 100644
index 00000000000..e80857745ea
--- /dev/null
+++ b/meta/recipes-extended/bc/bc_1.07.1.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Arbitrary precision calculator language"
+HOMEPAGE = "http://www.gnu.org/software/bc/bc.html"
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
+                    file://bc/bcdefs.h;endline=17;md5=4295c06df9e833519a342f7b5d43db06 \
+                    file://dc/dc.h;endline=18;md5=36b8c600b63ee8c3aeade2764f6b2a4b \
+                    file://lib/number.c;endline=20;md5=cf43068cc88f837731dc53240456cfaf"
+
+SECTION = "base"
+DEPENDS = "flex-native"
+
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
+           file://no-gen-libmath.patch \
+           file://libmath.h"
+SRC_URI[md5sum] = "cda93857418655ea43590736fc3ca9fc"
+SRC_URI[sha256sum] = "62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a"
+
+inherit autotools texinfo update-alternatives
+
+PACKAGECONFIG ??= "readline"
+PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
+PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
+
+do_compile_prepend() {
+    cp -f ${WORKDIR}/libmath.h ${B}/bc/libmath.h
+}
+
+ALTERNATIVE_${PN} = "dc"
+ALTERNATIVE_PRIORITY = "100"
+
+BBCLASSEXTEND = "native"
\ No newline at end of file
diff --git a/meta/recipes-extended/bc/files/fix-segment-fault.patch b/meta/recipes-extended/bc/files/fix-segment-fault.patch
deleted file mode 100644
index 20c0da2ebe3..00000000000
--- a/meta/recipes-extended/bc/files/fix-segment-fault.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Pending
-
-when run command such as 'echo "a = 13" | bc -l', it segmentation faults.
-This patch is from http://www.mail-archive.com/blfs-support@linuxfromscratch.org/msg04602.html.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
---- bc-1.06/lib/number.c.orig	2003-09-26 21:14:02.000000000 +0000
-+++ bc-1.06/lib/number.c	2003-09-26 21:14:26.000000000 +0000
-@@ -34,6 +34,7 @@
- #include <number.h>
- #include <assert.h>
- #include <stdlib.h>
-+#include <string.h>
- #include <ctype.h>/* Prototypes needed for external utility routines. */
- 
- #define bc_rt_warn rt_warn
---- bc-1.06/bc/load.c.orig	2003-09-26 21:14:14.000000000 +0000
-+++ bc-1.06/bc/load.c	2003-09-26 21:14:26.000000000 +0000
-@@ -156,7 +156,7 @@
-   long  label_no;
-   long  vaf_name;	/* variable, array or function number. */
-   long  func;
--  program_counter save_adr;
-+  static program_counter save_adr;
- 
-   /* Initialize. */
-   str = code;
-- 
2.11.0


