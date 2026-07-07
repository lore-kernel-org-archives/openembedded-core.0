Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A86A3C44501
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 14:34:48 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.174711.1783434887686297734
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 07:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=nyHSPfO1;
 spf=pass (domain: est.tech, ip: 40.107.162.64, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qj6MI7SzNmECFc+s6noFXA2QZGkwyDqIB2tRX6h83SGuRUA0sqnk4F11iTDkBTdrKIULLkPVpYGPxpPkhdkENvywheeUeKeCON+NAuQcM4Q2F3+FhxjYtNvwaA8Gpu+VHxKS6XNmRXEy+juZKpBvs25fauZxWzkLi6iA7mZYJTtd2UHcIDTJ/1OkXpj8P+v70qNQtK6DCFCA3QVzVyqh9qyB25TWCmJE/SycqEVEUeCFL/b+ITJxIK7Loq9/7chVzB5RjmOkl/4+XTbwMwxyDNA1KUT13+NLaQFyliRpRsJZ2JstTxiYjFSTLJmmNdjUR8GFmzRlSuMSl7AusiCOzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4IFcydbjkeB3mp8ZzEDy5MWbVzwPutCItMlJ11u+AA=;
 b=KfACorn85YJlo/DSjHA2FuwMlX+LWMstG+k2hBbXFB+EZdVDUCHJqoznhMFeLHeGMCvhR8J5zEkWl0tEtERuNyrkTEyIbV8ExGFQVk7SDUz9134kniI+n3/w3avIpz6a9GA3GoBnwL+mu/mNYaMcPdpA8gyNW8cOJTV0MA+dYXsMiVJYfiEZwEJQhvDuF9/ulvv71aoUjTz9wU/uwHtkaYqvkLSDiK1w5xDxl5/F3is3eGTJ51v3lD1ynZ7jZ8uwnoYmoOUoMAmFRJtJPg0vQyiKDuyl0q7Badi2NGSgRD9IiECsN3lE9RZnMN5/bWQh/Holzg/pZJYLv7FF2J8htw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4IFcydbjkeB3mp8ZzEDy5MWbVzwPutCItMlJ11u+AA=;
 b=nyHSPfO13WllIhgFzDBL13kBIqMXDu4Xshi264gjcQaHiYxDu5CgN42zJkyV08W8DFQ7aOWkS7TuSBfsG1j0N80r9uTK4kPJhNLHUdIzGHy5Aw1/GuxTJuINAY+dB24lJWDOABjokAppR42NuYWlkMZkZfN7xUpG19fCG4x5lNOYYU7NZmoc2zdWMHHQvkYwkTxUzVOnLt2MlUIs4MgDMFUywEKEFe/GycMntU4hDlJSjphpeOhit0ZY0NoZQ9MIkAAy0JsIVRV7QyikjzPyxH6Xl+JaYCXxwpLPZB075iMPArp6SnC39HXgShcFxQnPa07dInfS0NBnXguuPT1gVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB0902.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:149::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 14:34:45 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%8]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 14:34:45 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH] gzip: fix CVE-2026-41992
Date: Tue,  7 Jul 2026 16:34:21 +0200
Message-ID: <20260707143421.34255-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260707143421.34255-1-jaipaul.cheernam@est.tech>
References: <20260707143421.34255-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0032.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::8) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB8P189MB0902:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a8539f8-f30c-47b1-923a-08dedc34e3c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	IM45xsSEOpqjYiu+7Xqd96iEjI8+Y5ooY4ma1Iw6R5BpTZa2IOgc5wHyRLKlhk4BoBb1jsCAF7T1tj2tlwCvfysQVrWlQqtXr1kwSbsVsv33ntNntEx/KuXlVWr9TXFl1f7MPAZ556UeBZkn/BPOoAiKZ7MI+dN53V95KmpZYG3BlEnfBYccwRz5lYNnn/Kk+dUDcpjmEJEJJJlM3mX39IXGQlZR8tyVB0Mhr1/ooR550r+D6MV3x0moIIeBk4DiG2lROoB74zTm+OJyyDIHxmcBsaZF6J+4u/VFx+j7gGFGdRsDFhoVE1QImBPThTUCFV3YmoivGfRfKCVDMkb6pzSBXD+r/Rl4SHZEEUpCDnITpTGI4E/BDP97MG4+8/NyiTRYz9uUSQP1PFxgKkRdBdo7sNSVYcrcJgwSNFKUI70QA/O2O56+mz14g8n5ALPgvgZ+OU+EVN16mES9e9/zcGRxW9UAhQPqe9LJi6h+LXmYmUitSLOmS13qIx+7W97Dh5PbSnfcLkMW3yNhkDbUCzIcAyTo/cE4O+wciyNfrE5tOJmzDuscuFAOtgMb/0sAOerGMNRcMK/xVB/v8Q3UiWEoTGSNZPmAZfq9DAf2KJA8l5lBDjJQINFgb6fHFsGN3SagB2Nv9pxmoYETAWl4ZqokGvVnjYCDr7qzuCgrD/I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YFiUKiT+oQlXG7EyKvslr75BXmsmUdpfwYI/fHRBqIJsnB816PYTQ4GXrcmT?=
 =?us-ascii?Q?S8n4awIiQkK9p8W9z8Uxb5yQlNRRln/HvKTezuvZsrEy8dbk/f76Am27PBUS?=
 =?us-ascii?Q?LSaKif52vv05+NBX2Bcbe/k2R0kqifY5sF58u6KV6l9XwY3i5kimUNdWVgxF?=
 =?us-ascii?Q?B/mVjGX1OVw5dJzJ0umXD6PBcqZP0BwgOlaNqqTDt+ZiAc2yF59QfipSYyX5?=
 =?us-ascii?Q?hJ12FQhl5bH+ggL58yU184Iffg/wO1ncD38gGqF8jMnSDj8tv9oYyVZmiaVF?=
 =?us-ascii?Q?b14y+K3sGobbyD0CVDNihkNqi7JjC1C5aVsJi61UtW3WJeMGLvtHon6HE948?=
 =?us-ascii?Q?AU0IhlPB/6jr7/5/RWpO7e0/sGIXoGHKhjuEg+VPMtkX+gRtngYokSwCZYmY?=
 =?us-ascii?Q?dQb9zjfRPas0XmzotWzFHmtLlqc4jP7lOdIAQgZtbVAmCfbeK2lOBRE5fBL6?=
 =?us-ascii?Q?dzvqDyrPlW4+mEkmSn6YRrFiBlubGVyfc4tML8LutgaI3hIj06V3Dz8+dTTr?=
 =?us-ascii?Q?E/uiK1vs4u1uU1WYeXi6+90yQ4RuhXZ5l2Xs0oJYT9OHg8LbPvB8GQLeTcQZ?=
 =?us-ascii?Q?6VrCkRjuJA8MOeVUk71TZHJC0/BuSGPSCTCdJTUTtY1IKMktRwqUf98ICj4u?=
 =?us-ascii?Q?H4hr8G9D7Q+E/LbkGxHjAE35CdzbdPgF0/htbOMH1RrcJwMaUVMb+VY0MNmF?=
 =?us-ascii?Q?3iIBkRbhIipQ2BGRefBjmQB3Ei5V4yYlBFPMOp0Oemt5YbMuXp/dOWxJ5xbx?=
 =?us-ascii?Q?CBbk4vY2euUMl4OXxYc3uLe+Zj7lFwcMQUM1ArEuqzP/YEh4JYvP3XQJiOMt?=
 =?us-ascii?Q?eRscDPRTUQ/FB99YwAo4+WHWHW1+8rSir208ckbtDo6lGRUOM+spvAraaGwY?=
 =?us-ascii?Q?qhdgPys/ATyqINc24teXPAChcZVY4kT5NxbmT+C3tC9AfnRJji6t4DbFg55n?=
 =?us-ascii?Q?RHEy+v7Yh4QuPqIKRuBWsL9SqmKK0rIMJxlUqzNeqIEmz1uN8bZ8cJ2VdPza?=
 =?us-ascii?Q?676pe+zbD5AWNFUNf16Sgh9NhT5hwmiblYGxLlJdNst4Lwuyte9bUDRJWJf9?=
 =?us-ascii?Q?t8On7KfCncrlKoxUl36l1f2wI2gDnTY3z1wfOTnlVAJ26FW/MI0NMuFYd59J?=
 =?us-ascii?Q?tcFjNMeGfJVsUBh6RL8sLDUtZ99mftvHNlAqkIzvPtjl7VJQFlASewZy2jCJ?=
 =?us-ascii?Q?89wVYCAn0a+JTEtEQydpsIBZnl45Ob94yoYGxuGGbD6yQfd1Qz6xTEQWXFFJ?=
 =?us-ascii?Q?SNthHFDRUEwNG8u04sTuAtr9EmZVcBrH36/0dPPuuoMFWxBfxoriEwLRg0kt?=
 =?us-ascii?Q?YIUp8F2rHwiab4KfpnJx3h+jG7MzO1GCqX1l/eGNT3JwYE+xJyXXVXHAAgEO?=
 =?us-ascii?Q?cg9suvncoA85WtJ1OIiEbArqd+mDPO32NdvOzUzFFhl/5fLGdcy2XVVM0VXc?=
 =?us-ascii?Q?KaHa1UV+wNy9aVI5l3LESIR96wr/V3qj9+ImRa0knKb5IDAvUCioOe1a3Z62?=
 =?us-ascii?Q?3GhxuqLvUwVI+YQKMNxcxaaZwxcT9GWKAKOFZ3uKnqvYHg1cN8BNthYJ2FS7?=
 =?us-ascii?Q?z48Abhf7TnQQ4wHSELlHu4CtzZkM3zRrI9r6GEoG6uS+vVC6rU5Criux+gF0?=
 =?us-ascii?Q?+eydPKR2G4aq7hU1D6PHgvpf/MyKyhdQVHb1zQa6gJicYqMMvWsBWH6gq3VW?=
 =?us-ascii?Q?k/U3xCruI1MzdL8aOIv3JKTPuZRHuXKFxHh5VNhbxyNZDSCkWgpQUDpw6+3l?=
 =?us-ascii?Q?X2afaha7ag=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8539f8-f30c-47b1-923a-08dedc34e3c0
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 14:34:45.2033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/0oNysMzBDKDlinATnlH+R3xGAgUd3uH1Ee62emJttEhaQzVsTmKKXSpzlg88vjiC+okrbdH5bqUy2SOtxjSeVyvbeigSRpuARKtjIp7bQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0902
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 14:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240394

Backport upstream fix for a global buffer overflow in the LZH
decompression logic (unlzh.c). The left[] and right[] global arrays
shared across LZW and LZH decompression routines are not reinitialized
between files processed in the same invocation, allowing an
out-of-bounds read in the LZH decoder.

Reference: https://nvd.nist.gov/vuln/detail/CVE-2026-41992
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../gzip/gzip-1.14/CVE-2026-41992.patch       | 32 +++++++++++++++++++
 meta/recipes-extended/gzip/gzip_1.14.bb       |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.pat=
ch

diff --git a/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch b/me=
ta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch
new file mode 100644
index 0000000000..5d3534fcb1
--- /dev/null
+++ b/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch
@@ -0,0 +1,32 @@
+From 63dbf6b3b9e6e781df1a6a64e609b10e23969681 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Wed, 15 Apr 2026 12:00:17 -0700
+Subject: gzip: don't mishandle .lzh after .Z
+
+Problem reported by Michal Majchrowicz.
+* unlzh.c (read_c_len): Clear left and right when n =3D=3D 0.
+
+CVE: CVE-2026-41992
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gzip.git=
/commit/?id=3D63dbf6b3b9e6e781df1a6a64e609b10e23969681]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ unlzh.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/unlzh.c b/unlzh.c
+index 3320196..a6cf109 100644
+--- a/unlzh.c
++++ b/unlzh.c
+@@ -232,6 +232,12 @@ read_c_len ()
+         c =3D getbits(CBIT);
+         for (i =3D 0; i < NC; i++) c_len[i] =3D 0;
+         for (i =3D 0; i < 4096; i++) c_table[i] =3D c;
++
++        /* Needed in case LEFT and RIGHT are reused from a previous
++           LZW decompression.  It may be overkill to clear all of both
++           arrays, but nobody has had time to analyze this carefully.  */
++        memzero(left, (2 * NC - 1) * sizeof *left);
++        memzero(right, (2 * NC - 1) * sizeof *left);
+     } else {
+         i =3D 0;
+         while (i < n) {
diff --git a/meta/recipes-extended/gzip/gzip_1.14.bb b/meta/recipes-extende=
d/gzip/gzip_1.14.bb
index c7837cdae0..99174a58c5 100644
--- a/meta/recipes-extended/gzip/gzip_1.14.bb
+++ b/meta/recipes-extended/gzip/gzip_1.14.bb
@@ -6,6 +6,7 @@ LICENSE =3D "GPL-3.0-or-later"
=20
 SRC_URI =3D "${GNU_MIRROR}/gzip/${BP}.tar.gz \
            file://run-ptest \
+           file://CVE-2026-41992.patch \
            "
 SRC_URI:append:class-target =3D " file://wrong-path-fix.patch"
=20
--=20
2.34.1


