Return-Path: <ian.ray@ge.com>
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com
	[67.231.149.52])
	by mail.openembedded.org (Postfix) with ESMTP id 21C347701A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 10:08:17 +0000 (UTC)
Received: from pps.filterd (m0048275.ppops.net [127.0.0.1])
	by m0048275.ppops.net-00176a03. (8.15.0.59/8.15.0.59) with SMTP id
	t8UA6SLd034153 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 06:08:17 -0400
Received: from alpmlip12.e2k.ad.ge.com (n165-156-000-000.static.ge.com
	[165.156.5.1] (may be forged))
	by m0048275.ppops.net-00176a03. with ESMTP id 1x5qnwwa3y-7
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 06:08:17 -0400
Received: from cinmlip01.e2k.ad.ge.com ([3.159.213.48])
	by alpmlip12.e2k.ad.ge.com with ESMTP/TLS/RC4-SHA;
	30 Sep 2015 06:08:16 -0400
Received: from unknown (HELO clipsmtp.clients.em.health.ge.com) ([3.187.7.87])
	by CINMLIP01.e2k.ad.ge.com with ESMTP; 30 Sep 2015 06:08:15 -0400
Received: from macaroni.clients.em.health.ge.com
	(macaroni.clients.em.health.ge.com [3.187.18.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by clipsmtp.clients.em.health.ge.com (Postfix) with ESMTPSA id
	D91F310BC303; Wed, 30 Sep 2015 13:03:41 +0300 (EEST)
From: Ian Ray <ian.ray@ge.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Sep 2015 13:03:38 +0300
Message-Id: <ac2c65aaac574dbfaa4271710b7a2904af114810.1443606524.git.ian.ray@ge.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1443606524.git.ian.ray@ge.com>
References: <cover.1443606524.git.ian.ray@ge.com>
In-Reply-To: <cover.1443606524.git.ian.ray@ge.com>
References: <cover.1443606524.git.ian.ray@ge.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-09-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1507310000
	definitions=main-1509300151
Subject: [PATCH v2 1/1] ptest: run-ptest not required to run do_install_ptest
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
X-List-Received-Date: Wed, 30 Sep 2015 10:08:20 -0000

Modify do_install_ptest_base to run do_install_ptest and install the
Makefile irrespective of the presence of ${WORKDIR}/run-ptest.  This
change allows "ptest-aware" packages to install run-ptest as part of
the make machinery.

Signed-off-by: Ian Ray <ian.ray@ge.com>
---
 meta/classes/ptest.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index b5f470f..4dc5dbe 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -39,12 +39,12 @@ do_install_ptest() {
 do_install_ptest_base() {
     if [ -f ${WORKDIR}/run-ptest ]; then
         install -D ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
-        if grep -q install-ptest: Makefile; then
-            oe_runmake DESTDIR=${D}${PTEST_PATH} install-ptest
-        fi
-        do_install_ptest
-        chown -R root:root ${D}${PTEST_PATH}
     fi
+    if grep -q install-ptest: Makefile; then
+        oe_runmake DESTDIR=${D}${PTEST_PATH} install-ptest
+    fi
+    do_install_ptest
+    chown -R root:root ${D}${PTEST_PATH}
 }
 
 do_configure_ptest_base[dirs] = "${B}"
-- 
1.8.3.1


