Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C89C83F22
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 13:54:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.22658.1752674070888556623
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 06:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92926a3987=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56G4pcpJ1366317
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 13:54:30 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdrxhx9m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 13:54:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrE9THpTzCJZl5n30jL5wBXoGD6sm0sH5LFKAgvbUybSxerO7DovoZadeHflJfcNvi720iXyZyJlsYx1iCEijivprGwDM9J083w++n0NY0QHtMidex7q+c2J+qN8Ll3UqTZFr0HxuOe7zJnuAtqOMl7yoQ1urHJX5J95plCmG0huiadgui6hvy9clv4vSYlot2nn76Tk3AE81sz2TZQLiIyhwWjmhXEcRSyNqOXFqkdtJ9ikZDHOzYyP/uXR2h0o8oMPsMXUA6d6l/+NvcJeVOvxf/MnZukVs1b3q0cX8kcQHvhPJrnVuWPxBP/8Gs9EIQH2mz6RCFE/3SgbLxb4IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2K0TYxcnoJc6Wd8CWrsYCmkaha1oH4qjokEwpvrSOc=;
 b=v2MSPD7UW1Kck+qTBsAtw3TmHOsCgt1X3LOt9dvRfOwm9bPBRKUXUzCCR9fNBfOTpFCBsLubv8EuOYRarrOqDZxwx9fw2izJM0xviWNLcpihSYDjIHUw63coKFx7hPCOhI5IwFJi/i0A2hu/cfcFRJBvqmpCubCsAYwB2r6i5e60lmTjE97z1zLnB8ezNr1UgQC7Qe8X5Au/AuO0G00tjSXHzz7i9HoPR4ze7Zypcwi/UjVbjf5mfMl3tQXoGAHzk5dYjrHWozHgkvj5lIrfVxV3kLQcJ5kHwbUZXSj/3xMrbd2VsRDDr9lFhVSYjj5mQWV7nLO94J9JxqxgvD5J4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB8544.namprd11.prod.outlook.com (2603:10b6:806:3a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.37; Wed, 16 Jul
 2025 13:54:27 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8901.033; Wed, 16 Jul 2025
 13:54:27 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [walnascar][PATCH] kea: set correct permissions for /var/run/kea
Date: Wed, 16 Jul 2025 21:54:06 +0800
Message-Id: <20250716135406.500666-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0084.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bc::17) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB8544:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e4cbd6-fb85-49cb-0052-08ddc47047aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pGgX36zeUBAkrDMMBS+sGpHMoosZOp/+6x/eY06QMZ8IGLbiJb5lyCOSM18N?=
 =?us-ascii?Q?kwiN36zXoK6KT6p3twI7lwvw1rqXJDjTRRDoBMpQj6Cqcs7KG5n5W+3Ib8U7?=
 =?us-ascii?Q?l5kv5TOXdlKKZDyhJh1WA4RVTKQirtHjclNFjKvbGznc/Z4Oc4b8pMH6iWaC?=
 =?us-ascii?Q?LY/n09bfbdAiwhdxwgphCtR9X0XjJNKXB0HHt2igx0P+s8QvFPr1dWsnOZZX?=
 =?us-ascii?Q?XGynrwBTiRP4tD5/yMtWb1oxbFsMk0z0V2pPK2M2ENiXurnpPDhzxIowcfX6?=
 =?us-ascii?Q?/M3AyzzjYAuJzojajQI1H8tZk19T7BHuFvQdEN/lHb0t7W7K6IMM2Q5IQjBt?=
 =?us-ascii?Q?odohDiTxmZGi6vH9BmbfAxMWKDjuYFB54RcQFlCjMmdsZybiSqYBjEdL3mj+?=
 =?us-ascii?Q?8JrHkTmMcDbVLmfNwGpsvO3cW5IkFMJtdmpjk2h5X+27J9Xk6oCXkJXfXzaW?=
 =?us-ascii?Q?28iOEvOqlckjopEvTFygCTQ3+m/lVCFOWvkZwV4a5SV1rDYOqhgNbUTl1/Zl?=
 =?us-ascii?Q?9oWNcgnJltUoYZaZchFeRTFFEcbtEbT6pyCCHN6FByWpM/wERID2RF0T2W+i?=
 =?us-ascii?Q?BCDMny9DrULuhMPoreF828+aroCBjJY1gad3+9XFVMId6bdMrttu50Y4H2Pl?=
 =?us-ascii?Q?sE/WIAV7kcCzCxfOPdQqQ7mqoDNCzN18sCcT+8RrWB1Fn00hJ1DlzOEnG8cc?=
 =?us-ascii?Q?FWYU0XnVX83xRxrHxhfNzBqDsMItXLD2x9rDV51r+1dJ3bPagTz4tUxV1Ujq?=
 =?us-ascii?Q?imcz5j7Q8RjCcIf2xOX1gRZd/qyeab3q2in8y39Kh8tZvFeb8n1iex2HjNV6?=
 =?us-ascii?Q?6q12MX6Qmi3mXWE7I5LypUu8rqTubx2MADlspNmXwe7UaJBVM6rbJ3+OUjLk?=
 =?us-ascii?Q?GnVmRDudl/74/Fx+hA/ypoImVCYqmtrgZD2jMChHPRlhxChwwVTQYI9b7h+q?=
 =?us-ascii?Q?jhiIGA4cJCSwkVbPyHVcSJdljdSixOHd9Van3i7KxwnL9RyeGLzEDvb5/8lW?=
 =?us-ascii?Q?O9J+4ud7k3dltQyzfMfZIap9Nj+70PCiAerrkIZDyDKmPbCM0GXTcUPLHTYK?=
 =?us-ascii?Q?qr89S+47S4g2AKCD+SC/ujh9As3hXLpAT44D79Sw7cUPMmsYybiJuOEw211d?=
 =?us-ascii?Q?0UIhHNjBtT/EhynO/69qyB3onTMwCbqtv08aRxo347MhgMejZqPWJqWzCwjB?=
 =?us-ascii?Q?qnk7tBHECcIbcs0NmKlDtTJsYbsDRz63z6soOHm9CgoTJIGBUNRZ9cm5u3TM?=
 =?us-ascii?Q?PVODerH7okKHrJsuQXD6GM4fQ+fBBc5WqquTDd52GvFpv6/KpsFKXfRiuqCx?=
 =?us-ascii?Q?QtYPOr7gxvmuLj4GUSo0cNLzSyqOd/grkg87P9rcACRObhAVmKKC7rn16upr?=
 =?us-ascii?Q?/8wzduKBVfpLbJFsSwcr7pRrTRdq7e0+N7Qxq6OcOln+6EdXPbA5aETUG27+?=
 =?us-ascii?Q?01efMFNBzrC2PkAFQTfyQ6yQqVPVEzwXUt/mjBnRn9uL9NRFHI/HEQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aPRw5ZwRHRcQmjq3Xpr19LXNrVN3TP0MhA1m27wK239gJdlBhwtQIhf1D55w?=
 =?us-ascii?Q?NTQNGBx60+h90LJKQIyOH4/2LDZeyR4Bn0GyzXktzu7dFGPUWAoeDuC78804?=
 =?us-ascii?Q?gdqVmcRh7pSznlCLhUfLFcEsfF7t5Cc7m6IexgEOFnB65yU4QPB2Uw+d6yuW?=
 =?us-ascii?Q?SSbZMXIsd/4Uu9r9t6VFtg/B5nnmDyp3yBfkQ4ZsGsgAIDCxZtgZbvyrZA0Y?=
 =?us-ascii?Q?tKhjGWK2WtRREmfM4ZzOhcYLGfLWyn4DRc27w3U07URzFq+VETyrxERNvWXl?=
 =?us-ascii?Q?GViDGwz3i3vnVv9sz4WLQTZOV/c9T4L9+2CIHhRXu12F03YjoKXRO1Qv1/cy?=
 =?us-ascii?Q?5R71wfzBstkTrKPln/QbCBLUQt+HR9a4qwGy1HUsEaPSbxeYekiEa78rCet+?=
 =?us-ascii?Q?IQpyUSMbQTz1z2hUpYQxRV9unv6PvJZLDOcVN79v+MKLHgA6QnvZFj5IH4wv?=
 =?us-ascii?Q?1JQuLiCVpehhpCD7U1iyC32TYyQgBcV5I5r38b8vQeNzgm5NJ6ypVpE6ohNY?=
 =?us-ascii?Q?WgiT3zmYtkdx2j9u7vdaWXg323X+BM9cekGDO419gj+233JAQ0AM6x3XtB7u?=
 =?us-ascii?Q?gORyL8qr9xv0414/Wc40WA4prnLfVUqRrkLU7ieIiflmPwIhmxsZAhCfQPXW?=
 =?us-ascii?Q?BfcmucYITi9zqhggdZMxuptPDQFY4hGPXi0pAcXd6WuS08Cs+eZTubvHDNqP?=
 =?us-ascii?Q?XQRXzHJDOp4ayGBfV5xZlQz6x/q0SBlFtAioyFK7mHchVKhaMBr9xwl4FK/r?=
 =?us-ascii?Q?4V8ynAbEgwBCJycRSu4cm8dGIHWzGJsZ3z8IXz7ENVg+qm46SxL3x4jQB5jB?=
 =?us-ascii?Q?gpGrWe/h9qx2MgVal63TeEebdOm3oNEJWhtF4hY9pqVEBED2j109sjolC9+2?=
 =?us-ascii?Q?0SYPviEtiqRF1phRTaQ4/qGqvxm8C9XEUEce9ejIRUmlXWEn6bV7VvjSISqt?=
 =?us-ascii?Q?Bd65mBRuma8ToG6jOAOj+VpkwQGXJ6WBtFCDd0pGsZETO/gCSFgY5CCXOzUp?=
 =?us-ascii?Q?4OuP+CU81KArptQp9wLfawCgbmmkr0Etel/K2uiET+h2xO345w1J93RHKz7M?=
 =?us-ascii?Q?HPAwojLrGctTXQkjdumIHZ5/L4JfeTf2Z7976HRRI90GmuoGxOpCqjMooSSH?=
 =?us-ascii?Q?2gQheGtBewtNf4+gr2kH/onHQG+iezzi6IdMiZMX2hK+QyDPJDU4kBjU/609?=
 =?us-ascii?Q?UTcUlaVhqWH8mEktxT7PHDr0DaCx7GT5m/434Lt873WyzlCd/zJQclQt6MlM?=
 =?us-ascii?Q?s54SlAp6GGu96+on1j/is2TmUj6tiJl4E++M8TbhL1AoxTpCo653a09k0v36?=
 =?us-ascii?Q?jyOEscd668Td2Nm8wGVUtup8Uj0lEPsj/Z1puQzzw61BmJKrC3I+W+w0iFXD?=
 =?us-ascii?Q?L00G47j02jdDh+sn2pVbjJYbbWtpSY+MYcT9iYHOru9tQJp05FW5mBckahEw?=
 =?us-ascii?Q?WxAsXgQnRuKhY5muX+6DoI78rq0pKsSTciB1TmWzy9tvwtgxQMh4jkWHOB0S?=
 =?us-ascii?Q?xk/ILNwuCWqhZWDmMmX5syqdnAfuhBsVKlrYhJqC33po6IMrdAJQy7ObpivJ?=
 =?us-ascii?Q?Nv8D+x8E+Za/y8/ffmNCu8aZOrYlYohVnp6CpKA+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e4cbd6-fb85-49cb-0052-08ddc47047aa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 13:54:27.6693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXrINLJBNocAbKTegvDhlCk/UN2jck7h/LGHI1Tmu63phaSq8T2SDcGTfc0HBkVJhJ8b7pEX1RiiKOYKl3ouWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8544
X-Proofpoint-ORIG-GUID: mGFo7Fz_Tsymg8TUXny2kWxphItXPuSM
X-Authority-Analysis: v=2.4 cv=L8odQ/T8 c=1 sm=1 tr=0 ts=6877af15 cx=c_pps
 a=6WGvpOQPchLzK5RJBAehJQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=SCo1hh1FAAAA:8 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8 a=mvNiJOInIswJCcDHtC4A:9
 a=nwb-CePKZZm3gL-ai9HY:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: mGFo7Fz_Tsymg8TUXny2kWxphItXPuSM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNSBTYWx0ZWRfXzAxakK9k+3jg
 oPqPLqHW0a+xzyAG1oF1Z2/UuWoiFimvO23gfeAZzSZJYtlRxLG65RGYh65RqCy38IRmzs0MxH2
 wb++pnxihdMo+jyd8JLr+CY1gSd0ujHPnRotekUh9bpAR2x9uZ6DZJoxGosqOQyFAyyjiOJbog3
 5kUioTVW/uLKtv20GcOElZnjB+C4DH2VNIJYm6nWQeHuHhsgJPx///sq4Amgnajx5Ram5Xwq2uY
 xwstPfecdOCNKC8pDHtQPMB6EmpA4QDsmOl2THJ0L91C6wM9SWMc0Xh+DuLx60yfS7KigMAwY1N
 YP5rppMXVZu691ra1k3ZBferQQmgHOjfPPNL65nTiKUIWk3gqYY06hdCMmAd3K0/jK5H2PBFi4w
 DH0x6/0a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 13:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220461

From: Yi Zhao <yi.zhao@eng.windriver.com>

Set the permissions of /var/run/kea to 750 to fix kea server startup
error:

ERROR [kea-dhcp4.dhcp4/445.140718820303936] DHCP4_INIT_FAIL failed to
initialize Kea server: configuration error using file
'/etc/kea/kea-dhcp4.conf': 'socket-name' is invalid: socket
path:/var/run/kea does not exist or does not have permssions = 750

This permission check was introduced by commit[1] in kea 2.6.3.

[1] https://gitlab.isc.org/isc-projects/kea/-/commit/43bba7799f6892f739b4745b35bbeacef3645ad3

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service | 1 +
 meta/recipes-connectivity/kea/files/kea-dhcp4.service     | 1 +
 meta/recipes-connectivity/kea/files/kea-dhcp6.service     | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
index f6059d73cb..aec6446f0e 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
@@ -6,6 +6,7 @@ After=time-sync.target
 
 [Service]
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
+ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
 ExecStart=@SBINDIR@/kea-dhcp-ddns -c @SYSCONFDIR@/kea/kea-dhcp-ddns.conf
 
 [Install]
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4.service b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
index b851ea71c5..a2ed4edb59 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp4.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
@@ -6,6 +6,7 @@ After=time-sync.target
 
 [Service]
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
+ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
 ExecStart=@SBINDIR@/kea-dhcp4 -c @SYSCONFDIR@/kea/kea-dhcp4.conf
 
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6.service b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
index 0f9f0ef8d9..ed6e017d0c 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp6.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
@@ -6,6 +6,7 @@ After=time-sync.target
 
 [Service]
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
+ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
 ExecStart=@SBINDIR@/kea-dhcp6 -c @SYSCONFDIR@/kea/kea-dhcp6.conf
 
-- 
2.34.1


