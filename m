Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A216C106FD9F
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 15:59:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19277.1773417595773941058
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 08:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ovOUKDaj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75322bb784=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D4aHoZ4080766
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 08:59:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=aDepSlqri2rKMj2hwD7NoL+8dGJgTFRjhm2/RhEIoNg=; b=
	ovOUKDajtPSR2th9U1dQr89bVqZkn8SNifo+lU/JKDpUSY5+PLTM68iECCUXh9Ur
	sVE0jzRMxBuskzZEPZT2DiSlJRV0dISXhopQ6k3rDpbM7fIuFY0nCz2b/YUd6yGN
	hbpruaOgCM0o3yTOmkQP7LssD14CzuSgGbUAj6tFKh6/7xKktJQU+MLobtanYHM5
	843aoMfo+DeDg8tfmra0bPsPEPhTxdg85PQ07AikpXF4hiC7MdOg1rzT8afn0kH5
	+VMJ/HOXnVV4dJZ+LXhBU4QfrYYYWqjS6JAA7rhRNzjo7TBYymwHJa73qNME0hth
	1XIyaXsQbzWpNzeqWjHXOg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012034.outbound.protection.outlook.com [52.101.43.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6ptabu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 08:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELdXHn5XlOM0i0B/JdGtfH8SDBUNLtOFcXLsAaXXLfz1pODrRpKcn5+nmj8RKc53pMKqt5cxbjh0iVDbjX+DWScdgPm2Qz4MSWFbvFicePqi3y2Js9Di4SdXL7PxQUlJVa7zniB6OOARyNJW14LOztmbiFMjJZdi0lI99IVy9VUeWFPQIXMaa/WkBOJYU8gZHs9MuTX+brJZR5arGPSUvf/q9KS/b92neAoav36S764Wl7XK2+kg6wOOBeFA9MsYyXlUEURrocCERV1rUO08Z4Mr5yXEZRV1hbI/xvlhJjD100+NkkAB1Aaj+/77kJqvfoeauovyhaq12iuY82jyKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDepSlqri2rKMj2hwD7NoL+8dGJgTFRjhm2/RhEIoNg=;
 b=UarNOXWnL2Jz9mu3oHclcSUwMLVhnbdYKVfmiFshFi25ZQookSyYAJ4mNEynbcjDMJiaSUxB+0+vkI//f8O8mhFOn4S3DEvHLVQVPX86QE9tuIG9tUMVCWHoF7hhZnjq1RrvBPiRa3BoD9UtLV8h1zBUmzPNAOdP3TC4rzzrUzXFSkJiLAXQeJYEJQ03iCY5Vmdr9r3/WCG/QRQvtiPDFR0mVTLDDQiYyE5DwW4vaYcaMPiIooCfWOIQ1ICXTEjqU9wue5vj0m6hn3y7d56rOuIXVPzlhZc02v+69xPhs3hh0/jKh2vIkFI+RNIHP8XoUZoOJzuaClO0z3SMpKFnOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH8PR11MB8062.namprd11.prod.outlook.com (2603:10b6:510:251::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Fri, 13 Mar
 2026 15:59:53 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 15:59:53 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        bruce.ashfield@gmail.com
Subject: [PATCH v9 04/14] kernel-yocto-rust: enable Rust kernel support via 'make rustavailable'.
Date: Fri, 13 Mar 2026 08:59:10 -0700
Message-ID: <20260313155920.2347101-5-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
References: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH8PR11MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e487448-1caa-405b-51eb-08de81199079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|19052099003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	uSU96ipXPjm6NWMs5XiTN2mypYiMUR0aZ5eJuTvCc2XWkNaoiVsGazxEWJ7chOAHIxUMOEWHsQthZl49hnkVK2x2oFr2nOY2fkAuycp7qJz4UUVQ7BWgGe+5tRL2Ay2CZ9+zLyHJgXqx5ZrPOliTQ+ZJqx0G95TqQ6m1C4nzpEslVkBxvB26mxYMU8Dvv7sr91UU4O1TaBOLETnY2cWDk2ybpzXgasOm8BtW7atalPa3DyEuHdXMeTwV0ecXHIbzODdPrce8A0CXPLqvRQawcrzNwNbqV6VfeOsvn45h5SR1SnfW343+75KXKjzcqc2VjB1E9k/4t7bzh89WEM2pc/pu0Uc/fVbex/YJ7g/8VZYMWrb2wxbLEuaStNfMMTCeM1UQht9dtXTa0Bm8qVd2pMY3oxLZVWASRiQst4AwuNt6Rk46sksFMr966xWZvNTrZANxTfED/hjRYunN2X/Dxba2SAnvOxMHWLiuvJ83QLCf4Kdf5DKngZjLqWdtzA8mDBxb4c+ufDMfyKVe14AhND5CpkJVBD4FciGxweuuJzBtX/oz6h4DAYyQ1dE+2G8vR6faLKB7nVZSNoID2RRtCFzGUVXnMmGfcW2FlwYYeTHzI3QE8d11aZnfhYXuytURkrLOGpKGOiajUEpnnjYD4OpKiptqLesqRVxaE99NRrBIiNlpn4LT+Ru3ok5B6si09dBl52iHNyJ4g+fQDVRe47oDEQuRPldMBlq72UPDANzfOfoDqe2PubLqPfg2vYk0qmh0G+SmAdhUIeWirCX3nqqP1tsk01ojLf2ekhQeWvo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(19052099003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RwygHMlOQH8OIU0Zowh85tXdWp/sImaGJzkSssOE8tzJGCROgt2g1VkX1uHr?=
 =?us-ascii?Q?exKwFuEB3wXZW926Y+IaNgoAX03H51UnMjXHA4SBaj2JBSj9x+LzD/w33OhF?=
 =?us-ascii?Q?QhiCfP9GZG3jBLwxwAnETy27Z7Cg7B6hfcwFPMsch1lVu8jIxGBVz3jn/e4C?=
 =?us-ascii?Q?jZaW5//6ImDtQQPnS9qtl9/8z1QvNOtBYTWIaRaetzcDOXhBzMFO4G0SjofR?=
 =?us-ascii?Q?9OoaYicyloJnOYs62/v1n7YmkCtHuiGr2XCXlEv4BiRtvDSlwnuDbUd5XZEL?=
 =?us-ascii?Q?YddbQpHb2TPZyhxWRRizWmQWOnMV7xiO6Ya8ukRbkO2qssawrZl9y3tzWz+G?=
 =?us-ascii?Q?umE3OUVWpxs59Q1pu0UjOO4pyV0/YX1whiY+pIwLM+n4bkxrJM1Ublqz7Iae?=
 =?us-ascii?Q?zJUxC/TY/+r7Mio4b0C/gp2YgOdZo90CiPjkUygG8FrGi90bb5ik2zVAmWag?=
 =?us-ascii?Q?0U4go2CRIs/q0PzgO/GgKtj0DODWIDoxdhZvx3VJdCCPWnaOviwUtjWP6iiY?=
 =?us-ascii?Q?DRnxcvQOXCloVjzFUyS95X16/xRKb25Qb8cKJpPMzo5m7F7fIViVDXqBpKHd?=
 =?us-ascii?Q?iwdNlnxDofjIiLC/DgKw9h3BfzH4GSi/gW2Mu9A7wBsS+uhPv22RGoOPwXfn?=
 =?us-ascii?Q?5Ogn5RTlU3Y6IGJESKICAuSfh76MhvfSkoX7e0Mau8tSaXO//KW7nwbK9Eas?=
 =?us-ascii?Q?n8xDnpvKyqBDYfS4KiVNwcdfrrGEUdw9qHGEywexAzrpUUtWRP9puZziRNvT?=
 =?us-ascii?Q?5NFVGHLEVRTFy7f6RTbtYrAWNbHrP5lY0hZp0j2ToAU3kfXIQyWzUFynX81B?=
 =?us-ascii?Q?Xc7un6BnduoWjrGoye45YFS1CMwPlj6+7k85uZxs3TI//qXF1CG8qLxwgDbN?=
 =?us-ascii?Q?dWsObrFv8r6x5S89dAZds2nB9POClrzFGKHoCAOeZH2R40leIg27uly4zwJ9?=
 =?us-ascii?Q?amUOONDThQTt6XJoTbwWPshtbqFf1Lqo4GozDTwAJGilkOsBvAfjQncn5OfW?=
 =?us-ascii?Q?+AlH8+xhr2Ly/g3LRqx5ZX3qcGn8g8JgU4GPVQXaVZsE1p9+GqRg10Q7bu4f?=
 =?us-ascii?Q?RuO8og31vw5XsYbcx+XQavo4pOMHfAXNnD5tv6FYO1UUo7/BRgylnGbFlF4Q?=
 =?us-ascii?Q?ZoALO1E9hkZWvBnneYjE/+apHsEakf/361MgCMImY8GqJ1wUpHysu9BNQBh1?=
 =?us-ascii?Q?YD+pffZ1AJLYDKv7MwdvNtpfcp9QLHKx2ZPtlb3I9ncUqNzkYK3rcjecEiFQ?=
 =?us-ascii?Q?HJXXcRM17AJe/vA9SapWoZyzCr4cxDOr2uMrPlhC5xOefubkDS+l9IFjKwru?=
 =?us-ascii?Q?9OvCXwXyC7uLqg9P1WFRC1/2ST6B1MuSCJjKFEa/v7H8cMrLllRGrYNFl+6o?=
 =?us-ascii?Q?WA4B9t2gl+kF0YjhHXCK4I1lg9eZYfifLj/Lb3GzSedXAnKkN84nSmfoz+qe?=
 =?us-ascii?Q?x7hFy96lJVDEpYUc7LeEdjLUyobYfEczN9PlzeS36tLgRAVAXjmI+VRfaVIq?=
 =?us-ascii?Q?4W2o3EzwR/52obljeEQ90fRB47ngo9yUQgxmyGo+X1jjnhlun5/3AaQWVEA7?=
 =?us-ascii?Q?+y+5rP1UqXLvgceTR73c/sw6HAfD0DOBZjgfsABxm1OMn9HRYG8r/eYmKHA7?=
 =?us-ascii?Q?Jfb5/MzvDO4hAfCKhcLnvRTxe66+IoTRtsBE7xURG6V4mfQOP7IlgrhWFI0R?=
 =?us-ascii?Q?0DFTWbJz1ELYhfFyAnOEB5SaK+tn58D2eXNy0j9vCA5oKroIc1sgIdI0WaOg?=
 =?us-ascii?Q?MqQufiW9+TSVeLV9Sp7XFGXXciZidzQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	CSzMtLadtuBL+hzTgCgNUyGegOtzZb/zzDlL/EoGsJ+2zx6aeM0KA3I2vXbvDLLo3uy75TZVrzBDG3gxiICh0iK+qMeHRQ+d5WZUQDAMDY5GxlB0PjdjdwXyUBFykJBV++dRp0SaTx7TnqI4k4MAf5FDLxmHcuQPv359Yx2FmNpoFQr4RLxSxwJvjm03xaOIMqjnJMN5fg3AhNne7KIhDg2H2BN/LXb1IUXOpw8/pC4FxszhzqWkHO0dWusygUnd7bKk9OGuIXNcH3l60i1Jghz+kMgHyOrw1xUbwnWdIwu0fOHHngizTpnCXiiPfh/z0hkNtgmFI9QWxF++SWufZQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e487448-1caa-405b-51eb-08de81199079
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:59:53.2159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vvsviqsxMtWLA2FXVVUACPTpMata7DK0OSsC+LcWYtzjQ7C0TLhkqlQGTnSScpTTOIq3Y3mNkiOO5lt4BvNBms1cT275fnirex+NSm4uQd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8062
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ePAeTXp1 c=1 sm=1 tr=0 ts=69b4347b cx=c_pps
 a=e7UpQLGcWimQYEoqUdNrWw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=-yn6Wxg1_zSQloxVRBgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: P7XWGLAP9zNfPoLlqnwVXRMrHR9KovVu
X-Proofpoint-GUID: 2v2YnT_hHXmlP-t7-el1_pT4pQa83srd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNyBTYWx0ZWRfXzouoOC2fLKDj
 FtCWkfSo5UyhJFSWaVmqD0Dkqfhh66Onxh3DTtGHEiJM3jJaMeJrX1nfxdQvZych5vygkYDqrTx
 FacfaoqfyG7bX9hmwnUV6qPxCmanPalzQESqFnANlZMLulkv8Lw30C8alzqUmWvKvWnMFTT05Ro
 00kEuiRDWK28ZVPFFpkeUtkMmqS4Vn3Evc6n3eDD/gkMWfLGov6ri4HLirhCDVVk52LtwuGaHUo
 EMznVp1kOasYHhsyh7FeKDSCOBx7PFTEedSgPj/Lzp+VWAhVu+NnPBBi69t40C5SU3gzgYPPiyA
 Ez1aEaAUUI+29li3Fm99bgJERuPvIsnSKtwgg4+8b+YBF2YUc7bIYtUK6ekYwqWV5Ha4nKWQBaK
 lp/E8v0sO3wjD5OsNUqymbYYYWcgR+J8Pj56oWhYkisy1CghddMPuRy44+Qbp+M8vfDLmYNjGDE
 LZTfz00sMsfdmHLoYyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 15:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233051

From: Harish Sadineni <Harish.Sadineni@windriver.com>

This change adds support for Rust-enabled kernel builds by:

-Extending do_kernel_configme dependencies to include rust-native,
 clang-native, and bindgen-cli-native.

-Invoking make rustavailable during do_kernel_configme() to prepare the
 kernel build environment for Rust.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass | 12 ++++++++++++
 meta/classes-recipe/kernel-yocto.bbclass      |  2 ++
 2 files changed, 14 insertions(+)
 create mode 100644 meta/classes-recipe/kernel-yocto-rust.bbclass

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
new file mode 100644
index 0000000000..7acc81764f
--- /dev/null
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -0,0 +1,12 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+RUST_KERNEL_TASK_DEPENDS ?=  "rust-native:do_populate_sysroot clang-native:do_populate_sysroot bindgen-cli-native:do_populate_sysroot"
+do_kernel_configme[depends] += "${RUST_KERNEL_TASK_DEPENDS}"
+
+do_kernel_configme:append () {
+        oe_runmake -C ${S} O=${B} rustavailable
+}
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index a77f2214c2..e7fdeb5d4b 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -4,6 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
 
+inherit_defer ${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'kernel-yocto-rust', '', d)}
+
 # remove tasks that modify the source tree in case externalsrc is inherited
 SRCTREECOVEREDTASKS += "do_validate_branches do_kernel_configcheck do_kernel_checkout do_fetch do_unpack do_patch"
 PATCH_GIT_USER_EMAIL ?= "kernel-yocto@oe"
-- 
2.49.0


