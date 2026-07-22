Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C1EC44533
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:23:42 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43243.1784708618923637436
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=cy3SaOLM;
 spf=pass (domain: est.tech, ip: 52.101.69.0, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVKUou4wOGlDEHVTaPer4Nis4QmS9SyUK085P85RYzgtv9e4Ys6wUow05NgAAIjsRSx/sLKEtlixKiZShvYL7338WkAO8h9sYXbgdlHMDljnwvYmDA3zMFiYlGm4eQ0naSMSXI7QZ0U9WTcQfRZqT9Ou2jWBM3UeYPGLueRCsg/qoq/VI1UtZqwAxgyj7UnpL0TLKSCd7f++jmhz7LHtxSfAU04iZc2Kq9Qkv8iugXOX4zFNklR1sxXFa3+uxEAinGKSHIJVsUN37a6WS3++KXzZN/FdrYmbCzACCfdkD4DbGL6I4WFoH2dxA9/ScBWzq/yAnHhb1AEQuZsmgMauiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMtuuBOLNYXWghShusNF9/ilkh0V7AS+rK6lexogSCY=;
 b=uMMUHOelSpfFKLK/XhXZt4E143ItmTKZmBLohUBCG2JPpnIyjQhC6z04GtKpBLrjvActNZbmnDEy6F5T3aH8KFW6Dm+hrHbTspvcKTXzjdo6rRaCizYdb7Lu2dg5pTyu/XWGUAgo6YVmocpj3F4r5rxhifN+Lx91pC3RHZFPVyl8vH4/AIHSU13E3IMOQtu8iMjqbYoxQwf5ggMCJgdi912LRG8mxayr1bSyQ2NGLQulCCMjo4XQ6axiiTB8RAaGaoIM/U3mKQZAwVycpN7MDPIrA7SqnYJ7tZxBLRDM/JVPgMZ7QUrhzRZa1Ga5jRdfLwTo2TJLpLZRuzzNHfyEAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMtuuBOLNYXWghShusNF9/ilkh0V7AS+rK6lexogSCY=;
 b=cy3SaOLMwVltahxoW+O3GY2FMQVGfvsziBwpY9nTlGB+iVEBr3CVEklkDuBi/Exqlwcsex9TKDKceknIyQ+C3HGMilsW8wqktclI76UI93nwkwo2jU/exJ1BMdUC6yVE/H7wBkrT56oz3d9H6mUCFS3p3Wxw9le8ohVycXan4gVjl52v3rQ+/kqSmebpUWxMA4zSHwoMb84VOPG35f66cEc4Q1lfq9SbkLd/Ve6svuqelgfrrx96NQhqs7Wks+98mUOaS/OHqoySmWjeg6UNQNsYgaaJijwwXvQFfroxkxkUyx7O/Fi3myH9YNX/tt3peQbhHqfLW3WlvEVi4MJeqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by GV4P189MB3630.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 08:23:35 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 08:23:35 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 1/5] wget: fix CVE-2026-58470
Date: Wed, 22 Jul 2026 10:23:20 +0200
Message-ID: <20260722082330.15415-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB8P191CA0026.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::36) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|GV4P189MB3630:EE_
X-MS-Office365-Filtering-Correlation-Id: d2669416-c2b4-470b-be9d-08dee7ca85e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|13003099007|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	BhCY6YYUiD0905TOJXX9hU32yIepyfb0LUBe/H+4IlyXEoLf+9bYRKxCUt2e4l4cVeWLfSBfxkmJt+CMS3ebtHPwHkH3Cg2LZXMJMOnb++H14pWapGN8ET2zP6Wp9nGP4Fx7zwgchkYA0f/zYMtkLSAKmwfrhEl59xu8RKvs3D/w3ex71IVNdyRg5zwZr3olbCRKt4zPV6MO8Mv3WT9+tkqoMkudOzPbQKL2FY50Tmjlrba+2um87typR3fQ/JPsqAxZXnLvhW3+rlZM5OlT6/FfvgrtRkCf1APquWMogL6P/ZRTgRyzvqzzVqDXo5mgRPxwvP1A92Q7251cse2r3L5dd080ysvgoolOJFdEkFv+bx3Q0zSqz9xJ/APpdoK9NuYnhIr9lmZai4QLAUqjGtjW0u8Wx+HhQ44UCB8lCqM/GU8UuPFjZOxDt+nYCrUmJgKeu0tu6QMm6a1kmLHndYgVRWMw+yQCzV5UBo/AFRPNnHuYFA91/m/zk1vhZfDSpAe6n+hLfnLLWCHp8/Zxl4EBpyW4aYRCZR74nQHl18dIwq5qaCXazDXhF2SB6S8J9T60JpwZHCaeyTEzh8SjwLoS69AttYxM9b+bMuBW8A+JJq3q+s+cyeoDVuemvG4S
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(13003099007)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wT7jwgJXxblDAxthvRYDXC9s5W6Vj6+6ldb4IIzrObkTEIehS53twYM3cQs2?=
 =?us-ascii?Q?g5acbluWwxtlhZ2N4LWg+uut3WJTveWyAmngAEJNsa0hhmjHsiWawTuIQoeq?=
 =?us-ascii?Q?Tst6J+P0H8UK0raQL4RbU6Jibx9hFsZIjZr0O5z2FzvY1VAwrD9CUkU6uTSF?=
 =?us-ascii?Q?OWl/bw/cK3uD/IkLn3myb18dyQbyQDWoMDlcnPp0aOR5jaIyBi35DMoILTDe?=
 =?us-ascii?Q?g5uB+7j1KvDQi1d7BKPXe0weD6kru9pR9xGFEDgiBpHh7KPzdIyzerxRExO9?=
 =?us-ascii?Q?mxa7WhzzyWm+vaxBHEfm4sS+HXAFPWI3vHR8lWZYKhFZFByZmvSjBNQGvwY+?=
 =?us-ascii?Q?0I6uPIWLiis5IFid2/D/xu25gZUotWPVV0SeaGykl4fA55g99BywQD5/X40I?=
 =?us-ascii?Q?Kot0mobJ1DDBnWIBFSJlugwgEqJutCS9XR8+8H1anGAww7H6VuDBbcmk2zow?=
 =?us-ascii?Q?fAIV6er85UcBhGpOfvlUoWrjYaVl2CGzovJ/hE2lbs4vikvKl+AL0GCVgA1j?=
 =?us-ascii?Q?VE+adHSByUk1iqXAH4zW/1vNc/ouxMoh2mGaxOuXFlQrv8w/INeumoIv5O72?=
 =?us-ascii?Q?JfvC4YTwtkBpyHQIDt9QzciWGYt+7yJx1dfRTAD6aylD4AwDcAnaYY/Ui9mp?=
 =?us-ascii?Q?fsNI1Alsz+zMnzxu4FM25Yvkl9dt+XyCFBTPbvX8KT7owQyI8MfU1+OK9mYy?=
 =?us-ascii?Q?YWe832r+zzV6Sh5m51HcgkQsPeludr/8YHSkb0MfcHynSndVboKuidjUTZJ+?=
 =?us-ascii?Q?Q16lA0TPeJ9pRRlMBDgiQ6naT0Ri1+KxZYsYw6HIhFLENhu4lLmFB6QGMvL2?=
 =?us-ascii?Q?HCUPSHJuNt8r/RYWWXx2T9Cfqfw1RfQPWD12xsHundnJx2ztKS8mfZKWNJMu?=
 =?us-ascii?Q?V8vWjJf8VTi7mFIRDtQcT9voooIVO65se8n0FF6p2jw3vrxwavP9+94i/TFT?=
 =?us-ascii?Q?uDAVF8ci3II5pSa/VJ7fzGZ5ZmRF95yoft/8vjlA9goGpOaD6McNnSJZGsTj?=
 =?us-ascii?Q?tKji6vNMky8k1X+W8FcKd/2qkCxSsI6XZkfmUsQVlDyoY7IrP61QxiZx9Oq0?=
 =?us-ascii?Q?4+/bAYwazxUcXntuCro5Ezi78d856RiIadSo2k1zokGgF0j8h3Daw3a00I5d?=
 =?us-ascii?Q?4dPfre+ZhEOO3he66grp7q6ZfMv3mwlBXwXDI216HRb4GxDmX3JGmDMmahpX?=
 =?us-ascii?Q?IAs8Z2/dHzl7mR6nCRTlW9x5JGqGAPKFpPLqEC5ukwkP9RCTRm2chdNV56XI?=
 =?us-ascii?Q?SeQuiUq5oBih3VtQuAtRJa7WGo6EXiO+yuToIVrQ6bicZSrGCcmOgG8GfUzd?=
 =?us-ascii?Q?jrAFERWtRg7fPsP1gGQTbLf6DLhjcwxqryO3LfHvQwIOkIPyPRDhfAdm5IVr?=
 =?us-ascii?Q?Fokrp/1ftG/Y/Lm2tKGiVWFX3uIsCIE+6BPwP3kmzU+4Qm45YJUVlWGYg1Je?=
 =?us-ascii?Q?dXPypQRDHqhkxmVSjPhUxbWxrCdrxA5ORkbbEp5DVO3s3UtYJXG7qFOYci/t?=
 =?us-ascii?Q?2LfdTiIZK7ETR6mDrJSaox378qEMMl/T0n3a+mgG72ppxKjHMpMAiwXL3gHw?=
 =?us-ascii?Q?xOzBejZ8w4+Q0xoNOQYAe4+wgphfPbie3I2sMaoWUwlVdbs7Cm4Gl5WfYLtK?=
 =?us-ascii?Q?7tjTHlUFLLyrWYeWkbbmFswlpCiHtZn0N8P10VEPsbhVasLha8pBmTK1cayj?=
 =?us-ascii?Q?JLUr9s66chLkGHlVfKUIk1c1NpXsi9bvKH+qVCefq7dyZktHJoX7Jv1AAkqo?=
 =?us-ascii?Q?bajUg972Kg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d2669416-c2b4-470b-be9d-08dee7ca85e6
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:23:34.9873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jPaLRDv9ARSTY/+Um08xN1bKpTisAPZQ6wLP1C3dYyI+E+x4o18YKFDoCRSIbRU3dmYM7FZ8P1VdPV/FBe2idw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3630
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241621

From: Amaury Couderc <amaury.couderc@est.tech>

Backport patch to fix CVE-2026-58470.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-58470
  https://www.cve.org/CVERecord?id=3DCVE-2026-58470
  https://security-tracker.debian.org/tracker/CVE-2026-58470
  https://ubuntu.com/security/CVE-2026-58470
  https://osv.dev/list?q=3DCVE-2026-58470

Upstream fix:
  https://gitlab.com/gnuwget/wget/-/commit/43d3ba9336bc94937e6fae2365c6ffd3=
0c34ffcf [nvd]

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../wget/wget/CVE-2026-58470.patch            | 78 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.21.4.bb     |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58470.patch b/meta/re=
cipes-extended/wget/wget/CVE-2026-58470.patch
new file mode 100644
index 0000000000..02f9ba13f8
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58470.patch
@@ -0,0 +1,78 @@
+From 1edd2898a9b041ededdf92caebd6f707cc9f192d Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Tim=3D20R=3DC3=3DBChsen?=3D <tim.ruehsen@gmx.de>
+Date: Mon, 29 Jun 2026 18:57:54 +0200
+Subject: [PATCH] * src/http.c (parse_content_range): Fix integer overflow
+
+Reported-by: TristanInSec@gmail.com
+
+CVE: CVE-2026-58470
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/43d3ba=
9336bc94937e6fae2365c6ffd30c34ffcf]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ src/http.c | 35 ++++++++++++++++++++++++-----------
+ 1 file changed, 24 insertions(+), 11 deletions(-)
+
+diff --git a/src/http.c b/src/http.c
+index 116a93a3..4dc6b70f 100644
+--- a/src/http.c
++++ b/src/http.c
+@@ -914,6 +914,7 @@ parse_content_range (const char *hdr, wgint *first_byt=
e_ptr,
+                      wgint *last_byte_ptr, wgint *entity_length_ptr)
+ {
+   wgint num;
++  char *end;
+=20
+   /* Ancient versions of Netscape proxy server, presumably predating
+      rfc2068, sent out `Content-Range' without the "bytes"
+@@ -932,27 +933,39 @@ parse_content_range (const char *hdr, wgint *first_b=
yte_ptr,
+     }
+   if (!c_isdigit (*hdr))
+     return false;
+-  for (num =3D 0; c_isdigit (*hdr); hdr++)
+-    num =3D 10 * num + (*hdr - '0');
+-  if (*hdr !=3D '-' || !c_isdigit (*(hdr + 1)))
++
++  errno =3D 0;
++  num =3D strtol(hdr, &end, 10);
++  if (errno =3D=3D ERANGE)
++    return false;
++  hdr =3D end;
++
++  if (*hdr++ !=3D '-' || !c_isdigit (*hdr))
+     return false;
+   *first_byte_ptr =3D num;
+-  ++hdr;
+-  for (num =3D 0; c_isdigit (*hdr); hdr++)
+-    num =3D 10 * num + (*hdr - '0');
+-  if (*hdr !=3D '/')
++
++  errno =3D 0;
++  num =3D strtol(hdr, &end, 10);
++  if (errno =3D=3D ERANGE)
++    return false;
++  hdr =3D end;
++
++  if (*hdr++ !=3D '/')
+     return false;
+   *last_byte_ptr =3D num;
+-  if (!(c_isdigit (*(hdr + 1)) || *(hdr + 1) =3D=3D '*'))
++  if (!(c_isdigit (*hdr) || *hdr =3D=3D '*'))
+     return false;
+   if (*last_byte_ptr < *first_byte_ptr)
+     return false;
+-  ++hdr;
+   if (*hdr =3D=3D '*')
+     num =3D -1;
+   else
+-    for (num =3D 0; c_isdigit (*hdr); hdr++)
+-      num =3D 10 * num + (*hdr - '0');
++    {
++      errno =3D 0;
++      num =3D strtol(hdr, NULL, 10);
++      if (errno =3D=3D ERANGE)
++        return false;
++    }
+   *entity_length_ptr =3D num;
+   if ((*entity_length_ptr <=3D *last_byte_ptr) && *entity_length_ptr !=3D=
 -1)
+     return false;
diff --git a/meta/recipes-extended/wget/wget_1.21.4.bb b/meta/recipes-exten=
ded/wget/wget_1.21.4.bb
index b5f50f6c84..6d66ab46d0 100644
--- a/meta/recipes-extended/wget/wget_1.21.4.bb
+++ b/meta/recipes-extended/wget/wget_1.21.4.bb
@@ -2,6 +2,7 @@ SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
            file://CVE-2024-38428.patch \
            file://CVE-2024-10524.patch \
+           file://CVE-2026-58470.patch \
           "
=20
 SRC_URI[sha256sum] =3D "81542f5cefb8faacc39bbbc6c82ded80e3e4a88505ae72ea51=
df27525bcde04c"
--=20
2.34.1


