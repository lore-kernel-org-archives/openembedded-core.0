Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ADB266D3DE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 05:41:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAI5fGb0024371
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2013 21:41:17 -0800 (PST)
Received: from PKE-CLU1-D1.wrs.com (128.224.162.203) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Sun, 17 Nov 2013 21:41:16 -0800
From: <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Nov 2013 13:41:14 +0800
Message-ID: <1384753274-6369-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH V2] lttng-tools: Fixes incorrect path of ptest cases
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
X-List-Received-Date: Mon, 18 Nov 2013 05:41:16 -0000
Content-Type: text/plain

From: Chong Lu <Chong.Lu@windriver.com>

In ptest cases, some paths are still the source code path.
Continue to fix the paths of executable files in ptest cases
to make them work on target.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb |   21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb
index f2a43b4..49c0992 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb
@@ -38,17 +38,22 @@ INSANE_SKIP_${PN}-dbg = "libexec"
 do_install_ptest () {
 	chmod +x ${D}/${libdir}/${PN}/ptest/tests/utils/utils.sh
 	for i in `find ${D}/${libdir}/${PN}/ptest -perm /u+x -type f`; do
-		sed -e "s:\$TESTDIR.*/src/bin/lttng/\$LTTNG_BIN:\$LTTNG_BIN:" \
-		  -e "s:\$TESTDIR/../src/bin/lttng-sessiond/\$SESSIOND_BIN:\$SESSIOND_BIN:" \
-		  -e "s:\$DIR/../src/bin/lttng-sessiond/\$SESSIOND_BIN:\$SESSIOND_BIN:" \
-		  -e "s:\$TESTDIR/../src/bin/lttng-consumerd/:${libedir}/lttng/libexec/:" \
-		  -e "s:\$DIR/../src/bin/lttng-consumerd/:${libdir}/lttng/libexec/:" \
-		  -e "s:\$TESTDIR/../src/bin/lttng-relayd/\$RELAYD_BIN:\$RELAYD_BIN:" \
+		sed -e "s:\$TESTDIR.*/src/bin/lttng/\$LTTNG_BIN:\$LTTNG_BIN:g" \
+		  -e "s:\$TESTDIR/../src/bin/lttng-sessiond/\$SESSIOND_BIN:\$SESSIOND_BIN:g" \
+		  -e "s:\$DIR/../src/bin/lttng-sessiond/\$SESSIOND_BIN:\$SESSIOND_BIN:g" \
+		  -e "s:\$TESTDIR/../src/bin/lttng-consumerd/:${libdir}/lttng/libexec/:g" \
+		  -e "s:\$DIR/../src/bin/lttng-consumerd/:${libdir}/lttng/libexec/:g" \
+		  -e "s:\$TESTDIR/../src/bin/lttng-relayd/\$RELAYD_BIN:\$RELAYD_BIN:g" \
+		  -e "s:\$DIR/../src/bin/lttng-sessiond/lttng-sessiond:\$SESSIOND_BIN:g" \
+		  -e "s:\$DIR/../src/bin/lttng-relayd/\$RELAYD_BIN:\$RELAYD_BIN:g" \
+		  -e "s:\$DIR/../bin/lttng-relayd/\$RELAYD_BIN:\$RELAYD_BIN:g" \
 		  -i $i
 	done
 
-	sed -e "s:src/bin/lttng-sessiond:$bindir:" \
-	    -e "s:src/bin/lttng-consumerd:${libexecdir}/libexec/:" \
+	sed -e "s:src/bin/lttng-sessiond:$bindir:g" \
+	    -e "s:src/bin/lttng-consumerd:${libexecdir}/libexec/:g" \
 	-i ${D}/${libdir}/${PN}/ptest/tests/regression/run-report.py
+	sed -e "s:src/bin:bin:g" \
+	-i ${D}/${libdir}/${PN}/ptest/tests/utils/utils.sh
 
 }
-- 
1.7.9.5


