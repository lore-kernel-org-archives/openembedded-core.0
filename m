Return-Path: <Ishaan.Desai@ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB64C44501
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 15:01:58 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12909.1783954912060960444
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 08:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ibm.com header.s=pp1 header.b=ZiCdTE68;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: ibm.com, ip: 148.163.156.1, mailfrom: ishaan.desai@ibm.com)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDCt32454131;
	Mon, 13 Jul 2026 15:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=GXT3R22cLnoqqAs6ZFYyIK4xuK/Eu07h3BR7I2A8M
	oY=; b=ZiCdTE68BSmdVD5R77NHNAuZRcNqDi4TkD16gqowAoEg+LxSzY7Pd5ge6
	D7jG6D9PB25Bx/WIFbApynqUVlrrrkWD55JbqDker8Wvn3P/s+BDm8MsXp9wT8MP
	LykenkDlaRtw5XiI5qVuMR4tbkST1toPS1LnzYUeyFgmC0jE114ypMA4ahnaGX7G
	M82T4xDA/Lt9ORLv4mh/axFuAmrB3GIyoEnxcb5C5KF49S7NA+EHHCceoqm79U9e
	AP+xXNpmm381dvaGerX2F6e8pfsWXlCI2ElDWgYTU7DD6juHimyVVkUMXJyPBBuY
	lwuMn5ovj+1jhbor+HIFehqTSSBgA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fbegt1b5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 15:01:42 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66DEngwO004867;
	Mon, 13 Jul 2026 15:01:41 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fc05pxcuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 15:01:41 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66DF1c5q27132566
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jul 2026 15:01:38 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCED258063;
	Mon, 13 Jul 2026 15:01:37 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8163258055;
	Mon, 13 Jul 2026 15:01:37 +0000 (GMT)
Received: from pfw153.pfw.tadn.ibm.com (unknown [9.5.7.52])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jul 2026 15:01:37 +0000 (GMT)
From: Ishaan Desai <Ishaan.Desai@ibm.com>
To: openembedded-core@lists.openembedded.org
Cc: Ishaan Desai <Ishaan.Desai@ibm.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH] memory-control: fix build failure on non-systemd distros
Date: Mon, 13 Jul 2026 10:01:20 -0500
Message-ID: <20260713150121.3809558-1-Ishaan.Desai@ibm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lGS4rnzTX_GFEsLEeXLUfEt3mm5GmZSq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1MyBTYWx0ZWRfX497h9UUUP7Nb
 8BoEdSN3ZDJZcxtInkSSIlyPz5sUg5d9CH53jmPgwYAdjxC2UBcEZXZmw01Y/lLh90tBkvXVeeB
 6DkCjD2La7EKywAoBA/skoA3q8yyE50=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1MyBTYWx0ZWRfX1l+auqRfBjaj
 8+ZmAz5NDW0MJL+4y5ppmpHiP6tByC0xsnJDUb+TJniS7VoGQ7/QWmwFHYY0ev9J03Uf5bj+cf6
 EnoELfpX2c9pt2lY5fm3qF/ndjmxgFzJdLNjujOMktLUSSdnuTSi3A9tvADwvZjuMH0BUx4+zYt
 Td0unf9JFs41Z5rHYJKS4NRqT8a/kMHuRQxLgKLny7pScO7xff99EU5akBdYRQL1vBFKdBjNnYr
 G3SYR6wEe5rrim7wZ+mLC+1K5UV3REBREp0YLXG+Mo0hMR8a/lWJEmtVRVNDqFerDzE7DwaYxCj
 wh93R7Nd8NDkCSQqdujNKEAtgpbfw6fcualIqhHQcBh1Y8E7bo5VCRzSWYqZGYvLbX3DRfyoC0F
 s1j2myxeb9GBHFkdvq+zNV9v1PB4WLKsQqcYOKLjQiN/nGszIdnUjwPDvYc7EiB4kEe14oXljn/
 Uuq9kcti4Gur8ofE4ZQ==
X-Authority-Analysis: v=2.4 cv=IqMutr/g c=1 sm=1 tr=0 ts=6a54fdd6 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=VnNF1IyMAAAA:8
 a=7CQSdrXTAAAA:8 a=Zqy_R5vQTI2Y5lxqZcwA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: lGS4rnzTX_GFEsLEeXLUfEt3mm5GmZSq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 15:01:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240842

The recipe unconditionally declared RDEPENDS on 'systemd', which is an
init manager, not an installable package. On distros like poky that do
not enable the systemd DISTRO_FEATURE, the dependency resolver cannot
satisfy this, causing the recipe and anything that inherits
memory-control.bbclass to become unbuildable in a world build:

  ERROR: Nothing RPROVIDES 'systemd'
  NOTE: Runtime target 'memory-control' is unbuildable

Fix by adding 'inherit features_check' and REQUIRED_DISTRO_FEATURES =
"systemd" to the recipe so it is cleanly skipped on non-systemd distros,
removing 'systemd' from RDEPENDS:${PN} in the recipe (the tool shells out
to systemctl at runtime, but systemd is an init manager present on the
running system, not a package dependency to install), and guarding the
RDEPENDS injection in memory-control.bbclass with bb.utils.contains so
recipes that inherit the class do not pull in the memory-control package
on non-systemd distros. Also add the missing RECIPE_MAINTAINER entry to
maintainers.inc.

Reported-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
AI-Generated: Uses IBM Bob

Signed-off-by: Ishaan Desai <Ishaan.Desai@ibm.com>
---
 meta/classes-recipe/memory-control.bbclass                | 4 +++-
 meta/conf/distro/include/maintainers.inc                  | 1 +
 meta/recipes-support/memory-control/memory-control_1.0.bb | 6 ++++--
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/memory-control.bbclass b/meta/classes-recipe/memory-control.bbclass
index 4b45720a1d..ebde5ed46b 100644
--- a/meta/classes-recipe/memory-control.bbclass
+++ b/meta/classes-recipe/memory-control.bbclass
@@ -25,7 +25,9 @@ MEMORY_LIMIT ?= ""
 MEMORY_LIMIT_SERVICE ?= "${PN}.service"
 MEMORY_OOM_POLICY ?= "reboot"
 
-RDEPENDS:${PN} += "memory-control"
+# Only inject the runtime dependency when the distro actually has systemd;
+# memory-control itself requires the systemd DISTRO_FEATURE.
+RDEPENDS:${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'memory-control', '', d)}"
 
 python memory_control_do_install() {
     import os
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4c6307086c..8589a67fa4 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -520,6 +520,7 @@ RECIPE_MAINTAINER:pn-matchbox-wm = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-mc = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-mdadm = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-menu-cache = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER:pn-memory-control = "Ishaan Desai <Ishaan.Desai@ibm.com>"
 RECIPE_MAINTAINER:pn-mesa = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-mesa-demos = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-mesa-gl = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-support/memory-control/memory-control_1.0.bb b/meta/recipes-support/memory-control/memory-control_1.0.bb
index 3740b783b6..56b156be4b 100644
--- a/meta/recipes-support/memory-control/memory-control_1.0.bb
+++ b/meta/recipes-support/memory-control/memory-control_1.0.bb
@@ -7,7 +7,9 @@ BUGTRACKER = "https://bugzilla.yoctoproject.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-inherit systemd
+inherit systemd features_check
+
+REQUIRED_DISTRO_FEATURES = "systemd"
 
 SRC_URI = " \
     file://memory-control.sh \
@@ -18,7 +20,7 @@ SRC_URI = " \
 SYSTEMD_SERVICE:${PN} = ""
 SYSTEMD_AUTO_ENABLE = "disable"
 
-RDEPENDS:${PN} = "bash systemd"
+RDEPENDS:${PN} = "bash"
 
 do_install() {
     install -d ${D}${bindir}

