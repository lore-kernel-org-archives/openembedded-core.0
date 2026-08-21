Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50782C5DF8C
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 08:58:32 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3539.1787302707376352261
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 01:58:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=WpK1kTFU;
 spf=pass (domain: est.tech, ip: 52.101.65.39, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXrMUvynBzqnBNQE3OqyeBIChIV8oTiof+A4JjL3x3GTuECrFO5N7VwYK9OHnDC6AZ8UbojqKeHqubXWVhetoNq3bw66nWeiw6ulynuxSppEeEg0hqg1tS7Y0THW1hNKJ14DVKCEk28TcmkpAJblyNPGdfRkMbI65mwjVRYUyxaqsqbHAd4AsBKXILVleOmGo90p3XEnRlq5RzzY3GKVN4Js/ltN8rnudxLmTTEApRYSBEoX7GNJVN6MtaBSbafk/BAu2N6fvf0HJKVcvla2wQMScJRHbcde4gQqhPicr17+fJWd0YjHNlyl0bF494snomkxPP6i4qRn/OT7Rg3K1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGGCvfc4C24lOhFnpXfzw0kpY7xvU98DfrI8qevD3vo=;
 b=F1QQGgyjkn+0oUPb80vUqjU+OZE2GYDAXapFip8GaWrnMf44LjpO6dg5lw/yqoMkE5h2HvGFn+Kqpndp5gPKw+zMiy0xMv29mEKXQHa+JwfLWWbkgaIEhqd83IO8HpC/nSzHY5lePtvfMRhyzXPiPSRipP84HDW2jtEFaIgwm4I/OIxmXHMu0pA2qkBFF+ZWPYNVy+84Vcjf+KySVAQgdfdAsUo72SVXrYNHLyAg+Bo8kM8tQ9MjWlxdEJzbSXMfCOHU0l80I+gKUGyH8tETasLBhLpGMzKf3Omw71zEnteUEmN3szohzfG+ujrCdnFIlyUaZ3nuaWx3bATL8oujtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGGCvfc4C24lOhFnpXfzw0kpY7xvU98DfrI8qevD3vo=;
 b=WpK1kTFUJmgv3yRgL+J0Cbad2vPqwTadpSyahEnwfOmnjvXhTm2G2bUjwriiakaKvrPXy8AyrdtaBWW7d6VQutV8NcjVTUtufBYowscbMUWX2KUrpvgXHZDDtRhHn0WFudDOL9WzByPf11pUmGnJ5JZp+EoCJ7czrq25d75egXD3+1PvuXQp0EW1ivuRt9GJa0bHlrX3tKjIGYKPSJRwpaN6Na9maDymdtJh53YP5eXERt8biovvBVJD1yUxrPmQf32qmAysKwhfrQH4nMsvTdFc7Yd63spDyc1/K9ov/v3Jb6apyPNuqjL/7QQj+u+pvZ6MI/azguzKLb86OEStiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by VI0P189MB3686.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2da::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.3; Fri, 21 Aug
 2026 08:58:22 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0360.003; Fri, 21 Aug 2026
 08:58:22 +0000
From: Roland Kovacs <roland.kovacs@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v2] gnutls: Backport fix for CVE-2026-33846
Date: Fri, 21 Aug 2026 10:58:20 +0200
Message-ID: <20260821085820.1121831-1-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0166.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::9) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|VI0P189MB3686:EE_
X-MS-Office365-Filtering-Correlation-Id: c7596746-1641-4bae-2744-08deff625a6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|12006099003|11063799006|10067099003|13003099007|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	yZTWm5Q9Wyp1oZWHFFb4vM/uT2svOGyGHbmCuVYyAgwRstkbFhMHZ0ShxPnYktqoTKS1Z+aWJ9uvwooke4QM1dZyMkn5sfdFywnus1MotNmq8t9PYItKzGbvmVJOJMJ7mdgNRBWnm6cJ+ttpqSUd7/ETBaJ9kj3i63C0AxxDuvP2bJvIgGl6m7FcBu3dBAThiBbGTkm4zeQfVqHAsx5+6NN55Tr6K2WjBoYpW76neiA7XcPjeBrzCqUZsepky4r3tZozM6AWmh7KfL4ergkA/8arxXy+1uhsUlwJc3dAWydhjXugdpxLRQ/d7PN+sCZJwD9tNzRwSO2ka8YvIKXgATu6j0nnnwLdj7Y7i40XlnDqPY0fJgJgtbN1JJfPLtLifESQhlfZsgzbmBkGLz6879YzxNlwjvXPGvcoC+8MtEkgnyc5x8+5KK3/I5gBJIYf2tc85o22DiAAyGBpcaBf/jX5WB1jcW4+GGOV0FSYIP8q1bkFgrBLuIFEStk8OrfiNESPlRLh1ekoI0NfdeYtXV7twv2QuZYsmIichzdyY6bUexa9CSPyQr/r+MgKZ0RQbzVLM2X20HM2nAx+Gg4lhLIyBKk8TjQC5NDTNp4I9M+s2SvDroNuIOOUPk0c/594
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(12006099003)(11063799006)(10067099003)(13003099007)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OunG1D3GyHYL23rM69N5mKnhtCzRI0KbvxbIkta16IYh0FMV4qJ+ZBqJQ3+n?=
 =?us-ascii?Q?IJGz225jaoLxeWs3Wwuo4Xolesvoit0wi0HpUEJqfuBG63zCNEipL+L+YlQd?=
 =?us-ascii?Q?ifVHMj67V0NKSUFar1YsqT2VGxUbs6jKhiMNW2zxaTnLZOScX6yY6sD41mAg?=
 =?us-ascii?Q?OQRYU4HxkGfMyJMiThNazHOn+DSO859py1mJLHvN1sEw8GI1YHmYwL6KPSIB?=
 =?us-ascii?Q?lhEz8Z4J3UQJeojZrHpJzhvxuaAn0Xgc6FKiJXlPBFhIn4dqWBhAIthLuDNf?=
 =?us-ascii?Q?E/VjpFr//lr9i36scFuHczl1Ar6+yEZeULVjnHgoWkzXDUpto0YRgh1qwQnw?=
 =?us-ascii?Q?PLZNrsVr7HdMSlAkJ53TwVzg7ctjVd2uj6bYxe3hnJvd45vnwydeeks74VjH?=
 =?us-ascii?Q?ssX2qmsSyCVU6ZBVhRznMFnNJ4ytk9AfSLjih+1/9BT83O8rDnbi6eSEBzGw?=
 =?us-ascii?Q?9IYackjdaHCkoOaUzevjCMYidXxztr/b7hJTdRvCJlrBQtNYFd/wlDhL1nAe?=
 =?us-ascii?Q?gR3lRaUhh0vortLzuYxuHP/9I3dFd7qZWxActL8mSCXZLGwiW2chgIMbhemu?=
 =?us-ascii?Q?ZVJEvhBImbYi+fa3HUK5sPGIZCQzeGQzVNrAYi9ior8BQ4SR/0/zsaW3c2ci?=
 =?us-ascii?Q?9hPm5GZAwb1z4+gNOJXqnAznOs5e5di3QW/uGI+ORFcuM/XAnOYJYQLffBrB?=
 =?us-ascii?Q?hZmNtzteo2QtydLeRenYarUdXOPmHetKVA2aSc19kDepl7B0NQeCWVFjfyoI?=
 =?us-ascii?Q?RC95vZWqH7A7oFejPv+nemcqMnM8j7m6RJDs2urWMssZrmbZH4itk/gvDxef?=
 =?us-ascii?Q?qdjGuMjL2SDQTGjQ6hCTuInydrfqQREltVhm7TL7l0uQhfUP9KHE3ALu/0R6?=
 =?us-ascii?Q?qwbv7ATGeKVLLdz3u39NjF5WxLcQnD5iprfAO3rQfdwnG3eBJqlW+KPyggNA?=
 =?us-ascii?Q?dWRUG2pOkqEQI8oMXFYWgDugXokEVgLVYBrAE28rAGpj2b1ztowzDhlqjh7Z?=
 =?us-ascii?Q?KAzICMKg9Ev07tbJW1djPvumvbLIi8ryqapWukxu4IcxoGce/+NEmNcP7UsW?=
 =?us-ascii?Q?SykihBr/nEP0IsMOqgOP0wyFSbRIJnrn0MNCrFZwGALJk21jDVgEx+f4Xt9d?=
 =?us-ascii?Q?SvFKXdkTU2OQju9MiWnpAhaIup1tWjKrgerPi/y+6seKBkexDPrFBfBGBNdW?=
 =?us-ascii?Q?fkMCE7xO32Q1rViTGYnvef6lTHYKZzZKhP88RNX3J6InZnybDyM0VC//icSg?=
 =?us-ascii?Q?z5HBSe1DHzbaXMQB97VO3phlKPrZ7imAPWTM5IdZSmIQ+lsu7HRrNc3vaaeG?=
 =?us-ascii?Q?KqpZw+PAjMBuU8MfmB5lCxYpqbhQhLz6yDR0XjP9WCluIzi3KkybIcHc+pET?=
 =?us-ascii?Q?ZnWXVFpsrMBywZC2EPgk393sAYgb/dciCp9O/MeAwQ0v2TEwETY6Ac4qAgGM?=
 =?us-ascii?Q?0gRNWoqA70sGjZ0XsGL5obk/XcvVAhQFzpwbvVx4i0fUIUAc61/4tvqYvTkv?=
 =?us-ascii?Q?jT8K5QtKdxM+YdTFE61itmUgZIrmQ476LL8jeq8LYYlB8/4g5IJXuKiVfCKJ?=
 =?us-ascii?Q?Mdeq/dQhV+GDB/q69r/NKOvDFTHkcIFkfZlcFSzpm6lFAqGtF1GfeYAXT/Kq?=
 =?us-ascii?Q?Q1g/mqmU38ZU2qKw2C1AFJub0/jMvB7j2Ar1tfxlK38e+fmcQmvTlO5H+VXS?=
 =?us-ascii?Q?fGGCazFnJbeDR0bDfVrrMpAPHK7nFgJtfnCF/dBc2s1qKj2S974eu49FaV/d?=
 =?us-ascii?Q?psABQ6EPMQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c7596746-1641-4bae-2744-08deff625a6f
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 08:58:22.4003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ein32dNjVTzEDrtxQl+jhCOFiNklefulvsxhsQlNTUeYy9wjdf6GVnRoynQa5FVWgxuMuPofKAtqFmPMfq8Gcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3686
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 08:58:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243905

Backport patch [1] referenced in [2]. The difference in upstream and the ba=
ckport
is skipping of intermediate patch [3] which essentially just aliases
`session->internals.handshake_recv_buffer -> recv_buf'.

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-33846

[1] https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69d793735b7df=
3d383d1ff78
[2] https://security-tracker.debian.org/tracker/CVE-2026-33846
[3] https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd4bb=
1bf4cbd1fc0

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
---
v1: https://lists.openembedded.org/g/openembedded-core/message/243866
v1 -> v2:
	- Fix patchtest subject line format issue.
 .../gnutls/gnutls/CVE-2026-33846.patch        | 66 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch b/meta=
/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
new file mode 100644
index 0000000000..81c928c872
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
@@ -0,0 +1,66 @@
+From f83c50305b4186075aeea26c7d8d64fdad95f381 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Fri, 17 Apr 2026 18:21:36 +0200
+Subject: [PATCH] buffers: add more checks to DTLS reassembly
+
+Previously, gnutls didn't check that DTLS fragments claimed
+a consistent message_length value.
+Additionally, a crucial array size check was missing,
+enabling an attacker to cause a heap overwrite.
+The updated version rejects fragments with mismatching length
+and adds a missing boundary check.
+
+Reported-by: Haruto Kimura (Stella)
+Reported-by: Oscar Reparaz
+Reported-by: Zou Dikai
+Fixes: #1816
+Fixes: #1838
+Fixes: #1839
+Fixes: CVE-2026-33846
+Fixes: GNUTLS-SA-2026-04-29-1
+CVSS: 7.4 High CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:H/A:H
+CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+CVE: CVE-2026-33846
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/65ab3=
3fa54e34fba69d793735b7df3d383d1ff78]
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ lib/buffers.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index 672380b05..2934fd366 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -1009,6 +1009,27 @@ static int merge_handshake_packet(gnutls_session_t =
session,
+ 			&session->internals.handshake_recv_buffer[pos], hsk);
+=20
+ 	} else {
++		if (hsk->length !=3D
++			session->internals.handshake_recv_buffer[pos].length) {
++			/* inconsistent across fragments */
++			_gnutls_handshake_buffer_clear(hsk);
++			return gnutls_assert_val(
++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
++		}
++		/* start_offset + data.length <=3D hsk->length <=3D max_length */
++		if (hsk->length < hsk->start_offset + hsk->data.length) {
++			/* impossible claims, overflow requested */
++			_gnutls_handshake_buffer_clear(hsk);
++			return gnutls_assert_val(
++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
++		}
++		if (hsk->length >
++			session->internals.handshake_recv_buffer[pos].data.max_length) {
++			/* we don't have this much allocated, overflow guard */
++			_gnutls_handshake_buffer_clear(hsk);
++			return gnutls_assert_val(
++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
++		}
+ 		if (hsk->start_offset <
+ 			    session->internals.handshake_recv_buffer[pos]
+ 				    .start_offset &&
+--=20
+2.47.3
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-sup=
port/gnutls/gnutls_3.8.4.bb
index d27d2cfa74..92f302cd88 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -45,6 +45,7 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${S=
HRT_VER}/gnutls-${PV}.tar
            file://CVE-2025-14831-9.patch \
            file://CVE-2026-42009_p1.patch \
            file://CVE-2026-42009_p2.patch \
+           file://CVE-2026-33846.patch \
            "
=20
 SRC_URI[sha256sum] =3D "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44c=
dfa7f36ebc3a9b"
--=20
2.43.0


