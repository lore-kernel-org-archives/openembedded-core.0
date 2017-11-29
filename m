Return-Path: <rich.tollerton@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 113A86612D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 18:03:08 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	vATI2ZVu003159; Wed, 29 Nov 2017 12:03:09 -0600
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2egpecqrkn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 29 Nov 2017 12:03:09 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod2.natinst.com (8.16.0.21/8.16.0.21) with ESMTPS id
	vATI37cG023592
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2017 12:03:07 -0600
Received: from us-aus-exch7.ni.corp.natinst.com (130.164.68.17) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 29 Nov 2017 12:03:07 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch7.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 29 Nov 2017 12:03:07 -0600
Received: from weregild.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Wed, 29 Nov 2017 12:03:07 -0600
From: Richard Tollerton <rich.tollerton@ni.com>
To: <seebs@seebs.net>, <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Nov 2017 12:02:40 -0600
Message-ID: <20171129180242.29308-3-rich.tollerton@ni.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20171129180242.29308-1-rich.tollerton@ni.com>
References: <20171129180242.29308-1-rich.tollerton@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-11-29_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1709140000 definitions=main-1711290233
Subject: [PATCH][PSEUDO 2/4] test-cp-setuid.sh: add
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
X-List-Received-Date: Wed, 29 Nov 2017 18:03:08 -0000
Content-Type: text/plain

New test to verify that special bits including setuid are preserved
under `cp -Rp`. This is a regression test of [YOCTO #12379]. Without a
recently committed fix, this test will fail on coreutils 8.24 and later.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 test/test-cp-setuid.sh | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100755 test/test-cp-setuid.sh

diff --git a/test/test-cp-setuid.sh b/test/test-cp-setuid.sh
new file mode 100755
index 0000000..cdb2cd3
--- /dev/null
+++ b/test/test-cp-setuid.sh
@@ -0,0 +1,23 @@
+#!/bin/bash
+set -e
+
+# Verify that special bits (setuid/setgid/sticky) are preserved.
+#
+# Return vals:
+#
+#                 2 - Incorrect permissions
+# All other nonzero - Unexpected command error
+#                 0 - Pass
+
+trap "rm -rf d1 d2" EXIT
+
+mkdir d1
+chmod 7777 d1
+cp -Rp d1 d2
+perms=`ls -od d1 d2 | cut -c 1-10 | uniq`
+if [ "$perms" != drwsrwsrwt ]; then
+	exit 2
+fi
+
+
+exit 0
-- 
2.14.1


