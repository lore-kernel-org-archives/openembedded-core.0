Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABB0D41D4D
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 03:15:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.78367.1731381318272229370
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 19:15:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10462b0a34=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC2hxLa013103
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 19:15:18 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwpmg1ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 19:15:17 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 11 Nov 2024 19:15:17 -0800
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 11 Nov 2024 19:15:16 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V2] gdk-pixbuf: enable other loaders by default
Date: Tue, 12 Nov 2024 11:15:15 +0800
Message-ID: <20241112031515.2438680-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6TzOYNjePwCsJBaNPhm1xqNzmzP0-Fg1
X-Authority-Analysis: v=2.4 cv=ZdlPNdVA c=1 sm=1 tr=0 ts=6732c845 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=GHR8O2WEAAAA:20 a=p0WdMEafAAAA:8 a=Br9LfDWDAAAA:8 a=Bw9GwAB4ZPJxoN4hxGQA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 6TzOYNjePwCsJBaNPhm1xqNzmzP0-Fg1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_08,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxlogscore=415 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411120025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 03:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206984

From: Changqing Li <changqing.li@windriver.com>

Refer [1], upstream gdk-pixbuf disable some loaders by default from
2.42.11, this makes some format of icons not works well after upgrade
gdk-pixbuf, report error like:
matchbox-deskto[501]: Error loading icon: Failed to load /usr/share/pixmaps/xinput_calibrator.xpm: Unrecognized image file format

Add PACKAGECONFIG gif, others, and fix the same as some other sdks and
arch linux, disable these loaders by default, refer [2][3][4]

[1] https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/e052a112075a19fb75f1f2ff3de4c82923de13f2
[2] https://gitlab.gnome.org/GNOME/gnome-build-meta/-/issues/846
[3] https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/commit/3ab7810255c64ce8aa2ae3ac10250148588ab49b
[4] https://gitlab.archlinux.org/archlinux/packaging/packages/gdk-pixbuf2/-/commit/4fa2d98a197781354b66a9710c9d596d502c961b

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
index 9f825a68ef..e32903a451 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
@@ -32,7 +32,7 @@ GIR_MESON_DISABLE_FLAG = "disabled"
 
 LIBV = "2.10.0"
 
-GDK_PIXBUF_LOADERS ?= "png jpeg"
+GDK_PIXBUF_LOADERS ?= "png jpeg gif others"
 
 PACKAGECONFIG = "${GDK_PIXBUF_LOADERS} \
                  ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
@@ -41,6 +41,8 @@ PACKAGECONFIG:class-native = "${GDK_PIXBUF_LOADERS}"
 PACKAGECONFIG[png] = "-Dpng=enabled,-Dpng=disabled,libpng"
 PACKAGECONFIG[jpeg] = "-Djpeg=enabled,-Djpeg=disabled,jpeg"
 PACKAGECONFIG[tiff] = "-Dtiff=enabled,-Dtiff=disabled,tiff"
+PACKAGECONFIG[gif] = "-Dgif=enabled,-Dgif=disabled"
+PACKAGECONFIG[others] = "-Dothers=enabled,-Dothers=disabled"
 PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false"
 
 EXTRA_OEMESON = "-Dman=false"
-- 
2.25.1


