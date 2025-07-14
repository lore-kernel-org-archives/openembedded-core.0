Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297C3C83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 12:19:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.76641.1752495534815716854
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 05:18:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9290e447fb=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56E6Wf5n926136
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 05:18:54 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47uk031ueq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 05:18:53 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 14 Jul 2025 05:18:53 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Mon, 14 Jul 2025 05:18:51 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH  1/1] gdk-pixbuf: fix CVE-2025-7345
Date: Mon, 14 Jul 2025 17:48:49 +0530
Message-ID: <20250714121849.3286177-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=RrjFLDmK c=1 sm=1 tr=0 ts=6874f5ae cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8
 a=20KFwNOVAAAA:8 a=t5fByIuH6XXhVskSYmAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Za2LfKHrEU_Ffj6aEpTu0QmGs9-wCEhI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDA1MyBTYWx0ZWRfX5Y/8BZkqwtVH
 6UMPokeVS48/RFGOAkN8KlrfX/nQr2q4xWTSxCw2S+fI0aozsKIQ8Q0B/LpqaSJT6OPKlt/AOtc
 yfMcNs2HP5b4Wi3kgytQ1tBmM6eANFH02uJgIGYGcrkOmspvd3idRTASaTFR/yzo5BYIGBYUQP1
 blYakvlXbG8kWh+beLJW3bjczCMwjVaqtzLHCGr/FwB/QYKN5CVreC6o4I8KEatJ4ETxOjwb/ZP
 gu1ScGM+6KEEp3IN39YO0P0P2wtA2r/zJt1UFixHr8LsZe16KvA191kEOwSwOmn1bjnezEwgQYB
 F3yozElDya/bzKM8AHOOYeuc/6AbAaC1WuHrKXqNa3QDAVYUZoaaLAFC4R4owjrIf1gloXSJUVl
 FNIy7or6
X-Proofpoint-GUID: Za2LfKHrEU_Ffj6aEpTu0QmGs9-wCEhI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507120053
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 56E6Wf5n926136
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 12:19:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220228

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw exists in gdk=E2=80=91pixbuf within the gdk_pixbuf__jpeg_image_loa=
d_increment function
(io-jpeg.c) and in glib=E2=80=99s g_base64_encode_step (glib/gbase64.c). =
When processing
maliciously crafted JPEG images, a heap buffer overflow can occur during =
Base64 encoding,
allowing out-of-bounds reads from heap memory, potentially causing applic=
ation crashes or
arbitrary code execution.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../gdk-pixbuf/gdk-pixbuf/CVE-2025-7345.patch | 55 +++++++++++++++++++
 .../gdk-pixbuf/gdk-pixbuf_2.42.10.bb          |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-734=
5.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-7345.patch=
 b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-7345.patch
new file mode 100644
index 0000000000..a8f23d3501
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-7345.patch
@@ -0,0 +1,55 @@
+From 4af78023ce7d3b5e3cec422a59bb4f48fa4f5886 Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Fri, 11 Jul 2025 11:02:05 -0400
+Subject: [PATCH] jpeg: Be more careful with chunked icc data
+
+We we inadvertendly trusting the sequence numbers not to lie.
+If they do we would report a larger data size than we actually
+allocated, leading to out of bounds memory access in base64
+encoding later on.
+
+This has been assigned CVE-2025-7345.
+
+Fixes: #249
+
+CVE: CVE-2025-7345
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/c=
ommit/4af78023ce7d3b5e3cec422a59bb4f48fa4f5886]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ gdk-pixbuf/io-jpeg.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/gdk-pixbuf/io-jpeg.c b/gdk-pixbuf/io-jpeg.c
+index 3841fc0..9ee1d21 100644
+--- a/gdk-pixbuf/io-jpeg.c
++++ b/gdk-pixbuf/io-jpeg.c
+@@ -356,6 +356,7 @@ jpeg_parse_exif_app2_segment (JpegExifContext *conte=
xt, jpeg_saved_marker_ptr ma
+		context->icc_profile =3D g_new (gchar, chunk_size);
+		/* copy the segment data to the profile space */
+		memcpy (context->icc_profile, marker->data + 14, chunk_size);
++                ret =3D TRUE;
+		goto out;
+	}
+
+@@ -377,12 +378,15 @@ jpeg_parse_exif_app2_segment (JpegExifContext *con=
text, jpeg_saved_marker_ptr ma
+	/* copy the segment data to the profile space */
+	memcpy (context->icc_profile + offset, marker->data + 14, chunk_size);
+
+-	/* it's now this big plus the new data we've just copied */
+-	context->icc_profile_size +=3D chunk_size;
++        context->icc_profile_size =3D MAX (context->icc_profile_size, o=
ffset + chunk_size);
+
+	/* success */
+	ret =3D TRUE;
+ out:
++        if (!ret) {
++                g_free (context->icc_profile);
++                context->icc_profile =3D NULL;
++        }
+	return ret;
+ }
+
+--
+2.40.0
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb b/meta/r=
ecipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
index cca89a9059..471d72d8dd 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
@@ -20,6 +20,7 @@ SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-$=
{PV}.tar.xz \
            file://run-ptest \
            file://fatal-loader.patch \
            file://0001-meson.build-allow-a-subset-of-tests-in-cross-comp=
ile.patch \
+           file://CVE-2025-7345.patch \
            "
=20
 SRC_URI[sha256sum] =3D "ee9b6c75d13ba096907a2e3c6b27b61bcd17f5c7ebeab5a5=
b439d2f2e39fe44b"
--=20
2.40.0


