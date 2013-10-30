Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1CBF96D2D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 06:05:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9U657wZ026760
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 23:05:07 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 29 Oct 2013 23:05:07 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Oct 2013 14:05:06 +0800
Message-ID: <1383113106-11090-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] lttng-tools: make ptest able to work on target
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
X-List-Received-Date: Wed, 30 Oct 2013 06:05:06 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

The paths of executable files in test cases are the source code path,
need to fix to make them work on target

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb
index 4322027..f2a43b4 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb
@@ -33,3 +33,22 @@ FILES_${PN}-dbg += "${libdir}/lttng/libexec/.debug"
 # the libexec insane test so skip it.
 INSANE_SKIP_${PN} = "libexec"
 INSANE_SKIP_${PN}-dbg = "libexec"
+
+
+do_install_ptest () {
+	chmod +x ${D}/${libdir}/${PN}/ptest/tests/utils/utils.sh
+	for i in `find ${D}/${libdir}/${PN}/ptest -perm /u+x -type f`; do
+		sed -e "s:\$TESTDIR.*/src/bin/lttng/\$LTTNG_BIN:\$LTTNG_BIN:" \
+		  -e "s:\$TESTDIR/../src/bin/lttng-sessiond/\$SESSIOND_BIN:\$SESSIOND_BIN:" \
+		  -e "s:\$DIR/../src/bin/lttng-sessiond/\$SESSIOND_BIN:\$SESSIOND_BIN:" \
+		  -e "s:\$TESTDIR/../src/bin/lttng-consumerd/:${libedir}/lttng/libexec/:" \
+		  -e "s:\$DIR/../src/bin/lttng-consumerd/:${libdir}/lttng/libexec/:" \
+		  -e "s:\$TESTDIR/../src/bin/lttng-relayd/\$RELAYD_BIN:\$RELAYD_BIN:" \
+		  -i $i
+	done
+
+	sed -e "s:src/bin/lttng-sessiond:$bindir:" \
+	    -e "s:src/bin/lttng-consumerd:${libexecdir}/libexec/:" \
+	-i ${D}/${libdir}/${PN}/ptest/tests/regression/run-report.py
+
+}
-- 
1.7.10.4


