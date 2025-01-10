Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74095E7719A
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 01:31:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9413.1736472699042428031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jan 2025 17:31:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31055c3138=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A1TZhK025424
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 01:31:38 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fv3tdk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 01:31:37 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 9 Jan 2025 17:31:36 -0800
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 9 Jan 2025 17:31:35 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH] systemd: enable create-log-dirs
Date: Fri, 10 Jan 2025 09:31:35 +0800
Message-ID: <20250110013135.1203573-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Ngx4xJGquM0j1CQNHDr1uNYYiL3XL40w
X-Authority-Analysis: v=2.4 cv=NIUv+16g c=1 sm=1 tr=0 ts=67807879 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VdSt8ZQiCzkA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=e5mUnYsNAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8
 a=ag1SF4gXAAAA:8 a=CqwtNdRY7PFeicUN6rcA:9 a=h7n8ThxqooUA:10 a=Ah1nPfSrf1cA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Vxmtnl_E_bksehYqCbjh:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: Ngx4xJGquM0j1CQNHDr1uNYYiL3XL40w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-09_11,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501100009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 01:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209633

From: Changqing Li <changqing.li@windriver.com>

By default, create-log-dirs  is enabled in systemd, and a link
/var/log/README will be created, point to {{DOC_DIR}}/README.logs, but,
for oe, there are two problems here, firstly, DOC_DIR is packaged in
another package systemd-doc, so /var/log/README is a dead link when
systemd-doc is not installed, secondly, even systemd-doc is installed,
when volatile log is used, DOC_DIR is a wrong relateive path, Refer [1].

So in commit [2], we disable create-log-dirs for above issue. with this
change, /var/log/journal is not created, and /run/log is used, this
makes systemd log always non persistent, refer [3][4]. if user need
persistent log, they need to disable volatile log, and also  change
journald.conf, make "Storage" to "persistent". This is a behavoir change.
Previously, to make systemd log persistent, user only need to disable
volatile log.

This commit reenable create-log-dirs to revert the behavior change, and
since README is not very userful, just remove it.

[ YOCTO #15678 ]

[1] https://github.com/systemd/systemd/blob/main/tmpfiles.d/legacy.conf.in#L16
[2] https://git.openembedded.org/openembedded-core/commit/?id=18d46e11d85da1f6feaba5a135931e43060024d6
[3] https://github.com/systemd/systemd/blob/main/src/journal/meson.build#L189
[4] https://www.freedesktop.org/software/systemd/man/journald.conf.html
[5] https://bugzilla.yoctoproject.org/show_bug.cgi?id=15678

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/systemd/systemd_255.13.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_255.13.bb b/meta/recipes-core/systemd/systemd_255.13.bb
index fa3ad1d2cd..8f5170929f 100644
--- a/meta/recipes-core/systemd/systemd_255.13.bb
+++ b/meta/recipes-core/systemd/systemd_255.13.bb
@@ -248,7 +248,6 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Dsystem-uid-max=999 \
                   -Dsystem-alloc-gid-min=101 \
                   -Dsystem-gid-max=999 \
-                  -Dcreate-log-dirs=false \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', '-Ddefault-mdns=no -Ddefault-llmnr=no', '', d)} \
                   "
 
@@ -401,6 +400,10 @@ do_install() {
 			sed -i '/AlternativeNamesPolicy=/s/$/ mac/' ${D}${rootlibexecdir}/systemd/network/99-default.link
 		fi
 	fi
+
+	if [ -e ${D}${nonarch_libdir}/tmpfiles.d/legacy.conf ];then
+		sed -i -e '/^L \/var\/log\/README/d' ${D}${nonarch_libdir}/tmpfiles.d/legacy.conf
+	fi
 }
 
 python populate_packages:prepend (){
-- 
2.25.1


