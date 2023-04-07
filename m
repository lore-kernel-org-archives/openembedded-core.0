Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0997AC6FD1D
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 05:15:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1094.1680844524362728266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 22:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=EFGPI7M+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34613e1654=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33759kNK016871
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Apr 2023 05:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=5GPH+V5O5mpWtn2l0gnmXDj73M+ZrsqplsLF1ZeF62Q=;
 b=EFGPI7M+8sRNmN0SoUE3O9bik4oyllGNXE0qnaE/ZsoTLHcKx49Rp9LCe7FJa2KtPGpG
 ct00IWweZ3O7zJttrxESMxkKL34syzD9YJ75CZn2sbx79MU70g7kgRPE/47uPEg7YlT9
 P5vRA1CZjfJdIcAKlawxntk374h0tqg+vFXQeJ9NSSV9Py+bu9ieIEQLlJclibEgnboP
 F0zUK1gAIEmQ9ioLPD32rOCZ8YdMhJKlpjFHoUtFfKA+x2A/47O+LDhZvm26tCf29Msp
 1I+M51H8L14jUY5S8HeGR7JcqIgeoDoTaDY7SUuWHWxuAmQBF/OwYCiYtNehyA3RIcg2 mg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pp9u4pnj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 05:15:23 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 6 Apr 2023 22:15:22 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Thu, 6 Apr 2023 22:15:21 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libnotify: remove dependency dbus
Date: Fri, 7 Apr 2023 13:15:19 +0800
Message-ID: <20230407051519.1829-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: OLI2VQEnrImrpw0SBFj_OCAH4ii-CryW
X-Proofpoint-GUID: OLI2VQEnrImrpw0SBFj_OCAH4ii-CryW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_02,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=652 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304070047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 05:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179810

From: Kai Kang <kai.kang@windriver.com>

It ported to use GDBus in libnotify 0.7.0 [1]. So remove dbus from
DEPENDS. And GDBus is provided by glib-2.0.

[1]: https://gitlab.gnome.org/GNOME/libnotify/-/commit/f63e8ab

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-gnome/libnotify/libnotify_0.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb b/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
index b1656fe0fe..08e9899d00 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
@@ -9,7 +9,7 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-DEPENDS = "dbus glib-2.0 glib-2.0-native gdk-pixbuf"
+DEPENDS = "glib-2.0 glib-2.0-native gdk-pixbuf"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,gtk+3"
-- 
2.17.1


