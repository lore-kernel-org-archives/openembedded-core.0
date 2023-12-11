Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D511C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 00:58:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.97618.1702256300294653363
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 16:58:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AWRs2CKG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0709ce2531=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB0tEVj003279
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 16:58:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=0XwBF/u+18B6wjg0+Xn6nynz/NR/iuWUnUoq0wBPSBo=; b=
	AWRs2CKGn2XleogPzncXHilhPBnqT1PZWEL/9ZZhjoF+KEVsi9yk2ojo7OJ2B7os
	Bd4ijS1r8lzSKoiBHqt6b4nGgBDgX2DP46+nnZAftUmhptnRdPxSMEHoMWctxLrF
	YzPHvbbAGAe04U9r1vh9UryqewIHYKtyQPah2310dDZIRdpgjrdMeFi5iycrOLUR
	uqYKkzUAOR86c00Q+1OqUuB6WejTRx8e7nKzO6F6Y2t9JZsXUJF/JUgTRlPYhzDu
	esJ89FDrA+aIzQb93bhclaoxXpY7ul4VNJO1l+c+O080Mti0LBPjisNU3CHHGONg
	CD1w3SzQRVJ2QIR4O2ZFvQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvmd490v3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 16:58:19 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Dec 2023 16:58:23 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sun, 10 Dec 2023 16:58:23 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/5] base-files: update dirs1777 and volatiles according to VOLATILE_TMP_DIR
Date: Mon, 11 Dec 2023 08:58:12 +0800
Message-ID: <20231211005815.1119314-3-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211005815.1119314-1-changqing.li@windriver.com>
References: <20231211005815.1119314-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 2C0oo5ar0I0SoXPSI6HmOkU2ik9DNlVh
X-Proofpoint-ORIG-GUID: 2C0oo5ar0I0SoXPSI6HmOkU2ik9DNlVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 00:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192132

From: Changqing Li <changqing.li@windriver.com>

* update dirs1777 so that only create /var/volatiles/tmp when
VOLATILE_TMP_DIR set to yes, create /var/tmp when VOLATILE_TMP_DIR set
to no

* update volatiles so that only symlink /var/tmp to /var/volatiles/tmp
when VOLATILE_TMP_DIR set to yes

* mount /tmp as tmpfs fs when VOLATILE_TMP_DIR set to no and init
manager is sysvinit

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 9fab53ce63..b523c4aa62 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -30,7 +30,7 @@ S = "${WORKDIR}"
 INHIBIT_DEFAULT_DEPS = "1"
 
 docdir:append = "/${P}"
-dirs1777 = "/tmp ${localstatedir}/volatile/tmp"
+dirs1777 = "/tmp ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_TMP_DIR}') else ''}tmp"
 dirs2775 = ""
 dirs555 = "/sys /proc"
 dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
@@ -54,7 +54,8 @@ dirs755-lsb = "/srv  \
                ${prefix}/lib/locale"
 dirs2775-lsb = "/var/mail"
 
-volatiles = "${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''} tmp"
+volatiles = "${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''} \
+             ${@'tmp' if oe.types.boolean('${VOLATILE_TMP_DIR}') else ''}"
 conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
              ${sysconfdir}/issue /${sysconfdir}/issue.net \
              ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
@@ -122,6 +123,9 @@ do_install () {
 	fi
 
 	install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
+	if [ ${@ oe.types.boolean('${VOLATILE_TMP_DIR}') } = False ] && ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'false', 'true', d)} ;then
+		echo "tmpfs   /tmp  tmpfs  mode=1777,strictatime,nosuid,nodev,size=50%,nr_inodes=1m   0  0" >> ${D}${sysconfdir}/fstab
+	fi
 	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
 	sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}${sysconfdir}/profile
         sed -i 's#@BINDIR@#${bindir}#g' ${D}${sysconfdir}/profile
-- 
2.25.1


