Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A308CCFA04
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 02:32:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4026.1762309968778368509
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 18:32:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SfSjvJZg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34047cfdc5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A52CLlk1266887;
	Tue, 4 Nov 2025 18:32:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=fYLbCrXIQ0/tD8di9XuV
	5ICltEZ8533wx8ys5tCch8I=; b=SfSjvJZgMJaxPdetK3+phoHQ/1Fa9OYRRrDp
	sv11sYIyEGblTVV+6m8OsppaYp+psckQwuxAx6haF5vPfpgeNBYiCnQiW/qt5gAg
	doGgc+a5Ys4+4795l86WMEL+lb+1Ag5Dp6YJ8DZzucOckq42DouqMBIEfBkiKC/w
	EZGllQogDQRW+8Vi7eEe5Zkgvm82mtootDxC+AsDOM2YPT0kR8xCU7odEHgIoQmy
	OAOwg5px44PvJaTjhkJ02Yri76sj9OhrYkqVT2RzWwTrj7dpaCjD8o1fd+KRTP3m
	NX0VWDxBM1Rz90Vt52wZPlhYkHppMNZIKuYx1jOtiR9YzSChWQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7wd7g0t9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 04 Nov 2025 18:32:38 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 4 Nov 2025 18:32:38 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 4 Nov 2025 18:32:37 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <mathieu.dubois-briand@bootlin.com>,
        <openembedded-core@lists.openembedded.org>, <skandigraun@gmail.com>
Subject: [PATCH v4] libxml2: upgrade 2.14.6 -> 2.15.0
Date: Wed, 5 Nov 2025 10:32:36 +0800
Message-ID: <20251105023236.310076-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: joPppy3ULQLmIVwnr9-wMV_xTmmnjBBt
X-Authority-Analysis: v=2.4 cv=Dacaa/tW c=1 sm=1 tr=0 ts=690ab747 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=GHR8O2WEAAAA:20
 a=Z5getJ8MAAAA:20 a=SSmOFEACAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8
 a=ExU6LOvrz2DER-a3BZwA:9 a=m9p5bXcFLgAA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=yULaImgL6KKpOYXvFmjq:22 a=CTwFTDRtctY-zZ8oRDn3:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=UDnyf2zBuKT2w-IlGP_r:22
X-Proofpoint-ORIG-GUID: joPppy3ULQLmIVwnr9-wMV_xTmmnjBBt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAxNCBTYWx0ZWRfXzloPLQhhCJhB
 cwKk2qqGC3paAxntloM3M947LXKF6y9eGXN6rEBhJU0ILhvtcvh8sVScv+ZMv7fVqxrerW6XPVJ
 bbsiUWoQpfx6PzJZqDoDlikiDSeEAnwxw0o9fYMJNRy/Hipm5N1cQ5hpCDf+4vly8IKE6wQfgrg
 4KJZ0647JQIK8srLqnkDHXi0Yw59V7ZoWRSLsTHk+LWa+TIAUQdMYYrWlAi0FTkpzYhDAXg7PXD
 MpIHDwdQkprcQI+17gtRwxW5xOT0g+69JPDva89T0G2ulN9+7xsuhQ9CHc/cl7sIYBJkQ9YsDok
 RJyWdPedwu50tavPm22T5lhm1vte5+FKheC8ROfNUG3te5fiYzXOS8/lOkdqFWg7kvTDXV1nqj2
 MQn/5THqNZKCIKUWCzxIwn4Mrf/Apw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 02:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225745

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
 .../{libxml2_2.14.6.bb => libxml2_2.15.0.bb}  | 27 ++++------------
 4 files changed, 18 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
 rename meta/recipes-core/libxml/{libxml2_2.14.6.bb => libxml2_2.15.0.bb} (77%)

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
diff --git a/meta/recipes-core/libxml/libxml2_2.14.6.bb b/meta/recipes-core/libxml/libxml2_2.15.0.bb
similarity index 77%
rename from meta/recipes-core/libxml/libxml2_2.14.6.bb
rename to meta/recipes-core/libxml/libxml2_2.15.0.bb
index 6ed8760f4c..b1fbc32bfa 100644
--- a/meta/recipes-core/libxml/libxml2_2.14.6.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.0.bb
@@ -18,29 +18,20 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://run-ptest \
            file://install-tests.patch \
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
-           file://CVE-2025-6021.patch \
            "
 
-SRC_URI[archive.sha256sum] = "7ce458a0affeb83f0b55f1f4f9e0e55735dbfc1a9de124ee86fb4a66b597203a"
+SRC_URI[archive.sha256sum] = "5abc766497c5b1d6d99231f662e30c99402a90d03b06c67b62d6c1179dedd561"
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


