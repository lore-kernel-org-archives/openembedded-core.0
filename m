Return-Path: <martin.donnelly@ge.com>
X-Greylist: delayed 3353 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 22 Feb 2016 18:28:33 UTC
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com
	[67.231.149.52])
	by mail.openembedded.org (Postfix) with ESMTP id 250696FF69
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 18:28:33 +0000 (UTC)
Received: from pps.filterd (m0048274.ppops.net [127.0.0.1])
	by m0048274.ppops.net-00176a03. (8.15.0.59/8.15.0.59) with SMTP id
	u1MHV6ax034000 for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 12:32:41 -0500
Received: from alpmlip10.e2k.ad.ge.com (n165-156-000-000.static.ge.com
	[165.156.5.1] (may be forged))
	by m0048274.ppops.net-00176a03. with ESMTP id 2185s7r1sm-3
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 12:32:40 -0500
Received: from alpmlip01.e2k.ad.ge.com ([3.159.17.48])
	by alpmlip10.e2k.ad.ge.com with ESMTP/TLS/RC4-SHA;
	22 Feb 2016 12:32:40 -0500
Received: from unknown (HELO clipsmtp.clients.em.health.ge.com) ([3.187.7.87])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 22 Feb 2016 12:32:40 -0500
Received: from builder0.em.health.ge.com (builder0.em.health.ge.com
	[3.187.7.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by clipsmtp.clients.em.health.ge.com (Postfix) with ESMTPSA id
	0FF9F10C8183; Mon, 22 Feb 2016 19:32:38 +0200 (EET)
From: Martin Donnelly <martin.donnelly@ge.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2016 19:32:34 +0200
Message-Id: <1456162354-28886-1-git-send-email-martin.donnelly@ge.com>
X-Mailer: git-send-email 2.4.5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-22_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1601100000
	definitions=main-1602220199
Subject: [PATCH] perf: add sysroot handling to subcmd
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
X-List-Received-Date: Mon, 22 Feb 2016 18:28:36 -0000

v4.5-rc1 of the kernel splits the subcommand related files
from perf into a new library, this patch adds the modification
of the Makefile to preserve the --sysroot option as for
the other perf related Makefiles.

Signed-off-by: Martin Donnelly <martin.donnelly@ge.com>
---
 meta/recipes-kernel/perf/perf.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 33acb42..8b86290 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -164,6 +164,10 @@ do_configure_prepend () {
         sed -i 's,CC = $(CROSS_COMPILE)gcc,#CC,' ${S}/tools/lib/api/Makefile
         sed -i 's,AR = $(CROSS_COMPILE)ar,#AR,' ${S}/tools/lib/api/Makefile
     fi
+    if [ -e "${S}/tools/lib/subcmd/Makefile" ]; then
+        sed -i 's,CC = $(CROSS_COMPILE)gcc,#CC,' ${S}/tools/lib/subcmd/Makefile
+        sed -i 's,AR = $(CROSS_COMPILE)ar,#AR,' ${S}/tools/lib/subcmd/Makefile
+    fi
     if [ -e "${S}/tools/perf/config/feature-checks/Makefile" ]; then
         sed -i 's,CC := $(CROSS_COMPILE)gcc -MD,CC += -MD,' ${S}/tools/perf/config/feature-checks/Makefile
     fi
-- 
2.4.5


