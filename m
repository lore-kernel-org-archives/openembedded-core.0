Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7F3CD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 09:38:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20881.1780393095871874061
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 02:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NjJ6RMSf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0613cae55c=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6529S4hF1309223
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jun 2026 02:38:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Plmzf2iEbxi9s7OIeDID
	et+UTtzNyGPNzE2t2Akcogk=; b=NjJ6RMSfl+/yp/hinMZXEbbeMfpB4i8EzwKq
	CMoRn/+orGzWtAUGgppbYy8eG82lzxQyC9Y5MTGpT5s8iiYkI2E/A90+g8t6phD+
	XDuKUxOUDHm160/FYxmSFt796rTkBASXW6DCNfHG86fIH5v61Ayws4VWRgbq8Zyi
	0wsqqcFVHHtxBvSN1TEOam+yv4C15jQpypjxjebf9LjpsGzKugDZBJzpvkONVXUy
	TTOnoYPIfk1Y14YWLsatgzCJ26KriE5eBev6GKxTYb5UjGj0EZ4h/r0tmMG2AYsL
	jmD38CVGbBXndeJpmvCJYlAO4AoOJjCfu6bIZmJZoLVvu+fQ8w==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011016.outbound.protection.outlook.com [40.107.208.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efu61v864-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 02:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvslkw4w0V8mrxxnHTitwyOXCujwkHJoo7C0FRnugbSRV5POTWVhl6yp5BX/HM5zghr7MyMWAApJgUmTzN+z+jaBfo+gJd1C3ZfhCh43EM3dzADFu+KXM56wkVRRuossgCfgjMKO9i8J6DPGbRNR7KxntqA2eG2s4zHJqRSJybTf4MWQ5/hHr8pfLJkHu3VBwDNI4UW+UgnM7CNRcpKIHTuk2r9kg2sebi+Yxw21SbLuX3x9KEYzJM4Uo1sP2amEHnCVc3D5XiX/bfgboFpOlWjVLM3SzrkC3zHcDdEE5cjJlhpjqc3q3/t72d8YiP4zdYYSNhufaddqtm9Ul5uKoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Plmzf2iEbxi9s7OIeDIDet+UTtzNyGPNzE2t2Akcogk=;
 b=BVrV1Pih1OsZ6rrKB9ioa6KYcxEsh+39IwL1AiJiVTxvnsQlWtEwpteMigAKUoG1mjg/8DIJ75c/iUAzqrbpESyxBSQLC1RTsSQX4/TCyyIpC7uNS5fWUAVr/cQ9BDKxVFs6NgqGagWZ3vSJjRUaq9P85E4BRTAofHLJAkm7+aqezNNzjip9kA5w0IgqhHwGGUCMkQLtsnNdAk5CnPRWVLJ0bttjYHajuJ5eWinCyxNCuIBmFFFwKgKiCRErtiJJe8/gYnsLUEqrmSIXHz1d4p0sYAF2JcABPn2ice8LNph7TuIhYXvMwhOeoEuvv1wLSBK6sk4JwzvhyLCSTuIegg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by PH7PR11MB7098.namprd11.prod.outlook.com (2603:10b6:510:20d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 09:38:12 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 09:38:12 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2] gnutls: upgrade 3.8.12 -> 3.8.13
Date: Tue,  2 Jun 2026 17:37:54 +0800
Message-Id: <20260602093754.1144287-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::11) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|PH7PR11MB7098:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c4fa992-25c7-4358-4dc3-08dec08aa9db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|6133799003|18002099003|12006099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	2mYyagQ/NmuZMNty9PUNQ1FDu8yCaNdgPfAusYMK85rTaOknHuZtbIzARPTon3TVq0Nfmj44lijnhU/oSIQJ8AP3e1AtEmPI2PWVCzYZAOYZRL98WgOHDyMO7pRQkspK7wQ3waOqlSfJJ2ziqJTNxfR9F873puZxog6GcDo6dwpZ8Ur3hn7m661Xu1LD3eIfRoJVQH/cO0Ld9/k3wcf1qu2644A9+MGyiZWddAE4vPePGpjZWGcJ2ZJSP5WWIpjt/s7RbiafRuufGQEd51LlqJhs+pfJ9Y01V4HTqInhdJJpZerDjnyCFBk84iy+z8yvplRwludhPkHEt3gu6Wa8vxMDR+68szBnSYHjl/VxvairApgQ7AUa6WAZsJE6Mr0i9VHNFrzZ4VlJBxS27kufEjIo0HrvRZ6SUjGW+siODWG2XZb8RwM/0n6Es3QRr2bkBz6rAH4JrsRfteczXNJtWdHRPIzMJ+ADl0L8Ptw4755/OvGWaByEvl0NtqBNmjUJPntojK1Qrd9qAMe/FvsEkanZyK03ybkOSCJj620briHSBEldmiRsj4KVAassDDUs88Spc4u59TScThCgtLeT+P87maAYrzlbQb3lqLfJ7KHV1ELthKIumz5hA5wU4avlWZC15IkJcvHDM8YvpDGuRJnB8R+ScYJdcXNeOHiDkGqwJaGdbVpRQLzGGEeGeeiB6iSTE+3HvXMOZJlXF5kTVkQQx05AnklorFJw5E/lSx/3Puhkh/L/7hCb6wf22BFn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(6133799003)(18002099003)(12006099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NbNCVe+V5jI5f1J/yOALWwDOxHNQJQxFbTz83i0YQXjeF79J4K7sU+WQ8Tc0?=
 =?us-ascii?Q?iqu+y798otANW29JYuYOADXdIGQDwmcTVxFFmEwvwOePQZTVqMAXT/bA86X1?=
 =?us-ascii?Q?82HcZyeL5XjasS801bg/ehVJJEotzwpXrqo+QrvwLVbnG0wqdfwNaAairDwM?=
 =?us-ascii?Q?a9ULiUzEqHVpmY0o7iukSTPPuDuj9lyqzTlIZ/dU5BwbDaUzeVTpbc31QTaa?=
 =?us-ascii?Q?azY2LEbab3i6pxNAVRKt64YaE7LwmRGzgBEFvBCoxs8IpDOFWUsREbNbgXmI?=
 =?us-ascii?Q?MpJdrVN0WuY2m3k90DrhGmEoMwejLHrJM9FTxIrNZ/nQ1KOijaTcSFoJiGrH?=
 =?us-ascii?Q?S+jQRrF7hPFm9SeICe1y7hlg1NNBbGcSSnmdd8zREPKg3bzsONf882M3zW+U?=
 =?us-ascii?Q?ATaIG0CW47hPO4pCcBVlNwBvMLxIikAdfdKgQkfdEzCyz3ArIu4ONlO5hLkg?=
 =?us-ascii?Q?YOJKE51hxFJkVvj/gN5SWbLNdJASPP02yeu2AZxGtMv2JgrX+2DrlRuBm/PM?=
 =?us-ascii?Q?BAeeE358EWLFa6Cmallh3MzGpG3CMnDcnTyIyLJfbA9YCzLZ9GaynLyIzwv4?=
 =?us-ascii?Q?7fhbY3Iyb1+cg7fKPkbCbMEZf1E84ddtyx0SIjSuVsiGvbYREMacHCOPypOW?=
 =?us-ascii?Q?F9cxYPUKSWX+geqsPkbmFNUXf9y1+2wcdQKqdCqpqO1Rx84rHC6//SP6GTgf?=
 =?us-ascii?Q?SZTFXD/9eR05BTsFiaVn/uCJ8k32EFfXg9VnIkFm4hR+hDUK8Vx6rvvSR9oH?=
 =?us-ascii?Q?dvac2UmuLZtGeYrvQcXyKHKMBICU9LAwXtEIr7jzzfYNt+D3DwAXdD4yZLJf?=
 =?us-ascii?Q?sx7/jc8d56OW5TZd3rDacTR1Mo2uEFBeeQh4+15ovYQ31LNl/NtKyXyo3ZfL?=
 =?us-ascii?Q?jBH6+4PwbWmQP06eHN/n89N8O8rqvgBzLSlhHSm3KPspLCJYVu8/m+upkzQ8?=
 =?us-ascii?Q?1OzZZ2RtvcZ077BQ1EgpPsiHXO2BmjlQaPJiwomrE6lDYDecj3cO8m3CDTs8?=
 =?us-ascii?Q?EbxTh7Q78EinY9nuporJ2enmDprWv3s/W54XpE0ivIk1zINFGk265KlIHVxH?=
 =?us-ascii?Q?kfLs0obnD4da1s8AJUtpC7OUtJ1E48qO1wSP2FPFKfIOuFdcF9L/PB/iVfQj?=
 =?us-ascii?Q?AplFGdYXRBZuK1GNsje7QlP/wGLa7uZ5ofmO1swWXNmJgOqRR9e/HQl07F4D?=
 =?us-ascii?Q?8fZmLJJHYJncab1f12rCDvKOY0Q89+k4Q7jHfu8LE4LtewIN4YbYMaHJLV6w?=
 =?us-ascii?Q?vJyZ+6bdpcIaRfWfExTUYiN2DcIbE/siG5JOVREsvHZPOWWUbi1D86564V31?=
 =?us-ascii?Q?c91APxqeMOcgk+pcSO7jdoIszfjgJ0qo16jH+tiHB6EeMkd6AJY0i650r9hZ?=
 =?us-ascii?Q?LFUP9B8k6Dg8tYtsPr6eSUurzQl/ZQiBXn4JVlSqDvhWZst5L7fcjCQ5DN3r?=
 =?us-ascii?Q?XGd7FT9dL4Xu31nqQ7wvD5qbIY7v6Vt+GcO9XDTR5jXDWcvFSYpmk6eN+syt?=
 =?us-ascii?Q?4ueHrTmA1ZkFp25bgJ/XNjHU3NdeXYd/40eUBSKUiUu5ph7n+45ZI3wgQA8N?=
 =?us-ascii?Q?BffqFR3iHoonyJoIzP7/RgcXjkvjcaDsu3J7Ix9QZALVvlqMCsnrrVLcl3bb?=
 =?us-ascii?Q?/DJb8Gh5/wlysGfVkP8uG+RNvEQern3gACFKmb24hY7iwaBpG9R+WeE4t8HO?=
 =?us-ascii?Q?+0mx9g7h263o3+uEagM4futxCEMB7o+kxXPqv7+4Daz0b2yXujmOvdOEE36W?=
 =?us-ascii?Q?8WDotuErGsoU9MUG97BeyJDOFS8Czkg=3D?=
X-Exchange-RoutingPolicyChecked: 
	Hv4b0QEPfSy1lBDnHxPE5puXh+sf6Rz/yiAEOykG0cKF1jnUFIyYrtwy8QP1kF8aIaO9ll/RH5lzNS8Vhh/WDJkkOTpqzFrwnNQ9Vtc69ck2x1sugp7OBbOB8V6F9wAtIlsg2YWw/mBvYmUdxIpg7NewQJRjkqovVExezu9VLSWwDnwvZpmSHd6y+u4d1Cvi9X2GRJzOyyqwrW2fh/+kTvve1gK5lQckq3v8k9UERMBCTAvsDr9LeYxiMilUXd3dXxtzPTPtQicBwhq16AqYqoZQS4JYYNuA1drZld6iaWrNv5k0UVEBE8nLudRXCZhlmA6bmkuqYrLkfX+SJvL9Wg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4fa992-25c7-4358-4dc3-08dec08aa9db
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 09:38:12.3062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3QS+ivvsKqPqEE+fg7lz7D1HHsKDD5Q6Fh9tU/BE/POOKcI70CenmHqW8qnXpvBtQN8z8y609+hhneUmrXDbqq/Sk0qzJk2Z/HAyWJVVn8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7098
X-Proofpoint-ORIG-GUID: hlGTgQwNblOtNjqWFmmfQZII7UQEXlwp
X-Authority-Analysis: v=2.4 cv=PLg/P/qC c=1 sm=1 tr=0 ts=6a1ea487 cx=c_pps
 a=CJt2AWVwLbfAHulDA2arTw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=-qf0PAJrAAAA:20
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=GwUem0DFAAAA:8 a=a_U1oVfrAAAA:8
 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=mDV3o1hIAAAA:8 a=7CQSdrXTAAAA:8 a=wqS88kSR24Wi-3-_RCMA:9
 a=-tuPpFOT1ucyJ02j:21 a=r0dl5i_q2XGqDZkti5dn:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: hlGTgQwNblOtNjqWFmmfQZII7UQEXlwp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA5MCBTYWx0ZWRfX4VMjjNg5UcCM
 kqhpLiFDT3jEZ64e+3e0UNbHUSN8tEaVccQcz+4eGU+oYq7qFvqdZA579ZH+yxp9wQunWZ4os5e
 ZQes705qCIHQyrLWHNX/jJm792/N2C0uFF1j5KDyA5m8xmLMHpOPsgzPsEwI2iM6MTKBqyBPJD6
 1g0cTG7VQT0eJ/0LVBegjYGfOJaJE14zQIlFPTcBcj+t5hHz8gPOtIeW0+WZS8xo4pPLAEtLfgM
 2FUQielgnxzxLDb5bRP5pRvOMUGfOawdwNmAkj45yF1tdyvlCvPb52hj8zaQzTuYM6wo2Tjg766
 uGm1iaxXRnc/09OWOMdRZYZ0OVHTxRwCGMSYmK7gIZ/Mx+F4DBu6KmJtktV32+rhsDlIvDScBWV
 u47qmU7AzJYNDQEtuifrErBd/AvnORPzHua/DI9USMLaYjXEh8egB1t+4mfr9MSocIzg0QEap5o
 TRRjhL7VUixYMJqSgfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 09:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238024

From: Peter Marko <peter.marko@siemens.com>

Solves follow cves:
CVE: CVE-2026-33846
CVE: CVE-2026-42009
CVE: CVE-2026-33845
CVE: CVE-2026-42010
CVE: CVE-2026-3833
CVE: CVE-2026-42011
CVE: CVE-2026-42012
CVE: CVE-2026-42013
CVE: CVE-2026-42014
CVE: CVE-2026-5260
CVE: CVE-2026-42015
CVE: CVE-2026-3832
CVE: CVE-2026-5419

Release notes: [1]

Rebase patches and drop patch included in this release.
Add patches to fix linking with musl libc.
Increase memory needed to successfully run test key-openssl.
Drop code for previous release tarball problem.

[1] https://github.com/gnutls/gnutls/blob/3.8.13/NEWS

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(master rev: 1193b0778a0f81bd75f7ec6f8f44fa44cf4b8f5e)
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 meta/recipes-core/images/core-image-ptest.bb  |  1 +
 ...ts-mini-dtls-framents-link-to-gnulib.patch | 25 +++++++++++
 ...ust-list-fault-fix-issues-in-linking.patch | 31 ++++++++++++++
 .../gnutls/gnutls/Add-ptest-support.patch     |  4 +-
 meta/recipes-support/gnutls/gnutls/c99.patch  | 41 -------------------
 .../{gnutls_3.8.12.bb => gnutls_3.8.13.bb}    |  9 ++--
 6 files changed, 62 insertions(+), 49 deletions(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/c99.patch
 rename meta/recipes-support/gnutls/{gnutls_3.8.12.bb => gnutls_3.8.13.bb} (93%)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index c08561296fe4..008b5770a898 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -39,6 +39,7 @@ QB_MEM:virtclass-mcextend-python3 = "-m 2048"
 QB_MEM:virtclass-mcextend-python3-cryptography = "-m 5100"
 QB_MEM:virtclass-mcextend-python3-numpy = "-m 4096"
 QB_MEM:virtclass-mcextend-tcl = "-m 5100"
+QB_MEM:virtclass-mcextend-gnutls = "-m 1536"
 
 TEST_SUITES = "ping ssh parselogs ptest"
 
diff --git a/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch b/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch
new file mode 100644
index 000000000000..7f999c4b22ec
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch
@@ -0,0 +1,25 @@
+From 68b2fb63c8df61d1480121a859f8c955f4910c01 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Thu, 30 Apr 2026 13:08:01 +0200
+Subject: [PATCH] tests/mini-dtls-framents: link to gnulib
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+Upstream-Status: Backport [https://github.com/gnutls/gnutls/commit/68b2fb63c8df61d1480121a859f8c955f4910c01]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tests/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index f8797964d..1b27df751 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -524,6 +524,7 @@ pathbuf_CPPFLAGS = $(AM_CPPFLAGS) \
+ mini_dtls_fragments_CPPFLAGS = $(AM_CPPFLAGS) \
+ 	-I$(top_srcdir)/gl	\
+ 	-I$(top_builddir)/gl
++mini_dtls_fragments_LDADD = $(LDADD) ../gl/libgnu.la
+ 
+ if ENABLE_PKCS11
+ if !WINDOWS
diff --git a/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch b/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch
new file mode 100644
index 000000000000..b15a05d5b634
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch
@@ -0,0 +1,31 @@
+From 9c573a2a0e7473ab79c43a6d3ecb0ab68ce896dc Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Thu, 7 May 2026 09:42:09 +0900
+Subject: [PATCH] tests/pkcs11/trust-list-fault: fix issues in linking
+
+This fixes the use of automake variables and also adds the linked mock
+library in .gitignore.
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+Upstream-Status: Backport [https://github.com/gnutls/gnutls/commit/9c573a2a0e7473ab79c43a6d3ecb0ab68ce896dc]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tests/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 1b27df751..f6a60a32b 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -540,8 +540,8 @@ pkcs11_os_locking_ok_DEPENDENCIES = libpkcs11mock4.la libutils.la
+ pkcs11_os_locking_ok_LDADD = $(LDADD) $(LIBDL)
+ pkcs11_long_label_DEPENDENCIES = libpkcs11mock4.la libutils.la
+ pkcs11_long_label_LDADD = $(LDADD) $(LIBDL)
+-pkcs11_trust_fault_DEPENDENCIES = libpkcs11mock5.la libutils.la
+-pkcs11_trust_fault_LDADD = $(LDADD) $(LIBDL)
++pkcs11_trust_list_fault_DEPENDENCIES = libpkcs11mock5.la libutils.la
++pkcs11_trust_list_fault_LDADD = $(LDADD) $(LIBDL)
+ endif
+ endif
+ 
diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
index 398c0464e0f3..8c867a5a4008 100644
--- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
@@ -29,7 +29,7 @@ diff --git a/configure.ac b/configure.ac
 index 1744813..efb9e34 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1448,6 +1448,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
+@@ -1413,6 +1413,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
  
  AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" = "yes")
  
@@ -42,7 +42,7 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am
 index 189d068..8430b05 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -721,6 +721,12 @@ SH_LOG_COMPILER = $(SHELL)
+@@ -745,6 +745,12 @@ SH_LOG_COMPILER = $(SHELL)
  AM_VALGRINDFLAGS = --suppressions=$(srcdir)/suppressions.valgrind
  LOG_COMPILER = $(LOG_VALGRIND)
  
diff --git a/meta/recipes-support/gnutls/gnutls/c99.patch b/meta/recipes-support/gnutls/gnutls/c99.patch
deleted file mode 100644
index 3f41241deba0..000000000000
--- a/meta/recipes-support/gnutls/gnutls/c99.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 203d8f2187bb7f483290e0f8b7b48b152b1d027f Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Thu, 5 Mar 2026 11:33:57 +0000
-Subject: [PATCH] configure: make the C99 detection more resiliant
-
-autoconf 2.73 will default to C23 by default, which means that the >C99
-detection logic in configure.ac will fail because it only handles c11
-and c99.
-
-Instead of adding c23 to the list and then breaking again in the future,
-flip the logic around (as suggested by Zack Weinberg) and check
-explicitly for just c89.
-
-Closes #1806.
-
-Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/merge_requests/2081]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 740fb6339..c708d8f5e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -54,9 +54,9 @@ AC_USE_SYSTEM_EXTENSIONS
- # Require C99 support
- #
- AS_CASE([$ac_prog_cc_stdc],
--  [c11 | c99], [AC_DEFINE([C99_MACROS], 1, [C99 macros are supported])],
--  [AC_MSG_WARN([[Compiler does not support C99. It may not be able to compile the project.]])]
--)
-+  [c89],
-+  [AC_MSG_WARN([[Compiler does not support C99. It may not be able to compile the project.]])],
-+  [AC_DEFINE([C99_MACROS], 1, [C99 macros are supported])])
- 
- AM_CONDITIONAL(CROSS_COMPILING, test "$cross_compiling" = yes)
- 
--- 
-2.43.0
-
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
similarity index 93%
rename from meta/recipes-support/gnutls/gnutls_3.8.12.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.13.bb
index 721842801229..78b88005305a 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
@@ -23,10 +23,11 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
            file://run-ptest \
            file://Add-ptest-support.patch \
-           file://c99.patch \
+           file://0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch \
+           file://0001-tests-mini-dtls-framents-link-to-gnulib.patch \
            "
 
-SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"
+SRC_URI[sha256sum] = "ffed8ec1bf09c2426d4f14aae377de4753b53e537d685e604e99a8b16ca9c97e"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
@@ -63,10 +64,6 @@ do_configure:prepend() {
 	for dir in . lib; do
 		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
 	done
-
-	# remove on next upgrade when release tarball gets fixed
-	# https://gitlab.com/gnutls/gnutls/-/issues/1797
-	cp -p ${S}/doc/stamp_enums ${S}/doc/stamp_error_codes
 }
 
 do_compile_ptest() {
-- 
2.34.1


