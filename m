Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB052C83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 11:33:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11754.1752233598739141539
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 04:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9287d3c5d5=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BBFW89004020
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 04:33:18 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pyb5pduh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 04:33:18 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Fri, 11 Jul 2025 04:33:17 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Fri, 11 Jul 2025 04:33:15 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH  1/3] openssl: fix CVE-2024-41996
Date: Fri, 11 Jul 2025 17:03:11 +0530
Message-ID: <20250711113313.3009782-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfX4bmrnRVEJ+Pm Dp0HyR8vWLrxE0HS/bApsFEsopQHi7E/XFhoqcVVot333u4xmdw48ixinUQY50pCNbQ/KT1HIqV ENZjuIgDTyGasNdhBUv7nJTn2+3jC0LNh4XgvT+1joTYbSrepTPMPtLDmoFXBAkx+qSq/MUA6Yz
 N3BRAWb04w7hxIZ9SBadct0VaJlkkf4zpqaIetNyO0/hTgWCykE2eqAi6uyKcaeAtb5fs59dOI6 MMbWoKRB5PPCvJKNtmbLDW6ugAd446GpfrsZYzqjeEx3WjvsqIZZdDmeaXw6gXPa+1M4IqB9T0l SjRYSgJTfSOjf8eFF6FWHzg3VO4tDLbWedLZNcfO4+7gKmrnVTUO9OOUuDAI0sF/O40dyFjOy/n zmQS8eGg
X-Authority-Analysis: v=2.4 cv=V5590fni c=1 sm=1 tr=0 ts=6870f67e cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Ntg_Zx-WAAAA:8 a=pGLkceISAAAA:8
 a=J-CBz89tdS-ELqlGiXkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=RUfouJl5KNV7104ufCm4:22
X-Proofpoint-ORIG-GUID: 1Q7-1KHfSd95kMxRDj0RFwiqP8J0zMXO
X-Proofpoint-GUID: 1Q7-1KHfSd95kMxRDj0RFwiqP8J0zMXO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2507080198
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 56BBFW89004020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 11:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220141

From: Archana Polampalli <archana.polampalli@windriver.com>

Validating the order of the public keys in the Diffie-Hellman Key Agreeme=
nt Protocol,
when an approved safe prime is used, allows remote attackers (from the cl=
ient side) to
trigger unnecessarily expensive server-side DHE modular-exponentiation ca=
lculations.
The client may cause asymmetric resource consumption. The basic attack sc=
enario is that
the client must claim that it can only communicate with DHE, and the serv=
er must be
configured to allow DHE and validate the order of the public key.

Reference:
https://github.com/openssl/openssl/pull/25088

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../openssl/openssl/CVE-2024-41996.patch      | 48 +++++++++++++++++++
 .../openssl/openssl_3.0.16.bb                 |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-41=
996.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.pat=
ch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
new file mode 100644
index 0000000000..49ec9c0130
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
@@ -0,0 +1,48 @@
+From e70e34d857d4003199bcb5d3b52ca8102ccc1b98 Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tomas@openssl.org>
+Date: Mon, 5 Aug 2024 17:54:14 +0200
+Subject: [PATCH] dh_kmgmt.c: Avoid expensive public key validation for k=
nown
+ safe-prime groups
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The partial validation is fully sufficient to check the key validity.
+
+Thanks to Szil=C3=A1rd Pfeiffer for reporting the issue.
+
+Reviewed-by: Neil Horman <nhorman@openssl.org>
+Reviewed-by: Matt Caswell <matt@openssl.org>
+Reviewed-by: Paul Dale <ppzgs1@gmail.com>
+(Merged from https://github.com/openssl/openssl/pull/25088)
+
+CVE: CVE-2024-41996
+
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/e70=
e34d857d4003199bcb5d3b52ca8102ccc1b98]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ providers/implementations/keymgmt/dh_kmgmt.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/providers/implementations/keymgmt/dh_kmgmt.c b/providers/im=
plementations/keymgmt/dh_kmgmt.c
+index 795a3f2..3e7a811 100644
+--- a/providers/implementations/keymgmt/dh_kmgmt.c
++++ b/providers/implementations/keymgmt/dh_kmgmt.c
+@@ -387,9 +387,11 @@ static int dh_validate_public(const DH *dh, int che=
cktype)
+     if (pub_key =3D=3D NULL)
+         return 0;
+
+-    /* The partial test is only valid for named group's with q =3D (p -=
 1) / 2 */
+-    if (checktype =3D=3D OSSL_KEYMGMT_VALIDATE_QUICK_CHECK
+-        && ossl_dh_is_named_safe_prime_group(dh))
++    /*
++     * The partial test is only valid for named group's with q =3D (p -=
 1) / 2
++     * but for that case it is also fully sufficient to check the key v=
alidity.
++     */
++    if (ossl_dh_is_named_safe_prime_group(dh))
+         return ossl_dh_check_pub_key_partial(dh, pub_key, &res);
+
+     return DH_check_pub_key_ex(dh, pub_key);
+--
+2.40.0
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.16.bb b/meta/r=
ecipes-connectivity/openssl/openssl_3.0.16.bb
index a9fffd18ba..3d6993872b 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.16.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.16.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "https://github.com/openssl/openssl/release=
s/download/openssl-${PV}/op
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from=
-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
+           file://CVE-2024-41996.patch \
            "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.40.0


