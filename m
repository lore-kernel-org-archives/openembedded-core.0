Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 07A057F3F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 07:37:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7U7br89001615
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 00:37:53 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 30 Aug 2019 00:37:52 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Aug 2019 15:37:47 +0800
Message-ID: <1567150670-252374-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567150670-252374-1-git-send-email-changqing.li@windriver.com>
References: <1567150670-252374-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] bootchart2: support usrmerge
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
X-List-Received-Date: Fri, 30 Aug 2019 07:37:52 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
index f9a98d4..465cdd9 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
@@ -121,11 +121,17 @@ do_compile_prepend () {
 }
 
 do_install () {
+    if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
+        sed -i -e "s;install -m 755 -D bootchartd \$(DESTDIR)\$(EARLY_PREFIX)/sbin/;install -m 755 -D bootchartd \$(DESTDIR)/usr/sbin/;g" ${B}/Makefile
+    fi
+    sed -i -e "s;SYSTEMD_UNIT_DIR =; SYSTEMD_UNIT_DIR ?=;g" ${B}/Makefile
     install -d ${D}${sysconfdir} # needed for -native
     export PY_LIBDIR="${libdir}/${PYTHON_DIR}"
     export BINDIR="${bindir}"
     export DESTDIR="${D}"
     export LIBDIR="${base_libdir}"
+    export PKGLIBDIR="${base_libdir}/bootchart"
+    export SYSTEMD_UNIT_DIR="${systemd_unitdir}/system"
 
     oe_runmake install
     install -d ${D}${sysconfdir}/init.d
-- 
2.7.4


