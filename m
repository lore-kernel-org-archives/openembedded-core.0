Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E7DC55175
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 09:34:02 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39514.1785749633410458848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 02:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=StvSk3Oq;
 spf=pass (domain: est.tech, ip: 52.101.69.52, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVK6+waPff6AD6476B4sYwf/HlKyr2h6Nh05x1SGuziRnNQ0E75DRtj3V4aAJ2TQXQzgkCn2kaneXINcKYVM23ZOnBoa14YkYz9HJWJoo+vs7IhbEgS8gF063kUrspfsGd0wzSdcr3sQC68Tk6C5GtBkRorfQBFXcpxb0Uq3Ck91pSr+zICQYmKlTKBCh0a04z4jx+KpRom3fXOGHTDZiNyZxmGKM7Zzp6Mm2uKW19w+qdLx9Aqja7VE48tFiug2dyWOE5DLaUTqSoXfF9of4gnhUfNIfF/TVIoQMX5STD4VMJ0TnFxbDB2GlI5pVLG/ijqf3K+ve3rHYFVdpgYw7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlPkOiHpDnzyDSaMCEpaB1txhQxJWFcOU8Px2FjEWvE=;
 b=Jb9vcfIBI0cYGObVUYGBMunJYTVo+8aMy95u+C1BjKX3mSoBvaOFUcsRHTp9aA8UirekZqCbNnbNqY/cZQ60Qedm2mrcjxUnI0wHNO3rdgvMB+xEufvlPbKsKonzX4Ucg/poTIbubzpb997RJ1TPCIwWkvR+5u4j7YWWXhS1J99k2Ow3pGgTh6MFQdJbRDDULHP4ZWyPSniyLJ/xbRR+Mas5qp886zFX8apTIFRBT0Qh8Qp9CJnAUs7Q3FYdiaGrMhLCbWwdbiGDs6X41+CEnosI1Q7OB82K68X/ch1DlhoK7s89YcAvI++SOWEewKAuftqsPj/PbzXLClO935QSIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlPkOiHpDnzyDSaMCEpaB1txhQxJWFcOU8Px2FjEWvE=;
 b=StvSk3OqDU8hnqPTxhAQrT6DWkbxvwjBUeNXnn7TyCBAIn1VXa+64J9yZAhS40/I6oIULsI0922NtWhzjOR9iG4hp0p9ySFO50+Fb/sZRIZ0AL9NYJnJLeSCekfhyTGPb5MKGrmMlhjZcDE/1XJR3VvWjkYHlp38Vt+KhPXnMpVziB4OPGr5RAPMva0ERpACBDRvI+SOTbLXtB5qtg2DBUvrN2cpRXbOMj1jz3g1hCS7NTzgX0Jt0h2tZBVpFVkqcHMlYyjSYzBQjBnKzyXd2K/97uSYSp0CAFh5QYQ78j6025QfsDvrAYJ44/ckGTML2kOVI0u4vS25LJJP9xw52w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DU7PPF7990FD873.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 09:33:48 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 09:33:48 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] libpng: ptest: disable for riscv64 due to timeout
Date: Mon,  3 Aug 2026 11:33:44 +0200
Message-ID: <20260803093344.15211-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P251CA0012.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::18) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|DU7PPF7990FD873:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ad123b0-8abf-46b5-79c0-08def1425240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|56012099006|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	NJSV9LI+iWyzVAe/lRrVqk0te0fFg7lcvG9RPxcGdm4XPjXlh9xcgcxOXiMtdlOdSZjekX4FR3DuRwHkmSCilC8DH1RjmDVHa/mRDGWMwbVhFA98xro0LrInfwojMQ/X/mSVDqsnbmMqzTfJ+6sb+Fd9ZzQJ0I4ceSQZ+yLcsiD25LKcX4AiSfVVtgKYhv9bByOy9+PoJj2F2qH8/33ig8fb7s9E9Zj7cbH3FkF09za+kOfuz2VTxU3Z7dA7xup7GsGUbmeRI6KQGQnpWtCqrzsHw72uDNiTXcgVWYfpKEdB+8BJZypnxmR6bLJiYnIVsCcOUxDh06jV4wCeZMZWaSOnnStSM4zizAiGTUBhfXp4Y6P+qmAlgFcbnVZgN65ulherQcTIuZAfWtHSyWu3fIA9b2Wrk/zGU8LB2eIrrtdnLvUdTEpO8KTy2M8UdMZgDR1GoT+w0YJ33vMZbIFBKRXR47ewMU+UQcDdNDalX/UUbs/GcRyXowGfuQIiwUNKEe+MUmwQahbR2859mucW9QuFK9ZMSHqr0VF+vP9vslWVwu6+GhgBiqaoSrjHcLtBK+nhoUZkYqu9JzzWBddAR4gRLNV9jRxgEI2dRIwXwQs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VL/9aCi3lvjoExib1pQtJM/VhFPVFoNjH0ThFpWretuYtUn5XVpztwI8FPkC?=
 =?us-ascii?Q?l5ORkjEew/o0DaO+hkW0ctJW4FE5ADOBeFObJtQF+3cGTkPmpHmpuHmO6R5b?=
 =?us-ascii?Q?MlzM/CYljCLG6uwSg+UVReQjVlezn+psFtl74k7C3sFwE20gYucXl68CpgP3?=
 =?us-ascii?Q?FIJj8BFKVwmZvgF1QWOVpFqRRTM4BU4BjrTBxHSb+1RU755UDexAR/fVLMiY?=
 =?us-ascii?Q?aceDyRcSSuEnWvm73gSB+GlSVqGp0syg0cxh8yW7iR6CnJaEV4EgijUHEHrI?=
 =?us-ascii?Q?8FU8cmBUH7IzkdFXGojrL5V2jQyB1bnhQ5ccux/A7ooUfU1hb5jTGoLgFJME?=
 =?us-ascii?Q?4IRgza29HLW4CsUlRijC/jnMY15Tjz+BEcnpsXarDoIoAoozflZheerHNhOf?=
 =?us-ascii?Q?n7+S2+skM8Iv+c4qtpuKGqK1rmYoRm086ft9p7cQkZU8gD9ZtEPfYf5TRawC?=
 =?us-ascii?Q?Gng3oyw2XIYKQ6ot+wqzKnNKXcVJ97DOiz3z/JFycJZK+9QQF13+Yd/phL7/?=
 =?us-ascii?Q?tSDsLGC7oNyhvfLoLYH02IjaprNzdEzxQ4CylNA/S4BKgqnXqeSzBG4hSJv4?=
 =?us-ascii?Q?C4mmtcqrMN4EUOcRImh5Ux69Ke5bz9VnqwQsk4bnCJnzDGsJ3rdAM+SCOwc1?=
 =?us-ascii?Q?n44tIIZP4y7YEp/3KIqbMOWNmyTu1DcDHrKCFMl/M9gGU4XuZActeXcyVqOX?=
 =?us-ascii?Q?aqm/fPee5NtBsKhGnjk4tZUoTl3VeojdOn24sPDl3+/FkFNq+6a4YAA0/A5L?=
 =?us-ascii?Q?6bv+5P/JJYg9qcJ+p1ajbHXPJzMKqJvE90iiUZjBhNjBdwTmz7QENWaEgMvH?=
 =?us-ascii?Q?DTDQ/R9F7GD9N1M0XqqHCoG8i4lzHiFiU745wWHZi3ZH2ZwhbYcJ8OwCGJR8?=
 =?us-ascii?Q?m11u2FCO8y/Co8s6/QfbkKZKegu6Fkkd2xBrRr5e70gp3uP88ppbrHF9figV?=
 =?us-ascii?Q?XtLI/aB8LjmHowxDg0fi1SlXsj+KjIVfO5cBoK14ivd38vugDUpCb4Q7LX7B?=
 =?us-ascii?Q?OqNucDKYZOLmCcm0jTz2/HLjkureT5S3gdSjJC2jVGbGqe+yv6i1SgRf1Vad?=
 =?us-ascii?Q?XBB46xKgVrEAkDo2YPNssUyI4hoJpOGLqA3BOjUAsHz7rSQ3ZM/ckDLL6zge?=
 =?us-ascii?Q?YW2lONnl539ufynVYuyQGv0RM6In2h0U5z9rtjBE4AQd0wSctnCjH1OnWbK/?=
 =?us-ascii?Q?21M0o0Axz5IjePLD15B0f5W0hqvh1khhuF5UafwG+aH3Y++qHtyw6EL7fV+n?=
 =?us-ascii?Q?Kol4iogns98XHTLsDbL+Q4mI8rlMSgiXupxlhlR5LKt74LkctFUshncSXewU?=
 =?us-ascii?Q?sV7lLVcDcITI/P+1vAsJdHSBKAYiRLzj2fhdKVcy3uHkZtlSZKf/V0g8G3if?=
 =?us-ascii?Q?GZE+MaqfP8K4YgLtZhGIuV7QXW/oFCxqrvySaytgjkQXYqsVpBy+8VbFJQCe?=
 =?us-ascii?Q?H98m1xtXOh8OE+pW0Zdz5cMrBIOFHlPzo+BD7IXo/7w/7eclSGYElRqnrHd+?=
 =?us-ascii?Q?JiT+vrxOKT5duSKjXdVsHLLaF/0b3uShZFo1b7tVE1YjCDPGNi25HJ9+vk7W?=
 =?us-ascii?Q?/hGFznir71Gs6p56jJJO6djEf6CQ8ApKOiUVMFS9O4NNALdJj1fasakVNCUO?=
 =?us-ascii?Q?wPEOwYkq94XXVmuDDW1yoAsSimhFEwJHoEyE8B6+wEkTPJ+063WE+4QVmLCT?=
 =?us-ascii?Q?rM+Pa9ehmcn+oKiBo76+eDLu6gCVXC/1zAvQeRG+g2N4kF6RXStRQCfLe0tF?=
 =?us-ascii?Q?tJaARJ//hA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad123b0-8abf-46b5-79c0-08def1425240
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 09:33:48.3972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PY2eKg9EKo2xEeNQnMhwzX7bYG6PZFHL9RM0whcId/NpdTdgTU6dTZYIflrTkFLVmf0MJlR9lLFvBNgwQg+SFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPF7990FD873
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 09:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242643

The libpng ptest suite consistently times out on qemuriscv64 due to
the emulated target being too slow to complete all tests within the
ptest-runner timeout. All individual tests pass but the full suite
does not finish in time.

[YOCTO #16215] : https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16215

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/conf/distro/include/ptest-packagelists.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 453fb87c17..ffeb322bf2 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -160,8 +160,8 @@ PTESTS_PROBLEMS:append:riscv32 =3D " lttng-tools strace=
"
 PTESTS_SLOW:append:libc-musl =3D " libc-test"
=20
 # These tests don't yet pass for riscv64
-PTESTS_SLOW:remove:riscv64 =3D "tcl tcl8 python3-cffi strace lttng-tools p=
ython3-numpy perl glib-2.0"
-PTESTS_PROBLEMS:append:riscv64 =3D " tcl tcl8 python3-cffi strace lttng-to=
ols python3-numpy perl glib-2.0"
+PTESTS_SLOW:remove:riscv64 =3D "tcl tcl8 python3-cffi strace lttng-tools p=
ython3-numpy perl glib-2.0 libpng"
+PTESTS_PROBLEMS:append:riscv64 =3D " tcl tcl8 python3-cffi strace lttng-to=
ols python3-numpy perl glib-2.0 libpng"
=20
 # These tests don't yet pass for musl qemuarm64
 PTESTS_SLOW:remove:libc-musl:qemuarm64 =3D "strace perl gnutls glib-2.0"
--=20
2.34.1


