Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D6ED12690
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 08:24:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10183.1764750249325832457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 00:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Vo+X3Gkm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=443253538a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B36uWIc4050236
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Dec 2025 08:24:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=f/pUV8sf4acpEgxLhmtE
	IyEPsLtwka4KnVFFd83k/7w=; b=Vo+X3Gkm3CW2eUcH6ykhHdKLoEgqnbCRCqE6
	h1jHBVd4ZLDKvEClRHZa2nkqG69CZoRLO0bycvxWERsxrvpSyCqOouw1eBA4Qd+U
	cF+lzQ83OXjgJxl5P8WoZO6zSGp8u75v/0kFwNGwulWjhg81TIKVmApp7tKBmrUY
	/xKwLGdTg1AedVbUsLgyrnFq9MQCMifJJwrN0NV/AKgBaB/zz6JGWjRgUGKBjfD2
	KwbDkAUircGvsK7GLIo8pcTIDwC5C7mc6G5pjAZUxSFNuvw5WXdZQPh4mWfQmImC
	SSuFpcny7nW9MrPFhbP9RC+j8GdzbAH9Sb78aeAX/RSmtktUow==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqp21vnvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 08:24:08 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 3 Dec 2025 00:24:05 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 3 Dec 2025 00:24:04 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] libxml2: upgrade 2.14.6 -> 2.15.1
Date: Wed, 3 Dec 2025 16:24:02 +0800
Message-ID: <20251203082404.2732162-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9m6bIpXs3chgteckTEKuGqGipbegCg6x
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=692ff3a8 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=GHR8O2WEAAAA:20
 a=Z5getJ8MAAAA:20 a=SSmOFEACAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8
 a=ExU6LOvrz2DER-a3BZwA:9 a=m9p5bXcFLgAA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA2NSBTYWx0ZWRfX4lTyF8zmjG/L
 Ts2ZzMdpG16I1fsPpe/Gf2fwq3WlsY0/jGL+TUMv4nkEhfMFPQ4uvf+IlO8mdTFCcB0hvKjaUh6
 BSRGaw8Tbv54ahpKRU379VIIVA4bi+u52sl1YJL4zR/WwLY5WuMR9naN6vN0+FOLEBKf1SAddcj
 1E1IrHEVHFo/MYlJHgyRNJpJWntr9+HhvV/qi06ys5DynKUSeeSXQlmfYLp1ax/kZdl7KM/tV2U
 PTR52s1jVzEUVQlCw4QduuCbFdB7CM04LcyyRW37/ynmkKqgAGvhhhttXpQucU9KE+hPZDGtUwM
 u0aOmg/NIq6fubKWEhVx7/8Jr+HKmazeJHNWVuWIdVXyANeqJBRPmszVwF2FhC4Xn+U8FcqZdwU
 xv0n+J2cLRuRwgiEIcFc4RRW/Gf9Yg==
X-Proofpoint-ORIG-GUID: 9m6bIpXs3chgteckTEKuGqGipbegCg6x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 08:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227204

Due to upstream [Remove LZMA support][1], drop option --without-lzma

Due to upstream [disable python bindings by default][2] and are
planned to be removed in the 2.16 release[3][4]. If we still enable
python bindings by --with-python=yes, due to upstream [doc: Build docs
with Doxygen and xsltproc][5], build python binding requires doxygen
otherwise build will fail, and we do not provide doxygen in oe-core,
so remove python package directly.

Refresh install-tests.patch and run-ptest to not install python test
cases

Drop CVE-2025-6021.patch which is obsolete

[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/1763281cd65ded4067ddf123eb7358690c214b0b
[2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/fa931566d2f541d3162c7b98c8a12e6b2a6ae542
[3] https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.0.news
[4] https://gitlab.gnome.org/GNOME/libxml2/-/issues/891
[5] https://gitlab.gnome.org/GNOME/libxml2/-/commit/bbe5827c94cc9b0e393ff3e6eef6dec2376317e2

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libxml/libxml2/CVE-2025-6021.patch        | 31 -------------------
 .../libxml/libxml2/install-tests.patch        | 20 +++++++-----
 meta/recipes-core/libxml/libxml2/run-ptest    |  7 -----
 .../{libxml2_2.14.6.bb => libxml2_2.15.1.bb}  | 27 ++++------------
 4 files changed, 18 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
 rename meta/recipes-core/libxml/{libxml2_2.14.6.bb => libxml2_2.15.1.bb} (77%)

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
deleted file mode 100644
index 0b73bceb24..0000000000
--- a/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From e546e423d69ec9b3c71167d3c3140fa1b9af93c7 Mon Sep 17 00:00:00 2001
-From: Nick Wellnhofer <wellnhofer@aevum.de>
-Date: Tue, 27 May 2025 12:53:17 +0200
-Subject: [PATCH] tree: Fix integer overflow in xmlBuildQName
-
-This issue affects memory safety and might receive a CVE ID later.
-
-Fixes #926.
-
-Signed-off-by: Nick Wellnhofer <wellnhofer@aevum.de>
-
-Add '#include <stdint.h>' to assure the definition of SIZE_MAX
-CVE: CVE-2025-6021
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/acbbeef9f5dcdcc901c5f3fa14d583ef8cfd22f0]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- tree.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tree.c b/tree.c
-index e14bc62..22ec11c 100644
---- a/tree.c
-+++ b/tree.c
-@@ -23,6 +23,7 @@
- #include <limits.h>
- #include <ctype.h>
- #include <stdlib.h>
-+#include <stdint.h>
- 
- #ifdef LIBXML_ZLIB_ENABLED
- #include <zlib.h>
diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 4c1faa83cb..9269536af0 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,34 +1,38 @@
-From 7e99fef6eae0642a3f1e511e4d24abf7d6d28f50 Mon Sep 17 00:00:00 2001
+From 3381232bab7217b9cb47e7cc765c8380192069b0 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
-Date: Mon, 5 Dec 2022 17:02:32 +0000
+Date: Fri, 17 Oct 2025 14:15:36 +0800
 Subject: [PATCH] add yocto-specific install-ptest target
 
 Add a target to install the test suite.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+Do not install python test cases
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- Makefile.am | 10 ++++++++++
- 1 file changed, 10 insertions(+)
+ Makefile.am | 8 ++++++++
+ 1 file changed, 8 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 6f98144..ecb3b54 100644
+index 19ec305..64bf28a 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -26,6 +26,16 @@ check_PROGRAMS = \
+@@ -29,6 +29,14 @@ check_PROGRAMS = \
  	testparser \
  	testrecurse
  
 +ptestdir=$(libexecdir)
 +install-test-data: $(check_PROGRAMS)
-+	install -d $(DESTDIR)$(ptestdir) $(DESTDIR)$(ptestdir)/python/
 +	for T in $(check_PROGRAMS); do \
 +		$(LIBTOOL) --mode=install $(INSTALL_PROGRAM) $$T $(DESTDIR)$(ptestdir) ;\
 +	done
 +	cp -r $(srcdir)/test $(DESTDIR)$(ptestdir)
 +	cp -r $(srcdir)/result $(DESTDIR)$(ptestdir)
-+	cp -r $(srcdir)/python/tests $(DESTDIR)$(ptestdir)/python
 +
  bin_PROGRAMS = xmllint
  
  bin_SCRIPTS = xml2-config
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/libxml/libxml2/run-ptest b/meta/recipes-core/libxml/libxml2/run-ptest
index cbbdd5592f..868649240b 100755
--- a/meta/recipes-core/libxml/libxml2/run-ptest
+++ b/meta/recipes-core/libxml/libxml2/run-ptest
@@ -11,10 +11,3 @@ for T in $TESTS; do
     echo Running $T
     ./$T && echo PASS: $T || echo FAIL: $T
 done
-
-if test -d python/tests; then
-    cd python/tests
-    for T in *.py; do
-        python3 ./$T && echo PASS: $T || echo FAIL: $T
-    done
-fi
diff --git a/meta/recipes-core/libxml/libxml2_2.14.6.bb b/meta/recipes-core/libxml/libxml2_2.15.1.bb
similarity index 77%
rename from meta/recipes-core/libxml/libxml2_2.14.6.bb
rename to meta/recipes-core/libxml/libxml2_2.15.1.bb
index 6ed8760f4c..a010c84f77 100644
--- a/meta/recipes-core/libxml/libxml2_2.14.6.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.1.bb
@@ -18,29 +18,20 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://run-ptest \
            file://install-tests.patch \
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
-           file://CVE-2025-6021.patch \
            "
 
-SRC_URI[archive.sha256sum] = "7ce458a0affeb83f0b55f1f4f9e0e55735dbfc1a9de124ee86fb4a66b597203a"
+SRC_URI[archive.sha256sum] = "c008bac08fd5c7b4a87f7b8a71f283fa581d80d80ff8d2efd3b26224c39bc54c"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"
 
 BINCONFIG = "${bindir}/xml2-config"
 
-PACKAGECONFIG ??= "python"
-PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python3"
-
 inherit autotools pkgconfig binconfig-disabled ptest
 
-inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3targetconfig', '', d)}
-
 LDFLAGS:append:riscv64 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', ' -fuse-ld=bfd', '', d)}"
 
-RDEPENDS:${PN}-ptest += "bash make locale-base-en-us ${@bb.utils.contains('PACKAGECONFIG', 'python', 'libgcc python3-core python3-logging python3-shell python3-stringold python3-threading python3-unittest ${PN}-python', '', d)}"
-
-RDEPENDS:${PN}-python += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-core', '', d)}"
-
+RDEPENDS:${PN}-ptest += "bash make locale-base-en-us"
 RDEPENDS:${PN}-ptest:append:libc-musl = " musl-locales"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-ebcdic-us \
                                            glibc-gconv-ibm1141 \
@@ -49,10 +40,10 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-ebcdic-us \
                                          "
 
 # WARNING: zlib is required for RPM use
-EXTRA_OECONF = "--without-debug --without-legacy --with-catalog --with-c14n --without-lzma"
-EXTRA_OECONF:class-native = "--without-legacy --with-c14n --without-lzma --with-zlib"
-EXTRA_OECONF:class-nativesdk = "--without-legacy --with-c14n --without-lzma --with-zlib"
-EXTRA_OECONF:linuxstdbase = "--with-debug --with-legacy --with-c14n --without-lzma --with-zlib"
+EXTRA_OECONF = "--without-debug --without-legacy --with-catalog --with-c14n"
+EXTRA_OECONF:class-native = "--without-legacy --with-c14n --with-zlib"
+EXTRA_OECONF:class-nativesdk = "--without-legacy --with-c14n --with-zlib"
+EXTRA_OECONF:linuxstdbase = "--with-debug --with-legacy --with-c14n --with-zlib"
 
 python populate_packages:prepend () {
     # autonamer would call this libxml2-2, but we don't want that
@@ -61,11 +52,9 @@ python populate_packages:prepend () {
 }
 
 PACKAGE_BEFORE_PN += "${PN}-utils"
-PACKAGES += "${PN}-python"
 
 FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
 FILES:${PN}-utils = "${bindir}/*"
-FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
 
 do_configure:prepend () {
 	# executables take longer to package: these should not be executable
@@ -76,10 +65,6 @@ do_install_ptest () {
     oe_runmake DESTDIR=${D} ptestdir=${PTEST_PATH} install-test-data
 
 	cp -r ${S}/xmlconf ${D}${PTEST_PATH}
-
-    if ! ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
-        rm -rf ${D}${PTEST_DIR}/python
-    fi
 }
 
 # with musl we need to enable icu support explicitly for these tests
-- 
2.34.1


