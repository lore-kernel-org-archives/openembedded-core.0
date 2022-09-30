Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8018C43219
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 08:48:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3527.1664527707196958019
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 01:48:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=BmsUVnIa;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=7272aacdc6=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28U8hQal014225
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 08:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=PPS06212021;
 bh=qVVGseZ6jv2tHfErC0iFfujfLS7dTvQ34Kf1xruvBLU=;
 b=BmsUVnIaQpYsMFwoSlLxsqY9ApohCxs6H+6dG1JT+FwP9kDtmbxNaoaNfO8HfTV2UiSH
 k3NijigMieyJisIFkajVAc4Hijl7rUC8cmiF1cDN8QVKxxWlRd35uwiC4yxHMfvKk9/F
 630tcb0jN1L5AVAJeM9+IlPQV3sprLOBtYGQyWm3D7+fmbiMuXMcBTTS2wd/hA3UTZkP
 IRUi4WgfcrwqV8zXfjslIIxkdpxaMkudFyMzBlLJbliROMggqwG+1r2gaMBTHG0sGmUR
 hlFT9kfHum6Sf/ivHnRqMhmy+QPkO43Zj87/oIsovbMWQ4J6+1sdgcNtr4DViIwACaf9 Fg==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jsq425ahw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 08:48:26 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 30 Sep 2022 01:48:23 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 30 Sep 2022 01:48:24 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 30 Sep 2022 01:48:22 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] fix close_range fails unexpectedly in unprivileged process
Date: Fri, 30 Sep 2022 16:48:23 +0800
Message-ID: <20220930084823.2772546-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: POuR2kWUVXU9zQZJOmTTSA3Tn0Evxfkd
X-Proofpoint-GUID: POuR2kWUVXU9zQZJOmTTSA3Tn0Evxfkd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-30_04,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209300054
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 28U8hQal014225
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 08:48:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171215

From: Changqing Li <changqing.li@windriver.com>

After commit [1], start a unprivileged container (docker run without --pr=
ivileged),
close file will fail.

This is actually an docker issue, see [2]. But this issue will
block yocto build in docker with glibc2.35+. so add this local patch.

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/ce04a124040be091407e0702=
80d86ca810bacb8c
[2] https://github.com/moby/moby/issues/43595

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...fails-unexpectedly-in-unprivileged-p.patch | 46 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-fix-close_ra=
nge-fails-unexpectedly-in-unprivileged-p.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-fix-close_range-fai=
ls-unexpectedly-in-unprivileged-p.patch b/meta/recipes-core/glib-2.0/glib=
-2.0/0001-fix-close_range-fails-unexpectedly-in-unprivileged-p.patch
new file mode 100644
index 0000000000..213ee7b11f
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-fix-close_range-fails-unex=
pectedly-in-unprivileged-p.patch
@@ -0,0 +1,46 @@
+From 0fb283b3b1e3b4958b985804cbc40b7bff8b0e65 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 30 Sep 2022 08:29:41 +0000
+Subject: [PATCH] fix close_range fails unexpectedly in unprivileged proc=
ess
+
+After change [1], start a unprivileged container (docker run without --p=
rivileged),
+close file may fail.
+
+This is actually an docker issue, see [2]. But this issue will
+block yocto build in docker with glibc2.35+. so add this local patch.
+
+[1] https://gitlab.gnome.org/GNOME/glib/-/commit/ce04a124040be091407e070=
280d86ca810bacb8c
+[2] https://github.com/moby/moby/issues/43595
+
+Upstream-Status: Inappropriate [Rejected by upstream]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ glib/gspawn.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/glib/gspawn.c b/glib/gspawn.c
+index 0a2cbe5..83553a1 100644
+--- a/glib/gspawn.c
++++ b/glib/gspawn.c
+@@ -1544,7 +1544,7 @@ safe_fdwalk_set_cloexec (int lowfd)
+    * fall back to safe_fdwalk(). Handle EINVAL in case `CLOSE_RANGE_CLO=
EXEC`
+    * is not supported. */
+   int ret =3D close_range (lowfd, G_MAXUINT, CLOSE_RANGE_CLOEXEC);
+-  if (ret =3D=3D 0 || !(errno =3D=3D ENOSYS || errno =3D=3D EINVAL))
++  if (ret =3D=3D 0 || !(errno =3D=3D ENOSYS || errno =3D=3D EINVAL || e=
rrno =3D=3D EPERM))
+     return ret;
+ #endif  /* HAVE_CLOSE_RANGE */
+   return safe_fdwalk (set_cloexec, GINT_TO_POINTER (lowfd));
+@@ -1597,7 +1597,7 @@ safe_closefrom (int lowfd)
+    * Handle ENOSYS in case it=E2=80=99s supported in libc but not the k=
ernel; if so,
+    * fall back to safe_fdwalk(). */
+   int ret =3D close_range (lowfd, G_MAXUINT, 0);
+-  if (ret =3D=3D 0 || errno !=3D ENOSYS)
++  if (ret =3D=3D 0 || !(errno =3D=3D ENOSYS || errno =3D=3D EPERM))
+     return ret;
+ #endif  /* HAVE_CLOSE_RANGE */
+   return safe_fdwalk (close_func, GINT_TO_POINTER (lowfd));
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.72.3.bb
index dd1ea508d2..bbaacc64a4 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV=
}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-on=
ly-.patch \
+           file://0001-fix-close_range-fails-unexpectedly-in-unprivilege=
d-p.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch"
=20
--=20
2.34.1


