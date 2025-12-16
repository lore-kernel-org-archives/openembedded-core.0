Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7D4D5CC89
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:08:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18309.1765876131133129241
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 01:08:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=W6Y4bvBN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=444573d0be=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG5aa9B135687
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=cMS7HtNru
	Y4nrcFaAHbKn6KcpqLWC5Q6574k3+R3nAc=; b=W6Y4bvBN6j+EJJFeA8afcQ2W2
	yA6X+i5b8WO8YUfq7wqE6Ltw84qrRsGTA2CLwCMzapTi6/E8G5YucYN9WQK0cJoe
	R1MijSjqoVBc7UOJpvwkR9c2GrQV1/nGe9VLko4dZqyctqJQuUw1U/UXmhkMHhKf
	5Xo2rBITNq7hrypHbnvAQ/5Ma51gvumidYqbghKT3Svf3pZ0VSbb24MG2P/5Clmn
	U99JXVGmit51oSU2uh+JozH7S/p0akHlUHsReis6+GD+UZmlTYrpMn9U8PWEDEL2
	iD8s0DwD6nGRyuHqhp8e6eDgMqkLdG8yGfV3sHrxbKii0hN70X7DKnHOeCxyA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010021.outbound.protection.outlook.com [52.101.85.21])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b0y48avjn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:08:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=klv3ZrRZSo3PUfGWhcRbMvwz4lMH9ljN21Y9oKBZJWW4+xBa+t3DgC4kA2pA7BIZ2SVOP2182f0e3gngw12cdzSqXcNQQIMjW81R/WUHONjc5WH/u5go5p4G/JxuHpuP4EHHYiM74OsXHKAcfAX4b1ratoWOd1ZKZBLQVDfBsfIJboQy9YwJqaeG4P56+HHldIIYgrZmSyhFm3S2O6i4WS9d9u6U4rGpYqYmnvrPye2Ey1avWHif1l/rIzz82mLhd7CMbE+R2TzSmcYDX2nzyV2rNcvywaY+z6EW89QB6aTUt8Iz5JxR8hR/4m79kYSypfy8d5ycK1JzQQ90/X+RKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMS7HtNruY4nrcFaAHbKn6KcpqLWC5Q6574k3+R3nAc=;
 b=JqLTt0dGVZnUZrAwlmDynNypY3Lt8ADBFQ23zAy1pKQVWyiyGcC1CJ0u3g3ibWkkyQHuXv8CDdKx4VpzwD7d5TwuF4ZAfwo3/xCB8VFS2ctgMRinZEij8cQCt/Rd+KmpWyZg//verblBzhexPdogxDsIlkTLy68mG77OI9w1AU6W2kDN5ALf8E4EPYKlw/VcC17yXoIgH5Axbx7Sy9xq7XOu6hdqnxOmR40XAwjhQQxD7NqEK/JvR6GIvY3hp6lY3nZd4kVZb+kcSIkJrR3//A3QPlq1Y19qpQjSQovbpkhZyqngx/xlUzOKDlu5SvUXLsklJV0Fk4UUquGc4f8a6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA3PR11MB7463.namprd11.prod.outlook.com (2603:10b6:806:304::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 09:08:47 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 09:08:47 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sunilkumar.Dora@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [scarthgap][PATCH] binutils: Fix CVE-2025-11494
Date: Tue, 16 Dec 2025 01:08:35 -0800
Message-ID: <20251216090835.4184711-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0207.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::32) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA3PR11MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ce3c6a-9e21-4e11-1c1b-08de3c82b897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5TDw4RelZB1TaY05WDLfaqr29wXgIQvBxpEsgRwsxRxsnr5FgiHgF2AOqf3r?=
 =?us-ascii?Q?OuZv9Y+h53Pq4O2Xj35XlhYO6Sjmr8TDYiEjXqNcq9+xQieUt3WnYjSn8Y0m?=
 =?us-ascii?Q?xLYmXqYyHKokxh5iiyQDijzFIejOXj+sKuRbz6orh3/FG3fyh/YrH72tgJqj?=
 =?us-ascii?Q?ufG81G/NmmmMHwG/RnZ4DCFiXsLQWnzSv6SurQ//+hUFRaNkHSfwuTf4YXe9?=
 =?us-ascii?Q?X2fqV434uPUUq7gkce8yTzHOz9dLIJjClSV/wV6E4zKW0NlG6f1QzAMufKPC?=
 =?us-ascii?Q?KsAL1i8B8qTeA6lwGY2KKx4Wvisg6JCKNbMiz9zRWvb4YSSUH3k9wJm8W97C?=
 =?us-ascii?Q?FUNE5Ra3Jv+86aQBQHE02vKxhU7TfqszzLmSRIXeOtII3Ejy9f8agcj+UnSA?=
 =?us-ascii?Q?X+nD6WsyfMAABFT+hWTdy4cC+EHhb5sh1ty98GURiEbglSD7IhFd9wzjg1/7?=
 =?us-ascii?Q?+6HTjsbJyHWCWcT0sfj9nJZNv4XrYgpiBeFYpqREJCqlFAYJ657hqxdhVeeA?=
 =?us-ascii?Q?yMCtUvez3ZVN5akcE2durAwv1xdJuHAyyW+glVFU0ZaUPcO7F0IgQP9a7n15?=
 =?us-ascii?Q?nIQPzPWgTzlRJG3UoytS01J6QADgBAhSf/3wVsYHZ/ekPYmDb8/0nfwLpQVH?=
 =?us-ascii?Q?Oi2Vs/Mjh1mRuAvcCvq7MWkskdmAfXPQPK/2AxSJufggPpnM3FokzrbEJ0BY?=
 =?us-ascii?Q?J5JZ+je+qdNLpHjqE3W10CM22yeROh4acGkOaJoW7iPEZS6oMi617aIile/7?=
 =?us-ascii?Q?cNeOqeRAIWpqz3R9Zswcz0aA8iaeJznpgqB3CRaxSFmNQTMRjY3DaRtZMt6+?=
 =?us-ascii?Q?dwqlFEmeuuKhTworEJsYb7IZvdKkQckgkpiHJ0fxlYk2OC3u5DDouisMGgKO?=
 =?us-ascii?Q?komxxCQ85vB1oykSYCmi+gCG522nqUJ4r5dsIz1NxcwMuInmQczkW/M5cE/Y?=
 =?us-ascii?Q?eeVjwqY7cMKUQPPTHb9OYPMgkvx/zOIAti15PQCoihuFUkmmbccdbXiyzU37?=
 =?us-ascii?Q?LwZapPqoH6Mjg7anUwZ3JznSDyzrfv2aNpA3+BxMMuCcRUzI2WRPYcgBa44Z?=
 =?us-ascii?Q?R+fnDqD1gx3SFCrXZUkShunLUckYkwsrFuBqEbpvBIYWXDXPlvB0XIRMSkny?=
 =?us-ascii?Q?CKC7yyioVtCAN9LijbhaKAQrGziE7fDeXSsLGV9ZxmEkXxa5mbUgE5Rq67bV?=
 =?us-ascii?Q?JrNuOqKz/MMLdtU4oKCcb8qNQJpqpd07xjnlzlGSAqHPEPC8WKekW4PaBnsc?=
 =?us-ascii?Q?8mjPb6ex3gbMYp5ValTZnqAyW3k4neZTxr1BELczrlcEvtnTmm9UYovdkyAg?=
 =?us-ascii?Q?C0E+8s6XjFrHRQndduTzlQIlC411DTflqd73fUYc9hytS0OWewA3LdLftCfU?=
 =?us-ascii?Q?pOR2VEb4k1TwpwoS7JM6e73SK1zmXoGk/DHHgWuxFnWzjML8dIXnb4l2SI1C?=
 =?us-ascii?Q?0MqBEkORStmorf7Q4M4URQWKRAfaj8lIoHNAjoR7BEEoKiez8MursQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nGt86zoaP+8i00RHEvCX9WCO3uxsPQy+hVa8Bg/Kh/QUhnMlwAAM3Ea/jiun?=
 =?us-ascii?Q?wkffvNK7EqOwF/PuJAD2+4nbNHoxaSP3PYKldwwCQ7RL4B+nnO7ZslJWehr7?=
 =?us-ascii?Q?LS+5dj6HSDh5t+rYf0InxqbxhVmCn/ds0wtB9T/dJrZ2oZStADUHHaSMqQPN?=
 =?us-ascii?Q?jvzYEUuNjJlFOFn5u+ptj+4WL+V+m+DCtzEIZVnNNFb9VSei0oJU2m0mQdlb?=
 =?us-ascii?Q?+AeOFIO1icMI/uFhGNjhs50FAH+AjmB3RnDp5pPBhMtwgg3YKPiSBuizaFQz?=
 =?us-ascii?Q?2b4rPsOvlC7HrX9c1RG+nIIAVOD6eBGQxiPeNotg66CiuMkjREMgP978foi9?=
 =?us-ascii?Q?nxWGWipQyL+8H9TAMTxzGodXChH7tc6KS2Ldu5Bflvk1Hzc0Q3o/lxYW5TKN?=
 =?us-ascii?Q?1Pwvd3gMXjb6VcRrTj2YW50f8ZdVb7Ru6TSRo9oHZy8vyfAfz5iyAeLBE3PZ?=
 =?us-ascii?Q?14N202pX/tlA0pNpEM4Ue6t/q4T2f7atKm12ib064I8t9D+JHGQ0FTABXqey?=
 =?us-ascii?Q?kjSfPwpkkWWaYVBQNzgrshNd+5AjkTSX4FGITIwndeWNM6pyOFzeB2fYiZ6Q?=
 =?us-ascii?Q?gwd0+4G82NLSQ/TnuJgPCrNLeGxIyTUDI32BlSwI9elXFCn3PRCUart+iwKw?=
 =?us-ascii?Q?6UmQOojezF46Eu80ofY4bBbauuS/WmUa1FE+5mG2Vexr2FX1lLvhMDqj5Zas?=
 =?us-ascii?Q?4UZtKmUL5gCARS9K9SqQK22oWiqPkOsyme42bZMjS9KtwVkOcUc1fVoSqZUg?=
 =?us-ascii?Q?r3EoVry+rijI8nCySUTjK4BAhltoDev66azjElyoJjzo4IPCfGgLSvJLVwBN?=
 =?us-ascii?Q?yeBogI+BNBZ64bfGNZ4wra0rnq9inRW9ps4DIecdadClRsH15ZnI2LASswiw?=
 =?us-ascii?Q?hmYwc6k3clBJcteZMiUaCUb82tuVKKI36VNIlF/gb1QrlIzJJvdYSIPQn05s?=
 =?us-ascii?Q?jLtwYvyIRxi5eu1HlCeKdnDC/+Q+Yu2Q5PenRZQ49wZP8g13lcCto6cgfKVY?=
 =?us-ascii?Q?WUz2AcF8JY7Z77Nq7K6MzqwVFNAttLn9loLNYmVJp6P0+j6pRKYhBwEj5Pzq?=
 =?us-ascii?Q?e/e+YIvCGa9vy+pRvjxLp69DFZHyvvq2rwuky3fYU4RQTZB4fD8Bcilz+boK?=
 =?us-ascii?Q?i6br6uPWWhk1IRW2QoEDbEQ/3yn3brQBWouBqWuEgGtIO0LWylXFWMDLKa6V?=
 =?us-ascii?Q?1Z0fNhG34V11RbipU/v4x8dQIA+A5X3zfldEmRV+IHNnqKCxM87rvfqJ5wl4?=
 =?us-ascii?Q?tx6ooAOMPo8jF8eNJttfvMMH8rwmpTpGT5tubuhcL3B6PSSTQ0V/P+8WBgrQ?=
 =?us-ascii?Q?xNFhiodTGG+3j9PqtuSb5IHtqcGWVvgcF6cvvhcc3EHzNKoiPQYnlSeBJjl2?=
 =?us-ascii?Q?Gv+H45BiFeClvTIezKkrhFD1htn++Jy1C6uPAs/DKaqxGGfrLLtyiL6SgsCK?=
 =?us-ascii?Q?bYE1E+Gjdl88ideyN/K0JQq352gDkuCNvjb4BDKMtseqvHLX8X6nya/uralW?=
 =?us-ascii?Q?1GJCz1glxoHM5HfPqrFWwkhhspfyRrCUlkK2N4JyjWBgk5aLjE1xA5MaLBlD?=
 =?us-ascii?Q?FPvXzlVEW5DlcysnFdIAvihJ1N5YpbBDrh4jv1EoSpFt1ihJS8f1vlawVhWB?=
 =?us-ascii?Q?GIz4rK89n291Ma4LXWGDOpY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ce3c6a-9e21-4e11-1c1b-08de3c82b897
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 09:08:47.4956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWUAGfXWvleo6PwLaTfD6iIpt+T0A7LCtAp9AScbkWsrhFbT+wrmXI0usJkOjEY23OAMZUpvKckJiZsTIlIcykZsB2xvyy5pK277IXKlB/d12JcbiKeoheYaCgthjX/t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7463
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA3NiBTYWx0ZWRfXwRybxDDx6p7s
 l62vPRwcqRApciB6NBj3s4f0kAaJRQtsUPsoEwr2oTRJAvw0c12XE0Zx7NLHxYng/O6D26MrUms
 XKOKIlikD/Xy5UbNCDGPvtUJ6VDwIbYTcBUdiyEOnLYSGJDFhYhK5V7SUEgUooQr1mdqymLJZAm
 DhIggBYaXPRHCu+Ljoey9VD3zGoDliBHlPd1wOlBRGRUbcPsBskRXJVUJdfxBymNV6NGq7UaHS7
 hJUEe6A7+V/c5y9AGQKfwT90G9okulzgOGtTD1QvA5G/Z2iIz0vH7EVAObuTKEW9Q6XCsTzb1jA
 2/OgDnvfcxYfbNP7zKIKQANsLC4gHFxVjgX47pwneb7BeHM3/4Gk01P+Q/yVgc47nPpWqHzw5kk
 qSeLStvIDMy1SeHs+IQIkAUBNapzGg==
X-Proofpoint-GUID: TI-2IIdvInYG1Is4iO0qfp6GqpYTeiai
X-Proofpoint-ORIG-GUID: TI-2IIdvInYG1Is4iO0qfp6GqpYTeiai
X-Authority-Analysis: v=2.4 cv=e5ILiKp/ c=1 sm=1 tr=0 ts=694121a1 cx=c_pps
 a=3wiUqt7F461DME2/dPg5UA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=d8HPVgtQaXFDFom2_1MA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227929

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Since x86 .eh_frame section may reference _GLOBAL_OFFSET_TABLE_, keep
_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the output
.eh_frame section is non-empty.

Backport a patch from upstream to fix CVE-2025-11494
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b6ac5a8a5b82f0ae6a4642c8d7149b325f4cc60a]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0028-CVE-2025-11494.patch        | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0028-CVE-2025-11494.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 60b0d03ccd..69c5eddefb 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -66,5 +66,6 @@ SRC_URI = "\
      file://CVE-2025-11414.patch \
      file://CVE-2025-11412.patch \
      file://CVE-2025-11413.patch \
+     file://0028-CVE-2025-11494.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0028-CVE-2025-11494.patch b/meta/recipes-devtools/binutils/binutils/0028-CVE-2025-11494.patch
new file mode 100644
index 0000000000..dc4b413658
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0028-CVE-2025-11494.patch
@@ -0,0 +1,43 @@
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Tue, 30 Sep 2025 08:13:56 +0800
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b6ac5a8a5b82f0ae6a4642c8d7149b325f4cc60a]
+CVE: CVE-2025-11494
+
+Since x86 .eh_frame section may reference _GLOBAL_OFFSET_TABLE_, keep
+_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the output
+.eh_frame section is non-empty.
+
+	PR ld/33499
+	* elfxx-x86.c (_bfd_x86_elf_late_size_sections): Keep
+	_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the
+	output .eh_frame section is non-empty.
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index c054f7cd..ddc15945 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -2447,6 +2447,8 @@ _bfd_x86_elf_late_size_sections (bfd *output_bfd,
+ 
+   if (htab->elf.sgotplt)
+     {
++      asection *eh_frame;
++
+       /* Don't allocate .got.plt section if there are no GOT nor PLT
+ 	 entries and there is no reference to _GLOBAL_OFFSET_TABLE_.  */
+       if ((htab->elf.hgot == NULL
+@@ -2459,7 +2461,11 @@ _bfd_x86_elf_late_size_sections (bfd *output_bfd,
+ 	  && (htab->elf.iplt == NULL
+ 	      || htab->elf.iplt->size == 0)
+ 	  && (htab->elf.igotplt == NULL
+-	      || htab->elf.igotplt->size == 0))
++             || htab->elf.igotplt->size == 0)
++         && (!htab->elf.dynamic_sections_created
++             || (eh_frame = bfd_get_section_by_name (output_bfd,
++                                                     ".eh_frame")) == NULL
++             || eh_frame->rawsize == 0))
+ 	{
+ 	  htab->elf.sgotplt->size = 0;
+ 	  /* Solaris requires to keep _GLOBAL_OFFSET_TABLE_ even if it
-- 
2.49.0


