Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A953FC54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 05:11:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6019.1709010717510514115
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 21:11:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KT78qtYF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=27874ce11d=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41R4x3mk010836
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 21:11:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=sI6Lr
	iLHukmgDdpMyPrg//cnik9wsos+YrCyaRmYJoA=; b=KT78qtYFS6ADHCf6yPmCU
	cNfP70Y3PLb+VYI1bJdjbiRR3xUDriWtwCc2ChgskaVJb0QINi1//2lnmBjiYLjC
	Nrj/Bm29rLZbJ0qgtkHnzWRMCfENIXDxiLi+Ia4ya+hHLRhC7R2J3MHFycuXOMUG
	PLBfUpQUkSoERsxkLCMteRxsq9qWx8BEtISPThaBC9B+uYkYld5lSvCbw1+VvGB7
	+owijZiU6IFR3ohRNaS1LflxVulhXkOszlj356W86Z1BFEHpXtatQAveMQyaQ+wB
	W2iE5appt8oofhGDWShuQ/oQbbay4SKFZCZ3pX+1khHTG85SQEwAyGpo7/fgd2gG
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfcm42hcr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 21:11:57 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 21:11:56 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 21:11:55 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V5] systemd: fix a dead link under /var/log
Date: Tue, 27 Feb 2024 13:11:55 +0800
Message-ID: <20240227051155.2166683-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: wNwfCdS5nvXbSuo2Y029sYlCpdP3WFdJ
X-Proofpoint-GUID: wNwfCdS5nvXbSuo2Y029sYlCpdP3WFdJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402270039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 05:11:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196242

From: Changqing Li <changqing.li@windriver.com>

Commit 6fe23ff31c0 changed README to a symlink to README.logs, and
install README.logs under systemd doc dir.

But for OE, systemd doc dir is splited into package systemd-doc, when it
is not installed on the target, there will be an dead link:
Eg:
root@intel-x86-64:/var/log# ls -l README
lrwxrwxrwx 1 root root 39 Jun 20 08:57 README -> ../../usr/share/doc/systemd/README.logs
root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.logs
ls: cannot access '../../usr/share/doc/systemd/README.logs': No such file or directory

First, package this link into systemd-doc to fix above issue.  Second,
Source link path created by systemd is not correct when VOLATILE_LOG_DIR
is true. Create the symlink using absolute path to cover both condition.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/systemd/systemd_255.1.bb | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_255.1.bb b/meta/recipes-core/systemd/systemd_255.1.bb
index 9e09c89355..73ef0f01b2 100644
--- a/meta/recipes-core/systemd/systemd_255.1.bb
+++ b/meta/recipes-core/systemd/systemd_255.1.bb
@@ -382,10 +382,15 @@ do_install() {
 	# add a profile fragment to disable systemd pager with busybox less
 	install -Dm 0644 ${WORKDIR}/systemd-pager.sh ${D}${sysconfdir}/profile.d/systemd-pager.sh
 
-    if [ -n "${WATCHDOG_TIMEOUT}" ]; then
-        sed -i -e 's/#RebootWatchdogSec=10min/RebootWatchdogSec=${WATCHDOG_TIMEOUT}/' \
-            ${D}/${sysconfdir}/systemd/system.conf
-    fi
+	if [ -n "${WATCHDOG_TIMEOUT}" ]; then
+		sed -i -e 's/#RebootWatchdogSec=10min/RebootWatchdogSec=${WATCHDOG_TIMEOUT}/' \
+			${D}/${sysconfdir}/systemd/system.conf
+	fi
+
+	if grep -q '^L /var/log/README' ${D}${nonarch_libdir}/tmpfiles.d/legacy.conf 2>/dev/null; then
+		sed -i -e '/^L \/var\/log\/README/d' ${D}${nonarch_libdir}/tmpfiles.d/legacy.conf
+		echo "L ${localstatedir}/log/README - - - - ${datadir}/doc/systemd/README.logs" > ${D}${nonarch_libdir}/tmpfiles.d/legacy-doc.conf
+	fi
 }
 
 python populate_packages:prepend (){
@@ -622,6 +627,8 @@ FILES:${PN}-udev-rules = "\
                         ${rootlibexecdir}/udev/rules.d/99-systemd.rules \
 "
 
+FILES:${PN}-doc  += "${nonarch_libdir}/tmpfiles.d/legacy-doc.conf"
+
 CONFFILES:${PN} = "${sysconfdir}/systemd/coredump.conf \
 	${sysconfdir}/systemd/journald.conf \
 	${sysconfdir}/systemd/logind.conf \
-- 
2.25.1


