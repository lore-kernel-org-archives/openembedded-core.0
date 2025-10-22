Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9FD6CCF9E0
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 13:23:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9244.1761139391257119710
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 06:23:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=G3BHpile;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2390edad6f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59M0c1VF1325111
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 13:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Q/i7T+lHph4pfVIbkUZT
	3f7Pw2bsw/nigV0s4fhXpfg=; b=G3BHpileTRRYNXktfsvR0QYMuXrlKix94Sxh
	eBHaGsT4YYS1IBsBaZHBu4xMJJvyPdyyAE77VVzXxOdlFKfgCQAa0pMB37/ZySUO
	K+8BsQhJVVKPCU/e7G3688z2inU9sXQqvvwRAuW/hjQ3C9V8xHv2tPVoJxoKbXY7
	gEjrCAIS4n08w2wydCJEEyq8q/3Fip6gu6Uz+0Le4YswM2U1CGvnIo0/0uEPmprS
	LiV1p6eUqsy3isOkmDKEUR21bMfVZCEaFOuRetvy8G0IpIca00/l+9Z+ZPMnCSQ9
	4qPLi8e9LFb+GG6V562/dqkpf1YVjRZ0gC5cCCpXP4RSqnTf/Q==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49v1v5ct3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 13:23:10 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 22 Oct 2025 06:23:08 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Wed, 22 Oct 2025 06:23:08 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] util-linux: fix uuidd failed with /run/uuidd not found
Date: Wed, 22 Oct 2025 21:23:07 +0800
Message-ID: <20251022132307.2905011-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDEwOCBTYWx0ZWRfX7xnPBfGw3W+f
 T/lE/+823d/EIYKQSpd8OKfA/W17lTaWYyVeUqROL401HcwRU4JAo+osnGhFi0pB7WwnlAKAnDn
 qUAbrnx6OLaxK5L8DgEs/PuOaYFDPL0HqU4tUsQ18fALZApSyGSKGyOPYvw8eOPcq/VJY5LOIKz
 xdUE7mAImyMDsdEaGz2PAuNmQ1UivJZk7ZAH5TSjrGxMR62LjNBANTJ51vtfesGDdjes6CeomiZ
 FMIKM3k2lrntlU1zG4tIPZ7pSt8cRfdxZWBHmO2rbYmSOk5SNwqj4iWSQZBiG7TTvfTDUsdcVlx
 dzvD+TygFYrdZYoawa4XqRuFciBEuwq93ntTMp879obYrriHgiP43XmZETPBvvx50yVjfU/F2ss
 AO4HzHiR42YgIk2ml+SBSNXBXSy7Lg==
X-Proofpoint-GUID: dZJCLTRvBE9NtPDtRZdWUdki7uVCZGPK
X-Proofpoint-ORIG-GUID: dZJCLTRvBE9NtPDtRZdWUdki7uVCZGPK
X-Authority-Analysis: v=2.4 cv=ANdmIO46 c=1 sm=1 tr=0 ts=68f8dabe cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=KBHDS1nP3LGCiPU-rtoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510220108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 13:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225193

It failed to run uuidd
...
root@qemux86-64:~# uuidd
uuidd: cannot open /run/uuidd/uuidd.pid: No such file or directory
...

Create dir /run/uuidd for both of systemd and sysvinit

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../util-linux/util-linux_2.41.1.bb           | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux_2.41.1.bb b/meta/recipes-core/util-linux/util-linux_2.41.1.bb
index 08bca065b2..84c6d90b3f 100644
--- a/meta/recipes-core/util-linux/util-linux_2.41.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.41.1.bb
@@ -183,6 +183,10 @@ FILES:${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
 FILES:${PN}-mount = "${sysconfdir}/default/mountall"
 FILES:${PN}-runuser = "${sysconfdir}/pam.d/runuser*"
 FILES:${PN}-su = "${sysconfdir}/pam.d/su-l"
+FILES:${PN}-uuidd = " \
+    /etc/tmpfiles.d/uuidd.conf \
+    /etc/default/volatiles/99_uuidd \
+"
 CONFFILES:${PN}-su = "${sysconfdir}/pam.d/su-l"
 FILES:${PN}-lastlog2 += "${base_libdir}/security/pam_lastlog2.so \
                          ${nonarch_libdir}/tmpfiles.d/lastlog2.conf \
@@ -226,6 +230,12 @@ do_compile:prepend () {
 	[ -e ${S}/libsmartcols/src/filter-parser.c ] && touch ${S}/libsmartcols/src/filter-parser.c
 }
 
+pkg_postinst:${PN}-uuidd() {
+	if [ -z "$D" ] && [ -e ${sysconfdir}/init.d/populate-volatile.sh ] ; then
+		${sysconfdir}/init.d/populate-volatile.sh update
+	fi
+}
+
 do_install:append () {
 	mkdir -p ${D}${base_bindir}
 
@@ -279,6 +289,16 @@ do_install:append:class-target () {
 				> ${D}${sysconfdir}/default/volatiles/99_lastlog2
 		fi
 	fi
+
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/tmpfiles.d
+		echo "d /run/uuidd 0755 root root - -" > ${D}${sysconfdir}/tmpfiles.d/uuidd.conf
+	fi
+
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/default/volatiles
+		echo "d root root 0755 /run/uuidd none" > ${D}${sysconfdir}/default/volatiles/99_uuidd
+	fi
 }
 # nologin causes a conflict with shadow-native
 # kill causes a conflict with coreutils-native (if ${bindir}==${base_bindir})
-- 
2.34.1


