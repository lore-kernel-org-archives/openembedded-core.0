Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25B4C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 09:56:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.70028.1705917376185639695
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 01:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aM9YVmQW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1751e82f17=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40M6jYvI001700
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 09:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=xj0ed
	BVn6MQOx2W3CB/Cckz5kJGoCBeF1B8sYTtwuP0=; b=aM9YVmQWoCa2Od0DOSF5j
	zrV8oqnlm+cF9cLp8NaJG4Uxcu+mrCcG+Wr/qDJkOgBJ6BiCAEQRK1Hg2pgzsSgL
	wIU/7d1z5dGqUo9CommxwCStpUtlI332txPoDRfrI5F7PHmehBzn5YftaZ2Aputc
	L7V/z97xchak2rjdEpVJf7/3n3vUvdaXLnCWFc0FbBh+FP+hPnLE1/ZbYk8vzL5X
	xMWqEUkSkobKa/ia34TZ821ehBwdIyEwPpMf28CvSGNKUQtdbwxbRIhNzQBxufKm
	ZahfYppVIabvQtpF1gGgXWeVGh5r4a/Qibe7hiHIMrYbpfttKKRRUqa2SZDApDuq
	g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr5571qm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 09:56:15 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 01:56:19 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 01:56:18 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] nativesdk-cairo: fix build error
Date: Mon, 22 Jan 2024 17:56:11 +0800
Message-ID: <20240122095611.2550591-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OxBGEAI4dGtJax_j-oMQ2qThkKk1-xqm
X-Proofpoint-ORIG-GUID: OxBGEAI4dGtJax_j-oMQ2qThkKk1-xqm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-21_04,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 mlxlogscore=822 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401220070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 09:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194130

From: Kai Kang <kai.kang@windriver.com>

It fails to build nativesdk-cairo:

| ../cairo-1.18.0/meson.build:381:13: ERROR: Can not run test
    applications in this cross environment.

Set meson property ipc_rmid_deferred_release in cross-file to fix the
issue which is as same as for target cairo

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-graphics/cairo/cairo_1.18.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cairo/cairo_1.18.0.bb b/meta/recipes-graphics/cairo/cairo_1.18.0.bb
index fe72537b77..4c97e973d0 100644
--- a/meta/recipes-graphics/cairo/cairo_1.18.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.18.0.bb
@@ -38,12 +38,13 @@ inherit meson pkgconfig upstream-version-is-even gtk-doc multilib_script
 
 # if qemu usermode isn't available, this value needs to be set statically
 # (otherwise it's determinted by running a small target executable with qemu)
-do_write_config:append:class-target() {
+do_write_config:append() {
     cat >${WORKDIR}/cairo.cross <<EOF
 [properties]
 ipc_rmid_deferred_release = 'true'
 EOF
 }
+EXTRA_OEMESON:append:class-nativesdk = "${@' --cross-file ${WORKDIR}/cairo.cross' if d.getVar('EXEWRAPPER_ENABLED') == 'False' else ''}"
 EXTRA_OEMESON:append:class-target = "${@' --cross-file ${WORKDIR}/cairo.cross' if d.getVar('EXEWRAPPER_ENABLED') == 'False' else ''}"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
-- 
2.34.1


