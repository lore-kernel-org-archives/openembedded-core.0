Return-Path: <jose.alarcon@ge.com>
Received: from mx0a-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
	[67.231.157.48])
	by mail.openembedded.org (Postfix) with ESMTP id 537FE783C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 06:43:47 +0000 (UTC)
Received: from pps.filterd (m0048299.ppops.net [127.0.0.1])
	by m0048299.ppops.net-00176a03. (8.16.0.21/8.16.0.21) with SMTP id
	v7P6hnV9013336 for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 02:43:49 -0400
From: Jose Alarcon <jose.alarcon@ge.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 09:43:39 +0300
Message-Id: <20170825064339.181395-1-jose.alarcon@ge.com>
X-Mailer: git-send-email 2.10.1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-25_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx scancount=1 engine=8.0.1-1707230000
	definitions=main-1708250101
Subject: [PATCH resend] meta/classes: add class to test for unsatisfied RRECOMMENDS
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
X-List-Received-Date: Fri, 25 Aug 2017 06:43:48 -0000

The do_rootfs log contains a number of unsatisfied package
recommendations. At the moment those are only visible when
reviewing the rootfs log.

This class adds an extra check to surface any unsatisfied
recommendation  as WARNINGS to the build output.

Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
---
 meta/classes/rootfs-check-recommends.bbclass | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/classes/rootfs-check-recommends.bbclass

diff --git a/meta/classes/rootfs-check-recommends.bbclass b/meta/classes/rootfs-check-recommends.bbclass
new file mode 100644
index 0000000..351e438
--- /dev/null
+++ b/meta/classes/rootfs-check-recommends.bbclass
@@ -0,0 +1,21 @@
+#
+# This bbclass adds an extra check to surface any unsatisfied
+# recommendation (RRECOMMENDS) as WARNINGS to the build output.
+#
+# To enable, use INHERIT in conf/distro/distro.conf:
+#
+#       INHERIT += "rootfs-check-recommends"
+#
+
+python log_check_recommends() {
+    log_path = d.expand("${T}/log.do_rootfs")
+    with open(log_path, 'r') as log:
+        for line in log:
+            if 'log_check' in line:
+                continue
+
+            if 'unsatisfied recommendation for' in line:
+                bb.warn('[log_check] %s: %s' % (d.getVar('PN', True), line))
+}
+
+do_rootfs[postfuncs] += "log_check_recommends "
-- 
2.10.1


