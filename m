Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B071C30658
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 09:41:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13938.1720172500419485374
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 02:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=79167cd3f8=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4650iMnB026727
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Jul 2024 09:41:39 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 405jqy19w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 09:41:39 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 5 Jul 2024 02:41:38 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 5 Jul 2024 02:41:37 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][master][PATCH] pixman: fix do_compile error
Date: Fri, 5 Jul 2024 17:41:36 +0800
Message-ID: <20240705094136.3384004-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: EIyeQZL_R5Oe6vp-dGupbYvPVu8Uzoub
X-Proofpoint-ORIG-GUID: EIyeQZL_R5Oe6vp-dGupbYvPVu8Uzoub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_06,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 bulkscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407050072
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4650iMnB026727
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 09:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201595

From: Changqing Li <changqing.li@windriver.com>

When debug build is enabled(-Og is used), pixman-native do_compile
failed with error:
In function =E2=80=98combine_inner=E2=80=99,
    inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ../pixm=
an-0.42.2/pixman/pixman-combine-float.c:655:1:
../pixman-0.42.2/pixman/pixman-combine-float.c:370:5: error: inlining fai=
led in call to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_ligh=
t_c=E2=80=99: function not considered for inlining
  370 |     combine_ ## name ## _c (float sa, float s, float da, float d)

Refer [1], always_inline is not suggested to use with indirect function
call, replace always_inline with __inline__ to fix the issue

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107931

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...float.c-replace-force_inline-with-__.patch | 36 +++++++++++++++++++
 .../xorg-lib/pixman_0.42.2.bb                 |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-pixman-com=
bine-float.c-replace-force_inline-with-__.patch

diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-fl=
oat.c-replace-force_inline-with-__.patch b/meta/recipes-graphics/xorg-lib=
/pixman/0001-pixman-combine-float.c-replace-force_inline-with-__.patch
new file mode 100644
index 0000000000..cae201629f
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.c-r=
eplace-force_inline-with-__.patch
@@ -0,0 +1,36 @@
+From 49a1644015d073829c17dcd977aab6fdda1ebdee Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 5 Jul 2024 07:33:44 +0000
+Subject: [PATCH] pixman-combine-float.c: replace force_inline with __inl=
ine__
+   =20
+Refer [1], always-inline is not suggested to be used if you have indirec=
t
+calls. so replace force_inline with __inline__ to fix error:
+In function =E2=80=98combine_inner=E2=80=99,
+    inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ../pix=
man/pixman-combine-float.c:655:511:
+../pixman/pixman-combine-float.c:655:211: error: inlining failed in call=
 to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_light_c=E2=80=99=
: function not considered for inlining
+
+[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D115679
+
+Upstream-Status: Submitted [https://www.mail-archive.com/pixman@lists.fr=
eedesktop.org/msg04812.html]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ pixman/pixman-combine-float.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pixman/pixman-combine-float.c b/pixman/pixman-combine-float=
.c
+index f5145bc..52400f4 100644
+--- a/pixman/pixman-combine-float.c
++++ b/pixman/pixman-combine-float.c
+@@ -44,7 +44,7 @@
+=20
+ typedef float (* combine_channel_t) (float sa, float s, float da, float=
 d);
+=20
+-static force_inline void
++static __inline__ void
+ combine_inner (pixman_bool_t component,
+ 	       float *dest, const float *src, const float *mask, int n_pixels,
+ 	       combine_channel_t combine_a, combine_channel_t combine_c)
+--=20
+2.44.0
+
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb b/meta/recip=
es-graphics/xorg-lib/pixman_0.42.2.bb
index 23ae0cbb27..88eef50f7b 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
@@ -9,6 +9,7 @@ DEPENDS =3D "zlib"
=20
 SRC_URI =3D "https://www.cairographics.org/releases/${BP}.tar.gz \
            file://0001-ARM-qemu-related-workarounds-in-cpu-features-dete=
cti.patch \
+           file://0001-pixman-combine-float.c-replace-force_inline-with-=
__.patch \
            "
 SRC_URI[sha256sum] =3D "ea1480efada2fd948bc75366f7c349e1c96d3297d09a3fe6=
2626e38e234a625e"
=20
--=20
2.25.1


