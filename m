Return-Path: <jose.alarcon@ge.com>
X-Greylist: delayed 2977 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 21 Apr 2016 10:52:36 UTC
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com
	[67.231.149.52])
	by mail.openembedded.org (Postfix) with ESMTP id 144C16012C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 10:52:36 +0000 (UTC)
Received: from pps.filterd (m0048274.ppops.net [127.0.0.1])
	by m0048274.ppops.net-00176a03. (8.16.0.11/8.16.0.11) with SMTP id
	u3LA1biP041103 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 06:03:00 -0400
Received: from cinmlip12.e2k.ad.ge.com (n165-156-000-000.static.ge.com
	[165.156.4.1] (may be forged))
	by m0048274.ppops.net-00176a03. with ESMTP id 22bhtp4m0m-2
	(version=TLSv1 cipher=RC4-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 06:03:00 -0400
Received: from alpmlip01.e2k.ad.ge.com ([3.159.17.48])
	by cinmlip12.e2k.ad.ge.com with ESMTP/TLS/RC4-SHA;
	21 Apr 2016 06:02:59 -0400
Received: from unknown (HELO clipsmtp.clients.em.health.ge.com) ([3.187.7.87])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 21 Apr 2016 06:02:57 -0400
Received: from builder0.em.health.ge.com (builder0.em.health.ge.com
	[3.187.7.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by clipsmtp.clients.em.health.ge.com (Postfix) with ESMTPSA id
	A74D910BC319; Thu, 21 Apr 2016 13:02:54 +0300 (EEST)
From: Jose Alarcon <jose.alarcon@ge.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2016 13:02:41 +0300
Message-Id: <1461232961-92370-1-git-send-email-jose.alarcon@ge.com>
X-Mailer: git-send-email 2.4.5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-04-21_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1603290000
	definitions=main-1604210164
Subject: [PATCH] Create class to test for unsatisfied RRECOMMENDS
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
X-List-Received-Date: Thu, 21 Apr 2016 10:52:40 -0000

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
2.4.5


