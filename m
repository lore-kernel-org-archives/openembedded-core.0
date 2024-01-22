Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4B3C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 04:24:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.65931.1705897444891809164
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jan 2024 20:24:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mSe4wtaY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1751e82f17=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40M3euCs015418
	for <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 20:24:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=HuTB9
	BniiXHaBjhI0H7Xzwbl9q50kF6kLqn9K2FV3jQ=; b=mSe4wtaYwI60tUDLUEJk4
	EAL6EonHteFwd9s2rti2pVkyCZH6BnrnDMUaTgfbRI6d+4USJEM5AB+19VVw4/ss
	NIp5cIqiMoxtePhp61YbjacCG9J7vTS6OemFEmAmpEYmQxexAf/doIgWJCGYK7K9
	U0ociNXQJOp3ziHevCM+a515V+v8Z4MGQr6y6lCf40um4Hz+1x2DAMEgg5HVYSUk
	XkcyCVF0+Jy/WF8ZSyn/murkn3LKmurRtWcrbAl1Iynh4bIUv7i0Ovwvp7xItE5Y
	x+/pmwmbKonwb3MZqgeUdN82o89/HRuk+NMxhh+pSfNVI9EmTvEwfVPHB+zIuPGj
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vrab4sa7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 20:24:04 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 21 Jan 2024 20:24:09 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sun, 21 Jan 2024 20:24:08 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] p11-kit: fix parallel build failures
Date: Mon, 22 Jan 2024 12:24:00 +0800
Message-ID: <20240122042400.1435898-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: iD-QEEe_rFLZGs49tB4iaY_aebZLi64H
X-Proofpoint-GUID: iD-QEEe_rFLZGs49tB4iaY_aebZLi64H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-21_04,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=719
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401220028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 04:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194110

From: Kai Kang <kai.kang@windriver.com>

It fails occasionally with missing generated header files:

| ../git/common/asn1.c:42:10: fatal error: openssl.asn.h: No such file or directory
|    42 | #include "openssl.asn.h"
|       |          ^~~~~~~~~~~~~~~
| compilation terminated.

According to meson manual page:

https://mesonbuild.com/Wrap-best-practices-and-tips.html#declare-generated-headers-explicitly

'asn_h_dep' should be a dependency of static_library target 'libp11_asn1'
to make sure that required header files generated before compile
common/asn1.c.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../files/fix-parallel-build-failures.patch   | 33 +++++++++++++++++++
 .../recipes-support/p11-kit/p11-kit_0.25.3.bb |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/p11-kit/files/fix-parallel-build-failures.patch

diff --git a/meta/recipes-support/p11-kit/files/fix-parallel-build-failures.patch b/meta/recipes-support/p11-kit/files/fix-parallel-build-failures.patch
new file mode 100644
index 0000000000..47df027106
--- /dev/null
+++ b/meta/recipes-support/p11-kit/files/fix-parallel-build-failures.patch
@@ -0,0 +1,33 @@
+It fails occasionally with missing generated header files:
+
+| ../git/common/asn1.c:42:10: fatal error: openssl.asn.h: No such file or directory
+|    42 | #include "openssl.asn.h"
+|       |          ^~~~~~~~~~~~~~~
+| compilation terminated.
+
+According to meson manual page:
+
+https://mesonbuild.com/Wrap-best-practices-and-tips.html#declare-generated-headers-explicitly
+
+'asn_h_dep' should be a dependency of static_library target 'libp11_asn1' to
+make sure that required header files generated before compile common/asn1.c.
+
+Upstream-Status: Submitted [https://github.com/p11-glue/p11-kit/pull/619]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ common/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/common/meson.build b/common/meson.build
+index dc86d7b..cc3ec48 100644
+--- a/common/meson.build
++++ b/common/meson.build
+@@ -113,6 +113,7 @@ if with_asn1
+     'p11-asn1', libp11_asn1_sources,
+     gnu_symbol_visibility: 'hidden',
+     include_directories: configinc,
++    dependencies: asn_h_dep,
+   )
+ 
+   libp11_asn1_dep = declare_dependency(
diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb b/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
index 9e959425f7..b7ebd44abc 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
@@ -10,7 +10,9 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 
 DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
-SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https"
+SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https \
+           file://fix-parallel-build-failures.patch \
+           "
 SRCREV = "917e02a3211dabbdea4b079cb598581dce84fda1"
 S = "${WORKDIR}/git"
 
-- 
2.34.1


