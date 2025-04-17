Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50C1C369D0
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 18:10:39 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.38])
 by mx.groups.io with SMTP id smtpd.web10.15641.1744913437384471952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 11:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=lhrVFP7c;
 spf=pass (domain: oss.nxp.com, ip: 52.101.69.38, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLAneYcOavqkFYvu4WqmphvrZtgWDnPpV6tKaleb8zd9qUjCaMoJ8MGgJD5L9xatWkH6XEZ8fqaM/ysmn2uzDkfdQe42f5VIlcfvduXNhC5JVf6Nu1unEnKPYNuLP8LTYeglIqYDpP85kBnw6sPogwqZ7Kt4RxNbF78usJoiO0gEzRasv34i8Uj6pIXKehluv1zMHXlkUbk7y0FjjKd9rND/vFFvZXustw2bdzomc22ZHw9s6ywx2wqLevyHtzdhNkGvySfWiXdDbxIC3xsWC+fXt13mTrNWnv/jMxZqOr7hcilOQwG17a1L+rJt+dtL0urJvVyk8ZNXn/yJ7rBzLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hQxDPXMdyohguQtfrBSYvE2IatOHvZM/NeZPjktybY=;
 b=rWwtfJ/EfW79R6dHJC1kudTW7x8ZmOdh3CEhoVUQXNVYKZb2LmzDE66j7rEuIDQoQ38e0JzVMsKUIYkp0XOLwqANkQbP4kUJw07iGNx+GhhLg7WYwIRHspQvMQka7pds11J+dMjHAqzBDBtRz6s7eT5jpE1rDX3As3DBlEPeMmXRQVl6uNTNiQu5Tm+UDfcGb7AsXnFsF0L1NofmIBvb9D5fcFIviYYtUBOp+nlsIwCz0cNHVnfftF4whgJOrkY3CtBxRMq4J7Yujd9vXDYe5yDUb1Ui7Ecm00J2vBg1HYDXPtlouar+1S8myBBMJWuiLbZb2vbmVgMhbfqwOaBjtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hQxDPXMdyohguQtfrBSYvE2IatOHvZM/NeZPjktybY=;
 b=lhrVFP7cSgnWrE+a4dv+KwOzJaX1Xz7E/nFPo96CivDy1DlX/kBjnlbrnMu2N3RXmjLNccAkYCElikEss/Za2pBSthTxH2AvaotdilEq29Lnsc4TjWC8xgMS4KX5hfZMNg6jgfp8b6wFVK/tQuEo8F9FA+DV/0POZxUwXFKnZts2Hm7ujxn3Km998RlxSyQPG1Cyno6AEQXD3pIcqAKU2kFkApl9/Njs+kLrz2ufueLVxYdtLlZJj0XR+DgfLUSKMQSKrZnrvDCBGyCrn1rEv+6Jx0OSPNHEvceD93dFKbD1HQyKri7G0fOL1mb2Vif0MBtiehy4pa4uoND5mvLBZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DB9PR04MB9497.eurprd04.prod.outlook.com (2603:10a6:10:373::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 18:10:33 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 18:10:33 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v7 6/7] oeqa/sdk/meson: Skip test when SDK arch != build machine arch
Date: Thu, 17 Apr 2025 13:08:33 -0500
Message-ID: <20250417180834.1722588-6-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417180834.1722588-1-tom.hochstein@oss.nxp.com>
References: <20250417180834.1722588-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0147.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::21) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DB9PR04MB9497:EE_
X-MS-Office365-Filtering-Correlation-Id: 7efb348a-20bf-40b2-a96c-08dd7ddb2570
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PLyajPlubRb4eEWhc+jhCcLWUgHd5K2CyjGHC19EnqfC0Xf/fj4OQ+LEcL53?=
 =?us-ascii?Q?CQc22qRHifRkp2JkFrP2B42lu7qkUmzzB2ko7+gXAL9yJ7Nlw+CGVrD0P7RM?=
 =?us-ascii?Q?e9MwYigTnLfrSOD4H584nHkqofNuNmYjevJaQRe+gJ/um3W3nPh71rtgNOgV?=
 =?us-ascii?Q?8JjhlgW22iWjDLg2oM2/VVYV+QQBqAH5lI4eWXCK96LZv1G4PrzHmO702/27?=
 =?us-ascii?Q?+YSGV8inDJbv+q6AdqGKFXSsmtoNybpaqzdVBirjgJBCKAk3uKi+6J9+HWP1?=
 =?us-ascii?Q?aQ0mlzuBzSxxWhNl/xb8Ss3tK8/qcU+u+QvJlYadQOZP+wLYggg0jiSIwXAb?=
 =?us-ascii?Q?ePSpAwnHKiMUd2HJbFWsqBAjeZBAiQoXz/FriIegs5Tksk903AF59uecIeXY?=
 =?us-ascii?Q?xJ6w5eez+fpg2ntRBzjyf2885WB063qZqMIVp/41VTUwhJuBCSYu4KhNsh19?=
 =?us-ascii?Q?gN4PQIWcUkhgr62d/rdu+j68txyCcGpzpOdr5NCnHBX/GFSxxusCJWsrfRjC?=
 =?us-ascii?Q?PsXkZc0qRNg6MgHF3gRiocc2XHX4wDIqz0nEUCDrZHFSaVvp1OQI9fUu9kMA?=
 =?us-ascii?Q?3MvRE+UyPq7t2OBL+dAJK1zbyR1+XkJx6u6ZI0DwSl8D5PjreNw6qPmWyMeN?=
 =?us-ascii?Q?RqM9TwD8hLmKD4NyOaLxIe1iKmG8Xk97s5d5/1If5GP7Tb6X3PBTFOXkb06f?=
 =?us-ascii?Q?QMf8Q0nA8KLucT2069UgkVi0MNyhQHHqDimDE6RGeaZV6w+Sp7W32ttOvZMx?=
 =?us-ascii?Q?T31Q/Md3mKfMldShn1Ukt6/oBSti2iv1B6PyEGWIWFpAMCtoCyyqGtKzG3Qm?=
 =?us-ascii?Q?/Jz5cFz3RUQoMKe0NBCZurrKRygFQ/tSR2eNuYLJI/OthD9qJ00rtk8vZ/Yn?=
 =?us-ascii?Q?Cd89rrulxOzRGal3rzcCP+C8T6p5et0JTA5vasSf+7T78bgYPeQBCreVZ08w?=
 =?us-ascii?Q?P1zOCZ30FGt3jU0odEQZrQ9Dx0hP8rNXHfpAd78eAEeMK0yGhkfpZAWRcLYJ?=
 =?us-ascii?Q?n/VHGBSxB9ZmMFCm8iWgk29rgivcqQyB8gs6109nVRtZrduK0l58uaUADpir?=
 =?us-ascii?Q?NnFtSjweyFbPG/EpCvIZbvY4c5d5DzZ7XSGkHps2Auj87A2+rzZ66dgbqZds?=
 =?us-ascii?Q?RYpUgSbx4CBhhanSCHJb5DYI4SOpgQ/CM1qRmHJm4Je13frYDuOU9EjnlLFC?=
 =?us-ascii?Q?ul7F/jRNLy7JBpPaFumJx4oN3098UzlFAxMqC5FLu5ZgziN2G0mKnFBSTYFk?=
 =?us-ascii?Q?z34zUbucimr8XcFtgQPpN2ygZSAhByP6CT89p9R/yaVdnIK1vGeE/scV4v8d?=
 =?us-ascii?Q?OFJOHZMiTYdtsYNzKRFM/oNJrCny/Jgt1Uiry3y6So2RqZR3JmRVBgPUyaps?=
 =?us-ascii?Q?lmdAWUFQAsj6PW0rFnAFQ9V1bRclFXn0brPAXxew68dAdjSNkmuLBE16O/r1?=
 =?us-ascii?Q?rH+3zyw5A40=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wNVCZ3IbTwXnGD5TYlp9MsJWfuQ80/cKQx8sBPvTxbOwjL/1w1oHQEl4DNyo?=
 =?us-ascii?Q?PAw2KMGWsADxTW4TZn9UxJwIuxjzVtxg7js749YyS5HYAhAlMs62sD9Hr6CQ?=
 =?us-ascii?Q?DaYdj1DyE81O1Gng71huaxp54hX4DF2DtOtrS3FtBLus/GT7mrMMEDXV8rH1?=
 =?us-ascii?Q?xr1wdYZevynXd1SLLXb5Oi0PtxIPNyypuDjuN4/nN4FzEilAWJxX4/QkNOf2?=
 =?us-ascii?Q?ExlOzvLQJlWBR3zPfgsoA5ksuEVXgJPoKhx6n/QZXP4z7hfzN84yVKyqbLtD?=
 =?us-ascii?Q?L3pEmR3UGIWE7O5f+1Ca9Hjnr6IXjoPxyBqfIZ/Dwl/zV/MAye4GnLwHpA30?=
 =?us-ascii?Q?3sBlXUWnDTKIMYf6ns3mQiKshYmIVxAcHQ8avbeG78/+oCFR1IeCQcOMjX6q?=
 =?us-ascii?Q?YH5u50y0czT7plIsjWf5c1j1pftQDTL9nCSSIPno9yC0UX8NS31l5XIbeZT+?=
 =?us-ascii?Q?47Ne2VKB6Kk9n56Jtn8aOyo5SMpV95yt4Gn4d9Fd1b83OklLLrOwwevn349r?=
 =?us-ascii?Q?wJFh83SwbM3URkMiU95Yx/wn+DLSofYV7WF4j7yFN2oaBuXhwYWprwFm4mBy?=
 =?us-ascii?Q?JMyIUCR2s8nRgP+F0g55dZNmtIBc6m6EakpQgmXT2msho2ijEnqWMVGFyirQ?=
 =?us-ascii?Q?BAPWZKwvdD2QS2vHfQS8hKZ9PyKP5YxmjkpMgz3CPECHkFxocju8CBT4yQcn?=
 =?us-ascii?Q?KaQihsVqT6SvJSDZJe+LGO5/QE5Uqg793TnP1Mlm2Aqk+u+1BUtT1lCM8z1L?=
 =?us-ascii?Q?un5R2kzvIn9yZXd7IF2fVlkLZyBTvqEq+fKcj7i+MiNFcdAbx52UCZvyawG8?=
 =?us-ascii?Q?9AjeVt770vQMvZdQVASH1TiDHAEVv/XsHJmoVZyU5IvSQzZEFK6FoC0iv3cq?=
 =?us-ascii?Q?RVR3LB9uUCxjFllRpbBvnQSJvrBVTXt3Szy6XZqwqqYK1PjiZJl3+pa1v3MT?=
 =?us-ascii?Q?Uk790+/nTLFtoi6awaU5j9oQ1v+MIfT68Mk83YvZ3lZLpCL67kaeBC+uy26Q?=
 =?us-ascii?Q?07h/YmEKC7vFn0pxl77Eyof7qv30mGsmiKjYX05yZfSB2my/k3t6cSoEyhwz?=
 =?us-ascii?Q?2xJVXPmRnzOCS5Pslg7LTMuHba6THIAWV9PTuLeCptBkZqTwdpZcuLneg0EH?=
 =?us-ascii?Q?Ok5ACGShwFqdikyVTu1JQSQTmej4/0VuQFWaXP4fUic5Sq9mRpkGRhRBFCRn?=
 =?us-ascii?Q?Ay/7qeqlWLRVZXY70boyT7KeDyGVtHMpIn1MqEnp4hjNIsXCHky2fKTdKabO?=
 =?us-ascii?Q?9jMvhsky+b5TfOqmnnDhtxbiP7VJB0LDfek/zwfkdlPcEZPEjDBcAYwBWOvG?=
 =?us-ascii?Q?+OIzwo/4wfC9S71NFA+IHgWYJAzTBRsa4z5VxAPU1Zt+bQup2Rmj/r6oq/DN?=
 =?us-ascii?Q?1LCdJDNR9aNlnE4s3zYSia9xL1GeBuiMYfHJIGGZ5leME+XhvekVHJKPna/6?=
 =?us-ascii?Q?tFSvJJDDaBroeGHLcXc5TGcGfWdkl02C1YR4lrafKYrvdNc9hkJrNFINszSZ?=
 =?us-ascii?Q?qYSASE3pAEw6wq6L41PSR1zcQfiQGLMhjFIIexAtr+9vDv3YDF+T9s918LWp?=
 =?us-ascii?Q?KINIczD0KwKfdGs0jrsxM2mZwWDqo/jA5+SnTIIIP/QukTG8lWvKZIr8iOh/?=
 =?us-ascii?Q?0Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efb348a-20bf-40b2-a96c-08dd7ddb2570
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 18:10:33.8829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lj9NvJDa8Y/5CP2zdMFaSbO5Y4xMn90i4ZzO1ol3Jr9nji1kxhTFY4SIK1T58OFAPtgtdLfShJ3/7iMN/tpX4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9497
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 18:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215112

The SDK Meson test fails when the SDK is not for the build machine. Skip
the test in this case.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/lib/oeqa/sdk/cases/meson.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oeqa/sdk/cases/meson.py b/meta/lib/oeqa/sdk/cases/mes=
on.py
index 407b94d242..63bdac93a9 100644
--- a/meta/lib/oeqa/sdk/cases/meson.py
+++ b/meta/lib/oeqa/sdk/cases/meson.py
@@ -27,6 +27,11 @@ class MesonTest(OESDKTestCase):
                 self.tc.hasHostPackage("meson-native")):
             raise unittest.SkipTest("MesonTest: needs meson")
=20
+        sdk_arch =3D self.td["SDK_ARCH"]
+        build_arch =3D self._run("uname -m").strip()
+        if not sdk_arch =3D=3D build_arch:
+            raise unittest.SkipTest("MesonTest: SDK arch '%s' not valid fo=
r build machine arch '%s'" % (sdk_arch, build_arch))
+
     def test_epoxy(self):
         with tempfile.TemporaryDirectory(prefix=3D"epoxy", dir=3Dself.tc.s=
dk_dir) as testdir:
             tarball =3D self.fetch(testdir, self.td["DL_DIR"], "https://gi=
thub.com/anholt/libepoxy/releases/download/1.5.3/libepoxy-1.5.3.tar.xz")
--=20
2.34.1


