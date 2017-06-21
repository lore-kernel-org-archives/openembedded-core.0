Return-Path: <razvan.heghedus@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 7382A78038
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 12:10:22 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v5LAjhpN024448 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 05:48:55 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2b51xpygk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 05:48:54 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod3.natinst.com (8.16.0.17/8.16.0.17) with ESMTPS id
	v5LAmstZ022718
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 05:48:54 -0500
Received: from us-aus-exch4.ni.corp.natinst.com (130.164.68.14) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 21 Jun 2017 05:48:54 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch4.ni.corp.natinst.com (130.164.68.14) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 21 Jun 2017 05:48:53 -0500
Received: from razvanh-ro.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Wed, 21 Jun 2017 05:48:53 -0500
From: Heghedus Razvan <razvan.heghedus@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Jun 2017 13:49:42 +0300
Message-ID: <20170621104942.5601-2-razvan.heghedus@ni.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170621104942.5601-1-razvan.heghedus@ni.com>
References: <20170621104942.5601-1-razvan.heghedus@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-06-21_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1703280000 definitions=main-1706210182
Subject: [PATCH 2/2] kernel: user defined KERNEL_VERSION_PKG_NAME
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
X-List-Received-Date: Wed, 21 Jun 2017 12:10:22 -0000
Content-Type: text/plain

Add possibility to set KERNEL_VERSION_PKG_NAME to a user
defined value.

Signed-off-by: Heghedus Razvan <razvan.heghedus@ni.com>
---
 meta/classes/kernel.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 605c101e62..02728d5a86 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -28,12 +28,16 @@ INITRAMFS_IMAGE_BUNDLE ?= ""
 # LINUX_VERSION which is a constant.
 KERNEL_VERSION_NAME = "${@d.getVar('KERNEL_VERSION') or ""}"
 KERNEL_VERSION_NAME[vardepvalue] = "${LINUX_VERSION}"
-KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
-KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
 
 python __anonymous () {
     import re
 
+    if d.getVar('USER_KERNEL_VERSION_PKG') is None :
+        d.setVar('KERNEL_VERSION_PKG_NAME', "${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}")
+        d.setVar('KERNEL_VERSION_PKG_NAME[vardepvalue]', "${LINUX_VERSION}")
+    else:
+        d.setVar('KERNEL_VERSION_PKG_NAME', "${@legitimize_package_name(d.getVar('USER_KERNEL_VERSION_PKG'))}")
+
     # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
     type = d.getVar('KERNEL_IMAGETYPE') or ""
     alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
-- 
2.13.1


