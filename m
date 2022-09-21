Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EE9ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 08:04:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.3906.1663747443903018913
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 01:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=CW+gOfwO;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=62635da6bb=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28L6atnc008339;
	Wed, 21 Sep 2022 01:04:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=PPS06212021;
 bh=6A+dj2a25POOVNuy5DVAiBnuKq7tNzKt2LHj6yLFjAU=;
 b=CW+gOfwOJ0mNE3g+69CXsjnSffJNION67NZiZpIuL85qZboHFYF83CpQWQ5X/0bTEsID
 eAezlw2g1XvV1mVe5gWMnQo3FQldSQse9ZKxOW/yq6CD5iD+bWP6FVTDcj56ZP0Lunuj
 EVLfmkp7ypgWzPQn827BzeYHHfpNCA2UsbEAU/hr39ROHueghVIyrZq3xCNU+ijDwQE6
 5nZRod5iFuIJdb0vcdc/b6FDjxcWy0hmA992eSJp4Yozdzwqy1o1uQhEodIhFFd+DqMd
 Sv5A5E7dBlBqI/6Z/DDOLqxlE4mgmk1ZvD62HTFRsVQrvq2HmycBECSVzO6gSAaAAQrZ iQ==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jndrkk00x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 21 Sep 2022 01:04:02 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 21 Sep 2022 01:04:01 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 21 Sep 2022 01:04:01 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 21 Sep 2022 01:04:00 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <martin.jansa@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] mesa: only apply patch to fix ALWAYS_INLINE for native
Date: Wed, 21 Sep 2022 16:03:57 +0800
Message-ID: <20220921080357.8493-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 8VOSThGtwsgEvXlOe0kEMxv1dPUUUciO
X-Proofpoint-ORIG-GUID: 8VOSThGtwsgEvXlOe0kEMxv1dPUUUciO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_04,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=997 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210052
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 28L6atnc008339
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 08:04:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170936

From: Kai Kang <kai.kang@windriver.com>

0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch is not
required by target mesa any more. But it still fails to compile
mesa-native with DEBUG_BUILD enabled on Ubuntu 18.04 with gcc 7.5.0
without this patch:

| ../mesa-22.1.6/src/compiler/nir/nir_inline_helpers.h: In function =E2=80=
=98nir_opt_move_block=E2=80=99:
| ../mesa-22.1.6/src/compiler/nir/nir_opt_move.c:55:1: error: inlining fa=
iled in call to
    always_inline =E2=80=98src_is_ssa=E2=80=99: indirect function call wi=
th a yet undetermined callee
|  src_is_ssa(nir_src *src, void *state)
|  ^~~~~~~~~~

So only apply it for mesa-native.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
v2:
* add comment

 meta/recipes-graphics/mesa/mesa.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index ea7ed4fd27..913aec987d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,9 +22,11 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa=
-${PV}.tar.xz \
            file://0001-util-format-Check-for-NEON-before-using-it.patch =
\
            file://0001-Revert-egl-wayland-deprecate-drm_handle_format-an=
d-d.patch \
            file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driD=
RI2.patch \
-           file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error=
.patch \
            "
=20
+# required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUILD =
enabled
+SRC_URI:append:class-native =3D " file://0001-nir-nir_opt_move-fix-ALWAY=
S_INLINE-compiler-error.patch"
+
 SRC_URI[sha256sum] =3D "22ced061eb9adab8ea35368246c1995c09723f3f71653cd5=
050c5cec376e671a"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
--=20
2.17.1


