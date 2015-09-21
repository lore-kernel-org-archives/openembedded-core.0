Return-Path: <ian.ray@ge.com>
X-Greylist: delayed 3534 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 21 Sep 2015 08:15:28 UTC
Received: from mx0b-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
	[67.231.157.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7586473243
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 08:15:28 +0000 (UTC)
Received: from pps.filterd (m0048300.ppops.net [127.0.0.1])
	by m0048300.ppops.net-00176a03. (8.15.0.59/8.15.0.59) with SMTP id
	t8L7G6Aa003241 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 03:16:33 -0400
Received: from cinmlip10.e2k.ad.ge.com (n165-156-000-000.static.ge.com
	[165.156.4.1] (may be forged))
	by m0048300.ppops.net-00176a03. with ESMTP id 1x10cnhqu2-3
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 03:16:32 -0400
Received: from alpmlip01.e2k.ad.ge.com ([3.159.17.48])
	by cinmlip10.e2k.ad.ge.com with ESMTP/TLS/RC4-SHA;
	21 Sep 2015 03:16:32 -0400
Received: from unknown (HELO clipsmtp.clients.em.health.ge.com) ([3.187.7.87])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 21 Sep 2015 03:16:30 -0400
Received: from macaroni.clients.em.health.ge.com
	(macaroni.clients.em.health.ge.com [3.187.18.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by clipsmtp.clients.em.health.ge.com (Postfix) with ESMTPSA id
	5BED110BC303; Mon, 21 Sep 2015 10:11:58 +0300 (EEST)
From: Ian Ray <ian.ray@ge.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Sep 2015 10:11:53 +0300
Message-Id: <1442819513-20171-2-git-send-email-ian.ray@ge.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1442819513-20171-1-git-send-email-ian.ray@ge.com>
References: <1442819513-20171-1-git-send-email-ian.ray@ge.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-09-21_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1507310000
	definitions=main-1509210129
Subject: [yocto][PATCH 1/1] ptest: user-specified run-ptest script location
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
X-List-Received-Date: Mon, 21 Sep 2015 08:15:29 -0000

Provides a new variable, PTEST_RUN_SCRIPT_PATH, which points to a
directory where the run-ptest script is located.  This location
defaults to the work directory but may be overridden within a recipe
if a package ships its own run-ptest script.

Signed-off-by: Ian Ray <ian.ray@ge.com>
---
 meta/classes/ptest.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index b5f470f..7d9d0cc 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -3,6 +3,7 @@ DESCRIPTION_${PN}-ptest ?= "${DESCRIPTION}  \
 This package contains a test directory ${PTEST_PATH} for package test purposes."
 
 PTEST_PATH ?= "${libdir}/${PN}/ptest"
+PTEST_RUN_SCRIPT_PATH ??= "${WORKDIR}"
 FILES_${PN}-ptest = "${PTEST_PATH}"
 SECTION_${PN}-ptest = "devel"
 ALLOW_EMPTY_${PN}-ptest = "1"
@@ -37,8 +38,8 @@ do_install_ptest() {
 }
 
 do_install_ptest_base() {
-    if [ -f ${WORKDIR}/run-ptest ]; then
-        install -D ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
+    if [ -f ${PTEST_RUN_SCRIPT_PATH}/run-ptest ]; then
+        install -D ${PTEST_RUN_SCRIPT_PATH}/run-ptest ${D}${PTEST_PATH}/run-ptest
         if grep -q install-ptest: Makefile; then
             oe_runmake DESTDIR=${D}${PTEST_PATH} install-ptest
         fi
-- 
1.8.3.1


