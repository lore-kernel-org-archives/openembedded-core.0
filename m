Return-Path: <stefan.ghinea@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA73C5AE5B
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 21:22:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13513.1700515335683211501
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 13:22:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hEQ9jVYR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9688a6e38a=stefan.ghinea@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AKJZ4ah005664
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 21:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-type:mime-version; s=
	PPS06212021; bh=HYgqOCoaD6Bhu3BUg0qo/gjkhlpal4mf+nMOgYXKGzM=; b=
	hEQ9jVYR/mCbynlYUSEaz2L4+YYwJybm/UEuTlrD7QuMd23+toK2hResMtFJkd30
	9nQz0x6olbVOH+b83XIlVx4+HRNim91ZKK948iJssxRNy9drIraHRE+1wcuMRLAc
	nUcR9z6BgW8QNPhXEtWsSA8+1hGYVze7ixfe2FjENWQKQr2H2pNPGnW8aKvzwDac
	7rkeQL59TMNGJ1SINg37rsOff/aXTyuWapMWC7Qg7P5bd+xIzy8XNzfA8CYyJq7U
	04apd4+bAKcwDQ2JXXID5C5EQii7VXKXePU1+m83alXPrOq7MsOHuceTyB+nPtUb
	Ye4AM91g55F2PxOVD8weGQ==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uf41s9ey4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 21:22:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFDfx90LSXupakrXIDGMNvS5EROPuILaf5kgbiz+9IyacDKY3XS+AKZKmiIMvKTEb3NuKWcFvoM5zMvZ6xrhmBZkpSxDaLJPo7DHJPnzfn2RkS/co4lTq+X38LQ3+BvF+AHvMJnk9hVUjaGf03pA5fcI/Tq6ssWMDkZko3onw9vPIjYSl+6+cixw3/mcwi1JmgJq9nGRSqunLHlkXIZMKBDxX7KxTlRp8lNbFDf1JS98MFVbXQebcdToqE2qNCnxjJjn0VAFuvGcS97vSJhgiGT9lG0ZIMAqqjqsbet9LUYWMmyVTfTqQh4ynU7Tx5pzJzyxpPWcJsCbZ4azNqWD5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYgqOCoaD6Bhu3BUg0qo/gjkhlpal4mf+nMOgYXKGzM=;
 b=YgNz5ADjE6L1ey7GIxZ2TmKo+7xlE2X5Sd9NLc+gUsxwIGaHg+Mn0mfBsShsOW/HJIo92w2sq9A0sc5CAbv854UP18gs7CcAsj57CGzKTvM/sBU97nFSq7DYIoS/IWyneiGK961y6GKm5+qpsQgyRfy3Q2VmbqU0g9wmbfq+ol2HiwlNFKFWjw+J2Y/RyGmi6ob6RJy85beZiglaozYsFLcPiVHCSWci5f8p3yRC/3vB7zvqrEg5ZGxOpr5sE3dkVvXHEnBnjNefzo2IYW4BTv7SwFKz5gQW/uL3OGW3BvbAoH/UYYovOsegaAEfVCQaFJqP2r8H7OYKtKEZ4YniwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 by DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 21:22:10 +0000
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::f127:7e1e:4aa5:4a8f]) by SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::f127:7e1e:4aa5:4a8f%4]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 21:22:10 +0000
From: Stefan Ghinea <stefan.ghinea@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [hardknott] [PATCH 1/2] libtirpc: add support for configuring and building with --enable-gssapi
Date: Mon, 20 Nov 2023 23:24:35 +0200
Message-Id: <20231120212436.27604-1-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: VI1P190CA0016.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::29) To SJ0PR11MB4989.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4989:EE_|DM4PR11MB5341:EE_
X-MS-Office365-Filtering-Correlation-Id: 0307cdf3-5a7a-4bf0-8e59-08dbea0ec17f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	C8GWypM3IIEDCV1ZnLOC/6NRMn1n5rN9wNnATzo6ZRwRvrG7sxcD2FihdkPYzFTAR3XPxW/fkiwXME4YwuFyoWyLnI7YykillXquTvio9G0xMmhcIBbUHxocx01YLnIm2NPcfsUGho9fSJtX3LgRwOQLP+iDryLfsoEa5kAEtiaxk4WkLevy1uqAKiCUP2RP2PGoDBD3UdQcccg+LLaAWXl+lYlOyzQ7i3l3hyYGtBhiMNH7SrOZAMexaScpz/rs495mXhyyogeKR6o1deoOl047t+QMG0E6uBNgv+wJ/lLSwUxpJq57AIeuhq0cW6voMNJwf7b71+5a+hg5nGovJD/QYqt9PEYXOVQRRgvOUX6vXjBmR/vcJa8ZIvsKEFYzkNxM88+x9Cz/VrPfZsQ/sEW3AMUKD8za1Wln/f75y6/pgwY1p9eqxEIz8RKuTEQ06REqmD1I1gMcwuYSRXBNQKlXwkMZ8pdUzNjYmPCWIGwTQM7tcQW2Tftk9UkzxtMBnFDxswp8nFj/BzPP5O8oQ41ehQrUai+8i1H6pfIhYLBov24JwnaFX9vFZ9dBB+jPUKelzi6sPq0WDbgexR4ZFDu1kp3O3wTEd6CZbqYNlq612D+zjDu56Y65Em6nZC5l
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4989.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(366004)(136003)(376002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(66476007)(66556008)(66946007)(6916009)(316002)(52116002)(6512007)(36756003)(6666004)(478600001)(2616005)(6506007)(1076003)(6486002)(26005)(38100700002)(38350700005)(83380400001)(86362001)(44832011)(2906002)(5660300002)(4744005)(8676002)(8936002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Xg6AumWmmrPKBvBcoN+qRnbgdscpGhpp6Xi4EOjUlTJ9ZYavIm6m4GTpsfD9?=
 =?us-ascii?Q?iY5UNska8ZuIwKDaCCHK8BFyd+9Vcm4ZuvDZ0NKrfS9wk4vwEyJ2wZSIX/uN?=
 =?us-ascii?Q?a72FDz2hnxPlkQYCAv9sstnB4JaExsTKyn4PlI2TZMjC21s23pmjo8Qn/RUd?=
 =?us-ascii?Q?+Iu6QdMANPjnGFVEuFSydlFqxbxyXP2XnPZ1Gq9DW3L3XCQQLNTxxBw4jioD?=
 =?us-ascii?Q?5WAUFS6JI/S7MxzoidXfUkAER1oBz3Sf4ChhTxCtg6ldNYBI+0RmKZ2nVESy?=
 =?us-ascii?Q?2ibT493Exylsd926v7rB7M26x4zKZ8wtC0M83wD4VSu979A2CYXOH4+uzJxj?=
 =?us-ascii?Q?jZzXa+720GsqoK4tyPl2PdQDsggWXJectb6Hr2oD2itIT4nC0+qrMfAQ3NEA?=
 =?us-ascii?Q?rpnBNH2IHX/WWSR4mRSfrihCrenbLN7AdJJxNIXJXnWiqTp+Ok74kptZE29q?=
 =?us-ascii?Q?GFkS/RoGIwyc+shDxx7kNyFzTYLn3Qd12J8o2wya297IrO+/Ssicp+BGeC3S?=
 =?us-ascii?Q?vDsiB/lb3LFIwijdPdzzKVz9zZJliHbnI9SMEVLKIi9PWRIcUt7r3ntUhH9r?=
 =?us-ascii?Q?yVp5+ncQ9KxswAQrnZgCYOPafG7IhtljrLw7XoUWGT4fj/qEp6U0/iHVTE1+?=
 =?us-ascii?Q?HR9uuI2wY1qm6ABEU8hJEYeXELY9dovz2foLGG5yxyALNf+lndPE4V+oeWFF?=
 =?us-ascii?Q?dHoynlVrkKMk3N1hdmURtJL+OFH5O3H/L08MW8TabaCciNqIpx2GrqIjl/r1?=
 =?us-ascii?Q?K5rViJEH/y09GICR2DagWo/ZWP4wNSWUujFbXQh4Sgha4sLDkhTm/LanaFUg?=
 =?us-ascii?Q?f5ADnPx9STde5/RRWepmh8uPT8iVhsNlnFADMpFmhl1RhYiUnLa7AhXF0y8l?=
 =?us-ascii?Q?hBX7+tgq/fKzaDzPucTx9XH80dX9elx1lx0C/D3nJbQ3MQ6GnRZlQbS+0WDg?=
 =?us-ascii?Q?4N4S/J8gxUJ4Zfphfl5HrjY+wHDWXJyj9FMSQkGov0cykLDagDNrfGpY5HD5?=
 =?us-ascii?Q?V83buHSt845SjXwhlzxwTLpefGdOwlfaofz+EwfXeUDH80Dnf42CIOgRMzGE?=
 =?us-ascii?Q?gHugv9bJo3tw6gGT1UONEC/7g/m7WC8Y2Qnf1f+xh8YrJYBYE6n1o9yRBfNW?=
 =?us-ascii?Q?xb/3O8ZqCzw0GBDjp8y5pOQWvl8vzZsZDxfwkWxBsgePywnnKWvjAlzBFl3T?=
 =?us-ascii?Q?P5o9VneA+15WMDZoCDoVCt44EPMvqFqjPeL2kl3glJDhtRuyOwWsMaAPY9wj?=
 =?us-ascii?Q?uUwktUXCZBuqWseYOPNJqcFfjFV/9Rjr81nZLoNzfveEfV2spQVdUICKqrlQ?=
 =?us-ascii?Q?+SHyQddxp/ZkH7zVBwg1Dc3E/vVjQlXnpo6d0/y30V18aR1jlmY2qPYdykSE?=
 =?us-ascii?Q?b8Qz8JaS5ZNXaVWgfjPM4nduEy4hpPXaP1LEbrb7REWgQqSMOuiS1wUg2Uoh?=
 =?us-ascii?Q?l9dDcYBqOew7NDpbshOYCSo8BSf/26QB0imqa3GnqLAID6RTMLYs4nWIsS3u?=
 =?us-ascii?Q?LHAZZbDrsjxPWvgAWof+B4+5hLlVBhiaxX8rbxFD5S+qQ1W/4o8eRzjwiCWK?=
 =?us-ascii?Q?gKeLPSGbo92Ii/5ni8HAErgT+pLZRcX+SulTbxELFpXyicCPhpF0ghPl0+5J?=
 =?us-ascii?Q?5g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0307cdf3-5a7a-4bf0-8e59-08dbea0ec17f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 21:22:10.4081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3pbS68JieV6kFEqh4gVwBo7KnCeQRqaTMjpcrtufu4gpjKwrDDLHWKS3cuwX01Q9gJRbNaKz0HICcUz8AWEW8ktvTi/V7KaRslZlNR6m8Lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5341
X-Proofpoint-ORIG-GUID: hSZDWP6TkbWCweQeMfqfYGfJy8HG_xHp
X-Proofpoint-GUID: hSZDWP6TkbWCweQeMfqfYGfJy8HG_xHp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1011 mlxlogscore=782 adultscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311200156
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 21:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190931

nfs-utils with gss and svcgss has libtirpc configured with gssapi option
as a dependency.

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
---
 meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb
index 32fb651130..5ae91b6df3 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb
@@ -18,7 +18,11 @@ SRC_URI[sha256sum] = "245895caf066bec5e3d4375942c8cb4366adad184c29c618d97f724ea3
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "--disable-gssapi"
+PACKAGECONFIG ??= "\
+    ${@bb.utils.filter('DISTRO_FEATURES', 'krb5', d)} \
+"
+# krb5 is available in meta-oe
+PACKAGECONFIG[krb5] = "--enable-gssapi,--disable-gssapi,krb5"
 
 do_install_append() {
 	chown root:root ${D}${sysconfdir}/netconfig
-- 
2.42.0


