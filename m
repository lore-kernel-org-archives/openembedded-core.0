Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 260F910D1486
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 21:19:29 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19072.1774732742711212680
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Mar 2026 14:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=hrGLBmIo;
 spf=pass (domain: navimatix.de, ip: 52.101.65.89, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+tjpnZ9JPNm35YiP7I/V+WINqlFnr6+hkwnPVtVbhZSjzY/76dhmoK4l3lYnKUTxgfHbTFtT3Dgv7J72yys1bUKEIn4y4YAoFfXzKNX4WvwMYoBxnynU1j2UTz25qx4OQqkARrKay3NpMPVUUzX6nn7XwDHFBdBtEaiYF+8IdwjRF51MD3MaiBCDKqKGGjcpwn5x7rFySABP0jap4O49WUFNeYc6oye3XlOSH4HcMZmpfbhrJ5nWtJ8ttBQ6qCF43ogLvoGLcU/9rpfLENIGjN3JsymvQuBfrqs0sNAIsB3Q0NdlSK3kul/iPkeMOp7Vhja11Q9aC3Db3xgIM5V9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awEbZVtxSHSHa4HotigH0+PsGRKfz08isBZgzZqLlwk=;
 b=xXuo86EaHxHlvvNqJyJMhM2ybKSI2tQq5bfsHrwU0O8JL6Mut2UHpmo6DSaQeL4TkZvQrd073X/WP7G8Qz5nHiD/Cl7VREJ0tkFSWw4KKZrmCswegRVoiE16ESUQtbwKZEtgWwz5ZkXzILmt7HZ/NJhA7PiOxNIB+oEwnrqPCs2SNU3JxCwmp3Ndm+NgDUE0yXvcj35gymx7rsJGHSCvqe/1WAee7CZLJKjmdFDPzF38ionf9WrIjM4JVrJojmjCgnVYl7JHXOC3zIwhxgDrO44upfxTWi4Ka6kVqTeyQGes/vYgswuvPTYZXVgxvP73qQRY3vUK+cYma9I3PWwyZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awEbZVtxSHSHa4HotigH0+PsGRKfz08isBZgzZqLlwk=;
 b=hrGLBmIoziQbNHsgk8Sxj8ecl9FebTi08sf+UuoHgGl+jfKtDcqYBs6JdQDluNMBztVOBg0wNk9TD5gtewkZqIAiNbMWPz0U+JV25Yp9+rV0gdL17ulH4bFLbC2/bTmuuI7RjlQH4KMRXjicL9x3P8Ui/MS5paJDOFNRyYaPgE0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PA4PR01MB9092.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:2ac::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.24; Sat, 28 Mar
 2026 21:18:58 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9745.023; Sat, 28 Mar 2026 21:18:58 +0000
Date: Sat, 28 Mar 2026 22:18:57 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v3] rpcbind: Remove IPv6 listener, if ipv6 not in
 DISTRO_FEATURES
Message-ID: <8fd16c27a498c242062a5d9bd4ed38bb27aaa0c3.1774732736.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <2f6d1b8f-43e2-4fa4-ba2d-ef3fb77583a3@gmail.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2f6d1b8f-43e2-4fa4-ba2d-ef3fb77583a3@gmail.com>
X-ClientProxiedBy: BE0P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::27) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PA4PR01MB9092:EE_
X-MS-Office365-Filtering-Correlation-Id: bd00ef18-100e-44bd-5184-08de8d0fa037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Gjre0SfFOB9iEzXmu1AlhVL2PKfmMSIonfynvaYAlwvTodzVkXKyPhhrtE5nFlPFLN7/4AZz0vuCiubiWuD2/EHCfuA4d9xBUecRYTrwiRzz1FviiTdPtn/pxrFfj9NXcVSViJHglsa6lxFa2fijfaZmpa7TxYlIuPgEJ8dsLQQUcXCk0yJdF++ttlRlrsQk+HxHz7U5UljS5IkESYcHtdl40sijP/MLVm9l/Pq594MpG48zP/WzBbiQvBK1qrmSR5KQIRE0meei7ujpKnj/+6WJNsL8e4Au3QJLPld1BirjdZfvPn4jtvPJnXLHH+PDEnbtIjx6EGnRpXBmoxdUpH21IGX4URE9nGF5R3KZIdhOTuJXI8oGh205JMXfhPdZii8O8DoSKUTysAL/4gOzS5PJz+XGjfqMaXkZwGqppGgYEA4wz5w4Mv6N/nazLc1+i1nnWnLbAepG3+DLq9CNyy0Vofsp/bPjPm71+IrCVTGnZGQIuojW5zaQaHwGE+mcjYDcUYQCXR0+i+/dvv8rKcGB2eiJY1TZXvUSYsWdfuBOrpXfBW6qTuvZGjxKiYxfCDFmI7lVmCFDtozKu1WXfqj2FYRYzIJjSUQ9rztw/fISmLxM5mQiwQ7TUOTBO+D7Q94HEr1XJzE04DMqSxB/ZTV9tfn2rOK4sAJ7XAqSarwECdGhBG5cwDCbkofdCmVb/dYXlIlNCUDLgu/Ceuh8VQTzJnHpLUq43ugz0YlhUDk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?inEZEy96blo3OycKQaFnWdkmOne6E3yLxC4PobKjaqzeAcDu5Wr0o6VAZGK8?=
 =?us-ascii?Q?psMKq38tm27KEPjsUnUM/2CVwHMQVGtmlgE1qVL43m401oN3OoLkE/kh2ixU?=
 =?us-ascii?Q?iou08ce5InimLR6B5++bdjYV/QCe6uW+fegWw1TYK76JSivnUeJtXvRfW4GI?=
 =?us-ascii?Q?4fNBvGYtgkKcVDl0DAehGIgYFNC39VMpiQafDnn1/fv6vC8HB3sWPRHi9k/n?=
 =?us-ascii?Q?XDnsjzsy4yczxVU/ziRwEF8OxWtfIWZ2c+2q2OZQ3IBC4WhSHvRif8Iva/49?=
 =?us-ascii?Q?6+KdX4SNk6XlXQX9Jn7KZkqdrBYNdAcDbisgTby512SSlEUanbA5ZfQezANg?=
 =?us-ascii?Q?KN67sGZnWSpe3wSqPaP33FF20M4+lPt6uxaZF9IZ4UtA2/Gh1oxu1sFsfhwn?=
 =?us-ascii?Q?JvvH5GT69Ey/xOAmxKLI9vvSgpMuAlYcD5CmZXaa0TrP0r2gjuxaFD7t8/tO?=
 =?us-ascii?Q?rx7ML9srtvSicyp/zZQz8l4kt7F4kibDNtSMgEoxFuWJ2KI9O1ZpPx84fEyF?=
 =?us-ascii?Q?1tMPLyzvlRYbnHdvWmKP1lGU4etke8VbM66cfQB13iTdvXugIVjRGs7eKjlt?=
 =?us-ascii?Q?pm+hGp1F7sjyP/DyzxSyx+8sBHG5YBUq3oW+iqggixVdfQGRb5S+wYv0IhP+?=
 =?us-ascii?Q?+MFyAN6T8aajRh9iYG4qsT3x/RbeDImrq03V3e99JkJNLhqCS/DJY3ZtzRoN?=
 =?us-ascii?Q?PtYd+GuvmmjO5UAvYqMtcofvtNmxkFpIiEgf7+Gy9dBQbCU8frJa8qNYLDmN?=
 =?us-ascii?Q?OhhN4Eg/dijDUWNg34jezjONTXtT4FdjIC0c4JFlR546TuEjnwaf9+MMvQTr?=
 =?us-ascii?Q?B7SsNecujR0esmhvUr5nm9TBbNeFMaANo6QCpAXXB2H6srFnJt59n4wXoyWC?=
 =?us-ascii?Q?WVGcB3PfjXMaRp/1Kr/LfKQT6HLUSrh82H3bAdCiIo7msUgljhNji0kjGumE?=
 =?us-ascii?Q?42M9hwBB2tSsqyZnnAWyPEM9v8zBJW1Zb/wsNbYCRpDCmi6rk9uV1wSzVrOi?=
 =?us-ascii?Q?Y0noDCRR6GnwNqlHlJI04gmHf+RuyjijgbmILfYPiVgb3/tpAvfqMglQJGfK?=
 =?us-ascii?Q?kh8UChBoy3tMgFuhW01YGaY3qkDwi7J/QgQ9FJxwdLJEOYE/llaz1EmpuaXH?=
 =?us-ascii?Q?6tDElT9YoUDq2hGUbfsyk7E7fgDTEPP+4M6rvtDR55nTvPF6YGnxUT8Kkxm3?=
 =?us-ascii?Q?RMdpiYIlvYsziDz93oBdiBukt531yQ35p7ka/7fdyNjaZkuHopwcwqAuG1KX?=
 =?us-ascii?Q?tz58o2xEvefMv9PwF5fX/B2jENucduO37yDpqQnE9W2I/u3cOLiMYW73koA6?=
 =?us-ascii?Q?qM9A7TPq3R3lDMpQJIZDRgQjLEpcccrEkpihdJRPgS4zvfQwvSrB6d2GWYrd?=
 =?us-ascii?Q?lo8uyl8PEGPjePt9TdYlb9/op3YSUWTrfsywKnpQmSWOvl3c2viYO1i5uAxD?=
 =?us-ascii?Q?mHUe9ovLHebRy54T8cCpdvqeztx75wk25RTrnwVwHRjXHlYNYyn7d5IAC51b?=
 =?us-ascii?Q?gPdzoFOYaeilJd0CfJWanYZu0n2fqa4cv5uaH4y9031TeL2b5Q11r/d3yrs2?=
 =?us-ascii?Q?kbkszLeHbWDYcqcpes0aSGRbpOnzNuNnFASKXR7ZL/K8IdZdjUM/I0uJP6By?=
 =?us-ascii?Q?GoM4yhWX/hJ/Gu0CGCAx/6Q7H3SYSYtfQaJNosGI2UkgBP7eSA4h5jWiHV/F?=
 =?us-ascii?Q?49KlL44osZyC61NXLZ1KZ/FlrPfzPR0e0QWGgl7SjStHjwOgQ/2bt8N4HvZP?=
 =?us-ascii?Q?vNfqIINAaEsHcUS53BtXK5SRr7bSMFU=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bd00ef18-100e-44bd-5184-08de8d0fa037
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2026 21:18:58.6508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9PCyA4RVuWm5f2T4gkWMTxaYbxUE23jWf6MaMjodyeA4kPfrMv5PPrS05axSaCir65I2IfgxYyFaR0mPalUnUgHobreNsLYH5s81sumQk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR01MB9092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 21:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234136

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Remove in all systemd socket files all Listen on IPv6 addresses, if IPv6 is
not available. Otherwise systemd warns about "Binding to IPv6 address not
available since kernel does not support IPv6."

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb b/meta/recipes-=
extended/rpcbind/rpcbind_1.2.8.bb
index bcdadf4f10..bd8ba1e88a 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
@@ -54,6 +54,11 @@ do_install:append () {
=20
 	install -d ${D}${systemd_system_unitdir}/rpcbind.service.d
 	install -m 0644 ${UNPACKDIR}/rpcbind.systemd ${D}${systemd_system_unitdir=
}/rpcbind.service.d/rpcbind.conf
+
+	if ! ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'true', 'false', d)}
+	then
+		sed -i '/^Listen.*=3D\[.*\]/s/^/# /' ${D}${systemd_system_unitdir}/*.soc=
ket
+	fi
 }
=20
 FILES:${PN} +=3D "${systemd_system_unitdir}/rpcbind.service.d/rpcbind.conf=
"
--=20
2.53.0


