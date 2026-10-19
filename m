Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DF1CCF2D6
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 12:26:02 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31973.1792408614949799617
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 04:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=jTSKNsjS;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.32, mailfrom: upstream_ip-dr@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmrZKTvmBZQ/vfKtgQr9rWGSA2gGsyLsC8wly8Ld06seV0TDQZv0HgYzxz9PF/L6LX2vV+ZCR7YQnv2zMHNCkBIiHioa4FxJTiLKdAVLFUDyKbEiFI6MJ6fWv7DcoEVXI0OFEzYXMRK/rHwTqFxwa5jXlDs0kMtQse/tP+a9LV8vGSZ15IV+cw34w57OZ4ZIomM8UC+ZxAWgtjkfh765oIwfeJClYaA/nmD2bvOalDDbw3zyJ4PS+83FGIwGUtXYtBeyhG7OovulvrowLIcJuQSLuJNUeL8iZ4+32VWRkymTjrYLBlT1TLQtJi9eUJLyyAdAF7bU+2O6yRMIjT7xlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbUf3kYyadoQDnG7VJP2jl4mZPWBLcsvG/FER3BOVj8=;
 b=eN9hrQLQGs3uKfmP5PaJgKlnuXzs+uSlD7e9ICMcTPRb8LcSbbXCUw7NZ3fyG5Nd6EGLOzoRRX8D6rJAuvzxY6qZrcVv7szIbVeYXaW8rcneR9uaXM6Qogcoe4vr6LsEqWOOxVb7ZGc1OqfEj1anz87Od2XCuXVY3HOQz3+D+v5WCLM1a3J6/FP3yqRFhX2rd//e6ZhyVIcgZ4LR00DauGgKJVTmzZC94fv0tylb3qc9d0cBMwCE817zZNp89PBnjjfbpUZ189CsQK/qHV1ilMG+IE6GAcmiG0HmgcCc4X6tmzyN6r8Pjy/vUWFGslWkWifCfmqujRJkhf04XoO+oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbUf3kYyadoQDnG7VJP2jl4mZPWBLcsvG/FER3BOVj8=;
 b=jTSKNsjS06Giu2dYISSoxswIHhdpaghHZ+knfAnABAaCd96Vx2L/Fm7Yqp+oswdpZfYoqLIZhB5jKEaiko+fMgAfWTxEoVRPA9j6haLnrulloNi1Pm38vYQ1ujdLJcdK1vHFcaf8I9z7cQ2d1HiTYyL7AG0MtdKrTgAchQ0nIVXWlfOe8VkqxGRrG7ACyK0H2FVQzRpXvZGBxd01L4LxJzae1TeUeHzFjtFmb3i7ThS0SIef254BbB+ufTHCV656pwhcM9KGMwf6y8HLeg7PpA8cNOomei4Uauh+IJMouncTf7PJltJkksmmOhu9iJkPrPG6nNO0TeajZjiqwRhOKg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN3P287MB0942.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:174::11)
 by PN0P287MB1188.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:17e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 11:16:46 +0000
Received: from PN3P287MB0942.INDP287.PROD.OUTLOOK.COM
 ([fe80::eeb1:7dda:69f9:40b9]) by PN3P287MB0942.INDP287.PROD.OUTLOOK.COM
 ([fe80::eeb1:7dda:69f9:40b9%3]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 11:16:46 +0000
From: Divyanshu Rathore <UpStream_IP-DR@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: Divyanshu Rathore <UpStream_IP-DR@bmwtechworks.in>,
	Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
Subject: [OE-core][PATCH] boost: add lzma and zstd PACKAGECONFIG options
Date: Mon, 19 Oct 2026 16:46:29 +0530
Message-ID: <20261019111629.144576-1-UpStream_IP-DR@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN4P287CA0100.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:278::10) To PN3P287MB0942.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:174::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB0942:EE_|PN0P287MB1188:EE_
X-MS-Office365-Filtering-Correlation-Id: 465e2bb5-6a12-4851-3fac-08df2dd2765e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|52116014|55112099003|18002099003|11063799006|10067099003|261009223027099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	PVun5I16KIZ9z0prmlCMidvfdzwbIY3K2YLeQ/AxY8U/2fz/t+tyttcmTU4+4/bAWUog+HIU6FcDqSBBXjGoboz1T8lw1XWxqkstopiSWubUbgTdzgUXlssUSqC/8vLXnq8bg2ornUzy1yOhKr5H5o5WivNpICXnq4mTT9WNJzYD2FFAPFZstSnPschGZ7Yg/JoBVPs5uAGLpZmjNTLL3os6u6ZAKu906wT6eVXs7l3D9VoF6A8TJuddXuU0OUrO2BWCQzXEBsr7oBHktrBkI9OKLJ7VhbJhfeRIYlonwX19XFvzIBPRc/C2rziKlq8drzT9oKBIYxpOaPKxceTPQl6okjxeLjKJnJXm/4O+faPiKbWCJ/8Y8f5YaRuQdl4vWPZDG++w24tFyROtECe2wQeO6QbY8jWCXuWmTZpIY92+Ep8pSvD2PssTDI3MeW1qGswmeKPrkBmBusULuVvdRwECR3jFTVBMF87g2Bw5K7xBIZ3aw5ueLtxmvTptNS4WQqJCIfLtEHzkIFC8LVc6Ka3l58DxF6d/FomZVNgDonG/bGPvQcCONZi6vB+NwS2aRNPdwUKcLbXI0bcrtu7yJFMn3NEPkdK5Nnjomp8Rt3pPGZMi9bVrB8MtWgw+kdKT8xHHppmpA0WzrAtTWNa1s/6Y9ZN5Kiw+D3onrYOui9hlWGJ+a3xDrcSUtC9HmbYdIYKFsRbTp+dGPZB7mU0aYxM62iur9n4CnJ+kV0FYB+w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB0942.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(52116014)(55112099003)(18002099003)(11063799006)(10067099003)(261009223027099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IIIsoOtOyqEyMTKzuX3kVERt2soduTTEXbqCDhn96uE5ykWzExpA0hBdSf6j?=
 =?us-ascii?Q?H4jdFX47LzLNtBDRQAFRdYflTct5O3y5maJHSjG+MLhL9rP9HVumEkqtorpC?=
 =?us-ascii?Q?lzuGNGySw80qtU9oZo01LtC55xTHBnC7vp9k3P/Tn3krv7WVYD14VbngQDgn?=
 =?us-ascii?Q?a3Xxp16LpjWZA1aicmUvM/YECdAs7x1ggpypIKjaiNEcsW3CVAINgUkdpNTN?=
 =?us-ascii?Q?XeSeI1rEI6UV8SYDIagbILl9S51jb6M1/6dVsEkMwBKtNCmX/X6qNP1afbF/?=
 =?us-ascii?Q?8ylNBuCtcIai+uLkv3VpYszIxtibAZD/0UXjQ4WN5Eh0D8+tf5w4IOCofxXV?=
 =?us-ascii?Q?bf2nSxgXqbQn/73hgUAtkZj7qaKcyEFr2qW630xUX6/fmjrLXx4eo2wBch/G?=
 =?us-ascii?Q?0x07xLkns+TaZS6spa5tJxueKn51GSc74RKIhFqjBnIIZ2vH4mf5BqbWB4vB?=
 =?us-ascii?Q?QCSDFz4wPWWwctUzUbqPzZo88hBAOKYRbSkZZpurpET5zB/or/bqHxnzjrEC?=
 =?us-ascii?Q?2U0uaUCsm8VIKwTIJULqkc1OqT0DBUwBo7hrCC2WZUYZgaNYXY/LUKjDDR3f?=
 =?us-ascii?Q?XxFadjad5DqhwGjL33G9XhephR1gngoXPYxn6EPYfK7U/cahesLofCiCzuX9?=
 =?us-ascii?Q?RB+XKDhs+sLWmTHjumbvlJu+j5zFDapTGufOMZgNxh8e6/BcxMl3C4u8RtvU?=
 =?us-ascii?Q?X5o5llsl4vdXUfTwXROUbZUcPBjwVx2UaEqpgFMDYn+17ZE9jclVN0PkYIR5?=
 =?us-ascii?Q?JaK2mRMLbZ/pKdIGk4QgUBtz+g/S3ghTnofE6lxuma8bfvUEblzj5+AlmLns?=
 =?us-ascii?Q?8J5VeMVizE2aO4mZWdizjMab7bSo9MNV5ZRnhK1q1BmEaB1PGg6ykvp20nxz?=
 =?us-ascii?Q?ToE5azRiiUR0SW6HHVXDYJs6CgEMz+acnlvcpJnWZ1hn0eC+h4IzOhjYGXNy?=
 =?us-ascii?Q?0PSP+deM9FKajziNy3sNV9BZNvTyb+3SThGmMgoZqCCxSUdfop/ZSYf/UV89?=
 =?us-ascii?Q?9AkT6yMMMkQWSkjsxGKvx6vFlUMdYzRbRiajzi7sN5mylwOXxz+XPmz3hi9Y?=
 =?us-ascii?Q?tVRHHEk2nKO+Z0K7Y+WIwxgNfzT4Cq/xWN9D3lFepA5hcGUJs7RL5NXFc8Zo?=
 =?us-ascii?Q?4kci93H+D1pb3Wv8aQS9XTw/naoYNxA4EbZ1xCypYJLw6KVAsinEY7XdOAZA?=
 =?us-ascii?Q?rDyc7jXyhlzNWNcH7B2w3txJvAFv76s7ia7TSziwPdpPnMUfBXLm1e8EylgV?=
 =?us-ascii?Q?SZ9sLUjLWdv+sDdv8GKD1oJQQy0zld7qxXdOoVi7UFSeQnVPNTKXvJizhTL/?=
 =?us-ascii?Q?ZtHRS4Zbhu3FF+H4C4CJ4iwXzMpwMdDuUJ3wOYu4kcywxdRVZPIf8D/fOoAa?=
 =?us-ascii?Q?u6VpaxxknNsRs73HH3KkTFGX+inm5kgrClFHWECUUgfQsWNU1JodAj+xaOVA?=
 =?us-ascii?Q?YJdpveXbtJeMcPejiOayC/jtQtOGdK5HuPFwlCn7U6bErICwueGMxs62GDeg?=
 =?us-ascii?Q?5COS7c0NygYTGzH28eKdRUAKvDyA3DwLxq862m5XNd5PzwBKRQRv3jbCkqLO?=
 =?us-ascii?Q?L7hkOVXUuXmXyPDFj7Iwy8Sd56sOJHXgh8wzd0j3z+zxQS0P41dCBVNfJo0n?=
 =?us-ascii?Q?gGt4LN+z+CXZf6OIVJ2tfG+9V6ys3+aqXUI3T+KdFugywyVUYYTOrZNH8MNS?=
 =?us-ascii?Q?2YiJ89OqmvFVoDR247nZZAc8obIIyc6BTjkWl+UlS406bt8GQ1EdtFTZQ0mg?=
 =?us-ascii?Q?10ari6MZ+9Bkh0nOTNQ3VU+BW6t6gJs=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 465e2bb5-6a12-4851-3fac-08df2dd2765e
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB0942.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 11:16:46.2731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jt493KdsjxaXzZg2dIY2uR7DiuNUzV6/pE6t9oDOpW0b9TRFM9Mek0kiq2wo/I63AEX8eRFAyPywXm60MKKM1iBefPqx1y2UGTT1oi0zkj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1188
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 12:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248162

Add optional LZMA and Zstandard support to Boost.Iostreams for
applications to read and write .xz and .zst compressed data.
Keeping them optional lets distributions enable interoperability with those=
 widely used
compression formats without adding the dependencies to all Boost builds.

Add optional PACKAGECONFIG entries for xz and zstd so Boost.Iostreams
can be built with support for LZMA and Zstandard compressed streams.

Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
---
 meta/recipes-support/boost/boost.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/bo=
ost/boost.inc
index c34b9c3e3e..ddb4b287ee 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -56,6 +56,8 @@ PACKAGECONFIG[graph_parallel] =3D ",,,boost-mpi mpich"
 PACKAGECONFIG[mpi] =3D ",,mpich"
 PACKAGECONFIG[numpy] =3D ",,python3-numpy"
 PACKAGECONFIG[python] =3D ",,python3"
+PACKAGECONFIG[lzma] =3D ",,xz"
+PACKAGECONFIG[zstd] =3D ",,zstd"
=20
 inherit python3-dir
 PYTHON_ROOT =3D "${STAGING_DIR_HOST}/${prefix}"
--=20
2.43.0


