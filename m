Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C26C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 13:54:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12424.1744984482396382932
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Apr 2025 06:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6203b7563d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IAoAgW010150
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 13:54:41 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 461u2mc0mm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 13:54:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vafNQD2uwKhtTylXmJE3gOGuUF3rjfabAex697mBF25ZJ5sP65iZTBOGnS4E8vdmp0YLYE3SWU6s9MES68d/d9Iiq4FtPE2JmWveaSb51q79+DRH0cPPOcYJY0Stx1fueUfkWiENv9hGDrEc/NmKJsDOKrkhVJKe6Ddqk5vSSy4Uc/D3T2f4bK27/1DkqcxhUfHrj449GM89DROhPJNUbUuSkrpT1dTXn1vYErIVCRxp2AZF71KaopcCip/4seSnje2yK8WnXpGGn8qxv2+bSjMjnOiN/ouZIt1zS4/4no8yylxtcPGAroNQZ930q2chdPDAM/BhbTipAOuw9/17nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4lK8X9PGpN/8W4beeTrKjWdmOrh/vlulfhV2/1olJk=;
 b=SxMBx0Rb0XB1BE4za8JQZh7/usSjveM/h+1NgACdiBW6txNKQOjc3ffyfMN1ssNHpvAPI94Gky8YJCewJxefLbKoaTf12e1cp4woFOigOZC6PANRzktoB9/RmkyFPyl3llkpoX3G8dRLX7K9ZqPRY+u4Htx3euJp8ZFBwWiMqwYHwqL024dkTleCIdidhgWcb0IOojX0sc0DpHwff2ci9h8Y++hOeuHf8HzXLb1wvPbZu01znaq8DRi2ho0UJaaMKOkc7UzPUPhIcwoB1tyQR4cc0MkMfTHHyCPhYg+r3yH2vQnbsZtbm7a6Q5jwrQS9dFvjXE3FF4HFyfYBuHULeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 BY1PR11MB7984.namprd11.prod.outlook.com (2603:10b6:a03:531::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 13:54:38 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8655.025; Fri, 18 Apr 2025
 13:54:38 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sign_rpm.bbclass: fix variable assignment whitespace
Date: Fri, 18 Apr 2025 21:54:24 +0800
Message-Id: <20250418135424.3471099-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0175.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::14) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|BY1PR11MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: c127934f-7ee9-4699-45ec-08dd7e808f14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YtgO39Smnm9xk3QGvjTs3Z6Th0bAstNfp7JObDSFkz48Aaht0EFSsZtX2ZTy?=
 =?us-ascii?Q?VoX2PnhYfJFMs0vj6DYYQhSxi4xrPiMc85055TuVzU/x5l6CxddvLreF4E9U?=
 =?us-ascii?Q?r6jOgYYX8MDQztwt2qlP/CrGiFQSBv6ED0G19TcZ0oefeWEFDIztXDQRQAIX?=
 =?us-ascii?Q?y7okydS768BgR5jfZ7nyv5U7RsTQLFk4Sr37F/oUZ5F9GQM8/i7OGSaQ1Eel?=
 =?us-ascii?Q?8H7y9aIbq8ZZnUhgioX/8p32UmnbyimAheE9A+RZsqztVmrm4jD3vsidEupZ?=
 =?us-ascii?Q?QXpVdy309/hjrkAIzGbMZwbmChkhBDakc2fEEgKJUSJ9kG3QSBB1WDZzGV3i?=
 =?us-ascii?Q?6tiMX+jB7JC5lnhLmMY3ORA1EEyH8NcnDR+UBv/IZTXKgtPlNupHgyM1xjGz?=
 =?us-ascii?Q?uoh0SwXa+9kzCFTsSoI9jyj1DoFYQdHlh/GFVAKiL71TYPqXcKwmWUA+btcO?=
 =?us-ascii?Q?cslK9Nv7e2Mu7l5GjYg7LW1dMu6oHAGBVw7i8uLAjBlTOXQVNWO/jOudn7vE?=
 =?us-ascii?Q?GfaQxWl5Lxz/6pzcSd6cdoj2+rOc8Z41tnT9Cxah9Gl1HAvDHqtzvSerKwWb?=
 =?us-ascii?Q?Wqmq7sHTU/lHmFnHgT6zzhe4xsC2BAqr2jclKdRTYtlPrqm4Cdr7YtMdKMUV?=
 =?us-ascii?Q?p67M15lOaNroTHzQEKCZcX0IsNxvgBBZt+lcss46CoRqN+nUn8NT/mhy9/j4?=
 =?us-ascii?Q?mMDs6Lo4UJCVX1cd9ZTgnKy4i6hUh1rr8gL6hYI3Dxlh22C4s9hieREt9dcu?=
 =?us-ascii?Q?2Vgo6LhS2DUxaZq8c2KiQFWo7GHJObqXdjYaZenxMK5H+rya07dpi9Y5+lYF?=
 =?us-ascii?Q?uxZnA3nGgsi8TG1PbXQcL54nG27MaCL5YxtieYIgk5iKX8C9bsmbFhGR8yCm?=
 =?us-ascii?Q?h+GedpW2IdUcheAENHLXXsOwkSTOtbmfMBeufJCkTbn0vYnGB8Rxvx3MY9jc?=
 =?us-ascii?Q?lUsxrPjsFA3w+sIM5N4+axRg0uI1I3GNt00W+v/gNsVh6oIqGI8+AC2Mpc5E?=
 =?us-ascii?Q?BeXlg2DLcwuy4jFsNiLdXXVPOqX2AlUxaOP8zIxXr5T8y2hd1QkJ/mId6qlj?=
 =?us-ascii?Q?b44bPQ2hogAZlETznxsvw4F/o+sljJfoCd1ghTacKIXLJIT6dHM3TbLtmyQJ?=
 =?us-ascii?Q?ixzG0XiJcLS/XfviQ+ImQgdY/ZIuSYZXboxV3k5IfzO4BMfNn6VTa+n9oyTs?=
 =?us-ascii?Q?6hKg9OHQToENx6qsXgUb+dh0OHj6JtxxfjKeU8955QwYl1E14g+vDajoig4G?=
 =?us-ascii?Q?WzTOr2YHiRXNyuN+8rBhOnTV7gnsFqoFkvxyrNu/Op93IF+No0lFokbWdQcT?=
 =?us-ascii?Q?K30c1U+9re6mx2KP4pOx1rUI44AkAphTSiDghC7wc00MjQpDwH1btj4P0f9e?=
 =?us-ascii?Q?OtxUnf6ZwslRBehr7FTEmyKNL/OOYUpEtz0OwMXj7BKmm0h5F8gMGgEdIil1?=
 =?us-ascii?Q?P3CBrE+MVO1q+/7GCmAjWMbzL3zonKXm3fYi5R4Te4rF0ps4zV1TOg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rXEmS8s+dq/ppYh7sQDoBGelIoixTgagefaFSRUX4XOaMBEi4Rq4uRz8QDGd?=
 =?us-ascii?Q?DYrZwIJOVFdosoc6XyPJv9xnXGPUNUeQCtzRa8a3hGYXHbEMmdtYdTgE3XrK?=
 =?us-ascii?Q?drxWv8+gz0nL9J0e4k3mCN2Mrza/8TXYvCpSrugJvkVoHi2rptJqA7L4ll1P?=
 =?us-ascii?Q?a6KW3EBfPw7erDiCYN6uOglO9nBfH6/aCQzrJoaeofEgaE8BQ9I2xCstiPn3?=
 =?us-ascii?Q?dcx9DFGXCj++k4PgTdDN9/2Neblb3WO9WDhoypj/Y7cFdL5qfj9duTqifD8L?=
 =?us-ascii?Q?S1fZVAXZOmUc+l1KnId+kHqFvpbxjNfNUqknf4I+dpWdNCJYqSgmqBhLdcez?=
 =?us-ascii?Q?FGpfbIOYw17OW47BjH3yJFI/+GtCjw0egpY1mXQgOgaMQ/Ihx4kwevd+C3nY?=
 =?us-ascii?Q?voLuiPiHusr174kAO1NRbpvDTh4h8VGLKso/XnQTDNuUdMApzY4ERxh63Qlv?=
 =?us-ascii?Q?NBjIklnp3Q+7OzW+3I5lJrUgIEKC1Y7fkwxGtUu1UV/cBNE+dZa9rkVMor5P?=
 =?us-ascii?Q?jYpgjt6PbR5IV8vX+Omal+jchgqZquEVybFEeS9rwWFcLnhXyWBra96y90gy?=
 =?us-ascii?Q?YFbZGLDsBIYy8k2J0xPrYrtAJ4SQ7vpB8b09Zb+AaDiJpWHJGQo2D1Oo/HRr?=
 =?us-ascii?Q?2kgmAhkifZPkLUF9yc57+2zFnnbLeM1Qb6huudAZKcWDOBX40Irrll6lb+Hv?=
 =?us-ascii?Q?XAxqEhMVpVVrPVMz/dYEesiKx+b5s5gxPh6Ypxpbx4GkqMCQPC/ncBGWFhS7?=
 =?us-ascii?Q?tcY6ewlwORWFDEYRwAizludvmJmxSpNZkoI6L//3sMLXBvj3ktcL/Nb3x7V+?=
 =?us-ascii?Q?2s0B/qd++xtgCkfxJOK+G8T/MKso3lh2d7aiPhp0CEb3a5C+Trh13o+X+5+m?=
 =?us-ascii?Q?uj33xil0z5SjiYGywQe/FOq0IxnVS3V9z7v35Mis+mVPgqRGHTAWqcDYDU1m?=
 =?us-ascii?Q?cesJOX9KybyLkKJOCiV8qBjjqTWKP0j9PdEWEu//56IGEUPkgjNNruZ+yGge?=
 =?us-ascii?Q?GKV5e03JJQxKexzb4nqtlcdn6Tr4q8lBGCLjTw/zBMQNJNbm2G/ybYpZardj?=
 =?us-ascii?Q?GuZyJ6S6IGpcJE6VBSrtz9BXvwMR9/4HF4Ne3cRIn5EnxUek/XTHDDgyb4qm?=
 =?us-ascii?Q?JA/vrDq0XuPhUv6T6FJzo3VGCkdU8i4O/YcdES3n3b7SEKORxQ9TEex0Ul1j?=
 =?us-ascii?Q?HtSXuVk6uWkA8zw0R8Ywv2LanXoXKGeUr76KwXccv1jt6WttXEqDkHowULpz?=
 =?us-ascii?Q?+Hg0/IRp3W9XjAI7ID1xOF/BPFyYyP72l9LnZXsQXe7J6rY9sqHbpSccNKPu?=
 =?us-ascii?Q?U/DLxZC/Dn+yYwE23Kh6sYErxYjSTdx3Q3J7QfHPX0XQmhA7G1IPlBB9zVPF?=
 =?us-ascii?Q?cl+IvJ8jbWvQHRHBMgW6xr5jPn981kzimqqrqAi/qSo0ebzyqSNx0MfebhXM?=
 =?us-ascii?Q?I40COwoWTyPDxGx+94j8Qe6YTEjDJgRp35ltVOfxciPfqVAwuwTv4YZQKhn5?=
 =?us-ascii?Q?cerZrPxs2mS6xSA0pEIA8GctJHQAeuiqg7jgBdDNs0ynMACF7YmxvkC880HB?=
 =?us-ascii?Q?UCyU1uQ1FXtTUYw1d70yltnYpzW6mVZsOW/EkBc6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c127934f-7ee9-4699-45ec-08dd7e808f14
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 13:54:38.0737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vgrDvZByNi9Z091DLh8dp78UFc82Z7S667q+G/to5cYpLY+N9TLQl+zV/VcINF5MbtogYw+Xp3iJ/KvW7nN7Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7984
X-Proofpoint-ORIG-GUID: 7_fbP3wS-tEwhmRGDMBdIbRL1lXVxW7q
X-Proofpoint-GUID: 7_fbP3wS-tEwhmRGDMBdIbRL1lXVxW7q
X-Authority-Analysis: v=2.4 cv=BaLY0qt2 c=1 sm=1 tr=0 ts=680259a1 cx=c_pps a=hHPfuxNGWHHq0fQgDGst2w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=UlsvRmSpbSNNpWsD8ikA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=693
 mlxscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504180102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 13:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215132

Fixes:
WARNING: meta/classes/sign_rpm.bbclass:36 has a lack of whitespace
         around the assignment: 'RPM_SIGN_PACKAGES='1''

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/classes/sign_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index ee0c4808fa..b5b21b0db1 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -33,7 +33,7 @@
 
 inherit sanity
 
-RPM_SIGN_PACKAGES='1'
+RPM_SIGN_PACKAGES = '1'
 RPM_SIGN_FILES ?= '0'
 RPM_GPG_BACKEND ?= 'local'
 # SHA-256 is used by default
-- 
2.34.1


