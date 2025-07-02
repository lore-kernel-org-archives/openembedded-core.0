Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B57DC77B7C
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 15:46:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.27288.1751471194257533775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 08:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=927893d721=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5623xrRU026445
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Jul 2025 15:46:33 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j5m1cmdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 15:46:33 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 2 Jul 2025 08:46:31 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 2 Jul 2025 08:46:30 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH  6/6] xwayland: fix CVE-2025-49180
Date: Wed, 2 Jul 2025 21:16:19 +0530
Message-ID: <20250702154619.3765505-6-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250702154619.3765505-1-archana.polampalli@windriver.com>
References: <20250702154619.3765505-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEzMCBTYWx0ZWRfX3j1Xh+nzqdN3 rPSGcDxjOdGA/c0WBkCKr9pBwaPBH60zgG1XxOzg8sjzgDTaAD2hsq1lAJif/glawp8YKbnIl7P nbzt1cJHBpaIl4bnydBnNf69FTVrrfa8T81dccPK3wKJz4dItkbXKnOX7GnpLVCK0AanYzqVYFo
 UqjCiBVbJAzLUslNelqwaii8rXDubQztJ7tJTKbHdAEjlG8Zf1FB9rZF42iROndDgFqH6ntu1yu 9VwTIPzqDxDOg8eqFqkM7h9T0mZwNdxrpZWKFBk6BAA2DUS85ADLqlHVvsr52onvhmzT6XFHf4F GbLov0ubGtL6Q0VMk50Rb0RxuJLRJb7GSPTItb0dKUzcriaId8bO+HfHHdTlvGKBM9nojxj8VKm
 N/V60qDphpipDkknmEPEVydssUF2ITe7zrREOZdBHNvmyQnCGZKYm2ovFkMsc/y0+AFWfTNH
X-Authority-Analysis: v=2.4 cv=IOsCChvG c=1 sm=1 tr=0 ts=68655459 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=aR16PxjQAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=D31QgfloAAAA:8
 a=eyDTMUTSZJA0LI66-78A:9 a=Vxmtnl_E_bksehYqCbjh:22 a=zbFvvTOBjyH4ze5LlUjX:22 a=FdTzh2GWekK77mhwV6Dw:22 a=I6paTPn9_Px6ARgSWtWf:22
X-Proofpoint-GUID: 8Mp5iZ_r63vN_wCvOMdfnCUmhZZBdvr4
X-Proofpoint-ORIG-GUID: 8Mp5iZ_r63vN_wCvOMdfnCUmhZZBdvr4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507020130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 15:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219848

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the RandR extension, where the RRChangeProviderProperty function
does not properly validate input. This issue leads to an integer overflow when
computing the total size to allocate.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../xwayland/xwayland/CVE-2025-49180.patch    | 45 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49180.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49180.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49180.patch
new file mode 100644
index 0000000000..51939acf63
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49180.patch
@@ -0,0 +1,45 @@
+From 3c3a4b767b16174d3213055947ea7f4f88e10ec6 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Tue, 20 May 2025 15:18:19 +0200
+Subject: [PATCH] randr: Check for overflow in RRChangeProviderProperty()
+
+A client might send a request causing an integer overflow when computing
+the total size to allocate in RRChangeProviderProperty().
+
+To avoid the issue, check that total length in bytes won't exceed the
+maximum integer value.
+
+CVE-2025-49180
+
+This issue was discovered by Nils Emmerich <nemmerich@ernw.de> and
+reported by Julian Suleder via ERNW Vulnerability Disclosure.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2024>
+
+CVE: CVE-2025-49180
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/3c3a4b767b16174d3213055947ea7f4f88e10ec6]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ randr/rrproviderproperty.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/randr/rrproviderproperty.c b/randr/rrproviderproperty.c
+index 90c5a9a..0aa35ad 100644
+--- a/randr/rrproviderproperty.c
++++ b/randr/rrproviderproperty.c
+@@ -179,7 +179,8 @@ RRChangeProviderProperty(RRProviderPtr provider, Atom property, Atom type,
+
+     if (mode == PropModeReplace || len > 0) {
+         void *new_data = NULL, *old_data = NULL;
+-
++        if (total_len > MAXINT / size_in_bytes)
++            return BadValue;
+         total_size = total_len * size_in_bytes;
+         new_value.data = (void *) malloc(total_size);
+         if (!new_value.data && total_size) {
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 490e1ca05f..49e35ca442 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-49177.patch \
            file://CVE-2025-49178.patch \
            file://CVE-2025-49179.patch \
+           file://CVE-2025-49180.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.40.0


