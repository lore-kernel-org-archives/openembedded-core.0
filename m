Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2FBC54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 07:10:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7096.1709017807727791182
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 23:10:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LnQnvDbh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=27874ce11d=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41R6mpc5015402
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 07:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=eu9a+
	EOLvIQ356luw/4k2Z1Nf6KL2YzjrPmAUjsYtpA=; b=LnQnvDbhwaaNr/O3dWNEA
	xj8iGvX9xQqjenHhTKHQV4wPj5gXzSi+iMQXZXAZ5d+qw0gm2inVhiLxyucFc7va
	m+vso+Ayzzy9k3ax1EDPuHim3tXAI+a4TZGOhnsRK3qan9cDxm+eVp6FwAg+sBL/
	rkG6n9TYJG7QBFoY6ZzvRK7z+ZbZyedLem9wO7TAgDWCeXZcR4oo9XFboE3Yo46g
	c+S5yd72QHRsQowS6TltRVIS+fNXr2t16gv+SfREQSXw/XqFuy7E+RShjv81GaWU
	soX4ZVypjVHkj7BzNdiYpGRPR98ydK6Av89D9K69flE9v5WtkZ3tiV550q/qU1Ra
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf5nx2v2c-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 07:10:06 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 23:10:05 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 23:10:05 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V6] rxvt-unicode: Fix installing of terminfo
Date: Tue, 27 Feb 2024 15:10:04 +0800
Message-ID: <20240227071004.2402854-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: lUCFzPnBDitrZDa4r7gVh57zQsIwWOmX
X-Proofpoint-ORIG-GUID: lUCFzPnBDitrZDa4r7gVh57zQsIwWOmX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=891
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402270056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 07:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196243

From: Changqing Li <changqing.li@windriver.com>

For cross compile, TIC will be native tic in recipe-sysroot-native, and
the terminfo path will be native path, the rxvt-unicode terminfo will be
wrongly installed to native path.

disable the terminfo installation by setting TIC to : and use qemu to
install terminfo to make sure ncurses on target env use the correct
terminfo

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../rxvt-unicode/rxvt-unicode.inc             | 20 +++++++++-
 ...ble-the-terminfo-installation-by-set.patch | 37 +++++++++++++++++++
 2 files changed, 55 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-disable-the-terminfo-installation-by-set.patch

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index e7d520ebef..e6ca10f6e0 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -11,9 +11,11 @@ DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty"
 SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
 	   file://xwc.patch \
 	   file://rxvt.desktop \
-	   file://rxvt.png"
+	   file://rxvt.png \
+	   file://0001-Makefile.in-disable-the-terminfo-installation-by-set.patch \
+"
 
-inherit autotools pkgconfig update-alternatives
+inherit autotools pkgconfig update-alternatives qemu
 
 PROVIDES = "virtual/x-terminal-emulator"
 ALTERNATIVE:${PN} = "x-terminal-emulator"
@@ -53,6 +55,20 @@ do_install:append () {
 
 	install -m 0644 ${WORKDIR}/rxvt.png ${D}/${datadir}/pixmaps
 	install -m 0644 ${WORKDIR}/rxvt.desktop ${D}/${datadir}/applications
+
+	install -d ${D}/${sysconfdir}
+	install -m 0644 ${S}/doc/etc/rxvt-unicode.terminfo ${D}/${sysconfdir}/rxvt-unicode.terminfo
+}
+
+RDEPENDS:${PN} = "ncurses-tools"
+PACKAGE_WRITE_DEPS += "qemu-native"
+pkg_postinst:${PN} () {
+	if [ -n "$D" ]; then
+		if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
+			outdir=$(${@qemu_run_binary(d, '$D', '${bindir}/tic')} -D 2>&1 | sed -n "2p" | awk '{ print $2 }')
+			${@qemu_run_binary(d, '$D', '${bindir}/tic')} -x ${sysconfdir}/rxvt-unicode.terminfo -o $D$outdir
+		fi
+	fi
 }
 
 FILES:${PN} += "${datadir}/applications/rxvt.desktop ${datadir}/pixmaps/rxvt.png"
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-disable-the-terminfo-installation-by-set.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-disable-the-terminfo-installation-by-set.patch
new file mode 100644
index 0000000000..6bdbedb3c4
--- /dev/null
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-disable-the-terminfo-installation-by-set.patch
@@ -0,0 +1,37 @@
+From ff5c75995485ee9c5331e52bb9bf3aa5db6d8837 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 7 Feb 2024 10:35:23 +0800
+Subject: [PATCH] Makefile.in: disable the terminfo installation by setting TIC
+ to :
+
+For cross compile, TIC will be native tic in recipe-sysroot-native, and
+the terminfo path will be native path, the rxvt-unicode terminfo will be
+installed to native path.
+
+disable the terminfo installation by setting TIC to :
+
+Upstream-Status: Inappropriate [ oe specific ]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ doc/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/doc/Makefile.in b/doc/Makefile.in
+index e3d1fe8..1961c93 100644
+--- a/doc/Makefile.in
++++ b/doc/Makefile.in
+@@ -100,8 +100,8 @@ install: all
+ 	$(INSTALL_DATA) rxvtd.1.man   $(DESTDIR)$(man1dir)/$(RXVTNAME)d.$(man1ext)
+ 	$(INSTALL_DATA) rxvt.7.man    $(DESTDIR)$(man7dir)/$(RXVTNAME).$(man7ext)
+ 	$(INSTALL_DATA) rclock.1.man  $(DESTDIR)$(man1dir)/urclock.$(man1ext)
+-	@TIC@ -x $(srcdir)/etc/rxvt-unicode.terminfo || \
+-           @TIC@ $(srcdir)/etc/rxvt-unicode.terminfo
++	: -x $(srcdir)/etc/rxvt-unicode.terminfo || \
++           : $(srcdir)/etc/rxvt-unicode.terminfo
+ 
+ distdepend: alldoc
+ 
+-- 
+2.25.1
+
-- 
2.25.1


