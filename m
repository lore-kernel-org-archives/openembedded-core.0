Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0283F3ED64
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 20:34:55 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.84])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.210133.1775939693279224711
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Apr 2026 13:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=la53OC2t;
 spf=pass (domain: navimatix.de, ip: 52.101.72.84, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnpWlmt5CCPVr7Qw+olDvcW7dK0oYeTM/CcA/s5G0TcWBdNUde9XoxfLhO5PrAtMlLaZKqz/pM9PuQjO5kKov2gBj5eFnZgxTV8TiJ9IBsfoiSFicIGCbY+RJqQXkPFN75SjZ4IWREol1qMyplvsQio7oYorUrSyZwKwpm2bBl5HX75ajYC/ZCmjiTCFF9vgYE9a/tGHSqd+nvN57Gue4MCAXr0cJkMQUiliWWfWz/A5ijhFRY+0ei8MBX3HF3CFxDv/5fBlIsJEprHzw5t3GKjkfEXiVS26j+nrFe9EZvtEtMNelcEbHZ8RQqzVY1SbBLEy7l9xwZ46G5s+OF24EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNLAL5WwqvMmNsv+R9SjiZwpHK9gM/eWGYvp4SGPc1Q=;
 b=FNZnqES7lPMR4FAk6zMdXiPVrJPS5udjl72WNttkdc6HGzfb9oD7oXgeppb1XWa8BpWPUdm1XUFK1OcNeU8drx33edFfTF5bcQ0alkcXKnxqTersaKPEJten+wPmyu0sTvxxU+q1T0K+f3XTZJ6lopwJizMuZEcw+AFFooKGuBLVxzn9IbOZJogy1HeT5A/Ff/7TlsoRimFzdbdTnTg68wia6IKDg3891+yjtdEcHk/MIm+w/77BbP6Zhz3uS3DVgrlulyRTXXGFT/8iDA4xi7KmEk1+kATtdboRO+DdUzTHultK9Fza/BvlrAgbxFWdQMm+Wjd8iz5s0bOu+zhshQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNLAL5WwqvMmNsv+R9SjiZwpHK9gM/eWGYvp4SGPc1Q=;
 b=la53OC2tk+cvRPqIKmAJu7f1VULYRWthS8r+w05SvwXiM/PzFTm4MPo2L8CbxXlTslFmMFnSLOEONODFE1giOjGPpJ4fAITpmFWgTFmvc4BqXFU8uEeRvWDS+lkPx2Zd6ja9JL6deZNoahDJ9n28UQ+JTUXEBrx+wjH+9jPSnrk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PAWPR01MB11504.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:4ca::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.44; Sat, 11 Apr
 2026 20:34:49 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9769.046; Sat, 11 Apr 2026 20:34:49 +0000
Date: Sat, 11 Apr 2026 22:34:48 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, rs@ti.com, 
	joerg.sommer@navimatix.de
CC: rs@ti.com, =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] net-tools: Handle binmerge
Message-ID: <a1813bd07cf00d70c8feae58ca44d16eb4308d63.1775939687.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <20260410182747.1646597-2-rs@ti.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260410182747.1646597-2-rs@ti.com>
X-ClientProxiedBy: BE1P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:67::12) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PAWPR01MB11504:EE_
X-MS-Office365-Filtering-Correlation-Id: cfdc6d10-e69c-4a3e-d2af-08de9809c72c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	fKZKF6EupkDTR0kR3huAUAqsrDp4t9OE75Uefgg25Yphv9LUo8XemGbi0aIvoAkl6vefEnz8UtBcuGmwNqtCwZCciBRI8IFMartdnc/yeQAmvlY52K+HE2b++kkO09/zduEKvmVms6+r7tQlJ6t3NL1htMbMUI+UZ226kO8L6xhMt6ROe3wcob7Bro6gO5Va6548VhPmU+9YuwEc4xKfb14ucUl4nYrRpFPS6C0ESxCvEku17MizRdXS7SFZqBOiDM9NNxcDlxvuRTpE4cqtVlROlNFmtLjbqEiiPc1C6SfcRiySL/NI+nlQDI9mhmlo1sI8u4JlRL3zD68oyRm47nlRoxS5RyL4Ki7vcYULfTxwdmlyKRLDPOLi6V6DXrJGuKwGAgZ4v43uD4UmSfOrrpxx7zWrW0z+BTs+WOecTaShETfMLlc8bU+H0DP+UuZkI3n3Aiu7q7NmXaA26pG3LVZrH7LADTf7/EGnO5dsmZUQ4KHtYTILnCT9OHGCE/ZwE/DJ99xyV340EMwadiwy8Dfdm9oTlJckXuxNnzlgERtK/TRqKIiJaFAkyhrY+U7qvahKQjo3rHO9Es3828qo9O9UEerMbZHkeZEaFq6PJ74dtZx2NA9P63WJi+j7eujysJDin4Qc/SHzUQXgJuBeJuU2mDYq91JTNrowqgL/eNLk0vm/V6MriSI1G3KTV2u7Zw0fsPpGzNOpAyZBwpqjUma0PqXR1j3eyzOmJcyA1ro=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ELw7/+xU8cGtTYnfj6AXHSbIoUYSjyzNAHEWNaECT6AjaylGMF7oTv2YRYZ0?=
 =?us-ascii?Q?Np6cPkh9M8A2YaOHSR+7bRmGZC90vHXwc0GMfbhw3aHGTV5CwbwJWvq5y+Ui?=
 =?us-ascii?Q?SOe2eJD4LqVVKNHYQ5sCTpvmH1j6/pEu4/gpF9QDehXBi7Zi6IJVtGP1pcVK?=
 =?us-ascii?Q?srq6RJNTaWgwA3+VmEakh8att9XTTkuHxQC3KJHHw+apZODlClaHU9lo2DfN?=
 =?us-ascii?Q?NwxAKtexVU+Ru1gPqaS0VvN5cf7PQRYLFocaGtit2sfRms9OiXM5d43HFgnH?=
 =?us-ascii?Q?zfjX0kTGFopzPHSbmlsI6IpduHTzpcke0yOy5vBTF96EOdDuytj/GUZeiely?=
 =?us-ascii?Q?Ji8SKQriHc2fXYNKzLqWALnGGJW1nSsSBfSkTo9aEV6VB4aCsX6YOcd3RozL?=
 =?us-ascii?Q?mnGu29JhuoDGjDbYXGsjlRMkuF403Has7ZVNv0wnHArp8T64LQXetmi0c731?=
 =?us-ascii?Q?p7kbYLjb5u6xvzVPV8RpMdqGzg0Twz8CW3EsbjJuD3Rs4TTux4T62C3kA+rE?=
 =?us-ascii?Q?9Slz55N4LPAszRV1NlThXwKdx+l5H9/Ur7i66Bl/7U+3KatLdNX9FgNrhNcF?=
 =?us-ascii?Q?0+aaGwsk+Qlzz58d2AZmVHV24vu8y50X1BqM0opJVVq+OlKJ1ZakeAzMTN1t?=
 =?us-ascii?Q?3MglUIfFZnp5MRKiItlTc/U0d+AM9X/+kCC5vGrK0JtTia2MCGZN9OLsZNv9?=
 =?us-ascii?Q?wseQ3sskhpDCJZIvUj/+xUxVI7W9Pe+X+zppO0LmTO6UUBxoOfDbr5GZgb9N?=
 =?us-ascii?Q?gW8pUQC/SyTa7EuIYVzhqaYfugtrvF0TvWYI4u5qqZbSC9WcXYbjJ2i6k22X?=
 =?us-ascii?Q?uQHkpNMKI6LX0CzGsiVVFAil75jTLOaCUy1Bd4MSPS58QccITVwRvylsOhCQ?=
 =?us-ascii?Q?6ITQJI72i7p1FUfbQIl40lBrNeqpLM6xwrh7Y11mTsvaYXJyRgtBJv13fl25?=
 =?us-ascii?Q?UF1sOVOpd+Xjy0Qxvit0Sm7zkinji67WCOFNcGsm8jPA3MJrU/gwllyhMMXA?=
 =?us-ascii?Q?Qp3xnWuFG1mlXa7vB7YTbRv1czO86ye3Q1Kq7LY3Ipd0waxIz0QzEVWXR38M?=
 =?us-ascii?Q?zR7W8BERL9AgxbMAMHtVeMl6vQufs1wu0wo9aCoRhaTzazu5Q/x7+mH2d7wn?=
 =?us-ascii?Q?5EyS2teA4gpW/5P905Apj+PPWsZrYmSq4ih7E48+vW0gVuTksJOvN1o+Xgmo?=
 =?us-ascii?Q?+EB1OuvTKOpAdHfGG2VgfssHGLxgeSwpB5akUlNEIok2IiihYnaRettCkB6x?=
 =?us-ascii?Q?FhM5mhYbzcqfjmdwVMaRHhEqCkRK2jjWjCi3XrVLrKBhV+u/+gHRiVSTKhDb?=
 =?us-ascii?Q?dmEUHY2XZrQc1ZNnFpLp/ddaR4MNgj+JVlV71WohRCmOTp8shkmgm5EXxyoz?=
 =?us-ascii?Q?y2J0rsDJQmpemW4+jiSUljs0EKj+2zF5NaKT5A88nsYxBAprzUrX9BKPkyEJ?=
 =?us-ascii?Q?8bgopT0AXNMmsiqO5FnWreIQ3nuFj8djRuzCLXNhxZ39WlMxbSDOPHAu1qL0?=
 =?us-ascii?Q?4zMROrY0e/i9rDojsLKLFP/fhJh0ewS7myinPToUeMDlXKsqWJovZPZQWUTM?=
 =?us-ascii?Q?Y+fYnXYBNIfSVw9inj6TaasNRbyciX3OjjvICPPdMHTsrHFpc3MwBxXiNODD?=
 =?us-ascii?Q?9UhUKKWquYzF9G14d88dCjnPdpBYHP902DEwUrQqjK999SxBuHL3S1Qtrhxb?=
 =?us-ascii?Q?s529gFEMSIdRVdVtjDoHH6ulwc4bBUUg6XC3JlHkmt0cHFf+DuUXDloqft3s?=
 =?us-ascii?Q?limvHiSzXGY2qXf5wBkpVPSuQWjIrsw=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cfdc6d10-e69c-4a3e-d2af-08de9809c72c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 20:34:49.8240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZW89twKA5gQihX6iaDq7EC4gq0xcL8wX/pNpeTeR6W4fbdXxyFf4kPDiuPyFa/MfejI+MN733DHhF1O4BUjnBfGLQo7TcLHG3ijsGSCUfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR01MB11504
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Apr 2026 20:34:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235049

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

If $base_sbindir =3D $base_bindir the sbindir already exists.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-extended/net-tools/net-tools_2.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/net-tools/net-tools_2.10.bb b/meta/recip=
es-extended/net-tools/net-tools_2.10.bb
index 6c8297ba39..a21916fb26 100644
--- a/meta/recipes-extended/net-tools/net-tools_2.10.bb
+++ b/meta/recipes-extended/net-tools/net-tools_2.10.bb
@@ -73,7 +73,7 @@ do_install() {
 		rmdir ${D}/bin
 	fi
 	if [ "${base_sbindir}" !=3D "/sbin" ]; then
-		mkdir ${D}/${base_sbindir}
+		mkdir -p ${D}${base_sbindir}
 		mv ${D}/sbin/* ${D}/${base_sbindir}/
 		rmdir ${D}/sbin
 	fi
--=20
2.53.0


